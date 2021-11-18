/// <summary>
/// fastTelega AvailableTypes
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes;

interface

uses
  System.Generics.Collections, System.SysUtils, Classes;

type

  TftInlineKeyboardMarkup = class;
  TftMessage = class;
  TftUpdate = class;
  TftUser = class;
  TftChat = class;
  TftAnimation = class;
  TftAudio = class;
  TftDocument = class;
  TftPhotoSize = class;
  TftSticker = class;
  TftVideo = class;
  TftVideoNote = class;
  TftVoice = class;
  TftMessageEntity = class;
  TftContact = class;
  TftDice = class;
  TftGame = class;
  TftVenue = class;
  TftLocation = class;
  TftPollOption = class;
  TftPollAnswer = class;
  TftPoll = class;
  TftInvoice = class;
  TftInlineQuery = class;
  TftInputMessageContent = class;
  TftUpdateList = TObjectList<TftUpdate>;
  TftUserList = TArray<TftUser>;
  TftMessageList = TArray<TftMessage>;
  TftMessageEntityList = TArray<TftMessageEntity>;
  TftPhotoSizeList = TArray<TftPhotoSize>;
  TftPollOptionList = TArray<TftPollOption>;
  TftStickerList = TObjectList<TftSticker>;

  /// <summary>
  /// This object represents a bot command.
  /// https://core.telegram.org/bots/api#botcommand
  /// </summary>
  TftBotCommand = class
  private
    Fcommand: String;
    Fdescription: String;
  public
    /// <summary>
    /// Command label.
    /// </summary>
    property Command: String read Fcommand write Fcommand;
    /// <summary>
    /// Description label.
    /// </summary>
    property Description: String read Fdescription write Fdescription;
  end;

  /// <summary>
  /// Contains information about why a request was unsuccessfull.
  /// </summary>
  TftResponseParameters = class
  private
    FmigrateToChatId: Integer;
    FretryAfter: Integer;
  public
    /// <summary>
    /// Optional. The group has been migrated to a supergroup with the specified identifier.
    ///
    /// This number may be greater than 32 bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a
    /// signed 64 bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateToChatId: Integer read FmigrateToChatId
      write FmigrateToChatId;
    /// <summary>
    /// Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
    /// </summary>
    property RetryAfter: Integer read FretryAfter write FretryAfter;
  end;

  /// <summary>
  /// A placeholder, currently holds no information. Use BotFather to set up your game.
  /// </summary>
  TftCallbackGame = class

  end;

  /// <summary>
  /// This object represents an incoming callback query from a callback button in an inline keyboard.
  /// </summary>
  TftCallbackQuery = class
  private
    Fid: String;
    Ffrom: TftUser;
    Fmessage: TftMessage;
    FinlineMessageId: String;
    FchatInstance: String;
    Fdata: String;
    FgameShortName: String;
  public
    /// <summary>
    /// Unique identifier for this query.
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// Sender.
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Optional. Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old.
    /// </summary>
    property Message: TftMessage read Fmessage write Fmessage;
    /// <summary>
    /// Optional. Identifier of the message sent via the bot in inline mode, that originated the query.
    /// </summary>
    property InlIneMessageId: String read FinlineMessageId
      write FinlineMessageId;
    /// <summary>
    /// Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.
    /// </summary>
    property ChatInstanCe: String read FchatInstance write FchatInstance;
    /// <summary>
    /// Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.
    /// </summary>
    property Data: String read Fdata write Fdata;
    /// <summary>
    /// Optional. Short name of a Game to be returned, serves as the unique identifier for the game
    /// </summary>
    property GameShortName: String read FgameShortName write FgameShortName;
  end;

  /// <summary>
  /// This object represents a result of an inline query that was chosen by the user and sent to their chat partner. *
  /// </summary>
  TftChosenInlineResult = class
  private
    FresultId: String;
    Ffrom: TftUser;
    Flocation: TftLocation;
    FinlineMessageId: String;
    Fquery: String;
  public
    /// <summary>
    /// The unique identifier for the result that was chosen.
    /// </summary>
    property ResultId: String read FresultId write FresultId;
    /// <summary>
    /// The user that chose the result.
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Optional. Sender location, only for bots that require user location
    /// </summary>
    property Location: TftLocation read Flocation write Flocation;
    /// <summary>
    /// Optional. Identifier of the sent inline message.
    /// Available only if there is an inline keyboard attached to the message.
    /// Will be also received in callback queries and can be used to edit the message.
    /// </summary>
    property InlIneMessageId: String read FinlineMessageId
      write FinlineMessageId;
    /// <summary>
    /// The query that was used to obtain the result.
    /// </summary>
    property Query: String read Fquery write Fquery;
  end;

  /// <summary>
  /// This object represents a shipping address.
  /// https://core.telegram.org/bots/api#shippingaddress *
  /// </summary>
  TftShippingAddress = class
  private
    FcountryCode: String;
    Fstate: String;
    Fcity: String;
    FstreetLine1: String;
    FstreetLine2: String;
    FpostCode: String;
  public
    /// <summary>
    /// ISO 3166-1 alpha-2 country code.
    /// </summary>
    property CountryCode: String read FcountryCode write FcountryCode;
    /// <summary>
    /// State, if applicable.
    /// </summary>
    property State: String read Fstate write Fstate;
    /// <summary>
    /// City.
    /// </summary>
    property City: String read Fcity write Fcity;
    /// <summary>
    /// First line for the address.
    /// </summary>
    property StreetLine1: String read FstreetLine1 write FstreetLine1;
    /// <summary>
    /// Second line for the address.
    /// </summary>
    property StreetLine2: String read FstreetLine2 write FstreetLine2;
    /// <summary>
    /// Address post code.
    /// </summary>
    property PostCode: String read FpostCode write FpostCode;
  end;

  /// <summary>
  /// This object contains information about an incoming shipping query.
  /// https://core.telegram.org/bots/api#shippingquery *
  /// </summary>
  TftShippingQuery = class
  private
    Fid: String;
    Ffrom: TftUser;
    FinvoicePayload: String;
    FshippingAddress: TftShippingAddress;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique query identifier.
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// User who sent the query.
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Bot specified invoice payload.
    /// </summary>
    property InvoIcePayload: String read FinvoicePayload write FinvoicePayload;
    /// <summary>
    /// User specified shipping address.
    /// </summary>
    property ShippingAddreSS: TftShippingAddress read FshippingAddress
      write FshippingAddress;
  end;

  /// <summary>
  /// This object represents a portion of the price for goods or services.
  /// https://core.telegram.org/bots/api#labeledprice
  /// </summary>
  TftLabeledPrice = class
  private
    Flabel: String;
    Famount: Integer;
  public
    /// <summary>
    /// Portion label.
    /// </summary>
    property LabelPrice: String read Flabel write Flabel;
    /// <summary>
    /// Price of the product in the smallest units of the currency (integer,
    /// not float/double).
    /// For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter
    /// in currencies.json, it shows the number of digits past the decimal point
    /// for each currency  (2 for the majority of currencies).
    ///
    /// https://core.telegram.org/bots/payments/currencies.json
    /// </summary>
    property Amount: Integer read Famount write Famount;
  end;

  /// <summary>
  /// This object represents one shipping option.
  /// https://core.telegram.org/bots/api#shippingoption
  /// </summary>
  TftShippingOption = class
  private
    Fid: String;
    Ftitle: String;
    Fprices: TArray<TftLabeledPrice>;
  public
    /// <summary>
    /// Shipping option identifier.
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// Option title.
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// List of price options.
    /// </summary>
    property Prices: TArray<TftLabeledPrice> read Fprices write Fprices;
  end;

  /// <summary>
  /// This object represents information about an order.
  /// https://core.telegram.org/bots/api#orderinfo *
  /// </summary>
  TftOrderInfo = class
  private
    Fname: String;
    FphoneNumber: String;
    Femail: String;
    FshippingAddress: TftShippingAddress;
  public
    /// <summary>
    /// Optional. User name.
    /// <summary>
    property Name: String read Fname write Fname;
    /// <summary>
    /// Optional. User's phone number.
    /// </summary>
    property PhoneNumber: String read FphoneNumber write FphoneNumber;
    /// <summary>
    /// Optional. User email.
    /// </summary>
    property Email: String read Femail write Femail;
    /// <summary>
    /// Optional. User shipping address.
    /// </summary>
    property ShippingAddreSS: TftShippingAddress read FshippingAddress
      write FshippingAddress;
  end;

  /// <summary>
  /// This object contains information about an incoming pre-checkout query.
  /// https://core.telegram.org/bots/api#precheckoutquery
  /// </summary>
  TftPreCheckoutQuery = class
  private
    Fid: String;
    Ffrom: TftUser;
    Fcurrency: String;
    FtotalAmount: Integer;
    FinvoicePayload: String;
    FshippingOptionId: String;
    ForderInfo: TftOrderInfo;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique query identifier.
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// User who sent the query.
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Three-letter ISO 4217 currency code.
    /// </summary>
    property CurrenCy: String read Fcurrency write Fcurrency;
    /// <summary>
    /// Total price in the smallest units of the currency (integer,
    /// For example, for a price of US$ 1.45 pass
    /// amount = 145. See the exp parameter in currencies.json, it shows
    /// the number of digits past the decimal point for each currency (2
    /// for the majority of currencies).
    /// https://core.telegram.org/bots/payments/currencies.json
    /// </summary>
    property TotalAmount: Integer read FtotalAmount write FtotalAmount;
    /// <summary>
    /// Bot specified invoice payload.
    /// </summary>
    property InvoIcePayload: String read FinvoicePayload write FinvoicePayload;
    /// <summary>
    /// Optional. Identifier of the shipping option chosen by the user.
    /// </summary>
    property ShippingOptionId: String read FshippingOptionId
      write FshippingOptionId;
    /// <summary>
    /// Optional. Order info provided by the user.
    /// </summary>
    property OrderInfo: TftOrderInfo read ForderInfo write ForderInfo;
  end;

  /// <summary>
  /// This object represents an incoming update.
  /// At most one of the optional parameters can be present in any given update.
  /// </summary>
  TftUpdate = class
  private
    Fupdate_id: Integer;
    Fmessage: TftMessage;
    Fedited_message: TftMessage;
    Fchannel_post: TftMessage;
    Fedited_channel_post: TftMessage;
    Finline_query: TftInlineQuery;
    Fchosen_inline_result: TftChosenInlineResult;
    Fcallback_query: TftCallbackQuery;
    Fshipping_query: TftShippingQuery;
    Fpre_checkout_query: TftPreCheckoutQuery;
    Fpoll: TftPoll;
    Fpoll_answer: TftPollAnswer;
    // Fmy_chat_member: ChatMemberUpdated;
    // Fchat_member: ChatMemberUpdated;
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
    property UpdateId: Integer read Fupdate_id write Fupdate_id;
    /// <summary>
    /// Optional. New incoming message of any kind — text, photo, sticker, etc.
    /// </summary>
    property Message: TftMessage read Fmessage write Fmessage;
    /// <summary>
    /// Optional. New version of a message that is known to the bot and was edited
    /// </summary>
    property EditedMessage: TftMessage read Fedited_message
      write Fedited_message;
    /// <summary>
    /// Optional. New incoming channel post of any kind — text, photo, sticker, etc.
    /// </summary>
    property ChannelPost: TftMessage read Fchannel_post write Fchannel_post;
    /// <summary>
    /// Optional. New version of a channel post that is known to the bot and was edited
    /// </summary>
    property EditedChannelPost: TftMessage read Fedited_channel_post
      write Fedited_channel_post;
    /// <summary>
    /// Optional. New incoming inline query
    /// </summary>
    property InlineQuery: TftInlineQuery read Finline_query write Finline_query;
    /// <summary>
    /// Optional. The result of an inline query that was chosen by a user
    /// and sent to their chat partner. Please see our documentation on
    /// the feedback collecting for details on how to enable these
    /// updates for your bot.
    /// </summary>
    property ChosenInlineResult: TftChosenInlineResult
      read Fchosen_inline_result write Fchosen_inline_result;
    // /// <summary>
    // /// Optional. New incoming callback query
    // /// </summary>
    property CallbackQuery: TftCallbackQuery read Fcallback_query
      write Fcallback_query;
    // /// <summary>
    // /// Optional. New incoming shipping query. Only for invoices with flexible price
    // /// </summary>
    property ShippingQuery: TftShippingQuery read Fshipping_query
      write Fshipping_query;
    // /// <summary>
    // /// Optional. New incoming pre-checkout query. Contains full information about checkout
    // /// </summary>
    property PreCheckoutQuery: TftPreCheckoutQuery read Fpre_checkout_query
      write Fpre_checkout_query;
    // /// <summary>
    // /// Optional. New poll state. Bots receive only updates about stopped
    // /// polls and polls, which are sent by the bot
    // /// </summary>
    property Poll: TftPoll read Fpoll write Fpoll;
    // /// <summary>
    // /// Optional. A user changed their answer in a non-anonymous poll.
    // /// Bots receive new votes only in polls that were sent by the bot itself.
    // /// </summary>
    property Poll_answer: TftPollAnswer read Fpoll_answer write Fpoll_answer;
    // /// <summary>
    // /// Optional. The bot's chat member status was updated in a chat. For
    // /// private chats, this update is received only when the bot is
    // /// blocked or unblocked by the user.
    // /// </summary>
    // property my_chat_member: ChatMemberUpdated read Fmy_chat_member
    // write Fmy_chat_member;
    // /// <summary>   /// Optional. A chat member's status was updated in a chat.
    // /// The bot must be an administrator in the chat and must explicitly
    // /// specify “chat_member” in the list of allowed_updates
    // /// to receive these updates.
    // /// </summary>
    // property chat_member: ChatMemberUpdated read Fchat_member
    // write Fchat_member;
  end;

  /// <summary>
  /// This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
  /// </summary>
  TftMessageEntity = class
  private
    Ftype: String;
    Foffset: Integer;
    Flength: Integer;
    Furl: String;
    Fuser: TftUser;
    Flanguage: String;
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
    property TypeMessageEntity: String read Ftype write Ftype;
    /// <summary>
    /// Offset in UTF-16 code units to the start of the entity
    /// </summary>
    property Offset: Integer read Foffset write Foffset;
    /// <summary>
    /// Length of the entity in UTF-16 code units
    /// </summary>
    property Length: Integer read Flength write Flength;
    /// <summary>
    /// Optional. For “text_link” only, url that will be opened after user taps on the text
    /// </summary>
    property Url: String read Furl write Furl;
    /// <summary>
    /// Optional. For “text_mention” only, the mentioned user
    /// </summary>
    property User: TftUser read Fuser write Fuser;
    /// <summary>
    /// Optional. For “pre” only, the programming language of the entity text
    /// </summary>
    property Language: String read Flanguage write Flanguage;
  end;

  /// <summary>
  /// Contains information about the current status of a webhook.
  /// </summary>
  TftWebhookInfo = class
  private
    Furl: String;
    Fhas_custom_certificate: Boolean;
    Fpending_update_count: Integer;
    Fip_address: String;
    Flast_error_date: Integer;
    Flast_error_message: String;
    Fmax_connections: Integer;
    Fallowed_updates: TArray<String>;
  public
    /// <summary>
    /// Webhook URL, may be empty if webhook is not set up
    /// </summary>
    property Url: String read Furl write Furl;
    /// <summary>
    /// True, if a custom certificate was provided for webhook certificate checks
    /// </summary>
    property has_custom_certificate: Boolean read Fhas_custom_certificate
      write Fhas_custom_certificate;
    /// <summary>
    /// Number of updates awaiting delivery
    /// </summary>
    property pending_update_count: Integer read Fpending_update_count
      write Fpending_update_count;
    /// <summary>
    /// Optional. Currently used webhook IP address
    /// </summary>
    property ip_address: String read Fip_address write Fip_address;
    /// <summary>
    /// Optional. Unix time for the most recent error that happened when
    /// trying to deliver an update via webhook
    /// </summary>
    property last_error_date: Integer read Flast_error_date
      write Flast_error_date;
    /// <summary>
    /// Optional. Error message in human-readable format for the most
    /// recent error that happened when trying to deliver an update via webhook
    /// </summary>
    property last_error_message: String read Flast_error_message
      write Flast_error_message;
    /// <summary>
    /// Optional. Maximum allowed number of simultaneous HTTPS connections
    /// to the webhook for update delivery
    /// </summary>
    property max_connections: Integer read Fmax_connections
      write Fmax_connections;
    /// <summary>
    /// Optional. A list of update types the bot is subscribed to. Defaults
    /// to all update types except chat_member
    /// </summary>
    property allowed_updates: TArray<String> read Fallowed_updates
      write Fallowed_updates;
  end;

  /// <summary>
  /// This object contains basic information about a successful payment.
  /// https://core.telegram.org/bots/api#successfulpayment
  /// </summary>
  TftSuccessfulPayment = class
  private
    Fcurrency: String;
    FtotalAmount: Integer;
    FinvoicePayload: String;
    FshippingOptionId: String;
    ForderInfo: TftOrderInfo;
    FtelegramPaymentChargeId: String;
    FproviderPaymentChargeId: String;
  public
    // constructor Create;
    // destructor Destroy; override;
    /// <summary>
    /// Three-letter ISO 4217 currency code
    /// </summary>
    property CurrenCy: String read Fcurrency write Fcurrency;
    /// <summary>
    /// Total price in the smallest units of the currency (integer,
    /// not float/double).
    /// For example, for a price of US$ 1.45 pass
    /// amount = 145. See the exp parameter in currencies.json, it shows
    /// the number of digits past the decimal point for each currency (2
    /// for the majority of currencies).
    /// https://core.telegram.org/bots/payments/currencies.json
    /// </summary>
    property TotalAmount: Integer read FtotalAmount write FtotalAmount;
    /// <summary>
    /// Bot specified invoice payload.
    /// </summary>
    property InvoIcePayload: String read FinvoicePayload write FinvoicePayload;
    /// <summary>
    /// Optional. Identifier of the shipping option chosen by the user.
    /// </summary>
    property ShippingOptionId: String read FshippingOptionId
      write FshippingOptionId;
    /// <summary>
    /// Optional. Order info provided by the user.
    /// </summary>
    property OrderInfo: TftOrderInfo read ForderInfo write ForderInfo;
    /// <summary>
    /// Telegram payment identifier.
    /// </summary>
    property TelegramPaymenTChargeId: String read FtelegramPaymentChargeId
      write FtelegramPaymentChargeId;
    /// <summary>
    /// Provider payment identifier.
    /// </summary>
    property ProviderPaymentChargeId: String read FproviderPaymentChargeId
      write FproviderPaymentChargeId;
  end;

  /// <summary>
  /// This object represents a message.
  /// </summary>
  TftMessage = class
  private
    Fmessage_id: Integer;
    Ffrom: TftUser;
    Fsender_chat: TftChat;
    Fdate: Integer;
    Fchat: TftChat;
    Fforward_from: TftUser;
    Fforward_from_chat: TftChat;
    Fforward_from_message_id: Integer;
    Fforward_signature: String;
    Fforward_sender_name: String;
    Fforward_date: Integer;
    Freply_to_message: TftMessage;
    Fvia_bot: TftUser;
    Fedit_date: Integer;
    Fmedia_group_id: String;
    Fauthor_signature: String;
    Ftext: String;
    Fentities: TftMessageEntityList;
    FcaptionEntities: TftMessageEntityList;
    Fanimation: TftAnimation;
    Faudio: TftAudio;
    Fdocument: TftDocument;
    Fphoto: TftPhotoSizeList;
    Fsticker: TftSticker;
    Fvideo: TftVideo;
    Fvideo_note: TftVideoNote;
    Fvoice: TftVoice;
    Fcaption: String;
    Fcaption_entities: TftMessageEntityList;
    Fcontact: TftContact;
    Fdice: TftDice;
    Fgame: TftGame;
    Fpoll: TftPoll;
    Fvenue: TftVenue;
    Flocation: TftLocation;
    Fnew_chat_member: TftUser;
    Fnew_chat_members: TftUserList;
    Fleft_chat_member: TftUser;
    Fnew_chat_title: String;
    Fnew_chat_photo: TftPhotoSizeList;
    Fdelete_chat_photo: Boolean;
    Fgroup_chat_created: Boolean;
    Fsupergroup_chat_created: Boolean;
    Fchannel_chat_created: Boolean;
    // Fmessage_auto_delete_timer_changed
    // : TftMessageAutoDeleteTimerChanged;
    Fmigrate_to_chat_id: Integer;
    Fmigrate_from_chat_id: Integer;
    Fpinned_message: TftMessage;
    Finvoice: TftInvoice;
    Fsuccessful_payment: TftSuccessfulPayment;
    Fconnected_website: String;
    // Fpassport_data: TftPassportData;
    // Fproximity_alert_triggered: TftProximityAlertTriggered;
    // Fvoice_chat_scheduled: TftVoiceChatScheduled;
    // Fvoice_chat_started: TftVoiceChatStarted;
    // Fvoice_chat_ended: TftVoiceChatEnded;
    // Fvoice_chat_participants_invited: TftVoiceChatParticipantsInvited;
    Freply_markup: TftInlineKeyboardMarkup;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Unique message identifier inside this chat
    /// </summary>
    property MessageId: Integer read Fmessage_id write Fmessage_id;
    /// <summary>
    /// Optional. Sender, empty for messages sent to channels
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Optional. Sender of the message, sent on behalf of a chat. The channel
    /// itself for channel messages. The supergroup itself for messages
    /// from anonymous group administrators. The linked channel for
    /// messages automatically forwarded to the discussion group
    /// </summary>
    property SenderChat: TftChat read Fsender_chat write Fsender_chat;
    /// <summary>
    /// Date the message was sent in Unix time
    /// </summary>
    property Date: Integer read Fdate write Fdate;
    /// <summary>
    /// Conversation the message belongs to
    /// </summary>
    property Chat: TftChat read Fchat write Fchat;
    /// <summary>
    /// Optional. For forwarded messages, sender of the original message
    /// </summary>
    property ForwardFrom: TftUser read Fforward_from write Fforward_from;
    /// <summary>
    /// Optional. For messages forwarded from channels or from anonymous administrators, information about the original sender chat
    /// </summary>
    property ForwardFromChat: TftChat read Fforward_from_chat
      write Fforward_from_chat;
    /// <summary>
    /// Optional. For messages forwarded from channels, identifier of the original message in the channel
    /// </summary>
    property ForwardFromMessageId: Integer read Fforward_from_message_id
      write Fforward_from_message_id;
    /// <summary>
    /// Optional. For messages forwarded from channels, signature of the post author if present
    /// </summary>
    property ForwardSignature: String read Fforward_signature
      write Fforward_signature;
    /// <summary>
    /// Optional. Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages
    /// </summary>
    property ForwardSenderName: String read Fforward_sender_name
      write Fforward_sender_name;
    /// <summary>
    /// Optional. For forwarded messages, date the original message was sent in Unix time
    /// </summary>
    property ForwardDate: Integer read Fforward_date write Fforward_date;
    /// <summary>
    /// Optional. For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.
    /// </summary>
    property ReplyToMessage: TftMessage read Freply_to_message
      write Freply_to_message;
    /// <summary>
    /// Optional. Bot through which the message was sent
    /// </summary>
    property ViaBot: TftUser read Fvia_bot write Fvia_bot;
    /// <summary>
    /// Optional. Date the message was last edited in Unix time
    /// </summary>
    property EditDate: Integer read Fedit_date write Fedit_date;
    /// <summary>
    /// Optional. The unique identifier of a media message group this message belongs to
    /// </summary>
    property MediaGroupId: String read Fmedia_group_id write Fmedia_group_id;
    /// <summary>
    /// Optional.Signature of the post author for messages in channels, or the custom Title of an anonymous group administrator
    /// </summary>
    property AuthorSignature: String read Fauthor_signature
      write Fauthor_signature;
    /// <summary>
    /// Optional. For text messages, the actual UTF-8 text of the message, 0-4096 characters
    /// </summary>
    property Text: String read Ftext write Ftext;
    /// <summary>
    /// Optional. For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text
    /// </summary>
    property Entities: TftMessageEntityList read Fentities write Fentities;
    /// <summary>
    /// Optional.For messages with a caption, special entities like usernames, URLs, bot commands etc.that appear in the caption
    /// </summary>
    property CaptionEntities: TftMessageEntityList read Fcaption_entities
      write Fcaption_entities;
    /// <summary>
    /// Optional. Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set
    /// </summary>
    property Animation: TftAnimation read Fanimation write Fanimation;
    /// <summary>
    /// Optional. Message is an audio file, information about the file
    /// </summary>
    property Audio: TftAudio read Faudio write Faudio;
    /// <summary>
    /// Optional. Message is a general file, information about the file
    /// </summary>
    property Document: TftDocument read Fdocument write Fdocument;
    /// <summary>
    /// Optional. Message is a photo, available sizes of the photo
    /// </summary>
    property Photo: TftPhotoSizeList read Fphoto write Fphoto;
    /// Optional. Message is a sticker, information about the sticker
    /// </summary>
    property Sticker: TftSticker read Fsticker write Fsticker;
    /// <summary>
    /// Optional. Message is a video, information about the video
    /// </summary>
    property Video: TftVideo read Fvideo write Fvideo;
    /// <summary>
    /// Optional. Message is a video note, information about the video message
    /// </summary>
    property VideoNote: TftVideoNote read Fvideo_note write Fvideo_note;
    /// <summary>
    /// Optional. Message is a voice message, information about the file
    /// </summary>
    property Voice: TftVoice read Fvoice write Fvoice;
    /// <summary>
    /// Optional. Caption for the animation, audio, document, photo, video or voice, 0-1024 characters
    /// </summary>
    property Caption: String read Fcaption write Fcaption;
    /// <summary>
    /// Optional. Message is a shared contact, information about the contact
    /// </summary>
    property Contact: TftContact read Fcontact write Fcontact;
    /// <summary>
    /// Optional. Message is a dice with random value
    /// </summary>
    property Dice: TftDice read Fdice write Fdice;
    /// <summary>
    /// Optional. Message is a game, information about the game. More about games »
    /// </summary>
    property Game: TftGame read Fgame write Fgame;
    /// <summary>
    /// Optional. Message is a native poll, information about the poll
    /// </summary>
    property Poll: TftPoll read Fpoll write Fpoll;
    /// <summary>
    /// Optional. Message is a venue, information about the venue. For backward compatibility, when this field is set, the location field will also be set
    /// </summary>
    property Venue: TftVenue read Fvenue write Fvenue;
    /// <summary>
    /// Optional. Message is a shared location, information about the location
    property Location: TftLocation read Flocation write Flocation;
    /// <summary>
    /// Optional. A member was removed from the group, information about them (this member may be bot itself).
    /// </summary>
    property NewChatMember: TftUser read Fnew_chat_member
      write Fnew_chat_member;
    /// <summary>
    /// Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
    /// </summary>
    property NewChatMembers: TftUserList read Fnew_chat_members
      write Fnew_chat_members;
    /// <summary>
    /// Optional. A member was removed from the group, information about them (this member may be the bot itself)
    /// </summary>
    property LeftChatMember: TftUser read Fleft_chat_member
      write Fleft_chat_member;
    /// <summary>
    /// Optional. A chat title was changed to this value
    /// </summary>
    property NewChatTitle: String read Fnew_chat_title write Fnew_chat_title;
    /// <summary>
    /// Optional. A chat photo was change to this value
    /// </summary>
    property NewChatPhoto: TftPhotoSizeList read Fnew_chat_photo
      write Fnew_chat_photo;
    /// <summary>
    /// Optional. Service message: the chat photo was deleted
    /// </summary>
    property DeleteChatPhoto: Boolean read Fdelete_chat_photo
      write Fdelete_chat_photo default True;
    /// <summary>
    /// Optional. Service message: the group has been created
    /// </summary>
    property GroupChatCreated: Boolean read Fgroup_chat_created
      write Fgroup_chat_created default True;
    /// <summary>
    /// Optional. Service message: the supergroup has been created. This field can't be received in a message coming through updates, because bot can't be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
    /// </summary>
    property SupergroupChatCreated: Boolean read Fsupergroup_chat_created
      write Fsupergroup_chat_created default True;
    /// <summary>
    /// Optional. Service message: the channel has been created. This field can't be received in a message coming through updates, because bot can't be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
    /// </summary>
    property ChannelChatCreated: Boolean read Fchannel_chat_created
      write Fchannel_chat_created default True;
    // /// <summary>
    // /// Optional. Service message: auto-delete timer settings changed in the chat
    // /// </summary>
    // property message_auto_delete_timer_changed
    // : TftMessageAutoDeleteTimerChanged
    // read Fmessage_auto_delete_timer_changed
    // write Fmessage_auto_delete_timer_changed;
    /// <summary>
    /// Optional. The group has been migrated to a supergroup with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateToChatId: Integer read Fmigrate_to_chat_id
      write Fmigrate_to_chat_id;
    /// <summary>
    /// Optional. The supergroup has been migrated from a group with the specified identifier. This number may have more than 32 significant bits and some programming languages may have difficulty/silent defects in interpreting it. But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateFromChatId: Integer read Fmigrate_from_chat_id
      write Fmigrate_from_chat_id;
    /// <summary>
    /// Optional. Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.
    /// </summary>
    property PinnedMessage: TftMessage read Fpinned_message
      write Fpinned_message;
    // /// <summary>
    // /// Optional. Message is an invoice for a payment, information about the invoice. More about payments »
    // /// </summary>
    property Invoice: TftInvoice read Finvoice write Finvoice;
    // /// <summary>
    // /// Optional. Message is a service message about a successful payment, information about the payment. More about payments »
    // /// </summary>
    property SuccessfulPayment: TftSuccessfulPayment read Fsuccessful_payment
      write Fsuccessful_payment;
    // /// <summary>
    // /// Optional. The domain name of the website on which the user has logged in. More about Telegram Login »
    // /// </summary>
    property ConnectedWebsite: String read Fconnected_website
      write Fconnected_website;
    // /// <summary>
    // /// Optional. Telegram Passport data
    // /// </summary>
    // property passport_data: PassportData read Fpassport_data
    // write Fpassport_data;
    // /// <summary>
    // /// Optional. Service message. A user in the chat triggered another user's proximity alert while sharing Live Location.
    // /// </summary>
    // property proximity_alert_triggered: ProximityAlertTriggered
    // read Fproximity_alert_triggered write Fproximity_alert_triggered;
    // /// <summary>
    // /// Optional. Service message: voice chat scheduled
    // /// </summary>
    // property voice_chat_scheduled: VoiceChatScheduled read Fvoice_chat_scheduled
    // write Fvoice_chat_scheduled;
    // /// <summary>
    // /// Optional. Service message: voice chat started
    // /// </summary>
    // property voice_chat_started: VoiceChatStarted read Fvoice_chat_started
    // write Fvoice_chat_started;
    // /// <summary>
    // /// Optional. Service message: voice chat ended
    // /// </summary>
    // property voice_chat_ended: VoiceChatEnded read Fvoice_chat_ended
    // write Fvoice_chat_ended;
    // /// <summary>
    // /// Optional. Service message: new participants invited to a voice chat
    // /// </summary>
    // property voice_chat_participants_invited: VoiceChatParticipantsInvited
    // read Fvoice_chat_participants_invited
    // write Fvoice_chat_participants_invited;
    // /// <summary>
    // /// Optional. Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons.
    // /// </summary>
    property ReplyMarkup: TftInlineKeyboardMarkup read Freply_markup
      write Freply_markup;
  end;

  /// <summary>
  /// This object represents an incoming inline query. When the user sends
  /// an empty query, your bot could return some default or trending results.
  /// </summary>
  TftInlineQuery = class
  private
    Fid: String;
    Ffrom: TftUser;
    Fquery: String;
    Foffset: String;
    Fchat_type: String;
    Flocation: TftLocation;
  public
    /// <summary>
    /// Unique identifier for this query
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// Sender
    /// </summary>
    property From: TftUser read Ffrom write Ffrom;
    /// <summary>
    /// Text of the query (up to 256 characters)
    /// </summary>
    property Query: String read Fquery write Fquery;
    /// <summary>
    /// Offset of the results to be returned, can be controlled by the bot
    /// </summary>
    property Offset: String read Foffset write Foffset;
    /// <summary>
    /// Optional. Type of the chat, from which the inline query was sent.
    /// Can be either “sender” for a private chat with the inline query
    /// sender, “private”, “group”, “supergroup”, or “channel”. The chat
    /// type should be always known for requests sent from official clients
    /// and most third-party clients, unless the request was sent from
    /// a secret chat
    /// </summary>
    property chat_type: String read Fchat_type write Fchat_type;
    /// <summary>
    /// Optional. Sender location, only for bots that request user location
    /// </summary>
    property Location: TftLocation read Flocation write Flocation;
  end;

  /// <summary>
  /// This abstract class is base of all inline query results.
  /// </summary>
  TftInlineQueryResult = class
  private
    Ftype: String;
    Fid: String;
    Ftitle: String;
    Fcaption: String;
    FreplyMarkup: TftInlineKeyboardMarkup;
    FinputMessageContent: TftInputMessageContent;
  public
    /// <summary>
    /// Type of the result.
    /// </summary>
    property TypeInlineQueryResult: String read Ftype write Ftype;
    /// <summary>
    /// Unique identifier for this result. (1-64 bytes)
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// Requred, optional or missing. See description of derived classes. Title of the result.
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// Optional or missing. See description of derived classes. Caption of the file to be sent, 0-200 characters
    /// </summary>
    property Caption: String read Fcaption write Fcaption;
    /// <summary>
    /// Optional. Inline keyboard attached to the message
    /// </summary>
    property ReplyMarkup: TftInlineKeyboardMarkup read FreplyMarkup
      write FreplyMarkup;
    /// <summary>
    /// Requred, optional or missing. See description of derived classes. Content of the message to be sent
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FinputMessageContent write FinputMessageContent;
  end;

  /// <summary>
  /// Represents a link to an article of web page.
  /// </summary>
  TftInlineQueryResultArticle = class(TftInlineQueryResult)
  private
    Ftype: String;
    Furl: String;
    FhideUrl: Boolean;
    Fdescription: String;
    FthumbUrl: String;
    FthumbWidth: Integer;
    FthumbHeight: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultArticle: String read Ftype write Ftype;
    /// <summary>
    /// Optional. URL of the result.
    /// </summary>
    property Url: String read Furl write Furl;
    /// <summary>
    /// Optional. Pass True if you don't want the URL to be shown in the message.
    /// </summary>
    property HideUrl: Boolean read FhideUrl write FhideUrl;
    /// <summary>
    /// Optional. Short description of the result.
    /// </summary>
    property Description: String read Fdescription write Fdescription;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FthumbWidth write FthumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FthumbHeight write FthumbHeight;
  end;

  /// <summary>
  /// Represents a link to an mp3 audio file.
  /// </summary>
  TftInlineQueryResultAudio = class(TftInlineQueryResult)
  private
    Ftype: String;
    FaudioUrl: String;
    Fperformer: String;
    FaudioDuration: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultAudio: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL for the audio file
    /// </summary>
    property AudioUrl: String read FaudioUrl write FaudioUrl;
    /// <summary>
    /// Optional. Performer
    /// </summary>
    property Performer: String read Fperformer write Fperformer;
    /// <summary>
    /// Optional. Audio duration in seconds
    /// </summary>
    property AudioDuration: Integer read FaudioDuration write FaudioDuration;
  end;

  /// <summary>
  /// Represents a link to an mp3 audio file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedAudio = class(TftInlineQueryResult)
  private
    Ftype: String;
    FaudioFileId: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedAudio: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier for the audio file
    /// </summary>
    property AudioFileId: String read FaudioFileId write FaudioFileId;
  end;

  /// <summary>
  /// Represents a link to a file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedDocument = class(TftInlineQueryResult)
  private
    Ftype: String;
    FdocumentFileId: String;
    Fdescription: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedDocument: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier for the file
    /// </summary>
    property DocumentFileId: String read FdocumentFileId write FdocumentFileId;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read Fdescription write Fdescription;
  end;

  /// <summary>
  /// Represents a link to an animated GIF file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedGif = class(TftInlineQueryResult)
  private
    Ftype: String;
    FgifFileId: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedGif: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier for the GIF file
    /// </summary>
    property GifFileId: String read FgifFileId write FgifFileId;
  end;

  /// <summary>
  /// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedMpeg4Gif = class(TftInlineQueryResult)
  private
    Ftype: String;
    Fmpeg4FileId: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedMpeg4Gif: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier for the MP4 file
    /// </summary>
    property Mpeg4FileId: String read Fmpeg4FileId write Fmpeg4FileId;
  end;

  /// <summary>
  /// Represents a link to a photo stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedPhoto = class(TftInlineQueryResult)
  private
    Ftype: String;
    FphotoFileId: String;
    Fdescription: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedPhoto: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier of the photo
    /// </summary>
    property PhotoFileId: String read FphotoFileId write FphotoFileId;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read Fdescription write Fdescription;
  end;

  /// <summary>
  /// Represents a link to a sticker stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedSticker = class(TftInlineQueryResult)
  private
    Ftype: String;
    FstickerFileId: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedSticker: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier of the sticker
    /// </summary>
    property StickerFileId: String read FstickerFileId write FstickerFileId;
  end;

  /// <summary>
  /// Represents a link to a video file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedVideo = class(TftInlineQueryResult)
  private
    Ftype: String;
    FvideoFileId: String;
    Fdescription: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedVideo: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier of the video
    /// </summary>
    property VideoFileId: String read FvideoFileId write FvideoFileId;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read Fdescription write Fdescription;
  end;

  /// <summary>
  /// Represents a link to a voice message stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedVoice = class(TftInlineQueryResult)
  private
    Ftype: String;
    FvoiceFileId: String;
  public
    constructor Create;
    property TypeInlineQueryResultCachedVoice: String read Ftype write Ftype;
    /// <summary>
    /// A valid file identifier of the voice message
    /// </summary>
    property VoiceFileId: String read FvoiceFileId write FvoiceFileId;
  end;

  /// <summary>
  /// Represents a contact with a phone number
  /// </summary>
  TftInlineQueryResultContact = class(TftInlineQueryResult)
  private
    Ftype: String;
    Fphone_number: String;
    Ffirst_name: String;
    Flast_name: String;
    Fvcard: String;
    FthumbUrl: String;
    FthumbWidth: Integer;
    FthumbHeight: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultContact: String read Ftype write Ftype;
    /// <summary>
    /// Contact's phone number
    /// </summary>
    property PhoneNumber: String read Fphone_number write Fphone_number;
    /// <summary>
    /// Contact's first name
    /// </summary>
    property FirstName: String read Ffirst_name write Ffirst_name;
    /// <summary>
    /// Optional. Contact's last name
    /// </summary>
    property LastName: String read Flast_name write Flast_name;
    /// <summary>
    /// Optional. Additional data about the contact in the form of a vCard
    /// </summary>
    property Vcard: String read Fvcard write Fvcard;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FthumbWidth write FthumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FthumbHeight write FthumbHeight;
  end;

  /// <summary>
  /// Represents a link to a file.
  /// </summary>
  TftInlineQueryResultDocument = class(TftInlineQueryResult)
  private
    Ftype: String;
    FdocumentUrl: String;
    FmimeType: String;
    Fdescription: String;
    FthumbUrl: String;
    FthumbWidth: Integer;
    FthumbHeight: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultDocument: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL for the file
    /// </summary>
    property DocumentUrl: String read FdocumentUrl write FdocumentUrl;
    /// <summary>
    /// Mime type of the content of the file, either 'application/pdf' or 'application/zip'
    /// </summary>
    property MimeType: String read FmimeType write FmimeType;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read Fdescription write Fdescription;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FthumbWidth write FthumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FthumbHeight write FthumbHeight;
  end;

  /// <summary>
  /// Represents a Game.
  /// </summary>
  TftInlineQueryResultGame = class(TftInlineQueryResult)
  private
    Ftype: String;
    FgameShortName: String;
  public
    constructor Create;
    property TypeInlineQueryResultGame: String read Ftype write Ftype;
    /// <summary>
    /// Short name of the game
    /// </summary>
    property GameShortName: String read FgameShortName write FgameShortName;
  end;

  /// <summary>
  /// Represents a link to an animated GIF file.
  /// </summary>
  TftInlineQueryResultGif = class(TftInlineQueryResult)
  private
    Ftype: String;
    FgifUrl: String;
    FgifWidth: Integer;
    FgifHeight: Integer;
    FgifDuration: Integer;
    FthumbUrl: String;
  public
    constructor Create;
    property TypeInlineQueryResultGif: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL for the GIF file.
    /// </summary>
    property GifUrl: String read FgifUrl write FgifUrl;
    /// <summary>
    /// Optional. Width of the GIF.
    /// </summary>
    property GifWidth: Integer read FgifWidth write FgifWidth;
    /// <summary>
    /// Optional. Height of the GIF.
    /// </summary>
    property GifHeight: Integer read FgifHeight write FgifHeight;
    /// <summary>
    /// Optional. Duration of the GIF
    /// </summary>
    property GifDuration: Integer read FgifDuration write FgifDuration;
    /// <summary>
    /// URL of the static thumbnail for the result (jpeg or gif)
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
  end;

  /// <summary>
  /// Represents a location on a map.
  /// </summary>
  TftInlineQueryResultLocation = class(TftInlineQueryResult)
  private
    Ftype: String;
    Flatitude: Double;
    Flongitude: Double;
    FthumbUrl: String;
    FthumbWidth: Integer;
    FthumbHeight: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultLocation: String read Ftype write Ftype;
    /// <summary>
    /// Location latitude in degrees
    /// </summary>
    property Latitude: Double read Flatitude write Flatitude;
    /// <summary>
    /// Location longitude in degrees
    /// </summary>
    property Longitude: Double read Flongitude write Flongitude;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FthumbWidth write FthumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FthumbHeight write FthumbHeight;
  end;

  /// <summary>
  /// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound).
  /// </summary>
  TftInlineQueryResultMpeg4Gif = class(TftInlineQueryResult)
  private
    Ftype: String;
    Fmpeg4Url: String;
    Fmpeg4Width: Integer;
    Fmpeg4Height: Integer;
    Fmpeg4Duration: Integer;
    FthumbUrl: String;
  public
    constructor Create;
    property TypeInlineQueryResultMpeg4Gif: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL for the MP4 file.
    /// </summary>
    property Mpeg4Url: String read Fmpeg4Url write Fmpeg4Url;
    /// <summary>
    /// Optional. Video width.
    /// </summary>
    property Mpeg4Width: Integer read Fmpeg4Width write Fmpeg4Width;
    /// <summary>
    /// Optional. Video height.
    /// </summary>
    property Mpeg4Height: Integer read Fmpeg4Height write Fmpeg4Height;
    /// <summary>
    /// Optional. Video duration.
    /// </summary>
    property Mpeg4Duration: Integer read Fmpeg4Duration write Fmpeg4Duration;
    /// <summary>
    /// URL of the static thumbnail (jpeg or gif) for the result
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
  end;

  /// <summary>
  /// Represents a link to a photo.
  /// </summary>
  TftInlineQueryResultPhoto = class(TftInlineQueryResult)
  private
    Ftype: String;
    FphotoUrl: String;
    FthumbUrl: String;
    FphotoWidth: Integer;
    FphotoHeight: Integer;
    FphotoDuration: Integer;
    Fdescription: String;
  public
    constructor Create;
    property TypeInlineQueryResultPhoto: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL of the photo.
    /// </summary>
    property PhotoUrl: String read FphotoUrl write FphotoUrl;
    /// <summary>
    /// Optional. Width of the photo.
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// URL of the thumbnail for the photo
    /// </summary>
    property PhotoWidth: Integer read FphotoWidth write FphotoWidth;
    /// <summary>
    /// Optional. Width of the photo.
    /// </summary>
    property PhotoHeight: Integer read FphotoHeight write FphotoHeight;
    /// <summary>
    /// Optional. Height of the photo.
    /// </summary>
    property PhotoDuration: Integer read FphotoDuration write FphotoDuration;
    /// <summary>
    /// Optional. Short description of the result.
    /// </summary>
    property Description: String read Fdescription write Fdescription;
  end;

  /// <summary>
  /// Represents a venue.
  /// </summary>
  TftInlineQueryResultVenue = class(TftInlineQueryResult)
  private
    Ftype: String;
    Flatitude: Double;
    Flongitude: Double;
    Faddress: String;
    FfoursquareId: String;
    FfoursquareType: String;
    FthumbUrl: String;
    FthumbWidth: Integer;
    FthumbHeight: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultVenue: String read Ftype write Ftype;
    /// <summary>
    /// Location latitude in degrees
    /// </summary>
    property Latitude: Double read Flatitude write Flatitude;
    /// <summary>
    /// Location longitude in degrees
    /// </summary>
    property Longitude: Double read Flongitude write Flongitude;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property Address: String read Faddress write Faddress;
    /// <summary>
    /// Optional. Foursquare identifier of the venue if known
    /// </summary>
    property FoursquareId: String read FfoursquareId write FfoursquareId;
    /// <summary>
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </summary>
    property FoursquareType: String read FfoursquareType write FfoursquareType;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FthumbWidth write FthumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FthumbHeight write FthumbHeight;
  end;

  /// <summary>
  /// Represents link to a page containing an embedded video player or a video file.
  /// </summary>
  TftInlineQueryResultVideo = class(TftInlineQueryResult)
  private
    Ftype: String;
    FvideoUrl: String;
    FmimeType: String;
    FthumbUrl: String;
    FvideoWidth: Integer;
    FvideoHeight: Integer;
    FvideoDuration: Integer;
    Fdescription: String;
  public
    constructor Create;
    property TypeInlineQueryResultVideo: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL for the embedded video player or video file.
    /// </summary>
    property VideoUrl: String read FvideoUrl write FvideoUrl;
    /// <summary>
    /// Mime type of the content of video url, "text/html" or "video/mp4".
    /// </summary>
    property MimeType: String read FmimeType write FmimeType;
    /// <summary>
    /// URL of the thumbnail (jpeg only) for the video
    /// </summary>
    property ThumbUrl: String read FthumbUrl write FthumbUrl;
    /// <summary>
    /// Optional. Video width.
    /// </summary>
    property VideoWidth: Integer read FvideoWidth write FvideoWidth;
    /// <summary>
    /// Optional. Video height.
    /// </summary>
    property VideoHeight: Integer read FvideoHeight write FvideoHeight;
    /// <summary>
    /// Optional. Video duration
    /// </summary>
    property VideoDuration: Integer read FvideoDuration write FvideoDuration;
    /// <summary>
    /// Optional. Short description of the result.
    /// </summary>
    property Description: String read Fdescription write Fdescription;
  end;

  /// <summary>
  /// Represents link to a page containing an embedded Voice player or a Voice file.
  /// </summary>
  TftInlineQueryResultVoice = class(TftInlineQueryResult)
  private
    Ftype: String;
    FvoiceUrl: String;
    FvoiceDuration: Integer;
  public
    constructor Create;
    property TypeInlineQueryResultVoice: String read Ftype write Ftype;
    /// <summary>
    /// A valid URL for the voice recording
    /// </summary>
    property VoiceUrl: String read FvoiceUrl write FvoiceUrl;
    /// <summary>
    /// Optional. Recording duration in seconds
    /// </summary>
    property VoiceDuration: Integer read FvoiceDuration write FvoiceDuration;
  end;

  /// <summary>
  /// This object contains basic information about an invoice.
  /// </summary>
  TftInvoice = class
  private
    Ftitle: String;
    Fdescription: String;
    Fstart_parameter: String;
    Fcurrency: String;
    Ftotal_amount: Integer;
  public
    /// <summary>
    /// Product name
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// Product description
    /// </summary>
    property Description: String read Fdescription write Fdescription;
    /// <summary>
    /// Unique bot deep-linking parameter that can be
    /// used to generate this invoice
    /// </summary>
    property StartParameter: String read Fstart_parameter
      write Fstart_parameter;
    /// <summary>
    /// Three-letter ISO 4217 currency code
    /// </summary>
    property CurrenCy: String read Fcurrency write Fcurrency;
    /// <summary>
    /// Total price in the smallest units of the currency (integer,
    /// not float/double). For example, for a price of US$ 1.45 pass
    /// amount = 145. See the exp parameter in currencies.json,
    /// it shows the number of digits past the decimal point for
    /// each currency (2 for the majority of currencies).
    /// </summary>
    property TotalAmount: Integer read Ftotal_amount write Ftotal_amount;
  end;

  /// <summary>
  /// This object contains information about one answer option in a poll.
  /// </summary>
  TftPollOption = class
  private
    Ftext: String;
    Fvoter_count: Integer;
  public
    /// <summary>
    /// Option text, 1-100 characters
    /// </summary>
    property Text: String read Ftext write Ftext;
    /// <summary>
    /// Number of users that voted for this option
    /// </summary>
    property VoterCount: Integer read Fvoter_count write Fvoter_count;
  end;

  /// <summary>
  /// This object represents an answer of a user in a non-anonymous poll.
  /// </summary>
  TftPollAnswer = class
  private
    Fpoll_id: String;
    Fuser: TftUser;
    Foption_ids: Array of Integer;
  public
    /// <summary>
    /// Unique poll identifier
    /// </summary>
    property poll_id: String read Fpoll_id write Fpoll_id;
    /// <summary>
    /// The user, who changed the answer to the poll
    /// </summary>
    property User: TftUser read Fuser write Fuser;
    // /// <summary>
    // /// 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.
    // /// </summary>
    // property option_ids: Array of Integer read Foption_ids write Foption_ids;
  end;

  /// <summary>
  /// This object contains information about a poll.
  /// </summary>
  TftPoll = class
  private
    Fid: String;
    Fquestion: String;
    Foptions: TftPollOptionList;
    Ftotal_voter_count: Integer;
    Fis_closed: Boolean;
    Fis_anonymous: Boolean;
    Ftype: String;
    Fallows_multiple_answers: Boolean;
    Fcorrect_option_id: Integer;
    Fexplanation: String;
    Fexplanation_entities: TftMessageEntityList;
    Fopen_period: Integer;
    Fclose_date: Integer;
  public
    /// <summary>
    /// Unique poll identifier
    /// </summary>
    property Id: String read Fid write Fid;
    /// <summary>
    /// Poll question, 1-300 characters
    /// </summary>
    property Question: String read Fquestion write Fquestion;
    /// <summary>
    /// List of poll options
    /// </summary>
    property Options: TftPollOptionList read Foptions write Foptions;
    /// <summary>
    /// Total number of users that voted in the poll
    /// </summary>
    property TotalVoterCount: Integer read Ftotal_voter_count
      write Ftotal_voter_count;
    /// <summary>
    /// True, if the poll is closed
    /// </summary>
    property IsClosed: Boolean read Fis_closed write Fis_closed;
    /// <summary>
    /// True, if the poll is anonymous
    /// </summary>
    property IsAnonymous: Boolean read Fis_anonymous write Fis_anonymous;
    /// <summary>
    /// Poll type, currently can be “regular” or “quiz”
    /// </summary>
    property TypePoll: String read Ftype write Ftype;
    /// <summary>
    /// True, if the poll allows multiple answers
    /// </summary>
    property AllowsMultipleAnswers: Boolean read Fallows_multiple_answers
      write Fallows_multiple_answers;
    /// <summary>
    /// Optional. 0-based identifier of the correct answer option.
    /// Available only for polls in the quiz mode, which are closed,
    // or was sent (not forwarded) by the bot or
    /// to the private chat with the bot.
    /// </summary>
    property CorrectOptionId: Integer read Fcorrect_option_id
      write Fcorrect_option_id;
    /// <summary>
    /// Optional. Text that is shown when a user chooses an incorrect
    /// /answer or taps on the lamp icon in a quiz-style poll, 0-200 characters
    /// </summary>
    property Explanation: String read Fexplanation write Fexplanation;
    /// <summary>
    /// Optional. Special entities like usernames, URLs, bot commands,
    /// etc. that appear in the explanation
    /// </summary>
    property ExplanationEntities: TftMessageEntityList
      read Fexplanation_entities write Fexplanation_entities;
    /// <summary>
    /// Optional. Amount of time in seconds the poll will be active
    /// after creation
    /// </summary>
    property OpenPeriod: Integer read Fopen_period write Fopen_period;
    /// <summary>
    /// Optional. Point in time (Unix timestamp) when the poll will be
    /// automatically closed
    /// </summary>
    property CloseDate: Integer read Fclose_date write Fclose_date;

  end;

  /// <summary>
  /// This object represents a point on the map.
  /// </summary>
  TftLocation = class
  private
    Flongitude: Double;
    Flatitude: Double;
    Fhorizontal_accuracy: Double;
    Flive_period: Integer;
    Fheading: Integer;
    Fproximity_alert_radius: Integer;
  public
    /// <summary>
    /// Longitude as defined by sender
    /// </summary>
    property Longitude: Double read Flongitude write Flongitude;
    /// <summary>
    /// Latitude as defined by sender
    /// </summary>
    property Latitude: Double read Flatitude write Flatitude;
    /// <summary>
    /// number 	//Optional. The radius of uncertainty for the location,
    /// measured in meters; 0-1500
    /// </summary>
    property Horizontal_accuracy: Double read Fhorizontal_accuracy
      write Fhorizontal_accuracy;
    /// <summary>
    /// Optional. Time relative to the message sending date, during which
    /// the location can be updated, in seconds. For active live locations only.
    /// </summary>
    property Live_period: Integer read Flive_period write Flive_period;
    /// <summary>/// Optional. The direction in which user is moving, in
    /// degrees; 1-360. For active live locations only.
    /// </summary>
    property Heading: Integer read Fheading write Fheading;
    /// <summary>
    /// Optional. Maximum distance for proximity alerts about approaching
    /// another chat member, in meters. For sent live locations only.
    /// </summary>
    property Proximity_alert_radius: Integer read Fproximity_alert_radius
      write Fproximity_alert_radius;
  end;

  /// <summary>
  /// Represents a location to which a chat is connected.
  /// </summary>
  TftChatLocation = class
  private
    Flocation: TftLocation;
    Faddress: String;
  public
    /// <summary>
    /// The location to which the supergroup is connected. Can't be a live location.
    /// </summary>
    property Location: TftLocation read Flocation write Flocation;
    /// <summary>
    /// Location address; 1-64 characters, as defined by the chat owner
    /// </summary>
    property Address: String read Faddress write Faddress;
  end;

  /// <summary>
  /// This object contains information about one member of the chat.
  /// </summary>
  TftChatMember = class
  private
    Fuser: TftUser;
    Fstatus: String;
    FuntilDate: Integer;
    FcanBeEdited: Boolean;
    FcanChangeInfo: Boolean;
    FcanPostMessages: Boolean;
    FcanEditMessages: Boolean;
    FcanDeleteMessage: Boolean;
    FcanInviteUsers: Boolean;
    FcanRestrictMembers: Boolean;
    FcanPinMessages: Boolean;
    FisMember: Boolean;
    FcanPromoteMembers: Boolean;
    FcanSendMessages: Boolean;
    FcanSendMediaMessages: Boolean;
    FcanSendOtherMessages: Boolean;
    FcanSendPolls: Boolean;
    FcanAddWebPagePreviews: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Information about the user
    /// </summary>
    property User: TftUser read Fuser write Fuser;
    /// <summary>
    /// The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”
    /// </summary>
    property StatuS: String read Fstatus write Fstatus;
    /// <summary>
    /// Optional. Restricted and kicked only. Date when restrictions will be lifted for this user, unix time.
    /// </summary>
    property UntilDate: Integer read FuntilDate write FuntilDate;
    /// <summary>
    /// Optional. Administrators only. True, if the bot is allowed to edit administrator privileges of that user.
    /// </summary>
    property CanBeEdited: Boolean read FcanBeEdited write FcanBeEdited;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can change the chat title, photo and other settings.
    /// </summary>
    property CanChangeInfo: Boolean read FcanChangeInfo write FcanChangeInfo;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can post in the channel, channels only.
    /// </summary>
    property CanPostMessages: Boolean read FcanPostMessages
      write FcanPostMessages;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can edit messages of other users and can pin messages, channels only.
    /// </summary>
    property CanEditMessages: Boolean read FcanEditMessages
      write FcanEditMessages;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can delete messages of other users.
    /// </summary>
    property CanDeleteMessage: Boolean read FcanDeleteMessage
      write FcanDeleteMessage;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can invite new users to the chat.
    /// </summary>
    property CanInviteUsers: Boolean read FcanInviteUsers write FcanInviteUsers;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can restrict, ban or unban chat members.
    /// </summary>
    property CanRestriCtMembers: Boolean read FcanRestrictMembers
      write FcanRestrictMembers;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can pin messages, supergroups only.
    /// </summary>
    property CanPinMessages: Boolean read FcanPinMessages write FcanPinMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user is a member of the chat at the moment of the request.
    /// </summary>
    property IsMember: Boolean read FisMember write FisMember;
    /// <summary>
    /// Optional. Administrators only. True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user).
    /// </summary>
    property CanPromoteMembers: Boolean read FcanPromoteMembers
      write FcanPromoteMembers;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send text messages, contacts, locations and venues.
    /// </summary>
    property CanSendMessages: Boolean read FcanSendMessages
      write FcanSendMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages.
    /// </summary>
    property CanSendMediaMessages: Boolean read FcanSendMediaMessages
      write FcanSendMediaMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages.
    /// </summary>
    property CanSendOtherMessages: Boolean read FcanSendOtherMessages
      write FcanSendOtherMessages;
    /// <summary>
    /// Optional. Restricted only. True, if the user can send animations, games, stickers and use inline bots, implies can_send_media_messages.
    /// </summary>
    property CanSendPolls: Boolean read FcanSendPolls write FcanSendPolls;
    /// <summary>
    /// Optional. Restricted only. True, if user may add web page previews to his messages, implies can_send_media_messages.
    /// </summary>
    property CanAddWebPagePreviews: Boolean read FcanAddWebPagePreviews
      write FcanAddWebPagePreviews;
  end;

  /// <summary>
  /// This object represents one size of a photo or a file / sticker thumbnail.
  /// </summary>
  TftPhotoSize = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fwidth: Integer;
    Fheight: Integer;
    Ffile_size: Integer;
  public
    /// <summary>
    /// Identifier for this file, which can be used to download or reuse the file
    /// </summary>
    property FileId: String read Ffile_id write Ffile_id;
    /// <summary>
    /// Unique identifier for this file, which is supposed to be the
    /// same over time and for different bots. Can't be used to download
    /// or reuse the file.
    /// </summary>
    property FileUniqueId: String read Ffile_unique_id write Ffile_unique_id;
    /// <summary>
    /// Photo width
    /// </summary>
    property Width: Integer read Fwidth write Fwidth;
    /// <summary>
    /// Photo height
    /// </summary>
    property Height: Integer read Fheight write Fheight;
    /// <summary>
    /// Optional. File size
    /// </summary>
    property FileSize: Integer read Ffile_size write Ffile_size;
  end;

  /// <summary>
  /// This object represents the contents of a file to be uploaded.
  /// </summary>
  TftInputFile = class
  private
    Fdata: String;
    FfilePath: String;
    FmimeType: String;
    FfileName: String;
  public
    /// <summary>
    /// Creates new TftInputFile from an existing file.
    /// </summary>
    class function fromFile(const filePath: String; const MimeType: String)
      : TftInputFile;
    /// <summary>
    /// Contents of a file.
    /// </summary>
    property Data: String read Fdata write Fdata;
    /// <summary>
    /// Mime type of a file.
    /// </summary>
    property MimeType: String read FmimeType write FmimeType;
    /// <summary>
    /// File name.
    /// </summary>
    property fileName: String read FfileName write FfileName;
    /// <summary>
    /// File path.
    /// </summary>
    property filePath: String read FfilePath write FfilePath;
  end;

  TftInputMediaType = (imtPhoto, imtVideo, imtAnimation, imtDocument, imtAudio);

  /// <summary>
  /// This object represents the content of a media message to be sent.
  /// </summary>
  TftInputMedia = class
  private
    FtypeMedia: TftInputMediaType;
    Fmedia: String;
    Fthumb: String;
    Fcaption: String;
    FparseMode: String;
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
    Fperformer: Integer;
    Ftitle: Integer;
    FsupportsStreaming: Boolean;
  public
    constructor Create;
    /// <summary>
    /// Type of the result, It should be one of TYPE::*
    /// </summary>
    property TypeMedia: TftInputMediaType read FtypeMedia write FtypeMedia;
    /// <summary>
    /// File to send. Pass a file_id to send a file that exists on the
    /// Telegram servers (recommended), pass an HTTP URL for Telegram to get
    /// a file from the Internet, or pass "attach://<file_attach_name>" to upload
    /// a new one using multipart/form-data under <file_attach_name> name.
    /// </summary>
    property Media: String read Fmedia write Fmedia;
    /// <summary>
    /// Optional. Thumbnail of the file sent.
    /// The thumbnail should be in JPEG format and less than 200 kB in size.
    /// A thumbnail‘s width and height should not exceed 90. Ignored if the file
    /// is not uploaded using multipart/form-data. Thumbnails can’t be reused
    /// and can be only uploaded as a new file, so you can pass
    /// “attach://<file_attach_name>” if the thumbnail was uploaded using
    // multipart/form-data under <file_attach_name>.
    /// </summary>
    property Thumb: String read Fthumb write Fthumb;
    /// <summary>
    /// Optional. Caption of the media to be sent, 0-200 characters
    /// </summary>
    property Caption: String read Fcaption write Fcaption;
    /// <summary>
    /// Optional. Send Markdown or HTML, if you want Telegram apps to show bold,
    /// italic, fixed-width text or inline URLs in the media caption.
    /// </summary>
    property ParseMode: String read FparseMode write FparseMode;
    /// <summary>
    /// Optional. Media width
    /// </summary>
    property Width: Integer read Fwidth write Fwidth;
    /// <summary>
    /// Optional. Media height
    /// </summary>
    property Height: Integer read Fheight write Fheight;
    /// <summary>
    /// Optional. Media duration
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
    /// <summary>
    /// Optional. Performer of the audio.
    /// </summary>
    property Performer: Integer read Fperformer write Fperformer;
    /// <summary>
    /// Optional. Title of the audio.
    /// </summary>
    property Title: Integer read Ftitle write Ftitle;
    /// <summary>
    /// Optional. Pass True, if the uploaded video is suitable for streaming
    /// </summary>
    property SupportSStreaming: Boolean read FsupportsStreaming
      write FsupportsStreaming;
  end;

  /// <summary>
  /// This object represents the content of a media message to be sent.
  /// </summary>
  TftInputMessageContent = class
  private
    FtypeMessageContent: String;
  public
    constructor Create(ATypeMessageContent: String);
    /// <summary>
    /// May be
    /// InputTextMessageContent
    /// InputLocationMessageContent
    /// InputVenueMessageContent
    /// InputContactMessageContent
    /// </summary>
    property TypeMessageContent: String read FtypeMessageContent
      write FtypeMessageContent;
  end;

  /// <summary>
  /// Represents the content of a text message to be sent as the result of an inline query.
  /// </summary>
  TftInputTextMessageContent = class(TftInputMessageContent)
  private
    FmessageText: String;
    FparseMode: String;
    FdisableWebPagePreview: Boolean;
  public
    constructor Create();
    /// <summary>
    /// Text of the message to be sent, 1-4096 characters
    /// </summary>
    property MessageText: String read FmessageText write FmessageText;
    /// <summary>
    /// Text of the message to be sent, 1-4096 characters
    /// </summary>
    property ParseMode: String read FparseMode write FparseMode;
    /// <summary>
    /// Text of the message to be sent, 1-4096 characters
    /// </summary>
    property DisableWebPagePreview: Boolean read FdisableWebPagePreview
      write FdisableWebPagePreview;
  end;

  /// <summary>
  /// Represents the content of a location message to be sent as the result of an inline query.
  /// </summary>
  TftInputLocationMessageContent = class(TftInputMessageContent)
  private
    Flatitude: Double;
    Flongitude: Double;
  public
    constructor Create();
    /// <summary>
    /// Latitude of the location in degrees
    /// </summary>
    property Latitude: Double read Flatitude write Flatitude;
    /// <summary>
    /// Longitude of the location in degrees
    /// </summary>
    property Longitude: Double read Flongitude write Flongitude;
  end;

  /// <summary>
  /// Represents the content of a venue message to be sent as the result of an inline query.
  /// </summary>
  TftInputVenueMessageContent = class(TftInputMessageContent)
  private
    Flatitude: Double;
    Flongitude: Double;
    Ftitle: String;
    Faddress: String;
    FfoursquareId: String;
    FfoursquareType: String;
  public
    constructor Create();
    /// <summary>
    /// Latitude of the location in degrees
    /// </summary>
    property Latitude: Double read Flatitude write Flatitude;
    /// <summary>
    /// Longitude of the location in degrees
    /// </summary>
    property Longitude: Double read Flongitude write Flongitude;
    /// <summary>
    /// Name of the venue
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property Address: String read Faddress write Faddress;
    /// <summary>
    /// Optional. Foursquare identifier of the venue, if known
    /// </summary>
    property FoursquareId: String read FfoursquareId write FfoursquareId;
    /// <summary>
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </summary>
    property FoursquareType: String read FfoursquareType write FfoursquareType;
  end;

  /// <summary>
  /// Represents the content of a contact message to be sent as the result of an inline query.
  /// </summary>
  TftInputContactMessageContent = class(TftInputMessageContent)
  private
    FphoneNumber: String;
    FfirstName: String;
    FlastName: String;
    Fvcard: String;
  public
    constructor Create();
    /// <summary>
    /// Name of the venue
    /// </summary>
    property PhoneNumber: String read FphoneNumber write FphoneNumber;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property FirstName: String read FfirstName write FfirstName;
    /// <summary>
    /// Optional. Foursquare identifier of the venue, if known
    /// </summary>
    property LastName: String read FlastName write FlastName;
    /// <summary>
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </summary>
    property Vcard: String read Fvcard write Fvcard;
  end;

  /// <summary>
  /// This object represents a general file (as opposed to photos, voice messages and audio files).
  /// </summary>
  TftDocument = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fthumb: TftPhotoSize;
    Ffile_name: String;
    Fmime_type: String;
    Ffile_size: Integer;
  public
    constructor Create;
    /// <summary>
    /// Identifier for this file, which can be used to download or reuse the file
    /// </summary>
    property FileId: String read Ffile_id write Ffile_id;
    /// <summary>
    /// Unique identifier for this file, which is supposed to be the
    /// same over time and for different bots. Can't be used to
    /// download or reuse the file.
    /// </summary>
    property FileUniqueId: String read Ffile_unique_id write Ffile_unique_id;
    /// <summary>
    /// Optional. Animation thumbnail as defined by sender
    /// </summary>
    property Thumb: TftPhotoSize read Fthumb write Fthumb;
    /// <summary>
    /// <summary>
    /// Optional. Original animation filename as defined by sender
    /// </summary>
    property fileName: String read Ffile_name write Ffile_name;
    /// <summary>
    /// Optional. MIME type of the file as defined by sender
    /// </summary>
    property MimeType: String read Fmime_type write Fmime_type;
    /// <summary>
    /// Optional. File size
    /// </summary>
    property FileSize: Integer read Ffile_size write Ffile_size;
  end;

  /// <summary>
  /// This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound).
  /// </summary>
  TftAnimation = class(TftDocument)
  private
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
  public
    /// <summary>
    /// Video width as defined by sender
    /// </summary>
    property Width: Integer read Fwidth write Fwidth;
    /// <summary>
    /// Video height as defined by sender
    /// </summary>
    property Height: Integer read Fheight write Fheight;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
  end;

  /// <summary>
  /// This object represents an audio file to be treated as music by the  clients.
  /// </summary>
  TftAudio = class(TftDocument)
  private
    Fduration: Integer;
    Fperformer: String;
    Ftitle: String;
  public
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
    /// <summary>
    /// Optional. Performer of the audio as defined by sender or by audio tags
    /// </summary>
    property Performer: String read Fperformer write Fperformer;
    /// <summary>
    /// Optional. Title of the audio as defined by sender or by audio tags
    /// </summary>
    property Title: String read Ftitle write Ftitle;
  end;

  /// <summary>
  /// This object represents a video file.
  /// </summary>
  TftVideo = class(TftDocument)
  private
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
  public
    /// <summary>
    /// Video width as defined by sender
    /// </summary>
    property Width: Integer read Fwidth write Fwidth;
    /// <summary>
    /// Video height as defined by sender
    /// </summary>
    property Height: Integer read Fheight write Fheight;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
  end;

  /// <summary>
  /// This object represents a video message (available in  apps as of v.4.0).
  /// </summary>
  TftVideoNote = class(TftDocument)
  private
    Flength: Integer;
    Fduration: Integer;
  public
    /// <summary>
    /// Video width and height (diameter of the video message) as defined by sender
    /// </summary>
    property Length: Integer read Flength write Flength;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
  end;

  /// <summary>
  /// This object represents a voice note.
  /// </summary>
  TftVoice = class(TftDocument)
  private
    Fduration: Integer;
  public
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
  end;

  /// <summary>
  /// This object represents a general file (as opposed to photos, voice messages and audio files).
  /// </summary>
  TftContact = class
  private
    Fphone_number: String;
    Ffirst_name: String;
    Flast_name: String;
    Fuser_id: Integer;
    Fvcard: String;
  public
    /// <summary>
    /// Contact's phone number
    /// </summary>
    property PhoneNumber: String read Fphone_number write Fphone_number;
    /// <summary>
    /// Contact's first name
    /// </summary>
    property FirstName: String read Ffirst_name write Ffirst_name;
    /// <summary>
    /// Optional. Contact's last name
    /// </summary>
    property LastName: String read Flast_name write Flast_name;
    /// <summary>
    /// Optional. Contact's user identifier in . This number may
    /// have more than 32 significant bits and some programming languages
    /// may have difficulty/silent defects in interpreting it. But it has at
    /// most 52 significant bits, so a 64-bit integer or double-precision float
    /// type are safe for storing this identifier.
    /// </summary>
    property UserId: Integer read Fuser_id write Fuser_id;
    /// <summary>
    /// Optional. Additional data about the contact in the form of a vCard
    /// </summary>
    property Vcard: String read Fvcard write Fvcard;
  end;

  /// <summary>
  /// This object represents an animated emoji that displays a random value.
  /// </summary>
  TftDice = class
  private
    Femoji: String;
    Fvalue: Integer;
  public
    /// <summary>
    /// Emoji on which the dice throw animation is based
    /// </summary>
    property Emoji: String read Femoji write Femoji;
    /// <summary>
    /// Value of the dice, 1-6 for “🎲”, “🎯” and “🎳” base emoji,
    /// 1-5 for “🏀” and “⚽” base emoji, 1-64 for “🎰” base emoji
    /// </summary>
    property Value: Integer read Fvalue write Fvalue;
  end;

  /// <summary>
  /// This object represents a sticker.
  /// </summary>
  TftMaskPosition = class
  private
    Fpoint: String;
    /// The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    Fx_shift: Double;
    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    Fy_shift: Double;
    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    Fscale: Double;
    /// Mask scaling coefficient. For example, 2.0 means double size.
  public
    /// <summary>
    /// The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.
    /// </summary>
    property Point: String read Fpoint write Fpoint;
    /// <summary>
    /// Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.
    /// </summary>
    property XShift: Double read Fx_shift write Fx_shift;
    /// <summary>
    /// Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.
    /// </summary>
    property YShift: Double read Fy_shift write Fy_shift;
    /// <summary>
    /// Mask scaling coefficient. For example, 2.0 means double size.
    /// </summary>
    property Scale: Double read Fscale write Fscale;
  end;

  /// <summary>
  /// This object represents a sticker.
  /// </summary>
  TftSticker = class(TftDocument)
  private
    Fwidth: Integer;
    Fheight: Integer;
    Fis_animated: Boolean;
    Femoji: String;
    Fset_name: String;
    Fmask_position: TftMaskPosition;
  public
    constructor Create;
    /// <summary>
    /// Video width as defined by sender
    /// </summary>
    property Width: Integer read Fwidth write Fwidth;
    /// <summary>
    /// Video height as defined by sender
    /// </summary>
    property Height: Integer read Fheight write Fheight;
    /// <summary>
    /// True,if the sticker is animated
    /// </summary>
    property IsAnimated: Boolean read Fis_animated write Fis_animated;
    /// <summary>
    /// Optional.Name of the sticker set to which the sticker belongs
    /// </summary>
    property Emoji: String read Femoji write Femoji;
    /// <summary>
    /// Optional. Name of the sticker set to which the sticker belongs.
    /// </summary>
    property SetName: String read Fset_name write Fset_name;
    /// <summary>
    /// Optional.For mask stickers the position where the mask should be placed
    /// </summary>
    property MaskPosition: TftMaskPosition read Fmask_position
      write Fmask_position;
  end;

  /// <summary>
  /// This object represents a sticker set.
  /// </summary>
  TftStickerSet = class(TftDocument)
  private
    Fname: String;
    Ftitle: String;
    FisAnimated: Boolean;
    FcontainsMasks: Boolean;
    Fstickers: TftStickerList;
  public
    // constructor Create;
    /// <summary>
    /// Sticker set name
    /// </summary>
    property Name: String read Fname write Fname;
    /// <summary>
    /// Sticker set title.
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// True, if the sticker set contains animated stickers.
    /// </summary>
    property IsAnimated: Boolean read FisAnimated write FisAnimated;
    /// <summary>
    /// True, if the sticker set contains masks.
    /// </summary>
    property ContainsMasks: Boolean read FcontainsMasks write FcontainsMasks;
    /// <summary>
    /// List of all set stickers.
    /// </summary>
    property Stickers: TftStickerList read Fstickers write Fstickers;
  end;

  /// <summary>
  /// This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers.
  /// </summary>
  TftGame = class
  private
    Ftitle: String;
    Fdescription: String;
    Fphoto: TftPhotoSizeList;
    Ftext: String;
    Ftext_entities: TftMessageEntityList;
    Fanimation: TftAnimation;
  public
    /// <summary>
    /// Title of the game.
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// Description of the game
    /// </summary>
    property Description: String read Fdescription write Fdescription;
    /// <summary>
    /// Photo that will be displayed in the game message in chats.
    /// </summary>
    property Photo: TftPhotoSizeList read Fphoto write Fphoto;
    /// <summary>
    /// Optional. Brief description of the game or high scores included
    /// in the game message. Can be automatically edited to include current high
    /// scores for the game when the bot calls setGameScore, or manually edited
    /// using editMessageText. 0-4096 characters.
    /// </summary>
    property Text: String read Ftext write Ftext;
    /// <summary>
    /// Optional. Special entities that appear in text, such as usernames,
    /// URLs, bot commands, etc.
    /// </summary>
    property TextEntities: TftMessageEntityList read Ftext_entities
      write Ftext_entities;
    /// <summary>
    /// Optional. Animation that will be displayed in the game message
    /// in chats. Upload via BotFather
    /// </summary>
    property Animation: TftAnimation read Fanimation write Fanimation;
  end;

  /// <summary>
  /// This object represents one row of the high scores table for a game.
  /// </summary>
  TftGameHighScore = class
  private
    Fposition: String;
    Fuser: TftUser;
    Fscore: Integer;
  public
    /// <summary>
    /// Position in high score table for the game.
    /// </summary>
    property Position: String read Fposition write Fposition;
    /// <summary>
    /// User
    /// </summary>
    property User: TftUser read Fuser write Fuser;
    /// <summary>
    /// Score
    /// </summary>
    property Score: Integer read Fscore write Fscore;
  end;

  /// <summary>
  /// This object represents a venue.
  /// </summary>
  TftVenue = class
  private
    Flocation: TftLocation;
    Ftitle: String;
    Faddress: String;
    Ffoursquare_id: String;
    Ffoursquare_type: String;
    Fgoogle_place_id: String;
    Fgoogle_place_type: String;
  public
    /// <summary>
    /// Venue location. Can't be a live location
    /// </summary>
    property Location: TftLocation read Flocation write Flocation;
    /// <summary>
    /// Name of the venue
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property Address: String read Faddress write Faddress;
    /// <summary>
    /// Optional. Foursquare identifier of the venue
    /// </summary>
    property foursquare_id: String read Ffoursquare_id write Ffoursquare_id;
    /// <summary>
    /// Optional. Foursquare type of the venue. (For example,
    /// “arts_entertainment/default”, “arts_entertainment/aquarium”
    /// or “food/icecream”.)
    /// </summary>
    property foursquare_type: String read Ffoursquare_type
      write Ffoursquare_type;
    /// <summary>
    /// Optional. Google Places identifier of the venue
    /// </summary>
    property google_place_id: String read Fgoogle_place_id
      write Fgoogle_place_id;
    /// <summary>
    /// Optional. Google Places type of the venue. (See supported types.)
    /// </summary>
    property google_place_type: String read Fgoogle_place_type
      write Fgoogle_place_type;
  end;

  /// <summary>
  /// This object represents a chat photo.
  /// </summary>
  TftChatPhoto = class
  private
    Fsmall_file_id: String;
    Fsmall_file_unique_id: String;
    Fbig_file_id: String;
    Fbig_file_unique_id: String;
  public
    /// <summary>
    /// File identifier of small (160x160) chat photo. This file_id can be
    /// used only for photo download and only for as long as the photo
    /// is not changed.
    /// </summary>
    property SmallFileId: String read Fsmall_file_id write Fsmall_file_id;
    /// <summary>
    /// Unique file identifier of small (160x160) chat photo, which is
    /// supposed to be the same over time and for different bots.
    /// Can't be used to download or reuse the file.
    /// </summary>
    property SmallFileUniqueId: String read Fsmall_file_unique_id
      write Fsmall_file_unique_id;
    /// <summary>
    /// File identifier of big (640x640) chat photo. This file_id can be used
    /// only for photo download and only for as long as the photo
    /// is not changed.
    /// </summary>
    property BigFileId: String read Fbig_file_id write Fbig_file_id;
    /// <summary>
    /// Unique file identifier of big (640x640) chat photo, which is
    /// supposed to be the same over time and for different bots. Can't be
    /// used to download or reuse the file.
    /// </summary>
    property BigFileUniqueIid: String read Fbig_file_unique_id
      write Fbig_file_unique_id;
  end;

  /// <summary>
  /// This object represents a  user or bot.
  /// </summary>
  TftUser = class
  private
    Fid: Integer;
    Fis_bot: Boolean;
    Ffirst_name: String;
    Flast_name: String;
    Fusername: String;
    Flanguage_code: String;
    Fcan_join_groups: Boolean;
    Fcan_read_all_group_messages: Boolean;
    Fsupports_inline_queries: Boolean;
  public
    constructor Create;
    /// <summary>
    /// Unique identifier for this user or bot.
    /// This number may have more than 32 significant bits and some programming
    /// languages may have difficulty / silent defects
    /// in interpreting it.But it has at most 52 significant bits,
    /// so a 64 - bit Integer or double - precision float type are safe for
    /// storing this identifier.Fis_bot: Boolean; // True, if this user is a bot
    /// </summary>
    property Id: Integer read Fid write Fid;
    /// <summary>
    /// True, if this user is a bot
    /// </summary>
    property IsBot: Boolean read Fis_bot write Fis_bot;
    /// <summary>
    /// User's or bot's first name
    /// </summary>
    property FirstName: String read Ffirst_name write Ffirst_name;
    /// <summary>
    /// Optional. User's or bot's last name
    /// </summary>
    property LastName: String read Flast_name write Flast_name;
    /// <summary>
    /// Optional. User's or bot's username
    /// </summary>
    property UserName: String read Fusername write Fusername;
    /// <summary>
    /// Optional. IETF language tag of the user's language
    /// </summary>
    property LanguageCode: String read Flanguage_code write Flanguage_code;
    /// <summary>
    /// Optional. True, if the bot can be invited to groups. Returned only in getMe.
    /// </summary>
    property CanJoinGroups: Boolean read Fcan_join_groups
      write Fcan_join_groups;
    /// <summary>
    /// Optional. True, if privacy mode is disabled for the bot. Returned only in getMe.
    /// </summary>
    property CanReadAllGroupMessages: Boolean read Fcan_read_all_group_messages
      write Fcan_read_all_group_messages;
    /// <summary>
    /// Optional. True, if the bot supports inline queries. Returned only in getMe.
    /// </summary>
    property SupportsInlineQueries: Boolean read Fsupports_inline_queries
      write Fsupports_inline_queries;
  end;

  /// <summary>
  /// This object represent a user's profile pictures.
  /// </summary>
  TftUserProfilePhotos = class
  private
    FtotalCount: Integer;
    Fphotos: TArray<TftPhotoSizeList>;
  public
    /// <summary>
    /// Total number of profile pictures the target user has.
    /// </summary>
    property TotalCount: Integer read FtotalCount write FtotalCount;
    /// <summary>
    /// Requested profile pictures (in up to 4 sizes each).
    /// </summary>
    property Photos: TArray<TftPhotoSizeList> read Fphotos write Fphotos;
  end;

  /// <summary>
  /// Describes actions that a non-administrator user is allowed to take in a chat.
  /// </summary>
  TftChatPermissions = class
  private
    Fcan_send_messages: Boolean;
    Fcan_send_media_messages: Boolean;
    Fcan_send_polls: Boolean;
    Fcan_send_other_messages: Boolean;
    Fcan_add_web_page_previews: Boolean;
    Fcan_change_info: Boolean;
    Fcan_invite_users: Boolean;
    Fcan_pin_messages: Boolean;
  public
    /// <summary>
    /// Optional. True, if the user is allowed to send text messages, contacts, locations and venues
    /// </summary>
    property CanSendMessages: Boolean read Fcan_send_messages
      write Fcan_send_messages;
    /// <summary>
    /// Optional. True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
    /// </summary>
    property CanSendMediaMessages: Boolean read Fcan_send_media_messages
      write Fcan_send_media_messages;
    /// <summary>
    /// Optional. True, if the user is allowed to send polls, implies can_send_messages
    /// </summary>
    property CanSendPolls: Boolean read Fcan_send_polls write Fcan_send_polls;
    /// <summary>
    /// Optional. True, if the user is allowed to send animations, games, stickers and use inline bots, implies can_send_media_messages
    /// </summary>
    property CanSendOtherMessages: Boolean read Fcan_send_other_messages
      write Fcan_send_other_messages;
    /// <summary>
    /// Optional. True, if the user is allowed to add web page previews to their messages, implies can_send_media_messages
    /// </summary>
    property CanAddWebPagePreviews: Boolean read Fcan_add_web_page_previews
      write Fcan_add_web_page_previews;
    /// <summary>
    /// Optional. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
    /// </summary>
    property CanChangeInfo: Boolean read Fcan_change_info
      write Fcan_change_info;
    /// <summary>
    /// Optional. True, if the user is allowed to invite new users to the chat
    /// </summary>
    property CanInviteUsers: Boolean read Fcan_invite_users
      write Fcan_invite_users;
    /// <summary>
    /// Optional. True, if the user is allowed to pin messages. Ignored in public supergroups
    /// </summary>
    property CanPinMessages: Boolean read Fcan_pin_messages
      write Fcan_pin_messages;
  end;

  TftChatType = (ftcPrivate, ftcGroup, ftcSupergroup, ftcChannel);

  /// <summary>
  /// This object represents a chat.
  /// </summary>
  TftChat = class
  private
    Fid: Integer;
    Ftype: TftChatType;
    Ftitle: String;
    Fusername: String;
    Ffirst_name: String;
    Flast_name: String;
    Fphoto: TftChatPhoto;
    Fbio: String;
    Fdescription: String;
    Finvite_link: String;
    Fpinned_message: TftMessage;
    Fpermissions: TftChatPermissions;
    Fslow_mode_delay: Integer;
    Fmessage_auto_delete_time: Integer;
    Fsticker_set_name: String;
    Fcan_set_sticker_set: Boolean;
    Flinked_chat_id: Integer;
    Flocation: TftChatLocation;
  public
    /// <summary>
    /// Unique identifier for this chat. This number may have more than 32
    /// significant bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it has at most 52
    /// significant bits, so a signed 64-bit integer or double-precision
    // float type are safe for storing this identifier.
    /// </summary>
    property Id: Integer read Fid write Fid;
    /// <summary>
    /// Type of chat, can be either �private�, �group�, �supergroup� or �channel�
    /// </summary>
    property TypeChat: TftChatType read Ftype write Ftype;
    /// <summary>
    /// Optional. Title, for supergroups, channels and group chats
    /// </summary>
    property Title: String read Ftitle write Ftitle;
    /// <summary>
    /// Optional. Username, for private chats, supergroups and channels if available
    /// </summary>
    property UserName: String read Fusername write Fusername;
    /// <summary>
    /// Optional. First name of the other party in a private chat
    /// </summary>
    property FirstName: String read Ffirst_name write Ffirst_name;
    /// <summary>
    /// Optional. Last name of the other party in a private chat
    /// </summary>
    property LastName: String read Flast_name write Flast_name;
    /// Optional. Chat photo. Returned only in getChat.
    property Photo: TftChatPhoto read Fphoto write Fphoto;
    /// <summary>
    /// Optional. Bio of the other party in a private chat. Returned only in getChat.
    /// </summary>
    property Bio: String read Fbio write Fbio;
    /// <summary>
    /// Optional. Description, for groups, supergroups and channel chats. Returned only in getChat.
    /// </summary>
    property Description: String read Fdescription write Fdescription;
    /// <summary>
    /// Optional. Primary invite link, for groups, supergroups and channel chats. Returned only in getChat.
    /// </summary>
    property InviteLink: String read Finvite_link write Finvite_link;
    /// <summary>
    /// Optional. The most recent pinned message (by sending date). Returned only in getChat.
    /// </summary>
    property PinnedMessage: TftMessage read Fpinned_message
      write Fpinned_message;
    /// <summary>
    /// Optional. Default chat member permissions, for groups and supergroups. Returned only in getChat.
    /// </summary>
    property Permissions: TftChatPermissions read Fpermissions
      write Fpermissions;
    /// <summary>
    /// Optional. For supergroups, the minimum allowed delay between
    /// consecutive messages sent by each unpriviledged user.
    /// Returned only in getChat.
    /// </summary>
    property SlowModeDelay: Integer read Fslow_mode_delay
      write Fslow_mode_delay;
    /// <summary>
    /// Optional. The time after which all messages sent to the chat will be
    /// automatically deleted; in seconds. Returned only in getChat.
    /// </summary>
    property MessageAutoDeleteTime: Integer read Fmessage_auto_delete_time
      write Fmessage_auto_delete_time;
    /// <summary>
    /// Optional. For supergroups, name of group sticker set. Returned only in getChat.
    /// </summary>
    property StickerSetName: String read Fsticker_set_name
      write Fsticker_set_name;
    /// <summary>
    /// Optional. True, if the bot can change the group sticker set. Returned only in getChat.
    /// </summary>
    property CanSetStickerSet: Boolean read Fcan_set_sticker_set
      write Fcan_set_sticker_set;
    /// <summary>
    /// Optional. Unique identifier for the linked chat, i.e. the discussion
    /// group identifier for a channel and vice versa; for supergroups and
    /// channel chats. This identifier may be greater than 32 bits and some
    /// programming languages may have difficulty/silent defects in interpreting
    /// it. But it is smaller than 52 bits, so a signed 64 bit integer or
    /// double-precision float type are safe for storing this identifier.
    /// Returned only in getChat.
    /// </summary>
    property LinkedCchatId: Integer read Flinked_chat_id write Flinked_chat_id;
    /// <summary>
    /// Optional. For supergroups, the location to which the supergroup is connected. Returned only in getChat.
    /// </summary>
    property Location: TftChatLocation read Flocation write Flocation;
  end;

  /// <summary>
  /// This object represents a parameter of the inline keyboard button used
  /// to automatically authorize a user.
  /// </summary>
  TftLoginUrl = class
  private
    Furl: String;
    Fforward_text: String;
    Fbot_username: String;
    Frequest_write_access: Boolean;
  public
    /// <summary>
    /// An HTTP URL to be opened with user authorization data added to the
    /// query string when the button is pressed. If the user refuses to provide
    /// authorization data, the original URL without information about the user
    /// will be opened. The data added is the same as described in Receiving
    /// authorization data.
    /// NOTE: You must always check the hash of the received data to verify
    /// the authentication and the integrity of the data as described in
    /// Checking authorization.
    /// </summary>
    property Url: String read Furl write Furl;
    /// <summary>
    /// Optional. New text of the button in forwarded messages.
    /// </summary>
    property Forward_text: String read Fforward_text write Fforward_text;
    /// <summary>
    /// Optional. Username of a bot, which will be used for user authorization.
    /// See Setting up a bot for more details. If not specified, the current
    /// bot's username will be assumed. The url's domain must be the same as
    /// the domain linked with the bot. See Linking your domain to the bot
    /// for more details.
    /// </summary>
    property Bot_username: String read Fbot_username write Fbot_username;
    /// <summary>
    /// Optional. Pass True to request the permission for your bot to send
    /// messages to the user.
    /// </summary>
    property Request_wRite_access: Boolean read Frequest_write_access
      write Frequest_write_access;
  end;

  /// <summary>
  /// This object represents one button of the reply keyboard. For simple text
  /// buttons String can be used instead of this object to specify text of the
  /// button. Optional fields request_contact, request_location, and
  /// request_poll are mutually exclusive.
  /// </summary>
  TftKeyboardButton = class
  private
    Ftext: String;
    FrequestContact: Boolean;
    FrequestLocation: Boolean;
  public
    constructor Create(AText: String; ArequestContact: Boolean = false;
      ArequestLocation: Boolean = false); virtual;
    /// <summary>
    /// Text of the button. If none of the optional fields are used,
    /// it will be sent to the bot as a message when the button is pressed
    /// </summary>
    property Text: String read Ftext write Ftext;
    /// <summary>
    /// Optional. If True, the user's phone number will be sent as a contact
    /// when the button is pressed. Available in private chats only
    /// </summary>
    property requestContact: Boolean read FrequestContact write FrequestContact;
    /// <summary>
    /// Optional. If True, the user's current location will be sent when the
    /// button is pressed. Available in private chats only.
    /// </summary>
    property requestLocation: Boolean read FrequestLocation
      write FrequestLocation;
  end;

  /// <summary>
  /// This object represents one button of an inline keyboard. You must use
  /// exactly one of the optional fields.
  /// </summary>
  TftInlineKeyboardButton = class(TftKeyboardButton)
  private
    Furl: String;
    FloginUrl: TftLoginUrl;
    FcallbackData: String;
    FswitchInlineQuery: String;
    FswitchInlineQueryCurrentChat: String;
    Fcallback_game: TftCallbackGame;
    Fpay: Boolean;
  public
    constructor Create(AText: String; ArequestContact: Boolean = false;
      ArequestLocation: Boolean = false); override;
    destructor Destroy; override;
    /// <summary>
    /// Optional. HTTP or tg:// url to be opened when button is pressed
    property Url: String read Furl write Furl;
    /// <summary>
    /// Optional. An HTTP URL used to automatically authorize the user. Can be
    /// used as a replacement for the Telegram Login Widget.callback_data: String;
    /// Optional. Data to be sent in a callback query to the bot when button
    /// is pressed, 1 - 64 bytes
    /// </summary>
    property LoginUrL: TftLoginUrl read FloginUrl write FloginUrl;
    /// <summary>
    /// Optional. Data to be sent in a callback query to the bot when button is pressed.
    /// </summary>
    property CallbaCkData: String read FcallbackData write FcallbackData;
    /// <summary>
    /// Optional. If set, pressing the button will prompt the user to select
    /// one of their chats, open that Chat and
    /// insert the bot 's username and the specified inline query
    /// in the input field.Can be empty,
    /// in which case just the bot 's username will be inserted.
    /// Note: This offers an easy way for users to start using your bot in
    /// inline mode when they are currently in a private chat with it. Especially
    /// useful when combined with switch_pm… actions – in this case the user
    /// will be automatically returned to the chat they switched from, skipping
    /// the chat selection screen.
    /// </summary>
    property SwitchInlineQuery: String read FswitchInlineQuery
      write FswitchInlineQuery;
    /// <summary>
    /// Optional. If set, pressing the button will insert the bot's username
    /// and the specified inline query in the current chat's input field.
    /// Can be empty, in which case only the bot's username will be inserted.
    /// This offers a quick way for the User to open your bot in inline mode
    // in the same Chat – good for selecting something from multiple options.
    /// </summary>
    property SwitchInlineQueryCurrentChat: String
      read FswitchInlineQueryCurrentChat write FswitchInlineQueryCurrentChat;
    /// <summary>
    /// Optional. Description of the game that will be launched when the user
    /// presses the button.
    /// NOTE: This type of button must always be the first button in
    /// the first row.
    /// </summary>
    property Callback_game: TftCallbackGame read Fcallback_game
      write Fcallback_game;
    /// Optional. Specify True, to send a Pay button.
    /// NOTE: This type of button must always be the first button
    /// in the first row.
    /// </summary>
    property Pay: Boolean read Fpay write Fpay;

  end;

  /// <summary>
  /// This abstract class is base of all keyboard related events.
  /// </summary>
  TftReplyBase = class
  end;

  /// <summary>
  /// Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode.
  /// Example: A poll bot for groups runs in privacy mode (only receives commands, replies to its messages and mentions). There could be two ways to create a new poll:
  /// Explain the user how to send a command with parameters (e.g. /newpoll question answer1 answer2). May be appealing for hardcore users but lacks modern day polish.
  /// Guide the user through a step-by-step process. ‘Please send me your question’, ‘Cool, now let’s add the first answer option‘, ’Great. Keep adding answer options, then send /done when you‘re ready’.
  /// The last option is definitely more attractive. And if you use ForceReply in your bot‘s questions, it will receive the user’s answers even if it only receives replies, commands and mentions — without any extra work for the user.
  /// </summary>
  TftForceReply = class(TftReplyBase)
  private
    FforceReply: Boolean;
    Fselective: Boolean;
  public
    /// <summary>
    /// Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
    /// </summary>
    property ForceReply: Boolean read FforceReply write FforceReply;
    /// <summary>
    /// Optional. Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.
    /// </summary>
    property Selective: Boolean read Fselective write Fselective;
  end;

  /// <summary>
  /// This object represents an inline keyboard that appears right next
  /// to the message it belongs to.
  /// </summary>
  TftInlineKeyboardMarkup = class(TftReplyBase)
  private
    FinlineKeyboard: TList<TList<TftInlineKeyboardButton>>;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Array of button rows, each represented by an Array of
    /// TftInlineKeyboardButton objects
    /// </summary>
    property InlineKeyboard: TList < TList < TftInlineKeyboardButton >>
      read FinlineKeyboard write FinlineKeyboard;
  end;

  /// <summary>
  /// This object represents a custom keyboard with reply options
  /// (see Introduction to bots for details and examples).
  /// </summary>
  TftReplyKeyboardMarkup = class(TftReplyBase)
  private
    Fkeyboard: TList<TList<TftKeyboardButton>>;
    FresizeKeyboard: Boolean;
    FoneTimeKeyboard: Boolean;
    Fselective: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    property Keyboard: TList < TList < TftKeyboardButton >> read Fkeyboard
      write Fkeyboard;
    property ResizeKeyboard: Boolean read FresizeKeyboard write FresizeKeyboard;
    property OneTimeKeyboard: Boolean read FoneTimeKeyboard
      write FoneTimeKeyboard;
    property Selective: Boolean read Fselective write Fselective;
  end;

  /// <summary>
  /// Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard.
  /// By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden
  /// immediately after the user presses a button (see ReplyKeyboardMarkup).
  /// </summary>
  TftReplyKeyboardRemove = class(TftReplyBase)
  private
    FremoveKeyboard: Boolean;
    Fselective: Boolean;
  public
    property RemoveKeyboard: Boolean read FremoveKeyboard write FremoveKeyboard;
    property Selective: Boolean read Fselective write Fselective;
  end;

