/// <summary>
/// Demo A — Telegram MCP HTTP Tester
///
/// Developer sanity-check tool. Connects to the TelegramMCPHttpServer and
/// calls every available tool with test parameters, printing the JSON-RPC
/// response. Use this to verify the server is running correctly before
/// integrating with Claude or other MCP clients.
///
/// PREREQUISITES:
///   1. TelegramMCPHttpServer must be running on port 8585.
///   2. Set TEST_CHAT_ID to a real Telegram chat ID that your bot can access.
///   3. Optionally set TEST_PHOTO_PATH / TEST_DOCUMENT_PATH to real local files
///      to test the file-upload tools.
///
/// TOKEN CONFIGURATION:
///   BOT_TOKEN is not needed here — the tester talks to the MCP server,
///   not directly to Telegram. Just start TelegramMCPHttpServer first.
/// </summary>
program TelegramMCPHttpTester;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,
  uMakerAi.MCPClient.Core in '..\..\..\AiMaker\Source\MCPClient\uMakerAi.MCPClient.Core.pas',
  uMakerAi.Core           in '..\..\..\AiMaker\Source\Core\uMakerAi.Core.pas',
  uMakerAi.Utils.System   in '..\..\..\AiMaker\Source\Core\uMakerAi.Utils.System.pas',
  uJSONHelper              in '..\..\..\AiMaker\Source\Core\uJSONHelper.pas';

// ---------------------------------------------------------------------------
// Configuration — edit these before running
// ---------------------------------------------------------------------------
const
  MCP_SERVER_URL     = 'http://localhost:8585/mcp';
  TEST_CHAT_ID       = 123456789;       // Your Telegram chat ID
  TEST_PHOTO_PATH    = 'C:\test\photo.jpg';
  TEST_DOCUMENT_PATH = 'C:\test\document.pdf';
  TEST_FROM_CHAT_ID  = 123456789;       // Source chat for forward test
  TEST_MESSAGE_ID    = 1;               // Message ID to forward

// ---------------------------------------------------------------------------

var
  GClient: TMCPClientHttp;
  GPassCount: Integer;
  GFailCount: Integer;
  GSkipCount: Integer;

// ---------------------------------------------------------------------------
// Pretty-print a JSON result
// ---------------------------------------------------------------------------
function ExtractTextFromResult(AResult: TJSONObject): string;
var
  Content: TJSONArray;
  Item: TJSONValue;
begin
  Result := '';
  if AResult = nil then Exit('(nil result)');

  // MCP result has content array with text items
  Content := AResult.GetValue<TJSONArray>('content');
  if Content = nil then
  begin
    Result := AResult.ToJSON;
    Exit;
  end;
  for Item in Content do
  begin
    if Result <> '' then Result := Result + ' | ';
    Result := Result + (Item as TJSONObject).GetValue<string>('text');
  end;
end;

// ---------------------------------------------------------------------------
// Run a single tool test
// ---------------------------------------------------------------------------
procedure TestTool(const AToolName: string; AArgs: TJSONObject;
  const ASkipReason: string = '');
var
  MediaList: TObjectList<TAiMediaFile>;
  Res: TJSONObject;
  Text: string;
begin
  WriteLn('');
  WriteLn('  Tool: ' + AToolName);

  if ASkipReason <> '' then
  begin
    WriteLn('  ⚠  SKIPPED: ' + ASkipReason);
    Inc(GSkipCount);
    Exit;
  end;

  if AArgs <> nil then
    WriteLn('  Args: ' + AArgs.ToJSON);

  MediaList := TObjectList<TAiMediaFile>.Create(True);
  try
    // NOTE: CallTool takes ownership of AArgs — do NOT free it after this call
    Res := GClient.CallTool(AToolName, AArgs, MediaList);
    try
      Text := ExtractTextFromResult(Res);
      WriteLn('  ✓  ' + Text);
      Inc(GPassCount);
    finally
      Res.Free;
    end;
  except
    on E: Exception do
    begin
      WriteLn('  ✗  ERROR: ' + E.Message);
      Inc(GFailCount);
    end;
  end;
  MediaList.Free;
end;

// ---------------------------------------------------------------------------
// Build TJSONObject args helpers
// ---------------------------------------------------------------------------
function Args(const Pairs: array of const): TJSONObject;
var
  I: Integer;
  Obj: TJSONObject;
begin
  Obj := TJSONObject.Create;
  I := 0;
  while I < Length(Pairs) - 1 do
  begin
    case Pairs[I + 1].VType of
      vtInteger:
        Obj.AddPair(string(Pairs[I].VAnsiString),
          TJSONNumber.Create(Pairs[I + 1].VInteger));
      vtExtended:
        Obj.AddPair(string(Pairs[I].VAnsiString),
          TJSONNumber.Create(Pairs[I + 1].VExtended^));
      vtAnsiString:
        Obj.AddPair(string(Pairs[I].VAnsiString),
          string(Pairs[I + 1].VAnsiString));
      vtUnicodeString:
        Obj.AddPair(string(Pairs[I].VAnsiString),
          string(Pairs[I + 1].VUnicodeString));
    end;
    Inc(I, 2);
  end;
  Result := Obj;
