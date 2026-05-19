/// <summary>
/// fastTelega API
/// Alexander Syrykh
/// </summary>
unit fastTelega.API;

interface

uses
  System.SysUtils, System.Classes, System.JSON, Rest.JSON, Rest.JSON.Types,
  System.Generics.Collections,
  fastTelega.HttpClient, System.Net.Mime, fastTelega.TypeParser,
  fastTelega.AvailableTypes;

type

  TftAPI = class
  private
    FToken: String;
    FHttpClient: TftHTTPClient;
    FftTypeParser: TftTypeParser;
    FUrl: String;
    function sendRequest(const Method: String; args: TObject = nil;
      const MethodType: String = 'GET'): TJSONObject;
  public
    constructor Create(AToken: String; const AhttpClient: TftHTTPClient;
      const AURL: String);
    destructor Destroy; override;
    /// <summary>
    /// A simple method for testing your bot's auth token.
    /// </summary>
    /// <returns>
    /// Basic information about the bot in form of a User object.
    /// </returns>
    function getMe(): TftUser;
    /// <summary>
    /// Use this method to send text messages.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="text">
    /// Text of the message to be sent.
    /// </param>
    /// <param name="disableWebPagePreview">
    /// Optional. Disables link previews for links in this message.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="reply_markup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="parse_mode">
    /// Optional. Set it to "Markdown" or "HTML" if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendMessage(chatId: Integer; const text: String;
      disableWebPagePreview: Boolean = false; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil; const parseMode: String = '';
      disableNotification: Boolean = false): TftMessage; overload;
    /// <summary>
    /// Use this method to send text messages.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="text">
    /// Text of the message to be sent.
    /// </param>
    /// <param name="disableWebPagePreview">
    /// Optional. Disables link previews for links in this message.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="reply_markup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="parse_mode">
    /// Optional. Set it to "Markdown" or "HTML" if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendMessage(chatId: String; const text: String;
      disableWebPagePreview: Boolean = false; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil; const parseMode: String = '';
      disableNotification: Boolean = false): TftMessage; overload;
    /// <summary>
    /// Use this method to forward messages of any kind.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="fromChatId">
    /// Unique identifier for the chat where the original message was sent � User or GroupChat id.
    /// </param>
    /// <param name="messageId">
    /// Unique message identifier.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function forwardMessage(chatId: Integer; fromChatId: Integer;
      messageId: Integer; disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to receive incoming updates using long polling.
    /// This method will not work if an outgoing webhook is set up.
    /// In order to avoid getting duplicate updates, recalculate offset after each server response.
    /// </summary>
    /// <param name="offset">
    /// Optional. Identifier of the first update to be returned. Must be greater by one than the highest among the identifiers of previously received updates. By default, updates starting with the earliest unconfirmed update are returned. An update is considered confirmed as soon as getUpdates is called with an offset higher than its update_id.
    /// </param>
    /// <param name="limit">
    /// Optional. Limits the number of updates to be retrieved. Values between 1�100 are accepted. Defaults to 100.
    /// </param>
    /// <param name="timeout">
    /// Optional. Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling.
    /// </param>
    /// <param name="allowed_updates">
    /// Optional. List the types of updates you want your bot to receive. For example, specify [�message�, �edited_channel_post�, �callback_query�] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.
    /// </param>
    /// <returns>
    /// An Array of Update objects
    /// </returns>
    function getUpdates(offset: Integer = 0; limit: Integer = 100;
      timeout: Integer = 0; const allowedUpdates: TObject = nil): TftUpdateList;
    /// <summary>
    /// Use this method to remove webhook integration if you decide to switch back to getUpdates.
    /// Requires no parameters.
    /// </summary>
    /// <returns>
    /// Returns True on success.
    /// </returns>
    function deleteWebhook(): Boolean;

    /// <summary>
    /// Use this method to send photos.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="photo">
    /// Photo to send.
    /// </param>
    /// <param name="caption">
    /// Optional. Photo caption.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="parseMode">
    /// Optional. Set it to "Markdown" or "HTML" if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendPhoto(chatId: Integer; photo: TftInputFile = nil;
      const caption: string = ''; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil; const parseMode: String = '';
      disableNotification: Boolean = false): TftMessage;
    /// <summary>
    /// Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .ogg file encoded with OPUS (other formats may be sent as Document).
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="audio">
    /// Audio to send.
    /// </param>
    /// <param name="caption">
    /// Audio caption, 0-200 characters
    /// </param>
    /// <param name="duration">
    /// Duration of sent audio in seconds.
    /// </param>
    /// <param name="performer">
    /// Performer
    /// </param>
    /// <param name="title">
    /// Track name
    /// </param>
    /// <param name="thumb">
    /// Thumbnail of the file sent. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail�s width and height should not exceed 90. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can�t be reused and can be only uploaded as a new file, so you can pass �attach://<file_attach_name>� if the thumbnail was uploaded using multipart/form-data under <file_attach_name>.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="parseMode">
    /// Optional. Set it to "Markdown" or "HTML" if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendAudio(chatId: Integer; audio: TftInputFile = nil;
      const caption: string = ''; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil; const parseMode: String = '';
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send general files.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="document">
    /// Document to send.
    /// </param>
    /// <param name="thumb">
    /// Thumbnail of the file sent.
    /// The thumbnail should be in JPEG format and
    /// less than 200 kB in size. A thumbnail�s width and height should not
    /// exceed 90. Ignored if the file is not uploaded using multipart/form-data.
    /// Thumbnails can�t be reused and can be only uploaded as a new file, so
    /// you can pass �attach://file_attach_name� if the thumbnail was uploaded
    /// using multipart/form-data under file_attach_name.
    /// </param>
    /// <param name="caption">
    /// Document caption (may also be used when resending documents by file_id), 0-200 characters
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. Additional interface options. An object for a custom reply
    /// keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="parseMode">
    /// Optional. Set it to "Markdown" or "HTML" if you want Telegram apps
    /// to show bold, italic, fixed-width text or inline URLs in your bot's
    /// message.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendDocument(chatId: Integer; document: TftInputFile = nil;
      thumb: TftInputFile = nil; const caption: String = '';
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      const parseMode: String = ''; disableNotification: Boolean = false)
      : TftMessage;

    /// <summary>
    /// Use this method to send invoices.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target private chat.
    /// </param>
    /// <param name="title">
    /// Product name, 1-32 characters.
    /// </param>
    /// <param name="description">
    /// Product description, 1-255 characters.
    /// </param>
    /// <param name="payload">
    /// Bot-defined invoice payload, 1-128 bytes. This will not be displayed to the user, use for your internal processes.
    /// </param>
    /// <param name="providerToken">
    /// Payments provider token, obtained via Botfather.
    /// </param>
    /// <param name="startParameter">
    /// Unique deep-linking parameter that can be used to generate this invoice when used as a start parameter.
    /// </param>
    /// <param name="currency">
    /// Three-letter ISO 4217 currency code.
    /// </param>
    /// <param name="prices">
    /// Price breakdown, a list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
    /// </param>
    /// <param name="providerData">
    /// Optional. JSON-encoded data about the invoice, which will be shared with the payment provider. A detailed description of required fields should be provided by the payment provider.
    /// </param>
    /// <param name="photoUrl">
    /// Optional. URL of the product photo for the invoice. Can be a photo of the goods or a marketing image for a service. People like it better when they see what they are paying for.
    /// </param>
    /// <param name="photoSize">
    /// Optional. Photo size
    /// </param>
    /// <param name="photoWidth">
    /// Optional. Photo width
    /// </param>
    /// <param name="photoHeight">
    /// Optional. Photo height
    /// </param>
    /// <param name="needName">
    /// Optional. Pass True, if you require the user's full name to complete the order.
    /// </param>
    /// <param name="needPhoneNumber">
    /// Optional. Pass True, if you require the user's phone number to complete the order.
    /// </param>
    /// <param name="needEmail">
    /// Optional. Pass True, if you require the user's email address to complete the order.
    /// </param>
    /// <param name="needShippingAddress">
    /// Optional. Pass True, if you require the user's shipping address to complete the order.
    /// </param>
    /// <param name="sendPhoneNumberToProvider">
    /// Optional. Pass True, if user's phone number should be sent to provider.
    /// </param>
    /// <param name="sendEmailToProvider">
    /// Optional. Pass True, if user's email address should be sent to provider
    /// </param>
    /// <param name="isFlexible">
    /// Optional. Pass True, if the final price depends on the shipping method.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. A JSON-serialized object for an inline keyboard. If empty, one 'Pay total price' button will be shown. If not empty, the first button must be a Pay button.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silently. Users will receive a notification with no sound.
    /// </param>
    /// <returns>
    /// On success, the sent Message is returned.
    /// </returns>
    function sendInvoice(chatId: Integer; const title: String;
      const description: String; const payload: String;
      const providerToken: String; const startParameter: String;
      const currency: String; const prices: String;
      const providerData: String = ''; const photoUrl: String = '';
      photoSize: Integer = 0; photoWidth: Integer = 0; photoHeight: Integer = 0;
      needName: Boolean = false; needPhoneNumber: Boolean = false;
      needEmail: Boolean = false; needShippingAddress: Boolean = false;
      sendPhoneNumberToProvider: Boolean = false;
      sendEmailToProvider: Boolean = false; isFlexible: Boolean = false;
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;
    /// <summary>
    /// Use this method to reply to shipping queries.
    /// If you sent an invoice requesting a shipping address and the parameter isFlexible was specified, the Bot API will send an Update with a shipping_query field to the bot.
    /// </summary>
    /// <param name="shippingQueryId">
    /// Unique identifier for the query to be answered.
    /// </param>
    /// <param name="ok">
    /// Specify True if delivery to the specified address is possible and False if there are any problems (for example, if delivery to the specified address is not possible)
    /// </param>
    /// <param name="shippingOptions">
    /// Optional. Required if ok is True. A JSON-serialized array of available shipping options.
    /// </param>
    /// <param name="errorMessage">
    /// Optional. Required if ok is False. Error message in human readable form that explains why it is impossible to complete the order (e.g. "Sorry, delivery to your desired address is unavailable'). Telegram will display this message to the user.
    /// </param>
    /// <returns>
    /// On success, True is returned.
    /// </returns>
    function answerShippingQuery(shippingQueryId: String; ok: Boolean;
      shippingOptions: TList < TftShippingOption >= nil;
      errorMessage: String = ''): Boolean;
    /// <summary>
    /// Use this method to respond to such pre-checkout queries.
    /// Once the user has confirmed their payment and shipping details, the Bot API sends the final confirmation in the form of an Update with the field preCheckoutQuery.
    /// Note: The Bot API must receive an answer within 10 seconds after the pre-checkout query was sent.
    /// </summary>
    /// <param name="preCheckoutQueryId">
    /// Unique identifier for the query to be answered
    /// </param>
    /// <param name="ok">
    /// Specify True if everything is alright (goods are available, etc.) and the bot is ready to proceed with the order. Use False if there are any problems.
    /// </param>
    /// <param name="errorMessage">
    /// Required if ok is False. Error message in human readable form that explains the reason for failure to proceed with the checkout (e.g. "Sorry, somebody just bought the last of our amazing black T-shirts while you were busy filling out your payment details. Please choose a different color or garment!"). Telegram will display this message to the user.
    /// </param>
    /// <returns>
    /// On success, True is returned.
    /// </returns>
    function answerPreCheckoutQuery(const preCheckoutQueryId: String;
      ok: Boolean; const errorMessage: String = ''): Boolean;
    /// <summary>
    /// Use this method to send .webp stickers.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat.
    /// </param>
    /// <param name="sticker">
    /// Sticker to send.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendSticker(chatId: Integer; sticker: TftInputFile;
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;
    /// <summary>
    /// Use this method to get a sticker set.
    /// </summary>
    /// <param name="chatId">
    /// Name of the sticker set.
    /// </param>
    /// <returns>
    /// On success, a StickerSet object is returned.
    /// </returns>
    function getStickerSet(const name: string): TftStickerSet;
    /// <summary>
    /// Use this method to edit text and game messages sent by the bot or via the bot (for inline bots)
    /// </summary>
    /// <param name="text">
    /// New text of the message
    /// </param>
    /// <param name="chatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="messageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="inlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="parseMode">
    /// Optional	Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.
    /// </param>
    /// <param name="disableWebPagePreview">
    /// Optional	Disables link previews for links in this message
    /// </param>
    /// <param name="replyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// Message object on success, otherwise nullptr
    /// </returns>
    function editMessageText(const text: String; chatId: Integer = 0;
      messageId: Integer = 0; const inlineMessageId: String = '';
      const parseMode: String = ''; disableWebPagePreview: Boolean = false;
      replyMarkup: TftReplyBase = nil): TftMessage;
    /// <summary>
    /// Use this method to edit captions of messages sent by the bot or via the bot (for inline bots).
    /// </summary>
    /// <param name="chatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="messageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="caption">
    /// Optional New caption of the message
    /// </param>
    /// <param name="inlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="replyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// Message object on success, otherwise nullptr
    /// </returns>
    function editMessageCaption(chatId: Integer; messageId: Integer;
      caption: String; const inlineMessageId: String;
      replyMarkup: TftReplyBase = nil): TftMessage;
    /// <summary>
    /// Use this method to edit audio, document, photo, or video messages.
    /// If a message is a part of a message album, then it can be edited only to a photo or a video.
    /// Otherwise, message type can be changed arbitrarily. When inline message is edited, new file can't be uploaded.
    /// Use previously uploaded file via its file_id or specify a URL.
    /// </summary>
    /// <param name="media">
    /// A JSON-serialized object for a new media content of the message.
    /// </param>
    /// <param name="chatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="messageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="inlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="replyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// On success, if the edited message was sent by the bot, the edited Message is returned, otherwise nullptr is returned.
    /// </returns>
    function editMessageReplyMarkup(chatId: Integer; messageId: Integer;
      const inlineMessageId: String; replyMarkup: TftReplyBase = nil)
      : TftMessage;
    /// <summary>
    /// Use this method to edit only the reply markup of messages sent by the bot or via the bot (for inline bots).
    /// </summary>
    /// <param name="chatId">
    /// Optional	Required if inline_message_id is not specified. Unique identifier for the target chat of the target channel.
    /// </param>
    /// <param name="messageId">
    /// Optional	Required if inline_message_id is not specified. Identifier of the sent message
    /// </param>
    /// <param name="inlineMessageId">
    /// Optional	Required if chat_id and message_id are not specified. Identifier of the inline message
    /// </param>
    /// <param name="replyMarkup">
    /// Optional	A JSON-serialized object for an inline keyboard.
    /// </param>
    /// <returns>
    /// Message object on success, otherwise nullptr
    /// </returns>
    function editMessageMedia(media: TftInputFile; chatId: Integer;
      messageId: Integer; caption: String; const inlineMessageId: String;
      replyMarkup: TftReplyBase = nil): TftMessage;
    /// <summary>
    /// Use this method to delete messages sent by bot (or by other users if bot is admin).
    /// </summary>
    /// <param name="chatId	Unique">
    /// identifier for the target chat or username of the target channel.
    /// </param>
    /// <param name="messageId	Unique">
    /// identifier for the target message.
    /// </param>
    procedure deleteMessage(chatId: Integer; messageId: Integer);
    /// <summary>
    /// Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts.     *     * If you'd like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. www.example.com/<token>. Since nobody else knows your bot�s token, you can be pretty sure it�s us.     * You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.     * We currently do not support self-signed certificates.     * Ports currently supported for Webhooks: 443, 80, 88, 8443.     *
    /// </summary>
    /// <param name="url">
    /// Optional. HTTPS url to send updates to. Use an empty string to remove webhook integration.
    /// </param>
    procedure setWebhook(const url: String = '';
      const certificate: TftInputFile = nil; maxConnection: Integer = 40;
      const allowedUpdates: TObject = nil);
    /// <summary>
    /// Downloads file from Telegram and saves it in memory.
    /// </summary>
    /// <param name="filePath">
    /// Telegram file path.
    /// </param>
    /// <param name="args">
    /// Additional api parameters.
    /// </param>
    /// <returns>
    /// File contents in a string.
    /// </returns>
    function downloadFile(const filePath: String;
      const args: TStringList): String;
    /// <summary>
    /// Use this method to send a poll.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat or username of the target channel.
    /// </param>
    /// <param name="question">
    /// Poll question, 1-255 characters.
    /// </param>
    /// <param name="options">
    /// List of answer options, 2-10 strings 1-100 characters each.
    /// </param>
    /// <param name="disableNotification">
    /// Optional. Sends the message silenty.
    /// </param>
    /// <param name="replyToMessageId">
    /// Optional. If the message is a reply, ID of the original message.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. Additional interface options. An object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
    /// </param>
    /// <returns>
    /// On success, the sent message is returned.
    /// </returns>
    function sendPoll(chatId: Integer; const question: string;
      const options: TObject; disableNotification: Boolean = false;
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil)
      : TftMessage;

    /// <summary>
    /// Use this method to stop a poll which was sent by the bot.
    /// </summary>
    /// <param name="chatId">
    /// Unique identifier for the target chat or username of the target channel.
    /// </param>
    /// <param name="messageId">
    /// Identifier of the original message with the poll.
    /// </param>
    /// <param name="replyMarkup">
    /// Optional. A JSON-serialized object for a new message inline keyboard.
    /// </param>
    /// <returns>
    /// On success, the stopped Poll with the final results is returned.
    /// </returns>
    function stopPoll(chatId: Integer; messageId: Integer;
      replyMarkup: TftInlineKeyboardMarkup = nil): TftPoll;

    function setMyCommands(const commands: TList): Boolean;
    function getMyCommands(): TArray<TftBotCommand>;

    // --- Multimedia moderna ---

    /// <summary>
    /// Use this method to send video files.
    /// </summary>
    function sendVideo(chatId: Integer; video: TftInputFile = nil;
      duration: Integer = 0; width: Integer = 0; height: Integer = 0;
      thumb: TftInputFile = nil; const caption: String = '';
      const parseMode: String = ''; supportsStreaming: Boolean = false;
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send animation files (GIF or H.264/MPEG-4 AVC without sound).
    /// </summary>
    function sendAnimation(chatId: Integer; animation: TftInputFile = nil;
      duration: Integer = 0; width: Integer = 0; height: Integer = 0;
      thumb: TftInputFile = nil; const caption: String = '';
      const parseMode: String = ''; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send audio files as voice messages (.ogg with OPUS).
    /// </summary>
    function sendVoice(chatId: Integer; voice: TftInputFile = nil;
      const caption: String = ''; const parseMode: String = '';
      duration: Integer = 0; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send video messages (rounded square, up to 1 min).
    /// </summary>
    function sendVideoNote(chatId: Integer; videoNote: TftInputFile = nil;
      duration: Integer = 0; length: Integer = 0; thumb: TftInputFile = nil;
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send point on the map.
    /// </summary>
    function sendLocation(chatId: Integer; latitude: Double; longitude: Double;
      horizontalAccuracy: Double = 0; livePeriod: Integer = 0;
      heading: Integer = 0; proximityAlertRadius: Integer = 0;
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send phone contacts.
    /// </summary>
    function sendContact(chatId: Integer; const phoneNumber: String;
      const firstName: String; const lastName: String = '';
      const vcard: String = ''; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method to send an animated emoji that will display a random value.
    /// </summary>
    function sendDice(chatId: Integer; const emoji: String = '🎲';
      replyToMessageId: Integer = 0; replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): TftMessage;

    /// <summary>
    /// Use this method when you need to tell the user that something is happening on the bot's side.
    /// Action: typing, upload_photo, record_video, upload_video, record_voice,
    ///         upload_voice, upload_document, choose_sticker, find_location,
    ///         record_video_note, upload_video_note
    /// </summary>
    function sendChatAction(chatId: Integer;
      const action: String): Boolean;

    /// <summary>
    /// Use this method to copy messages of any kind.
    /// Returns the MessageId of the sent message on success.
    /// </summary>
    function copyMessage(chatId: Integer; fromChatId: Integer;
      messageId: Integer; const caption: String = '';
      const parseMode: String = ''; replyToMessageId: Integer = 0;
      replyMarkup: TftReplyBase = nil;
      disableNotification: Boolean = false): Integer;

    /// <summary>
    /// Use this method to get a list of profile pictures for a user.
    /// </summary>
    function getUserProfilePhotos(userId: Integer; offset: Integer = 0;
      limit: Integer = 100): TftUserProfilePhotos;

    /// <summary>
    /// Use this method to get basic info about a file and prepare it for downloading.
    /// </summary>
    function getFile(const fileId: String): TftDocument;

    /// <summary>
    /// Use this method to send answers to an inline query.
    /// results must be a JSON-serialized array of InlineQueryResult objects.
    /// </summary>
    function answerInlineQuery(const inlineQueryId: String;
      const results: String; cacheTime: Integer = 300;
      isPersonal: Boolean = false; const nextOffset: String = '';
      const switchPmText: String = '';
      const switchPmParameter: String = ''): Boolean;

    // --- Chat administration ---

    /// <summary>
    /// Use this method to get up-to-date information about the chat.
    /// </summary>
    function getChat(chatId: Integer): TftChat; overload;
    function getChat(const chatId: String): TftChat; overload;

    /// <summary>
    /// Use this method to get the number of members in a chat.
    /// </summary>
    function getChatMemberCount(chatId: Integer): Integer;

    /// <summary>
    /// Use this method to get information about a member of a chat.
    /// </summary>
    function getChatMember(chatId: Integer; userId: Integer): TftChatMember;

    /// <summary>
    /// Use this method to ban a user in a group, a supergroup or a channel.
    /// </summary>
    function banChatMember(chatId: Integer; userId: Integer;
      untilDate: Integer = 0; revokeMessages: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to unban a previously banned user in a supergroup or channel.
    /// </summary>
    function unbanChatMember(chatId: Integer; userId: Integer;
      onlyIfBanned: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to restrict a user in a supergroup.
    /// </summary>
    function restrictChatMember(chatId: Integer; userId: Integer;
      permissions: TftChatPermissions; untilDate: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to promote or demote a user in a supergroup or a channel.
    /// </summary>
    function promoteChatMember(chatId: Integer; userId: Integer;
      isAnonymous: Boolean = false; canManageChat: Boolean = false;
      canPostMessages: Boolean = false; canEditMessages: Boolean = false;
      canDeleteMessages: Boolean = false; canManageVideoChats: Boolean = false;
      canRestrictMembers: Boolean = false; canPromoteMembers: Boolean = false;
      canChangeInfo: Boolean = false; canInviteUsers: Boolean = false;
      canPinMessages: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to set default chat permissions for all members.
    /// </summary>
    function setChatPermissions(chatId: Integer;
      permissions: TftChatPermissions): Boolean;

    /// <summary>
    /// Use this method to generate a new primary invite link for a chat.
    /// </summary>
    function exportChatInviteLink(chatId: Integer): String;

    /// <summary>
    /// Use this method to change the title of a chat.
    /// </summary>
    function setChatTitle(chatId: Integer; const title: String): Boolean;

    /// <summary>
    /// Use this method to change the description of a group, supergroup or channel.
    /// </summary>
    function setChatDescription(chatId: Integer;
      const description: String): Boolean;

    /// <summary>
    /// Use this method to add a message to the list of pinned messages in a chat.
    /// </summary>
    function pinChatMessage(chatId: Integer; messageId: Integer;
      disableNotification: Boolean = false): Boolean;

    /// <summary>
    /// Use this method to remove a message from the list of pinned messages in a chat.
    /// </summary>
    function unpinChatMessage(chatId: Integer; messageId: Integer = 0): Boolean;

    /// <summary>
    /// Use this method to clear the list of pinned messages in a chat.
    /// </summary>
    function unpinAllChatMessages(chatId: Integer): Boolean;

    /// <summary>
    /// Use this method for your bot to leave a group, supergroup or channel.
    /// </summary>
    function leaveChat(chatId: Integer): Boolean;

    /// <summary>
    /// Use this method to send answers to callback queries sent from inline keyboards.
    /// </summary>
    function answerCallbackQuery(const callbackQueryId: String;
      const text: String = ''; showAlert: Boolean = false;
      const url: String = ''; cacheTime: Integer = 0): Boolean;

  end;

const
  API_URL = 'https://api.telegram.org/bot%s/%s';

implementation

uses Math;
{ TftAPI }

function TftAPI.answerPreCheckoutQuery(const preCheckoutQueryId: String;
  ok: Boolean; const errorMessage: String): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('pre_checkout_query_id', preCheckoutQueryId);
  args.AddPair('ok', LowerCase(BoolToStr(ok, True)));

  if (not ok) and (errorMessage <> '') then
    args.AddPair('error_message', errorMessage);

  Result := sendRequest('answerPreCheckoutQuery', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.answerShippingQuery(shippingQueryId: String; ok: Boolean;
  shippingOptions: TList<TftShippingOption>; errorMessage: String): Boolean;
var
  args: TStringList;
  optionsJson: String;
  i: Integer;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('shipping_query_id', shippingQueryId);
  args.AddPair('ok', LowerCase(BoolToStr(ok, True)));

  if ok and (shippingOptions <> nil) and (shippingOptions.Count > 0) then
  begin
    optionsJson := '[';
    for i := 0 to shippingOptions.Count - 1 do
    begin
      optionsJson := optionsJson +
        FftTypeParser.parseShippingOption(shippingOptions[i]);
      if i < shippingOptions.Count - 1 then
        optionsJson := optionsJson + ',';
    end;
    optionsJson := optionsJson + ']';
    args.AddPair('shipping_options', optionsJson);
  end;

  if (not ok) and (errorMessage <> '') then
    args.AddPair('error_message', errorMessage);

  Result := sendRequest('answerShippingQuery', args, 'POST')
    .GetValue('result') <> nil;
end;

constructor TftAPI.Create(AToken: String; const AhttpClient: TftHTTPClient;
  const AURL: String);
begin
  FToken := AToken;
  FHttpClient := AhttpClient;
  FftTypeParser := TftTypeParser.Create;
  FUrl := AURL;
end;

procedure TftAPI.deleteMessage(chatId, messageId: Integer);
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('message_id', IntToStr(messageId));
  sendRequest('deleteMessage', args, 'POST');
end;

function TftAPI.deleteWebhook: Boolean;
begin
  Result := Boolean(sendRequest('deleteWebhook').GetValue('result'));
end;

destructor TftAPI.Destroy;
begin
  FreeAndNil(FHttpClient);
  FreeAndNil(FftTypeParser);
  inherited;
end;

function TftAPI.editMessageCaption(chatId, messageId: Integer; caption: String;
  const inlineMessageId: String; replyMarkup: TftReplyBase): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  if chatId <> 0 then
    args.AddPair('chat_id', IntToStr(chatId));
  if messageId <> 0 then
    args.AddPair('message_id', IntToStr(messageId));
  if inlineMessageId <> '' then
    args.AddPair('inline_message_id', inlineMessageId);
  if caption <> '' then
    args.AddPair('caption', caption);
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  Result := FftTypeParser.parseJsonAndGetMessage
    (sendRequest('editMessageCaption', args, 'POST'));
end;

function TftAPI.editMessageMedia(media: TftInputFile;
  chatId, messageId: Integer; caption: String; const inlineMessageId: String;
  replyMarkup: TftReplyBase): TftMessage;
var
  args: TMultipartFormData;
  mediaJson: String;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  args := TMultipartFormData.Create;

  if chatId <> 0 then
    args.AddField('chat_id', IntToStr(chatId));
  if messageId <> 0 then
    args.AddField('message_id', IntToStr(messageId));
  if inlineMessageId <> '' then
    args.AddField('inline_message_id', inlineMessageId);

  if media <> nil then
  begin
    args.AddFile('media_file', media.filePath);
    mediaJson := '{"type":"document","media":"attach://media_file"';
    if caption <> '' then
      mediaJson := mediaJson + ',"caption":"' + caption + '"';
    mediaJson := mediaJson + '}';
    args.AddField('media', mediaJson);
  end;

  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  Result := FftTypeParser.parseJsonAndGetMessage
    (sendRequest('editMessageMedia', args, 'POST'));
end;

function TftAPI.editMessageReplyMarkup(chatId, messageId: Integer;
  const inlineMessageId: String; replyMarkup: TftReplyBase): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  if chatId <> 0 then
    args.AddPair('chat_id', IntToStr(chatId));
  if messageId <> 0 then
    args.AddPair('message_id', IntToStr(messageId));
  if inlineMessageId <> '' then
    args.AddPair('inline_message_id', inlineMessageId);
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  Result := FftTypeParser.parseJsonAndGetMessage
    (sendRequest('editMessageReplyMarkup', args, 'POST'));
end;

function TftAPI.editMessageText(const text: String; chatId, messageId: Integer;
  const inlineMessageId, parseMode: String; disableWebPagePreview: Boolean;
  replyMarkup: TftReplyBase): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('message_id', IntToStr(messageId));
  args.AddPair('inline_message_id', inlineMessageId);
  args.AddPair('text', text);
  args.AddPair('parse_mode', parseMode);
  if (disableWebPagePreview) then
    args.AddPair('disableWebPagePreview',
      LowerCase(BoolToStr(disableWebPagePreview, True)));
  if (replyMarkup <> nil) then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('editMessageText',
    args, 'POST'));

end;

function TftAPI.forwardMessage(chatId, fromChatId, messageId: Integer;
  disableNotification: Boolean): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('from_chat_id', IntToStr(fromChatId));
  args.AddPair('message_id', IntToStr(messageId));
  if (disableNotification) then
    args.AddPair('disable_notification',
      LowerCase(BoolToStr(disableNotification, True)));
  Result := FftTypeParser.parseJsonAndGetMessage
    (sendRequest('forwardMessage', args));
end;

function TftAPI.getMe: TftUser;
begin
  Result := FftTypeParser.parseJsonAndGetUser(sendRequest('getMe'));
end;

function parseFunJSONArrayTftBotCommand(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TJSON.JsonToObject<TftBotCommand>(JSONArray.Items[Index].ToJSON);
end;

function TftAPI.getMyCommands: TArray<TftBotCommand>;
begin
  Result := TArray<TftBotCommand>(FftTypeParser.parseJsonAndGetList
    (parseFunJSONArrayTftBotCommand, sendRequest('getMyCommands')));
end;

function TftAPI.getStickerSet(const name: String): TftStickerSet;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('name', name);
  Result := FftTypeParser.parseJsonAndGetStickerSet(sendRequest('getStickerSet',
    args));
end;

function parseFunJSONArrayTftUpdate(JSONArray: TJSONArray;
  Index: Integer): TObject;
begin
  Result := TJSON.JsonToObject<TftUpdate>(JSONArray.Items[Index].ToJSON);
end;

function TftAPI.getUpdates(offset, limit, timeout: Integer;
  const allowedUpdates: TObject): TftUpdateList;
var
  args: TStringList;
  allowedUpdatesJson: String;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  if (offset >= -1) then
    args.AddPair('offset', IntToStr(offset));
  limit := max(1, min(100, limit));
  args.AddPair('limit', IntToStr(limit));
  if (timeout >= 0) then
    args.AddPair('timeout', IntToStr(timeout));
  if (allowedUpdates <> nil) then
  begin
    allowedUpdatesJson := FftTypeParser.parseStrings(TStrings(allowedUpdates));
    args.AddPair('allowed_updates', allowedUpdatesJson);
  end;
  if (offset <= 0) then
    Result := TftUpdateList(FftTypeParser.parseJsonAndGetList
      (parseFunJSONArrayTftUpdate, sendRequest('getUpdates', args)))
  else
    Result := TftUpdateList(FftTypeParser.parseJsonAndGetList
      (parseFunJSONArrayTftUpdate, sendRequest('getUpdates', args, 'POST')));
end;

function TftAPI.sendAudio(chatId: Integer; audio: TftInputFile;
  const caption: string; replyToMessageId: Integer; replyMarkup: TftReplyBase;
  const parseMode: String; disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if audio <> nil then
    args.AddFile('audio', audio.filePath);

  if caption <> '' then
    args.AddField('caption', caption);

  if replyToMessageId >= 0 then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));

  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  if parseMode <> '' then
    args.AddField('parse_mode', parseMode);

  if disableNotification then
    args.AddField('disable_notification', BoolToStr(disableNotification, True));

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendAudio',
    args, 'POST'));
end;

function TftAPI.sendDocument(chatId: Integer; document, thumb: TftInputFile;
  const caption: String; replyToMessageId: Integer; replyMarkup: TftReplyBase;
  const parseMode: String; disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if document <> nil then
    args.AddFile('document', document.filePath);
  if thumb <> nil then
    args.AddFile('thumb', thumb.filePath);

  if (caption <> '') then
    args.AddField('caption', caption);

  if (replyToMessageId >= 0) then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));

  if (replyMarkup <> nil) then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  if (parseMode <> '') then
    args.AddField('parse_mode', parseMode);

  if (disableNotification) then
    args.AddField('disable_notification', BoolToStr(disableNotification, True));

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendDocument',
    args, 'POST'));
end;

function TftAPI.sendInvoice(chatId: Integer; const title, description, payload,
  providerToken, startParameter, currency, prices, providerData,
  photoUrl: String; photoSize, photoWidth, photoHeight: Integer;
  needName, needPhoneNumber, needEmail, needShippingAddress,
  sendPhoneNumberToProvider, sendEmailToProvider, isFlexible: Boolean;
  replyToMessageId: Integer; replyMarkup: TftReplyBase;
  disableNotification: Boolean): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('title', title);
  args.AddPair('description', description);
  args.AddPair('payload', payload);
  args.AddPair('provider_token', providerToken);
  args.AddPair('start_parameter', startParameter);
  args.AddPair('currency', currency);
  args.AddPair('prices', prices);

  if providerData <> '' then
    args.AddPair('provider_data', providerData);
  if photoUrl <> '' then
    args.AddPair('photo_url', photoUrl);
  if photoSize > 0 then
    args.AddPair('photo_size', IntToStr(photoSize));
  if photoWidth > 0 then
    args.AddPair('photo_width', IntToStr(photoWidth));
  if photoHeight > 0 then
    args.AddPair('photo_height', IntToStr(photoHeight));
  if needName then
    args.AddPair('need_name', 'true');
  if needPhoneNumber then
    args.AddPair('need_phone_number', 'true');
  if needEmail then
    args.AddPair('need_email', 'true');
  if needShippingAddress then
    args.AddPair('need_shipping_address', 'true');
  if sendPhoneNumberToProvider then
    args.AddPair('send_phone_number_to_provider', 'true');
  if sendEmailToProvider then
    args.AddPair('send_email_to_provider', 'true');
  if isFlexible then
    args.AddPair('is_flexible', 'true');
  if replyToMessageId > 0 then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddPair('disable_notification', 'true');

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendInvoice',
    args, 'POST'));
end;

function TftAPI.sendMessage(chatId: String; const text: String;
  disableWebPagePreview: Boolean; replyToMessageId: Integer;
  replyMarkup: TftReplyBase; const parseMode: String;
  disableNotification: Boolean): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  args := TStringList.Create;
  args.AddPair('chat_id', chatId);
  args.AddPair('text', text);
  if (disableWebPagePreview) then
    args.AddPair('disable_web_page_preview',
      BoolToStr(disableWebPagePreview, True));
  if (disableNotification) then
    args.AddPair('disable_notification', BoolToStr(disableNotification, True));
  if (replyToMessageId > 0) then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));

  if (replyMarkup <> nil) then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  if (parseMode <> '') then
    args.AddPair('parse_mode', parseMode);

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendMessage',
    args, 'POST'));