implementation

{ TftInlineKeyboardMarkup }

constructor TftInlineKeyboardMarkup.Create;
begin
  FinlineKeyboard := TList < TList < TftInlineKeyboardButton >>.Create;
end;

destructor TftInlineKeyboardMarkup.Destroy;
begin
  FreeAndNil(FinlineKeyboard);
  inherited;
end;

{ TftKeyboardButton }

constructor TftKeyboardButton.Create(AText: String; ArequestContact: Boolean;
  ArequestLocation: Boolean);
begin
  Ftext := AText;
  FrequestContact := ArequestContact;
  FrequestLocation := ArequestLocation;
end;

{ TftMessageEntity }

constructor TftMessageEntity.Create;
begin
  Fuser := TftUser.Create;
end;

destructor TftMessageEntity.Destroy;
begin
  FreeAndNil(Fuser);
  inherited;
end;

{ TftUpdate }

constructor TftUpdate.Create;
begin
  Fmessage := TftMessage.Create;
  Fedited_message := TftMessage.Create;
  Fchannel_post := TftMessage.Create;
  Fedited_channel_post := TftMessage.Create;
  Finline_query := TftInlineQuery.Create;
end;

destructor TftUpdate.Destroy;
begin
  FreeAndNil(Fmessage);
  FreeAndNil(Fedited_message);
  FreeAndNil(Fchannel_post);
  FreeAndNil(Fedited_channel_post);
  FreeAndNil(Finline_query);
  inherited;
