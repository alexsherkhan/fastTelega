# Echobot — FastTelega Demo

The simplest possible bot: it echoes every text message back to the user.

## What it demonstrates

- Creating a `TftBot` instance
- Registering a command handler with `OnCommand`
- Registering a catch-all handler with `OnAnyMessage`
- Starting long polling with `TftLongPoll`

## Commands

| Command  | Response       |
|----------|----------------|
| `/start` | Replies `Hi!`  |
| Any text | Echoes the message back |

## Setup

1. Open `Echobot_Delphi.dpr` and replace `'BOT_TOKEN'` with your bot token:
   ```pascal
   Bot := TftBot.Create('123456:ABC-your-token', 'https://api.telegram.org');
   ```
2. Compile as a console application.
3. Run the executable and send `/start` to your bot in Telegram.

> Get a bot token by talking to [@BotFather](https://t.me/BotFather) on Telegram.
