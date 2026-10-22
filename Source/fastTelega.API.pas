/// <summary>
/// fastTelega API
/// Alexander Syrykh
/// </summary>
unit fastTelega.API;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {$IFDEF FPC}Variants{$ELSE}System.Variants{$ENDIF},
  System.Net.Mime,
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  System.JSON,

  {fastTelega}
  fastTelega.Net.HttpClient,
  fastTelega.Parser.TypeParser,
  fastTelega.AvailableTypes,
  fastTelega.JsonMapper,
  fastTelega.AvailableTypes.ftBotCommand,
  fastTelega.AvailableTypes.ftResponseParameters,
  fastTelega.AvailableTypes.ftWebAppData,
  fastTelega.AvailableTypes.ftWebAppInfo,
  fastTelega.AvailableTypes.ftWebhookInfo,
  fastTelega.AvailableTypes.ftInputMedia,
  fastTelega.AvailableTypes.ftInputMediaAnimation,
  fastTelega.AvailableTypes.ftInputMediaAudio,
  fastTelega.AvailableTypes.ftInputMediaDocument,
  fastTelega.AvailableTypes.ftInputMediaPhoto,
  fastTelega.AvailableTypes.ftInputMediaVideo,
  fastTelega.AvailableTypes.ftInlineQueryResult,
  fastTelega.AvailableTypes.ftShippingOption,
  fastTelega.AvailableTypes.ftInputMessageContent,
  fastTelega.AvailableTypes.ftReplyBase,
  fastTelega.AvailableTypes.ftForceReply,
  fastTelega.AvailableTypes.ftKeyboardButton,
  fastTelega.AvailableTypes.ftReplyKeyboardMarkup,
  fastTelega.AvailableTypes.ftReplyKeyboardRemove,
  fastTelega.AvailableTypes.ftInlineKeyboardButton,
  fastTelega.AvailableTypes.ftInlineKeyboardMarkup,
  fastTelega.AvailableTypes.ftLabeledPrice,
  fastTelega.AvailableTypes.ftLocation,
  fastTelega.AvailableTypes.ftMaskPosition,
  fastTelega.AvailableTypes.ftShippingAddress,
  fastTelega.AvailableTypes.ftPhotoSize,
  fastTelega.AvailableTypes.ftInvoice,
  fastTelega.AvailableTypes.ftCallbackGame,
  fastTelega.AvailableTypes.ftPollOption,
  fastTelega.AvailableTypes.ftLoginUrl,
  fastTelega.AvailableTypes.ftVenue,
  fastTelega.AvailableTypes.ftChatLocation,
  fastTelega.AvailableTypes.ftChatPermissions,
  fastTelega.AvailableTypes.ftChatPhoto,
  fastTelega.AvailableTypes.ftStickerSet,
  fastTelega.AvailableTypes.ftSentWebAppMessage,
  fastTelega.AvailableTypes.ftMessageId,
  fastTelega.AvailableTypes.ftForumTopic,
  fastTelega.AvailableTypes.ftMenuButton,
  fastTelega.AvailableTypes.ftFile,
  fastTelega.AvailableTypes.ftSticker,
  fastTelega.AvailableTypes.ftChatAdministratorRights,
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// This class executes telegram api methods.
  /// Telegram docs: <https://core.telegram.org/bots/api#available-methods>
  /// </summary>
  TftAPI = class
  private
    FToken: String;
    FHttpClient: TftHTTPClient;
    FTypeParser: TftTypeParser;
    FUrl: String;

    /// <summary>
    /// Method of sending HTTP request
    /// </summary>
    function SendRequest(const Method: String; args: TObject = nil;
      const MethodType: String = 'GET'): TJSONObject;
    procedure AddOptionalSendArgs(AArgs: TStringList;
      const ABusinessConnectionId: String; ADirectMessagesTopicId: Integer;
      const AMessageEffectId: String; AAllowPaidBroadcast: Boolean;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false); overload;
    procedure AddOptionalSendArgs(AArgs: TMultipartFormData;
      const ABusinessConnectionId: String; ADirectMessagesTopicId: Integer;
      const AMessageEffectId: String; AAllowPaidBroadcast: Boolean;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false); overload;
    /// <summary>
    /// Getting a token
    /// </summary>
    function GetToken: String;
    /// <summary>
    /// Setting a token
    /// </summary>
    procedure SetToken(const Value: String);
  public
    /// <summary>
    /// Constructor of TftAPI class
    /// </summary>
    /// <param name="AToken">
    ///
    /// </param>
    /// <param name="AHttpClient">
    ///
    /// </param>
    /// <param name="AURL">
    ///
    /// </param>
    constructor Create(AToken: String; const AHttpClient: TftHTTPClient;
      const AURL: String);
    /// <summary>
    /// Destructor of TftAPI class
    /// </summary>
    destructor Destroy; override;
    property Token: String read GetToken write SetToken;
    /// <summary>
    /// Use this method to add a new sticker to a set created by the bot.
    ///
    /// You must use exactly one of the fields pngSticker, tgsSticker, or webmSticker.
    /// Animated stickers can be added to animated sticker sets and only to them.
    /// Animated sticker sets can have up to 50 stickers.
    /// Static sticker sets can have up to 120 stickers.
    /// </summary>
    /// <param name="AUserId">
    /// User identifier of sticker set owner
    /// </param>
    /// <param name="AName">
    /// Sticker set name
    /// </param>
    /// <param name="AEmojis">
    /// One or more emoji corresponding to the sticker
    /// </param>
    /// <param name="AMaskPosition">
    /// Optional. A JSON-serialized object for position where the
    /// mask should be placed on faces
    /// </param>
    /// <param name="APngSticker">
    /// Optional. PNG image with the sticker, must be up to 512
    /// kilobytes in size, dimensions must not exceed 512px, and either width
    /// or height must be exactly 512px. Pass a fileId as a String to send a
    /// file that already exists on the Telegram servers, pass an HTTP URL as
    /// a String for Telegram to get a file from the Internet, or upload a new
    /// one using multipart/form-data.
    /// https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ATgsSticker">
    /// Optional. TGS animation with the sticker, uploaded using
    /// multipart/form-data.
    /// See https://core.telegram.org/stickers#animated-sticker-requirements
    /// for technical requirements
    /// </param>
    /// <param name="AWebmSticker">
    /// Optional. WEBM video with the sticker, uploaded using
    /// multipart/form-data.
    /// See https://core.telegram.org/stickers#video-sticker-requirements
    /// for technical requirements
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function AddStickerToSet(AUserId: Int64; const AName: String;
      const AEmojis: String; AMaskPosition: TftMaskPosition = nil;
      APngSticker: TftInputFile = nil; ATgsSticker: TftInputFile = nil;
      AWebmSticker: TftInputFile = nil): Boolean;

    /// <summary>
    /// Use this method to send answers to callback queries sent from inline
    /// keyboards.
    ///
    /// The answer will be displayed to the user as a notification at the top
    /// of the chat screen or as an alert.
    ///
    /// Alternatively, the user can be redirected to the specified Game URL.
    /// For this option to work, you must first create a game for your bot
    /// via @BotFather and accept the terms.
    /// Otherwise, you may use links like t.me/your_bot?start=XXXX that open
    /// your bot with a parameter.
    /// </summary>
    /// <param name="ACallbackQueryId">
    /// Unique identifier for the query to be answered
    /// </param>
    /// <param name="AText">
    /// Optional. Text of the notification. If not specified, nothing
    /// will be shown to the user, 0-200 characters
    /// </param>
    /// <param name="AShowAlert">
    /// Optional. If True, an alert will be shown by the client
    /// instead of a notification at the top of the chat screen. Defaults
    /// to false.
    /// </param>
    /// <param name="AUrl">
    /// Optional. URL that will be opened by the user's client. If you
    /// have created a Game and accepted the conditions via @BotFather,
    /// specify the URL that opens your game - note that this will only
    /// work if the query comes from an InlineKeyboardButton button.
    /// </param>
    /// <param name="ACacheTime">
    /// Optional. The maximum amount of time in seconds that
    /// the result of the callback query may be cached client-side.
    /// Telegram apps will support caching starting in version 3.14.
    /// Defaults to 0.
    /// </param>
    /// <returns>
    /// On success, True is returned.
    /// </returns>
    function AnswerCallbackQuery(const ACallbackQueryId: String;
      const AText: String = ''; AShowAlert: Boolean = false;
      const AURL: String = ''; ACacheTime: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to send answers to an inline query.
    ///
    /// No more than 50 results per query are allowed.
    /// </summary>
    /// <param name="AInlineQueryId">
    /// Unique identifier for the answered query
    /// </param>
    /// <param name="AResults">
    /// A JSON-serialized array of results for the inline query
    /// </param>
    /// <param name="ACacheTime">
    /// Optional. The maximum amount of time in seconds that the result of the inline query may be cached on the server. Defaults to 300.
    /// </param>
    /// <param name="AIsPersonal">
    /// Optional. Pass True if results may be cached on the server side only for the user that sent the query. By default, results may be returned to any user who sends the same query
    /// </param>
    /// <param name="ANextOffset">
    /// Optional. Pass the offset that a client should send in the next query with the same text to receive more results. Pass an empty string if there are no more results or if you don't support pagination. Offset length can't exceed 64 bytes.
    /// </param>
    /// <param name="ASwitchPmText">
    /// Optional. If passed, clients will display a button with specified text that switches the user to a private chat with the bot and sends the bot a start message with the parameter switchPmParameter
    /// </param>
    /// <param name="ASwitchPmParameter">
    /// Optional. Deep-linking parameter for the /start message sent to the bot when user presses the switch button. 1-64 characters, only A-Z, a-z, 0-9, _ and - are allowed. Example: An inline bot that sends YouTube videos can ask the user to connect the bot to their YouTube account to adapt search results accordingly. To do this, it displays a 'Connect your YouTube account' button above the results, or even before showing any. The user presses the button, switches to a private chat with the bot and, in doing so, passes a start parameter that instructs the bot to return an OAuth link. Once done, the bot can offer an InlineKeyboardMarkup button so that the user can easily return to the chat where they wanted to use the bot's inline capabilities.     *
    /// </param>
    /// <returns>
    /// On success, True is returned.
    /// </returns>
    function AnswerInlineQuery(const AInlineQueryId: String;
      const AResults: TList<TftInlineQueryResult>; ACacheTime: Integer;
      AIsPersonal: Boolean; const ANextOffset: String;
      const ASwitchPmText: String; const ASwitchPmParameter: String): Boolean;

    /// <summary>
    /// Use this method to respond to such pre-checkout queries.
    /// Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field preCheckoutQuery.
    /// Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
    /// </summary>
    /// <param name="APreCheckoutQueryId">
    /// Unique identifier for the query to be answered
    /// </param>
    /// <param name="AOk">
    /// Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
    /// </param>
    /// <param name="AErrorMessage">
    /// Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
    /// </param>
    /// <returns>
    /// On success, True is returned.
    /// </returns>
    function AnswerPreCheckoutQuery(const APreCheckoutQueryId: String;
      AOk: Boolean; const AErrorMessage: String = ''): Boolean;

    /// <summary>
    /// Use this method to reply to shipping queries.
    /// If you sent an invoice requesting a shipping address and the parameter isFlexible was specified, the Bot API will send an Update with a shipping_query field to the bot.
    /// </summary>
    /// <param name="AShippingQueryId">
    /// Unique identifier for the query to be answered.
    /// </param>
    /// <param name="AOk">
    /// Specify True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
    /// </param>
    /// <param name="AShippingOptions">
    /// Optional. Required if ok is True. A JSON-serialized array of available shipping options.
    /// </param>
    /// <param name="AErrorMessage">
    /// Optional. Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. "Sorry, delivery to your desired address is unavailable'). Telegram will display this message to the user.
    /// </param>
    /// <returns>
    /// On success, True is returned.
    /// </returns>
    function AnswerShippingQuery(AShippingQueryId: String; AOk: Boolean;
      AShippingOptions: TList < TftShippingOption >= nil;
      AErrorMessage: String = ''): Boolean;

    /// <summary>
    /// Use this method to set the result of an interaction with a Web App and
    /// send a corresponding message on behalf of the user to the chat from which the query originated.     *
    /// </summary>
    /// <param name="AWebAppQueryId">
    /// Unique identifier for the query to be answered
    /// </param>
    /// <param name="AResult">
    /// A JSON-serialized object describing the message to be sent
    /// </param>
    /// <returns>
    /// On success, a SentWebAppMessage object is returned.
    /// </returns>
    function AnswerWebAppQuery(const AWebAppQueryId: String;
      AResult: TftInlineQueryResult): TftSentWebAppMessage;

    /// <summary>
    /// Use this method to approve a chat join request.
    /// The bot must be an administrator in the chat for this to work and must have the canInviteUsers administrator right.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function ApproveChatJoinRequest(AChatId: Int64; AUserId: Int64): Boolean;

    /// <summary>
    /// Use this method to ban a user in a group, a supergroup or a channel.
    /// In the case of supergroups and channels, the user will not be able to return to the chat on their own using invite links, etc., unless unbanned first.     * The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <param name="AUntilDate">
    /// Optional. Date when the user will be unbanned, unix time. If user is banned for more than 366 days or less than 30 seconds from the current time they are considered to be banned forever. Applied for supergroups and channels only.
    /// </param>
    /// <param name="ARevokeMessages">
    /// Optional. Pass True to delete all messages from the chat for the user that is being removed. If False, the user will be able to see messages in the group that were sent before the user was removed. Always True for supergroups and channels.     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function BanChatMember(AChatId: Int64; AUserId: Int64; AUntilDate: Integer;
      ARevokeMessages: Boolean): Boolean;

    /// <summary>
    /// Use this method to ban a channel chat in a supergroup or a channel.
    /// Until the chat is unbanned, the owner of the banned chat won't be able to send messages on behalf of any of their channels.     * The bot must be an administrator in the supergroup or channel for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ASenderChatId">
    /// Unique identifier of the target sender chat
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function BanChatSenderChat(AChatId: Int64; ASenderChatId: Int64): Boolean;

    /// <summary>
    /// Check if user has blocked the bot
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat
    /// </param>
    /// <returns>
    /// Returns True if bot is blocked by user
    /// </returns>
    function BlockedByUser(AChatId: Int64): Boolean;

    /// <summary>
    /// Use this method to close the bot instance before moving it from one local server to another.
    ///
    /// You need to delete the webhook before calling this method to ensure that the bot isn't launched again after server restart.
    /// The method will return error 429 in the first 10 minutes after the bot is launched.
    /// Requires no parameters.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function Close(): Boolean;

    /// <summary>
    /// Use this method to close an open topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights, unless it is the creator of the topic.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AMessageThreadId">
    /// Unique identifier for the target message thread of the forum topic
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function CloseForumTopic(AChatId: Int64; AMessageThreadId: Integer)
      : Boolean;

    /// <summary>
    /// Use this method to close an open 'General' topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function CloseGeneralForumTopic(AChatId: Int64): Boolean;

    /// <summary>
    /// Use this method to copy messages of any kind.
    ///
    /// Service messages and invoice messages can't be copied.
    /// A quiz poll can be copied only if the value of the field correctOptionId is known to the bot.
    /// The method is analogous to the method Api::forwardMessage, but the copied message doesn't have a link to the original message.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AFromChatId">
    /// Unique identifier for the chat where the original message was sent (or channel username in the format @channelusername)
    /// </param>
    /// <param name="AMessageId">
    /// Message identifier in the chat specified in fromChatId
    /// </param>
    /// <param name="ACaption">
    /// Optional. New caption for media, 0-1024 characters after entities parsing. If not specified, the original caption is kept
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the new caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the new caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// Returns the TftMessageId of the sent message on success.
    /// </returns>
    function CopyMessage(AChatId: Int64; AFromChatId: Int64;
      AMessageId: Integer; const ACaption: String; const AParseMode: String;
      const ACaptionEntities: TList<TftMessageEntity>;
      ADisableNotification: Boolean; AReplyToMessageId: Integer;
      AAllowSendingWithoutReply: Boolean; AReplyMarkup: TftReplyBase;
      AProtectContent: Boolean; AMessageThreadId: Integer): TftMessageId;

    /// <summary>
    /// Use this method to create an additional invite link for a chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.
    /// The link can be revoked using the method Api::revokeChatInviteLink.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AExpireDate">
    /// Optional. Point in time (Unix timestamp) when the link will expire
    /// </param>
    /// <param name="AMemberLimit">
    /// Optional. The maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    /// </param>
    /// <param name="AName">
    /// Optional. Invite link name; 0-32 characters
    /// </param>
    /// <param name="ACreatesJoinRequest">
    /// Optional. True, if users joining the chat via the link need to be approved by chat administrators. If True, memberLimit can't be specified     *
    /// </param>
    /// <returns>
    /// Returns the new invite link as ChatInviteLink object.
    /// </returns>
    function CreateChatInviteLink(AChatId: Int64; AExpireDate: Integer;
      AMemberLimit: Integer; AName: String; ACreatesJoinRequest: Boolean)
      : TftChatInviteLink;

    /// <summary>
    /// Use this method to create a topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AName">
    /// Topic name, 1-128 characters
    /// </param>
    /// <param name="AIconColor">
    /// Optional. Color of the topic icon in RGB format. Currently, must be one of 0x6FB9F0, 0xFFD67E, 0xCB86DB, 0x8EEE98, 0xFF93B2, or 0xFB6F5F
    /// </param>
    /// <param name="AIconCustomEmojiId">
    /// Optional. Unique identifier of the custom emoji shown as the topic icon. Use Api::getForumTopicIconStickers to get all allowed custom emoji identifiers.     *
    /// </param>
    /// <returns>
    /// Returns information about the created topic as a ForumTopic object.
    /// </returns>
    function CreateForumTopic(AChatId: Int64; AName: String;
      AIconColor: Integer; AIconCustomEmojiId: String): TftForumTopic;

    /// <summary>
    /// Use this method to create a link for an invoice.
    /// </summary>
    /// <param name="ATitle">
    /// Product name, 1-32 characters
    /// </param>
    /// <param name="ADescription">
    /// Product description, 1-255 characters
    /// </param>
    /// <param name="APayload">
    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
    /// </param>
    /// <param name="AProviderToken">
    /// Payment provider token, obtained via BotFather
    /// </param>
    /// <param name="ACurrency">
    /// Three-letter ISO 4217 currency code, see https://core.telegram.org/bots/payments#supported-currencies
    /// </param>
    /// <param name="APrices">
    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
    /// </param>
    /// <param name="AMaxTipAmount">
    /// Optional. The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double). For example, for a maximum tip of US$ 1.45 pass maxTipAmount = 145. See the exp parameter in https://core.telegram.org/bots/payments/currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies). Defaults to 0
    /// </param>
    /// <param name="ASuggestedTipAmounts">
    /// Optional. A JSON-serialized array of suggested amounts of tips in the smallest units of the currency (integer, not float/double). At most 4 suggested tip amounts can be specified. The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed maxTipAmount.
    /// </param>
    /// <param name="AProviderData">
    /// Optional. JSON-serialized data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    /// </param>
    /// <param name="APhotoUrl">
    /// Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service.
    /// </param>
    /// <param name="APhotoSize">
    /// Optional. Photo size in bytes
    /// </param>
    /// <param name="APhotoWidth">
    /// Optional. Photo width
    /// </param>
    /// <param name="APhotoHeight">
    /// Optional. Photo height
    /// </param>
    /// <param name="ANeedName">
    /// Optional. Pass True, if you require the user's full name to complete the order
    /// </param>
    /// <param name="ANeedPhoneNumber">
    /// Optional. Pass True, if you require the user's phone number to complete the order
    /// </param>
    /// <param name="ANeedEmail">
    /// Optional. Pass True, if you require the user's email address to complete the order
    /// </param>
    /// <param name="ANeedShippingAddress">
    /// Optional. Pass True, if you require the user's shipping address to complete the order
    /// </param>
    /// <param name="ASendPhoneNumberToProvider">
    /// Optional. Pass True, if the user's phone number should be sent to the provider
    /// </param>
    /// <param name="ASendEmailToProvider">
    /// Optional. Pass True, if the user's email address should be sent to the provider
    /// </param>
    /// <param name="AIsFlexible">
    /// Optional. Pass True, if the final price depends on the shipping method     *
    /// </param>
    /// <returns>
    /// Returns the created invoice link as String on success.
    /// </returns>
    function CreateInvoiceLink(const ATitle: String; const ADescription: String;
      const APayload: String; const AProviderToken: String;
      const ACurrency: String; const APrices: TList<TftLabeledPrice>;
      AMaxTipAmount: Integer; const ASuggestedTipAmounts: TList<Integer>;
      const AProviderData: String; const APhotoUrl: String; APhotoSize: Integer;
      APhotoWidth: Integer; APhotoHeight: Integer; ANeedName: Boolean;
      ANeedPhoneNumber: Boolean; ANeedEmail: Boolean;
      ANeedShippingAddress: Boolean; ASendPhoneNumberToProvider: Boolean;
      ASendEmailToProvider: Boolean; AIsFlexible: Boolean): String;

    /// <summary>
    /// Use this method to create a new sticker set owned by a user.
    ///
    /// The bot will be able to edit the sticker set thus created.
    /// You must use exactly one of the fields pngSticker, tgsSticker, or webmSticker.     *
    /// </summary>
    /// <param name="AUserId">
    /// User identifier of created sticker set owner
    /// </param>
    /// <param name="AName">
    /// Short name of sticker set, to be used in t.me/addstickers/ URLs (e.g., animals). Can contain only English letters, digits and underscores. Must begin with a letter, can't contain consecutive underscores and must end in "_by_<bot_username>". <bot_username> is case insensitive. 1-64 characters.
    /// </param>
    /// <param name="ATitle">
    /// Sticker set title, 1-64 characters
    /// </param>
    /// <param name="AEmojis">
    /// One or more emoji corresponding to the sticker
    /// </param>
    /// <param name="AMaskPosition">
    /// Optional. A JSON-serialized object for position where the mask should be placed on faces
    /// </param>
    /// <param name="APngSticker">
    /// Optional. PNG image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. Pass a fileId as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ATgsSticker">
    /// Optional. TGS animation with the sticker, uploaded using multipart/form-data. See https://core.telegram.org/stickers#animated-sticker-requirements for technical requirements
    /// </param>
    /// <param name="AWebmSticker">
    /// Optional. WEBM video with the sticker, uploaded using multipart/form-data. See https://core.telegram.org/stickers#video-sticker-requirements for technical requirements
    /// </param>
    /// <param name="AStickerType">
    /// Optional. Type of stickers in the set, pass “regular” or “mask”. Custom emoji sticker sets can't be created via the Bot API at the moment. By default, a regular sticker set is created.     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function CreateNewStickerSet(AUserId: Int64; const AName: String;
      const ATitle: String; const AEmojis: String;
      AMaskPosition: TftMaskPosition; APngSticker: TftInputFile;
      ATgsSticker: TftInputFile; AWebmSticker: TftInputFile;
      AStickerType: String): Boolean;

    /// <summary>
    /// Use this method to decline a chat join request.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canInviteUsers administrator right.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <returns>
    /// True on success.
    /// </returns>
    function DeclineChatJoinRequest(AChatId: Int64; AUserId: Int64): Boolean;

    /// <summary>
    /// Use this method to delete a chat photo.
    ///
    /// Photos can't be changed for private chats.     * The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteChatPhoto(AChatId: Int64): Boolean;

    /// <summary>
    /// Use this method to delete a group sticker set from a supergroup.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     * Use the field canSetSticker_set optionally returned in Api::getChat requests to check if the bot can use this method.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteChatStickerSet(AChatId: Int64): Boolean;

    /// <summary>
    /// Use this method to delete a forum topic along with all its messages in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canDeleteMessages administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AMessageThreadId">
    /// Unique identifier for the target message thread of the forum topic     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteForumTopic(AChatId: Int64;
      AMessageThreadId: Integer): Boolean;

    /// <summary>
    /// Use this method to delete messages sent by bot (or by other users if bot is admin).
    /// </summary>
    /// <param name="AChatId">
    /// identifier for the target chat or username of the target channel.
    /// </param>
    /// <param name="AMessageId">
    /// identifier for the target message.
    /// </param>
    function DeleteMessage(AChatId: Variant; AMessageId: Integer): Boolean;

    /// <summary>
    /// Use this method to delete the list of the bot's commands for the given scope and user language.
    ///
    /// After deletion, higher level commands will be shown to affected users.     *
    /// </summary>
    /// <param name="AScope">
    /// Optional. A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    /// </param>
    /// <param name="ALanguageCode">
    /// Optional. A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteMyCommands(AScope: TftBotCommandScope;
      const ALanguageCode: String): Boolean;
    function DeleteStickerFromSet(ASticker: String): Boolean;

    /// <summary>
    /// Use this method to remove webhook integration if you decide to switch back to GetUpdates.     *
    /// </summary>
    /// <param name="ADropPendingUpdates">
    /// Optional. Pass True to drop all pending updates
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteWebhook(ADropPendingUpdates: Boolean = false): Boolean;

    /// <summary>
    /// Downloads file from Telegram and saves it in memory.
    /// </summary>
    /// <param name="AFilePath">
    /// Telegram file path.
    /// </param>
    /// <param name="AArgs">
    /// Additional api parameters.
    /// </param>
    /// <returns>
    /// File contents in a string.
    /// </returns>
    function DownloadFile(const AFilePath: String;
      const AArgs: TStringList): String;

    /// <summary>
    /// Use this method to edit a non-primary invite link created by the bot.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AInviteLink">
    /// The invite link to edit
    /// </param>
    /// <param name="AExpireDate">
    /// Optional. Point in time (Unix timestamp) when the link will expire
    /// </param>
    /// <param name="AMemberLimit">
    /// Optional. Maximum number of users that can be members of the chat simultaneously after joining the chat via this invite link; 1-99999
    /// </param>
    /// <param name="AName">
    /// Optional. Invite link name; 0-32 characters
    /// </param>
    /// <param name="ACreatesJoinRequest">
    /// Optional. True, if users joining the chat via the link need to be approved by chat administrators. If True, memberLimit can't be specified     *
    /// </param>
    /// <returns>
    /// Returns the edited invite link as a ChatInviteLink object.
    /// </returns>
    function EditChatInviteLink(AChatId: Int64; const AInviteLink: String;
      AExpireDate: Integer = 0; AMemberLimit: Integer = 0;
      const AName: String = ''; ACreatesJoinRequest: Boolean = false)
      : TftChatInviteLink;

    /// <summary>
    /// Use this method to edit name and icon of a topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have canManageTopics administrator rights, unless it is the creator of the topic.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AMessageThreadId">
    /// Unique identifier for the target message thread of the forum topic
    /// </param>
    /// <param name="AName">
    /// Optional. New topic name, 0-128 characters. If not specified or empty, the current name of the topic will be kept
    /// </param>
    /// <param name="AIconCustomEmojiId">
    /// Optional. New unique identifier of the custom emoji shown as the topic icon. Use Api::getForumTopicIconStickers to get all allowed custom emoji identifiers. Pass an empty string to remove the icon. If not specified, the current icon will be kept     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function EditForumTopic(AChatId: Int64; AMessageThreadId: Integer;
      AName: String = ''; AIconCustomEmojiId: Int8 = 0): Boolean;

    /// <summary>
    /// Use this method to edit the name of the 'General' topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have canManageTopics administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AName">
    /// New topic name, 1-128 characters
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function EditGeneralForumTopic(AChatId: Int64; AName: String): Boolean;

    /// <summary>
    /// Use this method to edit captions of messages sent by the bot or via the bot (for inline bots).
    /// </summary>
    /// <param name="AChatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="AMessageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="ACaption">
    /// Optional New caption of the message
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the message caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. List of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <returns>
    /// Message object on success, otherwise nullptr
    /// </returns>
    function EditMessageCaption(AChatId: Variant; AMessageId: Integer;
      ACaption: String; const AInlineMessageId: String;
      AReplyMarkup: TftReplyBase; AParseMode: String;
      ACaptionEntities: TftMessageEntityList): TftMessage;

    /// <summary>
    /// Use this method to edit live location messages.
    ///
    /// A location can be edited until its livePeriod expires or editing is explicitly disabled by a call to Api::stopMessageLiveLocation.     *
    /// </summary>
    /// <param name="ALatitude">
    /// Latitude of new location
    /// </param>
    /// <param name="ALongitude">
    /// Longitude of new location
    /// </param>
    /// <param name="AChatId">
    /// Optional. Required if inlineMessageId is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AMessageId">
    /// Optional. Required if inlineMessageId is not specified. Identifier of the message to edit
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional. Required if chatId and messageId are not specified. Identifier of the inline message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. A JSON-serialized object for a new inline keyboard.
    /// </param>
    /// <param name="AHorizontalAccuracy">
    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    /// </param>
    /// <param name="AHeading">
    /// Optional. Direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    /// </param>
    /// <param name="AProximityAlertRadius">
    /// Optional. The maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.     *
    /// </param>
    /// <returns>
    /// On success, the edited Message is returned.
    /// </returns>
    function EditMessageLiveLocation(ALatitude: Double; ALongitude: Double;
      AChatId: Variant; AMessageId: Integer; const AInlineMessageId: String;
      AReplyMarkup: TftInlineKeyboardMarkup; AHorizontalAccuracy: Double;
      AHeading: Integer; AProximityAlertRadius: Integer): TftMessage;

    /// <summary>
    /// Use this method to edit only the reply markup of messages sent by the bot or via the bot (for inline bots).
    /// </summary>
    /// <param name="AChatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="AMessageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// Message object on success, otherwise nullptr
    /// </returns>
    function EditMessageMedia(AMedia: TftInputMedia; AChatId: Integer;
      AMessageId: Integer; ACaption: String; const AInlineMessageId: String;
      AReplyMarkup: TftReplyBase = nil): TftMessage;

    /// <summary>
    /// Use this method to edit audio, document, photo, or video messages.
    /// If a message is a part of a message album, then it can be edited only to a photo or a video.
    /// Otherwise, message type can be changed arbitrarily. When inline message is edited, new file can't be uploaded.
    /// Use previously uploaded file via its file_id or specify a URL.
    /// </summary>
    /// <param name="media">
    /// A JSON-serialized object for a new media content of the message.
    /// </param>
    /// <param name="AChatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="AMessageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// On success, if the edited message was sent by the bot, the edited Message is returned, otherwise nullptr is returned.
    /// </returns>
    function EditMessageReplyMarkup(AChatId: Variant; AMessageId: Integer;
      const AInlineMessageId: String; AReplyMarkup: TftReplyBase = nil)
      : TftMessage;

    /// <summary>
    /// Use this method to edit text and game messages sent by the bot or via the bot (for inline bots)
    /// </summary>
    /// <param name="AText">
    /// New text of the message
    /// </param>
    /// <param name="AChatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="AMessageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="AParseMode">
    /// Optional	Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </param>
    /// <param name="disableWebPagePreview">
    /// Optional	Disables link previews for links in this message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// Message object on success, otherwise nullptr
    /// </returns>
    function EditMessageText(const AText: String; AChatId: Integer = 0;
      AMessageId: Integer = 0; const AInlineMessageId: String = '';
      const AParseMode: String = ''; ADisableWebPagePreview: Boolean = false;
      AReplyMarkup: TftReplyBase = nil): TftMessage;

    /// <summary>
    /// Use this method to generate a new primary invite link for a chat; any previously generated primary link is revoked.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.
    ///
    /// Each administrator in a chat generates their own invite links.
    /// Bots can't use invite links generated by other administrators.
    /// If you want your bot to work with invite links, it will need to generate its own link using Api::exportChatInviteLink or by calling the Api::getChat method.
    /// If your bot needs to generate a new primary invite link replacing its previous one, use Api::exportChatInviteLink again.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <returns>
    /// Returns the new invite link as String on success.
    /// </returns>

    function ExportChatInviteLink(AChatId: Variant): String;

    /// <summary>
    /// Use this method to forward messages of any kind.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="AFromChatId">
    /// Unique identifier for the chat where the original message was sent � User or GroupChat id.
    /// </param>
    /// <param name="AMessageId">
    /// Unique message identifier.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function ForwardMessage(AChatId: Int64; AFromChatId: Int64;
      AMessageId: Integer; ADisableNotification: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0)
      : TftMessage;

    /// <summary>
    /// Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.).
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    /// </param>
    /// <returns>
    /// Returns a Chat object on success.
    /// </returns>
    function GetChat(AChatId: Variant): TftChat;

    /// <summary>
    /// Use this method to get a list of administrators in a chat, which aren't bots.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    /// </param>
    /// <returns>
    /// Returns an Array of ChatMember objects.
    /// </returns>
    function GetChatAdministrators(AChatId: Variant): TList<TftChatMember>;

    /// <summary>
    /// Use this method to get the number of members in a chat.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    /// </param>
    /// <returns>
    /// Returns Int on success.
    /// </returns>
    function GetChatMember(AChatId: Variant; AUserId: Int64): TftChatMember;

    /// <summary>
    /// Use this method to get the number of members in a chat.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)
    /// </param>
    /// <returns>
    /// Returns Int on success.
    /// </returns>
    function GetChatMemberCount(AChatId: Variant): Integer;

    /// <summary>
    /// Use this method to get the current value of the bot's menu button in a private chat, or the default menu button.
    /// </summary>
    /// <param name="AChatId">
    /// Optional. Unique identifier for the target private chat. If not specified, default bot's menu button will be returned
    /// </param>
    /// <returns>
    /// Returns MenuButton on success.
    /// </returns>
    function GetChatMenuButton(AChatId: Variant): TftMenuButton;

    /// <summary>
    /// Use this method to get basic information about a file and prepare it for downloading.
    ///
    /// For the moment, bots can download files of up to 20MB in size.
    /// The file can then be downloaded via Api::downloadFile, where filePath is taken from the response.
    /// It is guaranteed that the filePath will be valid for at least 1 hour.
    /// When the link expires, a new one can be requested by calling Api::getFile again.
    ///
    /// This function may not preserve the original file name and MIME type.
    /// You should save the file's MIME type and name (if available) when the File object is received.     *
    /// </summary>
    /// <param name="AFileId">
    /// File identifier to get information about
    /// </param>
    /// <returns>
    /// On success, a File object is returned.
    /// </returns>
    function GetFile(AFileId: String): TftFile;

    /// <summary>
    /// Use this method to get custom emoji stickers, which can be used as a forum topic icon by any user.
    /// </summary>
    /// <returns>
    /// Returns an Array of Sticker objects.
    /// </returns>
    function GetForumTopicIconStickers(): TList<TftSticker>;

    /// <summary>
    /// Use this method to get data for high score tables.
    ///
    /// Will return the score of the specified user and several of their neighbors in a game.
    ///
    /// This method will currently return scores for the target user, plus two of their closest neighbors on each side.
    /// Will also return the top three users if the user and their neighbors are not among them.
    /// Please note that this behavior is subject to change.
    /// </summary>
    /// <param name="AUserId">
    /// Target user id
    /// </param>
    /// <param name="AChatId">
    /// Optional. Required if inlineMessageId is not specified. Unique identifier for the target chat
    /// </param>
    /// <param name="AMessageId">
    /// Optional. Required if inlineMessageId is not specified. Identifier of the sent message
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional. Required if chatId and messageId are not specified. Identifier of the inline message     *
    /// </param>
    /// <returns>
    /// Returns an Array of GameHighScore objects.
    /// </returns>
    function GetGameHighScores(AUserId: Int64; AChatId: Int64;
      AMessageId: Integer; const AInlineMessageId: String)
      : TList<TftGameHighScore>;

    /// <summary>
    /// A simple method for testing your bot's auth token.
    /// </summary>
    /// <returns>
    /// Basic information about the bot in form of a User object.
    /// </returns>
    function GetMe(): TftUser;

    /// <summary>
    /// Use this method to get the current list of the bot's commands for the given scope and user language.     *
    /// </summary>
    /// <param name="AScope">
    /// Optional. A JSON-serialized object, describing scope of users. Defaults to BotCommandScopeDefault.
    /// </param>
    /// <param name="ALanguageCode">
    /// Optional. A two-letter ISO 639-1 language code or an empty string     *
    /// </param>
    /// <returns>
    /// Returns an Array of BotCommand objects. If commands aren't set, an empty list is returned.
    /// </returns>
    function GetMyCommands(AScope: TftBotCommandScope;
      const ALanguageCode: String): TArray<TftBotCommand>;

    /// <summary>
    /// Use this method to get the current default administrator rights of the bot.     *
    /// </summary>
    /// <param name="AForChannels">
    /// Optional. Pass True to get default administrator rights of the bot in channels. Otherwise, default administrator rights of the bot for groups and supergroups will be returned.     *
    /// </param>
    /// <returns>
    /// Returns ChatAdministratorRights on success.
    /// </returns>
    function GetMyDefaultAdministratorRights(AForChannels: Boolean)
      : TftChatAdministratorRights;

    /// <summary>
    /// Use this method to get a sticker set.
    /// </summary>
    /// <param name="AChatId">
    /// Name of the sticker set.
    /// </param>
    /// <returns>
    /// On success, a StickerSet object is returned.
    /// </returns>
    function GetStickerSet(const AName: string): TftStickerSet;

    /// <summary>
    /// Use this method to receive incoming updates using long polling (https://en.wikipedia.org/wiki/Push_technology#Long_polling).
    ///
    /// This method will not work if an outgoing webhook is set up.
    /// In order to avoid getting duplicate updates, recalculate offset after each server response.     *
    /// </summary>
    /// <param name="AOffset">
    /// Optional. Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as GetUpdates is called with an offset higher than its updateId. The negative offset can be specified to retrieve updates starting from -offset update from the end of the updates queue. All previous updates will forgotten.
    /// </param>
    /// <param name="ALimit">
    /// Optional. Limits the number of updates to be retrieved. Values between 1-100 are accepted. Defaults to 100.
    /// </param>
    /// <param name="ATimeout">
    /// Optional. Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling. Should be positive, short polling should be used for testing purposes only.
    /// </param>
    /// <param name="AAllowedUpdates">
    /// Optional. A JSON-serialized list of the update types you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all update types except chatMember (default). If not specified, the previous setting will be used. Please note that this parameter doesn't affect updates created before the call to the GetUpdates, so unwanted updates may be received for a short period of time.     *
    /// </param>
    /// <returns>
    /// Returns an Array of Update objects.
    /// </returns>
    function GetUpdates(AOffset: Integer = 0; ALimit: Integer = 100;
      ATimeout: Integer = 0; const AAllowedUpdates: TObject = nil)
      : TftUpdateList;

    /// <summary>
    /// Use this method to get a list of profile pictures for a user.     *
    /// </summary>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <param name="AOffset">
    /// Optional. Sequential number of the first photo to be returned. By default, all photos are returned.
    /// </param>
    /// <param name="ALimit">
    /// Optional. Limits the number of photos to be retrieved. Values between 1-100 are accepted. Defaults to 100.     *
    /// </param>
    /// <returns>
    /// Returns a UserProfilePhotos object.
    /// </returns>
    function GetUserProfilePhotos(AUserId: Int64; AOffset: Integer;
      ALimit: Integer): TftUserProfilePhotos;

    /// <summary>
    /// Use this method to get current webhook status.
    ///
    /// Requires no parameters.
    /// If the bot is using Api::getUpdates, will return an object with the url field empty.     *
    /// </summary>
    /// <returns>
    /// On success, returns a WebhookInfo object. If the bot is using getUpdates, will return a nullptr.
    /// </returns>
    function GetWebhookInfo(): TftWebhookInfo;

    /// <summary>
    /// Use this method to hide the 'General' topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights.
    /// The topic will be automatically closed if it was open.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function HideGeneralForumTopic(AChatId: Variant): Boolean;

    /// <summary>
    /// Use this method for your bot to leave a group, supergroup or channel.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup or channel (in the format @channelusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function LeaveChat(AChatId: Variant): Boolean;

    /// <summary>
    /// Use this method to log out from the cloud Bot API server before launching the bot locally.
    ///
    /// You must log out the bot before running it locally, otherwise there is no guarantee that the bot will receive updates.
    /// After a successful call, you can immediately log in on a local server, but will not be able to log in back to the cloud Bot API server for 10 minutes.
    /// Requires no parameters.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function LogOut(): Boolean;

    /// <summary>
    /// Use this method to add a message to the list of pinned messages in a chat.
    ///
    /// If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'canPinMessages' administrator right in a supergroup or 'canEditMessages' administrator right in a channel.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AMessageId">
    /// Identifier of a message to pin
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Pass True if it is not necessary to send a notification to all chat members about the new pinned message. Notifications are always disabled in channels and private chats.     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function PinChatMessage(AChatId: Variant; AMessageId: Integer;
      ADisableNotification: Boolean): Boolean;

    /// <summary>
    /// Use this method to promote or demote a user in a supergroup or a channel.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.
    /// Pass False for all boolean parameters to demote a user.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <param name="ACanChangeInfo">
    /// Optional. Pass True if the administrator can change chat title, photo and other settings
    /// </param>
    /// <param name="ACanPostMessages">
    /// Optional. Pass True if the administrator can create channel posts, channels only
    /// </param>
    /// <param name="ACanEditMessages">
    /// Optional. Pass True if the administrator can edit messages of other users and can pin messages, channels only
    /// </param>
    /// <param name="ACanDeleteMessages">
    /// Optional. Pass True if the administrator can delete messages of other users
    /// </param>
    /// <param name="ACanInviteUsers">
    /// Optional. Pass True if the administrator can invite new users to the chat
    /// </param>
    /// <param name="ACanPinMessages">
    /// Optional. Pass True if the administrator can pin messages, supergroups only
    /// </param>
    /// <param name="ACanPromoteMembers">
    /// Optional. Pass True if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by him)
    /// </param>
    /// <param name="AIsAnonymous">
    /// Optional. Pass True if the administrator's presence in the chat is hidden
    /// </param>
    /// <param name="ACanManageChat">
    /// Optional. Pass True if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other administrator privilege
    /// </param>
    /// <param name="ACanManageVideoChats">
    /// Optional. Pass True if the administrator can manage video chats
    /// </param>
    /// <param name="ACanRestrictMembers">
    /// Optional. Pass True if the administrator can restrict, ban or unban chat members
    /// </param>
    /// <param name="ACanManageTopics">
    /// Optional. Pass True if the user is allowed to create, rename, close, and reopen forum topics, supergroups only     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function PromoteChatMember(AChatId: Variant; AUserId: Integer;
      ACanChangeInfo: Boolean; ACanPostMessages: Boolean;
      ACanEditMessages: Boolean; ACanDeleteMessages: Boolean;
      ACanInviteUsers: Boolean; ACanPinMessages: Boolean;
      ACanPromoteMembers: Boolean; AIsAnonymous: Boolean;
      ACanManageChat: Boolean; ACanManageVideoChats: Boolean;
      ACanRestrictMembers: Boolean; ACanManageTopics: Boolean): Boolean;
    /// <summary>
    /// Use this method to reopen a closed topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights, unless it is the creator of the topic.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AMessageThreadId">
    /// Unique identifier for the target message thread of the forum topic     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function ReopenForumTopic(AChatId: Variant;
      AMessageThreadId: Integer): Boolean;

    /// <summary>
    /// Use this method to reopen a closed 'General' topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights.
    /// The topic will be automatically unhidden if it was hidden.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function ReopenGeneralForumTopic(AChatId: Variant): Boolean;

    /// <summary>
    /// Use this method to restrict a user in a supergroup.
    ///
    /// The bot must be an administrator in the supergroup for this to work and must have the appropriate admin rights.
    /// Pass True for all permissions to lift restrictions from a user.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <param name="APermissions">
    /// A JSON-serialized object for new user permissions
    /// </param>
    /// <param name="AUntilDate">
    /// Optional. Date when restrictions will be lifted for the user, unix time. If user is restricted for more than 366 days or less than 30 seconds from the current time, they are considered to be restricted forever     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function RestrictChatMember(AChatId: Variant; AUserId: Integer;
      APermissions: TftChatPermissions; AUntilDate: Int64): Boolean;

    /// <summary>
    /// Use this method to revoke an invite link created by the bot.
    ///
    /// If the primary link is revoked, a new link is automatically generated.
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier of the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AInviteLink">
    /// The invite link to revoke
    /// </param>
    /// <returns>
    /// Returns the revoked invite link as ChatInviteLink object.
    /// </returns>
    function RevokeChatInviteLink(AChatId: Variant; AInviteLink: String)
      : TftChatInviteLink;

    /// <summary>
    /// Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound).
    ///
    /// Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AAnimation">
    /// Animation to send. Pass a fileId as String to send an animation that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an animation from the Internet, or upload a new animation using multipart/form-data. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ADuration">
    /// Optional. Duration of sent animation in seconds
    /// </param>
    /// <param name="AWidth">
    /// Optional. Animation width
    /// </param>
    /// <param name="AHeight">
    /// Optional. Animation height
    /// </param>
    /// <param name="AThumb">
    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ACaption">
    /// Optional. Animation caption (may also be used when resending animation by fileId), 0-1024 characters after entities parsing
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the animation caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    /// </param>
    /// <param name="AHasSpoiler">
    /// Optional. Pass True if the animation needs to be covered with a spoiler animation     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendAnimation(AChatId: Variant; AAnimation: TftInputFile;
      ADuration: Integer = 0; AWidth: Integer = 0; AHeight: Integer = 0;
      AThumb: TftInputFile = nil; const ACaption: String = '';
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      const AParseMode: String = ''; ADisableNotification: Boolean = false;
      const ACaptionEntities: TftMessageEntityList = nil;
      AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      AHasSpoiler: Boolean = false;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send audio files, if you want Telegram clients to display them in the music player.
    ///
    /// Your audio must be in the .MP3 or .M4A format.
    /// Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future.
    ///
    /// For sending voice messages, use the Api::sendVoice method instead.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AAudio">
    /// Audio file to send. Pass a fileId as String to send an audio file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get an audio file from the Internet, or upload a new one using multipart/form-data. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ACaption">
    /// Optional. Audio caption, 0-1024 characters after entities parsing
    /// </param>
    /// <param name="ADuration">
    /// Optional. Duration of the audio in seconds
    /// </param>
    /// <param name="APerformer">
    /// Optional. Performer
    /// </param>
    /// <param name="ATitle">
    /// Optional. Track name
    /// </param>
    /// <param name="AThumb">
    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the audio caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>

    function SendAudio(AChatId: Variant; AAudio: TftInputFile = nil;
      const ACaption: string = ''; ADuration: Integer = 0;
      const APerformer: string = ''; const ATitle: String = '';
      AThumb: TftInputFile = nil; AReplyToMessageId: Integer = 0;
      AReplyMarkup: TftReplyBase = nil; const AParseMode: String = '';
      ADisableNotification: Boolean = false;
      const ACaptionEntities: TftMessageEntityList = nil;
      AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method when you need to tell the user that something is happening on the bot's side.
    /// The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status).
    ///
    /// Example: The ImageBot needs some time to process a request and upload the image.
    /// Instead of sending a text message along the lines of “Retrieving image, please wait…”, the bot may use Api::sendChatAction with action = upload_photo.
    /// The user will see a “sending photo” status for the bot.
    ///
    /// We only recommend using this method when a response from the bot will take a noticeable amount of time to arrive.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AAction">
    /// Type of action to broadcast. Choose one, depending on what the user is about to receive: typing for text messages, upload_photo for photos, record_video or upload_video for videos, record_voice or upload_voice for voice notes, upload_document for general files, choose_sticker for stickers, find_location for location data, record_video_note or upload_video_note for video notes.
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread; supergroups only     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SendChatAction(AChatId: Int64; const AAction: String;
      AMessageThreadId: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to send phone contacts.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="APhoneNumber">
    /// Contact's phone number
    /// </param>
    /// <param name="AFirstName">
    /// Contact's first name
    /// </param>
    /// <param name="ALastName">
    /// Optional. Contact's last name
    /// </param>
    /// <param name="AVcard">
    /// Optional. Additional data about the contact in the form of a vCard, 0-2048 bytes
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendContact(AChatId: Variant; const APhoneNumber: String;
      const AFirstName: String; const ALastName: String = '';
      const AVcard: String = ''; ADisableNotification: Boolean = false;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method to send an animated emoji that will display a random value.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AEmoji">
    /// Optional. Emoji on which the dice throw animation is based. Currently, must be one of “🎲”, “🎯”, “🏀”, “⚽”, “🎳”, or “🎰”. Dice can have values 1-6 for “🎲”, “🎯” and “🎳”, values 1-5 for “🏀” and “⚽”, and values 1-64 for “🎰”. Defaults to “🎲”
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendDice(AChatId: Variant; ADisableNotification: Boolean = false;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      AEmoji: String = ''; AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method to send general files.
    ///
    /// Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ADocument">
    /// File to send. Pass a fileId as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="AThumb">
    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ACaption">
    /// Optional. Document caption (may also be used when resending documents by fileId), 0-1024 characters after entities parsing
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the document caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="ADisableContentTypeDetection">
    /// Optional. Disables automatic server-side content type detection for files uploaded using multipart/form-data
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendDocument(AChatId: Variant; ADocument: TftInputFile = nil;
      AThumb: TftInputFile = nil; const ACaption: String = '';
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      const AParseMode: String = ''; ADisableNotification: Boolean = false;
      const ACaptionEntities: TftMessageEntityList = nil;
      ADisableContentTypeDetection: Boolean = false;
      AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method to send a game.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat
    /// </param>
    /// <param name="AGameShortName">
    /// Short name of the game, serves as the unique identifier for the game. Set up your games via @BotFather.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. A JSON-serialized object for an inline keyboard. If empty, one 'Play gameTitle' button will be shown. If not empty, the first button must launch the game.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendGame(AChatId: Variant; AGameShortName: String;
      AReplyToMessageId: Integer = 0;
      AReplyMarkup: TftInlineKeyboardMarkup = nil;
      ADisableNotification: Boolean = false;
      AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method to send invoices.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target private chat.
    /// </param>
    /// <param name="ATitle">
    /// Product name, 1-32 characters.
    /// </param>
    /// <param name="ADescription">
    /// Product description, 1-255 characters.
    /// </param>
    /// <param name="APayload">
    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
    /// </param>
    /// <param name="AProviderToken">
    /// Payments provider token, obtained via Botfather.
    /// </param>
    /// <param name="AStartParameter">
    /// Unique deep-linking parameter that can be used to generate this invoice when used as a start parameter.
    /// </param>
    /// <param name="ACurrency">
    /// Three-letter ISO 4217 currency code.
    /// </param>
    /// <param name="APrices">
    /// Price breakdown, a list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
    /// </param>
    /// <param name="AProviderData">
    /// Optional. JSON-encoded data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    /// </param>
    /// <param name="APhotoUrl">
    /// Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
    /// </param>
    /// <param name="APhotoSize">
    /// Optional. Photo size
    /// </param>
    /// <param name="APhotoWidth">
    /// Optional. Photo width
    /// </param>
    /// <param name="APhotoHeight">
    /// Optional. Photo height
    /// </param>
    /// <param name="ANeedName">
    /// Optional. Pass True, if you require the user's full name to complete the order.
    /// </param>
    /// <param name="ANeedPhoneNumber">
    /// Optional. Pass True, if you require the user's phone number to complete the order.
    /// </param>
    /// <param name="ANeedEmail">
    /// Optional. Pass True, if you require the user's email address to complete the order.
    /// </param>
    /// <param name="ANeedShippingAddress">
    /// Optional. Pass True, if you require the user's shipping address to complete the order.
    /// </param>
    /// <param name="ASendPhoneNumberToProvider">
    /// Optional. Pass True, if user's phone number should be sent to provider.
    /// </param>
    /// <param name="ASendEmailToProvider">
    /// Optional. Pass True, if user's email address should be sent to provider
    /// </param>
    /// <param name="AIsFlexible">
    /// Optional. Pass True, if the final price depends on the shipping method.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendInvoice(AChatId: Variant; const ATitle: String;
      const ADescription: String; const APayload: String;
      const AProviderToken: String; const AStartParameter: String;
      const ACurrency: String; const APrices: String;
      const AProviderData: String = ''; const APhotoUrl: String = '';
      APhotoSize: Integer = 0; APhotoWidth: Integer = 0;
      APhotoHeight: Integer = 0; ANeedName: Boolean = false;
      ANeedPhoneNumber: Boolean = false; ANeedEmail: Boolean = false;
      ANeedShippingAddress: Boolean = false;
      ASendPhoneNumberToProvider: Boolean = false;
      ASendEmailToProvider: Boolean = false; AIsFlexible: Boolean = false;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      ADisableNotification: Boolean = false;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send point on the map.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ALatitude">
    /// Latitude of the location
    /// </param>
    /// <param name="ALongitude">
    /// Longitude of the location
    /// </param>
    /// <param name="ALivePeriod">
    /// Optional. Period in seconds for which the location will be updated (see https://telegram.org/blog/live-locations, should be between 60 and 86400.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AHorizontalAccuracy">
    /// Optional. The radius of uncertainty for the location, measured in meters; 0-1500
    /// </param>
    /// <param name="AHeading">
    /// Optional. For live locations, a direction in which the user is moving, in degrees. Must be between 1 and 360 if specified.
    /// </param>
    /// <param name="AProximityAlertRadius">
    /// Optional. For live locations, a maximum distance for proximity alerts about approaching another chat member, in meters. Must be between 1 and 100000 if specified.
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendLocation(AChatId: Variant; ALatitude: Double;
      ALongitude: Double; ALivePeriod: Integer; AReplyToMessageId: Integer;
      AReplyMarkup: TftReplyBase; ADisableNotification: Boolean;
      AHorizontalAccuracy: Double; AHeading: Integer;
      AProximityAlertRadius: Integer; AAllowSendingWithoutReply: Boolean;
      AProtectContent: Boolean; AMessageThreadId: Integer;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send a group of photos, videos, documents or audios as an album.
    ///
    /// Documents and audio files can be only grouped in an album with messages of the same type.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AMedia">
    /// A JSON-serialized array describing messages to be sent, must include 2-10 items
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends messages silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the messages are a reply, ID of the original message
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent messages from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, an array of Messages that were sent is returned.
    /// </returns>
    function SendMediaGroup(AChatId: Variant; AMedia: TList<TftInputMedia>;
      ADisableNotification: Boolean; AReplyToMessageId: Integer;
      AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
      AMessageThreadId: Integer;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessageList;

    /// <summary>
    /// Use this method to send text messages.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AText">
    /// Text of the message to be sent, 1-4096 characters after entities parsing
    /// </param>
    /// <param name="ADisableWebPagePreview">
    /// Optional. Disables link previews for links in this message
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the message text. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AEntities">
    /// Optional. A JSON-serialized list of special entities that appear in message text, which can be specified instead of parseMode
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendMessage(AChatId: Variant; const AText: String;
      ADisableWebPagePreview: Boolean = false; AReplyToMessageId: Integer = 0;
      AReplyMarkup: TftReplyBase = nil; const AParseMode: String = '';
      ADisableNotification: Boolean = false;
      const AEntities: TftMessageEntityList = nil;
      AAllowSendingWithoutReply: Boolean = false;
      AProtectContent: Boolean = false; AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      ALinkPreviewOptions: TftLinkPreviewOptions = nil;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil)
      : TftMessage; overload;

    /// <summary>
    /// Use this method to send photos.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="APhoto">
    /// Photo to send. Pass a fileId as String to send a photo that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a photo from the Internet, or upload a new photo using multipart/form-data. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ACaption">
    /// Optional. Photo caption (may also be used when resending photos by fileId), 0-1024 characters after entities parsing
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the photo caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    /// </param>
    /// <param name="AHasSpoiler">
    /// Optional. Pass True if the photo needs to be covered with a spoiler animation     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendPhoto(AChatId: Variant; APhoto: TftInputFile = nil;
      const ACaption: string = ''; AReplyToMessageId: Integer = 0;
      AReplyMarkup: TftReplyBase = nil; const AParseMode: String = '';
      ADisableNotification: Boolean = false;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send a native poll.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AQuestion">
    /// Poll question, 1-300 characters
    /// </param>
    /// <param name="AOptions">
    /// A JSON-serialized list of answer options, 2-10 strings 1-100 characters each
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AIsAnonymous">
    /// Optional. True, if the poll needs to be anonymous, defaults to True
    /// </param>
    /// <param name="AType">
    /// Optional. Poll type, “quiz” or “regular”, defaults to “regular”
    /// </param>
    /// <param name="AAllowsMultipleAnswers">
    /// Optional. True, if the poll allows multiple answers, ignored for polls in quiz mode, defaults to False
    /// </param>
    /// <param name="ACorrectOptionId">
    /// Optional. 0-based identifier of the correct answer option, required for polls in quiz mode
    /// </param>
    /// <param name="AExplanation">
    /// Optional. Text that is shown when a user chooses an incorrect answer or taps on the lamp icon in a quiz-style poll, 0-200 characters with at most 2 line feeds after entities parsing
    /// </param>
    /// <param name="AExplanationParseMode">
    /// Optional. Mode for parsing entities in the explanation. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="AExplanationEntities">
    /// Optional. List of special entities that appear in the poll explanation, which can be specified instead of parseMode
    /// </param>
    /// <param name="AOpenPeriod">
    /// Optional. Amount of time in seconds the poll will be active after creation, 5-600. Can't be used together with closeDate.
    /// </param>
    /// <param name="ACloseDate">
    /// Optional. Point in time (Unix timestamp) when the poll will be automatically closed. Must be at least 5 and no more than 600 seconds in the future. Can't be used together with openPeriod.
    /// </param>
    /// <param name="AIsClosed">
    /// Optional. Pass True, if the poll needs to be immediately closed. This can be useful for poll preview.
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </retrns>
    function SendPoll(AChatId: Variant; const AQuestion: string;
      const AOptions: TObject; ADisableNotification: Boolean = false;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method to send .webp stickers.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="ASticker">
    /// Sticker to send.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function SendSticker(AChatId: Variant; ASticker: TftInputFile;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      ADisableNotification: Boolean = false;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send information about a venue.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ALatitude">
    /// Latitude of the venue
    /// </param>
    /// <param name="ALongitude">
    /// Longitude of the venue
    /// </param>
    /// <param name="ATitle">
    /// Name of the venue
    /// </param>
    /// <param name="AAddress">
    /// Address of the venue
    /// </param>
    /// <param name="AFoursquareId">
    /// Optional. Foursquare identifier of the venue
    /// </param>
    /// <param name="AFoursquareType">
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AGooglePlaceId">
    /// Optional. Google Places identifier of the venue
    /// </param>
    /// <param name="AGooglePlaceType">
    /// Optional. Google Places type of the venue. (See https://developers.google.com/places/web-service/supported_types)
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendVenue(AChatId: Variant; ALatitude: Double; ALongitude: Double;
      const ATitle: String; const AAddress: String; const ASoursquareId: String;
      const AFoursquareType: String; ADisableNotification: Boolean;
      AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
      const AGooglePlaceId: String; const AGooglePlaceType: String;
      AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
      AMessageThreadId: Integer;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send video files, Telegram clients support MPEG4 videos (other formats may be sent as Document).     *      * Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AVideo">
    /// Video to send. Pass a fileId as String to send a video that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a video from the Internet, or upload a new video using multipart/form-data. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ASupportsStreaming">
    /// Optional. Pass True if the uploaded video is suitable for streaming
    /// </param>
    /// <param name="ADuration">
    /// Optional. Duration of sent video in seconds
    /// </param>
    /// <param name="AWidth">
    /// Optional. Video width
    /// </param>
    /// <param name="AHeight">
    /// Optional. Video height
    /// </param>
    /// <param name="AThumb">
    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ACaption">
    /// Optional. Video caption (may also be used when resending videos by fileId), 0-1024 characters after entities parsing
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the video caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only
    /// </param>
    /// <param name="AHasSpoiler">
    /// Optional. Pass True if the video needs to be covered with a spoiler animation     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendVideo(AChatId: Variant; AVideo: TftInputFile;
      ASupportsStreaming: Boolean; ADuration: Integer; AWidth: Integer;
      AHeight: Integer; AThumb: TftInputFile; ACaption: String;
      AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
      const AParseMode: String; ADisableNotification: Boolean;
      const ACaptionEntities: TftMessageEntityList;
      AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
      AMessageThreadId: Integer; AHasSpoiler: Boolean;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send video messages.     *      * As of v.4.0, Telegram clients support rounded square MPEG4 videos of up to 1 minute long.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AVideoNote">
    /// Video note to send. Pass a fileId as String to send a video note that exists on the Telegram servers (recommended) or upload a new video using multipart/form-data. https://core.telegram.org/bots/api#sending-files. Sending video notes by a URL is currently unsupported
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ADuration">
    /// Optional. Duration of sent video in seconds
    /// </param>
    /// <param name="ALength">
    /// Optional. Video width and height, i.e. diameter of the video message
    /// </param>
    /// <param name="AThumb">
    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail's width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendVideoNote(AChatId: Variant; AVideoNote: TftInputFile;
      AReplyToMessageId: Integer; ADisableNotification: Boolean;
      ADuration: Integer; Alength: Integer; AThumb: TftInputFile;
      AReplyMarkup: TftReplyBase; AAllowSendingWithoutReply: Boolean;
      AProtectContent: Boolean; AMessageThreadId: Integer;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message.
    ///
    /// For this to work, your audio must be in an .OGG file encoded with OPUS (other formats may be sent as Audio or Document).
    /// Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AVoice">
    /// Audio file to send. Pass a fileId as String to send a file that exists on the Telegram servers (recommended), pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. https://core.telegram.org/bots/api#sending-files
    /// </param>
    /// <param name="ACaption">
    /// Optional. Voice message caption, 0-1024 characters after entities parsing
    /// </param>
    /// <param name="ADuration">
    /// Optional. Duration of the voice message in seconds
    /// </param>
    /// <param name="AReplyToMessageId">
    /// Optional. If the message is a reply, ID of the original message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. Additional interface options. A JSON-serialized object for an inline keyboard, custom reply keyboard, instructions to remove reply keyboard or to force a reply from the user.
    /// </param>
    /// <param name="AParseMode">
    /// Optional. Mode for parsing entities in the voice message caption. See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </param>
    /// <param name="ADisableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <param name="ACaptionEntities">
    /// Optional. A JSON-serialized list of special entities that appear in the caption, which can be specified instead of parseMode
    /// </param>
    /// <param name="AAllowSendingWithoutReply">
    /// Optional. Pass True if the message should be sent even if the specified replied-to message is not found
    /// </param>
    /// <param name="AProtectContent">
    /// Optional. Protects the contents of the sent message from forwarding and saving
    /// </param>
    /// <param name="AMessageThreadId">
    /// Optional. Unique identifier for the target message thread (topic) of the forum; for forum supergroups only     *
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendVoice(AChatId: Variant; AVoice: TftInputFile;
      const ACaption: String; ADuration: Integer; AReplyToMessageId: Integer;
      AReplyMarkup: TftReplyBase; const AParseMode: String;
      ADisableNotification: Boolean;
      const ACaptionEntities: TftMessageEntityList;
      AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
      AMessageThreadId: Integer;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to set a custom title for an administrator in a supergroup promoted by the bot.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <param name="ACustomTitle">
    /// New custom title for the administrator; 0-16 characters, emoji are not allowed     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatAdministratorCustomTitle(AChatId: Variant; AUserId: Int64;
      ACustomTitle: String): Boolean;

    /// <summary>
    /// Use this method to change the description of a group, a supergroup or a channel.    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ADescription">
    /// New chat description, 0-255 characters     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatDescription(AChatId: Variant; ADescription: String)
      : Boolean;

    /// <summary>
    /// Use this method to change the bot's menu button in a private chat, or the default menu button.     *
    /// </summary>
    /// <param name="AChatId">
    /// Optional. Unique identifier for the target private chat. If not specified, default bot's menu button will be changed
    /// </param>
    /// <param name="AMenuButton">
    /// Optional. A JSON-serialized object for the bot's new menu button. Defaults to MenuButtonDefault     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatMenuButton(AChatId: Variant;
      AMenuButton: TftMenuButton): Boolean;

    /// <summary>
    /// Use this method to set default chat permissions for all members.
    ///
    /// The bot must be an administrator in the group or a supergroup for this to work and must have the canRestrictMembers administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="APermissions">
    /// A JSON-serialized object for new default chat permissions     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatPermissions(AChatId: Variant;
      APermissions: TftChatPermissions): Boolean;

    /// <summary>
    /// Use this method to set a new profile photo for the chat.
    ///
    /// Photos can't be changed for private chats.
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="APhoto">
    /// New chat photo, uploaded using multipart/form-data     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatPhoto(AChatId: Variant; APhoto: TftInputFile): Boolean;

    /// <summary>
    /// Use this method to set a new group sticker set for a supergroup.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.
    /// Use the field canSetStickerSet optionally returned in Api::getChat requests to check if the bot can use this method.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AStickerSetName">
    /// Name of the sticker set to be set as the group sticker set     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatStickerSet(AChatId: Variant;
      AStickerSetName: String): Boolean;

    /// <summary>
    /// Use this method to change the title of a chat.
    ///
    /// Titles can't be changed for private chats.
    /// The bot must be an administrator in the chat for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ATitle">
    /// New chat title, 1-255 characters     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatTitle(AChatId: Variant; ATitle: String): Boolean;

    /// <summary>
    /// Use this method to set the score of the specified user in a game message.
    ///
    /// Returns an error, if the new score is not greater than the user's current score in the chat and force is False.     *
    /// </summary>
    /// <param name="AUserId">
    /// User identifier
    /// </param>
    /// <param name="AScore">
    /// New score, must be non-negative
    /// </param>
    /// <param name="AForce">
    /// Optional. Pass True if the high score is allowed to decrease. This can be useful when fixing mistakes or banning cheaters
    /// </param>
    /// <param name="ADisableEditMessage">
    /// Optional. Pass True if the game message should not be automatically edited to include the current scoreboard
    /// </param>
    /// <param name="AChatId">
    /// Optional. Required if inlineMessageId is not specified. Unique identifier for the target chat
    /// </param>
    /// <param name="AMessageId">
    /// Optional. Required if inlineMessageId is not specified. Identifier of the sent message
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional. Required if chatId and messageId are not specified. Identifier of the inline message     *
    /// </param>
    /// <returns>
    /// On success, if the message is not an inline message, the Message is returned, otherwise nullptr is returned.
    /// </returns>
    function SetGameScore(AUserId: Int64; AScore: Integer; AForce: Boolean;
      ADisableEditMessage: Boolean; AChatId: Int64; AMessageId: Integer;
      const AInlineMessageId: String): TftMessage;

    /// <summary>
    /// Use this method to change the list of the bot's commands.
    ///
    /// See https://core.telegram.org/bots#commands for more details about bot commands.     *
    /// </summary>
    /// <param name="ACommands">
    /// A JSON-serialized list of bot commands to be set as the list of the bot's commands. At most 100 commands can be specified.
    /// </param>
    /// <param name="AScope">
    /// Optional. A JSON-serialized object, describing scope of users for which the commands are relevant. Defaults to BotCommandScopeDefault.
    /// </param>
    /// <param name="ALanguageCode">
    /// Optional. A two-letter ISO 639-1 language code. If empty, commands will be applied to all users from the given scope, for whose language there are no dedicated commands     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>

    function SetMyCommands(const ACommands: TList<TftBotCommand>): Boolean;

    /// <summary>
    /// Use this method to change the default administrator rights requested by the bot when it's added as an administrator to groups or channels.
    ///
    /// These rights will be suggested to users, but they are are free to modify the list before adding the bot.     *
    /// </summary>
    /// <param name="ARights">
    /// Optional. A JSON-serialized object describing new default administrator rights. If not specified, the default administrator rights will be cleared.
    /// </param>
    /// <param name="AForChannels">
    /// Optional. Pass True to change the default administrator rights of the bot in channels. Otherwise, the default administrator rights of the bot for groups and supergroups will be changed.     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetMyDefaultAdministratorRights
      (ARights: TftChatAdministratorRights; AForChannels: Boolean): Boolean;

    /// <summary>
    /// Informs a user that some of the Telegram Passport elements they provided contains errors.
    ///
    /// The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change).
    /// Use this if the data submitted by the user doesn't satisfy the standards your service requires for any reason.
    /// For example, if a birthday date seems invalid, a submitted document is blurry, a scan shows evidence of tampering, etc.
    /// Supply some details in the error message to make sure the user knows how to correct the issues.     *
    /// </summary>
    /// <param name="AUserId">
    /// User identifier
    /// </param>
    /// <param name="AErrors">
    /// A JSON-serialized array describing the errors     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetPassportDataErrors(AUserId: Int64;
      AErrors: TList<TftPassportElementError>): Boolean;

    /// <summary>
    /// Use this method to move a sticker in a set created by the bot to a specific position.     *
    /// </summary>
    /// <param name="ASticker">
    /// File identifier of the sticker
    /// </param>
    /// <param name="APosition">
    /// New sticker position in the set, zero-based     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetStickerPositionInSet(ASticker: String;
      APosition: Integer): Boolean;

    /// <summary>
    /// Use this method to set the thumbnail of a sticker set.
    ///
    /// Animated thumbnails can be set for animated sticker sets only.
    /// Video thumbnails can be set only for video sticker sets only.
    /// </summary>
    /// <param name="AName">
    /// Sticker set name
    /// </param>
    /// <param name="AUserId">
    /// User identifier of the sticker set owner
    /// </param>
    /// <param name="AThumb">
    /// Optional. A PNG image with the thumbnail, must be up to 128 kilobytes in size and have width and height exactly 100px, or a TGS animation with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#animated-sticker-requirements for animated sticker technical requirements, or a WEBM video with the thumbnail up to 32 kilobytes in size; see https://core.telegram.org/stickers#video-sticker-requirements for video sticker technical requirements. Pass a fileId as a String to send a file that already exists on the Telegram servers, pass an HTTP URL as a String for Telegram to get a file from the Internet, or upload a new one using multipart/form-data. https://core.telegram.org/bots/api#sending-files. Animated sticker set thumbnails can't be uploaded via HTTP URL.     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>

    function SetStickerSetThumb(AName: String; AUserId: Int64;
      AThumb: TftInputFile): Boolean;

    /// <summary>
    /// Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts.     *     * If you'd like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. www.example.com/<token>. Since nobody else knows your bot�s token, you can be pretty sure it�s us.     * You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.     * We currently do not support self-signed certificates.     * Ports currently supported for Webhooks: 443, 80, 88, 8443.     *
    /// </summary>
    /// <param name="AUrl">
    /// Optional. HTTPS url to send updates to. Use an empty string to remove webhook integration.
    /// </param>
    procedure SetWebhook(const AURL: String = '';
      const ACertificate: TftInputFile = nil; AMaxConnection: Integer = 40;
      const AAllowedUpdates: TObject = nil; const AIpAddress: String = '';
      ADropPendingUpdates: Boolean = false; const ASecretToken: String = '');

    /// <summary>
    /// Use this method to stop updating a live location message before livePeriod expires.     *
    /// </summary>
    /// <param name="AChatId">
    /// Optional. Required if inlineMessageId is not specified. Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AMessageId">
    /// Optional. Required if inlineMessageId is not specified. Identifier of the message with live location to stop
    /// </param>
    /// <param name="AInlineMessageId">
    /// Optional. Required if chatId and messageId are not specified. Identifier of the inline message
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. A JSON-serialized object for a new inline keyboard.     *
    /// </param>
    /// <returns>
    /// On success, the edited Message is returned.
    /// </returns>
    function StopMessageLiveLocation(AChatId: Variant; AMessageId: Integer;
      AInlineMessageId: String; AReplyMarkup: TftInlineKeyboardMarkup = nil)
      : TftMessage;

    /// <summary>
    /// Use this method to stop a poll which was sent by the bot.
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel.
    /// </param>
    /// <param name="AMessageId">
    /// Identifier of the original message with the poll.
    /// </param>
    /// <param name="AReplyMarkup">
    /// Optional. A JSON-serialized object for a new message inline keyboard.
    /// </param>
    /// <returns>
    /// On success, the stopped Poll with the final results is returned.
    /// </returns>
    function StopPoll(AChatId: Variant; AMessageId: Integer;
      AReplyMarkup: TftInlineKeyboardMarkup = nil): TftPoll;

    /// <summary>
    /// Use this method to unban a previously banned user in a supergroup or channel.
    ///
    /// The user will not return to the group or channel automatically, but will be able to join via link, etc.
    /// The bot must be an administrator for this to work.
    /// By default, this method guarantees that after the call the user is not a member of the chat, but will be able to join it.
    /// So if the user is a member of the chat they will also be removed from the chat.
    /// If you don't want this, use the parameter onlyIfBanned.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target group or username of the target supergroup or channel (in the format @channelusername)
    /// </param>
    /// <param name="AUserId">
    /// Unique identifier of the target user
    /// </param>
    /// <param name="AOnlyIfBanned">
    /// Optional. Pass True to do nothing if the user is not banned     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnbanChatMember(AChatId: Variant; AUserId: Int64;
      AOnlyIfBanned: Boolean): Boolean;

    /// <summary>
    /// Use this method to unban a previously banned channel chat in a supergroup or channel.
    ///
    /// The bot must be an administrator for this to work and must have the appropriate administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="ASenderChatId">
    /// Unique identifier of the target sender chat     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnbanChatSenderChat(AChatId: Variant;
      ASenderChatId: Int64): Boolean;

    /// <summary>
    /// Use this method to unhide the 'General' topic in a forum supergroup chat.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canManageTopics administrator rights.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnhideGeneralForumTopic(AChatId: Variant): Boolean;

    /// <summary>
    /// Use this method to clear the list of pinned messages in a chat.
    ///
    /// If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'canPinMessages' administrator right in a supergroup or 'canEditMessages' administrator right in a channel.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnpinAllChatMessages(AChatId: Variant): Boolean;

    /// <summary>
    /// Use this method to clear the list of pinned messages in a forum topic.
    ///
    /// The bot must be an administrator in the chat for this to work and must have the canPinMessages administrator right in the supergroup.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target supergroup (in the format @supergroupusername)
    /// </param>
    /// <param name="AMessageThreadId">
    /// Unique identifier for the target message thread of the forum topic     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnpinAllForumTopicMessages(AChatId: Variant;
      AMessageThreadId: Integer): Boolean;

    /// <summary>
    /// Use this method to remove a message from the list of pinned messages in a chat.
    ///
    /// If the chat is not a private chat, the bot must be an administrator in the chat for this to work and must have the 'canPinMessages' administrator right in a supergroup or 'canEditMessages' administrator right in a channel.     *
    /// </summary>
    /// <param name="AChatId">
    /// Unique identifier for the target chat or username of the target channel (in the format @channelusername)
    /// </param>
    /// <param name="AMessageId">
    /// Optional. Identifier of a message to unpin. If not specified, the most recent pinned message (by sending date) will be unpinned.     *
    /// </param>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnpinChatMessage(AChatId: Variant; AMessageId: Integer): Boolean;

    /// <summary>
    /// Use this method to upload a .PNG file with a sticker for later use in Api::createNewStickerSet and Api::addStickerToSet methods (can be used multiple times).     *
    /// </summary>
    /// <param name="AUserId">
    /// User identifier of sticker file owner
    /// </param>
    /// <param name="APngSticker">
    /// PNG image with the sticker, must be up to 512 kilobytes in size, dimensions must not exceed 512px, and either width or height must be exactly 512px. https://core.telegram.org/bots/api#sending-files     *
    /// </param>
    /// <returns>
    /// Returns the uploaded File on success.
    /// </returns>
    function UploadStickerFile(AUserId: Int64;
      APngSticker: TftInputFile): Boolean;

    { Bot API 10.3 additions }

    /// <summary>
    /// Use this method to forward multiple messages of any kind.
    /// </summary>
    /// <returns>
    /// Returns an Array of MessageId of the sent messages.
    /// </returns>
    function ForwardMessages(AChatId, AFromChatId: Variant;
      AMessageIds: TArray<Integer>; AMessageThreadId: Integer = 0;
      ADirectMessagesTopicId: Integer = 0;
      ADisableNotification: Boolean = false;
      AProtectContent: Boolean = false): TList<TftMessageId>;

    /// <summary>
    /// Use this method to copy messages of any kind.
    /// </summary>
    /// <returns>
    /// Returns an Array of MessageId of the sent messages.
    /// </returns>
    function CopyMessages(AChatId, AFromChatId: Variant;
      AMessageIds: TArray<Integer>; AMessageThreadId: Integer = 0;
      ADirectMessagesTopicId: Integer = 0;
      ADisableNotification: Boolean = false; AProtectContent: Boolean = false;
      ARemoveCaption: Boolean = false): TList<TftMessageId>;

    /// <summary>
    /// Use this method to delete multiple messages simultaneously.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteMessages(AChatId: Variant;
      AMessageIds: TArray<Integer>): Boolean;

    /// <summary>
    /// Use this method to clear the list of pinned messages in a General forum topic.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UnpinAllGeneralForumTopicMessages(AChatId: Variant): Boolean;

    /// <summary>
    /// Use this method to change the bot's name.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetMyName(const AName: String;
      const ALanguageCode: String = ''): Boolean;

    /// <summary>
    /// Use this method to get the current bot name for the given user language.
    /// </summary>
    /// <returns>
    /// Returns BotName on success.
    /// </returns>
    function GetMyName(const ALanguageCode: String = ''): TftBotName;

    /// <summary>
    /// Use this method to change the bot's description.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetMyDescription(const ADescription: String;
      const ALanguageCode: String = ''): Boolean;

    /// <summary>
    /// Use this method to get the current bot description for the given user language.
    /// </summary>
    /// <returns>
    /// Returns BotDescription on success.
    /// </returns>
    function GetMyDescription(const ALanguageCode: String = ''): TftBotDescription;

    /// <summary>
    /// Use this method to change the bot's short description.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetMyShortDescription(const AShortDescription: String;
      const ALanguageCode: String = ''): Boolean;

    /// <summary>
    /// Use this method to get the current bot short description for the given user language.
    /// </summary>
    /// <returns>
    /// Returns BotShortDescription on success.
    /// </returns>
    function GetMyShortDescription(const ALanguageCode: String = '')
      : TftBotShortDescription;

    /// <summary>
    /// Use this method to set a tag for a regular member in a group or a supergroup.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetChatMemberTag(AChatId: Variant; AUserId: Int64;
      const ATag: String = ''): Boolean;

    /// <summary>
    /// Changes the emoji status for a given user that previously allowed the bot to manage their emoji status.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetUserEmojiStatus(AUserId: Int64;
      const AEmojiStatusCustomEmojiId: String = '';
      AEmojiStatusExpirationDate: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to create a subscription invite link for a channel chat.
    /// </summary>
    /// <returns>
    /// Returns the new invite link as a ChatInviteLink object.
    /// </returns>
    function CreateChatSubscriptionInviteLink(AChatId: Variant;
      ASubscriptionPeriod, ASubscriptionPrice: Integer;
      const AName: String = ''): TftChatInviteLink;

    /// <summary>
    /// Use this method to edit a subscription invite link created by the bot.
    /// </summary>
    /// <returns>
    /// Returns the edited invite link as a ChatInviteLink object.
    /// </returns>
    function EditChatSubscriptionInviteLink(AChatId: Variant;
      const AInviteLink: String; const AName: String = ''): TftChatInviteLink;

    /// <summary>
    /// Verifies a user on behalf of the organization which is represented by the bot.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function VerifyUser(AUserId: Int64;
      const ACustomDescription: String = ''): Boolean;

    /// <summary>
    /// Verifies a chat on behalf of the organization which is represented by the bot.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function VerifyChat(AChatId: Variant;
      const ACustomDescription: String = ''): Boolean;

    /// <summary>
    /// Removes verification from a user who is currently verified on behalf of the organization represented by the bot.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function RemoveUserVerification(AUserId: Int64): Boolean;

    /// <summary>
    /// Removes verification from a chat that is currently verified on behalf of the organization represented by the bot.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function RemoveChatVerification(AChatId: Variant): Boolean;

    /// <summary>
    /// Marks an incoming message as read on behalf of a business account.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function ReadBusinessMessage(const ABusinessConnectionId: String;
      AChatId: Int64; AMessageId: Integer): Boolean;

    /// <summary>
    /// Deletes messages on behalf of a business account.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteBusinessMessages(const ABusinessConnectionId: String;
      AMessageIds: TArray<Integer>): Boolean;

    /// <summary>
    /// Changes the first and last name of a managed business account.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetBusinessAccountName(const ABusinessConnectionId,
      AFirstName: String; const ALastName: String = ''): Boolean;

    /// <summary>
    /// Changes the username of a managed business account.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetBusinessAccountUsername(const ABusinessConnectionId,
      AUsername: String): Boolean;

    /// <summary>
    /// Changes the bio of a managed business account.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetBusinessAccountBio(const ABusinessConnectionId,
      ABio: String): Boolean;

    /// <summary>
    /// Removes the current profile photo of a managed business account.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function RemoveBusinessAccountProfilePhoto(
      const ABusinessConnectionId: String; AIsPublic: Boolean = false): Boolean;

    /// <summary>
    /// Transfers Telegram Stars from the business account balance to the bot's balance.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function TransferBusinessAccountStars(const ABusinessConnectionId: String;
      AStarCount: Integer): Boolean;

    /// <summary>
    /// Converts a given regular gift to Telegram Stars.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function ConvertGiftToStars(const ABusinessConnectionId,
      AOwnedGiftId: String): Boolean;

    /// <summary>
    /// Upgrades a given regular gift to a unique gift.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function UpgradeGift(const ABusinessConnectionId, AOwnedGiftId: String;
      AKeepOriginalDetails: Boolean = false; AStarCount: Integer = 0): Boolean;

    /// <summary>
    /// Transfers an owned unique gift to another user.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function TransferGift(const ABusinessConnectionId, AOwnedGiftId: String;
      ANewOwnerChatId: Int64; AStarCount: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to remove a reaction from a message in a group or a supergroup chat.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteMessageReaction(AChatId: Variant; AMessageId: Integer;
      AUserId: Int64 = 0; AActorChatId: Int64 = 0): Boolean;

    /// <summary>
    /// Use this method to remove up to 10000 recent reactions in a group or a supergroup chat added by a given user or chat.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteAllMessageReactions(AChatId: Variant;
      AUserId: Int64 = 0; AActorChatId: Int64 = 0): Boolean;

    /// <summary>
    /// Use this method to get information about custom emoji stickers by their identifiers.
    /// </summary>
    /// <returns>
    /// Returns an Array of Sticker objects.
    /// </returns>
    function GetCustomEmojiStickers(ACustomEmojiIds: TArray<String>)
      : TList<TftSticker>;

    /// <summary>
    /// Use this method to change the list of emoji assigned to a regular or custom emoji sticker.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetStickerEmojiList(const ASticker: String;
      AEmojiList: TArray<String>): Boolean;

    /// <summary>
    /// Use this method to change search keywords assigned to a regular or custom emoji sticker.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetStickerKeywords(const ASticker: String;
      AKeywords: TArray<String>): Boolean;

    /// <summary>
    /// Use this method to change the mask position of a mask sticker.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetStickerMaskPosition(const ASticker: String;
      AMaskPosition: TftMaskPosition = nil): Boolean;

    /// <summary>
    /// Use this method to set the title of a created sticker set.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetStickerSetTitle(const AName, ATitle: String): Boolean;

    /// <summary>
    /// Use this method to set the thumbnail of a regular or mask sticker set.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetStickerSetThumbnail(const AName: String; AUserId: Int64;
      const AFormat: String; AThumbnail: TftInputFile = nil): Boolean;

    /// <summary>
    /// Use this method to set the thumbnail of a custom emoji sticker set.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetCustomEmojiStickerSetThumbnail(const AName: String;
      const ACustomEmojiId: String = ''): Boolean;

    /// <summary>
    /// Use this method to delete a sticker set that was created by the bot.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeleteStickerSet(const AName: String): Boolean;

    /// <summary>
    /// Refunds a successful payment in Telegram Stars.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function RefundStarPayment(AUserId: Int64;
      const ATelegramPaymentChargeId: String): Boolean;

    /// <summary>
    /// Allows the bot to cancel or re-enable extension of a subscription paid in Telegram Stars.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function EditUserStarSubscription(AUserId: Int64;
      const ATelegramPaymentChargeId: String; AIsCanceled: Boolean): Boolean;

    /// <summary>
    /// A method to get the current Telegram Stars balance of the bot.
    /// </summary>
    /// <returns>
    /// Returns StarAmount on success.
    /// </returns>
    function GetMyStarBalance(): TftStarAmount;

    /// <summary>
    /// Use this method to get a list of profile audios for a user.
    /// </summary>
    /// <returns>
    /// Returns a UserProfileAudios object.
    /// </returns>
    function GetUserProfileAudios(AUserId: Int64; AOffset: Integer = 0;
      ALimit: Integer = 100): TftUserProfileAudios;

    /// <summary>
    /// Use this method to stream a partial message to a user while the message is being generated.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SendMessageDraft(AChatId: Int64; ADraftId: Integer;
      const AText, AParseMode: String;
      AEntities: TftMessageEntityList = nil; AMessageThreadId: Integer = 0;
      ACanStop: Boolean = false; AKeepOnStop: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to approve a suggested post in a direct messages chat.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function ApproveSuggestedPost(AChatId: Int64; AMessageId: Integer;
      ASendDate: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to decline a suggested post in a direct messages chat.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function DeclineSuggestedPost(AChatId: Int64; AMessageId: Integer;
      const AComment: String = ''): Boolean;

    /// <summary>
    /// Gifts a Telegram Premium subscription to the given user.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function GiftPremiumSubscription(AUserId: Int64;
      AMonthCount, AStarCount: Integer; const AText: String;
      const ATextParseMode: String = '';
      ATextEntities: TftMessageEntityList = nil): Boolean;

    /// <summary>
    /// Sends a gift to the given user or channel chat.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SendGift(AUserId: Int64; AChatId: Variant; const AGiftId: String;
      APayForUpgrade: Boolean = false; const AText: String = '';
      const ATextParseMode: String = '';
      ATextEntities: TftMessageEntityList = nil): Boolean;

    /// <summary>
    /// Use this method to get the token of a managed bot.
    /// </summary>
    /// <returns>
    /// Returns the token as String on success.
    /// </returns>
    function GetManagedBotToken(AUserId: Int64): String;

    /// <summary>
    /// Use this method to revoke the current token of a managed bot and generate a new one.
    /// </summary>
    /// <returns>
    /// Returns the new token as String on success.
    /// </returns>
    function ReplaceManagedBotToken(AUserId: Int64): String;

    /// <summary>
    /// Use this method to get information about the connection of the bot with a business account.
    /// </summary>
    /// <returns>
    /// Returns a BusinessConnection object on success.
    /// </returns>
    function GetBusinessConnection(const ABusinessConnectionId: String)
      : TftBusinessConnection;

    /// <summary>
    /// Use this method to get the last messages from the personal chat of a given user.
    /// </summary>
    /// <returns>
    /// Returns an Array of Message objects.
    /// </returns>
    function GetUserPersonalChatMessages(AUserId: Int64; ALimit: Integer)
      : TList<TftMessage>;

    /// <summary>
    /// Use this method to process a received chat join request query.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function AnswerChatJoinRequestQuery(const AChatJoinRequestQueryId,
      AResult: String): Boolean;

    /// <summary>
    /// Use this method to process a received chat join request query by showing a Mini App to the user.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SendChatJoinRequestWebApp(const AChatJoinRequestQueryId,
      AWebAppUrl: String): Boolean;

    /// <summary>
    /// Stores a message that can be sent by a user of a Mini App.
    /// </summary>
    /// <returns>
    /// Returns a PreparedInlineMessage object.
    /// </returns>
    function SavePreparedInlineMessage(AUserId: Int64;
      AResult: TftInlineQueryResult; AAllowUserChats: Boolean = false;
      AAllowBotChats: Boolean = false; AAllowGroupChats: Boolean = false;
      AAllowChannelChats: Boolean = false): TftPreparedInlineMessage;

    /// <summary>
    /// Stores a keyboard button that can be used by a user within a Mini App.
    /// </summary>
    /// <returns>
    /// Returns a PreparedKeyboardButton object.
    /// </returns>
    function SavePreparedKeyboardButton(AUserId: Int64;
      AButton: TftKeyboardButton): TftPreparedKeyboardButton;

    /// <summary>
    /// Use this method to change the chosen reactions on a message.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function SetMessageReaction(AChatId: Variant; AMessageId: Integer;
      AReaction: TList<TftReactionType>; AIsBig: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to send live photos.
    /// </summary>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendLivePhoto(AChatId: Variant; ALivePhoto, APhoto: TftInputFile;
      const ACaption: String = ''; const AParseMode: String = '';
      ACaptionEntities: TftMessageEntityList = nil;
      ADisableNotification: Boolean = false; AProtectContent: Boolean = false;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      AMessageThreadId: Integer = 0;
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Removes the profile photo of the bot.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function RemoveMyProfilePhoto(): Boolean;

    /// <summary>
    /// Returns the amount of Telegram Stars owned by a managed business account.
    /// </summary>
    /// <returns>
    /// Returns StarAmount on success.
    /// </returns>
    function GetBusinessAccountStarBalance(const ABusinessConnectionId: String)
      : TftStarAmount;

    /// <summary>
    /// Use this method to send paid media.
    /// </summary>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function SendPaidMedia(AChatId: Variant; AStarCount: Integer;
      AMedia: TList<TftInputPaidMedia>; const ACaption: String = '';
      const AParseMode: String = '';
      ACaptionEntities: TftMessageEntityList = nil;
      ADisableNotification: Boolean = false; AProtectContent: Boolean = false;
      AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
      AMessageThreadId: Integer = 0; const APayload: String = '';
      const ABusinessConnectionId: String = '';
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send a checklist on behalf of a connected business account.
    /// </summary>
    function SendChecklist(const ABusinessConnectionId: String;
      AChatId: Variant; AChecklist: TftInputChecklist;
      ADisableNotification: Boolean = false; AProtectContent: Boolean = false;
      AReplyMarkup: TftInlineKeyboardMarkup = nil;
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to edit a checklist on behalf of a connected business account.
    /// </summary>
    function EditMessageChecklist(const ABusinessConnectionId: String;
      AChatId: Variant; AMessageId: Integer; AChecklist: TftInputChecklist;
      AReplyMarkup: TftInlineKeyboardMarkup = nil): TftMessage;

    /// <summary>
    /// Use this method to send rich messages.
    /// </summary>
    function SendRichMessage(AChatId: Variant;
      ARichMessage: TftInputRichMessage;
      const ABusinessConnectionId: String = '';
      ADisableNotification: Boolean = false; AProtectContent: Boolean = false;
      AMessageThreadId: Integer = 0; AReplyToMessageId: Integer = 0;
      AReplyMarkup: TftReplyBase = nil;
      ADirectMessagesTopicId: Integer = 0;
      const AMessageEffectId: String = '';
      AAllowPaidBroadcast: Boolean = false;
      AReplyParameters: TftReplyParameters = nil;
      ASuggestedPostParameters: TftSuggestedPostParameters = nil;
      AShowCaptionAboveMedia: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to stream a partial rich message.
    /// </summary>
    function SendRichMessageDraft(AChatId: Int64; ADraftId: Integer;
      ARichMessage: TftInputRichMessage; AMessageThreadId: Integer = 0;
      ACanStop: Boolean = false; AKeepOnStop: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to edit an ephemeral text or rich message.
    /// </summary>
    function EditEphemeralMessageText(AChatId: Variant;
      AReceiverUserId: Int64; AEphemeralMessageId: Integer;
      const AText: String = ''; const AParseMode: String = '';
      AEntities: TftMessageEntityList = nil;
      ALinkPreviewOptions: TftLinkPreviewOptions = nil;
      AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;

    /// <summary>
    /// Use this method to edit the media of an ephemeral message.
    /// </summary>
    function EditEphemeralMessageMedia(AChatId: Variant;
      AReceiverUserId: Int64; AEphemeralMessageId: Integer;
      AMedia: TftInputMedia;
      AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;

    /// <summary>
    /// Use this method to edit the caption of an ephemeral message.
    /// </summary>
    function EditEphemeralMessageCaption(AChatId: Variant;
      AReceiverUserId: Int64; AEphemeralMessageId: Integer;
      const ACaption: String = ''; const AParseMode: String = '';
      ACaptionEntities: TftMessageEntityList = nil;
      AShowCaptionAboveMedia: Boolean = false;
      AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;

    /// <summary>
    /// Use this method to edit only the reply markup of an ephemeral message.
    /// </summary>
    function EditEphemeralMessageReplyMarkup(AChatId: Variant;
      AReceiverUserId: Int64; AEphemeralMessageId: Integer;
      AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;

    /// <summary>
    /// Use this method to delete an ephemeral message.
    /// </summary>
    function DeleteEphemeralMessage(AChatId: Variant; AReceiverUserId: Int64;
      AEphemeralMessageId: Integer): Boolean;

    /// <summary>
    /// Use this method to reply to a received guest message.
    /// </summary>
    function AnswerGuestQuery(const AGuestQueryId: String;
      AResult: TftInlineQueryResult): TftSentGuestMessage;

    /// <summary>
    /// Use this method to get the list of boosts added to a chat by a user.
    /// </summary>
    function GetUserChatBoosts(AChatId: Variant; AUserId: Int64)
      : TftUserChatBoosts;

    /// <summary>
    /// Use this method to get the access settings of a managed bot.
    /// </summary>
    function GetManagedBotAccessSettings(AUserId: Int64): TftBotAccessSettings;

    /// <summary>
    /// Use this method to change the access settings of a managed bot.
    /// </summary>
    function SetManagedBotAccessSettings(AUserId: Int64;
      AIsAccessRestricted: Boolean;
      AAddedUserIds: TArray<Integer> = nil): Boolean;

    /// <summary>
    /// Changes the profile photo of the bot.
    /// </summary>
    function SetMyProfilePhoto(APhoto: TftInputProfilePhoto): Boolean;

    /// <summary>
    /// Returns the list of gifts that can be sent by the bot.
    /// </summary>
    function GetAvailableGifts(): TftGifts;

    /// <summary>
    /// Changes the profile photo of a managed business account.
    /// </summary>
    function SetBusinessAccountProfilePhoto(const ABusinessConnectionId: String;
      APhoto: TftInputProfilePhoto; AIsPublic: Boolean = false): Boolean;

    /// <summary>
    /// Changes the privacy settings pertaining to incoming gifts.
    /// </summary>
    function SetBusinessAccountGiftSettings(const ABusinessConnectionId: String;
      AShowGiftButton: Boolean;
      AAcceptedGiftTypes: TftAcceptedGiftTypes): Boolean;

    /// <summary>
    /// Returns the gifts received and owned by a managed business account.
    /// </summary>
    function GetBusinessAccountGifts(const ABusinessConnectionId: String;
      AExcludeUnsaved: Boolean = false; AExcludeSaved: Boolean = false;
      AExcludeUnlimited: Boolean = false;
      AExcludeLimitedUpgradable: Boolean = false;
      AExcludeLimitedNonUpgradable: Boolean = false;
      AExcludeUnique: Boolean = false; AExcludeFromBlockchain: Boolean = false;
      ASortByPrice: Boolean = false; const AOffset: String = '';
      ALimit: Integer = 0): TftOwnedGifts;

    /// <summary>
    /// Returns the gifts owned and hosted by a user.
    /// </summary>
    function GetUserGifts(AUserId: Int64; AExcludeUnlimited: Boolean = false;
      AExcludeLimitedUpgradable: Boolean = false;
      AExcludeLimitedNonUpgradable: Boolean = false;
      AExcludeFromBlockchain: Boolean = false; AExcludeUnique: Boolean = false;
      ASortByPrice: Boolean = false; const AOffset: String = '';
      ALimit: Integer = 0): TftOwnedGifts;

    /// <summary>
    /// Returns the gifts owned by a chat.
    /// </summary>
    function GetChatGifts(AChatId: Variant;
      AExcludeUnsaved: Boolean = false; AExcludeSaved: Boolean = false;
      AExcludeUnlimited: Boolean = false;
      AExcludeLimitedUpgradable: Boolean = false;
      AExcludeLimitedNonUpgradable: Boolean = false;
      AExcludeFromBlockchain: Boolean = false; AExcludeUnique: Boolean = false;
      ASortByPrice: Boolean = false; const AOffset: String = '';
      ALimit: Integer = 0): TftOwnedGifts;

    /// <summary>
    /// Posts a story on behalf of a managed business account.
    /// </summary>
    function PostStory(const ABusinessConnectionId: String;
      AContent: TftInputStoryContent; AActivePeriod: Integer;
      const ACaption: String = ''; const AParseMode: String = '';
      ACaptionEntities: TftMessageEntityList = nil;
      APostToChatPage: Boolean = false;
      AProtectContent: Boolean = false): TftStory;

    /// <summary>
    /// Reposts a story on behalf of a business account.
    /// </summary>
    function RepostStory(const ABusinessConnectionId: String;
      AFromChatId, AFromStoryId, AActivePeriod: Integer;
      APostToChatPage: Boolean = false;
      AProtectContent: Boolean = false): TftStory;

    /// <summary>
    /// Edits a story previously posted by the bot.
    /// </summary>
    function EditStory(const ABusinessConnectionId: String; AStoryId: Integer;
      AContent: TftInputStoryContent; const ACaption: String = '';
      const AParseMode: String = '';
      ACaptionEntities: TftMessageEntityList = nil): TftStory;

    /// <summary>
    /// Deletes a story previously posted by the bot.
    /// </summary>
    function DeleteStory(const ABusinessConnectionId: String;
      AStoryId: Integer): Boolean;

    /// <summary>
    /// Replaces an existing sticker in a sticker set with a new one.
    /// </summary>
    function ReplaceStickerInSet(AUserId: Int64; const AName, AOldSticker: String;
      ASticker: TftInputSticker): Boolean;

    /// <summary>
    /// Returns the bot's Telegram Star transactions.
    /// </summary>
    function GetStarTransactions(AOffset: Integer = 0; ALimit: Integer = 100)
      : TftStarTransactions;

  end;

const
  API_URL = 'https://api.telegram.org/bot%s/%s';

implementation

uses Math;

{ TftAPI }

function TftAPI.AddStickerToSet(AUserId: Int64; const AName, AEmojis: String;
  AMaskPosition: TftMaskPosition; APngSticker: TftInputFile;
  ATgsSticker, AWebmSticker: TftInputFile): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('name', AName);

  if Assigned(APngSticker) then
  begin
    LArgs.AddPair('png_sticker', APngSticker.Data);
    LArgs.AddPair('png_sticker', BoolToStr(true, true));
    LArgs.AddPair('png_sticker', APngSticker.MimeType);
    LArgs.AddPair('png_sticker', APngSticker.FileName);
  end;
  if Assigned(ATgsSticker) then
  begin
    LArgs.AddPair('tgs_sticker', ATgsSticker.Data);
    LArgs.AddPair('tgs_sticker', BoolToStr(true, true));
    LArgs.AddPair('tgs_sticker', ATgsSticker.MimeType);
    LArgs.AddPair('tgs_sticker', ATgsSticker.FileName);
  end;
  if Assigned(AWebmSticker) then
  begin
    LArgs.AddPair('webm_sticker', AWebmSticker.Data);
    LArgs.AddPair('webm_sticker', BoolToStr(true, true));
    LArgs.AddPair('webm_sticker', AWebmSticker.MimeType);
    LArgs.AddPair('webm_sticker', AWebmSticker.FileName);
  end;
  LArgs.AddPair('emojis', AEmojis);
  if Assigned(AMaskPosition) then
  begin
    LArgs.AddPair('mask_position',
      FTypeParser.ParseMaskPosition(AMaskPosition));
  end;

  Result := Boolean(SendRequest('addStickerToSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.AnswerCallbackQuery(const ACallbackQueryId, AText: String;
  AShowAlert: Boolean; const AURL: String; ACacheTime: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('callback_query_id', ACallbackQueryId);
  if (AText <> '') then
  begin
    LArgs.AddPair('text', AText);
  end;
  if (AShowAlert) then
  begin
    LArgs.AddPair('show_alert', BoolToStr(AShowAlert, true));
  end;
  if (AURL <> '') then
  begin
    LArgs.AddPair('url', AURL);
  end;
  if (ACacheTime <> 0) then
  begin
    LArgs.AddPair('cache_time', IntToStr(ACacheTime));
  end;

  Result := Boolean(SendRequest('answerCallbackQuery', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.AnswerInlineQuery(const AInlineQueryId: String;
  const AResults: TList<TftInlineQueryResult>; ACacheTime: Integer;
  AIsPersonal: Boolean; const ANextOffset, ASwitchPmText, ASwitchPmParameter
  : String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('inline_query_id', AInlineQueryId);
  LArgs.AddPair('results', FTypeParser.ParseList(AResults));
  if (ACacheTime <> 0) then
  begin
    LArgs.AddPair('cache_time', IntToStr(ACacheTime));
  end;
  if (AIsPersonal) then
  begin
    LArgs.AddPair('is_personal', BoolToStr(AIsPersonal, true));
  end;
  if (ANextOffset <> '') then
  begin
    LArgs.AddPair('next_offset', ANextOffset);
  end;
  if (ASwitchPmText <> '') then
  begin
    LArgs.AddPair('switch_pm_text', ASwitchPmText);
  end;
  if (ASwitchPmParameter <> '') then
  begin
    LArgs.AddPair('switch_pm_parameter', ASwitchPmParameter);
  end;

  Result := Boolean(SendRequest('answerInlineQuery', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.AnswerPreCheckoutQuery(const APreCheckoutQueryId: String;
  AOk: Boolean; const AErrorMessage: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('pre_checkout_query_id', APreCheckoutQueryId);
  LArgs.AddPair('ok', BoolToStr(AOk, true));
  if (AErrorMessage <> '') then
  begin
    LArgs.AddPair('error_message', AErrorMessage);
  end;

  Result := Boolean(SendRequest('answerPreCheckoutQuery', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.AnswerShippingQuery(AShippingQueryId: String; AOk: Boolean;
  AShippingOptions: TList<TftShippingOption>; AErrorMessage: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('shipping_query_id', AShippingQueryId);
  LArgs.AddPair('ok', BoolToStr(AOk, true));
  if (AErrorMessage <> '') then
  begin
    LArgs.AddPair('error_message', AErrorMessage);
  end;

  Result := Boolean(SendRequest('answerShippingQuery', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.AnswerWebAppQuery(const AWebAppQueryId: String;
  AResult: TftInlineQueryResult): TftSentWebAppMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('web_app_query_id', AWebAppQueryId);
  LArgs.AddPair('result', FTypeParser.ParseInlineQueryResult(AResult));

  Result := FTypeParser.ParseJsonAndGetSentWebAppMessage
    (SendRequest('answerWebAppQuery', LArgs, 'POST'));
end;

function TftAPI.ApproveChatJoinRequest(AChatId, AUserId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := Boolean(SendRequest('approveChatJoinRequest', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.BanChatMember(AChatId, AUserId: Int64; AUntilDate: Integer;
  ARevokeMessages: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (AUntilDate <> 0) then
  begin
    LArgs.AddPair('until_date', IntToStr(AUntilDate));
  end;
  if (ARevokeMessages) then
  begin
    LArgs.AddPair('revoke_messages', BoolToStr(ARevokeMessages, true));
  end;

  Result := Boolean(SendRequest('banChatMember', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.BanChatSenderChat(AChatId, ASenderChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('sender_chat_id', IntToStr(ASenderChatId));

  Result := Boolean(SendRequest('banChatSenderChat', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.BlockedByUser(AChatId: Int64): Boolean;
var
  LIsBotBlocked: Boolean;
begin
  LIsBotBlocked := false;

  try
    SendChatAction(AChatId, 'typing');
  except
    on E: Exception do
    begin
      if CompareStr(E.Message, 'Forbidden: bot was blocked by the user') = 0
      then
      begin
        LIsBotBlocked := true;
      end;
    end;
  end;

  Result := LIsBotBlocked;
end;

function TftAPI.Close: Boolean;
begin
  Result := JsonToBool(SendRequest('close').GetValue('result'));
end;

function TftAPI.CloseForumTopic(AChatId: Int64;
  AMessageThreadId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));

  Result := Boolean(SendRequest('closeForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.CloseGeneralForumTopic(AChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));

  Result := Boolean(SendRequest('closeGeneralForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.CopyMessage(AChatId, AFromChatId: Int64; AMessageId: Integer;
  const ACaption, AParseMode: String;
  const ACaptionEntities: TList<TftMessageEntity>;
  ADisableNotification: Boolean; AReplyToMessageId: Integer;
  AAllowSendingWithoutReply: Boolean; AReplyMarkup: TftReplyBase;
  AProtectContent: Boolean; AMessageThreadId: Integer): TftMessageId;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;

  LArgs.AddPair('from_chat_id', IntToStr(AFromChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  if (ACaption <> '') then
  begin
    LArgs.AddPair('caption', ACaption);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddPair('parse_mode', AParseMode);
  end;
  if (Assigned(ACaptionEntities)) then
  begin
    LArgs.AddPair('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;
  if (Assigned(AReplyMarkup)) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;
  Result := FTypeParser.ParseJsonAndGetMessageId(SendRequest('copyMessage',
    LArgs, 'POST'));
end;

constructor TftAPI.Create(AToken: String; const AHttpClient: TftHTTPClient;
  const AURL: String);
begin
  FToken := AToken;
  FHttpClient := AHttpClient;
  FTypeParser := TftTypeParser.Create;
  FUrl := AURL;
end;

function TftAPI.CreateChatInviteLink(AChatId: Int64;
  AExpireDate, AMemberLimit: Integer; AName: String;
  ACreatesJoinRequest: Boolean): TftChatInviteLink;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;
  if (AExpireDate <> 0) then
  begin
    LArgs.AddPair('expire_date', IntToStr(AExpireDate));
  end;
  if (AMemberLimit <> 0) then
  begin
    LArgs.AddPair('member_limit', IntToStr(AMemberLimit));
  end;
  if (ACreatesJoinRequest) then
  begin
    LArgs.AddPair('createsJoinRequest', BoolToStr(ACreatesJoinRequest, true));
  end;

  Result := FTypeParser.ParseJsonAndGetChatInviteLink
    (SendRequest('createChatInviteLink', LArgs, 'POST'));
end;

function TftAPI.CreateForumTopic(AChatId: Int64; AName: String;
  AIconColor: Integer; AIconCustomEmojiId: String): TftForumTopic;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;
  if (AIconColor <> 0) then
  begin
    LArgs.AddPair('icon_color', IntToStr(AIconColor));
  end;
  if (AIconCustomEmojiId <> '') then
  begin
    LArgs.AddPair('icon_custom_emoji_id', AIconCustomEmojiId);
  end;

  Result := FTypeParser.ParseJsonAndGetForumTopic
    (SendRequest('createForumTopic', LArgs, 'POST'));
end;

function TftAPI.CreateInvoiceLink(const ATitle, ADescription, APayload,
  AProviderToken, ACurrency: String; const APrices: TList<TftLabeledPrice>;
  AMaxTipAmount: Integer; const ASuggestedTipAmounts: TList<Integer>;
  const AProviderData, APhotoUrl: String; APhotoSize, APhotoWidth,
  APhotoHeight: Integer; ANeedName, ANeedPhoneNumber, ANeedEmail,
  ANeedShippingAddress, ASendPhoneNumberToProvider, ASendEmailToProvider,
  AIsFlexible: Boolean): String;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('title', ATitle);
  LArgs.AddPair('description', ADescription);
  LArgs.AddPair('payload', APayload);
  LArgs.AddPair('provider_token', AProviderToken);
  LArgs.AddPair('currency', ACurrency);
  LArgs.AddPair('prices', FTypeParser.ParseList(APrices));
  LArgs.AddPair('max_tip_amount', IntToStr(AMaxTipAmount));
  if Assigned(ASuggestedTipAmounts) then
  begin
    LArgs.AddPair('suggested_tip_amounts',
      FTypeParser.ParseList(ASuggestedTipAmounts));
  end;
  if AProviderData <> '' then
  begin
    LArgs.AddPair('provider_data', AProviderData);
  end;
  if APhotoUrl <> '' then
  begin
    LArgs.AddPair('photo_url', APhotoUrl);
  end;
  if APhotoSize <> 0 then
  begin
    LArgs.AddPair('photo_size', IntToStr(APhotoSize));
  end;
  if APhotoWidth <> 0 then
  begin
    LArgs.AddPair('photo_width', IntToStr(APhotoWidth));
  end;
  if APhotoHeight <> 0 then
  begin
    LArgs.AddPair('photo_height', IntToStr(APhotoHeight));
  end;
  if ANeedName then
  begin
    LArgs.AddPair('need_name', BoolToStr(ANeedName, true));
  end;
  if ANeedPhoneNumber then
  begin
    LArgs.AddPair('need_phone_number', BoolToStr(ANeedPhoneNumber, true));
  end;
  if ANeedEmail then
  begin
    LArgs.AddPair('need_email', BoolToStr(ANeedEmail, true));
  end;
  if ANeedShippingAddress then
  begin
    LArgs.AddPair('need_shipping_address',
      BoolToStr(ANeedShippingAddress, true));
  end;
  if ASendPhoneNumberToProvider then
  begin
    LArgs.AddPair('send_phone_number_to_provider',
      BoolToStr(ASendPhoneNumberToProvider, true));
  end;
  if ASendEmailToProvider then
  begin
    LArgs.AddPair('send_email_to_provider',
      BoolToStr(ASendEmailToProvider, true));
  end;
  if AIsFlexible then
  begin
    LArgs.AddPair('is_flexible', BoolToStr(AIsFlexible, true));
  end;

  Result := String(SendRequest('createInvoiceLink', LArgs, 'POST')
    .GetValue('result'));

end;

function TftAPI.CreateNewStickerSet(AUserId: Int64;
  const AName, ATitle, AEmojis: String; AMaskPosition: TftMaskPosition;
  APngSticker: TftInputFile; ATgsSticker, AWebmSticker: TftInputFile;
  AStickerType: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('user_id', VarToStr(AUserId));
  LArgs.AddPair('name', AName);
  LArgs.AddPair('title', ATitle);

  if Assigned(APngSticker) then
  begin
    LArgs.AddPair('png_sticker', APngSticker.Data);
    LArgs.AddPair('png_sticker', BoolToStr(true, true));
    LArgs.AddPair('png_sticker', APngSticker.MimeType);
    LArgs.AddPair('png_sticker', APngSticker.FileName);
  end;
  if Assigned(ATgsSticker) then
  begin
    LArgs.AddPair('tgs_sticker', ATgsSticker.Data);
    LArgs.AddPair('tgs_sticker', BoolToStr(true, true));
    LArgs.AddPair('tgs_sticker', ATgsSticker.MimeType);
    LArgs.AddPair('tgs_sticker', ATgsSticker.FileName);
  end;
  if Assigned(AWebmSticker) then
  begin
    LArgs.AddPair('webm_sticker', AWebmSticker.Data);
    LArgs.AddPair('webm_sticker', BoolToStr(true, true));
    LArgs.AddPair('webm_sticker', AWebmSticker.MimeType);
    LArgs.AddPair('webm_sticker', AWebmSticker.FileName);
  end;
  if AStickerType <> '' then
  begin
    LArgs.AddPair('sticker_type', AStickerType);
  end;
  LArgs.AddPair('emojis', AEmojis);
  if Assigned(AMaskPosition) then
  begin
    LArgs.AddPair('mask_position',
      FTypeParser.ParseMaskPosition(AMaskPosition));
  end;

  Result := Boolean(SendRequest('createNewStickerSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeclineChatJoinRequest(AChatId, AUserId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := Boolean(SendRequest('declineChatJoinRequest', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteChatPhoto(AChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));

  Result := Boolean(SendRequest('deleteChatPhoto', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteChatStickerSet(AChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));

  Result := Boolean(SendRequest('deleteChatStickerSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteForumTopic(AChatId: Int64;
  AMessageThreadId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));

  Result := Boolean(SendRequest('deleteForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteMessage(AChatId: Variant; AMessageId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));

  Result := Boolean(SendRequest('deleteMessage', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteMyCommands(AScope: TftBotCommandScope;
  const ALanguageCode: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if Assigned(AScope) then
  begin
    LArgs.AddPair('scope', FTypeParser.ParseBotCommandScope(AScope));
  end;
  if ALanguageCode <> '' then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := Boolean(SendRequest('deleteMyCommands', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteStickerFromSet(ASticker: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('sticker', ASticker);

  Result := Boolean(SendRequest('deleteStickerFromSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteWebhook(ADropPendingUpdates: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (ADropPendingUpdates) then
  begin
    LArgs.AddPair('drop_pending_updates', BoolToStr(ADropPendingUpdates, true));
  end;

  Result := Boolean(SendRequest('deleteWebhook', LArgs, 'POST')
    .GetValue('result'));
end;

destructor TftAPI.Destroy;
begin
  // The HTTP client is owned by TftBot.
  FreeAndNil(FTypeParser);
  inherited;
end;

function TftAPI.EditChatInviteLink(AChatId: Int64; const AInviteLink: String;
  AExpireDate: Integer = 0; AMemberLimit: Integer = 0; const AName: String = '';
  ACreatesJoinRequest: Boolean = false): TftChatInviteLink;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('invite_link', AInviteLink);
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;

  if (AExpireDate <> 0) then
  begin
    LArgs.AddPair('expire_date', IntToStr(AExpireDate));
  end;
  if (AMemberLimit <> 0) then
  begin
    LArgs.AddPair('member_limit', IntToStr(AMemberLimit));
  end;
  if (ACreatesJoinRequest) then
  begin
    LArgs.AddPair('createsJoinRequest', BoolToStr(ACreatesJoinRequest, true));
  end;

  Result := FTypeParser.ParseJsonAndGetChatInviteLink
    (SendRequest('editChatInviteLink', LArgs, 'POST'));
end;

function TftAPI.EditForumTopic(AChatId: Int64; AMessageThreadId: Integer;
  AName: String; AIconCustomEmojiId: Int8): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;

  if (AIconCustomEmojiId <> 0) then
  begin
    LArgs.AddPair('icon_custom_emoji_id', IntToStr(AIconCustomEmojiId));
  end;

  Result := Boolean(SendRequest('editForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditGeneralForumTopic(AChatId: Int64; AName: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('name', AName);

  Result := Boolean(SendRequest('editGeneralForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditMessageCaption(AChatId: Variant; AMessageId: Integer;
  ACaption: String; const AInlineMessageId: String; AReplyMarkup: TftReplyBase;
  AParseMode: String; ACaptionEntities: TftMessageEntityList): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AChatId <> 0) then
  begin
    LArgs.AddPair('chat_id', VarToStr(AChatId));
  end;
  if (AMessageId <> 0) then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;
  if (AInlineMessageId <> '') then
  begin
    LArgs.AddPair('inline_message_id', AInlineMessageId);
  end;
  if (ACaption <> '') then
  begin
    LArgs.AddPair('caption', ACaption);
  end;
  if (AParseMode = '') then
  begin
    LArgs.AddPair('parse_mode', AParseMode);
  end;
  if (Assigned(ACaptionEntities)) then
  begin
    LArgs.AddPair('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;
  if (Assigned(AReplyMarkup)) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;
  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('editMessageCaption',
    LArgs, 'POST'));
end;

function TftAPI.EditMessageLiveLocation(ALatitude, ALongitude: Double;
  AChatId: Variant; AMessageId: Integer; const AInlineMessageId: String;
  AReplyMarkup: TftInlineKeyboardMarkup; AHorizontalAccuracy: Double;
  AHeading, AProximityAlertRadius: Integer): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AChatId <> 0) then
  begin
    LArgs.AddPair('chat_id', VarToStr(AChatId));
  end;
  if (AMessageId <> 0) then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;
  if (AInlineMessageId <> '') then
  begin
    LArgs.AddPair('inline_message_id', AInlineMessageId);
  end;
  LArgs.AddPair('latitude', VarToStr(ALatitude));
  LArgs.AddPair('longitude', VarToStr(ALongitude));
  if (AHorizontalAccuracy <> 0) then
  begin
    LArgs.AddPair('horizontal_accuracy', VarToStr(AHorizontalAccuracy));
  end;
  if (AHeading <> 0) then
  begin
    LArgs.AddPair('heading', IntToStr(AHeading));
  end;
  if (AProximityAlertRadius <> 0) then
  begin
    LArgs.AddPair('proximity_alert_radius', IntToStr(AProximityAlertRadius));
  end;
  if (Assigned(AReplyMarkup)) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;
  Result := FTypeParser.parseJsonAndGetMessage
    (SendRequest('editMessageLiveLocation', LArgs, 'POST'));
end;

function TftAPI.EditMessageMedia(AMedia: TftInputMedia;
  AChatId, AMessageId: Integer; ACaption: String;
  const AInlineMessageId: String; AReplyMarkup: TftReplyBase): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TStringList.Create;
  if Assigned(AMedia) then
  begin
    LArgs.AddPair('media', FTypeParser.parseInputMedia(AMedia));
  end;
  if (AChatId <> 0) then
  begin
    LArgs.AddPair('chat_id', VarToStr(AChatId));
  end;
  if (AMessageId <> 0) then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;
  if (AInlineMessageId <> '') then
  begin
    LArgs.AddPair('inline_message_id', AInlineMessageId);
  end;

  if (Assigned(AReplyMarkup)) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('editMessageMedia',
    LArgs, 'POST'));
end;

function TftAPI.EditMessageReplyMarkup(AChatId: Variant; AMessageId: Integer;
  const AInlineMessageId: String; AReplyMarkup: TftReplyBase): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AChatId <> 0) then
  begin
    LArgs.AddPair('chat_id', VarToStr(AChatId));
  end;
  if (AMessageId <> 0) then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;
  if (AInlineMessageId <> '') then
  begin
    LArgs.AddPair('inline_message_id', AInlineMessageId);
  end;
  if (Assigned(AReplyMarkup)) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;
  Result := FTypeParser.parseJsonAndGetMessage
    (SendRequest('editMessageReplyMarkup', LArgs, 'POST'));
end;

function TftAPI.EditMessageText(const AText: String;
  AChatId, AMessageId: Integer; const AInlineMessageId, AParseMode: String;
  ADisableWebPagePreview: Boolean; AReplyMarkup: TftReplyBase): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  LArgs.AddPair('inline_message_id', AInlineMessageId);
  LArgs.AddPair('text', AText);
  LArgs.AddPair('parse_mode', AParseMode);

  if (ADisableWebPagePreview) then
    LArgs.AddPair('disableWebPagePreview',
      LowerCase(BoolToStr(ADisableWebPagePreview, true)));
  if (AReplyMarkup <> nil) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('editMessageText',
    LArgs, 'POST'));
end;

function TftAPI.ExportChatInviteLink(AChatId: Variant): String;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := String(SendRequest('exportChatInviteLink', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ForwardMessage(AChatId: Int64; AFromChatId: Int64;
  AMessageId: Integer; ADisableNotification: Boolean; AProtectContent: Boolean;
  AMessageThreadId: Integer): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));

  if AMessageThreadId <> 0 then
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));

  LArgs.AddPair('from_chat_id', IntToStr(AFromChatId));

  if (ADisableNotification) then
    LArgs.AddPair('disable_notification',
      LowerCase(BoolToStr(ADisableNotification, true)));
  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;
  LArgs.AddPair('message_id', IntToStr(AMessageId));

  Result := FTypeParser.parseJsonAndGetMessage
    (SendRequest('forwardMessage', LArgs));
end;

function TftAPI.GetChat(AChatId: Variant): TftChat;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := FTypeParser.parseJsonAndGetChat(SendRequest('getChat', LArgs));
end;

function ParseFunJSONArrayTftChatMember(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftChatMemberFromJson(JSONArray.Items[Index]);
end;

function TftAPI.GetChatAdministrators(AChatId: Variant): TList<TftChatMember>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := TList<TftChatMember>(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftChatMember, (SendRequest('getChatAdministrators',
    LArgs))));
end;

function TftAPI.GetChatMember(AChatId: Variant; AUserId: Int64): TftChatMember;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', VarToStr(AUserId));

  Result := FTypeParser.ParseJsonAndGetChatMember
    (SendRequest('getChatMember', LArgs));
end;

function TftAPI.GetChatMemberCount(AChatId: Variant): Integer;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Integer(SendRequest('getChatMemberCount', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetChatMenuButton(AChatId: Variant): TftMenuButton;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := FTypeParser.ParseJsonAndGetMenuButton
    (SendRequest('getChatMenuButton', LArgs));
end;

function TftAPI.GetFile(AFileId: String): TftFile;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('file_id', VarToStr(AFileId));

  Result := FTypeParser.ParseJsonAndGetFile(SendRequest('getFile', LArgs));
end;

function ParseFunJSONArrayTftSticker(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftStickerFromJson(JSONArray.Items[Index]);
end;

function TftAPI.GetForumTopicIconStickers: TList<TftSticker>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  Result := TList<TftSticker>(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftSticker, (SendRequest('getForumTopicIconStickers',
    LArgs))));
end;

function ParseFunJSONArrayTftGameHighScore(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftGameHighScoreFromJson(JSONArray.Items[Index]);
end;

function TftAPI.GetGameHighScores(AUserId, AChatId: Int64; AMessageId: Integer;
  const AInlineMessageId: String): TList<TftGameHighScore>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if AChatId <> 0 then
  begin
    LArgs.AddPair('chat_id', IntToStr(AChatId));
  end;

  if AMessageId <> 0 then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;

  if (AInlineMessageId <> '') then
  begin
    LArgs.AddPair('inline_message_id', AInlineMessageId);
  end;

  Result := TList<TftGameHighScore>
    (FTypeParser.ParseJsonAndGetList(ParseFunJSONArrayTftGameHighScore,
    (SendRequest('getGameHighScores', LArgs))));
end;

function TftAPI.GetMe: TftUser;
begin
  Result := FTypeParser.ParseJsonAndGetUser(SendRequest('getMe'));
end;

function parseFunJSONArrayTftBotCommand(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftBotCommandFromJson(JSONArray.Items[Index]);
end;

function TftAPI.GetMyCommands(AScope: TftBotCommandScope;
  const ALanguageCode: String): TArray<TftBotCommand>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if Assigned(AScope) then
  begin
    LArgs.AddPair('scope', FTypeParser.ParseBotCommandScope(AScope));
  end;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := TArray<TftBotCommand>
    (FTypeParser.ParseJsonAndGetList(parseFunJSONArrayTftBotCommand,
    SendRequest('getMyCommands', LArgs)));
end;

function TftAPI.GetMyDefaultAdministratorRights(AForChannels: Boolean)
  : TftChatAdministratorRights;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if AForChannels then
  begin
    LArgs.AddPair('for_channels', BoolToStr(AForChannels, true));
  end;

  Result := FTypeParser.ParseJsonAndGetChatAdministratorRights
    (SendRequest('getMyDefaultAdministratorRights', LArgs));
end;

function TftAPI.GetStickerSet(const AName: String): TftStickerSet;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('name', AName);

  Result := FTypeParser.ParseJsonAndGetStickerSet
    (SendRequest('getStickerSet', LArgs));
end;

function TftAPI.GetToken: String;
begin
  Result := FToken;
end;

function ParseFunJSONArrayTftMessage(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftMessageFromJson(JSONArray.Items[Index]);
end;

function ParseFunJSONArrayTftUpdate(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftUpdateFromJson(JSONArray.Items[Index]);
end;

function TftAPI.GetUpdates(AOffset, ALimit, ATimeout: Integer;
  const AAllowedUpdates: TObject): TftUpdateList;
var
  LArgs: TStringList;
  LAllowedUpdatesJson: String;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AOffset >= -1) then
    LArgs.AddPair('offset', IntToStr(AOffset));
  ALimit := Max(1, Min(100, ALimit));
  LArgs.AddPair('limit', IntToStr(ALimit));
  if (ATimeout >= 0) then
    LArgs.AddPair('timeout', IntToStr(ATimeout));
  if (AAllowedUpdates <> nil) then
  begin
    LAllowedUpdatesJson := FTypeParser.ParseStrings(TStrings(AAllowedUpdates));
    LArgs.AddPair('allowed_updates', LAllowedUpdatesJson);
  end;
  if (AOffset <= 0) then
    Result := TftUpdateList(FTypeParser.ParseJsonAndGetList
      (ParseFunJSONArrayTftUpdate, SendRequest('getUpdates', LArgs)))
  else
    Result := TftUpdateList(FTypeParser.ParseJsonAndGetList
      (ParseFunJSONArrayTftUpdate, SendRequest('getUpdates', LArgs, 'POST')));
end;

function TftAPI.GetUserProfilePhotos(AUserId: Int64; AOffset, ALimit: Integer)
  : TftUserProfilePhotos;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (AOffset <> 0) then
  begin
    LArgs.AddPair('offset', IntToStr(AOffset));
  end;
  if (ALimit <> 100) then
  begin
    LArgs.AddPair('limit', IntToStr(Max(1, Min(100, ALimit))));
  end;

  Result := FTypeParser.ParseJsonAndGetUserProfilePhotos
    (SendRequest('getUserProfilePhotos', LArgs));
end;

function TftAPI.GetWebhookInfo: TftWebhookInfo;
begin
  // TODO
  Result := FTypeParser.ParseJsonAndGetWebhookInfo
    (SendRequest('getWebhookInfo'));
end;

function TftAPI.HideGeneralForumTopic(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('hideGeneralForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.LeaveChat(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('leaveChat', LArgs, 'POST').GetValue('result'));
end;

function TftAPI.LogOut: Boolean;
begin
  Result := JsonToBool(SendRequest('logOut').GetValue('result'));
end;

function TftAPI.PinChatMessage(AChatId: Variant; AMessageId: Integer;
  ADisableNotification: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  if true then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  Result := Boolean(SendRequest('pinChatMessage', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.PromoteChatMember(AChatId: Variant; AUserId: Integer;
  ACanChangeInfo, ACanPostMessages, ACanEditMessages, ACanDeleteMessages,
  ACanInviteUsers, ACanPinMessages, ACanPromoteMembers, AIsAnonymous,
  ACanManageChat, ACanManageVideoChats, ACanRestrictMembers, ACanManageTopics
  : Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (AIsAnonymous) then
  begin
    LArgs.AddPair('is_anonymous', BoolToStr(AIsAnonymous, true));
  end;

  if (ACanManageChat) then
  begin
    LArgs.AddPair('can_manage_chat', BoolToStr(ACanManageChat, true));
  end;

  if (ACanPostMessages) then
  begin
    LArgs.AddPair('can_post_messages', BoolToStr(ACanPostMessages, true));
  end;

  if (ACanEditMessages) then
  begin
    LArgs.AddPair('can_edit_messages', BoolToStr(ACanEditMessages, true));
  end;

  if (ACanDeleteMessages) then
  begin
    LArgs.AddPair('can_delete_messages', BoolToStr(ACanDeleteMessages, true));
  end;

  if (ACanManageVideoChats) then
  begin
    LArgs.AddPair('can_manage_video_chats',
      BoolToStr(ACanManageVideoChats, true));
  end;

  if (ACanRestrictMembers) then
  begin
    LArgs.AddPair('can_restrict_members', BoolToStr(ACanRestrictMembers, true));
  end;

  if (ACanPromoteMembers) then
  begin
    LArgs.AddPair('can_promote_members', BoolToStr(ACanPromoteMembers, true));
  end;

  if (ACanChangeInfo) then
  begin
    LArgs.AddPair('can_change_info', BoolToStr(ACanChangeInfo, true));
  end;

  if (ACanInviteUsers) then
  begin
    LArgs.AddPair('can_invite_users', BoolToStr(ACanInviteUsers, true));
  end;

  if (ACanPinMessages) then
  begin
    LArgs.AddPair('can_pin_messages', BoolToStr(ACanPinMessages, true));
  end;

  if (ACanManageTopics) then
  begin
    LArgs.AddPair('can_manage_topics', BoolToStr(ACanManageTopics, true));
  end;

  Result := Boolean(SendRequest('promoteChatMember', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ReopenForumTopic(AChatId: Variant;
  AMessageThreadId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));

  Result := Boolean(SendRequest('reopenForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ReopenGeneralForumTopic(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('reopenGeneralForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.RestrictChatMember(AChatId: Variant; AUserId: Integer;
  APermissions: TftChatPermissions; AUntilDate: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('permissions', FTypeParser.ParseChatPermissions(APermissions));
  if (AUntilDate <> 0) then
  begin
    LArgs.AddPair('until_date', IntToStr(AUntilDate));
  end;

  Result := Boolean(SendRequest('restrictChatMember', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.RevokeChatInviteLink(AChatId: Variant; AInviteLink: String)
  : TftChatInviteLink;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('invite_link', AInviteLink);

  Result := FTypeParser.ParseJsonAndGetChatInviteLink
    (SendRequest('getUserProfilePhotos', LArgs));
end;

function TftAPI.SendAnimation(AChatId: Variant; AAnimation: TftInputFile;
  ADuration: Integer = 0; AWidth: Integer = 0; AHeight: Integer = 0;
  AThumb: TftInputFile = nil; const ACaption: String = '';
  AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
  const AParseMode: String = ''; ADisableNotification: Boolean = false;
  const ACaptionEntities: TftMessageEntityList = nil;
  AAllowSendingWithoutReply: Boolean = false; AProtectContent: Boolean = false;
  AMessageThreadId: Integer = 0; AHasSpoiler: Boolean = false;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if AMessageThreadId <> 0 then
  begin
    LArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
  end;

  if Assigned(AAnimation) then
  begin
    // TODO
    LArgs.AddFile('animation', AAnimation.filePath);
  end;

  if ADuration <> 0 then
  begin
    LArgs.AddField('duration', IntToStr(ADuration));
  end;
  if AWidth <> 0 then
  begin
    LArgs.AddField('width', IntToStr(AWidth));
  end;
  if AHeight <> 0 then
  begin
    LArgs.AddField('height', IntToStr(AHeight));
  end;
  if Assigned(AThumb) then
  begin
    // TODO
    LArgs.AddFile('thumb', AThumb.filePath);
  end;
  if (ACaption <> '') then
  begin
    LArgs.AddField('caption', ACaption);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddField('parse_mode', AParseMode);
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;
  if (AHasSpoiler) then
  begin
    LArgs.AddField('has_spoiler', BoolToStr(AHasSpoiler, true));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendAnimation',
    LArgs, 'POST'));
end;

function TftAPI.SendAudio(AChatId: Variant; AAudio: TftInputFile = nil;
  const ACaption: string = ''; ADuration: Integer = 0;
  const APerformer: string = ''; const ATitle: string = '';
  AThumb: TftInputFile = nil; AReplyToMessageId: Integer = 0;
  AReplyMarkup: TftReplyBase = nil; const AParseMode: String = '';
  ADisableNotification: Boolean = false;
  const ACaptionEntities: TftMessageEntityList = nil;
  AAllowSendingWithoutReply: Boolean = false; AProtectContent: Boolean = false;
  AMessageThreadId: Integer = 0;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;

  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
  end;

  if Assigned(AAudio) then
  begin
    // TODO
    LArgs.AddFile('audio', AAudio.filePath);
  end;

  if (ACaption <> '') then
  begin
    LArgs.AddField('caption', ACaption);
  end;

  if (AParseMode <> '') then
  begin
    LArgs.AddField('parse_mode', AParseMode);
  end;

  if Assigned(ACaptionEntities) then
  begin
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;

  if (ADuration <> 0) then
  begin
    LArgs.AddField('duration', IntToStr(ADuration));
  end;

  if (APerformer <> '') then
  begin
    LArgs.AddField('performer', APerformer);
  end;

  if (ATitle <> '') then
  begin
    LArgs.AddField('title', ATitle);
  end;

  if Assigned(AThumb) then
  begin
    // TODO
    LArgs.AddFile('thumb', AThumb.filePath);
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddField('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendAudio',
    LArgs, 'POST'));
end;

function TftAPI.SendChatAction(AChatId: Int64; const AAction: String;
  AMessageThreadId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('action', AAction);
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;

  Result := Boolean(SendRequest('deleteWebhook', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SendContact(AChatId: Variant; const APhoneNumber: String;
  const AFirstName: String; const ALastName: String = '';
  const AVcard: String = ''; ADisableNotification: Boolean = false;
  AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
  AAllowSendingWithoutReply: Boolean = false; AProtectContent: Boolean = false;
  AMessageThreadId: Integer = 0;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', IntToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);

  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;

  if (APhoneNumber <> '') then
  begin
    LArgs.AddPair('phone_number', APhoneNumber);
  end;

  if (AFirstName <> '') then
  begin
    LArgs.AddPair('first_name', AFirstName);
  end;

  if (ALastName <> '') then
  begin
    LArgs.AddPair('last_name', ALastName);
  end;

  if (AVcard <> '') then
  begin
    LArgs.AddPair('vcard', AVcard);
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendContact',
    LArgs, 'POST'));
end;

function TftAPI.SendDice(AChatId: Variant;
  ADisableNotification: Boolean = false; AReplyToMessageId: Integer = 0;
  AReplyMarkup: TftReplyBase = nil; AEmoji: String = '';
  AAllowSendingWithoutReply: Boolean = false; AProtectContent: Boolean = false;
  AMessageThreadId: Integer = 0;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', IntToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);

  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;

  if (AEmoji <> '') then
  begin
    LArgs.AddPair('emoji', AEmoji);
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendDice',
    LArgs, 'POST'));
end;

function TftAPI.SendDocument(AChatId: Variant; ADocument: TftInputFile = nil;
  AThumb: TftInputFile = nil; const ACaption: String = '';
  AReplyToMessageId: Integer = 0; AReplyMarkup: TftReplyBase = nil;
  const AParseMode: String = ''; ADisableNotification: Boolean = false;
  const ACaptionEntities: TftMessageEntityList = nil;
  ADisableContentTypeDetection: Boolean = false;
  AAllowSendingWithoutReply: Boolean = false; AProtectContent: Boolean = false;
  AMessageThreadId: Integer = 0;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if Assigned(ADocument) then
  begin
    LArgs.AddFile('document', ADocument.filePath);
  end;

  if Assigned(AThumb) then
  begin
    LArgs.AddFile('thumb', AThumb.filePath);
  end;

  if (ACaption <> '') then
  begin
    LArgs.AddField('caption', ACaption);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddField('parse_mode', AParseMode);
  end;

  if (Assigned(ACaptionEntities)) then
  begin
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;

  if (ADisableContentTypeDetection) then
  begin
    LArgs.AddField('disable_content_type_detection',
      BoolToStr(ADisableContentTypeDetection, true));
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId >= 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddField('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if (AReplyMarkup <> nil) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendDocument',
    LArgs, 'POST'));
end;

function TftAPI.SendGame(AChatId: Variant; AGameShortName: String;
  AReplyToMessageId: Integer = 0; AReplyMarkup: TftInlineKeyboardMarkup = nil;
  ADisableNotification: Boolean = false;
  AAllowSendingWithoutReply: Boolean = false; AProtectContent: Boolean = false;
  AMessageThreadId: Integer = 0;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', IntToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);

  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;

  if (AGameShortName <> '') then
  begin
    LArgs.AddPair('game_short_name', AGameShortName);
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendGame',
    LArgs, 'POST'));
end;

function TftAPI.SendInvoice(AChatId: Variant; const ATitle, ADescription,
  APayload, AProviderToken, AStartParameter, ACurrency, APrices, AProviderData,
  APhotoUrl: String; APhotoSize, APhotoWidth, APhotoHeight: Integer;
  ANeedName, ANeedPhoneNumber, ANeedEmail, ANeedShippingAddress,
  ASendPhoneNumberToProvider, ASendEmailToProvider, AIsFlexible: Boolean;
  AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
  ADisableNotification: Boolean;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  LArgs.AddPair('title', ATitle);
  LArgs.AddPair('description', ADescription);
  LArgs.AddPair('payload', APayload);
  LArgs.AddPair('provider_token', AProviderToken);
  if (AStartParameter <> '') then
  begin
    LArgs.AddPair('start_parameter', AStartParameter);
  end;
  LArgs.AddPair('currency', ACurrency);
  LArgs.AddPair('prices', APrices);
  if (AProviderData <> '') then
  begin
    LArgs.AddPair('provider_data', AProviderData);
  end;
  if (APhotoUrl <> '') then
  begin
    LArgs.AddPair('photo_url', APhotoUrl);
  end;
  if (APhotoSize <> 0) then
  begin
    LArgs.AddPair('photo_size', IntToStr(APhotoSize));
  end;
  if (APhotoWidth <> 0) then
  begin
    LArgs.AddPair('photo_width', IntToStr(APhotoWidth));
  end;
  if (APhotoHeight <> 0) then
  begin
    LArgs.AddPair('photo_height', IntToStr(APhotoHeight));
  end;
  if (ANeedName) then
  begin
    LArgs.AddPair('need_name', BoolToStr(ANeedName, true));
  end;
  if (ANeedPhoneNumber) then
  begin
    LArgs.AddPair('need_phone_number', BoolToStr(ANeedPhoneNumber, true));
  end;
  if (ANeedEmail) then
  begin
    LArgs.AddPair('need_email', BoolToStr(ANeedEmail, true));
  end;
  if (ANeedShippingAddress) then
  begin
    LArgs.AddPair('need_shipping_address',
      BoolToStr(ANeedShippingAddress, true));
  end;
  if (ASendPhoneNumberToProvider) then
  begin
    LArgs.AddPair('send_phone_number_to_provider',
      BoolToStr(ASendPhoneNumberToProvider, true));
  end;
  if (ASendEmailToProvider) then
  begin
    LArgs.AddPair('send_email_to_provider',
      BoolToStr(ASendEmailToProvider, true));
  end;
  if (AIsFlexible) then
  begin
    LArgs.AddPair('is_flexible', BoolToStr(AIsFlexible, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendInvoice',
    LArgs, 'POST'));
end;

function TftAPI.SendLocation(AChatId: Variant; ALatitude: Double;
  ALongitude: Double; ALivePeriod: Integer; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; ADisableNotification: Boolean;
  AHorizontalAccuracy: Double; AHeading: Integer;
  AProximityAlertRadius: Integer; AAllowSendingWithoutReply: Boolean;
  AProtectContent: Boolean; AMessageThreadId: Integer;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', IntToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);

  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;
  LArgs.AddPair('latitude', VarToStr(ALatitude));
  LArgs.AddPair('longitude', VarToStr(ALongitude));

  if (ALivePeriod <> 0) then
  begin
    LArgs.AddPair('live_period', IntToStr(Max(60, Min(86400, ALivePeriod))));
  end;

  if (AHeading <> 0) then
  begin
    LArgs.AddPair('heading', IntToStr(Max(1, Min(360, AHeading))));
  end;

  if (AProximityAlertRadius <> 0) then
  begin
    LArgs.AddPair('proximity_alert_radius',
      IntToStr(Max(1, Min(100000, AProximityAlertRadius))));
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendLocation',
    LArgs, 'POST'));
end;

function TftAPI.SendMediaGroup(AChatId: Variant; AMedia: TList<TftInputMedia>;
  ADisableNotification: Boolean; AReplyToMessageId: Integer;
  AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
  AMessageThreadId: Integer;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessageList;
var
  I: Integer;
  LHasFiles: Boolean;
  LJsonArgs: TStringList;
  LMultipartArgs: TMultipartFormData;
begin
  LHasFiles := False;
  if Assigned(AMedia) then
  begin
    for I := 0 to AMedia.Count - 1 do
    begin
      if Assigned(AMedia[I].MediaFile) then
      begin
        LHasFiles := True;
        if AMedia[I].AttachName = '' then
          AMedia[I].AttachName := 'file' + IntToStr(I);
      end;
    end;
  end;

  if LHasFiles then
  begin
    FHttpClient.ContentType := 'multipart/form-data';
    LMultipartArgs := TMultipartFormData.Create;
    LMultipartArgs.AddField('chat_id', VarToStr(AChatId));
    AddOptionalSendArgs(LMultipartArgs, ABusinessConnectionId,
      ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
      AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
    if (AMessageThreadId <> 0) then
      LMultipartArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
    if Assigned(AMedia) then
    begin
      LMultipartArgs.AddField('media',
        FTypeParser.ParseInputMediaList(AMedia));
      for I := 0 to AMedia.Count - 1 do
      begin
        if Assigned(AMedia[I].MediaFile) then
          LMultipartArgs.AddFile(AMedia[I].AttachName,
            AMedia[I].MediaFile.filePath);
      end;
    end;
    if (ADisableNotification) then
      LMultipartArgs.AddField('disable_notification',
        BoolToStr(ADisableNotification, true));
    if (AProtectContent) then
      LMultipartArgs.AddField('protect_content',
        BoolToStr(AProtectContent, true));
    if (AReplyToMessageId <> 0) then
      LMultipartArgs.AddField('reply_to_message_id',
        IntToStr(AReplyToMessageId));
    if (AAllowSendingWithoutReply) then
      LMultipartArgs.AddField('allow_sending_without_reply',
        BoolToStr(AAllowSendingWithoutReply, true));

    Result := TftMessageList(FTypeParser.ParseJsonAndGetList
      (ParseFunJSONArrayTftMessage, SendRequest('sendMediaGroup',
      LMultipartArgs, 'POST')));
    Exit;
  end;

  FHttpClient.ContentType := 'application/json';
  LJsonArgs := TStringList.Create;
  LJsonArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LJsonArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if (AMessageThreadId <> 0) then
    LJsonArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  if Assigned(AMedia) then
    LJsonArgs.AddPair('media', FTypeParser.ParseInputMediaList(AMedia));
  if (ADisableNotification) then
    LJsonArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  if (AProtectContent) then
    LJsonArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  if (AReplyToMessageId <> 0) then
    LJsonArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  if (AAllowSendingWithoutReply) then
    LJsonArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));

  Result := TftMessageList(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftMessage, SendRequest('sendMediaGroup', LJsonArgs,
    'POST')));
end;

function TftAPI.SendMessage(AChatId: Variant; const AText: String;
  ADisableWebPagePreview: Boolean; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; const AParseMode: String;
  ADisableNotification: Boolean; const AEntities: TftMessageEntityList;
  AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
  AMessageThreadId: Integer; const ABusinessConnectionId: String;
  ADirectMessagesTopicId: Integer; const AMessageEffectId: String;
  AAllowPaidBroadcast: Boolean; ALinkPreviewOptions: TftLinkPreviewOptions;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  if (ABusinessConnectionId <> '') then
  begin
    LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  end;
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if (ADirectMessagesTopicId <> 0) then
  begin
    LArgs.AddPair('direct_messages_topic_id',
      IntToStr(ADirectMessagesTopicId));
  end;
  if (AMessageEffectId <> '') then
  begin
    LArgs.AddPair('message_effect_id', AMessageEffectId);
  end;
  if Assigned(ALinkPreviewOptions) then
  begin
    LArgs.AddPair('link_preview_options',
      FTypeParser.ParseLinkPreviewOptions(ALinkPreviewOptions));
  end;
  if Assigned(AReplyParameters) then
  begin
    LArgs.AddPair('reply_parameters',
      FTypeParser.ParseReplyParameters(AReplyParameters));
  end;
  if Assigned(ASuggestedPostParameters) then
  begin
    LArgs.AddPair('suggested_post_parameters',
      FTypeParser.ParseSuggestedPostParameters(ASuggestedPostParameters));
  end;
  if (AAllowPaidBroadcast) then
  begin
    LArgs.AddPair('allow_paid_broadcast', BoolToStr(AAllowPaidBroadcast, true));
  end;
  LArgs.AddPair('text', AText);
  if (AParseMode <> '') then
  begin
    LArgs.AddPair('parse_mode', AParseMode);
  end;

  if (Assigned(AEntities)) then
  begin
    LArgs.AddPair('entities', FTypeParser.ParseMessageEntities(AEntities));
  end;
  if (ADisableWebPagePreview) then
  begin
    LArgs.AddPair('disable_web_page_preview',
      BoolToStr(ADisableWebPagePreview, true));
  end;

  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;

  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;

  if (AReplyToMessageId >= 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;

  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;

  if (AReplyMarkup <> nil) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendMessage',
    LArgs, 'POST'));
end;

function TftAPI.SendPhoto(AChatId: Variant; APhoto: TftInputFile;
  const ACaption: string; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; const AParseMode: String;
  ADisableNotification: Boolean;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if APhoto <> nil then
    LArgs.AddFile('photo', APhoto.filePath);

  if (ACaption <> '') then
    LArgs.AddField('caption', ACaption);

  if (AReplyToMessageId >= 0) then
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));

  if (AReplyMarkup <> nil) then
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  if (AParseMode <> '') then
    LArgs.AddField('parse_mode', AParseMode);

  if (ADisableNotification) then
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendPhoto',
    LArgs, 'POST'));
end;

function TftAPI.SendPoll(AChatId: Variant; const AQuestion: string;
  const AOptions: TObject; ADisableNotification: Boolean;
  AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  LArgs.AddPair('question', AQuestion);

  LArgs.AddPair('options', FTypeParser.ParseStrings(TStrings(AOptions)));
  if (ADisableNotification) then
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  if (AReplyToMessageId >= 0) then
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));

  if (AReplyMarkup <> nil) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendPoll',
    LArgs, 'POST'));
end;

function TftAPI.SendRequest(const Method: String; args: TObject;
  const MethodType: String): TJSONObject;
var
  LURL, LServerResponse: String;
begin
  LURL := FUrl;
  LURL := LURL + '/bot';
  LURL := LURL + FToken;
  LURL := LURL + '/';
  LURL := LURL + Method;

  LServerResponse := FHttpClient.MakeRequest(LURL, args, MethodType);
  if not(Pos('<html>', LServerResponse) = 0) then
    raise Exception.Create
      ('fastTelega library have got html page instead of JSON response. Maybe you entered wrong bot token.');
  Result := FTypeParser.parseJson(LServerResponse);
end;

procedure TftAPI.AddOptionalSendArgs(AArgs: TStringList;
  const ABusinessConnectionId: String; ADirectMessagesTopicId: Integer;
  const AMessageEffectId: String; AAllowPaidBroadcast: Boolean;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false);
begin
  if (ABusinessConnectionId <> '') then
    AArgs.AddPair('business_connection_id', ABusinessConnectionId);
  if (ADirectMessagesTopicId <> 0) then
    AArgs.AddPair('direct_messages_topic_id',
      IntToStr(ADirectMessagesTopicId));
  if (AMessageEffectId <> '') then
    AArgs.AddPair('message_effect_id', AMessageEffectId);
  if (AAllowPaidBroadcast) then
    AArgs.AddPair('allow_paid_broadcast', BoolToStr(AAllowPaidBroadcast, true));
  if Assigned(AReplyParameters) then
    AArgs.AddPair('reply_parameters',
      FTypeParser.ParseReplyParameters(AReplyParameters));
  if Assigned(ASuggestedPostParameters) then
    AArgs.AddPair('suggested_post_parameters',
      FTypeParser.ParseSuggestedPostParameters(ASuggestedPostParameters));
  if (AShowCaptionAboveMedia) then
    AArgs.AddPair('show_caption_above_media',
      BoolToStr(AShowCaptionAboveMedia, true));
end;

procedure TftAPI.AddOptionalSendArgs(AArgs: TMultipartFormData;
  const ABusinessConnectionId: String; ADirectMessagesTopicId: Integer;
  const AMessageEffectId: String; AAllowPaidBroadcast: Boolean;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false);
begin
  if (ABusinessConnectionId <> '') then
    AArgs.AddField('business_connection_id', ABusinessConnectionId);
  if (ADirectMessagesTopicId <> 0) then
    AArgs.AddField('direct_messages_topic_id',
      IntToStr(ADirectMessagesTopicId));
  if (AMessageEffectId <> '') then
    AArgs.AddField('message_effect_id', AMessageEffectId);
  if (AAllowPaidBroadcast) then
    AArgs.AddField('allow_paid_broadcast',
      BoolToStr(AAllowPaidBroadcast, true));
  if Assigned(AReplyParameters) then
    AArgs.AddField('reply_parameters',
      FTypeParser.ParseReplyParameters(AReplyParameters));
  if Assigned(ASuggestedPostParameters) then
    AArgs.AddField('suggested_post_parameters',
      FTypeParser.ParseSuggestedPostParameters(ASuggestedPostParameters));
  if (AShowCaptionAboveMedia) then
    AArgs.AddField('show_caption_above_media',
      BoolToStr(AShowCaptionAboveMedia, true));
end;

function TftAPI.SendSticker(AChatId: Variant; ASticker: TftInputFile;
  AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
  ADisableNotification: Boolean;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if Assigned(ASticker) then
  begin
    LArgs.AddFile('sticker', ASticker.filePath);
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendSticker',
    LArgs, 'POST'));
end;

function TftAPI.SendVenue(AChatId: Variant; ALatitude: Double;
  ALongitude: Double; const ATitle: String; const AAddress: String;
  const ASoursquareId: String; const AFoursquareType: String;
  ADisableNotification: Boolean; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; const AGooglePlaceId: String;
  const AGooglePlaceType: String; AAllowSendingWithoutReply: Boolean;
  AProtectContent: Boolean; AMessageThreadId: Integer;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;
  LArgs.AddPair('latitude', VarToStr(ALatitude));
  LArgs.AddPair('longitude', VarToStr(ALongitude));
  LArgs.AddPair('title', ATitle);
  LArgs.AddPair('address', AAddress);
  if (ASoursquareId <> '') then
  begin
    LArgs.AddPair('foursquare_id', ASoursquareId);
  end;
  if (AFoursquareType <> '') then
  begin
    LArgs.AddPair('foursquare_type', AFoursquareType);
  end;
  if (AGooglePlaceId <> '') then
  begin
    LArgs.AddPair('google_place_id', AGooglePlaceId);
  end;
  if (AGooglePlaceType <> '') then
  begin
    LArgs.AddPair('google_place_type', AGooglePlaceType);
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddPair('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase((AReplyMarkup)));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendVenue',
    LArgs, 'POST'));
end;

function TftAPI.SendVideo(AChatId: Variant; AVideo: TftInputFile;
  ASupportsStreaming: Boolean; ADuration: Integer; AWidth: Integer;
  AHeight: Integer; AThumb: TftInputFile; ACaption: String;
  AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
  const AParseMode: String; ADisableNotification: Boolean;
  const ACaptionEntities: TftMessageEntityList;
  AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
  AMessageThreadId: Integer; AHasSpoiler: Boolean;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if Assigned(AVideo) then
  begin
    LArgs.AddFile('video', AVideo.filePath);
  end;
  if (ADuration <> 0) then
  begin
    LArgs.AddField('duration', IntToStr(ADuration));
  end;
  if (AWidth <> 0) then
  begin
    LArgs.AddField('width', IntToStr(AWidth));
  end;
  if (AHeight <> 0) then
  begin
    LArgs.AddField('height', IntToStr(AHeight));
  end;
  if Assigned(AThumb) then
  begin
    LArgs.AddFile('thumb', AThumb.filePath);
  end;
  if (ACaption <> '') then
  begin
    LArgs.AddField('caption', ACaption);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddField('parse_mode', AParseMode);
  end;
  if Assigned(ACaptionEntities) then
  begin
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;
  if (ASupportsStreaming) then
  begin
    LArgs.AddField('supports_streaming', BoolToStr(ASupportsStreaming, true));
  end;
  if (AHasSpoiler) then
  begin
    LArgs.AddField('has_spoiler', BoolToStr(AHasSpoiler, true));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddField('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendVideo',
    LArgs, 'POST'));
end;

function TftAPI.SendVideoNote(AChatId: Variant; AVideoNote: TftInputFile;
  AReplyToMessageId: Integer; ADisableNotification: Boolean; ADuration: Integer;
  Alength: Integer; AThumb: TftInputFile; AReplyMarkup: TftReplyBase;
  AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
  AMessageThreadId: Integer;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if Assigned(AVideoNote) then
  begin
    LArgs.AddFile('video_note', AVideoNote.filePath);
  end;
  if (ADuration <> 0) then
  begin
    LArgs.AddField('duration', IntToStr(ADuration));
  end;
  if (Alength <> 0) then
  begin
    LArgs.AddField('length', IntToStr(Alength));
  end;
  if Assigned(AThumb) then
  begin
    LArgs.AddFile('thumb', AThumb.filePath);
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddField('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendVideoNote',
    LArgs, 'POST'));
end;

function TftAPI.SendVoice(AChatId: Variant; AVoice: TftInputFile;
  const ACaption: String; ADuration: Integer; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; const AParseMode: String;
  ADisableNotification: Boolean;
  const ACaptionEntities: TftMessageEntityList;
  AAllowSendingWithoutReply: Boolean; AProtectContent: Boolean;
  AMessageThreadId: Integer;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if Assigned(AVoice) then
  begin
    LArgs.AddFile('voice', AVoice.filePath);
  end;
  if (ACaption <> '') then
  begin
    LArgs.AddField('caption', ACaption);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddField('parse_mode', AParseMode);
  end;
  if Assigned(ACaptionEntities) then
  begin
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;
  if (ADuration <> 0) then
  begin
    LArgs.AddField('duration', IntToStr(ADuration));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if (AAllowSendingWithoutReply) then
  begin
    LArgs.AddField('allow_sending_without_reply',
      BoolToStr(AAllowSendingWithoutReply, true));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendVoice',
    LArgs, 'POST'));
end;

function TftAPI.SetChatAdministratorCustomTitle(AChatId: Variant;
  AUserId: Int64; ACustomTitle: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('custom_title', ACustomTitle);

  Result := Boolean(SendRequest('setChatAdministratorCustomTitle', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.SetChatDescription(AChatId: Variant;
  ADescription: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  if (ADescription <> '') then
  begin
    LArgs.AddPair('permissions', ADescription);
  end;

  Result := Boolean(SendRequest('setChatDescription', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetChatMenuButton(AChatId: Variant;
  AMenuButton: TftMenuButton): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if AChatId then
  begin
    LArgs.AddPair('chat_id', IntToStr(AChatId));
  end;
  LArgs.AddPair('menu_button', FTypeParser.ParseMenuButton(AMenuButton));

  Result := Boolean(SendRequest('setChatMenuButton', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetChatPermissions(AChatId: Variant;
  APermissions: TftChatPermissions): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('permissions', FTypeParser.ParseChatPermissions(APermissions));

  Result := Boolean(SendRequest('setChatPermissions', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetChatPhoto(AChatId: Variant; APhoto: TftInputFile): Boolean;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  if Assigned(APhoto) then
  begin
    LArgs.AddFile('photo', APhoto.Data);
    LArgs.AddFile('photo', BoolToStr(true, true));
    LArgs.AddFile('photo', APhoto.MimeType);
    LArgs.AddFile('photo', APhoto.FileName);
  end;

  Result := Boolean(SendRequest('setChatPhoto', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetChatStickerSet(AChatId: Variant;
  AStickerSetName: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('sticker_set_name', AStickerSetName);

  Result := Boolean(SendRequest('setChatStickerSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetChatTitle(AChatId: Variant; ATitle: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('title', ATitle);

  Result := Boolean(SendRequest('setChatTitle', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetGameScore(AUserId: Int64; AScore: Integer; AForce: Boolean;
  ADisableEditMessage: Boolean; AChatId: Int64; AMessageId: Integer;
  const AInlineMessageId: String): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('score', IntToStr(AScore));
  if (AForce) then
  begin
    LArgs.AddPair('force', BoolToStr(AForce, true));
  end;
  if (ADisableEditMessage) then
  begin
    LArgs.AddPair('disable_edit_message', BoolToStr(ADisableEditMessage, true));
  end;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  if (AMessageId <> 0) then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;
  if AInlineMessageId <> '' then
  begin
    LArgs.AddPair('inline_message_id', AInlineMessageId);
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('setGameScore',
    LArgs, 'POST'));
end;

function TftAPI.SetMyCommands(const ACommands: TList<TftBotCommand>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  LArgs := TStringList.Create;
  if (ACommands <> nil) then
    LArgs.AddPair('commands', FTypeParser.ParseList(ACommands));

  Result := SendRequest('setMyCommands', LArgs, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.SetMyDefaultAdministratorRights
  (ARights: TftChatAdministratorRights; AForChannels: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if Assigned(ARights) then
  begin
    LArgs.AddPair('rights', FTypeParser.ParseChatAdministratorRights(ARights));
  end;
  if AForChannels then
  begin
    LArgs.AddPair('for_channels', BoolToStr(AForChannels, true));
  end;

  Result := Boolean(SendRequest('setStickerPositionInSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetPassportDataErrors(AUserId: Int64;
  AErrors: TList<TftPassportElementError>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('errors', FTypeParser.ParseList(AErrors));

  Result := Boolean(SendRequest('setStickerPositionInSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetStickerPositionInSet(ASticker: String;
  APosition: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('sticker', ASticker);
  LArgs.AddPair('position', IntToStr(APosition));

  Result := Boolean(SendRequest('setStickerPositionInSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetStickerSetThumb(AName: String; AUserId: Int64;
  AThumb: TftInputFile): Boolean;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('name', AName);
  LArgs.AddField('user_id', IntToStr(AUserId));
  if Assigned(AThumb) then
  begin
    LArgs.AddFile('thumb', AThumb.Data);
    LArgs.AddFile('thumb', BoolToStr(true, true));
    LArgs.AddFile('thumb', AThumb.MimeType);
    LArgs.AddFile('thumb', AThumb.FileName);
  end;

  Result := Boolean(SendRequest('setStickerSetThumb', LArgs, 'POST')
    .GetValue('result'));
end;

procedure TftAPI.SetToken(const Value: String);
begin
  FToken := Value;
end;

procedure TftAPI.SetWebhook(const AURL: String;
  const ACertificate: TftInputFile; AMaxConnection: Integer;
  const AAllowedUpdates: TObject; const AIpAddress: String;
  ADropPendingUpdates: Boolean; const ASecretToken: String);
var
  LArgs: TMultipartFormData;
  LAllowedUpdatesJson: String;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('url', AURL);

  if ACertificate <> nil then
    LArgs.AddFile('certificate', ACertificate.filePath);

  if (AIpAddress <> '') then
    LArgs.AddField('ip_address', AIpAddress);

  if (AMaxConnection <> 40) then
    LArgs.AddField('max_connections', IntToStr(AMaxConnection));

  if (AAllowedUpdates <> nil) then
  begin
    LAllowedUpdatesJson := FTypeParser.ParseStrings(TStrings(AAllowedUpdates));
    LArgs.AddField('allowed_updates', LAllowedUpdatesJson);
  end;

  if ADropPendingUpdates then
    LArgs.AddFile('drop_pending_updates', BoolToStr(ADropPendingUpdates, true));

  if ASecretToken <> '' then
    LArgs.AddFile('secret_token', ASecretToken);

  SendRequest('setWebhook', LArgs, 'POST');
end;

function TftAPI.StopMessageLiveLocation(AChatId: Variant; AMessageId: Integer;
  AInlineMessageId: String; AReplyMarkup: TftInlineKeyboardMarkup = nil)
  : TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));

  if (Assigned(AReplyMarkup)) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage
    (SendRequest('stopMessageLiveLocation', LArgs, 'POST'));
end;

function TftAPI.StopPoll(AChatId: Variant; AMessageId: Integer;
  AReplyMarkup: TftInlineKeyboardMarkup = nil): TftPoll;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  LArgs := TStringList.Create;

  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));

  if (Assigned(AReplyMarkup)) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetPoll(SendRequest('stopPoll',
    LArgs, 'POST'));
end;

function TftAPI.UnbanChatMember(AChatId: Variant; AUserId: Int64;
  AOnlyIfBanned: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := Boolean(SendRequest('only_if_banned', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UnbanChatSenderChat(AChatId: Variant;
  ASenderChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('sender_chat_id', IntToStr(ASenderChatId));

  Result := Boolean(SendRequest('unbanChatSenderChat', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UnhideGeneralForumTopic(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('unhideGeneralForumTopic', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UnpinAllChatMessages(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('unpinAllChatMessages', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UnpinAllForumTopicMessages(AChatId: Variant;
  AMessageThreadId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;

  Result := Boolean(SendRequest('unpinAllForumTopicMessages', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UnpinChatMessage(AChatId: Variant; AMessageId: Integer)
  : Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  if (AMessageId <> 0) then
  begin
    LArgs.AddPair('message_id', IntToStr(AMessageId));
  end;

  Result := Boolean(SendRequest('unpinChatMessage', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UploadStickerFile(AUserId: Int64;
  APngSticker: TftInputFile): Boolean;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  LArgs := TMultipartFormData.Create;
  LArgs.AddField('user_id', IntToStr(AUserId));
  if Assigned(APngSticker) then
  begin
    LArgs.AddFile('png_sticker', APngSticker.Data);
    LArgs.AddFile('png_sticker', BoolToStr(true, true));
    LArgs.AddFile('png_sticker', APngSticker.MimeType);
    LArgs.AddFile('png_sticker', APngSticker.FileName);
  end;

  Result := Boolean(SendRequest('uploadStickerFile', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DownloadFile(const AFilePath: String;
  const AArgs: TStringList): String;
var
  LURL: String;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LURL := FUrl;
  LURL := LURL + '/file/bot';
  LURL := LURL + FToken;
  LURL := LURL + '/';
  LURL := LURL + AFilePath;

  Result := FHttpClient.MakeRequest(LURL, AArgs, 'GET');
end;

{ Bot API 10.3 additions }

function ParseFunJSONArrayTftMessageId(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TftMessageIdFromJson(JSONArray.Items[Index]);
end;

function TftAPI.ForwardMessages(AChatId, AFromChatId: Variant;
  AMessageIds: TArray<Integer>; AMessageThreadId, ADirectMessagesTopicId: Integer;
  ADisableNotification, AProtectContent: Boolean): TList<TftMessageId>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('from_chat_id', VarToStr(AFromChatId));
  LArgs.AddPair('message_ids', FTypeParser.ParseIntegers(AMessageIds));
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if (ADirectMessagesTopicId <> 0) then
  begin
    LArgs.AddPair('direct_messages_topic_id',
      IntToStr(ADirectMessagesTopicId));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;

  Result := TList<TftMessageId>(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftMessageId, SendRequest('forwardMessages', LArgs,
    'POST')));
end;

function TftAPI.CopyMessages(AChatId, AFromChatId: Variant;
  AMessageIds: TArray<Integer>; AMessageThreadId, ADirectMessagesTopicId: Integer;
  ADisableNotification, AProtectContent, ARemoveCaption: Boolean)
  : TList<TftMessageId>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('from_chat_id', VarToStr(AFromChatId));
  LArgs.AddPair('message_ids', FTypeParser.ParseIntegers(AMessageIds));
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if (ADirectMessagesTopicId <> 0) then
  begin
    LArgs.AddPair('direct_messages_topic_id',
      IntToStr(ADirectMessagesTopicId));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (ARemoveCaption) then
  begin
    LArgs.AddPair('remove_caption', BoolToStr(ARemoveCaption, true));
  end;

  Result := TList<TftMessageId>(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftMessageId, SendRequest('copyMessages', LArgs, 'POST')));
end;

function TftAPI.DeleteMessages(AChatId: Variant;
  AMessageIds: TArray<Integer>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_ids', FTypeParser.ParseIntegers(AMessageIds));

  Result := Boolean(SendRequest('deleteMessages', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UnpinAllGeneralForumTopicMessages(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('unpinAllGeneralForumTopicMessages', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.SetMyName(const AName, ALanguageCode: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := Boolean(SendRequest('setMyName', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetMyName(const ALanguageCode: String): TftBotName;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := FTypeParser.ParseJsonAndGetBotName(SendRequest('getMyName',
    LArgs));
end;

function TftAPI.SetMyDescription(const ADescription,
  ALanguageCode: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (ADescription <> '') then
  begin
    LArgs.AddPair('description', ADescription);
  end;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := Boolean(SendRequest('setMyDescription', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetMyDescription(const ALanguageCode: String)
  : TftBotDescription;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := FTypeParser.ParseJsonAndGetBotDescription
    (SendRequest('getMyDescription', LArgs));
end;

function TftAPI.SetMyShortDescription(const AShortDescription,
  ALanguageCode: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AShortDescription <> '') then
  begin
    LArgs.AddPair('short_description', AShortDescription);
  end;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := Boolean(SendRequest('setMyShortDescription', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetMyShortDescription(const ALanguageCode: String)
  : TftBotShortDescription;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (ALanguageCode <> '') then
  begin
    LArgs.AddPair('language_code', ALanguageCode);
  end;

  Result := FTypeParser.ParseJsonAndGetBotShortDescription
    (SendRequest('getMyShortDescription', LArgs));
end;

function TftAPI.SetChatMemberTag(AChatId: Variant; AUserId: Int64;
  const ATag: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (ATag <> '') then
  begin
    LArgs.AddPair('tag', ATag);
  end;

  Result := Boolean(SendRequest('setChatMemberTag', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetUserEmojiStatus(AUserId: Int64;
  const AEmojiStatusCustomEmojiId: String;
  AEmojiStatusExpirationDate: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (AEmojiStatusCustomEmojiId <> '') then
  begin
    LArgs.AddPair('emoji_status_custom_emoji_id', AEmojiStatusCustomEmojiId);
  end;
  if (AEmojiStatusExpirationDate <> 0) then
  begin
    LArgs.AddPair('emoji_status_expiration_date',
      IntToStr(AEmojiStatusExpirationDate));
  end;

  Result := Boolean(SendRequest('setUserEmojiStatus', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.CreateChatSubscriptionInviteLink(AChatId: Variant;
  ASubscriptionPeriod, ASubscriptionPrice: Integer; const AName: String)
  : TftChatInviteLink;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('subscription_period', IntToStr(ASubscriptionPeriod));
  LArgs.AddPair('subscription_price', IntToStr(ASubscriptionPrice));
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;

  Result := FTypeParser.ParseJsonAndGetChatInviteLink
    (SendRequest('createChatSubscriptionInviteLink', LArgs, 'POST'));
end;

function TftAPI.EditChatSubscriptionInviteLink(AChatId: Variant;
  const AInviteLink, AName: String): TftChatInviteLink;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('invite_link', AInviteLink);
  if (AName <> '') then
  begin
    LArgs.AddPair('name', AName);
  end;

  Result := FTypeParser.ParseJsonAndGetChatInviteLink
    (SendRequest('editChatSubscriptionInviteLink', LArgs, 'POST'));
end;

function TftAPI.VerifyUser(AUserId: Int64;
  const ACustomDescription: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (ACustomDescription <> '') then
  begin
    LArgs.AddPair('custom_description', ACustomDescription);
  end;

  Result := Boolean(SendRequest('verifyUser', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.VerifyChat(AChatId: Variant;
  const ACustomDescription: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  if (ACustomDescription <> '') then
  begin
    LArgs.AddPair('custom_description', ACustomDescription);
  end;

  Result := Boolean(SendRequest('verifyChat', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.RemoveUserVerification(AUserId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := Boolean(SendRequest('removeUserVerification', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.RemoveChatVerification(AChatId: Variant): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));

  Result := Boolean(SendRequest('removeChatVerification', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ReadBusinessMessage(const ABusinessConnectionId: String;
  AChatId: Int64; AMessageId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));

  Result := Boolean(SendRequest('readBusinessMessage', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteBusinessMessages(const ABusinessConnectionId: String;
  AMessageIds: TArray<Integer>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('message_ids', FTypeParser.ParseIntegers(AMessageIds));

  Result := Boolean(SendRequest('deleteBusinessMessages', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetBusinessAccountName(const ABusinessConnectionId,
  AFirstName, ALastName: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('first_name', AFirstName);
  if (ALastName <> '') then
  begin
    LArgs.AddPair('last_name', ALastName);
  end;

  Result := Boolean(SendRequest('setBusinessAccountName', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetBusinessAccountUsername(const ABusinessConnectionId,
  AUsername: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  if (AUsername <> '') then
  begin
    LArgs.AddPair('username', AUsername);
  end;

  Result := Boolean(SendRequest('setBusinessAccountUsername', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetBusinessAccountBio(const ABusinessConnectionId,
  ABio: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  if (ABio <> '') then
  begin
    LArgs.AddPair('bio', ABio);
  end;

  Result := Boolean(SendRequest('setBusinessAccountBio', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.RemoveBusinessAccountProfilePhoto(
  const ABusinessConnectionId: String; AIsPublic: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  if (AIsPublic) then
  begin
    LArgs.AddPair('is_public', BoolToStr(AIsPublic, true));
  end;

  Result := Boolean(SendRequest('removeBusinessAccountProfilePhoto', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.TransferBusinessAccountStars(
  const ABusinessConnectionId: String; AStarCount: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('star_count', IntToStr(AStarCount));

  Result := Boolean(SendRequest('transferBusinessAccountStars', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ConvertGiftToStars(const ABusinessConnectionId,
  AOwnedGiftId: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('owned_gift_id', AOwnedGiftId);

  Result := Boolean(SendRequest('convertGiftToStars', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.UpgradeGift(const ABusinessConnectionId, AOwnedGiftId: String;
  AKeepOriginalDetails: Boolean; AStarCount: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('owned_gift_id', AOwnedGiftId);
  if (AKeepOriginalDetails) then
  begin
    LArgs.AddPair('keep_original_details',
      BoolToStr(AKeepOriginalDetails, true));
  end;
  if (AStarCount <> 0) then
  begin
    LArgs.AddPair('star_count', IntToStr(AStarCount));
  end;

  Result := Boolean(SendRequest('upgradeGift', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.TransferGift(const ABusinessConnectionId, AOwnedGiftId: String;
  ANewOwnerChatId: Int64; AStarCount: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('owned_gift_id', AOwnedGiftId);
  LArgs.AddPair('new_owner_chat_id', IntToStr(ANewOwnerChatId));
  if (AStarCount <> 0) then
  begin
    LArgs.AddPair('star_count', IntToStr(AStarCount));
  end;

  Result := Boolean(SendRequest('transferGift', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteMessageReaction(AChatId: Variant; AMessageId: Integer;
  AUserId, AActorChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  if (AUserId <> 0) then
  begin
    LArgs.AddPair('user_id', IntToStr(AUserId));
  end;
  if (AActorChatId <> 0) then
  begin
    LArgs.AddPair('actor_chat_id', IntToStr(AActorChatId));
  end;

  Result := Boolean(SendRequest('deleteMessageReaction', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeleteAllMessageReactions(AChatId: Variant;
  AUserId, AActorChatId: Int64): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  if (AUserId <> 0) then
  begin
    LArgs.AddPair('user_id', IntToStr(AUserId));
  end;
  if (AActorChatId <> 0) then
  begin
    LArgs.AddPair('actor_chat_id', IntToStr(AActorChatId));
  end;

  Result := Boolean(SendRequest('deleteAllMessageReactions', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetCustomEmojiStickers(ACustomEmojiIds: TArray<String>)
  : TList<TftSticker>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('custom_emoji_ids',
    FTypeParser.ParseStringArray(ACustomEmojiIds));

  Result := TList<TftSticker>(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftSticker, SendRequest('getCustomEmojiStickers', LArgs,
    'POST')));
end;

function TftAPI.SetStickerEmojiList(const ASticker: String;
  AEmojiList: TArray<String>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('sticker', ASticker);
  LArgs.AddPair('emoji_list', FTypeParser.ParseStringArray(AEmojiList));

  Result := Boolean(SendRequest('setStickerEmojiList', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetStickerKeywords(const ASticker: String;
  AKeywords: TArray<String>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('sticker', ASticker);
  LArgs.AddPair('keywords', FTypeParser.ParseStringArray(AKeywords));

  Result := Boolean(SendRequest('setStickerKeywords', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetStickerMaskPosition(const ASticker: String;
  AMaskPosition: TftMaskPosition): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('sticker', ASticker);
  if Assigned(AMaskPosition) then
  begin
    LArgs.AddPair('mask_position', FTypeParser.ParseMaskPosition(AMaskPosition));
  end;

  Result := Boolean(SendRequest('setStickerMaskPosition', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetStickerSetTitle(const AName, ATitle: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('name', AName);
  LArgs.AddPair('title', ATitle);

  Result := Boolean(SendRequest('setStickerSetTitle', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetStickerSetThumbnail(const AName: String; AUserId: Int64;
  const AFormat: String; AThumbnail: TftInputFile): Boolean;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('name', AName);
  LArgs.AddField('user_id', IntToStr(AUserId));
  LArgs.AddField('format', AFormat);
  if Assigned(AThumbnail) then
  begin
    LArgs.AddFile('thumbnail', AThumbnail.filePath);
  end;

  Result := Boolean(SendRequest('setStickerSetThumbnail', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetCustomEmojiStickerSetThumbnail(const AName,
  ACustomEmojiId: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('name', AName);
  if (ACustomEmojiId <> '') then
  begin
    LArgs.AddPair('custom_emoji_id', ACustomEmojiId);
  end;

  Result := Boolean(SendRequest('setCustomEmojiStickerSetThumbnail', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.DeleteStickerSet(const AName: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('name', AName);

  Result := Boolean(SendRequest('deleteStickerSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.RefundStarPayment(AUserId: Int64;
  const ATelegramPaymentChargeId: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('telegram_payment_charge_id', ATelegramPaymentChargeId);

  Result := Boolean(SendRequest('refundStarPayment', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditUserStarSubscription(AUserId: Int64;
  const ATelegramPaymentChargeId: String; AIsCanceled: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('telegram_payment_charge_id', ATelegramPaymentChargeId);
  LArgs.AddPair('is_canceled', BoolToStr(AIsCanceled, true));

  Result := Boolean(SendRequest('editUserStarSubscription', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetMyStarBalance: TftStarAmount;
begin
  Result := FTypeParser.ParseJsonAndGetStarAmount
    (SendRequest('getMyStarBalance'));
end;

function TftAPI.GetUserProfileAudios(AUserId: Int64; AOffset,
  ALimit: Integer): TftUserProfileAudios;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (AOffset <> 0) then
  begin
    LArgs.AddPair('offset', IntToStr(AOffset));
  end;
  if (ALimit <> 100) then
  begin
    LArgs.AddPair('limit', IntToStr(Max(1, Min(100, ALimit))));
  end;

  Result := FTypeParser.ParseJsonAndGetUserProfileAudios
    (SendRequest('getUserProfileAudios', LArgs));
end;

function TftAPI.SendMessageDraft(AChatId: Int64; ADraftId: Integer;
  const AText, AParseMode: String; AEntities: TftMessageEntityList;
  AMessageThreadId: Integer; ACanStop, AKeepOnStop: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('draft_id', IntToStr(ADraftId));
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if (AText <> '') then
  begin
    LArgs.AddPair('text', AText);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddPair('parse_mode', AParseMode);
  end;
  if Assigned(AEntities) then
  begin
    LArgs.AddPair('entities', FTypeParser.ParseMessageEntities(AEntities));
  end;
  if (ACanStop) then
  begin
    LArgs.AddPair('can_stop', BoolToStr(ACanStop, true));
  end;
  if (AKeepOnStop) then
  begin
    LArgs.AddPair('keep_on_stop', BoolToStr(AKeepOnStop, true));
  end;

  Result := Boolean(SendRequest('sendMessageDraft', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ApproveSuggestedPost(AChatId: Int64; AMessageId,
  ASendDate: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  if (ASendDate <> 0) then
  begin
    LArgs.AddPair('send_date', IntToStr(ASendDate));
  end;

  Result := Boolean(SendRequest('approveSuggestedPost', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.DeclineSuggestedPost(AChatId: Int64; AMessageId: Integer;
  const AComment: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  if (AComment <> '') then
  begin
    LArgs.AddPair('comment', AComment);
  end;

  Result := Boolean(SendRequest('declineSuggestedPost', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GiftPremiumSubscription(AUserId: Int64;
  AMonthCount, AStarCount: Integer; const AText, ATextParseMode: String;
  ATextEntities: TftMessageEntityList): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('month_count', IntToStr(AMonthCount));
  LArgs.AddPair('star_count', IntToStr(AStarCount));
  if (AText <> '') then
  begin
    LArgs.AddPair('text', AText);
  end;
  if (ATextParseMode <> '') then
  begin
    LArgs.AddPair('text_parse_mode', ATextParseMode);
  end;
  if Assigned(ATextEntities) then
  begin
    LArgs.AddPair('text_entities',
      FTypeParser.ParseMessageEntities(ATextEntities));
  end;

  Result := Boolean(SendRequest('giftPremiumSubscription', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SendGift(AUserId: Int64; AChatId: Variant;
  const AGiftId: String; APayForUpgrade: Boolean; const AText,
  ATextParseMode: String; ATextEntities: TftMessageEntityList): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AUserId <> 0) then
  begin
    LArgs.AddPair('user_id', IntToStr(AUserId));
  end;
  if not(VarIsNull(AChatId)) and (VarToStr(AChatId) <> '') then
  begin
    LArgs.AddPair('chat_id', VarToStr(AChatId));
  end;
  LArgs.AddPair('gift_id', AGiftId);
  if (APayForUpgrade) then
  begin
    LArgs.AddPair('pay_for_upgrade', BoolToStr(APayForUpgrade, true));
  end;
  if (AText <> '') then
  begin
    LArgs.AddPair('text', AText);
  end;
  if (ATextParseMode <> '') then
  begin
    LArgs.AddPair('text_parse_mode', ATextParseMode);
  end;
  if Assigned(ATextEntities) then
  begin
    LArgs.AddPair('text_entities',
      FTypeParser.ParseMessageEntities(ATextEntities));
  end;

  Result := Boolean(SendRequest('sendGift', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetManagedBotToken(AUserId: Int64): String;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := String(SendRequest('getManagedBotToken', LArgs)
    .GetValue('result'));
end;

function TftAPI.ReplaceManagedBotToken(AUserId: Int64): String;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := String(SendRequest('replaceManagedBotToken', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetBusinessConnection(const ABusinessConnectionId: String)
  : TftBusinessConnection;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);

  Result := FTypeParser.ParseJsonAndGetBusinessConnection
    (SendRequest('getBusinessConnection', LArgs));
end;

function TftAPI.GetUserPersonalChatMessages(AUserId: Int64; ALimit: Integer)
  : TList<TftMessage>;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('limit', IntToStr(ALimit));

  Result := TList<TftMessage>(FTypeParser.ParseJsonAndGetList
    (ParseFunJSONArrayTftMessage, SendRequest('getUserPersonalChatMessages',
    LArgs)));
end;

function TftAPI.AnswerChatJoinRequestQuery(const AChatJoinRequestQueryId,
  AResult: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_join_request_query_id', AChatJoinRequestQueryId);
  LArgs.AddPair('result', AResult);

  Result := Boolean(SendRequest('answerChatJoinRequestQuery', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SendChatJoinRequestWebApp(const AChatJoinRequestQueryId,
  AWebAppUrl: String): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_join_request_query_id', AChatJoinRequestQueryId);
  LArgs.AddPair('web_app_url', AWebAppUrl);

  Result := Boolean(SendRequest('sendChatJoinRequestWebApp', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SavePreparedInlineMessage(AUserId: Int64;
  AResult: TftInlineQueryResult; AAllowUserChats, AAllowBotChats,
  AAllowGroupChats, AAllowChannelChats: Boolean): TftPreparedInlineMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('result', FTypeParser.ParseInlineQueryResult(AResult));
  if (AAllowUserChats) then
  begin
    LArgs.AddPair('allow_user_chats', BoolToStr(AAllowUserChats, true));
  end;
  if (AAllowBotChats) then
  begin
    LArgs.AddPair('allow_bot_chats', BoolToStr(AAllowBotChats, true));
  end;
  if (AAllowGroupChats) then
  begin
    LArgs.AddPair('allow_group_chats', BoolToStr(AAllowGroupChats, true));
  end;
  if (AAllowChannelChats) then
  begin
    LArgs.AddPair('allow_channel_chats', BoolToStr(AAllowChannelChats, true));
  end;

  Result := FTypeParser.ParseJsonAndGetPreparedInlineMessage
    (SendRequest('savePreparedInlineMessage', LArgs, 'POST'));
end;

function TftAPI.SavePreparedKeyboardButton(AUserId: Int64;
  AButton: TftKeyboardButton): TftPreparedKeyboardButton;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('button', FTypeParser.ParseKeyboardButton(AButton));

  Result := FTypeParser.ParseJsonAndGetPreparedKeyboardButton
    (SendRequest('savePreparedKeyboardButton', LArgs, 'POST'));
end;

function TftAPI.SetMessageReaction(AChatId: Variant; AMessageId: Integer;
  AReaction: TList<TftReactionType>; AIsBig: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  if Assigned(AReaction) then
  begin
    LArgs.AddPair('reaction', FTypeParser.ParseReactionTypes(AReaction));
  end;
  if (AIsBig) then
  begin
    LArgs.AddPair('is_big', BoolToStr(AIsBig, true));
  end;

  Result := Boolean(SendRequest('setMessageReaction', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SendLivePhoto(AChatId: Variant;
  ALivePhoto, APhoto: TftInputFile; const ACaption, AParseMode: String;
  ACaptionEntities: TftMessageEntityList; ADisableNotification,
  AProtectContent: Boolean; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; AMessageThreadId: Integer;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  if Assigned(ALivePhoto) then
  begin
    LArgs.AddFile('live_photo', ALivePhoto.filePath);
  end;
  if Assigned(APhoto) then
  begin
    LArgs.AddFile('photo', APhoto.filePath);
  end;
  if (ACaption <> '') then
  begin
    LArgs.AddField('caption', ACaption);
  end;
  if (AParseMode <> '') then
  begin
    LArgs.AddField('parse_mode', AParseMode);
  end;
  if Assigned(ACaptionEntities) then
  begin
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  end;
  if (AMessageThreadId <> 0) then
  begin
    LArgs.AddField('message_thread_id', IntToStr(AMessageThreadId));
  end;
  if (ADisableNotification) then
  begin
    LArgs.AddField('disable_notification',
      BoolToStr(ADisableNotification, true));
  end;
  if (AProtectContent) then
  begin
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));
  end;
  if (AReplyToMessageId <> 0) then
  begin
    LArgs.AddField('reply_to_message_id', IntToStr(AReplyToMessageId));
  end;
  if Assigned(AReplyMarkup) then
  begin
    LArgs.AddField('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  end;

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendLivePhoto',
    LArgs, 'POST'));
end;

function TftAPI.RemoveMyProfilePhoto: Boolean;
begin
  Result := Boolean(SendRequest('removeMyProfilePhoto')
    .GetValue('result'));
end;

function TftAPI.GetBusinessAccountStarBalance(
  const ABusinessConnectionId: String): TftStarAmount;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);

  Result := FTypeParser.ParseJsonAndGetStarAmount
    (SendRequest('getBusinessAccountStarBalance', LArgs));
end;

function TftAPI.SendPaidMedia(AChatId: Variant; AStarCount: Integer;
  AMedia: TList<TftInputPaidMedia>; const ACaption, AParseMode: String;
  ACaptionEntities: TftMessageEntityList; ADisableNotification,
  AProtectContent: Boolean; AReplyToMessageId: Integer;
  AReplyMarkup: TftReplyBase; AMessageThreadId: Integer;
  const APayload: String;
  const ABusinessConnectionId: String = '';
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  LArgs.AddPair('star_count', IntToStr(AStarCount));
  LArgs.AddPair('media', FTypeParser.ParseInputPaidMediaList(AMedia));
  if (ACaption <> '') then
    LArgs.AddPair('caption', ACaption);
  if (AParseMode <> '') then
    LArgs.AddPair('parse_mode', AParseMode);
  if Assigned(ACaptionEntities) then
    LArgs.AddPair('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  if (AMessageThreadId <> 0) then
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  if (ADisableNotification) then
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  if (AProtectContent) then
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  if (AReplyToMessageId <> 0) then
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));
  if (APayload <> '') then
    LArgs.AddPair('payload', APayload);

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendPaidMedia',
    LArgs, 'POST'));
end;

function TftAPI.SendChecklist(const ABusinessConnectionId: String;
  AChatId: Variant; AChecklist: TftInputChecklist; ADisableNotification,
  AProtectContent: Boolean; AReplyMarkup: TftInlineKeyboardMarkup;
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  LArgs.AddPair('checklist', FTypeParser.ParseInputChecklist(AChecklist));
  if (ADisableNotification) then
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  if (AProtectContent) then
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendChecklist',
    LArgs, 'POST'));
end;

function TftAPI.EditMessageChecklist(const ABusinessConnectionId: String;
  AChatId: Variant; AMessageId: Integer; AChecklist: TftInputChecklist;
  AReplyMarkup: TftInlineKeyboardMarkup = nil): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('message_id', IntToStr(AMessageId));
  LArgs.AddPair('checklist', FTypeParser.ParseInputChecklist(AChecklist));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage
    (SendRequest('editMessageChecklist', LArgs, 'POST'));
end;

function TftAPI.SendRichMessage(AChatId: Variant;
  ARichMessage: TftInputRichMessage; const ABusinessConnectionId: String;
  ADisableNotification, AProtectContent: Boolean; AMessageThreadId,
  AReplyToMessageId: Integer; AReplyMarkup: TftReplyBase;
  ADirectMessagesTopicId: Integer = 0;
  const AMessageEffectId: String = '';
  AAllowPaidBroadcast: Boolean = false;
  AReplyParameters: TftReplyParameters = nil;
  ASuggestedPostParameters: TftSuggestedPostParameters = nil;
  AShowCaptionAboveMedia: Boolean = false): TftMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (ABusinessConnectionId <> '') then
    LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  AddOptionalSendArgs(LArgs, ABusinessConnectionId,
    ADirectMessagesTopicId, AMessageEffectId, AAllowPaidBroadcast,
    AReplyParameters, ASuggestedPostParameters, AShowCaptionAboveMedia);
  LArgs.AddPair('rich_message',
    FTypeParser.ParseInputRichMessage(ARichMessage));
  if (AMessageThreadId <> 0) then
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  if (ADisableNotification) then
    LArgs.AddPair('disable_notification',
      BoolToStr(ADisableNotification, true));
  if (AProtectContent) then
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));
  if (AReplyToMessageId <> 0) then
    LArgs.AddPair('reply_to_message_id', IntToStr(AReplyToMessageId));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := FTypeParser.parseJsonAndGetMessage(SendRequest('sendRichMessage',
    LArgs, 'POST'));
end;

function TftAPI.SendRichMessageDraft(AChatId: Int64; ADraftId: Integer;
  ARichMessage: TftInputRichMessage; AMessageThreadId: Integer;
  ACanStop, AKeepOnStop: Boolean): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', IntToStr(AChatId));
  LArgs.AddPair('draft_id', IntToStr(ADraftId));
  LArgs.AddPair('rich_message',
    FTypeParser.ParseInputRichMessage(ARichMessage));
  if (AMessageThreadId <> 0) then
    LArgs.AddPair('message_thread_id', IntToStr(AMessageThreadId));
  if (ACanStop) then
    LArgs.AddPair('can_stop', BoolToStr(ACanStop, true));
  if (AKeepOnStop) then
    LArgs.AddPair('keep_on_stop', BoolToStr(AKeepOnStop, true));

  Result := Boolean(SendRequest('sendRichMessageDraft', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditEphemeralMessageText(AChatId: Variant;
  AReceiverUserId: Int64; AEphemeralMessageId: Integer; const AText,
  AParseMode: String; AEntities: TftMessageEntityList;
  ALinkPreviewOptions: TftLinkPreviewOptions;
  AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('receiver_user_id', IntToStr(AReceiverUserId));
  LArgs.AddPair('ephemeral_message_id', IntToStr(AEphemeralMessageId));
  if (AText <> '') then
    LArgs.AddPair('text', AText);
  if (AParseMode <> '') then
    LArgs.AddPair('parse_mode', AParseMode);
  if Assigned(AEntities) then
    LArgs.AddPair('entities', FTypeParser.ParseMessageEntities(AEntities));
  if Assigned(ALinkPreviewOptions) then
    LArgs.AddPair('link_preview_options',
      FTypeParser.ParseLinkPreviewOptions(ALinkPreviewOptions));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := Boolean(SendRequest('editEphemeralMessageText', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditEphemeralMessageMedia(AChatId: Variant;
  AReceiverUserId: Int64; AEphemeralMessageId: Integer; AMedia: TftInputMedia;
  AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('receiver_user_id', IntToStr(AReceiverUserId));
  LArgs.AddPair('ephemeral_message_id', IntToStr(AEphemeralMessageId));
  LArgs.AddPair('media', FTypeParser.ParseInputMedia(AMedia));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := Boolean(SendRequest('editEphemeralMessageMedia', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditEphemeralMessageCaption(AChatId: Variant;
  AReceiverUserId: Int64; AEphemeralMessageId: Integer; const ACaption,
  AParseMode: String; ACaptionEntities: TftMessageEntityList;
  AShowCaptionAboveMedia: Boolean = false;
  AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('receiver_user_id', IntToStr(AReceiverUserId));
  LArgs.AddPair('ephemeral_message_id', IntToStr(AEphemeralMessageId));
  if (ACaption <> '') then
    LArgs.AddPair('caption', ACaption);
  if (AParseMode <> '') then
    LArgs.AddPair('parse_mode', AParseMode);
  if Assigned(ACaptionEntities) then
    LArgs.AddPair('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  if (AShowCaptionAboveMedia) then
    LArgs.AddPair('show_caption_above_media',
      BoolToStr(AShowCaptionAboveMedia, true));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := Boolean(SendRequest('editEphemeralMessageCaption', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.EditEphemeralMessageReplyMarkup(AChatId: Variant;
  AReceiverUserId: Int64; AEphemeralMessageId: Integer;
  AReplyMarkup: TftInlineKeyboardMarkup = nil): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('receiver_user_id', IntToStr(AReceiverUserId));
  LArgs.AddPair('ephemeral_message_id', IntToStr(AEphemeralMessageId));
  if Assigned(AReplyMarkup) then
    LArgs.AddPair('reply_markup', FTypeParser.ParseReplyBase(AReplyMarkup));

  Result := Boolean(SendRequest('editEphemeralMessageReplyMarkup', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.DeleteEphemeralMessage(AChatId: Variant;
  AReceiverUserId: Int64; AEphemeralMessageId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('receiver_user_id', IntToStr(AReceiverUserId));
  LArgs.AddPair('ephemeral_message_id', IntToStr(AEphemeralMessageId));

  Result := Boolean(SendRequest('deleteEphemeralMessage', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.AnswerGuestQuery(const AGuestQueryId: String;
  AResult: TftInlineQueryResult): TftSentGuestMessage;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('guest_query_id', AGuestQueryId);
  LArgs.AddPair('result', FTypeParser.ParseInlineQueryResult(AResult));

  Result := FTypeParser.ParseJsonAndGetSentGuestMessage
    (SendRequest('answerGuestQuery', LArgs, 'POST'));
end;

function TftAPI.GetUserChatBoosts(AChatId: Variant; AUserId: Int64)
  : TftUserChatBoosts;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := FTypeParser.ParseJsonAndGetUserChatBoosts
    (SendRequest('getUserChatBoosts', LArgs));
end;

function TftAPI.GetManagedBotAccessSettings(AUserId: Int64)
  : TftBotAccessSettings;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));

  Result := FTypeParser.ParseJsonAndGetBotAccessSettings
    (SendRequest('getManagedBotAccessSettings', LArgs));
end;

function TftAPI.SetManagedBotAccessSettings(AUserId: Int64;
  AIsAccessRestricted: Boolean; AAddedUserIds: TArray<Integer>): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('is_access_restricted',
    BoolToStr(AIsAccessRestricted, true));
  if Length(AAddedUserIds) > 0 then
    LArgs.AddPair('added_user_ids',
      FTypeParser.ParseIntegers(AAddedUserIds));

  Result := Boolean(SendRequest('setManagedBotAccessSettings', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.SetMyProfilePhoto(APhoto: TftInputProfilePhoto): Boolean;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('photo', FTypeParser.ParseInputProfilePhoto(APhoto));
  if Assigned(APhoto) then
  begin
    if Assigned(APhoto.PhotoFile) then
      LArgs.AddFile('profile_photo', APhoto.PhotoFile.filePath);
    if Assigned(APhoto.AnimationFile) then
      LArgs.AddFile('profile_animation', APhoto.AnimationFile.filePath);
  end;

  Result := Boolean(SendRequest('setMyProfilePhoto', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetAvailableGifts: TftGifts;
begin
  Result := FTypeParser.ParseJsonAndGetGifts
    (SendRequest('getAvailableGifts'));
end;

function TftAPI.SetBusinessAccountProfilePhoto(
  const ABusinessConnectionId: String; APhoto: TftInputProfilePhoto;
  AIsPublic: Boolean): Boolean;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('business_connection_id', ABusinessConnectionId);
  LArgs.AddField('photo', FTypeParser.ParseInputProfilePhoto(APhoto));
  if (AIsPublic) then
    LArgs.AddField('is_public', BoolToStr(AIsPublic, true));
  if Assigned(APhoto) then
  begin
    if Assigned(APhoto.PhotoFile) then
      LArgs.AddFile('profile_photo', APhoto.PhotoFile.filePath);
    if Assigned(APhoto.AnimationFile) then
      LArgs.AddFile('profile_animation', APhoto.AnimationFile.filePath);
  end;

  Result := Boolean(SendRequest('setBusinessAccountProfilePhoto', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.SetBusinessAccountGiftSettings(
  const ABusinessConnectionId: String; AShowGiftButton: Boolean;
  AAcceptedGiftTypes: TftAcceptedGiftTypes): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('show_gift_button', BoolToStr(AShowGiftButton, true));
  LArgs.AddPair('accepted_gift_types',
    FTypeParser.ParseAcceptedGiftTypes(AAcceptedGiftTypes));

  Result := Boolean(SendRequest('setBusinessAccountGiftSettings', LArgs,
    'POST').GetValue('result'));
end;

function TftAPI.GetBusinessAccountGifts(const ABusinessConnectionId: String;
  AExcludeUnsaved, AExcludeSaved, AExcludeUnlimited,
  AExcludeLimitedUpgradable, AExcludeLimitedNonUpgradable, AExcludeUnique,
  AExcludeFromBlockchain, ASortByPrice: Boolean; const AOffset: String;
  ALimit: Integer): TftOwnedGifts;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  if (AExcludeUnsaved) then
    LArgs.AddPair('exclude_unsaved', BoolToStr(AExcludeUnsaved, true));
  if (AExcludeSaved) then
    LArgs.AddPair('exclude_saved', BoolToStr(AExcludeSaved, true));
  if (AExcludeUnlimited) then
    LArgs.AddPair('exclude_unlimited', BoolToStr(AExcludeUnlimited, true));
  if (AExcludeLimitedUpgradable) then
    LArgs.AddPair('exclude_limited_upgradable',
      BoolToStr(AExcludeLimitedUpgradable, true));
  if (AExcludeLimitedNonUpgradable) then
    LArgs.AddPair('exclude_limited_non_upgradable',
      BoolToStr(AExcludeLimitedNonUpgradable, true));
  if (AExcludeUnique) then
    LArgs.AddPair('exclude_unique', BoolToStr(AExcludeUnique, true));
  if (AExcludeFromBlockchain) then
    LArgs.AddPair('exclude_from_blockchain',
      BoolToStr(AExcludeFromBlockchain, true));
  if (ASortByPrice) then
    LArgs.AddPair('sort_by_price', BoolToStr(ASortByPrice, true));
  if (AOffset <> '') then
    LArgs.AddPair('offset', AOffset);
  if (ALimit <> 0) then
    LArgs.AddPair('limit', IntToStr(ALimit));

  Result := FTypeParser.ParseJsonAndGetOwnedGifts
    (SendRequest('getBusinessAccountGifts', LArgs));
end;

function TftAPI.GetUserGifts(AUserId: Int64; AExcludeUnlimited,
  AExcludeLimitedUpgradable, AExcludeLimitedNonUpgradable,
  AExcludeFromBlockchain, AExcludeUnique, ASortByPrice: Boolean;
  const AOffset: String; ALimit: Integer): TftOwnedGifts;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  if (AExcludeUnlimited) then
    LArgs.AddPair('exclude_unlimited', BoolToStr(AExcludeUnlimited, true));
  if (AExcludeLimitedUpgradable) then
    LArgs.AddPair('exclude_limited_upgradable',
      BoolToStr(AExcludeLimitedUpgradable, true));
  if (AExcludeLimitedNonUpgradable) then
    LArgs.AddPair('exclude_limited_non_upgradable',
      BoolToStr(AExcludeLimitedNonUpgradable, true));
  if (AExcludeFromBlockchain) then
    LArgs.AddPair('exclude_from_blockchain',
      BoolToStr(AExcludeFromBlockchain, true));
  if (AExcludeUnique) then
    LArgs.AddPair('exclude_unique', BoolToStr(AExcludeUnique, true));
  if (ASortByPrice) then
    LArgs.AddPair('sort_by_price', BoolToStr(ASortByPrice, true));
  if (AOffset <> '') then
    LArgs.AddPair('offset', AOffset);
  if (ALimit <> 0) then
    LArgs.AddPair('limit', IntToStr(ALimit));

  Result := FTypeParser.ParseJsonAndGetOwnedGifts
    (SendRequest('getUserGifts', LArgs));
end;

function TftAPI.GetChatGifts(AChatId: Variant; AExcludeUnsaved,
  AExcludeSaved, AExcludeUnlimited, AExcludeLimitedUpgradable,
  AExcludeLimitedNonUpgradable, AExcludeFromBlockchain, AExcludeUnique,
  ASortByPrice: Boolean; const AOffset: String;
  ALimit: Integer): TftOwnedGifts;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('chat_id', VarToStr(AChatId));
  if (AExcludeUnsaved) then
    LArgs.AddPair('exclude_unsaved', BoolToStr(AExcludeUnsaved, true));
  if (AExcludeSaved) then
    LArgs.AddPair('exclude_saved', BoolToStr(AExcludeSaved, true));
  if (AExcludeUnlimited) then
    LArgs.AddPair('exclude_unlimited', BoolToStr(AExcludeUnlimited, true));
  if (AExcludeLimitedUpgradable) then
    LArgs.AddPair('exclude_limited_upgradable',
      BoolToStr(AExcludeLimitedUpgradable, true));
  if (AExcludeLimitedNonUpgradable) then
    LArgs.AddPair('exclude_limited_non_upgradable',
      BoolToStr(AExcludeLimitedNonUpgradable, true));
  if (AExcludeFromBlockchain) then
    LArgs.AddPair('exclude_from_blockchain',
      BoolToStr(AExcludeFromBlockchain, true));
  if (AExcludeUnique) then
    LArgs.AddPair('exclude_unique', BoolToStr(AExcludeUnique, true));
  if (ASortByPrice) then
    LArgs.AddPair('sort_by_price', BoolToStr(ASortByPrice, true));
  if (AOffset <> '') then
    LArgs.AddPair('offset', AOffset);
  if (ALimit <> 0) then
    LArgs.AddPair('limit', IntToStr(ALimit));

  Result := FTypeParser.ParseJsonAndGetOwnedGifts
    (SendRequest('getChatGifts', LArgs));
end;

function TftAPI.PostStory(const ABusinessConnectionId: String;
  AContent: TftInputStoryContent; AActivePeriod: Integer; const ACaption,
  AParseMode: String; ACaptionEntities: TftMessageEntityList;
  APostToChatPage, AProtectContent: Boolean): TftStory;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('business_connection_id', ABusinessConnectionId);
  LArgs.AddField('content', FTypeParser.ParseInputStoryContent(AContent));
  LArgs.AddField('active_period', IntToStr(AActivePeriod));
  if Assigned(AContent) then
  begin
    if Assigned(AContent.PhotoFile) then
      LArgs.AddFile('story_photo', AContent.PhotoFile.filePath);
    if Assigned(AContent.VideoFile) then
      LArgs.AddFile('story_video', AContent.VideoFile.filePath);
  end;
  if (ACaption <> '') then
    LArgs.AddField('caption', ACaption);
  if (AParseMode <> '') then
    LArgs.AddField('parse_mode', AParseMode);
  if Assigned(ACaptionEntities) then
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));
  if (APostToChatPage) then
    LArgs.AddField('post_to_chat_page', BoolToStr(APostToChatPage, true));
  if (AProtectContent) then
    LArgs.AddField('protect_content', BoolToStr(AProtectContent, true));

  Result := FTypeParser.ParseJsonAndGetStory
    (SendRequest('postStory', LArgs, 'POST'));
end;

function TftAPI.RepostStory(const ABusinessConnectionId: String;
  AFromChatId, AFromStoryId, AActivePeriod: Integer;
  APostToChatPage, AProtectContent: Boolean): TftStory;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('from_chat_id', IntToStr(AFromChatId));
  LArgs.AddPair('from_story_id', IntToStr(AFromStoryId));
  LArgs.AddPair('active_period', IntToStr(AActivePeriod));
  if (APostToChatPage) then
    LArgs.AddPair('post_to_chat_page', BoolToStr(APostToChatPage, true));
  if (AProtectContent) then
    LArgs.AddPair('protect_content', BoolToStr(AProtectContent, true));

  Result := FTypeParser.ParseJsonAndGetStory
    (SendRequest('repostStory', LArgs, 'POST'));
end;

function TftAPI.EditStory(const ABusinessConnectionId: String;
  AStoryId: Integer; AContent: TftInputStoryContent; const ACaption,
  AParseMode: String; ACaptionEntities: TftMessageEntityList): TftStory;
var
  LArgs: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  LArgs := TMultipartFormData.Create;
  LArgs.AddField('business_connection_id', ABusinessConnectionId);
  LArgs.AddField('story_id', IntToStr(AStoryId));
  LArgs.AddField('content', FTypeParser.ParseInputStoryContent(AContent));
  if Assigned(AContent) then
  begin
    if Assigned(AContent.PhotoFile) then
      LArgs.AddFile('story_photo', AContent.PhotoFile.filePath);
    if Assigned(AContent.VideoFile) then
      LArgs.AddFile('story_video', AContent.VideoFile.filePath);
  end;
  if (ACaption <> '') then
    LArgs.AddField('caption', ACaption);
  if (AParseMode <> '') then
    LArgs.AddField('parse_mode', AParseMode);
  if Assigned(ACaptionEntities) then
    LArgs.AddField('caption_entities',
      FTypeParser.ParseMessageEntities(ACaptionEntities));

  Result := FTypeParser.ParseJsonAndGetStory
    (SendRequest('editStory', LArgs, 'POST'));
end;

function TftAPI.DeleteStory(const ABusinessConnectionId: String;
  AStoryId: Integer): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('business_connection_id', ABusinessConnectionId);
  LArgs.AddPair('story_id', IntToStr(AStoryId));

  Result := Boolean(SendRequest('deleteStory', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.ReplaceStickerInSet(AUserId: Int64;
  const AName, AOldSticker: String; ASticker: TftInputSticker): Boolean;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  LArgs.AddPair('user_id', IntToStr(AUserId));
  LArgs.AddPair('name', AName);
  LArgs.AddPair('old_sticker', AOldSticker);
  LArgs.AddPair('sticker', FTypeParser.ParseInputSticker(ASticker));

  Result := Boolean(SendRequest('replaceStickerInSet', LArgs, 'POST')
    .GetValue('result'));
end;

function TftAPI.GetStarTransactions(AOffset, ALimit: Integer)
  : TftStarTransactions;
var
  LArgs: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  LArgs := TStringList.Create;
  if (AOffset <> 0) then
    LArgs.AddPair('offset', IntToStr(AOffset));
  if (ALimit <> 100) then
    LArgs.AddPair('limit', IntToStr(ALimit));

  Result := FTypeParser.ParseJsonAndGetStarTransactions
    (SendRequest('getStarTransactions', LArgs));
end;

end.
