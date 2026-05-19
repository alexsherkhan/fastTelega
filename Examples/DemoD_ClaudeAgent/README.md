# Demo D — Telegram Claude Agent

Interactive console where you type natural language and Claude decides which
Telegram tools to call — the complete agentic loop.

```
You > "Send a location pin of the Eiffel Tower to my chat"

  [tool: telegram_send_location] → Location sent (48.858400, 2.294500). Message ID: 1099

Claude > Done! I sent the location of the Eiffel Tower (48.8584°N, 2.2945°E)
         to your chat as a Telegram location pin. 📍
```

## How it works

```
Your prompt
  └─► Claude (Anthropic API)
        └─► TAiFunctions (tool schema + dispatcher)
              └─► TMCPClientHttp (JSON-RPC)
                    └─► TelegramMCPHttpServer (port 8585)
                          └─► Telegram Bot API
```

The `TAiFunctions` component bridges two worlds:
1. It generates JSON Schema for all 10 Telegram tools and sends them to Claude.
2. When Claude decides to call a tool, it dispatches the call to the running
   `TelegramMCPHttpServer` via HTTP JSON-RPC.

## Prerequisites

- `TelegramMCPHttpServer.exe` running on port 8585
- An Anthropic API key ([console.anthropic.com](https://console.anthropic.com))
- MakerAi Delphi Suite installed (see `../TelegramMCP/README.md`)

## Setup

### Bot token
`TelegramMCPHttpServer.exe` handles the Telegram connection — start it with
your bot token before running this demo.

### Anthropic API key

**Option A — environment variable** (recommended):
```bat
set ANTHROPIC_API_KEY=sk-ant-your-key
TelegramClaudeAgent.exe
```

**Option B — in source** (edit `TelegramClaudeAgent.dpr`):
```pascal
ANTHROPIC_API_KEY = 'sk-ant-your-key';
```

### MCP server URL and model
```pascal
CLAUDE_MODEL   = 'claude-opus-4-5';          // or claude-sonnet-4-5
MCP_SERVER_URL = 'http://localhost:8585/mcp';
```

## Run

1. Start `TelegramMCPHttpServer.exe`
2. Set `ANTHROPIC_API_KEY` environment variable
3. Compile and run `TelegramClaudeAgent.exe`

```
╔══════════════════════════════════════════════╗
║  Demo D: Telegram Claude Agent               ║
╚══════════════════════════════════════════════╝

Connecting to Telegram MCP server... OK (10 tools)
Model: claude-opus-4-5

Type a message and Claude will use Telegram tools to respond.
Type "new" to start a fresh conversation.
Type "quit" or press Enter on an empty line to exit.

You > What is my bot's username?
  [tool: telegram_get_me] → Bot ID: 8521367356 | Name: MyBot | Username: @my_bot

Claude > Your bot's username is **@my_bot** (ID: 8521367356).

You > Send "Hello world!" to chat 123456789
  [tool: telegram_send_message] → Message sent successfully. Message ID: 1043

Claude > Done! I sent "Hello world!" to chat 123456789. ✓

You > new
(Conversation cleared)

You > quit
```

## Special commands

| Input | Action |
|-------|--------|
| `new` | Clears the conversation history (fresh context) |
| `quit` or empty line | Exits the agent |

## Example prompts

| What to type | What Claude does |
|--------------|-----------------|
| "What's my bot username?" | Calls `telegram_get_me` |
| "Send 'Stand-up in 5 min' to chat 123456789" | Calls `telegram_send_message` |
| "Roll a dice in my team chat" | Calls `telegram_send_dice` |
| "Send my current location (40.4153, -3.7074) to chat X" | Calls `telegram_send_location` |
| "Send file C:\report.pdf to chat X" | Calls `telegram_send_document` |
| "Forward message 42 from chat A to chat B" | Calls `telegram_forward_message` |
| "Show typing in chat X then say 'Processing…'" | Calls `send_chat_action` then `send_message` |

## Architecture notes

- `TAiFunctions.AddMCPClient(HttpClient)` takes ownership of the HTTP client
- Tool names are exposed to Claude as `telegram_99_telegram_send_message`
  (the `_99_` separator encodes the server name; this is internal to MakerAi)
- `Chat.Asynchronous := False` keeps the loop simple — no `CheckSynchronize` needed
- `Chat.NewChat` resets the conversation but keeps the tool configuration
- All tool calls and responses are logged inline with `[tool: ...] → result`
