/// <summary>
/// Demo C — Telegram File Watcher
///
/// Monitors a local folder for new files. When a new file appears, it calls
/// the Telegram MCP HTTP server to send a notification to a configured chat.
/// No AI involved — pure event-driven automation.
///
/// Use case: drop a file into a shared folder and your Telegram instantly
/// notifies you: "New file: sales_report.xlsx (245 KB) appeared in Watch Folder."
///
/// PREREQUISITES:
///   TelegramMCPHttpServer must be running (start it before this demo).
///
/// CONFIGURATION:
///   Edit the const section below with your values.
/// </summary>
program TelegramFileWatcher;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,
  System.IOUtils,
  System.SyncObjs,
  uMakerAi.MCPClient.Core in '..\..\..\AiMaker\Source\MCPClient\uMakerAi.MCPClient.Core.pas',
  uMakerAi.Core           in '..\..\..\AiMaker\Source\Core\uMakerAi.Core.pas',
  uMakerAi.Utils.System   in '..\..\..\AiMaker\Source\Core\uMakerAi.Utils.System.pas',
  uJSONHelper              in '..\..\..\AiMaker\Source\Core\uJSONHelper.pas';

// ---------------------------------------------------------------------------
// Configuration — edit these before running
// ---------------------------------------------------------------------------
const
  MCP_SERVER_URL  = 'http://localhost:8585/mcp';
  WATCH_FOLDER    = 'C:\WatchFolder';      // Folder to monitor
  TELEGRAM_CHAT_ID = 123456789;            // Chat that receives notifications
  POLL_INTERVAL_MS = 3000;                 // Check every 3 seconds

// ---------------------------------------------------------------------------

var
  GClient: TMCPClientHttp;
  GStopEvent: TEvent;
  GKnownFiles: TStringList;
  GLock: TCriticalSection;

// ---------------------------------------------------------------------------
// Send a Telegram notification via the MCP server
// ---------------------------------------------------------------------------
procedure SendNotification(const AText: string);
var
  Args: TJSONObject;
  MediaList: TObjectList<TAiMediaFile>;
  Res: TJSONObject;
begin
  Args := TJSONObject.Create;
  Args.AddPair('chatId', TJSONNumber.Create(TELEGRAM_CHAT_ID));
  Args.AddPair('text', AText);

  MediaList := TObjectList<TAiMediaFile>.Create(True);
  try
    // CallTool takes ownership of Args — do NOT free it
    Res := GClient.CallTool('telegram_send_message', Args, MediaList);
    Res.Free;
  except
    on E: Exception do
      WriteLn(ErrOutput, '[WARN] Failed to send notification: ' + E.Message);
  end;
  MediaList.Free;
end;

// ---------------------------------------------------------------------------
// File Watcher Thread
// ---------------------------------------------------------------------------
type
  TFileWatcherThread = class(TThread)
  protected
    procedure Execute; override;
  private
    procedure CheckForNewFiles;
  end;

procedure TFileWatcherThread.Execute;
begin
  while not Terminated do
  begin
    try
      CheckForNewFiles;
    except
      on E: Exception do
        WriteLn(ErrOutput, '[WARN] Watcher error: ' + E.Message);
    end;
    // Wait POLL_INTERVAL_MS or until stop signal
    GStopEvent.WaitFor(POLL_INTERVAL_MS);
  end;
end;

procedure TFileWatcherThread.CheckForNewFiles;
var
  CurrentFiles: TStringDynArray;
  FileName, FullPath, SizeStr: string;
  FileSize: Int64;
  IsNew: Boolean;
  Notification: string;