end;

{ TftMessage }

constructor TftMessage.Create;
begin
  Ffrom := TftUser.Create;
  Fsender_chat := TftChat.Create;
  Fchat := TftChat.Create;
  Fforward_from := TftUser.Create;
  Fforward_from_chat := TftChat.Create;
  // Freply_to_message := TftMessage.Create;
  Fvia_bot := TftUser.Create;
  // Fentities := TftMessageEntityList.Create;
  Fanimation := TftAnimation.Create;
  Faudio := TftAudio.Create;
  Fdocument := TftDocument.Create;
  // Fphoto := TftPhotoSizeList.Create;
  Fsticker := TftSticker.Create;
  Fvideo := TftVideo.Create;
  Fvideo_note := TftVideoNote.Create;
  Fvoice := TftVoice.Create;
  // Fcaption_entities := TftMessageEntityList.Create;
  Fcontact := TftContact.Create;
  Fdice := TftDice.Create;
  Fgame := TftGame.Create;
  Fpoll := TftPoll.Create;
  Fvenue := TftVenue.Create;
  Flocation := TftLocation.Create;
  // Fnew_chat_members := TftUserList.Create;
  Fleft_chat_member := TftUser.Create;
  // Fnew_chat_photo := TftPhotoSizeList.Create;
end;

