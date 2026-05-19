# Demo A — Telegram MCP HTTP Tester

Developer tool that connects to `TelegramMCPHttpServer` and calls all 10
Telegram tools in sequence, printing each result. Use it to verify the server
is working before integrating with Claude or any other MCP client.

## Prerequisites

- `TelegramMCPHttpServer.exe` running on port 8585
- MakerAi Delphi Suite installed (see `../TelegramMCP/README.md`)

## Setup

Edit the `const` section in `TelegramMCPHttpTester.dpr`:

```pascal
MCP_SERVER_URL     = 'http://localhost:8585/mcp';
TEST_CHAT_ID       = 123456789;       // your Telegram chat ID
TEST_PHOTO_PATH    = 'C:\test\photo.jpg';      // optional
TEST_DOCUMENT_PATH = 'C:\test\document.pdf';   // optional
```

Tools that require a local file (`telegram_send_photo`, `telegram_send_document`)
are automatically **skipped** if the file path does not exist.

## Run

1. Start `TelegramMCPHttpServer.exe`
2. Compile and run `TelegramMCPHttpTester.exe`

```
╔══════════════════════════════════════════════╗
║  Demo A: Telegram MCP HTTP Tester            ║
╚══════════════════════════════════════════════╝

Connecting to MCP server... OK
Discovered tools: 10

  Tool: telegram_get_me
  ✓  Bot ID: 8521367356 | Name: MyBot | Username: @my_bot

  Tool: telegram_send_message
  Args: {"chatId":123456789,"text":"Test from Demo A","parseMode":"HTML"}
  ✓  Message sent successfully. Message ID: 1042

  ...

Results:
  ✓ Passed:  8
  ✗ Failed:  0
  ⚠ Skipped: 2
```

## Exit codes

| Code | Meaning |
|------|---------|
| 0 | All tested tools passed |
| 1 | Cannot connect to MCP server, or at least one tool failed |
