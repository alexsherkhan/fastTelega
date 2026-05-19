/// <summary>
/// TelegramMCPHttpServer — FastTelega + MakerAi MCP Demo (HTTP transport)
///
/// MCP server that exposes the Telegram Bot API as tools via HTTP/JSON-RPC.
/// Unlike the StdIO version, this server listens on a TCP port and can be
/// reached from any HTTP client — locally or over a network.
///
/// HTTP Endpoints:
///   GET  http://localhost:8585/mcp  → Server info (name, version, tools)
///   POST http://localhost:8585/mcp  → JSON-RPC 2.0 request
///
/// Available tools (same as TelegramMCP StdIO demo):
///   telegram_get_me           — Get bot username and ID
///   telegram_send_message     — Send a text message (HTML / Markdown)
///   telegram_send_photo       — Send a photo from a local file
///   telegram_send_document    — Send any file as a document
///   telegram_send_location    — Send a GPS location pin
///   telegram_send_contact     — Send a contact card
///   telegram_send_dice        — Send an animated dice emoji
///   telegram_send_chat_action — Show typing / uploading indicator
///   telegram_forward_message  — Forward a message between chats
///   telegram_get_chat         — Get chat title and username
///
/// TOKEN CONFIGURATION:
///   Option A (direct):        BOT_TOKEN = '123456:ABC-your-token'
///   Option B (env variable):  BOT_TOKEN = '@TELEGRAM_TOKEN'
///             → reads the TELEGRAM_TOKEN environment variable at runtime
///
/// OPTIONAL API KEY PROTECTION:
///   Set API_KEY = 'my-secret-key' to require:
///     Authorization: Bearer my-secret-key
///   OR  X-Api-Key: my-secret-key
///   on every POST request. Leave API_KEY = '' to disable authentication.
/// </summary>
program TelegramMCPHttpServer;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  // MakerAi MCP Server library
  uMakerAi.MCPServer.Core  in '..\..\..\AiMaker\Source\MCPServer\uMakerAi.MCPServer.Core.pas',
  UMakerAi.MCPServer.Http  in '..\..\..\AiMaker\Source\MCPServer\UMakerAi.MCPServer.Http.pas',
  uMakerAi.Tools.Functions in '..\..\..\AiMaker\Source\Tools\uMakerAi.Tools.Functions.pas',
  // FastTelega library
  fastTelega.AvailableTypes   in '..\..\Source\fastTelega.AvailableTypes.pas',
  fastTelega.Bot              in '..\..\Source\fastTelega.Bot.pas',
  fastTelega.API              in '..\..\Source\fastTelega.API.pas',
  fastTelega.HttpClient       in '..\..\Source\fastTelega.HttpClient.pas',
  fastTelega.TypeParser       in '..\..\Source\fastTelega.TypeParser.pas',
  fastTelega.EventBroadcaster in '..\..\Source\fastTelega.EventBroadcaster.pas',
  fastTelega.EventHandler     in '..\..\Source\fastTelega.EventHandler.pas',
  // Telegram tools — shared with the StdIO demo
  uTool.Telegram in '..\TelegramMCP\uTool.Telegram.pas';

// ---------------------------------------------------------------------------
// Configuration
// ---------------------------------------------------------------------------
const
  // Bot token: direct value or '@ENV_VAR_NAME' to read from environment
  BOT_TOKEN = '@TELEGRAM_TOKEN';

  // TCP port for the HTTP server
  SERVER_PORT = 8585;

  // Optional API key for bearer-token authentication.
  // Set to '' to allow unauthenticated access (local/trusted networks only).
  API_KEY = '';

var
  MCPServer: TAiMCPHttpServer;
  Token: string;

begin
  WriteLn('╔══════════════════════════════════════════╗');
  WriteLn('║  TelegramMCPHttpServer - FastTelega Demo ║');
  WriteLn('╚══════════════════════════════════════════╝');
  WriteLn('');

  try
    // Resolve the bot token
    if (Length(BOT_TOKEN) > 1) and (BOT_TOKEN[1] = '@') then
      Token := GetEnvironmentVariable(Copy(BOT_TOKEN, 2, MaxInt))
    else
      Token := BOT_TOKEN;

    if Token = '' then
    begin
      if (Length(BOT_TOKEN) > 1) and (BOT_TOKEN[1] = '@') then
        WriteLn('ERROR: Environment variable "' +
          Copy(BOT_TOKEN, 2, MaxInt) + '" is not set or is empty.')
      else
        WriteLn('ERROR: BOT_TOKEN is not configured.');
      WriteLn('Get a bot token from @BotFather on Telegram.');
      ExitCode := 1;
      Exit;
    end;

    WriteLn('Initializing Telegram bot...');
    InitTelegramTools(Token);
    try
      MCPServer := TAiMCPHttpServer.Create(nil);
      try
        // HTTP server settings
        MCPServer.ServerName        := 'FastTelega-MCP-Http';
        MCPServer.Port              := SERVER_PORT;
        MCPServer.CorsEnabled       := True;
        MCPServer.CorsAllowedOrigins := '*';

        // Optional API key authentication
        if API_KEY <> '' then
          MCPServer.ApiKey := API_KEY;

        // Register all Telegram tools
        WriteLn('Registering Telegram tools...');
        RegisterTelegramTools(MCPServer);

        MCPServer.Start;

        WriteLn('');
        WriteLn('Server started successfully.');
        WriteLn('');
        WriteLn('Endpoints:');
        WriteLn('  GET  http://localhost:' + IntToStr(SERVER_PORT) + '/mcp');
        WriteLn('       → Server info (name, version, available tools)');
        WriteLn('');
        WriteLn('  POST http://localhost:' + IntToStr(SERVER_PORT) + '/mcp');
        WriteLn('       → JSON-RPC 2.0 request');
        WriteLn('');
        if API_KEY <> '' then
        begin
          WriteLn('Authentication: required');
          WriteLn('  Header: Authorization: Bearer ' + API_KEY);
          WriteLn('  Header: X-Api-Key: ' + API_KEY);
        end
        else
          WriteLn('Authentication: disabled (open access)');
        WriteLn('');
        WriteLn('Press Enter to stop the server...');
        WriteLn('');
        ReadLn;

      finally
        MCPServer.Stop;
        MCPServer.Free;
      end;
    finally
      FinalizeTelegramTools;
    end;

  except
    on E: Exception do
      WriteLn('Fatal error: ' + E.ClassName + ': ' + E.Message);
  end;
end.
