/// <summary>
/// TelegramMCPServer — FastTelega + MakerAi MCP Demo
///
/// MCP server that exposes the Telegram Bot API as tools so AI agents
/// (Claude Desktop, etc.) can send messages, files, locations, and more.
///
/// Transport: StdIO (standard input/output) — the universal MCP transport
/// for local integrations.
///
/// Available tools:
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
/// CLAUDE DESKTOP INTEGRATION:
///   Add to %APPDATA%\Claude\claude_desktop_config.json:
///   {
///     "mcpServers": {
///       "telegram": {
///         "command": "C:\\path\\to\\TelegramMCPServer.exe",
///         "env": {
///           "TELEGRAM_TOKEN": "your-bot-token-here"
///         }
///       }
///     }
///   }
/// </summary>
program TelegramMCPServer;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  // MakerAi MCP Server library
  uMakerAi.MCPServer.Core  in '..\..\..\AiMaker\Source\MCPServer\uMakerAi.MCPServer.Core.pas',
  uMakerAi.MCPServer.Stdio in '..\..\..\AiMaker\Source\MCPServer\UMakerAi.MCPServer.Stdio.pas',
  uMakerAi.Tools.Functions in '..\..\..\AiMaker\Source\Tools\uMakerAi.Tools.Functions.pas',
  // FastTelega library
  fastTelega.AvailableTypes  in '..\..\Source\fastTelega.AvailableTypes.pas',
  fastTelega.Bot             in '..\..\Source\fastTelega.Bot.pas',
  fastTelega.API             in '..\..\Source\fastTelega.API.pas',
  fastTelega.HttpClient      in '..\..\Source\fastTelega.HttpClient.pas',
  fastTelega.TypeParser      in '..\..\Source\fastTelega.TypeParser.pas',
  fastTelega.EventBroadcaster in '..\..\Source\fastTelega.EventBroadcaster.pas',
  fastTelega.EventHandler    in '..\..\Source\fastTelega.EventHandler.pas',
  // Telegram tools
  uTool.Telegram in 'uTool.Telegram.pas';

// ---------------------------------------------------------------------------
// Bot token configuration.
//
//   Direct token:        BOT_TOKEN = '123456:ABC-your-token'
//   Environment variable: BOT_TOKEN = '@TELEGRAM_TOKEN'
// ---------------------------------------------------------------------------
const
  BOT_TOKEN = '@TELEGRAM_TOKEN';

var
  MCPServer: TAiMCPStdioServer;
  Token: string;

begin
  try
    // Resolve the bot token
    if (Length(BOT_TOKEN) > 1) and (BOT_TOKEN[1] = '@') then
      Token := GetEnvironmentVariable(Copy(BOT_TOKEN, 2, MaxInt))
    else
      Token := BOT_TOKEN;

    if Token = '' then
    begin
      if (Length(BOT_TOKEN) > 1) and (BOT_TOKEN[1] = '@') then
        WriteLn(ErrOutput,
          'ERROR: Environment variable "' + Copy(BOT_TOKEN, 2, MaxInt) +
          '" is not set or is empty.')
      else
        WriteLn(ErrOutput, 'ERROR: BOT_TOKEN is not configured.');
      WriteLn(ErrOutput, 'Get a bot token from @BotFather on Telegram.');
      ExitCode := 1;
      Exit;
    end;

    WriteLn(ErrOutput, 'Initializing Telegram bot...');
    InitTelegramTools(Token);
    try
      MCPServer := TAiMCPStdioServer.Create(nil);
      try
        MCPServer.ServerName := 'FastTelega-MCP';

        WriteLn(ErrOutput, 'Registering Telegram tools...');
        RegisterTelegramTools(MCPServer);

        MCPServer.Start;

        WriteLn(ErrOutput, 'Telegram MCP Server started (StdIO transport).');
        WriteLn(ErrOutput, 'Waiting for JSON-RPC requests...');

        while True do
          Sleep(1000);

      finally
        MCPServer.Free;
      end;
    finally
      FinalizeTelegramTools;
    end;

  except
    on E: Exception do
      WriteLn(ErrOutput,
        'Fatal error: ' + E.ClassName + ': ' + E.Message);
  end;
end.
