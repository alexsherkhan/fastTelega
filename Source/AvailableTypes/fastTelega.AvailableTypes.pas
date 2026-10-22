/// <summary>
/// fastTelega AvailableTypes
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftAnimation,
  fastTelega.AvailableTypes.ftAudio,
  fastTelega.AvailableTypes.ftBotCommand,
  fastTelega.AvailableTypes.ftCallbackGame,
  fastTelega.AvailableTypes.ftChatAdministratorRights,
  fastTelega.AvailableTypes.ftChatLocation,
  fastTelega.AvailableTypes.ftChatPermissions,
  fastTelega.AvailableTypes.ftChatPhoto,
  fastTelega.AvailableTypes.ftContact,
  fastTelega.AvailableTypes.ftDice,
  fastTelega.AvailableTypes.ftDocument,
  fastTelega.AvailableTypes.ftForceReply,
  fastTelega.AvailableTypes.ftForumTopicClosed,
  fastTelega.AvailableTypes.ftForumTopicCreated,
  fastTelega.AvailableTypes.ftForumTopicEdited,
  fastTelega.AvailableTypes.ftForumTopicReopened,
  fastTelega.AvailableTypes.ftGeneralForumTopicHidden,
  fastTelega.AvailableTypes.ftGeneralForumTopicUnhidden,
  fastTelega.AvailableTypes.ftInlineKeyboardButton,
  fastTelega.AvailableTypes.ftInlineKeyboardMarkup,
  fastTelega.AvailableTypes.ftInlineQueryResult,
  fastTelega.AvailableTypes.ftInputMessageContent,
  fastTelega.AvailableTypes.ftInvoice,
  fastTelega.AvailableTypes.ftKeyboardButton,
  fastTelega.AvailableTypes.ftLabeledPrice,
  fastTelega.AvailableTypes.ftLocation,
  fastTelega.AvailableTypes.ftLoginUrl,
  fastTelega.AvailableTypes.ftMessageAutoDeleteTimerChanged,
  fastTelega.AvailableTypes.ftMessageId,
  fastTelega.AvailableTypes.ftOrderInfo,
  fastTelega.AvailableTypes.ftPassportData,
  fastTelega.AvailableTypes.ftPhotoSize,
  fastTelega.AvailableTypes.ftPollOption,
  fastTelega.AvailableTypes.ftReplyBase,
  fastTelega.AvailableTypes.ftReplyKeyboardMarkup,
  fastTelega.AvailableTypes.ftReplyKeyboardRemove,
  fastTelega.AvailableTypes.ftResponseParameters,
  fastTelega.AvailableTypes.ftShippingAddress,
  fastTelega.AvailableTypes.ftShippingOption,
  fastTelega.AvailableTypes.ftSticker,
  fastTelega.AvailableTypes.ftVenue,
  fastTelega.AvailableTypes.ftVoice,
  fastTelega.AvailableTypes.ftWebAppData,
  fastTelega.AvailableTypes.ftWebAppInfo,
  fastTelega.AvailableTypes.ftWebhookInfo,
  fastTelega.AvailableTypes.ftWriteAccessAllowed;

const
  ChatMemberOwnerSTATUS = 'creator';
  ChatMemberAdministratorSTATUS = 'administrator';
  ChatMemberMemberSTATUS = 'member';
  ChatMemberRestrictedSTATUS = 'restricted';
  ChatMemberLeftSTATUS = 'left';
  ChatMemberBannedSTATUS = 'kicked';

