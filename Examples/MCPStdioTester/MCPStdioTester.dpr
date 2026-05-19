/// <summary>
/// MCPStdioTester — FastTelega Debug Tool
///
/// Launches TelegramMCPServer.exe as a child process with piped stdin/stdout,
/// sends real MCP JSON-RPC messages, and displays the raw responses with hex
/// dumps so you can diagnose encoding problems, TThread.Queue issues, and
/// general MCP protocol correctness.
///
/// NO external dependencies — only WinAPI + Delphi RTL.
///
/// PREREQUISITES:
///   Build TelegramMCPServer.dpr first (Ctrl+F9 in Delphi).
///   TELEGRAM_TOKEN must be set in your system environment.
///
/// HOW TO READ THE OUTPUT:
///   TIMEOUT  → Server receives the message but never processes it.
///              Classic symptom: TThread.Queue in a console app where the
///              main thread never calls CheckSynchronize.
///   HEX dump → Look for bytes > 7F in a response that should be ASCII.
///              That indicates a Windows-1252 / ANSI encoding leak instead
///              of proper UTF-8 output.
///   STDERR   → Startup messages and error traces from the server.
/// </summary>
program MCPStdioTester;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  Winapi.Windows;

// ---------------------------------------------------------------------------
// Path to the server executable (relative to this .exe location)
// ---------------------------------------------------------------------------
const
  SERVER_EXE       = '..\TelegramMCP\Win32\Debug\TelegramMCPServer.exe';
  READ_TIMEOUT_MS  = 5000;   // ms to wait for each response

// ---------------------------------------------------------------------------
// MCP JSON-RPC test messages
// ---------------------------------------------------------------------------
const
  MSG_INITIALIZE =
    '{"jsonrpc":"2.0","id":1,"method":"initialize",' +
    '"params":{"protocolVersion":"2024-11-05","capabilities":{},' +
    '"clientInfo":{"name":"MCPStdioTester","version":"1.0"}}}';

  MSG_INITIALIZED =
    '{"jsonrpc":"2.0","method":"notifications/initialized","params":{}}';

  MSG_TOOLS_LIST =
    '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}';

  MSG_GET_ME =
    '{"jsonrpc":"2.0","id":3,"method":"tools/call",' +
    '"params":{"name":"telegram_get_me","arguments":{}}}';

// ---------------------------------------------------------------------------
// Process handle record
// ---------------------------------------------------------------------------
type
  TServerProcess = record
    ProcInfo    : TProcessInformation;
    hStdinWrite : THandle;
    hStdoutRead : THandle;
    hStderrRead : THandle;
  end;

// ---------------------------------------------------------------------------
// Launch the server with fully piped stdio
// ---------------------------------------------------------------------------
function LaunchServer(const ExePath: string; out Proc: TServerProcess): Boolean;
var
  SA                                   : TSecurityAttributes;
  SI                                   : TStartupInfo;
  hStdinR, hStdinW                     : THandle;
  hStdoutR, hStdoutW                   : THandle;
  hStderrR, hStderrW                   : THandle;
  CmdLine                              : string;
begin
  Result := False;
  FillChar(Proc, SizeOf(Proc), 0);

  SA.nLength              := SizeOf(SA);
  SA.bInheritHandle       := True;
  SA.lpSecurityDescriptor := nil;

  // stdin pipe
  if not CreatePipe(hStdinR, hStdinW, @SA, 0) then Exit;
  SetHandleInformation(hStdinW, HANDLE_FLAG_INHERIT, 0);

  // stdout pipe
  if not CreatePipe(hStdoutR, hStdoutW, @SA, 0) then Exit;
  SetHandleInformation(hStdoutR, HANDLE_FLAG_INHERIT, 0);

  // stderr pipe
  if not CreatePipe(hStderrR, hStderrW, @SA, 0) then Exit;
  SetHandleInformation(hStderrR, HANDLE_FLAG_INHERIT, 0);

  FillChar(SI, SizeOf(SI), 0);
  SI.cb          := SizeOf(SI);
  SI.dwFlags     := STARTF_USESTDHANDLES;
  SI.hStdInput   := hStdinR;
  SI.hStdOutput  := hStdoutW;
  SI.hStdError   := hStderrW;

  CmdLine := '"' + ExePath + '"';

  Result := CreateProcess(
    nil, PChar(CmdLine),
    nil, nil,
    True,                 // inherit handles
    CREATE_NO_WINDOW,     // no console window for the child
    nil, nil,
    SI, Proc.ProcInfo
  );

  // Close child-side pipe ends (we only need our own ends)
  CloseHandle(hStdinR);
  CloseHandle(hStdoutW);
  CloseHandle(hStderrW);

  if Result then
  begin
    Proc.hStdinWrite := hStdinW;
    Proc.hStdoutRead := hStdoutR;
    Proc.hStderrRead := hStderrR;
  end
  else
  begin
    CloseHandle(hStdinW);
    CloseHandle(hStdoutR);
    CloseHandle(hStderrR);
  end;
