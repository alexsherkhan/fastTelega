# TelegramMCPServer — FastTelega + MakerAi MCP Demo

An MCP (Model Context Protocol) server that exposes the Telegram Bot API as tools,
letting AI agents like **Claude** send messages, photos, files, locations, and more
through a Telegram bot — without writing a single line of glue code.

## How it works

```
Claude Desktop ──StdIO──► TelegramMCPServer.exe ──HTTPS──► Telegram Bot API
```

The server uses **StdIO transport** (stdin/stdout JSON-RPC), which is the standard
for local MCP integrations. All diagnostic output goes to stderr so it never
interferes with the MCP protocol stream.

## Available tools

| Tool | Description |
|------|-------------|
| `telegram_get_me` | Returns bot username, ID, and display name |
| `telegram_send_message` | Sends a text message (HTML / Markdown supported) |
| `telegram_send_photo` | Sends a photo from a local file path |
| `telegram_send_document` | Sends any file as a document |
| `telegram_send_location` | Sends a GPS location pin |
| `telegram_send_contact` | Sends a contact card (phone + name) |
| `telegram_send_dice` | Sends an animated dice emoji (🎲 🎯 🏀 ⚽ 🎳 🎰) |
| `telegram_send_chat_action` | Shows typing/uploading indicator (~5 seconds) |
| `telegram_forward_message` | Forwards a message between chats |
| `telegram_get_chat` | Returns title and username of a chat |

## Requirements

- **Delphi 11 Alexandria or later** (uses anonymous procedures, generics, and custom attributes)
- **FastTelega** — already included in this repository (`../../Source/`), no extra installation needed
- **MakerAi Delphi Suite** — must be installed separately (see below)
- **Indy** — HTTP/network library, bundled with Delphi, no extra installation needed
- A Telegram bot token from [@BotFather](https://t.me/BotFather)

## Installing MakerAi Delphi Suite

This demo depends on the MCP Server components from the
[MakerAi Delphi Suite](https://github.com/gustavoeenriquez/MakerAI).
You must clone or download it **before** you can compile.

**Required folder layout:**

```
FMXCompo\
├── FastTelega\          ← this repository
│   └── Examples\
│       └── TelegramMCP\
└── AiMaker\             ← MakerAi Suite must be here (sibling of FastTelega)
    └── Source\
        ├── MCPServer\
        └── Tools\
```

The `.dpr` file uses relative paths (`..\..\..AiMaker\Source\...`) so the
`AiMaker` folder **must** be a sibling of the `FastTelega` folder, inside the
same parent directory.

**Steps:**

1. Open a terminal in the parent folder that contains `FastTelega\`:
   ```bat
   cd E:\Delphi\Delphi13\Compo\FMXCompo
   ```

2. Clone the MakerAi repository:
   ```bat
   git clone https://github.com/gustavoeenriquez/MakerAI.git AiMaker
   ```

3. Verify the structure:
   ```
   FMXCompo\AiMaker\Source\MCPServer\uMakerAi.MCPServer.Core.pas  ✓
   FMXCompo\AiMaker\Source\Tools\uMakerAi.Tools.Functions.pas      ✓
   ```

4. No Delphi package installation is required — the `.dpr` references the
   source files directly via relative paths.

## Setup

### 1. Configure the bot token

**Option A — Token in source code** (edit `TelegramMCPServer.dpr`):

```pascal
const
  BOT_TOKEN = '123456:ABC-your-token';
```

**Option B — Environment variable** (default, recommended):

```pascal
const
  BOT_TOKEN = '@TELEGRAM_TOKEN';  // reads env var TELEGRAM_TOKEN
```

Set the variable before running:

```bat
set TELEGRAM_TOKEN=123456:ABC-your-token
TelegramMCPServer.exe
```

### 2. Compile

Open `TelegramMCPServer.dpr` in the Delphi IDE and compile as a **Console Application** (Win32 or Win64).

> The `.dpr` uses relative path references for all library units, so no
> search path configuration is needed — just compile and go.

### 3. Integrate with Claude Desktop

Edit `%APPDATA%\Claude\claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "telegram": {
      "command": "C:\\path\\to\\TelegramMCPServer.exe",
      "env": {
        "TELEGRAM_TOKEN": "your-bot-token-here"
      }
    }
  }
}
```

Restart Claude Desktop. The Telegram tools will appear in the tool selector.

### 4. Get your chat ID

To send messages, you need your Telegram **chat ID**. The easiest way:

1. Send any message to your bot.
2. Open `https://api.telegram.org/bot<YOUR_TOKEN>/getUpdates` in a browser.
3. Look for `"chat":{"id":...}` in the response.

For **groups**, add the bot as a member and send a message mentioning it.
Group IDs are negative numbers (e.g. `-1001234567890`).

## Usage example (via Claude)

Once integrated, you can ask Claude:

> "Send a message to chat ID 123456789 saying: Hello from Claude!"

> "Send the file C:\Reports\summary.pdf to my Telegram chat."

> "Forward message 42 from chat -100987654321 to 123456789."

## Project structure

```
TelegramMCP/
├── TelegramMCPServer.dpr   ← Main console application
├── uTool.Telegram.pas      ← All 10 Telegram MCP tools
└── README.md               ← This file
```

## Architecture notes

- `uTool.Telegram.pas` declares parameter classes (DTOs) with `[AiMCPSchemaDescription]`
  and `[AiMCPOptional]` attributes — the MakerAi framework uses RTTI to auto-generate
  the JSON Schema that the AI uses to understand each tool's parameters.
- Tools inherit from `TAiMCPToolBase<TParams>` and implement `ExecuteWithParams`.
- A single `TftBot` instance is shared across all tool calls via the `GBot` global variable.
- All errors are caught per-tool and returned as readable text — the server never crashes
  due to a failed Telegram API call.
