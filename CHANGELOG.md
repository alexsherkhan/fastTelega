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

### Message fields and optional parameters

- Extended `TftMessage` with paid media, live photos, checklists, rich
  messages, stories, gifts, unique gifts, refunded payments, boosts, direct
  message settings, checklist task updates, poll option updates, suggested
  post fields and chat owner changes.
- Added `TftDirectMessagesTopic`, `TftLivePhoto`, `TftPaidMediaInfo`,
  `TftPaidMedia*`, `TftChecklist`, `TftChecklistTask`, `TftRichMessage`,
  `TftGiftInfo`, `TftUniqueGiftInfo`, `TftRefundedPayment`,
  `TftChatBoostAdded`, `TftSuggestedPost*`, `TftChatOwnerLeft`,
  `TftChatOwnerChanged`, `TftReplyParameters` and related types.
- Added `business_connection_id`, `direct_messages_topic_id`,
  `message_effect_id`, `allow_paid_broadcast`, `link_preview_options`,
  `reply_parameters` and `suggested_post_parameters` to `SendMessage`.
- Added the same optional send parameters (plus `show_caption_above_media`
  for media) to SendPhoto, SendAudio, SendDocument, SendVideo, SendAnimation,
  SendVoice, SendVideoNote, SendSticker, SendMediaGroup, SendLocation,
  SendVenue, SendContact, SendPoll, SendDice, SendGame, SendInvoice,
  SendPaidMedia, SendLivePhoto, SendChecklist and SendRichMessage.
- Fixed `SendMessage` sending message entities as `caption_entities`.

### Rich messages

- Added a typed rich-message model: `TftRichText`, `TftInputRichBlock`,
  `TftInputRichBlockListItem`, `TftRichMessageButton`, `TftRichBlockCaption`,
  `TftRichBlockTableCell`, `TftRichInputMedia` and
  `TftInputRichMessageMedia`.
- `TftInputRichMessage` now accepts typed `Blocks` and `Media`; the raw
  `BlocksJson`/`MediaJson` fields remain as a fallback.
- Added recursive serializers for rich text, blocks, tables, lists, buttons,
  captions and embedded media.

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

### Ownership

- Fixed double-free shutdown: `TftAPI` no longer frees the borrowed HTTP
  client, `TftBot` frees owned objects in the correct order, and
  `TftLongPoll` no longer frees the borrowed API and event handler.
- `TftLongPoll` now frees the allowed-updates list it creates.

### Free Pascal / Lazarus

- Added FPC compatibility shims (`System.JSON`, `Rest.JSON`, `System.Net.*`).
- Added generated `fastTelega.JsonMapper` for public properties and a Delphi
  `TJSON.JsonToObject` mapper.
- Added FPC conditionals for base units and generic collections.
- Added `Lazarus/fasttelega.lpk`, `Lazarus/EchoBot.lpr` and `build.sh`.
- Verified types, parser, API, bot and long polling compile with FPC 3.2.2.

### FMX support

- Added `TftTelegramBotFMX` (unit `fastTelega.Fmx`) wrapping `TftBot`.
- Added FMX packages for all supported RAD Studio versions.
- Added FMX package to the shared build script and package groups.

### Compiler support

- Added package groups for RAD Studio 10.2 Tokyo, 10.3 Rio, 10.4 Sydney,
  12 Athens and 13 Florence alongside 11 Alexandria.
- Updated the shared build script to build only the RTL and VCL packages.

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
