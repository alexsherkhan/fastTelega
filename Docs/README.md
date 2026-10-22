# fastTelega documentation

fastTelega is a Delphi library for the [Telegram Bot API](https://core.telegram.org/bots/api).
It provides typed request methods, typed Telegram objects, an event dispatcher and a
long-polling loop. The library is written in Object Pascal and has no third-party
runtime dependencies beyond the Delphi RTL/REST components.

**Version:** 1.5 (unreleased Bot API 10.3 additions)
**Telegram Bot API coverage:** 185 of 185 methods
**Compiler:** RAD Studio 11 Alexandria (Windows)
**License:** MIT (see [Licensing](Licensing.md))

## Documentation map

| Document | Contents |
|---|---|
| [Installation](Installation.md) | Requirements, packages and search paths |
| [Getting started](GettingStarted.md) | Minimal working bot |
| [Architecture](Architecture.md) | Units, data flow, ownership |
| [Events](Events.md) | Event listeners and command routing |
| [API reference](API.md) | `TftAPI` conventions and the full method index |
| [Types](Types.md) | Telegram object model and lists |
| [File uploads](FileUploads.md) | `TftInputFile`, multipart requests and attach references |
| [Webhooks](Webhooks.md) | Current webhook support status |
| [VCL component](VCLComponent.md) | `TftTelegramBot` component |
| [Examples](Examples.md) | Included examples and corrected snippets |
| [Building](Building.md) | Packages, build script and installer |
| [Troubleshooting](Troubleshooting.md) | Common errors and known limitations |
| [Changelog](../CHANGELOG.md) | Version history |

## Feature status

| Area | Status |
|---|---|
| Long polling | Supported (`TftLongPoll`) |
| Webhook servers | Experimental scaffolds, not functional yet |
| Bot API methods | 185/185 methods declared |
| Telegram object types | Core types plus Bot API 10.3 additions |
| File uploads | Supported for single-file methods, profile photos and stories |
| VCL component | Experimental; see [VCL component](VCLComponent.md) |
| FMX components | Package script references FMX packages that are not present |

## Repository layout

```
Source/
  fastTelega.API.pas          Telegram Bot API methods
  fastTelega.Bot.pas          Facade that owns API, HTTP client and events
  AvailableTypes/             Telegram object model
  Events/                     Listener registry and update dispatcher
  Helpers/                    Class helpers
  Net/                        HTTP client and long polling
  Net/Server/                 Webhook/HTTP server scaffolding
  Parser/                     JSON serializer/deserializer
  Components/VCL/             VCL component
Examples/                     Console and VCL examples
Packages/                     Delphi packages and build scripts
Project/                      DesignerBot sample application
Tools/Setup/                  Inno Setup installer
Doc/                          Legacy CHM documentation
Docs/                         This documentation
```

## Quick start

```pascal
uses
  System.SysUtils,
  fastTelega.Bot,
  fastTelega.Net.LongPoll,
  fastTelega.AvailableTypes;

var
  Bot := TftBot.Create('YOUR_BOT_TOKEN', 'https://api.telegram.org');
  LongPoll := TftLongPoll.Create(Bot);
begin
  Bot.API.DeleteWebhook;
  Bot.Events.OnAnyMessage(
    procedure(const Obj: TObject)
    begin
      Bot.API.SendMessage(TftMessage(Obj).Chat.Id, 'Echo: ' + TftMessage(Obj).Text);
    end);
  while True do
    LongPoll.Start;
end;
```

See [Getting started](GettingStarted.md) for a complete example and important
lifetime notes.