end;

function TftAPI.sendPhoto(chatId: Integer; photo: TftInputFile;
  const caption: string; replyToMessageId: Integer; replyMarkup: TftReplyBase;
  const parseMode: String; disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if photo <> nil then
    args.AddFile('photo', photo.filePath);

  if (caption <> '') then
    args.AddField('caption', caption);

  if (replyToMessageId >= 0) then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));

  if (replyMarkup <> nil) then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  if (parseMode <> '') then
    args.AddField('parse_mode', parseMode);

  if (disableNotification) then
    args.AddField('disable_notification', BoolToStr(disableNotification, True));

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendPhoto',
    args, 'POST'));

end;

function TftAPI.sendPoll(chatId: Integer; const question: string;
  const options: TObject; disableNotification: Boolean;
  replyToMessageId: Integer; replyMarkup: TftReplyBase): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('question', question);

  args.AddPair('options', FftTypeParser.parseStrings(TStrings(options)));
  if (disableNotification) then
    args.AddPair('disable_notification', BoolToStr(disableNotification, True));
  if (replyToMessageId >= 0) then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));

  if (replyMarkup <> nil) then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  Result := FftTypeParser.parseJsonAndGetMessage
    (sendRequest('sendPoll', args, 'POST'));

end;

function TftAPI.sendMessage(chatId: Integer; const text: String;
  disableWebPagePreview: Boolean; replyToMessageId: Integer;
  replyMarkup: TftReplyBase; const parseMode: String;
  disableNotification: Boolean): TftMessage;
