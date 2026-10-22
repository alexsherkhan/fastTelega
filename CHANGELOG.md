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

### Webhooks

- Implemented `TftWebhookServer`, `TftWebhookLocalServer` and
  `TftWebhookTCPServer` on top of Indy (`TIdHTTPServer`).
- Added path and secret-token validation, body size limits, health responses
  and JSON error responses.
- Added Indy dependencies to the RTL package.
- TLS is terminated by a reverse proxy; the built-in server speaks plain HTTP.

### Updates and dispatch

- Extended `TftUpdate` with business connection/message, deleted business
  messages, guest messages, reaction updates, chat boosts, purchased paid
  media, managed bot, subscription and stopped generation fields.
- Added `TftBusinessMessagesDeleted`, `TftMessageReactionUpdated`,
  `TftMessageReactionCountUpdated`, `TftReactionCount`, `TftChatBoostUpdated`,
  `TftChatBoostRemoved`, `TftPaidMediaPurchased`, `TftManagedBotUpdated`,
  `TftBotSubscriptionUpdated` and `TftMessageGenerationStopped`.
- Added a generic `OnUpdate` listener and routed edited, channel, business and
  guest messages through the existing message handler.

### Models and parser

- Added Bot API 10.3 object models: paid media, checklists, rich messages,
  profile photos, stories, gifts, boosts, Star transactions, managed-bot
  settings, guest messages and reactions.
- Added multipart uploads for profile photos and stories.
- Added multipart media groups via `TftInputMedia.MediaFile` / `AttachName`.
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