destructor TftMessage.Destroy;
begin
  FreeAndNil(Ffrom);
  FreeAndNil(Fsender_chat);
  FreeAndNil(Fchat);
  FreeAndNil(Fforward_from);
  FreeAndNil(Fforward_from_chat);
  FreeAndNil(Freply_to_message);
  FreeAndNil(Fvia_bot);
  // FreeAndNil(Fentities);
  FreeAndNil(Fanimation);
  FreeAndNil(Faudio);
  FreeAndNil(Fdocument);
  // FreeAndNil(Fphoto);
  FreeAndNil(Fsticker);
  FreeAndNil(Fvideo);
  FreeAndNil(Fvideo_note);
  FreeAndNil(Fvoice);
  // FreeAndNil(Fcaption_entities);
  FreeAndNil(Fcontact);
  FreeAndNil(Fdice);
  FreeAndNil(Fgame);
  FreeAndNil(Fpoll);
  FreeAndNil(Fvenue);
  FreeAndNil(Flocation);
  // FreeAndNil(Fnew_chat_members);
  FreeAndNil(Fleft_chat_member);
  // FreeAndNil(Fnew_chat_photo);
  inherited;
end;

{ TftInputFile }

class function TftInputFile.fromFile(const filePath, MimeType: String)
  : TftInputFile;