type

  // TftAnimation = class;
  // TftAudio = class;
  // TftBotCommand = class;
  // TftBotCommandScope = class;
  // TftBotCommandScopeAllChatAdministrators = class;
  // TftBotCommandScopeAllGroupChats = class;
  // TftBotCommandScopeAllPrivateChats = class;
  // TftBotCommandScopeChat = class;
  // TftBotCommandScopeChatAdministrators = class;
  // TftBotCommandScopeChatMember = class;
  // TftBotCommandScopeDefault = class;
  // TftCallbackGame = class;
  TftCallbackQuery = class;
  TftChat = class;
  // TftChatAdministratorRights = class;
  TftChatInviteLink = class;
  TftChatJoinRequest = class;
  // TftChatLocation = class;
  TftChatMember = class;
  // TftChatMemberAdministrator = class;
  TftChatMemberBanned = class;
  TftChatMemberLeft = class;
  TftChatMemberMember = class;
  TftChatMemberOwner = class;
  TftChatMemberRestricted = class;
  TftChatMemberUpdated = class;
  // TftChatPermissions = class;
  // TftChatPhoto = class;
  TftChosenInlineResult = class;
  // TftContact = class;
  // TftDice = class;
  // TftDocument = class;
  // TftEncryptedCredentials = class;
  // TftEncryptedPassportElement = class;
  // TftFile = class;
  // TftForceReply = class;
  TftGame = class;
  TftGameHighScore = class;
  // TftReplyBase = class;
  // TftInlineKeyboardButton = class;
  // TftInlineKeyboardMarkup = class;
  TftInlineQuery = class;
  // TftInlineQueryResult = class;
  // TftInlineQueryResultArticle = class;
  // TftInlineQueryResultAudio = class;
  // TftInlineQueryResultCachedAudio = class;
  // TftInlineQueryResultCachedDocument = class;
  // TftInlineQueryResultCachedGif = class;
  // TftInlineQueryResultCachedMpeg4Gif = class;
  // TftInlineQueryResultCachedPhoto = class;
  // TftInlineQueryResultCachedSticker = class;
  // TftInlineQueryResultCachedVideo = class;
  // TftInlineQueryResultCachedVoice = class;
  // TftInlineQueryResultContact = class;
  // TftInlineQueryResultDocument = class;
  // TftInlineQueryResultGame = class;
  // TftInlineQueryResultGif = class;
  // TftInlineQueryResultLocation = class;
  // TftInlineQueryResultMpeg4Gif = class;
  // TftInlineQueryResultPhoto = class;
  // TftInlineQueryResultVenue = class;
  // TftInlineQueryResultVideo = class;
  // TftInlineQueryResultVoice = class;
  // TftInputContactMessageContent = class;
  // TftInputFile = class;
  // TftInputInvoiceMessageContent = class;
  // TftInputLocationMessageContent = class;
  // TftInputMedia = class;
  // TftInputMediaAnimation = class;
  // TftInputMediaAudio = class;
  // TftInputMediaDocument = class;
  // TftInputMediaPhoto = class;
  // TftInputMediaVideo = class;
  // TftInputMessageContent = class;
  // TftInputTextMessageContent = class;
  // TftInputVenueMessageContent = class;
  // TftInvoice = class;
  // TftKeyboardButton = class;
  // TftKeyboardButtonPollType = class;
  // TftLabeledPrice = class;
  // TftLocation = class;
  // TftLoginUrl = class;
  // TftMaskPosition = class;
  // TftMenuButton = class;
  // TftMenuButtonCommands = class;
  // TftMenuButtonDefault = class;
  // TftMenuButtonWebApp = class;
  TftMessage = class;
  // TftMessageAutoDeleteTimerChanged = class;
  TftMessageEntity = class;
  // TftMessageId = class;
  // TftOrderInfo = class;
  // TftPassportData = class;
  // TftPassportElementError = class;
  // TftPassportElementErrorDataField = class;
  // TftPassportElementErrorFile = class;
  // TftPassportElementErrorFiles = class;
  // TftPassportElementErrorFrontSide = class;
  // TftPassportElementErrorReverseSide = class;
  // TftPassportElementErrorSelfie = class;
  // TftPassportElementErrorTranslationFile = class;
  // TftPassportElementErrorTranslationFiles = class;
  // TftPassportElementErrorUnspecified = class;
  // TftPassportFile = class;
  // TftPhotoSize = class;
  TftPoll = class;
  TftPollAnswer = class;
  // TftPollOption = class;
  TftPreCheckoutQuery = class;
  TftProximityAlertTriggered = class;
  // TftReplyKeyboardMarkup = class;
  // TftReplyKeyboardRemove = class;
  // TftResponseParameters = class;
  // TftSentWebAppMessage = class;
  // TftShippingAddress = class;
  // TftShippingOption = class;
  TftShippingQuery = class;
  // TftSticker = class;
  // TftStickerSet = class;
  TftSuccessfulPayment = class;
  TftBusinessConnection = class;
  TftBusinessMessagesDeleted = class;
  TftMessageReactionUpdated = class;
  TftMessageReactionCountUpdated = class;
  TftPaidMediaPurchased = class;
  TftChatBoostUpdated = class;
  TftChatBoostRemoved = class;
  TftManagedBotUpdated = class;
  TftBotSubscriptionUpdated = class;
  TftMessageGenerationStopped = class;
  TftUpdate = class;
  TftUser = class;
  TftUserProfilePhotos = class;
  // TftVenue = class;
  TftVideo = class;
  TftVideoChatEnded = class;
  TftVideoChatParticipantsInvited = class;
  TftVideoChatScheduled = class;
  TftVideoChatStarted = class;
  TftVideoNote = class;
  // TftVoice = class;
  // TftWebAppData = class;
  // TftWebAppInfo = class;
  // TftWebhookInfo = class;

  TftUpdateList = TObjectList<TftUpdate>;
  TftUserList = TArray<TftUser>;
  TftMessageList = TArray<TftMessage>;
  TftMessageEntityList = TArray<TftMessageEntity>;
  // TftPhotoSizeList = TArray<TftPhotoSize>;
  // TftPollOptionList = TArray<TftPollOption>;
  TftStickerList = TObjectList<TftSticker>;

  /// <summary>
  /// This object represents an incoming callback query from a callback button in an inline keyboard.
  /// </summary>
  TftCallbackQuery = class
  private
    FId: String;
    FFrom: TftUser;
    FMessage: TftMessage;
    FInlineMessageId: String;
    FChatInstance: String;
    FData: String;
    FGameShortName: String;
  public
    /// <summary>
    /// Unique identifier for this query.
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Sender.
    /// </summary>
    property From: TftUser read FFrom write FFrom;
    /// <summary>
    /// Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old.
    /// </summary>
    property Message: TftMessage read FMessage write FMessage;
    /// <summary>
    /// Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
    /// </summary>
    property InlIneMessageId: String read FInlineMessageId
      write FInlineMessageId;
    /// <summary>
    /// Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
    /// </summary>
    property ChatInstance: String read FChatInstance write FChatInstance;
    /// <summary>
    /// Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.
    /// </summary>
    property Data: String read FData write FData;
    /// <summary>
    /// Optional. Short name of a Game to be returned, serves as the unique identifier for the game
    /// </summary>
    property GameShortName: String read FGameShortName write FGameShortName;
  end;

  /// <summary>
  /// This object represents a result of an inline query that was chosen by the user and sent to their chat partner. *
  /// </summary>
  TftChosenInlineResult = class
  private
    FResultId: String;
    FFrom: TftUser;
    FLocation: TftLocation;
    FInlineMessageId: String;
    FQuery: String;
  public
    /// <summary>
    /// The unique identifier for the result that was chosen.
    /// </summary>
    property ResultId: String read FResultId write FResultId;
    /// <summary>
    /// The user that chose the result.
    /// </summary>
    property From: TftUser read FFrom write FFrom;
    /// <summary>
    /// Optional. Sender location, only for bots that require user location
    /// </summary>
    property Location: TftLocation read FLocation write FLocation;
    /// <summary>
    /// Optional. Identifier of the sent inline message.
    /// Available only if there is an inline keyboard attached to the message.
    /// Will be also received in callback queries and can be used to edit the message.
    /// </summary>
    property InlIneMessageId: String read FInlineMessageId
      write FInlineMessageId;
    /// <summary>
    /// The query that was used to obtain the result.
    /// </summary>
    property Query: String read FQuery write FQuery;
  end;

  /// <summary>
  /// This object contains information about an incoming shipping query.
  /// https://core.telegram.org/bots/api#shippingquery *
  /// </summary>
  TftShippingQuery = class
  private
    FId: String;
    FFrom: TftUser;
    FInvoicePayload: String;
    FShippingAddress: TftShippingAddress;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique query identifier.
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// User who sent the query.
    /// </summary>
    property From: TftUser read FFrom write FFrom;
    /// <summary>
    /// Bot specified invoice payload.
    /// </summary>
    property InvoIcePayload: String read FInvoicePayload write FInvoicePayload;
    /// <summary>
    /// User specified shipping address.
    /// </summary>
    property ShippingAddreSS: TftShippingAddress read FShippingAddress
      write FShippingAddress;
  end;

  /// <summary>
  /// This object contains information about an incoming pre-checkout query.
  /// https://core.telegram.org/bots/api#precheckoutquery
  /// </summary>
  TftPreCheckoutQuery = class
  private
    FId: String;
    FFrom: TftUser;
    FCurrency: String;
    FTotalAmount: Integer;
    FInvoicePayload: String;
    FShippingOptionId: String;
    FOrderInfo: TftOrderInfo;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique query identifier.
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// User who sent the query.
    /// </summary>
    property From: TftUser read FFrom write FFrom;
    /// <summary>
    /// Three-letter ISO 4217 currency code.
    /// </summary>
    property CurrenCy: String read FCurrency write FCurrency;
    /// <summary>
    /// Total price in the smallest units of the currency (integer,
    /// For example, for a price of US$ 1.45 pass
    /// amount = 145. See the exp parameter in currencies.json, it shows
    /// the number of digits past the decimal point for each currency (2
    /// for the majority of currencies).
    /// https://core.telegram.org/bots/payments/currencies.json
    /// </summary>
    property TotalAmount: Integer read FTotalAmount write FTotalAmount;
    /// <summary>
    /// Bot specified invoice payload.
    /// </summary>
    property InvoIcePayload: String read FInvoicePayload write FInvoicePayload;
    /// <summary>
    /// Optional. Identifier of the shipping option chosen by the user.
    /// </summary>
    property ShippingOptionId: String read FShippingOptionId
      write FShippingOptionId;
    /// <summary>
    /// Optional. Order info provided by the user.
    /// </summary>
    property OrderInfo: TftOrderInfo read FOrderInfo write FOrderInfo;
  end;

  /// <summary>
  /// This object represents an incoming update.
  /// At most one of the optional parameters can be present in any given update.
  /// </summary>
  TftUpdate = class
  private
    FUpdateId: Integer;
    FMessage: TftMessage;
    FEditedMessage: TftMessage;
    FChannelPost: TftMessage;
    FEditedChannelPost: TftMessage;
    FInlineQuery: TftInlineQuery;
    FChosenInlineResult: TftChosenInlineResult;
    FCallbackQuery: TftCallbackQuery;
    FShippingQuery: TftShippingQuery;
    FPreCheckoutQuery: TftPreCheckoutQuery;
    FPoll: TftPoll;
    FPollAnswer: TftPollAnswer;
    FMyChatMember: TftChatMemberUpdated;
    FChatMember: TftChatMemberUpdated;
    FChatJoinRequest: TftChatJoinRequest;
    FBusinessConnection: TftBusinessConnection;
    FBusinessMessage: TftMessage;
    FEditedBusinessMessage: TftMessage;
    FGuestMessage: TftMessage;
    FDeletedBusinessMessages: TftBusinessMessagesDeleted;
    FMessageReaction: TftMessageReactionUpdated;
    FMessageReactionCount: TftMessageReactionCountUpdated;
    FPurchasedPaidMedia: TftPaidMediaPurchased;
    FChatBoost: TftChatBoostUpdated;
    FRemovedChatBoost: TftChatBoostRemoved;
    FManagedBot: TftManagedBotUpdated;
    FSubscription: TftBotSubscriptionUpdated;
    FStoppedMessageGeneration: TftMessageGenerationStopped;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// The update's unique identifier. Update identifiers start from a certain
    /// positive number and increase sequentially. This ID becomes especially
    /// handy if you're using Webhooks, since it allows you to ignore repeated
    /// updates or to restore the correct update sequence, should they get out
    /// of order. If there are no new updates for at least a week, then identifier
    /// of the next update will be chosen randomly instead of sequentially.
    /// </summary>
    property UpdateId: Integer read FUpdateId write FUpdateId;
    /// <summary>
    /// Optional. New incoming message of any kind — text, photo, sticker, etc.
    /// </summary>
    property Message: TftMessage read FMessage write FMessage;
    /// <summary>
    /// Optional. New version of a message that is known to the bot and was edited
    /// </summary>
    property EditedMessage: TftMessage read FEditedMessage write FEditedMessage;
    /// <summary>
    /// Optional. New incoming channel post of any kind — text, photo, sticker, etc.
    /// </summary>
    property ChannelPost: TftMessage read FChannelPost write FChannelPost;
    /// <summary>
    /// Optional. New version of a channel post that is known to the bot and was edited
    /// </summary>
    property EditedChannelPost: TftMessage read FEditedChannelPost
      write FEditedChannelPost;
    /// <summary>
    /// Optional. New incoming inline query
    /// </summary>
    property InlineQuery: TftInlineQuery read FInlineQuery write FInlineQuery;
    /// <summary>
    /// Optional. The result of an inline query that was chosen by a user
    /// and sent to their chat partner. Please see our documentation on
    /// the feedback collecting for details on how to enable these
    /// updates for your bot.
    /// </summary>
    property ChosenInlineResult: TftChosenInlineResult read FChosenInlineResult
      write FChosenInlineResult;
    // /// <summary>
    // /// Optional. New incoming callback query
    // /// </summary>
    property CallbackQuery: TftCallbackQuery read FCallbackQuery
      write FCallbackQuery;
    // /// <summary>
    // /// Optional. New incoming shipping query. Only for invoices with flexible price
    // /// </summary>
    property ShippingQuery: TftShippingQuery read FShippingQuery
      write FShippingQuery;
    // /// <summary>
    // /// Optional. New incoming pre-checkout query. Contains full information about checkout
    // /// </summary>
    property PreCheckoutQuery: TftPreCheckoutQuery read FPreCheckoutQuery
      write FPreCheckoutQuery;
    // /// <summary>
    // /// Optional. New poll state. Bots receive only updates about stopped
    // /// polls and polls, which are sent by the bot
    // /// </summary>
    property Poll: TftPoll read FPoll write FPoll;
    // /// <summary>
    // /// Optional. A user changed their answer in a non-anonymous poll.
    // /// Bots receive new votes only in polls that were sent by the bot itself.
    // /// </summary>
    property PollAnswer: TftPollAnswer read FPollAnswer write FPollAnswer;
    // /// <summary>
    // /// Optional. The bot's chat member status was updated in a chat. For
    // /// private chats, this update is received only when the bot is
    // /// blocked or unblocked by the user.
    // /// </summary>
    property MyChatMember: TftChatMemberUpdated read FMyChatMember
      write FMyChatMember;
    /// <summary>  Optional. A chat member's status was updated in a chat.
    /// The bot must be an administrator in the chat and must explicitly
    /// specify “chat_member” in the list of allowed_updates
    /// to receive these updates.
    /// </summary>
    property ChatMember: TftChatMemberUpdated read FChatMember
      write FChatMember;

    /// <summary>
    /// Optional. A request to join the chat has been sent.
    /// The bot must have the canInviteUsers administrator right in the chat to receive these updates.
    /// <summary>
    property ChatJoinRequest: TftChatJoinRequest read FChatJoinRequest
      write FChatJoinRequest;
    property BusinessConnection: TftBusinessConnection read FBusinessConnection
      write FBusinessConnection;
    property BusinessMessage: TftMessage read FBusinessMessage
      write FBusinessMessage;
    property EditedBusinessMessage: TftMessage read FEditedBusinessMessage
      write FEditedBusinessMessage;
    property GuestMessage: TftMessage read FGuestMessage write FGuestMessage;
    property DeletedBusinessMessages: TftBusinessMessagesDeleted
      read FDeletedBusinessMessages write FDeletedBusinessMessages;
    property MessageReaction: TftMessageReactionUpdated read FMessageReaction
      write FMessageReaction;
    property MessageReactionCount: TftMessageReactionCountUpdated
      read FMessageReactionCount write FMessageReactionCount;
    property PurchasedPaidMedia: TftPaidMediaPurchased read FPurchasedPaidMedia
      write FPurchasedPaidMedia;
    property ChatBoost: TftChatBoostUpdated read FChatBoost write FChatBoost;
    property RemovedChatBoost: TftChatBoostRemoved read FRemovedChatBoost
      write FRemovedChatBoost;
    property ManagedBot: TftManagedBotUpdated read FManagedBot
      write FManagedBot;
    property Subscription: TftBotSubscriptionUpdated read FSubscription
      write FSubscription;
    property StoppedMessageGeneration: TftMessageGenerationStopped
      read FStoppedMessageGeneration write FStoppedMessageGeneration;
  end;

  TftMessageEntityType = (Mention, Hashtag, Cashtag, BotCommand, Url, Email,
    PhoneNumber, Bold, Italic, Underline, Strikethrough, Spoiler, Code, Pre,
    TextLink, TextMention, CustomEmoji);

  /// <summary>
  /// This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
  /// </summary>
  TftMessageEntity = class
  private
    FType: TftMessageEntityType;
    FOffset: Integer;
    FLength: Integer;
    FUrl: String;
    FUser: TftUser;
    FLanguage: String;
    FCustomEmojiId: String;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Type of the entity. Can be “mention” (@username), “hashtag” (#hashtag),
    /// “cashtag” ($USD), “bot_command” (/start@jobs_bot),
    /// “url” (https://telegram.org), “email” (do-not-reply@telegram.org),
    /// “phone_number” (+1-212-555-0123), “bold” (bold text), “italic” (italic text),
    /// “underline” (underlined text), “strikethrough” (strikethrough text),
    /// “code” (monowidth string), “pre” (monowidth block), “text_link”
    /// (for clickable text URLs), “text_mention” (for users without usernames)
    /// </summary>
    property TypeMessageEntity: TftMessageEntityType read FType write FType;
    /// <summary>
    /// Offset in UTF-16 code units to the start of the entity
    /// </summary>
    property Offset: Integer read FOffset write FOffset;
    /// <summary>
    /// Length of the entity in UTF-16 code units
    /// </summary>
    property Length: Integer read FLength write FLength;
    /// <summary>
    /// Optional. For “text_link” only, url that will be opened after user taps on the text
    /// </summary>
    property Url: String read FUrl write FUrl;
    /// <summary>
    /// Optional. For “text_mention” only, the mentioned user
    /// </summary>
    property User: TftUser read FUser write FUser;
    /// <summary>
    /// Optional. For “pre” only, the programming language of the entity text
    /// </summary>
    property Language: String read FLanguage write FLanguage;
    /// <summary>
    /// Optional. For “custom_emoji” only, unique identifier of the custom emoji.
    /// Use Api::getCustomEmojiStickers to get full information about the sticker
    /// </summary>
    property CustomEmojiId: String read FCustomEmojiId write FCustomEmojiId;
  end;

  /// <summary>
  /// This object contains basic information about a successful payment.
  /// https://core.telegram.org/bots/api#successfulpayment
  /// </summary>
  TftSuccessfulPayment = class
  private
    FCurrency: String;
    FTotalAmount: Integer;
    FInvoicePayload: String;
    FShippingOptionId: String;
    FOrderInfo: TftOrderInfo;
    FTelegramPaymentChargeId: String;
    FProviderPaymentChargeId: String;
  public
    // constructor Create;
    // destructor Destroy; override;
    /// <summary>
    /// Three-letter ISO 4217 currency code
    /// </summary>
    property CurrenCy: String read FCurrency write FCurrency;
    /// <summary>
    /// Total price in the smallest units of the currency (integer,
    /// not float/double).
    /// For example, for a price of US$ 1.45 pass
    /// amount = 145. See the exp parameter in currencies.json, it shows
    /// the number of digits past the decimal point for each currency (2
    /// for the majority of currencies).
    /// https://core.telegram.org/bots/payments/currencies.json
    /// </summary>
    property TotalAmount: Integer read FTotalAmount write FTotalAmount;
    /// <summary>
    /// Bot specified invoice payload.
    /// </summary>
    property InvoIcePayload: String read FInvoicePayload write FInvoicePayload;
    /// <summary>
    /// Optional. Identifier of the shipping option chosen by the user.
    /// </summary>
    property ShippingOptionId: String read FShippingOptionId
      write FShippingOptionId;
    /// <summary>
    /// Optional. Order info provided by the user.
    /// </summary>
    property OrderInfo: TftOrderInfo read FOrderInfo write FOrderInfo;
    /// <summary>
    /// Telegram payment identifier.
    /// </summary>
    property TelegramPaymenTChargeId: String read FTelegramPaymentChargeId
      write FTelegramPaymentChargeId;
    /// <summary>
    /// Provider payment identifier.
    /// </summary>
    property ProviderPaymentChargeId: String read FProviderPaymentChargeId
      write FProviderPaymentChargeId;
  end;

  /// <summary>
  /// This object represents a message.
  /// </summary>
  TftMessage = class
  private
    FMessageId: Integer;
    FMessageThreadId: Integer;
    FFrom: TftUser;
    FSenderChat: TftChat;
    FDate: Integer;
    FChat: TftChat;
    FForwardFrom: TftUser;
    FForwardFromChat: TftChat;
    FForwardFromMessageId: Integer;
    FForwardSignature: String;
    FForwardSenderName: String;
    FForwardDate: Integer;
    FIsTopicMessage: Boolean;
    FIsAutomaticForward: Boolean;
    FReplyToMessage: TftMessage;
    FViaBot: TftUser;
    FEditDate: Integer;
    FHasProtectedContent: Integer;
    FMediaGroupId: String;
    FAuthorSignature: String;
    FText: String;
    FEntities: TftMessageEntityList;
    FAnimation: TftAnimation;
    FAudio: TftAudio;
    FDocument: TftDocument;
    FPhoto: TftPhotoSizeList;
    FSticker: TftSticker;
    FVideo: TftVideo;
    FVideoNote: TftVideoNote;
    FVoice: TftVoice;
    FCaption: String;
    FCaptionEntities: TftMessageEntityList;
    FHasMediaSpoiler: Boolean;
    FContact: TftContact;
    FDice: TftDice;
    FGame: TftGame;
    FPoll: TftPoll;
    FVenue: TftVenue;
    FLocation: TftLocation;
    FNewChatMembers: TftUserList;
    FLeftChatMember: TftUser;
    FNewChatTitle: String;
    FNewChatPhoto: TftPhotoSizeList;
    FDeleteChatPhoto: Boolean;
    FGroupChatCreated: Boolean;
    FSupergroupChatCreated: Boolean;
    FChannelChatCreated: Boolean;
    FMessageAutoDeleteTimerChanged: TftMessageAutoDeleteTimerChanged;
    FMigrateToChatId: Integer;
    FMigrateFromChatId: Integer;
    FPinnedMessage: TftMessage;
    FInvoice: TftInvoice;
    FSuccessfulPayment: TftSuccessfulPayment;
    FConnectedWebsite: String;
    FWriteAccessAllowed: TftWriteAccessAllowed;
    FPassportData: TftPassportData;
    FProximityAlertTriggered: TftProximityAlertTriggered;
    FForumTopicCreated: TftForumTopicCreated;
    FForumTopicEdited: TftForumTopicEdited;
    FForumTopicClosed: TftForumTopicClosed;
    FForumTopicReopened: TftForumTopicReopened;
    FGeneralForumTopicHidden: TftGeneralForumTopicHidden;
    FGeneralForumTopicUnhidden: TftGeneralForumTopicUnhidden;
    FVideoChatScheduled: TftVideoChatScheduled;
    FVideoChatStarted: TftVideoChatStarted;
    FVideoChatEnded: TftVideoChatEnded;
    FVideoChatParticipantsInvited: TftVideoChatParticipantsInvited;
    FWebAppData: TftWebAppData;
    FReplyMarkup: TftInlineKeyboardMarkup;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique message identifier inside this chat
    /// </summary>
    property MessageId: Integer read FMessageId write FMessageId;
    /// <summary>
    /// Optional. Unique identifier of a message thread to which the message belongs; for supergroups only
    /// </summary>
    property MessageThreadId: Integer read FMessageThreadId
      write FMessageThreadId;
    /// <summary>
    /// Optional. Sender, empty for messages sent to channels
    /// </summary>
    property From: TftUser read FFrom write FFrom;
    /// <summary>
    /// Optional. Sender of the message, sent on behalf of a chat. The channel
    /// itself for channel messages. The supergroup itself for messages
    /// from anonymous group administrators. The linked channel for
    /// messages automatically forwarded to the discussion group
    /// </summary>
    property SenderChat: TftChat read FSenderChat write FSenderChat;
    /// <summary>
    /// Date the message was sent in Unix time
    /// </summary>
    property Date: Integer read FDate write FDate;
    /// <summary>
    /// Conversation the message belongs to
    /// </summary>
    property Chat: TftChat read FChat write FChat;
    /// <summary>
    /// Optional. For forwarded messages, sender of the original message
    /// </summary>
    property ForwardFrom: TftUser read FForwardFrom write FForwardFrom;
    /// <summary>
    /// Optional. For messages forwarded from channels or from anonymous administrators, information about the original sender chat
    /// </summary>
    property ForwardFromChat: TftChat read FForwardFromChat
      write FForwardFromChat;
    /// <summary>
    /// Optional. For messages forwarded from channels, identifier of the original message in the channel
    /// </summary>
    property ForwardFromMessageId: Integer read FForwardFromMessageId
      write FForwardFromMessageId;
    /// <summary>
    /// Optional. For messages forwarded from channels, signature of the post author if present
    /// </summary>
    property ForwardSignature: String read FForwardSignature
      write FForwardSignature;
    /// <summary>
    /// Optional. Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
    /// </summary>
    property ForwardSenderName: String read FForwardSenderName
      write FForwardSenderName;
    /// <summary>
    /// Optional. For forwarded messages, date the original message was sent in Unix time
    /// </summary>
    property ForwardDate: Integer read FForwardDate write FForwardDate;
    /// <summary>
    /// Optional. True, if the message is sent to a forum topic
    /// </summary>
    property IsTopicMessage: Boolean read FIsTopicMessage write FIsTopicMessage;
    /// <summary>
    /// Optional. True, if the message is a channel post that was automatically forwarded to the connected discussion group
    /// </summary>
    property IsAutomaticForward: Boolean read FIsAutomaticForward
      write FIsAutomaticForward;
    /// <summary>
    /// Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    /// </summary>
    property ReplyToMessage: TftMessage read FReplyToMessage
      write FReplyToMessage;
    /// <summary>
    /// Optional. Bot through which the message was sent
    /// </summary>
    property ViaBot: TftUser read FViaBot write FViaBot;
    /// <summary>
    /// Optional. Date the message was last edited in Unix time
    /// </summary>
    property EditDate: Integer read FEditDate write FEditDate;
    /// <summary>
    /// Optional. True, if the message can't be forwarded
    /// </summary>
    property HasProtectedContent: Integer read FHasProtectedContent
      write FHasProtectedContent;
    /// <summary>
    /// Optional. The unique identifier of a media message group this message belongs to
    /// </summary>
    property MediaGroupId: String read FMediaGroupId write FMediaGroupId;
    /// <summary>
    /// Optional.Signature of the post author for messages in channels, or the custom Title of an anonymous group administrator
    /// </summary>
    property AuthorSignature: String read FAuthorSignature
      write FAuthorSignature;
    /// <summary>
    /// Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters
    /// </summary>
    property Text: String read FText write FText;
    /// <summary>
    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    /// </summary>
    property Entities: TftMessageEntityList read FEntities write FEntities;
    /// <summary>
    /// Optional. Caption for the animation, audio, document, photo, video or voice
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional.For messages with a caption, special entities like usernames, URLs, bot commands etc.that appear in the caption
    /// </summary>
    property CaptionEntities: TftMessageEntityList read FCaptionEntities
      write FCaptionEntities;
    /// <summary>
    /// Optional. True, if the message media is covered by a spoiler animation
    /// </summary>
    property HasMediaSpoiler: Boolean read FHasMediaSpoiler
      write FHasMediaSpoiler;
    /// <summary>
    /// Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
    /// </summary>
    property Animation: TftAnimation read FAnimation write FAnimation;
    /// <summary>
    /// Optional. Message is an audio file, information about the file
    /// </summary>
    property Audio: TftAudio read FAudio write FAudio;
    /// <summary>
    /// Optional. Message is a general file, information about the file
    /// </summary>
    property Document: TftDocument read FDocument write FDocument;
    /// <summary>
    /// Optional. Message is a photo, available sizes of the photo
    /// </summary>
    property Photo: TftPhotoSizeList read FPhoto write FPhoto;
    /// Optional. Message is a sticker, information about the sticker
    /// </summary>
    property Sticker: TftSticker read FSticker write FSticker;
    /// <summary>
    /// Optional. Message is a video, information about the video
    /// </summary>
    property Video: TftVideo read FVideo write FVideo;
    /// <summary>
    /// Optional. Message is a video note, information about the video message
    /// </summary>
    property VideoNote: TftVideoNote read FVideoNote write FVideoNote;
    /// <summary>
    /// Optional. Message is a voice message, information about the file
    /// </summary>
    property Voice: TftVoice read FVoice write FVoice;
    /// <summary>
    /// Optional. Message is a shared contact, information about the contact
    /// </summary>
    property Contact: TftContact read FContact write FContact;
    /// <summary>
    /// Optional. Message is a dice with random value
    /// </summary>
    property Dice: TftDice read FDice write FDice;
    /// <summary>
    /// Optional. Message is a game, information about the game. More about games »
    /// </summary>
    property Game: TftGame read FGame write FGame;
    /// <summary>
    /// Optional. Message is a native poll, information about the poll
    /// </summary>
    property Poll: TftPoll read FPoll write FPoll;
    /// <summary>
    /// Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
    /// </summary>
    property Venue: TftVenue read FVenue write FVenue;
    /// <summary>
    /// Optional. Message is a shared location, information about the location
    property Location: TftLocation read FLocation write FLocation;
    /// <summary>
    /// Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    /// </summary>
    property NewChatMembers: TftUserList read FNewChatMembers
      write FNewChatMembers;
    /// <summary>
    /// Optional. A member was removed from the group, information about them (this member may be the bot itself)
    /// </summary>
    property LeftChatMember: TftUser read FLeftChatMember write FLeftChatMember;
    /// <summary>
    /// Optional. A chat title was changed to this value
    /// </summary>
    property NewChatTitle: String read FNewChatTitle write FNewChatTitle;
    /// <summary>
    /// Optional. A chat photo was change to this value
    /// </summary>
    property NewChatPhoto: TftPhotoSizeList read FNewChatPhoto
      write FNewChatPhoto;
    /// <summary>
    /// Optional. Service message: the chat photo was deleted
    /// </summary>
    property DeleteChatPhoto: Boolean read FDeleteChatPhoto
      write FDeleteChatPhoto default True;
    /// <summary>
    /// Optional. Service message: the group has been created
    /// </summary>
    property GroupChatCreated: Boolean read FGroupChatCreated
      write FGroupChatCreated default True;
    /// <summary>
    /// Optional. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    /// </summary>
    property SupergroupChatCreated: Boolean read FSupergroupChatCreated
      write FSupergroupChatCreated default True;
    /// <summary>
    /// Optional. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    /// </summary>
    property ChannelChatCreated: Boolean read FChannelChatCreated
      write FChannelChatCreated default True;
    /// <summary>
    /// Optional. Service message: auto-delete timer settings changed in the chat
    /// </summary>
    property MessageAutoDeleteTimerChanged: TftMessageAutoDeleteTimerChanged
      read FMessageAutoDeleteTimerChanged write FMessageAutoDeleteTimerChanged;
    /// <summary>
    /// Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateToChatId: Integer read FMigrateToChatId
      write FMigrateToChatId;
    /// <summary>
    /// Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateFromChatId: Integer read FMigrateFromChatId
      write FMigrateFromChatId;
    /// <summary>
    /// Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
    /// </summary>
    property PinnedMessage: TftMessage read FPinnedMessage write FPinnedMessage;
    // /// <summary>
    // /// Optional. Message is an invoice for a payment, information about the invoice. More about payments »
    // /// </summary>
    property Invoice: TftInvoice read FInvoice write FInvoice;
    // /// <summary>
    // /// Optional. Message is a service message about a successful payment, information about the payment. More about payments »
    // /// </summary>
    property SuccessfulPayment: TftSuccessfulPayment read FSuccessfulPayment
      write FSuccessfulPayment;
    // /// <summary>
    // /// Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
    // /// </summary>
    property ConnectedWebsite: String read FConnectedWebsite
      write FConnectedWebsite;
    /// <summary>
    /// Optional. Service message: the user allowed the bot added to the attachment menu to write messages
    /// </summary>
    property WriteAccessAllowed: TftWriteAccessAllowed read FWriteAccessAllowed
      write FWriteAccessAllowed;
    /// <summary>
    /// Optional. Telegram Passport data
    /// </summary>
    property PassportData: TftPassportData read FPassportData
      write FPassportData;
    /// <summary>
    /// Optional. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
    /// </summary>
    property ProximityAlertTriggered: TftProximityAlertTriggered
      read FProximityAlertTriggered write FProximityAlertTriggered;
    /// <summary>
    /// Optional. Service message: forum topic created
    /// </summary>
    property ForumTopicCreated: TftForumTopicCreated read FForumTopicCreated
      write FForumTopicCreated;
    /// <summary>
    /// Optional. Service message: forum topic edited
    /// </summary>
    property ForumTopicEdited: TftForumTopicEdited read FForumTopicEdited
      write FForumTopicEdited;
    /// <summary>
    /// Optional. Service message: forum topic closed
    /// </summary>
    property ForumTopicClosed: TftForumTopicClosed read FForumTopicClosed
      write FForumTopicClosed;
    /// <summary>
    /// Optional. Service message: forum topic reopened
    /// </summary>
    property ForumTopicReopened: TftForumTopicReopened read FForumTopicReopened
      write FForumTopicReopened;
    /// <summary>
    /// Optional. Service message: the 'General' forum topic hidden
    /// </summary>
    property GeneralForumTopicHidden: TftGeneralForumTopicHidden
      read FGeneralForumTopicHidden write FGeneralForumTopicHidden;
    /// <summary>
    /// Optional. Service message: the 'General' forum topic unhidden
    /// </summary>
    property GeneralForumTopicUnhidden: TftGeneralForumTopicUnhidden
      read FGeneralForumTopicUnhidden write FGeneralForumTopicUnhidden;
    /// <summary>
    /// Optional. Service message: video chat scheduled
    /// </summary>
    property VideoChatScheduled: TftVideoChatScheduled read FVideoChatScheduled
      write FVideoChatScheduled;
    /// <summary>
    /// Optional. Service message: video chat started
    /// </summary>
    property VideoChatStarted: TftVideoChatStarted read FVideoChatStarted
      write FVideoChatStarted;
    /// <summary>
    /// Optional. Service message: video chat ended
    /// </summary>
    property VideoChatEnded: TftVideoChatEnded read FVideoChatEnded
      write FVideoChatEnded;
    /// <summary>
    /// Optional. Service message: new participants invited to a video chat
    /// </summary>
    property VideoChatParticipantsinvited: TftVideoChatParticipantsInvited
      read FVideoChatParticipantsInvited write FVideoChatParticipantsInvited;
    /// <summary>
    /// Optional. Service message: data sent by a Web App
    /// </summary>
    property WebAppData: TftWebAppData read FWebAppData write FWebAppData;
    /// <summary>
    /// Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    /// </summary>
    property ReplyMarkup: TftInlineKeyboardMarkup read FReplyMarkup
      write FReplyMarkup;
  end;

  /// <summary>
  /// This object represents an incoming inline query. When the user sends
  /// an empty query, your bot could return some default or trending results.
  /// </summary>
  TftInlineQuery = class
  private
    FId: String;
    FFrom: TftUser;
    FQuery: String;
    FOffset: String;
    FChatType: String;
    FLocation: TftLocation;
  public
    /// <summary>
    /// Unique identifier for this query
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Sender
    /// </summary>
    property From: TftUser read FFrom write FFrom;
    /// <summary>
    /// Text of the query (up to 256 characters)
    /// </summary>
    property Query: String read FQuery write FQuery;
    /// <summary>
    /// Offset of the results to be returned, can be controlled by the bot
    /// </summary>
    property Offset: String read FOffset write FOffset;
    /// <summary>
    /// Optional. Type of the chat, from which the inline query was sent.
    /// Can be either “sender” for a private chat with the inline query
    /// sender, “private”, “group”, “supergroup”, or “channel”. The chat
    /// type should be always known for requests sent from official clients
    /// and most third-party clients, unless the request was sent from
    /// a secret chat
    /// </summary>
    property ChatType: String read FChatType write FChatType;
    /// <summary>
    /// Optional. Sender location, only for bots that request user location
    /// </summary>
    property Location: TftLocation read FLocation write FLocation;
  end;

  /// <summary>
  /// This object contains information about a poll.
  /// </summary>
  TftPoll = class
  private
    FId: String;
    FQuestion: String;
    FOptions: TftPollOptionList;
    FTotalVoterCount: Integer;
    FIsClosed: Boolean;
    FIsAnonymous: Boolean;
    FType: String;
    FAllowsMultipleAnswers: Boolean;
    FCorrectOptionId: Integer;
    FExplanation: String;
    FExplanationEntities: TftMessageEntityList;
    FOpenPeriod: Integer;
    FCloseDate: Integer;
  public
    /// <summary>
    /// Unique poll identifier
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Poll question, 1-300 characters
    /// </summary>
    property Question: String read FQuestion write FQuestion;
    /// <summary>
    /// List of poll options
    /// </summary>
    property Options: TftPollOptionList read FOptions write FOptions;
    /// <summary>
    /// Total number of users that voted in the poll
    /// </summary>
    property TotalVoterCount: Integer read FTotalVoterCount
      write FTotalVoterCount;
    /// <summary>
    /// True, if the poll is closed
    /// </summary>
    property IsClosed: Boolean read FIsClosed write FIsClosed;
    /// <summary>
    /// True, if the poll is anonymous
    /// </summary>
    property IsAnonymous: Boolean read FIsAnonymous write FIsAnonymous;
    /// <summary>
    /// Poll type, currently can be “regular” or “quiz”
    /// </summary>
    property TypePoll: String read FType write FType;
    /// <summary>
    /// True, if the poll allows multiple answers
    /// </summary>
    property AllowsMultipleAnswers: Boolean read FAllowsMultipleAnswers
      write FAllowsMultipleAnswers;
    /// <summary>
    /// Optional. 0-based identifier of the correct answer option.
    /// Available only for polls in the quiz mode, which are closed,
    // or was sent (not forwarded) by the bot or
    /// to the private chat with the bot.
    /// </summary>
    property CorrectOptionId: Integer read FCorrectOptionId
      write FCorrectOptionId;
    /// <summary>
    /// Optional. Text that is shown when a user chooses an incorrect
    /// /answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    /// </summary>
    property Explanation: String read FExplanation write FExplanation;
    /// <summary>
    /// Optional. Special entities like usernames, URLs, bot commands,
    /// etc. that appear in the explanation
    /// </summary>
    property ExplanationEntities: TftMessageEntityList read FExplanationEntities
      write FExplanationEntities;
    /// <summary>
    /// Optional. Amount of time in seconds the poll will be active
    /// after creation
    /// </summary>
    property OpenPeriod: Integer read FOpenPeriod write FOpenPeriod;
    /// <summary>
    /// Optional. Point in time (Unix timestamp) when the poll will be
    /// automatically closed
    /// </summary>
    property CloseDate: Integer read FCloseDate write FCloseDate;
  end;

  /// <summary>
  /// This object represents an answer of a user in a non-anonymous poll.
  /// </summary>
  TftPollAnswer = class
  private
    FPollId: String;
    FUser: TftUser;
    FOptionIds: TList<Integer>;
  public
    /// <summary>
    /// Unique poll identifier
    /// </summary>
    property PollId: String read FPollId write FPollId;
    /// <summary>
    /// The user, who changed the answer to the poll
    /// </summary>
    property User: TftUser read FUser write FUser;
    // /// <summary>
    // /// 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.
    // /// </summary>
    property OptionIds: TList<Integer> read FOptionIds write FOptionIds;
  end;

  /// <summary>
  /// This object represents a video file.
  /// </summary>
  TftVideo = class(TftDocument)
  private
    FWidth: Integer;
    FHeight: Integer;
    FDuration: Integer;
  public
    /// <summary>
    /// Video width as defined by sender
    /// </summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>
    /// Video height as defined by sender
    /// </summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
  end;

  /// <summary>
  /// This object represents a video message (available in  apps as of v.4.0).
  /// </summary>
  TftVideoNote = class(TftDocument)
  private
    FFileId: String;
    FFileUniqueId: String;
    FLength: Integer;
    FDuration: Integer;
    FThumb: TftPhotoSize;
    FFileSize: Integer;
  public
    property FileId: String read FFileId write FFileId;
    property FileUniqueId: String read FFileUniqueId write FFileUniqueId;
    /// <summary>
    /// Video width and height (diameter of the video message) as defined by sender
    /// </summary>
    property Length: Integer read FLength write FLength;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
    property Thumb: TftPhotoSize read FThumb write FThumb;
    property FileSize: Integer read FFileSize write FFileSize;
  end;

  /// <summary>
  /// This object represents a service message about a video chat ended in the chat.
  /// </summary>
  TftVideoChatEnded = class
  private
    FDuration: Integer;
  public
    /// <summary>
    /// Video chat duration in seconds
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
  end;

  /// <summary>
  /// This object represents a service message about new members invited to a video chat.
  /// </summary>
  TftVideoChatParticipantsInvited = class
  private
    FUsers: TList<TftUser>;
  public
    /// <summary>
    /// New members that were invited to the video chat
    /// </summary>
    property Users: TList<TftUser> read FUsers write FUsers;
  end;

  /// <summary>
  /// This object represents a service message about a video chat scheduled in the chat.
  /// </summary>
  TftVideoChatScheduled = class
  private
    FStartDate: Integer;
  public
    /// <summary>
    /// Point in time (Unix timestamp) when the video chat is supposed to be started by a chat administrator
    /// </summary>
    property StartDate: Integer read FStartDate write FStartDate;
  end;

  /// <summary>
  /// This object represents a service message about a video chat started in the chat.
  /// Currently holds no information.
  /// </summary>
  TftVideoChatStarted = class
    // TODO
  end;

  /// <summary>
  /// Contains data required for decrypting and authenticating EncryptedPassportElement.
  /// See https://core.telegram.org/passport#receiving-information for a complete description of the data decryption and authentication
  /// </summary>
  TftEncryptedCredential = class
  private
    FData: String;
    FHash: String;
    FSecret: String;
  public
    /// <summary>
    /// Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for @ref EncryptedPassportElement decryption and authentication
    /// </summary>
    property Data: String read FData write FData;
    /// <summary>
    /// Base64-encoded data hash for data authentication
    /// </summary>
    property Hash: String read FHash write FHash;
    /// <summary>
    /// Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption
    /// </summary>
    property Secret: String read FSecret write FSecret;

  end;

  /// <summary>
  /// This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
  /// </summary>
  TftGame = class
  private
    FTitle: String;
    FDescription: String;
    FPhoto: TftPhotoSizeList;
    FText: String;
    FTextEntities: TftMessageEntityList;
    FAnimation: TftAnimation;
  public
    /// <summary>
    /// Title of the game.
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Description of the game
    /// </summary>
    property Description: String read FDescription write FDescription;
    /// <summary>
    /// Photo that will be displayed in the game message in chats.
    /// </summary>
    property Photo: TftPhotoSizeList read FPhoto write FPhoto;
    /// <summary>
    /// Optional. Brief description of the game or high scores included
    /// in the game message. Can be automatically edited to include current high
    /// scores for the game when the bot calls setGameScore, or manually edited
    /// using editMessageText. 0-4096 characters.
    /// </summary>
    property Text: String read FText write FText;
    /// <summary>
    /// Optional. Special entities that appear in text, such as usernames,
    /// URLs, bot commands, etc.
    /// </summary>
    property TextEntities: TftMessageEntityList read FTextEntities
      write FTextEntities;
    /// <summary>
    /// Optional. Animation that will be displayed in the game message
    /// in chats. Upload via BotFather
    /// </summary>
    property Animation: TftAnimation read FAnimation write FAnimation;
  end;

  /// <summary>
  /// This object represents one row of the high scores table for a game.
  /// </summary>
  TftGameHighScore = class
  private
    FPosition: String;
    FUser: TftUser;
    FScore: Integer;
  public
    /// <summary>
    /// Position in high score table for the game.
    /// </summary>
    property Position: String read FPosition write FPosition;
    /// <summary>
    /// User
    /// </summary>
    property User: TftUser read FUser write FUser;
    /// <summary>
    /// Score
    /// </summary>
    property Score: Integer read FScore write FScore;
  end;

  /// <summary>
  /// This object represents a  user or bot.
  /// </summary>
  TftUser = class
  private
    FId: Integer;
    FIsBot: Boolean;
    FFirstName: String;
    FLastName: String;
    FUsername: String;
    FLanguageCode: String;
    FIsPremium: Boolean;
    FAddedToAttachmentMenu: Boolean;
    FCanJoinGroups: Boolean;
    FCanReadAllGroupMessages: Boolean;
    FSupportsInlineQueries: Boolean;
  public
    constructor Create;
    /// <summary>
    /// Unique identifier for this user or bot.
    /// This number may have more than 32 significant bits and some programming
    /// languages may have difficulty / silent defects
    /// in interpreting it.But it has at most 52 significant bits,
    /// so a 64 - bit Integer or double - precision float type are safe for
    /// storing this identifier.FisBot: Boolean; // True, if this user is a bot
    /// </summary>
    property Id: Integer read FId write FId;
    /// <summary>
    /// True, if this user is a bot
    /// </summary>
    property IsBot: Boolean read FIsBot write FIsBot;
    /// <summary>
    /// User's or bot's first name
    /// </summary>
    property FirstName: String read FFirstName write FFirstName;
    /// <summary>
    /// Optional. User's or bot's last name
    /// </summary>
    property LastName: String read FLastName write FLastName;
    /// <summary>
    /// Optional. User's or bot's username
    /// </summary>
    property UserName: String read FUsername write FUsername;
    /// <summary>
    /// Optional. IETF language tag of the user's language
    /// </summary>
    property LanguageCode: String read FLanguageCode write FLanguageCode;
    /// <summary>
    /// Optional. True, if this user is a Telegram Premium user
    /// </summary>
    property IsPremium: Boolean read FIsPremium write FIsPremium;
    /// <summary>
    /// Optional. True, if this user added the bot to the attachment menu
    /// </summary>
    property AddedToAttachmentMenu: Boolean read FAddedToAttachmentMenu
      write FAddedToAttachmentMenu;
    /// <summary>
    /// Optional. True, if the bot can be invited to groups. Returned only in getMe.
    /// </summary>
    property CanJoinGroups: Boolean read FCanJoinGroups write FCanJoinGroups;
    /// <summary>
    /// Optional. True, if privacy mode is disabled for the bot. Returned only in getMe.
    /// </summary>
    property CanReadAllGroupMessages: Boolean read FCanReadAllGroupMessages
      write FCanReadAllGroupMessages;
    /// <summary>
    /// Optional. True, if the bot supports inline queries. Returned only in getMe.
    /// </summary>
    property SupportsInlineQueries: Boolean read FSupportsInlineQueries
      write FSupportsInlineQueries;
  end;

  /// <summary>
  /// This object represent a user's profile pictures.
  /// </summary>
  TftUserProfilePhotos = class
  private
    FTotalCount: Integer;
    FPhotos: TList<TftPhotoSize>;
  public
    /// <summary>
    /// Total number of profile pictures the target user has.
    /// </summary>
    property TotalCount: Integer read FTotalCount write FTotalCount;
    /// <summary>
    /// Requested profile pictures (in up to 4 sizes each).
    /// </summary>
    property Photos: TList<TftPhotoSize> read FPhotos write FPhotos;
  end;

  TftChatType = (ftcPrivate, ftcGroup, ftcSupergroup, ftcChannel);

  /// <summary>
  /// This object represents a chat.
  /// </summary>
  TftChat = class
  private
    FId: Int64;
    FType: TftChatType;
    FTitle: String;
    FUsername: String;
    FFirstName: String;
    FLastName: String;
    FIsForum: Boolean;
    FPhoto: TftChatPhoto;
    FActiveUsernames: TList<string>;
    FEmojiStatusCustomEmojiId: String;
    FBio: String;
    FHasPrivateForwards: Boolean;
    FHasRestrictedVoiceAndVideoMessages: Boolean;
    FJoinToSendMessages: Boolean;
    FJoinByRequest: Boolean;
    FDescription: String;
    FInviteLink: String;
    FPinnedMessage: TftMessage;
    FPermissions: TftChatPermissions;
    FSlowModeDelay: Integer;
    FMessageAutoDeleteTime: Integer;
    FHasAggressiveAntiSpamEnabled: Boolean;
    FHasHiddenMembers: Boolean;
    FHasProtectedContent: Boolean;
    FStickerSetName: String;
    FCanSetStickerSet: Boolean;
    FLinkedChatId: Integer;
    FLocation: TftChatLocation;
  public
    /// <summary>
    /// Unique identifier for this chat. This number may have more than 32
    /// significant bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it has at most 52
    /// significant bits, so a signed 64-bit integer or double-precision
    // float type are safe for storing this identifier.
    /// </summary>
    property Id: Int64 read FId write FId;
    /// <summary>
    /// Type of chat, can be either �private�, �group�, �supergroup� or �channel�
    /// </summary>
    property TypeChat: TftChatType read FType write FType;
    /// <summary>
    /// Optional. Title, for supergroups, channels and group chats
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Optional. Username, for private chats, supergroups and channels if available
    /// </summary>
    property UserName: String read FUsername write FUsername;
    /// <summary>
    /// Optional. First name of the other party in a private chat
    /// </summary>
    property FirstName: String read FFirstName write FFirstName;
    /// <summary>
    /// Optional. Last name of the other party in a private chat
    /// </summary>
    property LastName: String read FLastName write FLastName;
    /// <summary>
    /// Optional. True, if the supergroup chat is a forum (has topics enabled)
    /// </summary>
    property IsForum: Boolean read FIsForum write FIsForum;
    /// Optional. Chat photo. Returned only in getChat.
    property Photo: TftChatPhoto read FPhoto write FPhoto;
    /// <summary>
    /// Optional. Bio of the other party in a private chat. Returned only in getChat.
    /// </summary>
    /// <summary>
    /// Optional. If non-empty, the list of all active chat usernames; for private chats, supergroups and channels.
    ///
    /// Returned only in Api::getChat.
    /// </summary>
    property ActiveUsernames: TList<string> read FActiveUsernames
      write FActiveUsernames;
    /// <summary>
    /// Optional. Custom emoji identifier of emoji status of the other party in a private chat.
    ///
    /// Returned only in Api::getChat.
    /// </summary>
    property EmojiStatusCustomEmojiId: String read FEmojiStatusCustomEmojiId
      write FEmojiStatusCustomEmojiId;
    property Bio: String read FBio write FBio;
    /// <summary>
    /// Optional. True, if privacy settings of the other party in the private chat allows to use tg://user?id=<user_id> links only in chats with the user.
    /// Returned only in Api::getChat.
    /// </summary>
    property HasPrivateForwards: Boolean read FHasPrivateForwards
      write FHasPrivateForwards;
    /// <summary>
    /// Optional. True, if the privacy settings of the other party restrict sending voice and video note messages in the private chat.
    /// Returned only in Api::getChat.
    /// </summary>
    property HasRestrictedVoiceAndVideoMessages: Boolean
      read FHasRestrictedVoiceAndVideoMessages
      write FHasRestrictedVoiceAndVideoMessages;
    /// <summary>
    /// Optional. True, if users need to join the supergroup before they can send messages.
    /// Returned only in Api::getChat.
    /// </summary>
    property JoinToSendMessages: Boolean read FJoinToSendMessages
      write FJoinToSendMessages;
    /// <summary>
    /// Optional. True, if all users directly joining the supergroup need to be approved by supergroup administrators.
    /// Returned only in Api::getChat.
    /// </summary>
    property JoinByRequest: Boolean read FJoinByRequest write FJoinByRequest;
    /// <summary>
    /// Optional. Description, for groups, supergroups and channel chats. Returned only in getChat.
    /// </summary>
    property Description: String read FDescription write FDescription;
    /// <summary>
    /// Optional. Primary invite link, for groups, supergroups and channel chats. Returned only in getChat.
    /// </summary>
    property InviteLink: String read FInviteLink write FInviteLink;
    /// <summary>
    /// Optional. The most recent pinned message (by sending date). Returned only in getChat.
    /// </summary>
    property PinnedMessage: TftMessage read FPinnedMessage write FPinnedMessage;
    /// <summary>
    /// Optional. Default chat member permissions, for groups and supergroups. Returned only in getChat.
    /// </summary>
    property Permissions: TftChatPermissions read FPermissions
      write FPermissions;
    /// <summary>
    /// Optional. For supergroups, the minimum allowed delay between
    /// consecutive messages sent by each unpriviledged user.
    /// Returned only in getChat.
    /// </summary>
    property SlowModeDelay: Integer read FSlowModeDelay write FSlowModeDelay;
    /// <summary>
    /// Optional. The time after which all messages sent to the chat will be
    /// automatically deleted; in seconds. Returned only in getChat.
    /// </summary>
    property MessageAutoDeleteTime: Integer read FMessageAutoDeleteTime
      write FMessageAutoDeleteTime;
    /// <summary>
    /// Optional. True, if aggressive anti-spam checks are enabled in the supergroup.
    /// The field is only available to chat administrators.
    /// Returned only in Api::getChat.
    /// </summary>
    property HasAggressiveAntiSpamEnabled: Boolean
      read FHasAggressiveAntiSpamEnabled write FHasAggressiveAntiSpamEnabled;
    /// <summary>
    /// Optional. True, if non-administrators can only get the list of bots and administrators in the chat.
    /// Returned only in Api::getChat.
    /// </summary>
    property HasHiddenMembers: Boolean read FHasHiddenMembers
      write FHasHiddenMembers;
    /// <summary>
    /// Optional. True, if messages from the chat can't be forwarded to other chats.
    /// Returned only in Api::getChat.
    /// </summary>
    property HasProtectedContent: Boolean read FHasProtectedContent
      write FHasProtectedContent;
    /// <summary>
    /// Optional. For supergroups, name of group sticker set. Returned only in getChat.
    /// </summary>
    property StickerSetName: String read FStickerSetName write FStickerSetName;
    /// <summary>
    /// Optional. True, if the bot can change the group sticker set. Returned only in getChat.
    /// </summary>
    property CanSetStickerSet: Boolean read FCanSetStickerSet
      write FCanSetStickerSet;
    /// <summary>
    /// Optional. Unique identifier for the linked chat, i.e. the discussion
    /// group identifier for a channel and vice versa; for supergroups and
    /// channel chats. This identifier may be greater than 32 bits and some
    /// programming languages may have difficulty/silent defects in interpreting
    /// it. But it is smaller than 52 bits, so a signed 64 bit integer or
    /// double-precision float type are safe for storing this identifier.
    /// Returned only in getChat.
    /// </summary>
    property LinkedChatId: Integer read FLinkedChatId write FLinkedChatId;
    /// <summary>
    /// Optional. For supergroups, the location to which the supergroup is connected. Returned only in getChat.
    /// </summary>
    property Location: TftChatLocation read FLocation write FLocation;
  end;

  /// <summary>
  /// Represents an invite link for a chat.
  /// </summary>
  TftChatInviteLink = class
    FInviteLink: String;
    FCreator: TftUser;
    FCreatesJoinRequest: Boolean;
    FIsPrimary: Boolean;
    FIsRevoked: Boolean;
    FName: String;
    FExpireDate: Integer;
    FMemberLimit: Integer;
    FPendingJoinRequestCount: Integer;

  public
    /// <summary>
    /// The invite link.
    /// If the link was created by another chat administrator, then the second part of the link will be replaced with “…”.
    /// </summary>
    property InviteLink: String read FInviteLink write FInviteLink;

    /// <summary>
    /// Creator of the link
    /// </summary>
    property Creator: TftUser read FCreator write FCreator;

    /// <summary>
    /// True, if users joining the chat via the link need to be approved by chat administrators
    /// </summary>
    property CreatesJoinRequest: Boolean read FCreatesJoinRequest
      write FCreatesJoinRequest;

    /// <summary>
    /// True, if the link is primary
    /// </summary>
    property IsPrimary: Boolean read FIsPrimary write FIsPrimary;

    /// <summary>
    /// True, if the link is revoked
    /// </summary>
    property IsRevoked: Boolean read FIsRevoked write FIsRevoked;

    /// <summary>
    /// Optional. Invite link name
    /// </summary>
    property Name: String read FName write FName;

    /// <summary>
    /// Optional. Point in time (Unix timestamp) when the link will expire or has been expired
    /// </summary>
    property ExpireDate: Integer read FExpireDate write FExpireDate;

    /// <summary>
    /// Optional. Maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    /// </summary>
    property MemberLimit: Integer read FMemberLimit write FMemberLimit;

    /// <summary>
    /// Optional. Number of pending join requests created using this link
    /// </summary>
    property PendingJoinRequestCount: Integer read FPendingJoinRequestCount
      write FPendingJoinRequestCount;
  end;

  /// <summary>
  /// Represents a join request sent to a chat.
  /// </summary>
  TftChatJoinRequest = class
    FChat: TftChat;
    FFrom: TftUser;
    FDate: Integer;
    FBio: String;
    FInviteLink: TftChatInviteLink;

  public
    /// <summary>
    /// Chat to which the request was sent
    /// </summary>
    property Chat: TftChat read FChat write FChat;

    /// <summary>
    /// User that sent the join request
    /// </summary>
    property From: TftUser read FFrom write FFrom;

    /// <summary>
    /// Date the request was sent in Unix time
    /// </summary>
    property Date: Integer read FDate write FDate;

    /// <summary>
    /// Optional. Bio of the user.
    /// </summary>
    property Bio: String read FBio write FBio;

    /// <summary>
    /// Optional. Chat invite link that was used by the user to send the join request
    /// </summary>
    property InviteLink: TftChatInviteLink read FInviteLink write FInviteLink;
  end;

  /// <summary>
  /// This object contains information about one member of the chat.
  /// </summary>
  TftChatMember = class
  private
    FUser: TftUser;
    FStatus: String;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Information about the user
    /// </summary>
    property User: TftUser read FUser write FUser;
    /// <summary>
    /// The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
    /// </summary>
    property Status: String read FStatus write FStatus;
  end;

  /// <summary>
  /// Represents a chat member that has some additional privileges.
  /// </summary>
  TftChatMemberAdministrator = class(TftChatMember)
    FCanBeEdited: Boolean;
    FIsAnonymous: Boolean;
    FCanManageChat: Boolean;
    FCanDeleteMessages: Boolean;
    FCanManageVideoChats: Boolean;
    FCanRestrictMembers: Boolean;
    FCanPromoteMembers: Boolean;
    FCanChangeInfo: Boolean;
    FCanInviteUsers: Boolean;
    FCanPostMessages: Boolean;
    FCanEditMessages: Boolean;
    FCanPinMessages: Boolean;
    FCanManageTopics: Boolean;
    FCustomTitle: String;
  public

    property Status;

    /// <summary>
    /// True, if the bot is allowed to edit administrator privileges of that user
    /// </summary>
    property CanBeEdited: Boolean read FCanBeEdited write FCanBeEdited;

    /// <summary>
    /// True, if the user's presence in the chat is hidden
    /// </summary>
    property IsAnonymous: Boolean read FIsAnonymous write FIsAnonymous;

    /// <summary>
    /// True, if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode.
    /// Implied by any other administrator privilege
    /// </summary>
    property CanManageChat: Boolean read FCanManageChat write FCanManageChat;

    /// <summary>
    /// True, if the administrator can delete messages of other users
    /// </summary>
    property CanDeleteMessages: Boolean read FCanDeleteMessages
      write FCanDeleteMessages;

    /// <summary>
    /// rue, if the administrator can manage video chats
    /// </summary>
    property CanManageVideoChats: Boolean read FCanManageVideoChats
      write FCanManageVideoChats;

    /// <summary>
    /// True, if the administrator can restrict, ban or unban chat members
    /// </summary>
    property CanRestriCtMembers: Boolean read FCanRestrictMembers
      write FCanRestrictMembers;

    /// <summary>
    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    /// </summary>
    property CanPromoteMembers: Boolean read FCanPromoteMembers
      write FCanPromoteMembers;

    /// <summary>
    /// True, if the user is allowed to change the chat title, photo and other settings
    /// </summary>
    property CanChangeInfo: Boolean read FCanChangeInfo write FCanChangeInfo;

    /// <summary>
    /// True, if the user is allowed to invite new users to the chat
    /// </summary>
    property CanInviteUsers: Boolean read FCanInviteUsers write FCanInviteUsers;

    /// <summary>
    /// Optional. True, if the administrator can post in the channel; channels only
    /// </summary>
    property CanPostMessages: Boolean read FCanPostMessages
      write FCanPostMessages;

    /// <summary>
    /// Optional. True, if the administrator can edit messages of other users and can pin messages; channels only
    /// </summary>
    property CanEditMessages: Boolean read FCanEditMessages
      write FCanEditMessages;

    /// <summary>
    /// Optional. True, if the user is allowed to pin messages; groups and supergroups only
    /// </summary>
    property CanPinMessages: Boolean read FCanPinMessages write FCanPinMessages;

    /// <summary>
    /// Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
    /// </summary>
    property CanManageTopics: Boolean read FCanManageTopics
      write FCanManageTopics;

    /// <summary>
    /// Optional. Custom title for this user
    /// </summary>
    property CustomTitle: String read FCustomTitle write FCustomTitle;
  end;

  /// <summary>
  /// Represents a chat member that was banned in the chat and can't return to the chat or view chat messages.
  /// </summary>
  TftChatMemberBanned = class(TftChatMember)
    FUntilDate: Integer;
  public
    property Status;
    /// <summary>
    /// Date when restrictions will be lifted for this user; unix time
    /// </summary>
    property UntilDate: Integer read FUntilDate write FUntilDate;
  end;

  /// <summary>
  /// Represents a chat member that isn't currently a member of the chat, but may join it themselves.
  /// </summary>
  TftChatMemberLeft = class(TftChatMember)
  public
    property Status;
  end;

  /// <summary>
  /// Represents a chat member that has no additional privileges or restrictions.
  /// </summary>
  TftChatMemberMember = class(TftChatMember)
  public
    property Status;
  end;

  /// <summary>
  /// Represents a chat member that owns the chat and has all administrator privileges.
  /// </summary>
  TftChatMemberOwner = class(TftChatMember)
  private
    FIsAnonymous: Boolean;
    FCustomTitle: String;
  public
    property Status;

    /// <summary>
    /// True, if the user's presence in the chat is hidden
    /// </summary>
    property IsAnonymous: Boolean read FIsAnonymous write FIsAnonymous;

    /// <summary>
    /// Optional. Custom title for this user
    /// </summary>
    property CustomTitle: String read FCustomTitle write FCustomTitle;
  end;

  /// <summary>
  /// Represents a chat member that is under certain restrictions in the chat.
  /// Supergroups only.
  /// </summary>
  TftChatMemberRestricted = class(TftChatMember)
  private
    FIsMember: Boolean;
    FCanChangeInfo: Boolean;
    FCanInviteUsers: Boolean;
    FCanPinMessages: Boolean;
    FCanManageTopics: Boolean;
    FCanSendMessages: Boolean;
    FCanSendMediaMessages: Boolean;
    FCanSendPolls: Boolean;
    FCanSendOtherMessages: Boolean;
    FCanAddWebPagePreviews: Boolean;
    FUntilDate: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
    /// </summary>
    property Status;
    /// <summary>
    /// Optional. Restricted and kicked only. Date when restrictions will be lifted for this user, unix time.
    /// </summary>
    property UntilDate: Integer read FUntilDate write FUntilDate;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can change the chat title, photo and other settings.
    /// </summary>
    property CanChangeInfo: Boolean read FCanChangeInfo write FCanChangeInfo;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can invite new users to the chat.
    /// </summary>
    property CanInviteUsers: Boolean read FCanInviteUsers write FCanInviteUsers;
    /// <summary>
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can pin messages, supergroups only.
    /// </summary>
    property CanPinMessages: Boolean read FCanPinMessages write FCanPinMessages;
    /// <summary>
    /// Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
    /// </summary>
    property CanManageTopics: Boolean read FCanManageTopics
      write FCanManageTopics;
    /// <summary>
    /// Optional. Restricted only. True, if the user is a member of the chat at the moment of the request.
    /// </summary>
    property IsMember: Boolean read FIsMember write FIsMember;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send text messages, contacts, locations and venues.
    /// </summary>
    property CanSendMessages: Boolean read FCanSendMessages
      write FCanSendMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages.
    /// </summary>
    property CanSendMediaMessages: Boolean read FCanSendMediaMessages
      write FCanSendMediaMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages.
    /// </summary>
    property CanSendOtherMessages: Boolean read FCanSendOtherMessages
      write FCanSendOtherMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages.
    /// </summary>
    property CanSendPolls: Boolean read FCanSendPolls write FCanSendPolls;
    /// <summary>
    /// Optional. Restricted only. True, if user may add web page previews to his messages, implies can_send_media_messages.
    /// </summary>
    property CanAddWebPagePreviews: Boolean read FCanAddWebPagePreviews
      write FCanAddWebPagePreviews;
  end;

  /// <summary>
  /// This object represents changes in the status of a chat member.
  /// </summary>
  TftChatMemberUpdated = class
    FChat: TftChat;
    FFrom: TftUser;
    FDate: Integer;
    FOldChatMember: TftChatMember;
    FNewChatMember: TftChatMember;
    FBio: String;
    FInviteLink: TftChatInviteLink;

  public
    /// <summary>
    /// Chat the user belongs to
    /// </summary>
    property Chat: TftChat read FChat write FChat;

    /// <summary>
    /// Performer of the action, which resulted in the change
    /// </summary>
    property From: TftUser read FFrom write FFrom;

    /// <summary>
    /// Date the change was done in Unix time
    /// </summary>
    property Date: Integer read FDate write FDate;

    /// <summary>
    /// Previous information about the chat member
    /// </summary>
    property OldChatMember: TftChatMember read FOldChatMember
      write FOldChatMember;

    /// <summary>
    /// New information about the chat member
    /// </summary>
    property NewChatMember: TftChatMember read FNewChatMember
      write FNewChatMember;

    /// <summary>
    /// Optional. Chat invite link that was used by the user to send the join request
    /// </summary>
    property InviteLink: TftChatInviteLink read FInviteLink write FInviteLink;
  end;

  /// <summary>
  /// This object represents the contents of a file to be uploaded.
  /// </summary>
  TftInputFile = class
  private
    FData: String;
    FFilePath: String;
    FMimeType: String;
    FFileName: String;
  public
    /// <summary>
    /// Creates new TftInputFile from an existing file.
    /// </summary>
    class function FromFile(const FilePath: String; const MimeType: String)
      : TftInputFile;
    /// <summary>
    /// Contents of a file.
    /// </summary>
    property Data: String read FData write FData;
    /// <summary>
    /// Mime type of a file.
    /// </summary>
    property MimeType: String read FMimeType write FMimeType;
    /// <summary>
    /// File name.
    /// </summary>
    property FileName: String read FFileName write FFileName;
    /// <summary>
    /// File path.
    /// </summary>
    property FilePath: String read FFilePath write FFilePath;
  end;

  TftProximityAlertTriggered = class
  private
    FTraveler: TftUser;
    FWatcher: TftUser;
    FDistance: Integer;
  public
    /// <summary>
    /// User that triggered the alert
    /// </summary>
    property Traveler: TftUser read FTraveler write FTraveler;
    /// <summary>
    /// User that set the alert
    /// </summary>
    property Watcher: TftUser read FWatcher write FWatcher;
    /// <summary>
    /// The distance between the users
    /// </summary>
    property Distance: Integer read FDistance write FDistance;
  end;

  /// <summary>
  /// This object represents a bot name.
  /// https://core.telegram.org/bots/api#botname
  /// </summary>
  TftBotName = class
  private
    FName: String;
  public
    /// <summary>
    /// The bot name.
    /// </summary>
    property Name: String read FName write FName;
  end;

  /// <summary>
  /// This object represents a bot description.
  /// https://core.telegram.org/bots/api#botdescription
  /// </summary>
  TftBotDescription = class
  private
    FDescription: String;
  public
    /// <summary>
    /// The bot description.
    /// </summary>
    property Description: String read FDescription write FDescription;
  end;

  /// <summary>
  /// This object represents a bot short description.
  /// https://core.telegram.org/bots/api#botshortdescription
  /// </summary>
  TftBotShortDescription = class
  private
    FShortDescription: String;
  public
    /// <summary>
    /// The bot short description.
    /// </summary>
    property ShortDescription: String read FShortDescription
      write FShortDescription;
  end;

  /// <summary>
  /// This object represents an amount of Telegram Stars.
  /// https://core.telegram.org/bots/api#staramount
  /// </summary>
  TftStarAmount = class
  private
    FAmount: Int64;
    FNanostarAmount: Integer;
  public
    /// <summary>
    /// The amount of Telegram Stars.
    /// </summary>
    property Amount: Int64 read FAmount write FAmount;
    /// <summary>
    /// Optional. The number of Telegram Stars in a fraction of a Star.
    /// </summary>
    property NanostarAmount: Integer read FNanostarAmount
      write FNanostarAmount;
  end;

  /// <summary>
  /// This object represents a list of profile audios for a user.
  /// https://core.telegram.org/bots/api#userprofileaudios
  /// </summary>
  TftUserProfileAudios = class
  private
    FTotalCount: Integer;
    FAudios: TArray<TftAudio>;
  public
    /// <summary>
    /// Total number of profile audios the target user has.
    /// </summary>
    property TotalCount: Integer read FTotalCount write FTotalCount;
    /// <summary>
    /// Requested profile audios.
    /// </summary>
    property Audios: TArray<TftAudio> read FAudios write FAudios;
  end;

  /// <summary>
  /// This object contains information about a prepared inline message.
  /// https://core.telegram.org/bots/api#preparedinlinemessage
  /// </summary>
  TftPreparedInlineMessage = class
  private
    FId: String;
    FExpirationDate: Integer;
  public
    /// <summary>
    /// Unique identifier of the prepared message.
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Expiration date of the prepared message as a Unix timestamp.
    /// </summary>
    property ExpirationDate: Integer read FExpirationDate
      write FExpirationDate;
  end;

  /// <summary>
  /// This object contains information about a prepared keyboard button.
  /// https://core.telegram.org/bots/api#preparedkeyboardbutton
  /// </summary>
  TftPreparedKeyboardButton = class
  private
    FId: String;
  public
    /// <summary>
    /// Unique identifier of the prepared button.
    /// </summary>
    property Id: String read FId write FId;
  end;

  /// <summary>
  /// This object describes the connection of the bot with a business account.
  /// https://core.telegram.org/bots/api#businessconnection
  /// </summary>
  TftBusinessConnection = class
  private
    FId: String;
    FUser: TftUser;
    FUserChatId: Int64;
    FDate: Integer;
    FCanReply: Boolean;
    FIsEnabled: Boolean;
  public
    /// <summary>
    /// Unique identifier of the business connection.
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Business account user that created the connection.
    /// </summary>
    property User: TftUser read FUser write FUser;
    /// <summary>
    /// Identifier of the private chat with the user.
    /// </summary>
    property UserChatId: Int64 read FUserChatId write FUserChatId;
    /// <summary>
    /// Date the connection was established as a Unix timestamp.
    /// </summary>
    property Date: Integer read FDate write FDate;
    /// <summary>
    /// True, if the bot can reply to messages in the connection.
    /// </summary>
    property CanReply: Boolean read FCanReply write FCanReply;
    /// <summary>
    /// True, if the connection is active.
    /// </summary>
    property IsEnabled: Boolean read FIsEnabled write FIsEnabled;
  end;

  /// <summary>
  /// This object describes the type of a reaction.
  /// https://core.telegram.org/bots/api#reactiontype
  /// </summary>
  TftReactionType = class
  private
    FType: String;
    FEmoji: String;
    FCustomEmojiId: String;
  public
    /// <summary>
    /// Type of the reaction: emoji, custom_emoji or paid.
    /// </summary>
    property Type_S: String read FType write FType;
    /// <summary>
    /// Optional. Reaction emoji for reactions of type emoji.
    /// </summary>
    property Emoji: String read FEmoji write FEmoji;
    /// <summary>
    /// Optional. Custom emoji identifier for reactions of type custom_emoji.
    /// </summary>
    property CustomEmojiId: String read FCustomEmojiId
      write FCustomEmojiId;
  end;

  /// <summary>
  /// This object describes paid media to be sent.
  /// </summary>
  TftInputPaidMedia = class
  private
    FType: String;
    FMedia: String;
  public
    property Type_S: String read FType write FType;
    property Media: String read FMedia write FMedia;
  end;

  TftInputPaidMediaPhoto = class(TftInputPaidMedia)
  public
    constructor Create;
  end;

  TftInputPaidMediaVideo = class(TftInputPaidMedia)
  private
    FThumbnail: String;
    FCover: String;
    FStartTimestamp: Integer;
    FWidth: Integer;
    FHeight: Integer;
    FDuration: Integer;
    FSupportsStreaming: Boolean;
  public
    constructor Create;
    property Thumbnail: String read FThumbnail write FThumbnail;
    property Cover: String read FCover write FCover;
    property StartTimestamp: Integer read FStartTimestamp
      write FStartTimestamp;
    property Width: Integer read FWidth write FWidth;
    property Height: Integer read FHeight write FHeight;
    property Duration: Integer read FDuration write FDuration;
    property SupportsStreaming: Boolean read FSupportsStreaming
      write FSupportsStreaming;
  end;

  TftInputPaidMediaLivePhoto = class(TftInputPaidMedia)
  private
    FPhoto: String;
  public
    constructor Create;
    property Photo: String read FPhoto write FPhoto;
  end;

  TftInputChecklistTask = class
  private
    FId: Integer;
    FText: String;
    FParseMode: String;
    FTextEntities: TftMessageEntityList;
  public
    property Id: Integer read FId write FId;
    property Text: String read FText write FText;
    property ParseMode: String read FParseMode write FParseMode;
    property TextEntities: TftMessageEntityList read FTextEntities
      write FTextEntities;
  end;

  TftInputChecklist = class
  private
    FTitle: String;
    FParseMode: String;
    FTitleEntities: TftMessageEntityList;
    FTasks: TList<TftInputChecklistTask>;
    FOthersCanAddTasks: Boolean;
    FOthersCanMarkTasksAsDone: Boolean;
  public
    property Title: String read FTitle write FTitle;
    property ParseMode: String read FParseMode write FParseMode;
    property TitleEntities: TftMessageEntityList read FTitleEntities
      write FTitleEntities;
    property Tasks: TList<TftInputChecklistTask> read FTasks write FTasks;
    property OthersCanAddTasks: Boolean read FOthersCanAddTasks
      write FOthersCanAddTasks;
    property OthersCanMarkTasksAsDone: Boolean read FOthersCanMarkTasksAsDone
      write FOthersCanMarkTasksAsDone;
  end;

  TftInputSticker = class
  private
    FSticker: String;
    FFormat: String;
    FEmojiList: TArray<String>;
    FMaskPosition: TftMaskPosition;
    FKeywords: TArray<String>;
  public
    property Sticker: String read FSticker write FSticker;
    property Format: String read FFormat write FFormat;
    property EmojiList: TArray<String> read FEmojiList write FEmojiList;
    property MaskPosition: TftMaskPosition read FMaskPosition
      write FMaskPosition;
    property Keywords: TArray<String> read FKeywords write FKeywords;
  end;

  TftInputProfilePhoto = class
  private
    FType: String;
    FPhoto: String;
    FAnimation: String;
    FMainFrameTimestamp: Double;
    FPhotoFile: TftInputFile;
    FAnimationFile: TftInputFile;
  public
    property Type_S: String read FType write FType;
    property Photo: String read FPhoto write FPhoto;
    property Animation: String read FAnimation write FAnimation;
    property MainFrameTimestamp: Double read FMainFrameTimestamp
      write FMainFrameTimestamp;
    property PhotoFile: TftInputFile read FPhotoFile write FPhotoFile;
    property AnimationFile: TftInputFile read FAnimationFile
      write FAnimationFile;
  end;

  TftInputStoryContent = class
  private
    FType: String;
    FPhoto: String;
    FVideo: String;
    FDuration: Double;
    FCoverFrameTimestamp: Double;
    FIsAnimation: Boolean;
    FPhotoFile: TftInputFile;
    FVideoFile: TftInputFile;
  public
    property Type_S: String read FType write FType;
    property Photo: String read FPhoto write FPhoto;
    property Video: String read FVideo write FVideo;
    property Duration: Double read FDuration write FDuration;
    property CoverFrameTimestamp: Double read FCoverFrameTimestamp
      write FCoverFrameTimestamp;
    property IsAnimation: Boolean read FIsAnimation write FIsAnimation;
    property PhotoFile: TftInputFile read FPhotoFile write FPhotoFile;
    property VideoFile: TftInputFile read FVideoFile write FVideoFile;
  end;

  TftStory = class
  private
    FChat: TftChat;
    FId: Integer;
  public
    property Chat: TftChat read FChat write FChat;
    property Id: Integer read FId write FId;
  end;

  TftLinkPreviewOptions = class
  private
    FIsDisabled: Boolean;
    FURL: String;
    FPreferSmallMedia: Boolean;
    FPreferLargeMedia: Boolean;
    FShowAboveText: Boolean;
  public
    property IsDisabled: Boolean read FIsDisabled write FIsDisabled;
    property URL: String read FURL write FURL;
    property PreferSmallMedia: Boolean read FPreferSmallMedia
      write FPreferSmallMedia;
    property PreferLargeMedia: Boolean read FPreferLargeMedia
      write FPreferLargeMedia;
    property ShowAboveText: Boolean read FShowAboveText write FShowAboveText;
  end;

  TftSentGuestMessage = class
  private
    FInlineMessageId: String;
  public
    property InlineMessageId: String read FInlineMessageId
      write FInlineMessageId;
  end;

  TftChatBoostSource = class
  private
    FSource: String;
    FUser: TftUser;
    FGiveawayMessageId: Integer;
    FPrizeStarCount: Integer;
    FIsUnclaimed: Boolean;
  public
    property Source: String read FSource write FSource;
    property User: TftUser read FUser write FUser;
    property GiveawayMessageId: Integer read FGiveawayMessageId
      write FGiveawayMessageId;
    property PrizeStarCount: Integer read FPrizeStarCount
      write FPrizeStarCount;
    property IsUnclaimed: Boolean read FIsUnclaimed write FIsUnclaimed;
  end;

  TftChatBoost = class
  private
    FBoostId: String;
    FAddDate: Integer;
    FExpirationDate: Integer;
    FSource: TftChatBoostSource;
  public
    property BoostId: String read FBoostId write FBoostId;
    property AddDate: Integer read FAddDate write FAddDate;
    property ExpirationDate: Integer read FExpirationDate
      write FExpirationDate;
    property Source: TftChatBoostSource read FSource write FSource;
  end;

  TftUserChatBoosts = class
  private
    FBoosts: TArray<TftChatBoost>;
  public
    property Boosts: TArray<TftChatBoost> read FBoosts write FBoosts;
  end;

  TftBotAccessSettings = class
  private
    FIsAccessRestricted: Boolean;
    FAddedUsers: TArray<TftUser>;
  public
    property IsAccessRestricted: Boolean read FIsAccessRestricted
      write FIsAccessRestricted;
    property AddedUsers: TArray<TftUser> read FAddedUsers write FAddedUsers;
  end;

  TftGiftBackground = class
  private
    FCenterColor: Integer;
    FEdgeColor: Integer;
    FTextColor: Integer;
  public
    property CenterColor: Integer read FCenterColor write FCenterColor;
    property EdgeColor: Integer read FEdgeColor write FEdgeColor;
    property TextColor: Integer read FTextColor write FTextColor;
  end;

  TftGift = class
  private
    FId: String;
    FSticker: TftSticker;
    FStarCount: Integer;
    FUpgradeStarCount: Integer;
    FIsPremium: Boolean;
    FHasColors: Boolean;
    FTotalCount: Integer;
    FRemainingCount: Integer;
    FPersonalTotalCount: Integer;
    FPersonalRemainingCount: Integer;
    FBackground: TftGiftBackground;
    FUniqueGiftVariantCount: Integer;
    FPublisherChat: TftChat;
  public
    property Id: String read FId write FId;
    property Sticker: TftSticker read FSticker write FSticker;
    property StarCount: Integer read FStarCount write FStarCount;
    property UpgradeStarCount: Integer read FUpgradeStarCount
      write FUpgradeStarCount;
    property IsPremium: Boolean read FIsPremium write FIsPremium;
    property HasColors: Boolean read FHasColors write FHasColors;
    property TotalCount: Integer read FTotalCount write FTotalCount;
    property RemainingCount: Integer read FRemainingCount write FRemainingCount;
    property PersonalTotalCount: Integer read FPersonalTotalCount
      write FPersonalTotalCount;
    property PersonalRemainingCount: Integer read FPersonalRemainingCount
      write FPersonalRemainingCount;
    property Background: TftGiftBackground read FBackground
      write FBackground;
    property UniqueGiftVariantCount: Integer read FUniqueGiftVariantCount
      write FUniqueGiftVariantCount;
    property PublisherChat: TftChat read FPublisherChat write FPublisherChat;
  end;

  TftGifts = class
  private
    FGifts: TArray<TftGift>;
  public
    property Gifts: TArray<TftGift> read FGifts write FGifts;
  end;

  TftUniqueGiftModel = class
  private
    FName: String;
    FSticker: TftSticker;
    FRarityPerMille: Integer;
    FRarity: String;
  public
    property Name: String read FName write FName;
    property Sticker: TftSticker read FSticker write FSticker;
    property RarityPerMille: Integer read FRarityPerMille
      write FRarityPerMille;
    property Rarity: String read FRarity write FRarity;
  end;

  TftUniqueGiftSymbol = class
  private
    FName: String;
    FSticker: TftSticker;
    FRarityPerMille: Integer;
  public
    property Name: String read FName write FName;
    property Sticker: TftSticker read FSticker write FSticker;
    property RarityPerMille: Integer read FRarityPerMille
      write FRarityPerMille;
  end;

  TftUniqueGiftBackdropColors = class
  private
    FCenterColor: Integer;
    FEdgeColor: Integer;
    FSymbolColor: Integer;
    FTextColor: Integer;
  public
    property CenterColor: Integer read FCenterColor write FCenterColor;
    property EdgeColor: Integer read FEdgeColor write FEdgeColor;
    property SymbolColor: Integer read FSymbolColor write FSymbolColor;
    property TextColor: Integer read FTextColor write FTextColor;
  end;

  TftUniqueGiftBackdrop = class
  private
    FName: String;
    FColors: TftUniqueGiftBackdropColors;
    FRarityPerMille: Integer;
  public
    property Name: String read FName write FName;
    property Colors: TftUniqueGiftBackdropColors read FColors write FColors;
    property RarityPerMille: Integer read FRarityPerMille
      write FRarityPerMille;
  end;

  TftUniqueGiftColors = class
  private
    FModelCustomEmojiId: String;
    FSymbolCustomEmojiId: String;
    FLightThemeMainColor: Integer;
    FLightThemeOtherColors: TArray<Integer>;
    FDarkThemeMainColor: Integer;
    FDarkThemeOtherColors: TArray<Integer>;
  public
    property ModelCustomEmojiId: String read FModelCustomEmojiId
      write FModelCustomEmojiId;
    property SymbolCustomEmojiId: String read FSymbolCustomEmojiId
      write FSymbolCustomEmojiId;
    property LightThemeMainColor: Integer read FLightThemeMainColor
      write FLightThemeMainColor;
    property LightThemeOtherColors: TArray<Integer> read FLightThemeOtherColors
      write FLightThemeOtherColors;
    property DarkThemeMainColor: Integer read FDarkThemeMainColor
      write FDarkThemeMainColor;
    property DarkThemeOtherColors: TArray<Integer> read FDarkThemeOtherColors
      write FDarkThemeOtherColors;
  end;

  TftUniqueGift = class
  private
    FGiftId: String;
    FBaseName: String;
    FName: String;
    FNumber: Integer;
    FModel: TftUniqueGiftModel;
    FSymbol: TftUniqueGiftSymbol;
    FBackdrop: TftUniqueGiftBackdrop;
    FIsPremium: Boolean;
    FIsBurned: Boolean;
    FIsFromBlockchain: Boolean;
    FColors: TftUniqueGiftColors;
    FPublisherChat: TftChat;
  public
    property GiftId: String read FGiftId write FGiftId;
    property BaseName: String read FBaseName write FBaseName;
    property Name: String read FName write FName;
    property Number: Integer read FNumber write FNumber;
    property Model: TftUniqueGiftModel read FModel write FModel;
    property Symbol: TftUniqueGiftSymbol read FSymbol write FSymbol;
    property Backdrop: TftUniqueGiftBackdrop read FBackdrop write FBackdrop;
    property IsPremium: Boolean read FIsPremium write FIsPremium;
    property IsBurned: Boolean read FIsBurned write FIsBurned;
    property IsFromBlockchain: Boolean read FIsFromBlockchain
      write FIsFromBlockchain;
    property Colors: TftUniqueGiftColors read FColors write FColors;
    property PublisherChat: TftChat read FPublisherChat write FPublisherChat;
  end;

  TftOwnedGift = class
  private
    FType: String;
    FGift: TftGift;
    FUniqueGift: TftUniqueGift;
    FOwnedGiftId: String;
    FSenderUser: TftUser;
    FSendDate: Integer;
    FText: String;
    FIsPrivate: Boolean;
    FIsSaved: Boolean;
    FCanBeUpgraded: Boolean;
    FWasRefunded: Boolean;
    FConvertStarCount: Integer;
    FPrepaidUpgradeStarCount: Integer;
    FIsUpgradeSeparate: Boolean;
    FUniqueGiftNumber: Integer;
    FCanBeTransferred: Boolean;
    FTransferStarCount: Integer;
    FNextTransferDate: Integer;
  public
    property Type_S: String read FType write FType;
    property Gift: TftGift read FGift write FGift;
    property UniqueGift: TftUniqueGift read FUniqueGift write FUniqueGift;
    property OwnedGiftId: String read FOwnedGiftId write FOwnedGiftId;
    property SenderUser: TftUser read FSenderUser write FSenderUser;
    property SendDate: Integer read FSendDate write FSendDate;
    property Text: String read FText write FText;
    property IsPrivate: Boolean read FIsPrivate write FIsPrivate;
    property IsSaved: Boolean read FIsSaved write FIsSaved;
    property CanBeUpgraded: Boolean read FCanBeUpgraded write FCanBeUpgraded;
    property WasRefunded: Boolean read FWasRefunded write FWasRefunded;
    property ConvertStarCount: Integer read FConvertStarCount
      write FConvertStarCount;
    property PrepaidUpgradeStarCount: Integer read FPrepaidUpgradeStarCount
      write FPrepaidUpgradeStarCount;
    property IsUpgradeSeparate: Boolean read FIsUpgradeSeparate
      write FIsUpgradeSeparate;
    property UniqueGiftNumber: Integer read FUniqueGiftNumber
      write FUniqueGiftNumber;
    property CanBeTransferred: Boolean read FCanBeTransferred
      write FCanBeTransferred;
    property TransferStarCount: Integer read FTransferStarCount
      write FTransferStarCount;
    property NextTransferDate: Integer read FNextTransferDate
      write FNextTransferDate;
  end;

  TftOwnedGifts = class
  private
    FTotalCount: Integer;
    FGifts: TArray<TftOwnedGift>;
    FNextOffset: String;
  public
    property TotalCount: Integer read FTotalCount write FTotalCount;
    property Gifts: TArray<TftOwnedGift> read FGifts write FGifts;
    property NextOffset: String read FNextOffset write FNextOffset;
  end;

  TftAcceptedGiftTypes = class
  private
    FUnlimitedGifts: Boolean;
    FLimitedGifts: Boolean;
    FUniqueGifts: Boolean;
    FPremiumSubscription: Boolean;
    FGiftsFromChannels: Boolean;
  public
    property UnlimitedGifts: Boolean read FUnlimitedGifts
      write FUnlimitedGifts;
    property LimitedGifts: Boolean read FLimitedGifts write FLimitedGifts;
    property UniqueGifts: Boolean read FUniqueGifts write FUniqueGifts;
    property PremiumSubscription: Boolean read FPremiumSubscription
      write FPremiumSubscription;
    property GiftsFromChannels: Boolean read FGiftsFromChannels
      write FGiftsFromChannels;
  end;

  TftTransactionPartner = class
  private
    FType: String;
    FUser: TftUser;
    FChat: TftChat;
    FGift: TftGift;
    FInvoicePayload: String;
    FSubscriptionPeriod: Integer;
    FPaidMediaPayload: String;
    FPremiumSubscriptionDuration: Integer;
    FSponsorUser: TftUser;
    FCommissionPerMille: Integer;
    FRequestCount: Integer;
  public
    property Type_S: String read FType write FType;
    property User: TftUser read FUser write FUser;
    property Chat: TftChat read FChat write FChat;
    property Gift: TftGift read FGift write FGift;
    property InvoicePayload: String read FInvoicePayload write FInvoicePayload;
    property SubscriptionPeriod: Integer read FSubscriptionPeriod
      write FSubscriptionPeriod;
    property PaidMediaPayload: String read FPaidMediaPayload
      write FPaidMediaPayload;
    property PremiumSubscriptionDuration: Integer
      read FPremiumSubscriptionDuration write FPremiumSubscriptionDuration;
    property SponsorUser: TftUser read FSponsorUser write FSponsorUser;
    property CommissionPerMille: Integer read FCommissionPerMille
      write FCommissionPerMille;
    property RequestCount: Integer read FRequestCount write FRequestCount;
  end;

  TftStarTransaction = class
  private
    FId: String;
    FAmount: Int64;
    FNanostarAmount: Integer;
    FDate: Integer;
    FSource: TftTransactionPartner;
    FReceiver: TftTransactionPartner;
  public
    property Id: String read FId write FId;
    property Amount: Int64 read FAmount write FAmount;
    property NanostarAmount: Integer read FNanostarAmount
      write FNanostarAmount;
    property Date: Integer read FDate write FDate;
    property Source: TftTransactionPartner read FSource write FSource;
    property Receiver: TftTransactionPartner read FReceiver write FReceiver;
  end;

  TftStarTransactions = class
  private
    FTransactions: TArray<TftStarTransaction>;
  public
    property Transactions: TArray<TftStarTransaction> read FTransactions
      write FTransactions;
  end;

  /// <summary>
  /// Describes a rich message to be sent. For blocks and media the raw JSON
  /// produced by the caller is used, because the rich message block model is
  /// open-ended and evolves with new Bot API versions.
  /// </summary>
  TftRichMessageButton = class;
  TftInputRichBlock = class;

  /// <summary>
  /// Media embedded in a rich message.
  /// </summary>
  TftRichInputMedia = class
  private
    FType: String;
    FMedia: String;
    FMediaFile: TftInputFile;
    FAttachName: String;
  public
    property Type_S: String read FType write FType;
    property Media: String read FMedia write FMedia;
    property MediaFile: TftInputFile read FMediaFile write FMediaFile;
    property AttachName: String read FAttachName write FAttachName;
  end;

  /// <summary>
  /// Rich formatted text. A plain string is represented by an empty Type_S and
  /// Value; a list of child texts by Children; typed entities use Type_S.
  /// </summary>
  TftRichText = class
  private
    FType: String;
    FValue: String;
    FText: TftRichText;
    FChildren: TList<TftRichText>;
    FUser: TftUser;
    FButton: TftRichMessageButton;
    FUnixTime: Integer;
    FDateTimeFormat: String;
    FCustomEmojiId: String;
    FAlternativeText: String;
    FAnchorName: String;
    FReferenceName: String;
  public
    property Type_S: String read FType write FType;
    property Value: String read FValue write FValue;
    property Text: TftRichText read FText write FText;
    property Children: TList<TftRichText> read FChildren write FChildren;
    property User: TftUser read FUser write FUser;
    property Button: TftRichMessageButton read FButton write FButton;
    property UnixTime: Integer read FUnixTime write FUnixTime;
    property DateTimeFormat: String read FDateTimeFormat
      write FDateTimeFormat;
    property CustomEmojiId: String read FCustomEmojiId write FCustomEmojiId;
    property AlternativeText: String read FAlternativeText
      write FAlternativeText;
    property AnchorName: String read FAnchorName write FAnchorName;
    property ReferenceName: String read FReferenceName write FReferenceName;
  end;

  TftRichMessageButton = class
  private
    FText: TftRichText;
    FStyle: String;
    FUrl: String;
    FCallbackData: String;
    FWebAppUrl: String;
    FLoginUrl: String;
    FSwitchInlineQuery: String;
    FSwitchInlineQueryCurrentChat: String;
    FCopyText: String;
  public
    property Text: TftRichText read FText write FText;
    property Style: String read FStyle write FStyle;
    property URL: String read FUrl write FUrl;
    property CallbackData: String read FCallbackData write FCallbackData;
    property WebAppUrl: String read FWebAppUrl write FWebAppUrl;
    property LoginUrl: String read FLoginUrl write FLoginUrl;
    property SwitchInlineQuery: String read FSwitchInlineQuery
      write FSwitchInlineQuery;
    property SwitchInlineQueryCurrentChat: String
      read FSwitchInlineQueryCurrentChat write FSwitchInlineQueryCurrentChat;
    property CopyText: String read FCopyText write FCopyText;
  end;

  TftRichBlockCaption = class
  private
    FText: TftRichText;
    FCredit: TftRichText;
  public
    property Text: TftRichText read FText write FText;
    property Credit: TftRichText read FCredit write FCredit;
  end;

  TftRichBlockTableCell = class
  private
    FText: TftRichText;
    FIsHeader: Boolean;
    FColspan: Integer;
    FRowspan: Integer;
    FAlign: String;
    FValign: String;
  public
    property Text: TftRichText read FText write FText;
    property IsHeader: Boolean read FIsHeader write FIsHeader;
    property Colspan: Integer read FColspan write FColspan;
    property Rowspan: Integer read FRowspan write FRowspan;
    property Align: String read FAlign write FAlign;
    property Valign: String read FValign write FValign;
  end;

  TftInputRichBlockListItem = class
  private
    FBlocks: TList<TftInputRichBlock>;
    FHasCheckbox: Boolean;
    FIsChecked: Boolean;
    FValue: Integer;
    FType: String;
  public
    property Blocks: TList<TftInputRichBlock> read FBlocks write FBlocks;
    property HasCheckbox: Boolean read FHasCheckbox write FHasCheckbox;
    property IsChecked: Boolean read FIsChecked write FIsChecked;
    property Value: Integer read FValue write FValue;
    property Type_S: String read FType write FType;
  end;

  TftInputRichBlock = class
  private
    FType: String;
    FText: TftRichText;
    FBlocks: TList<TftInputRichBlock>;
    FItems: TList<TftInputRichBlockListItem>;
    FCells: TList<TList<TftRichBlockTableCell>>;
    FButtons: TList<TftRichMessageButton>;
    FCaption: TftRichBlockCaption;
    FCredit: TftRichText;
    FMedia: TftRichInputMedia;
    FLocation: TftLocation;
    FExpression: String;
    FName: String;
    FSummary: TftRichText;
    FLanguage: String;
    FAlign: String;
    FSize: Integer;
    FZoom: Integer;
    FWidth: Integer;
    FHeight: Integer;
    FIsBordered: Boolean;
    FIsStriped: Boolean;
    FIsCompact: Boolean;
    FIsOpen: Boolean;
  public
    property Type_S: String read FType write FType;
    property Text: TftRichText read FText write FText;
    property Blocks: TList<TftInputRichBlock> read FBlocks write FBlocks;
    property Items: TList<TftInputRichBlockListItem> read FItems write FItems;
    property Cells: TList<TList<TftRichBlockTableCell>> read FCells
      write FCells;
    property Buttons: TList<TftRichMessageButton> read FButtons
      write FButtons;
    property Caption: TftRichBlockCaption read FCaption write FCaption;
    property Credit: TftRichText read FCredit write FCredit;
    property Media: TftRichInputMedia read FMedia write FMedia;
    property Location: TftLocation read FLocation write FLocation;
    property Expression: String read FExpression write FExpression;
    property Name: String read FName write FName;
    property Summary: TftRichText read FSummary write FSummary;
    property Language: String read FLanguage write FLanguage;
    property Align: String read FAlign write FAlign;
    property Size: Integer read FSize write FSize;
    property Zoom: Integer read FZoom write FZoom;
    property Width: Integer read FWidth write FWidth;
    property Height: Integer read FHeight write FHeight;
    property IsBordered: Boolean read FIsBordered write FIsBordered;
    property IsStriped: Boolean read FIsStriped write FIsStriped;
    property IsCompact: Boolean read FIsCompact write FIsCompact;
    property IsOpen: Boolean read FIsOpen write FIsOpen;
  end;

  TftInputRichMessageMedia = class
  private
    FId: String;
    FMedia: TftRichInputMedia;
  public
    property Id: String read FId write FId;
    property Media: TftRichInputMedia read FMedia write FMedia;
  end;

  TftInputRichMessage = class
  private
    FHtml: String;
    FMarkdown: String;
    FBlocks: TList<TftInputRichBlock>;
    FMedia: TList<TftInputRichMessageMedia>;
    FBlocksJson: String;
    FMediaJson: String;
    FIsRtl: Boolean;
    FSkipEntityDetection: Boolean;
  public
    property Html: String read FHtml write FHtml;
    property Markdown: String read FMarkdown write FMarkdown;
    property Blocks: TList<TftInputRichBlock> read FBlocks write FBlocks;
    property Media: TList<TftInputRichMessageMedia> read FMedia write FMedia;
    /// <summary>Raw JSON array used when Blocks is not assigned.</summary>
    property BlocksJson: String read FBlocksJson write FBlocksJson;
    /// <summary>Raw JSON array used when Media is not assigned.</summary>
    property MediaJson: String read FMediaJson write FMediaJson;
    property IsRtl: Boolean read FIsRtl write FIsRtl;
    property SkipEntityDetection: Boolean read FSkipEntityDetection
      write FSkipEntityDetection;
  end;

  /// <summary>
  /// Describes a service message about the deletion of messages in a connected
  /// business account.
  /// </summary>
  TftBusinessMessagesDeleted = class
  private
    FBusinessConnectionId: String;
    FChat: TftChat;
    FMessageIds: TArray<Integer>;
  public
    property BusinessConnectionId: String read FBusinessConnectionId
      write FBusinessConnectionId;
    property Chat: TftChat read FChat write FChat;
    property MessageIds: TArray<Integer> read FMessageIds write FMessageIds;
  end;

  /// <summary>
  /// Represents a reaction added to a message along with the number of times
  /// it was added.
  /// </summary>
  TftReactionCount = class
  private
    FType: TftReactionType;
    FTotalCount: Integer;
  public
    property Type_S: TftReactionType read FType write FType;
    property TotalCount: Integer read FTotalCount write FTotalCount;
  end;

  /// <summary>
  /// This object represents a change of a reaction on a message performed by
  /// a user.
  /// </summary>
  TftMessageReactionUpdated = class
  private
    FChat: TftChat;
    FMessageId: Integer;
    FUser: TftUser;
    FActorChat: TftChat;
    FDate: Integer;
    FOldReaction: TArray<TftReactionType>;
    FNewReaction: TArray<TftReactionType>;
  public
    property Chat: TftChat read FChat write FChat;
    property MessageId: Integer read FMessageId write FMessageId;
    property User: TftUser read FUser write FUser;
    property ActorChat: TftChat read FActorChat write FActorChat;
    property Date: Integer read FDate write FDate;
    property OldReaction: TArray<TftReactionType> read FOldReaction
      write FOldReaction;
    property NewReaction: TArray<TftReactionType> read FNewReaction
      write FNewReaction;
  end;

  /// <summary>
  /// This object represents reaction changes on a message with anonymous
  /// reactions.
  /// </summary>
  TftMessageReactionCountUpdated = class
  private
    FChat: TftChat;
    FMessageId: Integer;
    FDate: Integer;
    FReactions: TArray<TftReactionCount>;
  public
    property Chat: TftChat read FChat write FChat;
    property MessageId: Integer read FMessageId write FMessageId;
    property Date: Integer read FDate write FDate;
    property Reactions: TArray<TftReactionCount> read FReactions
      write FReactions;
  end;

  /// <summary>
  /// This object represents a chat boost update.
  /// </summary>
  TftChatBoostUpdated = class
  private
    FChat: TftChat;
    FBoost: TftChatBoost;
  public
    property Chat: TftChat read FChat write FChat;
    property Boost: TftChatBoost read FBoost write FBoost;
  end;

  /// <summary>
  /// This object represents a boost removed from a chat.
  /// </summary>
  TftChatBoostRemoved = class
  private
    FChat: TftChat;
    FBoostId: String;
    FRemoveDate: Integer;
    FSource: TftChatBoostSource;
  public
    property Chat: TftChat read FChat write FChat;
    property BoostId: String read FBoostId write FBoostId;
    property RemoveDate: Integer read FRemoveDate write FRemoveDate;
    property Source: TftChatBoostSource read FSource write FSource;
  end;

  /// <summary>
  /// This object contains information about a paid media purchase.
  /// </summary>
  TftPaidMediaPurchased = class
  private
    FFrom: TftUser;
    FPaidMediaPayload: String;
  public
    property From: TftUser read FFrom write FFrom;
    property PaidMediaPayload: String read FPaidMediaPayload
      write FPaidMediaPayload;
  end;

  TftManagedBotUpdated = class
  private
    FUser: TftUser;
    FBot: TftUser;
  public
    property User: TftUser read FUser write FUser;
    property Bot: TftUser read FBot write FBot;
  end;

  TftBotSubscriptionUpdated = class
  private
    FUser: TftUser;
    FInvoicePayload: String;
    FState: String;
  public
    property User: TftUser read FUser write FUser;
    property InvoicePayload: String read FInvoicePayload write FInvoicePayload;
    property State: String read FState write FState;
  end;

  TftMessageGenerationStopped = class
  private
    FChat: TftChat;
    FMessageThreadId: Integer;
    FDraftId: Integer;
  public
    property Chat: TftChat read FChat write FChat;
    property MessageThreadId: Integer read FMessageThreadId
      write FMessageThreadId;
    property DraftId: Integer read FDraftId write FDraftId;
  end;

implementation

{ TftInputPaidMediaPhoto }

constructor TftInputPaidMediaPhoto.Create;
begin
  Type_S := 'photo';
end;

{ TftInputPaidMediaVideo }

constructor TftInputPaidMediaVideo.Create;
begin
  Type_S := 'video';
end;

{ TftInputPaidMediaLivePhoto }

constructor TftInputPaidMediaLivePhoto.Create;
begin
  Type_S := 'live_photo';
end;

{ TftMessageEntity }

constructor TftMessageEntity.Create;
begin
  FUser := TftUser.Create;
end;

destructor TftMessageEntity.Destroy;
begin
  FreeAndNil(FUser);
  inherited;
end;

{ TftUpdate }

constructor TftUpdate.Create;
begin
  FMessage := TftMessage.Create;
  FEditedMessage := TftMessage.Create;
  FChannelPost := TftMessage.Create;
  FEditedChannelPost := TftMessage.Create;
  FInlineQuery := TftInlineQuery.Create;
end;

destructor TftUpdate.Destroy;
begin
  FreeAndNil(FMessage);
  FreeAndNil(FEditedMessage);
  FreeAndNil(FChannelPost);
  FreeAndNil(FEditedChannelPost);
  FreeAndNil(FInlineQuery);
  inherited;
end;

{ TftMessage }

constructor TftMessage.Create;
begin
  FFrom := TftUser.Create;
  FSenderChat := TftChat.Create;
  FChat := TftChat.Create;
  FForwardFrom := TftUser.Create;
  FForwardFromChat := TftChat.Create;
  // FReplyToMessage := TftMessage.Create;
  FViaBot := TftUser.Create;
  // Fentities := TftMessageEntityList.Create;
  FAnimation := TftAnimation.Create;
  FAudio := TftAudio.Create;
  FDocument := TftDocument.Create;
  // Fphoto := TftPhotoSizeList.Create;
  FSticker := TftSticker.Create;
  FVideo := TftVideo.Create;
  FVideoNote := TftVideoNote.Create;
  FVoice := TftVoice.Create;
  // FcaptionEntities := TftMessageEntityList.Create;
  FContact := TftContact.Create;
  FDice := TftDice.Create;
  FGame := TftGame.Create;
  FPoll := TftPoll.Create;
  FVenue := TftVenue.Create;
  FLocation := TftLocation.Create;
  // FNewChatMembers := TftUserList.Create;
  FLeftChatMember := TftUser.Create;
  // FNewChatPhoto := TftPhotoSizeList.Create;
end;

destructor TftMessage.Destroy;
begin
  FreeAndNil(FFrom);
  FreeAndNil(FSenderChat);
  FreeAndNil(FChat);
  FreeAndNil(FForwardFrom);
  FreeAndNil(FForwardFromChat);
  FreeAndNil(FReplyToMessage);
  FreeAndNil(FViaBot);
  // FreeAndNil(Fentities);
  FreeAndNil(FAnimation);
  FreeAndNil(FAudio);
  FreeAndNil(FDocument);
  // FreeAndNil(Fphoto);
  FreeAndNil(FSticker);
  FreeAndNil(FVideo);
  FreeAndNil(FVideoNote);
  FreeAndNil(FVoice);
  // FreeAndNil(FcaptionEntities);
  FreeAndNil(FContact);
  FreeAndNil(FDice);
  FreeAndNil(FGame);
  FreeAndNil(FPoll);
  FreeAndNil(FVenue);
  FreeAndNil(FLocation);
  // FreeAndNil(FNewChatMembers);
  FreeAndNil(FLeftChatMember);
  // FreeAndNil(FNewChatPhoto);
  inherited;
end;

{ TftShippingQuery }

constructor TftShippingQuery.Create;
begin

end;

destructor TftShippingQuery.Destroy;
begin

  inherited;
end;

{ TftPreCheckoutQuery }

constructor TftPreCheckoutQuery.Create;
begin

end;

destructor TftPreCheckoutQuery.Destroy;
begin

  inherited;
end;

{ TftUser }

constructor TftUser.Create;
begin
  FIsBot := false;
end;

{ TftChatMember }

constructor TftChatMember.Create;
begin
  FUser := TftUser.Create;
end;

destructor TftChatMember.Destroy;
begin
  FreeAndNil(FUser);
  inherited;
end;

{ TftChatMemberRestricted }

constructor TftChatMemberRestricted.Create;
begin

end;

destructor TftChatMemberRestricted.Destroy;
begin

  inherited;
end;

{ TftInputFile }

class function TftInputFile.FromFile(const FilePath, MimeType: String)
  : TftInputFile;
begin
  Result := TftInputFile.Create;
  // Result.data := FileTools: : read(filePath);
  Result.FilePath := FilePath;
  Result.MimeType := MimeType;
  Result.FileName := ExtractFileName(FilePath);
end;

end.
