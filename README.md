<p align="center">
  <img src="Assets/Resources/TftTelegramBot/TftTelegramBot128.png" alt="fastTelega logo" width="128" height="128">
</p>

<h1 align="center">fastTelega</h1>

<p align="center">
  A Delphi library for the <a href="https://core.telegram.org/bots/api">Telegram Bot API</a>.
</p>

<p align="center">
  <a href="https://www.embarcadero.com/products/delphi"><img src="https://img.shields.io/badge/Delphi-10.2--13-red.svg" alt="Delphi 10.2 - 13"></a>
  <a href="https://core.telegram.org/bots/api"><img src="https://img.shields.io/badge/Telegram%20Bot%20API-10.3-2CA5E0.svg" alt="Telegram Bot API 10.3"></a>
  <a href="Docs/API.md"><img src="https://img.shields.io/badge/methods-185%2F185-brightgreen.svg" alt="185 of 185 methods"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
</p>

## Overview

fastTelega provides typed Bot API methods, a Telegram object model, an event
dispatcher, long polling and a webhook server. It is written in Object Pascal
and uses the Delphi RTL, REST components and Indy for webhooks.

| Feature | Status |
|---|---|
| Bot API methods | 185 of 185 (Bot API 10.3) |
| Long polling | `TftLongPoll` |
| Webhook server | `TftWebhookServer`, `TftWebhookLocalServer`, `TftWebhookTCPServer` |
| Webhook TLS | Terminated by a reverse proxy (nginx, Caddy, IIS) |
| Event dispatcher | `OnUpdate` plus typed message, inline and callback events |
| Object model | Core Telegram types and Bot API 10.3 additions |
| File uploads | Single-file methods, media groups, profile photos and stories |
| Packages | RTL, VCL and FMX packages for RAD Studio 10.2-13 |
| Installer | Inno Setup project in `Tools/Setup` |
| Components | VCL `TftTelegramBot` and FMX `TftTelegramBotFMX` |
| Free Pascal / Lazarus | Core port, Lazarus package, console example and FPCUnit tests |

## Requirements