begin
  Result := TftInputFile.Create;
  // Result.data := FileTools: : read(filePath);
  Result.filePath := filePath;
  Result.MimeType := MimeType;
  Result.fileName := ExtractFileName(filePath);
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

{ TftInlineKeyboardButton }

constructor TftInlineKeyboardButton.Create(AText: String;
  ArequestContact, ArequestLocation: Boolean);
begin
  inherited Create(AText, ArequestContact, ArequestLocation);
  FloginUrl := TftLoginUrl.Create;
  Fcallback_game := TftCallbackGame.Create;
end;

destructor TftInlineKeyboardButton.Destroy;
begin
  FreeAndNil(FloginUrl);
  FreeAndNil(Fcallback_game);
  inherited;
end;

{ TftUser }

constructor TftUser.Create;
begin
  Fis_bot := false;
end;

{ TftDocument }

constructor TftDocument.Create;
begin

end;

{ TftSticker }

constructor TftSticker.Create;
begin
  Fis_animated := false;
end;

{ TftReplyKeyboardMarkup }

constructor TftReplyKeyboardMarkup.Create;
begin
  Fkeyboard := TList < TList < TftKeyboardButton >>.Create;
  FresizeKeyboard := false;
  FoneTimeKeyboard := false;
  Fselective := false;
