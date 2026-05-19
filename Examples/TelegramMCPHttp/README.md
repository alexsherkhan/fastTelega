# TelegramMCPHttpServer — FastTelega + MakerAi MCP Demo (HTTP)

HTTP variant of the Telegram MCP server. Instead of reading from stdin/stdout,
it listens on a TCP port and accepts standard HTTP requests — useful for
remote access, web dashboards, or any HTTP-capable MCP client.

## Comparison: StdIO vs HTTP

| Feature | TelegramMCP (StdIO) | TelegramMCPHttp (HTTP) |
|---------|---------------------|------------------------|
| Transport | stdin / stdout | HTTP on a TCP port |
| Remote access | No (local only) | Yes |
| Claude Desktop | Native integration | Via `url` config |
| Authentication | None | Optional API key |
| CORS | N/A | Configurable |
| Interactive stop | Ctrl+C | Press Enter |

## Available tools

Same 10 tools as the StdIO demo — see [`../TelegramMCP/README.md`](../TelegramMCP/README.md).

The tool implementation is shared: both demos use the same `uTool.Telegram.pas`.

## HTTP Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| `GET` | `http://localhost:8585/mcp` | Returns server info and tool list |
| `POST` | `http://localhost:8585/mcp` | Accepts a JSON-RPC 2.0 request |
| `OPTIONS` | `http://localhost:8585/mcp` | CORS preflight |

## Requirements

- **Delphi 11 Alexandria or later**
- **FastTelega** — already included in this repository (`../../Source/`), no extra installation needed
- **MakerAi Delphi Suite** — must be installed separately (see below)
- **Indy** — bundled with Delphi, no extra installation needed
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
│       ├── TelegramMCP\     ← StdIO demo (contains uTool.Telegram.pas)
│       └── TelegramMCPHttp\ ← this demo
└── AiMaker\             ← MakerAi Suite must be here (sibling of FastTelega)
    └── Source\
        ├── MCPServer\
        └── Tools\
```

The `.dpr` uses relative paths (`..\..\..AiMaker\Source\...`) so `AiMaker`
**must** be a sibling of `FastTelega`, inside the same parent directory.

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
   FMXCompo\AiMaker\Source\MCPServer\UMakerAi.MCPServer.Http.pas  ✓
   FMXCompo\AiMaker\Source\Tools\uMakerAi.Tools.Functions.pas      ✓
   ```

4. No Delphi package installation is required — the `.dpr` references the
   source files directly via relative paths.

## Setup

### 1. Configure the bot token

Edit the `const` section in `TelegramMCPHttpServer.dpr`:

```pascal
BOT_TOKEN = '@TELEGRAM_TOKEN';  // reads env var (recommended)
// or
BOT_TOKEN = '123456:ABC-your-token'; // direct value
```

### 2. Configure port and API key (optional)

```pascal
SERVER_PORT = 8585;   // TCP port to listen on

API_KEY = '';          // leave empty for open access
// or
API_KEY = 'my-secret'; // require this key on every POST
```

When `API_KEY` is set, clients must send one of:
```
Authorization: Bearer my-secret
X-Api-Key: my-secret
```

### 3. Compile and run

Compile as a **Console Application** in Delphi, then run:

```bat
set TELEGRAM_TOKEN=123456:ABC-your-token
TelegramMCPHttpServer.exe
```

Press **Enter** to stop the server gracefully.

### 4. Test with curl

```bash
# Get server info
curl http://localhost:8585/mcp

# List available tools
curl -X POST http://localhost:8585/mcp \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}'

# Send a Telegram message
curl -X POST http://localhost:8585/mcp \
  -H "Content-Type: application/json" \
  -d '{
    "jsonrpc": "2.0",
    "id": 2,
    "method": "tools/call",
    "params": {
      "name": "telegram_send_message",
      "arguments": {
        "chatId": 123456789,
        "text": "Hello from the HTTP MCP server!",
        "parseMode": "HTML"
      }
    }
  }'
```

With API key:
```bash
curl -X POST http://localhost:8585/mcp \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer my-secret" \
  -d '...'
```

### 5. Claude Desktop integration

```json
{
  "mcpServers": {
    "telegram-http": {
      "url": "http://localhost:8585/mcp"
    }
  }
}
```

> Note: Claude Desktop's HTTP MCP support may require a specific client version.
> The StdIO demo (`../TelegramMCP/`) is the most universally compatible option.

## Project structure

```
TelegramMCPHttp/
├── TelegramMCPHttpServer.dpr   ← Main program (HTTP transport)
└── README.md                   ← This file

TelegramMCP/                    ← StdIO demo (sibling folder)
└── uTool.Telegram.pas          ← Shared tool implementations
```