- Windows with RAD Studio 10.2 Tokyo through 13 Florence (Delphi 10.2-13).
- RTL and REST components (`RESTComponents`).
- Indy (`IndyCore`, `IndyProtocols`) for the webhook server.
- VCL or FMX only if you use the corresponding component.
- A bot token from [@BotFather](https://t.me/BotFather).

## Installation

Open the package group for your compiler version under `Packages/` (for
example `Packages/RAD Studio 12 Athens/fastTelega.groupproj`), build
`fastTelega.Package.RTL`, and add the package to the IDE library path.

To use the sources directly, add these directories to the project search path:

```
Source
Source/AvailableTypes
Source/Events
Source/Helpers
Source/Net
Source/Net/Server
Source/Parser
Source/Delphi
Source/Components/VCL
```

See [Installation](Docs/Installation.md) for package and search-path details.

## Long polling example

```pascal
program EchoBot;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.Net.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;

begin
  Bot := TftBot.Create('YOUR_BOT_TOKEN', 'https://api.telegram.org');
  try
    // A webhook and long polling cannot be active at the same time.
    Bot.API.DeleteWebhook;

    Bot.Events.OnAnyMessage(
      procedure(const Obj: TObject)
      var
        Message: TftMessage;
      begin
        Message := TftMessage(Obj);
        if Message.Text <> '' then
          Bot.API.SendMessage(Message.Chat.Id, 'Echo: ' + Message.Text).Free;
      end);

    LongPoll := TftLongPoll.Create(Bot);
    while True do
      LongPoll.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
```

## Webhook example

```pascal
var
  Bot: TftBot;
  Webhook: TftWebhookLocalServer;
begin
  Bot := TftBot.Create('YOUR_BOT_TOKEN', 'https://api.telegram.org');
  Webhook := TftWebhookLocalServer.Create(Bot);
  Webhook.Port := 8080;
  Webhook.Path := '/telegram';
  Webhook.SecretToken := 'change-me';
  Webhook.Start;

  Bot.API.SetWebhook('https://bot.example.com/telegram', nil, 40, nil, '',
    False, 'change-me');
end;
```

The built-in server speaks plain HTTP; terminate TLS in a reverse proxy. See
[Webhooks](Docs/Webhooks.md) for an nginx configuration.

## Architecture

```
Application
  |-- TftBot
        |-- TftAPI             Bot API methods
        |-- TftHttpClient      HTTP transport
        |-- TftTypeParser      JSON serialization
        |-- TftEventBroadcaster listeners
        |-- TftEventHandler    update routing
  |-- TftLongPoll              getUpdates loop
  |-- TftWebhookServer         webhook endpoint
```

`TftBot` owns the HTTP client, API client, event broadcaster and event handler.
Returned Telegram objects and lists are owned by the caller; free them when
done. See [Architecture](Docs/Architecture.md) for details and lifetime notes.

## Documentation

Full English documentation is in [Docs](Docs):

| Document | Contents |
|---|---|
| [Installation](Docs/Installation.md) | Requirements, packages and search paths |
| [Getting started](Docs/GettingStarted.md) | Minimal working bot |
| [Architecture](Docs/Architecture.md) | Units, data flow, ownership |
| [Events](Docs/Events.md) | Listeners, commands and routing |
| [API reference](Docs/API.md) | Conventions and all 185 methods |
| [Types](Docs/Types.md) | Telegram object model and lists |
| [File uploads](Docs/FileUploads.md) | `TftInputFile`, multipart, media groups |
| [Webhooks](Docs/Webhooks.md) | Indy server and reverse proxy setup |
| [VCL component](Docs/VCLComponent.md) | `TftTelegramBot` component |
| [FMX component](Docs/FMXComponent.md) | `TftTelegramBotFMX` component |
| [Examples](Docs/Examples.md) | Included projects and snippets |
| [Building](Docs/Building.md) | Packages, MSBuild and installer |
| [Licensing](Docs/Licensing.md) | MIT and third-party licenses |
| [Troubleshooting](Docs/Troubleshooting.md) | Errors and known limitations |

The legacy CHM documentation is in [Doc](Doc). Version history is in
[CHANGELOG.md](CHANGELOG.md).

## Examples

- `Examples/Console/Echobot_Delphi` — console echo bot
- `Examples/Console/Inline_Keyboard_Delphi` — inline keyboard
- `Examples/Console/Reply_Keyboard_Delphi` — reply keyboard
- `Examples/VCL/Echobot_Delphi_VCL` — VCL echo bot
- `Project/fastTelegaDesignerBotMVC` — DesignerBot MVC application
- `Project/MenuBot` — menu editor

Some older examples still use the pre-1.5 unit names; see
[Examples](Docs/Examples.md) for corrected `uses` clauses.

## Status and limitations

All Bot API 10.3 methods are declared and implemented. Some advanced scenarios
are still limited:

- Rich messages have a typed model (`TftInputRichBlock`, `TftRichText`,
  `TftRichMessageButton`, `TftRichBlockCaption`, media blocks); raw
  `BlocksJson`/`MediaJson` remain available as a fallback.
- `SendMessage` and the common send methods expose `business_connection_id`,
  `direct_messages_topic_id`, `message_effect_id`, `allow_paid_broadcast`,
  `reply_parameters` and `suggested_post_parameters`; media methods also
  support `show_caption_above_media`.
- Typed events exist for messages, inline queries, chosen inline results and
  callback queries; other update types are available through `OnUpdate`.
- `SendMediaGroup` supports file uploads through `TftInputMedia.MediaFile`;
  paid media and sticker attach uploads require manual attach names.
- Webhook TLS must be terminated by a reverse proxy.
- The VCL and FMX components are new and have not been compiler-verified in
  this repository.

See [Troubleshooting](Docs/Troubleshooting.md) for a complete list.

## License

fastTelega is distributed under the MIT License (see [LICENSE](LICENSE)).
The installer and setup tooling include third-party components under their own
licenses; see [THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt) and the
[LICENSES](LICENSES) directory.
