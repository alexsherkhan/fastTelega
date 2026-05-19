# MediaBot — FastTelega Demo

A bot that demonstrates sending every supported media type using the FastTelega library.

## What it demonstrates

- Sending photos, videos, audio, voice notes, animations, documents, and stickers from local files (`TftInputFile.fromFile`)
- Sending location (`sendLocation`), contact (`sendContact`), and animated dice (`sendDice`)
- `sendChatAction` to show upload progress indicators
- Building an inline keyboard menu (`TftInlineKeyboardMarkup`)
- Handling callback queries (`OnCallbackQuery`, `answerCallbackQuery`)
- Reading the bot token from an environment variable

## Commands

| Command      | Description                        |
|--------------|------------------------------------|
| `/start`     | Shows the inline menu              |
| `/photo`     | Sends a photo from a local file    |
| `/video`     | Sends a video from a local file    |
| `/audio`     | Sends an audio file                |
| `/voice`     | Sends a voice note                 |
| `/animation` | Sends a GIF / animation            |
| `/document`  | Sends a document                   |
| `/location`  | Sends a location pin (Madrid)      |
| `/contact`   | Sends a contact card               |
| `/dice`      | Sends animated dice (🎲 🎯 🎰)     |

All commands are also accessible via the inline keyboard that appears with `/start`.

## Setup

### 1. Configure media file paths

Edit the `MEDIA FILE PATHS` constants near the top of `MediaBot_Delphi.dpr`:

```pascal
PHOTO_PATH     = 'C:\Media\sample_photo.jpg';
VIDEO_PATH     = 'C:\Media\sample_video.mp4';
AUDIO_PATH     = 'C:\Media\sample_audio.mp3';
VOICE_PATH     = 'C:\Media\sample_voice.ogg';   // must be OGG/OPUS
ANIMATION_PATH = 'C:\Media\sample_animation.gif';
DOCUMENT_PATH  = 'C:\Media\sample_document.pdf';
STICKER_PATH   = 'C:\Media\sample_sticker.webp';
```

> `/location`, `/contact`, and `/dice` work without any files.

### 2. Configure the bot token

**Option A — Token in source code**

```pascal
BOT_TOKEN = '123456:ABC-your-token';
```

**Option B — Token from environment variable**

```pascal
BOT_TOKEN = '@MY_BOT_TOKEN';   // reads env var MY_BOT_TOKEN
```

```bat
set MY_BOT_TOKEN=123456:ABC-your-token
MediaBot_Delphi.exe
```

### 3. Compile and run

1. Compile as a console application.
2. Run the executable and send `/start` to your bot in Telegram.

> Get a bot token by talking to [@BotFather](https://t.me/BotFather) on Telegram.