begin
  Result := sendMessage(IntToStr(chatId), text, disableWebPagePreview,
    replyToMessageId, replyMarkup, parseMode, disableNotification);
end;

function TftAPI.sendRequest(const Method: String; args: TObject;
  const MethodType: String): TJSONObject;
var
  AURL, ServerResponse: String;
begin
  AURL := FUrl;
  AURL := AURL + '/bot';
  AURL := AURL + FToken;
  AURL := AURL + '/';
  AURL := AURL + Method;

  ServerResponse := FHttpClient.makeRequest(AURL, args, MethodType);
  if not(Pos('<html>', ServerResponse) = 0) then
    raise Exception.Create
      ('fastTelega library have got html page instead of JSON response. Maybe you entered wrong bot token.');
  Result := FftTypeParser.parseJson(ServerResponse);
end;

function TftAPI.sendSticker(chatId: Integer; sticker: TftInputFile;
  replyToMessageId: Integer; replyMarkup: TftReplyBase;
  disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if sticker <> nil then
    args.AddFile('sticker', sticker.filePath);

  if replyToMessageId >= 0 then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));

  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  if disableNotification then
    args.AddField('disable_notification', BoolToStr(disableNotification, True));

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendSticker',
    args, 'POST'));
end;

function TftAPI.setMyCommands(const commands: TList): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  args := TStringList.Create;
  if (commands <> nil) then
    args.AddPair('commands', FftTypeParser.parseList(commands));

  Result := sendRequest('setMyCommands', args, 'POST')
    .GetValue('result') <> nil;
