# Demo C — Telegram File Watcher

Monitors a local folder for new files. When one appears, it calls
`TelegramMCPHttpServer` to send a Telegram notification — no AI required.

## Use cases

- Drop a build artifact → notify the team on Telegram
- Receive a scanned document → get a Telegram alert on your phone
- FTP upload completed → instant Telegram ping
- Shared folder monitoring in a small office workflow

## Prerequisites

- `TelegramMCPHttpServer.exe` running on port 8585
- MakerAi Delphi Suite installed (see `../TelegramMCP/README.md`)

## Setup

Edit the `const` section in `TelegramFileWatcher.dpr`:

```pascal
MCP_SERVER_URL   = 'http://localhost:8585/mcp';
WATCH_FOLDER     = 'C:\WatchFolder';   // folder to monitor
TELEGRAM_CHAT_ID = 123456789;          // chat that receives notifications
POLL_INTERVAL_MS = 3000;               // check every 3 seconds
```

The watch folder is created automatically if it does not exist.

## Run

1. Start `TelegramMCPHttpServer.exe`
2. Compile and run `TelegramFileWatcher.exe`
3. Drop files into `C:\WatchFolder`
4. Receive Telegram notifications instantly

```
Monitoring: C:\WatchFolder
Notifications → Telegram chat 123456789

Drop files into the watch folder to trigger notifications.
Press Enter to stop...

[14:23:01] New file: sales_report.xlsx (245.3 KB)
[14:25:17] New file: photo_001.jpg (1.2 MB)
```

Each notification sent to Telegram looks like:

```
📂 New file detected
📄 sales_report.xlsx
📦 Size: 245.3 KB
🕒 2026-03-08 14:23:01
```

Press **Enter** to stop the watcher gracefully. A stop notification is sent to
Telegram before the program exits.

## Architecture notes

- Uses a background `TThread` with `TDirectory.GetFiles` polling — no
  `TFileSystemWatcher` (which is FMX-only)
- A `TCriticalSection` protects the known-files list from race conditions
- A `TEvent` allows clean thread shutdown on Enter key
- 500 ms delay after detection before reading file size (gives time for the
  file write to complete)
- `TMCPClientHttp` is kept alive for the full session; `Initialize` is called
  once at startup
