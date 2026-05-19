/// <summary>
/// Demo D — Telegram Claude Agent
///
/// Interactive console where you type natural language and Claude decides
/// which Telegram tools to use and executes them — the full agentic loop.
///
/// Architecture:
///   User prompt
///     └─► TAiClaudeChat (Claude API)
///           └─► TAiFunctions (tool schema + dispatcher)
///                 └─► TMCPClientHttp (JSON-RPC to TelegramMCPHttpServer)
///                       └─► Telegram Bot API
///
/// PREREQUISITES:
///   1. TelegramMCPHttpServer must be running on port 8585.
///   2. Set ANTHROPIC_API_KEY environment variable (or edit the const below).
///
/// EXAMPLE PROMPTS:
///   "What is my bot's username?"
///   "Send 'Hello from Claude!' to chat 123456789"
///   "Send the location of the Eiffel Tower to my chat"
///   "Roll a dice and send it to chat 123456789"
///
/// TOKEN CONFIGURATION:
///   ANTHROPIC_API_KEY = '@ANTHROPIC_API_KEY'  → reads env var (recommended)
///   ANTHROPIC_API_KEY = 'sk-ant-...'          → direct value
/// </summary>
program TelegramClaudeAgent;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  System.Generics.Collections,
  // MakerAi core
  uMakerAi.Core            in '..\..\..\AiMaker\Source\Core\uMakerAi.Core.pas',
  uMakerAi.Utils.System    in '..\..\..\AiMaker\Source\Core\uMakerAi.Utils.System.pas',
  uJSONHelper               in '..\..\..\AiMaker\Source\Core\uJSONHelper.pas',
  uMakerAi.Chat.Messages   in '..\..\..\AiMaker\Source\Core\uMakerAi.Chat.Messages.pas',
  uMakerAi.Chat.Tools      in '..\..\..\AiMaker\Source\Core\uMakerAi.Chat.Tools.pas',
  uMakerAi.Chat            in '..\..\..\AiMaker\Source\Core\uMakerAi.Chat.pas',
  uMakerAi.Utils.CodeExtractor in '..\..\..\AiMaker\Source\Core\uMakerAi.Utils.CodeExtractor.pas',
  UMakerAi.ParamsRegistry  in '..\..\..\AiMaker\Source\Design\UMakerAi.ParamsRegistry.pas',
  uMakerAi.Chat.Initializations in '..\..\..\AiMaker\Source\Core\uMakerAi.Chat.Initializations.pas',
  // Tools
  uMakerAi.Tools.Functions in '..\..\..\AiMaker\Source\Tools\uMakerAi.Tools.Functions.pas',
  // MCP Client
  uMakerAi.MCPClient.Core  in '..\..\..\AiMaker\Source\MCPClient\uMakerAi.MCPClient.Core.pas',
  // Claude chat driver
  uMakerAi.Chat.Claude     in '..\..\..\AiMaker\Source\Chat\uMakerAi.Chat.Claude.pas';

// ---------------------------------------------------------------------------
// Configuration
// ---------------------------------------------------------------------------
const
  ANTHROPIC_API_KEY = '@ANTHROPIC_API_KEY';   // reads env var (recommended)
  CLAUDE_MODEL      = 'claude-opus-4-5';
  MCP_SERVER_URL    = 'http://localhost:8585/mcp';

// ---------------------------------------------------------------------------
// Tool call handler — routes Claude's tool decisions to the MCP server
// ---------------------------------------------------------------------------
type
  TAgentHandler = class
  public
    AiFunctions: TAiFunctions;
    procedure HandleToolCall(Sender: TObject; AiToolCall: TAiToolsFunction);
  end;

procedure TAgentHandler.HandleToolCall(Sender: TObject;
  AiToolCall: TAiToolsFunction);
begin
  Write('  [tool: ' + AiToolCall.Name + '] ');
  AiFunctions.DoCallFunction(AiToolCall);
  WriteLn('→ ' + AiToolCall.Response);
end;

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------
var
  ApiKey: string;
  Handler: TAgentHandler;
  AiFunctions: TAiFunctions;
  HttpClient: TMCPClientHttp;
  Chat: TAiClaudeChat;
  UserInput: string;
  Response: string;