end;

procedure TftAPI.setWebhook(const url: String; const certificate: TftInputFile;
  maxConnection: Integer; const allowedUpdates: TObject);
var
  args: TMultipartFormData;
  allowedUpdatesJson: String;
begin
  FHttpClient.ContentType := 'multipart/form-data';

  args := TMultipartFormData.Create;
  args.AddField('url', url);

  if certificate <> nil then
    args.AddFile('certificate', certificate.filePath);

  if (maxConnection <> 40) then
    args.AddField('max_connections', IntToStr(maxConnection));

  if (allowedUpdates <> nil) then
  begin
    allowedUpdatesJson := FftTypeParser.parseStrings(TStrings(allowedUpdates));
    args.AddField('allowed_updates', allowedUpdatesJson);
  end;
  sendRequest('setWebhook', args, 'POST');
end;

function TftAPI.stopPoll(chatId: Integer; messageId: Integer;
  replyMarkup: TftInlineKeyboardMarkup): TftPoll;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';

  args := TStringList.Create;

  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('message_id', IntToStr(messageId));

  if (replyMarkup <> nil) then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));

  Result := FftTypeParser.parseJsonAndGetPoll(sendRequest('stopPoll',
    args, 'POST'));
end;

function TftAPI.downloadFile(const filePath: String;
  const args: TStringList): String;
