# Changelog

## Unreleased

### Bot API

- Implemented all 185 methods of Bot API 10.3, including paid media,
  checklists, rich messages, ephemeral messages, gifts, stories, boosts,
  Star transactions, managed bots, profile photos and guest queries.
- Implemented previously stubbed `SendVideo`, `SendVideoNote`, `SendVoice`,
  `SendSticker`, `SendVenue` and `SendInvoice`.
- Fixed wrong method names in `SendPhoto` (`sendDocument`), `SendLocation`
  (`sendGame`) and `GetMyDefaultAdministratorRights` (`for_channels`).
- Fixed the `SendVoice` declaration that was missing a parameter type.

### Models and parser

- Added Bot API 10.3 object models: paid media, checklists, rich messages,
  profile photos, stories, gifts, boosts, Star transactions, managed-bot
  settings, guest messages and reactions.
- Added multipart uploads for profile photos and stories.
- Fixed JSON array serialization: strings starting with `[` are emitted as raw
  JSON.
- Added `ParseMessageEntities` and replaced invalid `TList` casts for
  `TftMessageEntityList`.
- Added serializer/deserializer methods for the new models.

### Documentation

- Added English Markdown documentation under `Docs/`.
- Documented installation, architecture, events, API index, types, uploads,
  webhooks, VCL status, examples, building, licensing and known limitations.

## 1.5

- Split the monolithic source units into `AvailableTypes`, `Events`, `Net`,
  `Parser`, `Helpers` and `Components`.
- Added RAD Studio packages, VCL component, installer, assets and example
  projects.
- Added webhook/HTTP server scaffolding (not functional yet).
- Added `FtVersion = '1.5'`.

## 1.0 alpha

- Initial public alpha.
- Long polling, event broadcaster, event handler and the first Bot API
  methods.