end;

// ---------------------------------------------------------------------------
// Send a JSON line (UTF-8 encoded, terminated with LF)
// ---------------------------------------------------------------------------
procedure SendLine(hPipe: THandle; const Line: string);
var
  Bytes   : TBytes;
  Written : DWORD;
  LF      : Byte;
begin
  Bytes := TEncoding.UTF8.GetBytes(Line);
  WriteFile(hPipe, Bytes[0], Length(Bytes), Written, nil);
  LF := 10;  // LF  (\n) — MCP spec: one JSON object per line
  WriteFile(hPipe, LF, 1, Written, nil);
end;

// ---------------------------------------------------------------------------
// Read one newline-delimited JSON response with timeout.
// Returns '' on timeout.
// ---------------------------------------------------------------------------
function ReadJsonLine(hPipe: THandle; TimeoutMs: Integer): string;
var
  RawBytes  : TBytes;
  OneByte   : Byte;
  BytesRead : DWORD;
  Available : DWORD;
  Deadline  : Cardinal;
begin
  Result   := '';
  SetLength(RawBytes, 0);
  Deadline := GetTickCount + DWORD(TimeoutMs);

  while GetTickCount < Deadline do
  begin
    Available := 0;
    if not PeekNamedPipe(hPipe, nil, 0, nil, @Available, nil) then
      Break;  // pipe broken

    if Available > 0 then
    begin
      BytesRead := 0;
      if ReadFile(hPipe, OneByte, 1, BytesRead, nil) and (BytesRead = 1) then
      begin
        if OneByte = 10 then  // LF → end of JSON line
        begin
          Result := TEncoding.UTF8.GetString(RawBytes);
          Exit;
        end
        else if OneByte <> 13 then  // skip CR
        begin
          SetLength(RawBytes, Length(RawBytes) + 1);
          RawBytes[High(RawBytes)] := OneByte;
        end;
      end;
    end
    else
      Sleep(20);
  end;
end;

// ---------------------------------------------------------------------------
// Hex dump helper — shows raw bytes so encoding issues are obvious
// ---------------------------------------------------------------------------
procedure HexDump(const S: string; MaxBytes: Integer = 80);
var
  Bytes : TBytes;
  I     : Integer;
  Hex   : string;
begin
  Bytes := TEncoding.UTF8.GetBytes(S);
  Hex   := '';
  for I := 0 to Min(MaxBytes - 1, High(Bytes)) do
    Hex := Hex + IntToHex(Bytes[I], 2) + ' ';
  if Length(Bytes) > MaxBytes then
    Hex := Hex + '...';
  WriteLn(Format('  HEX [%d bytes UTF-8]: %s', [Length(Bytes), Hex]));
end;

// ---------------------------------------------------------------------------
// Drain and print whatever is buffered on stderr
// ---------------------------------------------------------------------------
procedure DrainStderr(hPipe: THandle; const Prefix: string = '  [STDERR] ');
var
  Buffer    : array[0..4095] of AnsiChar;
  BytesRead : DWORD;
  Available : DWORD;
  Line      : string;
