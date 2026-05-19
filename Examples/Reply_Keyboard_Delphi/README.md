# Reply Keyboard — FastTelega Demo

A bot that demonstrates how to build reply keyboards (persistent button bars)
with different layouts using the FastTelega library.

## What it demonstrates

- Building a single-column `TftReplyKeyboardMarkup` with `OneColumnKeyboard`
- Building a multi-column keyboard with a custom `Keyboard` layout helper
- Attaching reply keyboards to messages
- Handling `OnAnyMessage` to echo user input

## Commands

| Command    | Description                                              |
|------------|----------------------------------------------------------|
| `/start`   | Shows a one-column keyboard: Option 1, Option 2, Option 3 |
| `/layout`  | Shows a multi-row keyboard with mixed column widths      |

Tapping any keyboard button sends its label as a text message, which the bot
echoes back.

## Keyboard layouts

**`/start` — single column**
```
[ Option 1 ]
[ Option 2 ]
[ Option 3 ]
```

**`/layout` — multi-column**
```
[ Dog   ] [ Cat   ] [ Mouse ]
[ Green ] [ White ] [ Red   ]
[ On    ] [ Off   ]
[ Back  ]
[ Info  ] [ About ] [ Map   ] [ Etc ]
```

## Setup

1. Open `Reply_Keyboard_Delphi.dpr` and replace `'BOT_TOKEN'` with your bot token:
   ```pascal
   Bot := TftBot.Create('123456:ABC-your-token', 'https://api.telegram.org');
   ```
2. Compile as a console application.
3. Run the executable and send `/start` to your bot in Telegram.

> Get a bot token by talking to [@BotFather](https://t.me/BotFather) on Telegram.
