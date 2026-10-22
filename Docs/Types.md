# Types

## Object model

Telegram objects are declared in `fastTelega.AvailableTypes.pas` and in the
per-object units under `Source/AvailableTypes/`. The aggregate unit re-declares
the core objects and is the unit most applications use:

```pascal
uses
  fastTelega.AvailableTypes;
```

Types follow the Bot API names with a `Tft` prefix:

| Telegram | Delphi |
|---|---|
| `User` | `TftUser` |
| `Chat` | `TftChat` |
| `Message` | `TftMessage` |
| `Update` | `TftUpdate` |
| `CallbackQuery` | `TftCallbackQuery` |
| `InlineQuery` | `TftInlineQuery` |
| `ChatMember` | `TftChatMember` |

Properties use PascalCase and are writable. Objects do not implement
`IDisposable`; free them explicitly.

## Important types

| Type | Purpose |
|---|---|
| `TftBot` | Bot facade (token, API, events, handler) |
| `TftAPI` | Bot API client |
| `TftUpdate` | One update; contains `Message`, `InlineQuery`, `CallbackQuery`, etc. |
| `TftUpdateList` | `TObjectList<TftUpdate>` returned by `GetUpdates`; owns its items |
| `TftMessage` | Message, including content, chat, sender and reply information |
| `TftUser` | User or bot |
| `TftChat` | Private chat, group, supergroup or channel |
| `TftMessageEntity` | Formatting entity |
| `TftInputFile` | File to upload (`FilePath`, `MimeType`, `FileName`, `Data`) |
| `TftInputMedia` | Base class for media groups (`TftInputMediaPhoto`, `TftInputMediaVideo`, ...) |
| `TftReplyBase` | Base class for reply markup (`TftInlineKeyboardMarkup`, `TftReplyKeyboardMarkup`, ...) |
| `TftChatMember` | Base class for chat member variants |

## Bot API 10.3 additions

The following model groups were added for the current Bot API:

- Paid media: `TftInputPaidMedia`, `TftInputPaidMediaPhoto`,
  `TftInputPaidMediaVideo`, `TftInputPaidMediaLivePhoto`
- Checklists: `TftInputChecklist`, `TftInputChecklistTask`
- Rich messages: `TftInputRichMessage`, `TftInputRichBlock`, `TftRichText`,
  `TftRichMessageButton`, `TftRichBlockCaption`, `TftRichBlockTableCell`,
  `TftInputRichBlockListItem`, `TftInputRichMessageMedia`, `TftRichInputMedia`
- Ephemeral messages: `TftLinkPreviewOptions` (text edits), existing
  `TftInputMedia` for media edits
- Profile photos and stories: `TftInputProfilePhoto`,
  `TftInputStoryContent`, `TftStory`
- Stickers: `TftInputSticker`, `TftReactionType`
- Gifts: `TftGift`, `TftGifts`, `TftUniqueGift*`, `TftOwnedGift`,
  `TftOwnedGifts`, `TftAcceptedGiftTypes`
- Boosts: `TftChatBoost`, `TftChatBoostSource`, `TftUserChatBoosts`
- Stars: `TftStarAmount`, `TftStarTransaction`, `TftStarTransactions`,
  `TftTransactionPartner`
- Updates: `TftBusinessMessagesDeleted`, `TftMessageReactionUpdated`,
  `TftMessageReactionCountUpdated`, `TftChatBoostUpdated`,
  `TftChatBoostRemoved`, `TftPaidMediaPurchased`, `TftManagedBotUpdated`,
  `TftBotSubscriptionUpdated`, `TftMessageGenerationStopped`
- Message content: `TftDirectMessagesTopic`, `TftLivePhoto`,
  `TftPaidMediaInfo`, `TftPaidMedia*`, `TftChecklist`, `TftChecklistTask`,
  `TftRichMessage`, `TftGiftInfo`, `TftUniqueGiftInfo`, `TftRefundedPayment`,
  `TftChatBoostAdded`, `TftSuggestedPostInfo`, `TftSuggestedPostPrice`,
  `TftSuggestedPostParameters`, `TftSuggestedPost*` service messages
- Bots and business: `TftBotName`, `TftBotDescription`,
  `TftBotShortDescription`, `TftBotAccessSettings`, `TftBusinessConnection`,
  `TftPreparedInlineMessage`, `TftPreparedKeyboardButton`,
  `TftSentGuestMessage`

## Lists

Two list styles are used:

- `TArray<T>` — dynamic array, used by newer methods and message fields.
- `TList<T>` / `TObjectList<T>` — used by methods such as
  `GetChatAdministrators` and `GetUserGifts`.

A `TList<T>` returned by an API method does not own its elements. If the
elements are objects, free them before freeing the list:

```pascal
var
  Members: TList<TftChatMember>;
begin
  Members := Bot.API.GetChatAdministrators(ChatId);
  try
    for var Member in Members do
      WriteLn(Member.User.FirstName);
  finally
    for var Member in Members do
      Member.Free;
    Members.Free;
  end;
end;
```

`TftUpdateList` is a `TObjectList<TftUpdate>` and owns its updates. The
long-poll loop frees it after dispatch; do not free updates received by
listeners.

## Optional fields

Optional Telegram fields are represented by their Delphi default value:
`nil` for objects, an empty string for text, `0` for numbers and `False` for
booleans. Always check object properties before reading them.

## JSON mapping

Responses are deserialized with `Rest.JSON`. The mapper matches property names
case-insensitively, but it does not convert Telegram's `snake_case` keys to
PascalCase automatically. Some fields may therefore stay at their default
values unless the class property is named accordingly or annotated with
`JSONName`. If a field is unexpectedly empty, check the class declaration and
the raw JSON.

The same applies to nested objects: a property must be a class with a
parameterless constructor for `TJSON.JsonToObject<T>` to create it.

## Identifier sizes

Telegram chat and user identifiers can exceed 32 bits. Prefer `Int64` when
storing identifiers. Some legacy type declarations still use `Integer`; those
fields may overflow for very large ids.