end;

destructor TftReplyKeyboardMarkup.Destroy;
begin
  FreeAndNil(Fkeyboard);
  inherited;
end;

{ TftInputMedia }

constructor TftInputMedia.Create;
begin
  Fwidth := 0;
  Fheight := 0;
  Fduration := 0;
  Fperformer := 0;
  Ftitle := 0;
  FsupportsStreaming := false;
end;

{ TftChatMember }

constructor TftChatMember.Create;
begin
  Fuser := TftUser.Create;
  FcanBeEdited := false;
  FcanChangeInfo := false;
  FcanPostMessages := false;
  FcanEditMessages := false;
  FcanDeleteMessage := false;
  FcanInviteUsers := false;
  FcanRestrictMembers := false;
  FcanPinMessages := false;
  FisMember := false;
  FcanPromoteMembers := false;
  FcanSendMessages := false;
  FcanSendMediaMessages := false;
  FcanSendOtherMessages := false;
  FcanSendPolls := false;
  FcanAddWebPagePreviews := false;
end;

destructor TftChatMember.Destroy;
begin
  FreeAndNil(Fuser);
  inherited;
end;

{ TftInputMessageContent }

constructor TftInputMessageContent.Create(ATypeMessageContent: String);
begin
  FtypeMessageContent := ATypeMessageContent;