end;

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------
begin
  WriteLn('╔══════════════════════════════════════════════╗');
  WriteLn('║  Demo A: Telegram MCP HTTP Tester            ║');
  WriteLn('╚══════════════════════════════════════════════╝');
  WriteLn('');
  WriteLn('Target:  ' + MCP_SERVER_URL);
  WriteLn('Chat ID: ' + IntToStr(TEST_CHAT_ID));
  WriteLn('');
  WriteLn('Make sure TelegramMCPHttpServer.exe is running before this test.');
  WriteLn('');

  GPassCount := 0;
  GFailCount := 0;
  GSkipCount := 0;

  GClient := TMCPClientHttp.Create(nil);
  try
    GClient.URL := MCP_SERVER_URL;

    Write('Connecting to MCP server... ');
    if not GClient.Initialize then
    begin
      WriteLn('FAILED');
      WriteLn('');
      WriteLn('ERROR: Cannot connect to ' + MCP_SERVER_URL);
      WriteLn('Make sure TelegramMCPHttpServer.exe is running.');
      ExitCode := 1;
      Exit;
    end;
    WriteLn('OK');

    WriteLn('');
    WriteLn('Discovered tools:');
    WriteLn(GClient.Tools.Text);

    WriteLn('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    WriteLn('Running tool tests...');

    // 1. telegram_get_me — no parameters
    TestTool('telegram_get_me', TJSONObject.Create);

    // 2. telegram_send_message — basic text
    TestTool('telegram_send_message',
      Args(['chatId', TEST_CHAT_ID,
            'text',   'Test from Demo A — MCP HTTP Tester ✓',
            'parseMode', 'HTML']));

    // 3. telegram_send_photo — requires a local file
    if FileExists(TEST_PHOTO_PATH) then
      TestTool('telegram_send_photo',
        Args(['chatId', TEST_CHAT_ID, 'photoPath', TEST_PHOTO_PATH]))
    else
      TestTool('telegram_send_photo', nil,
        'Set TEST_PHOTO_PATH to a real JPG/PNG file to test this tool.');

    // 4. telegram_send_document — requires a local file
    if FileExists(TEST_DOCUMENT_PATH) then
      TestTool('telegram_send_document',
        Args(['chatId', TEST_CHAT_ID, 'documentPath', TEST_DOCUMENT_PATH]))
    else
      TestTool('telegram_send_document', nil,
        'Set TEST_DOCUMENT_PATH to a real file to test this tool.');

    // 5. telegram_send_location — Plaza Mayor, Madrid
    TestTool('telegram_send_location',
      Args(['chatId', TEST_CHAT_ID,
            'latitude',  40.4153,
            'longitude', -3.7074]));

    // 6. telegram_send_contact
    TestTool('telegram_send_contact',
      Args(['chatId',      TEST_CHAT_ID,
            'phoneNumber', '+1 555 000 0000',
            'firstName',   'MCP',
            'lastName',    'Tester']));

    // 7. telegram_send_dice
    TestTool('telegram_send_dice',
      Args(['chatId', TEST_CHAT_ID, 'emoji', '🎲']));

    // 8. telegram_send_chat_action
    TestTool('telegram_send_chat_action',
      Args(['chatId', TEST_CHAT_ID, 'action', 'typing']));

    // 9. telegram_forward_message — needs a valid fromChatId + messageId
    TestTool('telegram_forward_message',
      Args(['chatId',     TEST_CHAT_ID,
            'fromChatId', TEST_FROM_CHAT_ID,
            'messageId',  TEST_MESSAGE_ID]));

    // 10. telegram_get_chat
    TestTool('telegram_get_chat',
      Args(['chatId', TEST_CHAT_ID]));

    // Summary
    WriteLn('');
    WriteLn('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    WriteLn('Results:');
    WriteLn(Format('  ✓ Passed:  %d', [GPassCount]));
    WriteLn(Format('  ✗ Failed:  %d', [GFailCount]));
    WriteLn(Format('  ⚠ Skipped: %d', [GSkipCount]));
    WriteLn('');

    if GFailCount > 0 then
    begin
      WriteLn('Some tools failed. Check TEST_CHAT_ID and that the bot has');
      WriteLn('access to the target chat.');
      ExitCode := 1;
    end
    else
      WriteLn('All tested tools passed.');

  finally
    GClient.Free;
  end;
end.
