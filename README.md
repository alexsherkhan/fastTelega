# fastTelega

Delphi library for the Telegram Bot API.

This fork extends the original library with a significantly larger API surface,
MCP (Model Context Protocol) server examples, and a full suite of demo projects.

## What's new in this fork

- **Extended API** — `sendPhoto`, `sendDocument`, `sendLocation`, `sendContact`,
  `sendDice`, `sendChatAction`, `forwardMessage`, `getChat`, inline keyboards,
  reply keyboards, callback query handling, and more
- **MCP Server demos** — expose your Telegram bot as an AI tool usable directly
  from Claude Desktop or any MCP-compatible client
- **Six new example projects** — from a simple echo bot to a full Claude AI agent
  that drives Telegram through natural language

> Original repository: [alexsherkhan/fastTelega](https://github.com/alexsherkhan/fastTelega)

## Documentation
- Documentation (*.chm) is located [here](Doc).
- The deepwiki documentation is more detailed and deep-searchable using AI [here](https://deepwiki.com/alexsherkhan/fastTelega).

## Quick start

```pascal
program Echobot_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;

begin
  Bot := TftBot.Create('BOT_TOKEN', 'https://api.telegram.org');
  Bot.Events.OnCommand('start',
    procedure(const FTMessage: TObject)
    begin
      Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, 'Hi!');
    end);
  Bot.Events.OnAnyMessage(
    procedure(const FTMessage: TObject)
    begin
      if Pos('/start', TftMessage(FTMessage).text) > 0 then Exit;
      Bot.API.sendMessage(TftMessage(FTMessage).Chat.id,
        'Your message is: ' + TftMessage(FTMessage).text);
    end);
  Writeln('Bot: ' + Bot.API.getMe.username);
  Bot.API.deleteWebhook();
  LongPoll := TftLongPoll.Create(Bot);
  while True do
    LongPoll.start();
end.
```

## Examples

### Bot demos

| Folder | Description |
|--------|-------------|
| [`Echobot_Delphi`](Examples/Echobot_Delphi) | Minimal echo bot — `/start` and catch-all message handler |
| [`EchobotV2_Delphi`](Examples/EchobotV2_Delphi) | Enhanced echo bot with `/help`, `/me`, `/info`, typing indicator, and environment-variable token |
| [`MediaBot_Delphi`](Examples/MediaBot_Delphi) | Sends photos, videos, audio, voice, animations, documents, location, contact, and dice via an inline keyboard menu |
| [`Inline_Keyboard_Delphi`](Examples/Inline_Keyboard_Delphi) | Inline keyboard with callback query handling |
| [`Reply_Keyboard_Delphi`](Examples/Reply_Keyboard_Delphi) | Persistent reply keyboards — single-column and multi-column layouts |

### MCP Server demos

These projects turn your Telegram bot into an **AI tool** via the
[Model Context Protocol](https://modelcontextprotocol.io).
Both expose the same 10 Telegram tools; they differ only in transport.

| Folder | Transport | Use case |
|--------|-----------|----------|
| [`TelegramMCP`](Examples/TelegramMCP) | StdIO (stdin/stdout) | Claude Desktop local integration |
| [`TelegramMCPHttp`](Examples/TelegramMCPHttp) | HTTP on port 8585 | Remote access, web dashboards, any HTTP MCP client |

**Available MCP tools:**

| Tool | Description |
|------|-------------|
| `telegram_get_me` | Returns bot username, ID, and display name |
| `telegram_send_message` | Sends a text message (HTML / Markdown supported) |
| `telegram_send_photo` | Sends a photo from a local file path |
| `telegram_send_document` | Sends any file as a document |
| `telegram_send_location` | Sends a GPS location pin |
| `telegram_send_contact` | Sends a contact card (phone + name) |
| `telegram_send_dice` | Sends an animated dice emoji (🎲 🎯 🏀 ⚽ 🎳 🎰) |
| `telegram_send_chat_action` | Shows typing / uploading indicator |
| `telegram_forward_message` | Forwards a message between chats |
| `telegram_get_chat` | Returns title and username of a chat |

### Utility demos

| Folder | Description |
|--------|-------------|
| [`DemoA_HttpTester`](Examples/DemoA_HttpTester) | CLI tester — connects to the HTTP MCP server and calls all 10 tools in sequence to verify they work |
| [`DemoC_FileWatcher`](Examples/DemoC_FileWatcher) | Watches a local folder for new files and sends a Telegram notification for each one via the MCP HTTP server |
| [`DemoD_ClaudeAgent`](Examples/DemoD_ClaudeAgent) | Interactive console where you type natural language and Claude decides which Telegram tools to call — the complete agentic loop |

### MCP architecture

```
Claude Desktop ──StdIO──► TelegramMCPServer.exe ──HTTPS──► Telegram Bot API

Your prompt ──► Claude API ──► TAiFunctions ──► HTTP JSON-RPC ──► TelegramMCPHttpServer ──► Telegram
```

The MCP server demos depend on the
[MakerAi Delphi Suite](https://github.com/gustavoeenriquez/MakerAI).
Clone it as a sibling of this repository before compiling:

```bat
cd E:\Delphi\Delphi13\Compo\FMXCompo
git clone https://github.com/gustavoeenriquez/MakerAI.git AiMaker
```

See each demo's own `README.md` for detailed setup instructions.

## Bot token — environment variable pattern

All demos support reading the token from an environment variable:

```pascal
const
  BOT_TOKEN = '@TELEGRAM_TOKEN';  // reads env var TELEGRAM_TOKEN at startup
```

```bat
set TELEGRAM_TOKEN=123456:ABC-your-token
MyBot.exe
```

This keeps secrets out of source code and compiled binaries.