end;

{ TftInputTextMessageContent }

constructor TftInputTextMessageContent.Create;
begin
  inherited Create('InputTextMessageContent');
end;

{ TftInputLocationMessageContent }

constructor TftInputLocationMessageContent.Create;
begin
  inherited Create('InputLocationMessageContent');
end;

{ TftInputVenueMessageContent }

constructor TftInputVenueMessageContent.Create;
begin
  inherited Create('InputVenueMessageContent');
end;

{ TftInputContactMessageContent }

constructor TftInputContactMessageContent.Create;
begin
  inherited Create('InputContactMessageContent');
end;

{ TftInlineQueryResultArticle }

constructor TftInlineQueryResultArticle.Create;
begin
  Ftype := TypeInlineQueryResultArticle;
  FhideUrl := false;
  FthumbWidth := 0;
  FthumbHeight := 0;
end;

{ TftInlineQueryResultAudio }

constructor TftInlineQueryResultAudio.Create;
begin
  Ftype := TypeInlineQueryResultAudio;
  FaudioDuration := 0;
end;

{ TftInlineQueryResultCachedAudio }

constructor TftInlineQueryResultCachedAudio.Create;
begin
  Ftype := TypeInlineQueryResultCachedAudio;
end;

{ TftInlineQueryResultCachedDocument }

