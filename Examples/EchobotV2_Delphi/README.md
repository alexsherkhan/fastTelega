# EchobotV2 — FastTelega Demo

An enhanced echo bot that demonstrates the core features of the FastTelega library.

## What it demonstrates

- Command handlers: `OnCommand`, `OnUnknownCommand`, `OnNonCommandMessage`
- Sending messages with HTML parse mode
- `sendChatAction` to show typing indicator
- Detecting and responding to different incoming message types
- Reading the bot token from an environment variable

## Commands

| Command  | Description                                      |
|----------|--------------------------------------------------|
| `/start` | Welcome message with list of available commands  |
| `/help`  | Detailed help and list of recognized message types |
| `/me`    | Displays your Telegram ID, name, and username    |
| `/info`  | Displays the current chat ID and title           |

## Recognized message types

When a non-command message is received, the bot identifies and acknowledges:
Text, Photo, Video, Audio, Voice note, Sticker, Animation, Document, Location, Contact, Dice

## Setup

### Option A — Token in source code

Set `BOT_TOKEN` to your token in the `const` section:

```pascal
BOT_TOKEN = '123456:ABC-your-token';
```

### Option B — Token from environment variable

Set `BOT_TOKEN` to `'@VAR_NAME'` and the bot will read the token from the
environment variable `VAR_NAME` at startup:

```pascal
BOT_TOKEN = '@MY_BOT_TOKEN';   // reads env var MY_BOT_TOKEN
```

Then set the variable before running:

```bat
set MY_BOT_TOKEN=123456:ABC-your-token
EchobotV2_Delphi.exe
```

### Steps

1. Configure `BOT_TOKEN` using one of the options above.
2. Compile as a console application.
3. Run the executable and send `/start` to your bot in Telegram.

> Get a bot token by talking to [@BotFather](https://t.me/BotFather) on Telegram.
