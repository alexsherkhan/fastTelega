# API reference

## Access

All Telegram Bot API methods are exposed by `TftAPI`:

```pascal
var
  Bot := TftBot.Create(Token, 'https://api.telegram.org');
  Message := Bot.API.SendMessage(ChatId, 'Hello');
```

The method names are PascalCase versions of the Bot API names:
`SendMessage` → `sendMessage`, `GetMe` → `getMe`, `GetUpdates` →
`getUpdates`. Parameters use an `A` prefix (`AChatId`, `AText`).

## Conventions

- **Chat identifiers** are `Variant` in newer methods and accept an `Int64`
  chat id or a `string` username (`'@channel'`).
- **User identifiers** are usually `Int64`; some older methods declare
  `Integer`.
- **Message identifiers** are `Integer`.
- **Optional parameters** have default values in the interface declaration. To
  omit an optional `String`, pass an empty string; to omit an optional object,
  pass `nil`.
- **Boolean-returning methods** return the Telegram `result` field. Because the
  HTTP layer suppresses exceptions and returns an empty response on network
  errors, a `False` result can also mean that the request did not complete.
- **Object-returning methods** allocate a new object. Free it when you are done.
- **List-returning methods** return a `TList<T>` or a `TArray<T>`. A `TList<T>`
  does not own its elements; free the elements as well as the list.
- **File uploads** use `TftInputFile` and multipart requests. See
  [File uploads](FileUploads.md).

## Example

```pascal
var
  Bot: TftBot;
  Sent: TftMessage;
begin
  Bot := TftBot.Create(Token, 'https://api.telegram.org');
  try
    Sent := Bot.API.SendMessage('@my_channel', 'Deployment finished');
    try
      WriteLn('Message id: ', Sent.MessageId);
    finally
      Sent.Free;
    end;
  finally
    Bot.Free;
  end;
end;
```

## Complete method index

The table lists every method declared by `TftAPI` and its Pascal return type.
Refer to the method declarations in `Source/fastTelega.API.pas` for the full
parameter list.