var
  AURL: String;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  AURL := FUrl;
  AURL := AURL + '/file/bot';
  AURL := AURL + FToken;
  AURL := AURL + '/';
  AURL := AURL + filePath;

  Result := FHttpClient.makeRequest(AURL, args, 'GET');
end;

// --- Multimedia moderna ---

function TftAPI.sendVideo(chatId: Integer; video: TftInputFile;
  duration, width, height: Integer; thumb: TftInputFile; const caption: String;
  const parseMode: String; supportsStreaming: Boolean;
  replyToMessageId: Integer; replyMarkup: TftReplyBase;
  disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if video <> nil then
    args.AddFile('video', video.filePath);
  if duration > 0 then
    args.AddField('duration', IntToStr(duration));
  if width > 0 then
    args.AddField('width', IntToStr(width));
  if height > 0 then
    args.AddField('height', IntToStr(height));
  if thumb <> nil then
    args.AddFile('thumb', thumb.filePath);
  if caption <> '' then
    args.AddField('caption', caption);
  if parseMode <> '' then
    args.AddField('parse_mode', parseMode);
  if supportsStreaming then
    args.AddField('supports_streaming', 'true');
  if replyToMessageId >= 0 then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddField('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendVideo',
    args, 'POST'));
end;

function TftAPI.sendAnimation(chatId: Integer; animation: TftInputFile;
  duration, width, height: Integer; thumb: TftInputFile; const caption: String;
  const parseMode: String; replyToMessageId: Integer;
  replyMarkup: TftReplyBase; disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if animation <> nil then
    args.AddFile('animation', animation.filePath);
  if duration > 0 then
    args.AddField('duration', IntToStr(duration));
  if width > 0 then
    args.AddField('width', IntToStr(width));
  if height > 0 then
    args.AddField('height', IntToStr(height));
  if thumb <> nil then
    args.AddFile('thumb', thumb.filePath);
  if caption <> '' then
    args.AddField('caption', caption);
  if parseMode <> '' then
    args.AddField('parse_mode', parseMode);
  if replyToMessageId >= 0 then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddField('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendAnimation',
    args, 'POST'));