constructor TftInlineQueryResultCachedDocument.Create;
begin
  Ftype := TypeInlineQueryResultCachedDocument;
end;

{ TftInlineQueryResultCachedGif }

constructor TftInlineQueryResultCachedGif.Create;
begin
  Ftype := TypeInlineQueryResultCachedGif;
end;

{ TftInlineQueryResultCachedMpeg4Gif }

constructor TftInlineQueryResultCachedMpeg4Gif.Create;
begin
  Ftype := TypeInlineQueryResultCachedMpeg4Gif;
end;

{ TftInlineQueryResultCachedPhoto }

constructor TftInlineQueryResultCachedPhoto.Create;
begin
  Ftype := TypeInlineQueryResultCachedPhoto;
end;

{ TftInlineQueryResultCachedSticker }

constructor TftInlineQueryResultCachedSticker.Create;
begin
  Ftype := TypeInlineQueryResultCachedSticker;
end;

{ TftInlineQueryResultCachedVideo }

constructor TftInlineQueryResultCachedVideo.Create;
begin
  Ftype := TypeInlineQueryResultCachedVideo;
end;

{ TftInlineQueryResultCachedVoice }

constructor TftInlineQueryResultCachedVoice.Create;
begin
  Ftype := TypeInlineQueryResultCachedVoice;
end;

{ TftInlineQueryResultContact }

constructor TftInlineQueryResultContact.Create;
begin
  Ftype := TypeInlineQueryResultContact;
  FthumbWidth := 0;
  FthumbHeight := 0;
end;

{ TftInlineQueryResultDocument }

constructor TftInlineQueryResultDocument.Create;
begin
  Ftype := TypeInlineQueryResultDocument;
  FthumbWidth := 0;
  FthumbHeight := 0;
end;

{ TftInlineQueryResultGame }

constructor TftInlineQueryResultGame.Create;
begin
  Ftype := TypeInlineQueryResultGame;
end;

{ TftInlineQueryResultGif }

constructor TftInlineQueryResultGif.Create;
begin
  Ftype := TypeInlineQueryResultGif;
  FgifWidth := 0;
  FgifHeight := 0;
end;

{ TftInlineQueryResultLocation }

constructor TftInlineQueryResultLocation.Create;
begin
  Ftype := TypeInlineQueryResultLocation;
  FthumbWidth := 0;
  FthumbHeight := 0;
end;

{ TftInlineQueryResultMpeg4Gif }

constructor TftInlineQueryResultMpeg4Gif.Create;
begin
  Ftype := TypeInlineQueryResultMpeg4Gif;
  Fmpeg4Width := 0;
  Fmpeg4Height := 0;
end;

{ TftInlineQueryResultPhoto }

constructor TftInlineQueryResultPhoto.Create;
begin
  Ftype := TypeInlineQueryResultPhoto;
  FphotoWidth := 0;
  FphotoHeight := 0;
end;

{ TftInlineQueryResultVenue }

constructor TftInlineQueryResultVenue.Create;
begin
  Ftype := TypeInlineQueryResultVenue;
  FthumbWidth := 0;
  FthumbHeight := 0;
end;

{ TftInlineQueryResultVideo }

constructor TftInlineQueryResultVideo.Create;
begin
  Ftype := TypeInlineQueryResultVideo;
  FvideoWidth := 0;
  FvideoHeight := 0;
  FvideoDuration := 0;
end;

{ TftInlineQueryResultVoice }

constructor TftInlineQueryResultVoice.Create;
begin
  Ftype := TypeInlineQueryResultVoice;
  FvoiceDuration := 0;
end;

end.
