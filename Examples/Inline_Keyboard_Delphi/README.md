# Inline Keyboard — FastTelega Demo

A minimal bot that demonstrates how to create and respond to an inline keyboard.

## What it demonstrates

- Building a `TftInlineKeyboardMarkup` with buttons
- Attaching the keyboard to a `sendMessage` call
- Handling button presses with `OnCallbackQuery`

## Commands

| Command   | Description                                       |
|-----------|---------------------------------------------------|
| `/start`  | Greets the user                                   |
| `/check`  | Sends a message with an inline "check" button     |

Pressing the **check** button triggers `OnCallbackQuery`, which sends another
message with the same keyboard.

## Setup

1. Open `Inline_Keyboard_Delphi.dpr` and replace `'BOT_TOKEN'` with your bot token:
   ```pascal
   Bot := TftBot.Create('123456:ABC-your-token', 'https://api.telegram.org');
   ```
2. Compile as a console application.
3. Run the executable and send `/check` to your bot in Telegram.

> Get a bot token by talking to [@BotFather](https://t.me/BotFather) on Telegram.