end;

function TftAPI.sendVoice(chatId: Integer; voice: TftInputFile;
  const caption: String; const parseMode: String; duration: Integer;
  replyToMessageId: Integer; replyMarkup: TftReplyBase;
  disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if voice <> nil then
    args.AddFile('voice', voice.filePath);
  if caption <> '' then
    args.AddField('caption', caption);
  if parseMode <> '' then
    args.AddField('parse_mode', parseMode);
  if duration > 0 then
    args.AddField('duration', IntToStr(duration));
  if replyToMessageId >= 0 then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddField('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendVoice',
    args, 'POST'));
end;

function TftAPI.sendVideoNote(chatId: Integer; videoNote: TftInputFile;
  duration, length: Integer; thumb: TftInputFile; replyToMessageId: Integer;
  replyMarkup: TftReplyBase; disableNotification: Boolean): TftMessage;
var
  args: TMultipartFormData;
begin
  FHttpClient.ContentType := 'multipart/form-data';
  args := TMultipartFormData.Create;
  args.AddField('chat_id', IntToStr(chatId));
  if videoNote <> nil then
    args.AddFile('video_note', videoNote.filePath);
  if duration > 0 then
    args.AddField('duration', IntToStr(duration));
  if length > 0 then
    args.AddField('length', IntToStr(length));
  if thumb <> nil then
    args.AddFile('thumb', thumb.filePath);
  if replyToMessageId >= 0 then
    args.AddField('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddField('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddField('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendVideoNote',
    args, 'POST'));