begin
  WriteLn('╔══════════════════════════════════════════════╗');
  WriteLn('║  Demo D: Telegram Claude Agent               ║');
  WriteLn('╚══════════════════════════════════════════════╝');
  WriteLn('');

  // Resolve Anthropic API key
  if (Length(ANTHROPIC_API_KEY) > 1) and (ANTHROPIC_API_KEY[1] = '@') then
    ApiKey := GetEnvironmentVariable(Copy(ANTHROPIC_API_KEY, 2, MaxInt))
  else
    ApiKey := ANTHROPIC_API_KEY;

  if ApiKey = '' then
  begin
    if (Length(ANTHROPIC_API_KEY) > 1) and (ANTHROPIC_API_KEY[1] = '@') then
      WriteLn('ERROR: Environment variable "' +
        Copy(ANTHROPIC_API_KEY, 2, MaxInt) + '" is not set.')
    else
      WriteLn('ERROR: ANTHROPIC_API_KEY is not configured.');
    WriteLn('Get your key at https://console.anthropic.com');
    ExitCode := 1;
    Exit;
  end;

  // Connect to Telegram MCP server
  Write('Connecting to Telegram MCP server (' + MCP_SERVER_URL + ')... ');
  HttpClient := TMCPClientHttp.Create(nil);
  HttpClient.Name := 'telegram';
  HttpClient.URL  := MCP_SERVER_URL;

  if not HttpClient.Initialize then
  begin
    WriteLn('FAILED');
    WriteLn('Make sure TelegramMCPHttpServer.exe is running.');
    HttpClient.Free;
    ExitCode := 1;
    Exit;
  end;
  WriteLn('OK (' + IntToStr(HttpClient.Tools.Count) + ' tools)');

  // Wire: AiFunctions owns the HTTP client after AddMCPClient
  Handler     := TAgentHandler.Create;
  AiFunctions := TAiFunctions.Create(nil);
  try
    AiFunctions.AddMCPClient(HttpClient); // AiFunctions takes ownership

    Handler.AiFunctions := AiFunctions;

    // Create Claude chat
    Chat := TAiClaudeChat.Create(nil);
    try
      Chat.ApiKey           := ApiKey;
      Chat.Model            := CLAUDE_MODEL;
      Chat.Tool_Active      := True;
      Chat.AiFunctions      := AiFunctions;
      Chat.Asynchronous     := False;
      Chat.OnCallToolFunction := Handler.HandleToolCall;

      Chat.SystemPrompt.Add(
        'You are a Telegram bot assistant. You have access to Telegram tools ' +
        'that let you send messages, photos, files, locations, contacts, and ' +
        'animated dice, as well as get information about the bot and chats. ' +
        'When the user asks you to perform a Telegram action, use the ' +
        'appropriate tool. Confirm the action after completing it. ' +
        'If the user does not provide a chat ID, ask for it politely.');

      WriteLn('Model: ' + CLAUDE_MODEL);
      WriteLn('');
      WriteLn('Type a message and Claude will use Telegram tools to respond.');
      WriteLn('Type "new" to start a fresh conversation.');
      WriteLn('Type "quit" or press Enter on an empty line to exit.');
      WriteLn('');

      // Interactive loop
      while True do
      begin
        Write('You > ');
        ReadLn(UserInput);
        UserInput := Trim(UserInput);

        if (UserInput = '') or (LowerCase(UserInput) = 'quit') then
          Break;

        if LowerCase(UserInput) = 'new' then
        begin
          Chat.NewChat;
          WriteLn('(Conversation cleared)');
          Continue;
        end;

        try
          WriteLn('');
          Response := Chat.AddMessageAndRun(UserInput, 'user', []);
          WriteLn('');
          WriteLn('Claude > ' + Response);
          WriteLn('');
        except
          on E: Exception do
            WriteLn('ERROR: ' + E.Message);
        end;
      end;

    finally
      Chat.Free;
    end;

  finally
    AiFunctions.Free;  // also frees HttpClient (via AddMCPClient ownership)
    Handler.Free;
  end;

  WriteLn('');
  WriteLn('Goodbye!');
end.