begin
  if not TDirectory.Exists(WATCH_FOLDER) then
    Exit;

  CurrentFiles := TDirectory.GetFiles(WATCH_FOLDER, '*.*',
    TSearchOption.soTopDirectoryOnly);

  for FullPath in CurrentFiles do
  begin
    FileName := TPath.GetFileName(FullPath);

    GLock.Acquire;
    IsNew := GKnownFiles.IndexOf(FileName) < 0;
    if IsNew then
      GKnownFiles.Add(FileName);
    GLock.Release;

    if IsNew then
    begin
      // Brief delay so the file is fully written before we read its size
      Sleep(500);

      try
        FileSize := TFile.GetSize(FullPath);
        if FileSize < 1024 then
          SizeStr := IntToStr(FileSize) + ' B'
        else if FileSize < 1024 * 1024 then
          SizeStr := Format('%.1f KB', [FileSize / 1024])
        else
          SizeStr := Format('%.1f MB', [FileSize / (1024 * 1024)]);
      except
        SizeStr := '?';
      end;

      Notification :=
        '📂 <b>New file detected</b>' + #10 +
        '📄 <code>' + FileName + '</code>' + #10 +
        '📦 Size: ' + SizeStr + #10 +
        '🕒 ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);

      WriteLn('[' + FormatDateTime('hh:nn:ss', Now) + '] New file: ' +
        FileName + ' (' + SizeStr + ')');

      SendNotification(Notification);
    end;
  end;
end;

// ---------------------------------------------------------------------------
// Snapshot existing files at startup (so we don't re-report old files)
// ---------------------------------------------------------------------------
procedure SnapshotExistingFiles;
var
  Files: TStringDynArray;
  F: string;
begin
  GKnownFiles.Clear;
  if not TDirectory.Exists(WATCH_FOLDER) then
    Exit;
  Files := TDirectory.GetFiles(WATCH_FOLDER, '*.*',
    TSearchOption.soTopDirectoryOnly);
  for F in Files do
    GKnownFiles.Add(TPath.GetFileName(F));
  WriteLn('Existing files snapshot: ' + IntToStr(GKnownFiles.Count) + ' file(s).');
end;

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------
var
  WatcherThread: TFileWatcherThread;
begin
  WriteLn('╔══════════════════════════════════════════════╗');
  WriteLn('║  Demo C: Telegram File Watcher               ║');
  WriteLn('╚══════════════════════════════════════════════╝');
  WriteLn('');

  // Create watch folder if it doesn't exist
  if not TDirectory.Exists(WATCH_FOLDER) then
  begin
    TDirectory.CreateDirectory(WATCH_FOLDER);
    WriteLn('Created watch folder: ' + WATCH_FOLDER);
  end;

  Write('Connecting to MCP server (' + MCP_SERVER_URL + ')... ');
  GClient := TMCPClientHttp.Create(nil);
  try
    GClient.URL := MCP_SERVER_URL;
    if not GClient.Initialize then
    begin
      WriteLn('FAILED');
      WriteLn('Make sure TelegramMCPHttpServer.exe is running.');
      ExitCode := 1;
      Exit;
    end;
    WriteLn('OK');

    GStopEvent  := TEvent.Create(nil, True, False, '');
    GKnownFiles := TStringList.Create;
    GLock       := TCriticalSection.Create;
    try
      SnapshotExistingFiles;

      // Send startup notification
      SendNotification(
        '👁 <b>File Watcher started</b>' + #10 +
        '📂 Monitoring: <code>' + WATCH_FOLDER + '</code>' + #10 +
        '⏱ Poll interval: ' + IntToStr(POLL_INTERVAL_MS) + ' ms');

      WriteLn('');
      WriteLn('Monitoring: ' + WATCH_FOLDER);
      WriteLn('Notifications → Telegram chat ' + IntToStr(TELEGRAM_CHAT_ID));
      WriteLn('');
      WriteLn('Drop files into the watch folder to trigger notifications.');
      WriteLn('Press Enter to stop...');
      WriteLn('');

      WatcherThread := TFileWatcherThread.Create(False);
      try
        ReadLn;
        WatcherThread.Terminate;
        GStopEvent.SetEvent;
        WatcherThread.WaitFor;
      finally
        WatcherThread.Free;
      end;

      SendNotification('🛑 <b>File Watcher stopped.</b>');
      WriteLn('File watcher stopped.');

    finally
      GLock.Free;
      GKnownFiles.Free;
      GStopEvent.Free;
    end;

  finally
    GClient.Free;
  end;
end.