begin
  Available := 0;
  PeekNamedPipe(hPipe, nil, 0, nil, @Available, nil);
  if Available = 0 then Exit;

  BytesRead := 0;
  ReadFile(hPipe, Buffer, Min(Available, SizeOf(Buffer) - 1), BytesRead, nil);
  if BytesRead = 0 then Exit;

  Buffer[BytesRead] := #0;
  Line := Trim(string(AnsiString(PAnsiChar(@Buffer))));
  if Line <> '' then
    WriteLn(Prefix + StringReplace(Line, #10, #13#10 + Prefix, [rfReplaceAll]));
end;

procedure Separator(const Title: string);
begin
  WriteLn;
  WriteLn('────────────────────────────────────────────────────');
  WriteLn('  ' + Title);
  WriteLn('────────────────────────────────────────────────────');
end;

// ---------------------------------------------------------------------------
// Main test sequence
// ---------------------------------------------------------------------------
procedure RunTests(const ExePath: string);
var
  Proc     : TServerProcess;
  Response : string;
begin
  WriteLn('Server : ' + ExePath);

  if not FileExists(ExePath) then
  begin
    WriteLn('ERROR  : Executable not found.');
    WriteLn('         Build TelegramMCP project first (Ctrl+F9 in Delphi).');
    Exit;
  end;

  WriteLn('Launching...');
  if not LaunchServer(ExePath, Proc) then
  begin
    WriteLn('ERROR  : CreateProcess failed — ' + SysErrorMessage(GetLastError));
    Exit;
  end;

  WriteLn('PID    : ' + IntToStr(Proc.ProcInfo.dwProcessId));

  // Give the server ~600 ms to initialize Telegram bot
  Sleep(600);
  DrainStderr(Proc.hStderrRead);

  // ── TEST 1 : initialize ────────────────────────────────────────────────
  Separator('TEST 1  initialize');
  WriteLn('  SEND: ' + MSG_INITIALIZE);
  SendLine(Proc.hStdinWrite, MSG_INITIALIZE);

  Response := ReadJsonLine(Proc.hStdoutRead, READ_TIMEOUT_MS);
  Sleep(50);
  DrainStderr(Proc.hStderrRead);

  if Response = '' then
  begin
    WriteLn('  RECV : <TIMEOUT — no response after ' + IntToStr(READ_TIMEOUT_MS) + ' ms>');
    WriteLn;
    WriteLn('  *** DIAGNOSIS ***');
    WriteLn('  The worker thread reads the message and calls TThread.Queue(nil, ...)');
    WriteLn('  but the server main thread runs "while True do Sleep(1000)" and');
    WriteLn('  never calls CheckSynchronize.  The queued callback never fires.');
    WriteLn('  Fix: replace TThread.Queue with a direct call inside the worker,');
    WriteLn('  OR add "CheckSynchronize" to the main thread loop.');
    WriteLn;
    // Terminate here — no point testing further
  end
  else
  begin
    WriteLn('  RECV : ' + Copy(Response, 1, 200));
    HexDump(Response);

    // Send the required notifications/initialized ack
    SendLine(Proc.hStdinWrite, MSG_INITIALIZED);
    Sleep(100);

    // ── TEST 2 : tools/list ─────────────────────────────────────────────
    Separator('TEST 2  tools/list');
    WriteLn('  SEND: ' + MSG_TOOLS_LIST);
    SendLine(Proc.hStdinWrite, MSG_TOOLS_LIST);

    Response := ReadJsonLine(Proc.hStdoutRead, READ_TIMEOUT_MS);
    Sleep(50);
    DrainStderr(Proc.hStderrRead);

    if Response = '' then
      WriteLn('  RECV : <TIMEOUT>')
    else
    begin
      WriteLn('  RECV (first 300 chars): ' + Copy(Response, 1, 300));
      HexDump(Response, 128);
    end;

    // ── TEST 3 : telegram_get_me ─────────────────────────────────────────
    Separator('TEST 3  tools/call  telegram_get_me');
    WriteLn('  SEND: ' + MSG_GET_ME);
    SendLine(Proc.hStdinWrite, MSG_GET_ME);

    Response := ReadJsonLine(Proc.hStdoutRead, READ_TIMEOUT_MS);
    Sleep(50);
    DrainStderr(Proc.hStderrRead);

    if Response = '' then
      WriteLn('  RECV : <TIMEOUT>')
    else
    begin
      WriteLn('  RECV : ' + Response);
      HexDump(Response);
    end;
  end;

  WriteLn;
  WriteLn('Terminating server...');
  TerminateProcess(Proc.ProcInfo.hProcess, 0);
  WaitForSingleObject(Proc.ProcInfo.hProcess, 2000);

  CloseHandle(Proc.ProcInfo.hProcess);
  CloseHandle(Proc.ProcInfo.hThread);
  CloseHandle(Proc.hStdinWrite);
  CloseHandle(Proc.hStdoutRead);
  CloseHandle(Proc.hStderrRead);

  WriteLn('Done.');
end;

// ---------------------------------------------------------------------------
var
  ExePath : string;
begin
  WriteLn('╔══════════════════════════════════════════════════╗');
  WriteLn('║  MCPStdioTester  —  FastTelega Debug Tool        ║');
  WriteLn('╚══════════════════════════════════════════════════╝');
  WriteLn;

  // Accept an optional path argument, fallback to relative default
  if ParamCount > 0 then
    ExePath := ParamStr(1)
  else
    ExePath := ExpandFileName(
      ExtractFilePath(ParamStr(0)) + SERVER_EXE);

  try
    RunTests(ExePath);
  except
    on E: Exception do
      WriteLn('EXCEPTION: ' + E.ClassName + ': ' + E.Message);
  end;

  WriteLn;
  Write('Press Enter to exit...');
  ReadLn;
end.