| Bot API method | Return type |
|---|---|
| `addStickerToSet` | `Boolean` |
| `answerCallbackQuery` | `Boolean` |
| `answerChatJoinRequestQuery` | `Boolean` |
| `answerGuestQuery` | `TftSentGuestMessage` |
| `answerInlineQuery` | `Boolean` |
| `answerPreCheckoutQuery` | `Boolean` |
| `answerShippingQuery` | `Boolean` |
| `answerWebAppQuery` | `TftSentWebAppMessage` |
| `approveChatJoinRequest` | `Boolean` |
| `approveSuggestedPost` | `Boolean` |
| `banChatMember` | `Boolean` |
| `banChatSenderChat` | `Boolean` |
| `close` | `Boolean` |
| `closeForumTopic` | `Boolean` |
| `closeGeneralForumTopic` | `Boolean` |
| `convertGiftToStars` | `Boolean` |
| `copyMessage` | `TftMessageId` |
| `copyMessages` | `TList<TftMessageId>` |
| `createChatInviteLink` | `TftChatInviteLink` |
| `createChatSubscriptionInviteLink` | `TftChatInviteLink` |
| `createForumTopic` | `TftForumTopic` |
| `createInvoiceLink` | `String` |
| `createNewStickerSet` | `Boolean` |
| `declineChatJoinRequest` | `Boolean` |
| `declineSuggestedPost` | `Boolean` |
| `deleteAllMessageReactions` | `Boolean` |
| `deleteBusinessMessages` | `Boolean` |
| `deleteChatPhoto` | `Boolean` |
| `deleteChatStickerSet` | `Boolean` |
| `deleteEphemeralMessage` | `Boolean` |
| `deleteForumTopic` | `Boolean` |
| `deleteMessage` | `Boolean` |
| `deleteMessageReaction` | `Boolean` |
| `deleteMessages` | `Boolean` |
| `deleteMyCommands` | `Boolean` |
| `deleteStickerFromSet` | `Boolean` |
| `deleteStickerSet` | `Boolean` |
| `deleteStory` | `Boolean` |
| `deleteWebhook` | `Boolean` |
| `editChatInviteLink` | `TftChatInviteLink` |
| `editChatSubscriptionInviteLink` | `TftChatInviteLink` |
| `editEphemeralMessageCaption` | `Boolean` |
| `editEphemeralMessageMedia` | `Boolean` |
| `editEphemeralMessageReplyMarkup` | `Boolean` |
| `editEphemeralMessageText` | `Boolean` |
| `editForumTopic` | `Boolean` |
| `editGeneralForumTopic` | `Boolean` |
| `editMessageCaption` | `TftMessage` |
| `editMessageChecklist` | `TftMessage` |
| `editMessageLiveLocation` | `TftMessage` |
| `editMessageMedia` | `TftMessage` |
| `editMessageReplyMarkup` | `TftMessage` |
| `editMessageText` | `TftMessage` |
| `editStory` | `TftStory` |
| `editUserStarSubscription` | `Boolean` |
| `exportChatInviteLink` | `String` |
| `forwardMessage` | `TftMessage` |
| `forwardMessages` | `TList<TftMessageId>` |
| `getAvailableGifts` | `TftGifts` |
| `getBusinessAccountGifts` | `TftOwnedGifts` |
| `getBusinessAccountStarBalance` | `TftStarAmount` |
| `getBusinessConnection` | `TftBusinessConnection` |
| `getChat` | `TftChat` |
| `getChatAdministrators` | `TList<TftChatMember>` |
| `getChatGifts` | `TftOwnedGifts` |
| `getChatMember` | `TftChatMember` |
| `getChatMemberCount` | `Integer` |
| `getChatMenuButton` | `TftMenuButton` |
| `getCustomEmojiStickers` | `TList<TftSticker>` |
| `getFile` | `TftFile` |
| `getForumTopicIconStickers` | `TList<TftSticker>` |
| `getGameHighScores` | `TList<TftGameHighScore>` |
| `getManagedBotAccessSettings` | `TftBotAccessSettings` |
| `getManagedBotToken` | `String` |
| `getMe` | `TftUser` |
| `getMyCommands` | `TArray<TftBotCommand>` |
| `getMyDefaultAdministratorRights` | `TftChatAdministratorRights` |
| `getMyDescription` | `TftBotDescription` |
| `getMyName` | `TftBotName` |
| `getMyShortDescription` | `TftBotShortDescription` |
| `getMyStarBalance` | `TftStarAmount` |
| `getStarTransactions` | `TftStarTransactions` |
| `getStickerSet` | `TftStickerSet` |
| `getUpdates` | `TftUpdateList` |
| `getUserChatBoosts` | `TftUserChatBoosts` |
| `getUserGifts` | `TftOwnedGifts` |
| `getUserPersonalChatMessages` | `TList<TftMessage>` |
| `getUserProfileAudios` | `TftUserProfileAudios` |
| `getUserProfilePhotos` | `TftUserProfilePhotos` |
| `getWebhookInfo` | `TftWebhookInfo` |
| `giftPremiumSubscription` | `Boolean` |
| `hideGeneralForumTopic` | `Boolean` |
| `leaveChat` | `Boolean` |
| `logOut` | `Boolean` |
| `pinChatMessage` | `Boolean` |
| `postStory` | `TftStory` |
| `promoteChatMember` | `Boolean` |
| `readBusinessMessage` | `Boolean` |
| `refundStarPayment` | `Boolean` |
| `removeBusinessAccountProfilePhoto` | `Boolean` |
| `removeChatVerification` | `Boolean` |
| `removeMyProfilePhoto` | `Boolean` |
| `removeUserVerification` | `Boolean` |
| `reopenForumTopic` | `Boolean` |
| `reopenGeneralForumTopic` | `Boolean` |
| `replaceManagedBotToken` | `String` |
| `replaceStickerInSet` | `Boolean` |
| `repostStory` | `TftStory` |
| `restrictChatMember` | `Boolean` |
| `revokeChatInviteLink` | `TftChatInviteLink` |
| `savePreparedInlineMessage` | `TftPreparedInlineMessage` |
| `savePreparedKeyboardButton` | `TftPreparedKeyboardButton` |
| `sendAnimation` | `TftMessage` |
| `sendAudio` | `TftMessage` |
| `sendChatAction` | `Boolean` |
| `sendChatJoinRequestWebApp` | `Boolean` |
| `sendChecklist` | `TftMessage` |
| `sendContact` | `TftMessage` |
| `sendDice` | `TftMessage` |
| `sendDocument` | `TftMessage` |
| `sendGame` | `TftMessage` |
| `sendGift` | `Boolean` |
| `sendInvoice` | `TftMessage` |
| `sendLivePhoto` | `TftMessage` |
| `sendLocation` | `TftMessage` |
| `sendMediaGroup` | `TftMessageList` |
| `sendMessage` | `TftMessage` |
| `sendMessageDraft` | `Boolean` |
| `sendPaidMedia` | `TftMessage` |
| `sendPhoto` | `TftMessage` |
| `sendPoll` | `TftMessage` |
| `sendRichMessage` | `TftMessage` |
| `sendRichMessageDraft` | `Boolean` |
| `sendSticker` | `TftMessage` |
| `sendVenue` | `TftMessage` |
| `sendVideo` | `TftMessage` |
| `sendVideoNote` | `TftMessage` |
| `sendVoice` | `TftMessage` |
| `setBusinessAccountBio` | `Boolean` |
| `setBusinessAccountGiftSettings` | `Boolean` |
| `setBusinessAccountName` | `Boolean` |
| `setBusinessAccountProfilePhoto` | `Boolean` |
| `setBusinessAccountUsername` | `Boolean` |
| `setChatAdministratorCustomTitle` | `Boolean` |
| `setChatDescription` | `Boolean` |
| `setChatMemberTag` | `Boolean` |
| `setChatMenuButton` | `Boolean` |
| `setChatPermissions` | `Boolean` |
| `setChatPhoto` | `Boolean` |
| `setChatStickerSet` | `Boolean` |
| `setChatTitle` | `Boolean` |
| `setCustomEmojiStickerSetThumbnail` | `Boolean` |
| `setGameScore` | `TftMessage` |
| `setManagedBotAccessSettings` | `Boolean` |
| `setMessageReaction` | `Boolean` |
| `setMyCommands` | `Boolean` |
| `setMyDefaultAdministratorRights` | `Boolean` |
| `setMyDescription` | `Boolean` |
| `setMyName` | `Boolean` |
| `setMyProfilePhoto` | `Boolean` |
| `setMyShortDescription` | `Boolean` |
| `setPassportDataErrors` | `Boolean` |
| `setStickerEmojiList` | `Boolean` |
| `setStickerKeywords` | `Boolean` |
| `setStickerMaskPosition` | `Boolean` |
| `setStickerPositionInSet` | `Boolean` |
| `setStickerSetThumbnail` | `Boolean` |
| `setStickerSetTitle` | `Boolean` |
| `setUserEmojiStatus` | `Boolean` |
| `setWebhook` | *(procedure)* |
| `stopMessageLiveLocation` | `TftMessage` |
| `stopPoll` | `TftPoll` |
| `transferBusinessAccountStars` | `Boolean` |
| `transferGift` | `Boolean` |
| `unbanChatMember` | `Boolean` |
| `unbanChatSenderChat` | `Boolean` |
| `unhideGeneralForumTopic` | `Boolean` |
| `unpinAllChatMessages` | `Boolean` |
| `unpinAllForumTopicMessages` | `Boolean` |
| `unpinAllGeneralForumTopicMessages` | `Boolean` |
| `unpinChatMessage` | `Boolean` |
| `upgradeGift` | `Boolean` |
| `uploadStickerFile` | `Boolean` |
| `verifyChat` | `Boolean` |
| `verifyUser` | `Boolean` |

## Common tasks

### Send a message

```pascal
var
  Message: TftMessage;
begin
  Message := Bot.API.SendMessage(ChatId, 'Hello', False, ReplyToMessageId,
    nil, 'MarkdownV2');
  try
    // use Message
  finally
    Message.Free;
  end;
end;
```

### Get updates manually

```pascal
var
  Updates: TftUpdateList;
begin
  Updates := Bot.API.GetUpdates(0, 100, 0, nil);
  try
    for var Update in Updates do
      WriteLn(Update.UpdateId);
  finally
    Updates.Free;
  end;
end;
```

### Register a webhook

```pascal
Bot.API.SetWebhook('https://example.com/telegram', nil, 40, nil, '',
  False, SecretToken);
```

The API method exists, but fastTelega does not provide a working webhook
server. See [Webhooks](Webhooks.md).