end;

function TftAPI.sendLocation(chatId: Integer; latitude, longitude: Double;
  horizontalAccuracy: Double; livePeriod, heading,
  proximityAlertRadius, replyToMessageId: Integer; replyMarkup: TftReplyBase;
  disableNotification: Boolean): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('latitude', FloatToStr(latitude));
  args.AddPair('longitude', FloatToStr(longitude));
  if horizontalAccuracy > 0 then
    args.AddPair('horizontal_accuracy', FloatToStr(horizontalAccuracy));
  if livePeriod > 0 then
    args.AddPair('live_period', IntToStr(livePeriod));
  if heading > 0 then
    args.AddPair('heading', IntToStr(heading));
  if proximityAlertRadius > 0 then
    args.AddPair('proximity_alert_radius', IntToStr(proximityAlertRadius));
  if replyToMessageId > 0 then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddPair('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendLocation',
    args, 'POST'));
end;

function TftAPI.sendContact(chatId: Integer; const phoneNumber, firstName,
  lastName, vcard: String; replyToMessageId: Integer;
  replyMarkup: TftReplyBase; disableNotification: Boolean): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('phone_number', phoneNumber);
  args.AddPair('first_name', firstName);
  if lastName <> '' then
    args.AddPair('last_name', lastName);
  if vcard <> '' then
    args.AddPair('vcard', vcard);
  if replyToMessageId > 0 then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddPair('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendContact',
    args, 'POST'));
end;

function TftAPI.sendDice(chatId: Integer; const emoji: String;
  replyToMessageId: Integer; replyMarkup: TftReplyBase;
  disableNotification: Boolean): TftMessage;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  if emoji <> '' then
    args.AddPair('emoji', emoji);
  if replyToMessageId > 0 then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddPair('disable_notification', 'true');
  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendDice',
    args, 'POST'));
end;

function TftAPI.sendChatAction(chatId: Integer; const action: String): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('action', action);
  Result := sendRequest('sendChatAction', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.copyMessage(chatId, fromChatId, messageId: Integer;
  const caption, parseMode: String; replyToMessageId: Integer;
  replyMarkup: TftReplyBase; disableNotification: Boolean): Integer;
var
  args: TStringList;
  jResult: TJSONValue;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('from_chat_id', IntToStr(fromChatId));
  args.AddPair('message_id', IntToStr(messageId));
  if caption <> '' then
    args.AddPair('caption', caption);
  if parseMode <> '' then
    args.AddPair('parse_mode', parseMode);
  if replyToMessageId > 0 then
    args.AddPair('reply_to_message_id', IntToStr(replyToMessageId));
  if replyMarkup <> nil then
    args.AddPair('reply_markup', FftTypeParser.parseReplyBase(replyMarkup));
  if disableNotification then
    args.AddPair('disable_notification', 'true');
  jResult := sendRequest('copyMessage', args, 'POST').GetValue('result');
  if (jResult <> nil) and (jResult is TJSONObject) then
    Result := TJSONObject(jResult).GetValue('message_id').AsType<Integer>
  else
    Result := 0;
end;

function TftAPI.getUserProfilePhotos(userId, offset, limit: Integer)
  : TftUserProfilePhotos;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('user_id', IntToStr(userId));
  if offset > 0 then
    args.AddPair('offset', IntToStr(offset));
  limit := Max(1, Min(100, limit));
  args.AddPair('limit', IntToStr(limit));
  Result := FftTypeParser.parseJsonAndGetUserProfilePhotos
    (sendRequest('getUserProfilePhotos', args));
end;

function TftAPI.getFile(const fileId: String): TftDocument;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('file_id', fileId);
  Result := FftTypeParser.parseJsonAndGetDocument(sendRequest('getFile', args));
end;

function TftAPI.answerInlineQuery(const inlineQueryId, results: String;
  cacheTime: Integer; isPersonal: Boolean; const nextOffset, switchPmText,
  switchPmParameter: String): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('inline_query_id', inlineQueryId);
  args.AddPair('results', results);
  if cacheTime <> 300 then
    args.AddPair('cache_time', IntToStr(cacheTime));
  if isPersonal then
    args.AddPair('is_personal', 'true');
  if nextOffset <> '' then
    args.AddPair('next_offset', nextOffset);
  if switchPmText <> '' then
    args.AddPair('switch_pm_text', switchPmText);
  if switchPmParameter <> '' then
    args.AddPair('switch_pm_parameter', switchPmParameter);
  Result := sendRequest('answerInlineQuery', args, 'POST')
    .GetValue('result') <> nil;
end;

// --- Chat administration ---

function TftAPI.getChat(chatId: Integer): TftChat;
begin
  Result := getChat(IntToStr(chatId));
end;

function TftAPI.getChat(const chatId: String): TftChat;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', chatId);
  Result := FftTypeParser.parseJsonAndGetChat(sendRequest('getChat', args));
end;

function TftAPI.getChatMemberCount(chatId: Integer): Integer;
var
  args: TStringList;
  jResult: TJSONValue;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  jResult := sendRequest('getChatMemberCount', args).GetValue('result');
  if jResult <> nil then
    Result := jResult.AsType<Integer>
  else
    Result := 0;
end;

function TftAPI.getChatMember(chatId: Integer; userId: Integer): TftChatMember;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('user_id', IntToStr(userId));
  Result := FftTypeParser.parseJsonAndGetChatMember
    (sendRequest('getChatMember', args));
end;

function TftAPI.banChatMember(chatId: Integer; userId: Integer;
  untilDate: Integer; revokeMessages: Boolean): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('user_id', IntToStr(userId));
  if untilDate > 0 then
    args.AddPair('until_date', IntToStr(untilDate));
  if revokeMessages then
    args.AddPair('revoke_messages', 'true');
  Result := sendRequest('banChatMember', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.unbanChatMember(chatId: Integer; userId: Integer;
  onlyIfBanned: Boolean): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('user_id', IntToStr(userId));
  if onlyIfBanned then
    args.AddPair('only_if_banned', 'true');
  Result := sendRequest('unbanChatMember', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.restrictChatMember(chatId: Integer; userId: Integer;
  permissions: TftChatPermissions; untilDate: Integer): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('user_id', IntToStr(userId));
  if permissions <> nil then
    args.AddPair('permissions',
      FftTypeParser.parseChatPermissions(permissions));
  if untilDate > 0 then
    args.AddPair('until_date', IntToStr(untilDate));
  Result := sendRequest('restrictChatMember', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.promoteChatMember(chatId: Integer; userId: Integer;
  isAnonymous: Boolean; canManageChat: Boolean; canPostMessages: Boolean;
  canEditMessages: Boolean; canDeleteMessages: Boolean;
  canManageVideoChats: Boolean; canRestrictMembers: Boolean;
  canPromoteMembers: Boolean; canChangeInfo: Boolean; canInviteUsers: Boolean;
  canPinMessages: Boolean): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('user_id', IntToStr(userId));
  if isAnonymous then
    args.AddPair('is_anonymous', 'true');
  if canManageChat then
    args.AddPair('can_manage_chat', 'true');
  if canPostMessages then
    args.AddPair('can_post_messages', 'true');
  if canEditMessages then
    args.AddPair('can_edit_messages', 'true');
  if canDeleteMessages then
    args.AddPair('can_delete_messages', 'true');
  if canManageVideoChats then
    args.AddPair('can_manage_video_chats', 'true');
  if canRestrictMembers then
    args.AddPair('can_restrict_members', 'true');
  if canPromoteMembers then
    args.AddPair('can_promote_members', 'true');
  if canChangeInfo then
    args.AddPair('can_change_info', 'true');
  if canInviteUsers then
    args.AddPair('can_invite_users', 'true');
  if canPinMessages then
    args.AddPair('can_pin_messages', 'true');
  Result := sendRequest('promoteChatMember', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.setChatPermissions(chatId: Integer;
  permissions: TftChatPermissions): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  if permissions <> nil then
    args.AddPair('permissions',
      FftTypeParser.parseChatPermissions(permissions));
  Result := sendRequest('setChatPermissions', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.exportChatInviteLink(chatId: Integer): String;
var
  args: TStringList;
  jResult: TJSONValue;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  jResult := sendRequest('exportChatInviteLink', args, 'POST')
    .GetValue('result');
  if jResult <> nil then
    Result := jResult.Value
  else
    Result := '';
end;

function TftAPI.setChatTitle(chatId: Integer; const title: String): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('title', title);
  Result := sendRequest('setChatTitle', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.setChatDescription(chatId: Integer;
  const description: String): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('description', description);
  Result := sendRequest('setChatDescription', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.pinChatMessage(chatId: Integer; messageId: Integer;
  disableNotification: Boolean): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  args.AddPair('message_id', IntToStr(messageId));
  if disableNotification then
    args.AddPair('disable_notification', 'true');
  Result := sendRequest('pinChatMessage', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.unpinChatMessage(chatId: Integer; messageId: Integer): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  if messageId > 0 then
    args.AddPair('message_id', IntToStr(messageId));
  Result := sendRequest('unpinChatMessage', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.unpinAllChatMessages(chatId: Integer): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  Result := sendRequest('unpinAllChatMessages', args, 'POST')
    .GetValue('result') <> nil;
end;

function TftAPI.leaveChat(chatId: Integer): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('chat_id', IntToStr(chatId));
  Result := sendRequest('leaveChat', args, 'POST').GetValue('result') <> nil;
end;

function TftAPI.answerCallbackQuery(const callbackQueryId: String;
  const text: String; showAlert: Boolean; const url: String;
  cacheTime: Integer): Boolean;
var
  args: TStringList;
begin
  FHttpClient.ContentType := 'application/json';
  args := TStringList.Create;
  args.AddPair('callback_query_id', callbackQueryId);
  if text <> '' then
    args.AddPair('text', text);
  if showAlert then
    args.AddPair('show_alert', 'true');
  if url <> '' then
    args.AddPair('url', url);
  if cacheTime > 0 then
    args.AddPair('cache_time', IntToStr(cacheTime));
  Result := sendRequest('answerCallbackQuery', args, 'POST')
    .GetValue('result') <> nil;
end;

end.
