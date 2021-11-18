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
    /// Unique identifier for the chat where the original message was sent — User or GroupChat id.
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
    /// Optional. Limits the number of updates to be retrieved. Values between 1—100 are accepted. Defaults to 100.
    /// </param>
    /// <param name="timeout">
    /// Optional. Timeout in seconds for long polling. Defaults to 0, i.e. usual short polling.
    /// </param>
    /// <param name="allowed_updates">
    /// Optional. List the types of updates you want your bot to receive. For example, specify [“message”, “edited_channel_post”, “callback_query”] to only receive updates of these types. See Update for a complete list of available update types. Specify an empty list to receive all updates regardless of type (default). If not specified, the previous setting will be used.
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
    /// Thumbnail of the file sent. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 90. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>.
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
    /// less than 200 kB in size. A thumbnail‘s width and height should not
    /// exceed 90. Ignored if the file is not uploaded using multipart/form-data.
    /// Thumbnails can’t be reused and can be only uploaded as a new file, so
    /// you can pass “attach://file_attach_name” if the thumbnail was uploaded
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
      ok: Boolean; consterrorMessage: String = ''): Boolean;
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
    /// Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts.     *     * If you'd like to make sure that the Webhook request comes from Telegram, we recommend using a secret path in the URL, e.g. www.example.com/<token>. Since nobody else knows your bot‘s token, you can be pretty sure it’s us.     * You will not be able to receive updates using getUpdates for as long as an outgoing webhook is set up.     * We currently do not support self-signed certificates.     * Ports currently supported for Webhooks: 443, 80, 88, 8443.     *
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

  end;

const
  API_URL = 'https://api.telegram.org/bot%s/%s';

implementation

uses Math;
{ TftAPI }

function TftAPI.answerPreCheckoutQuery(const preCheckoutQueryId: String;
  ok: Boolean; consterrorMessage: String): Boolean;
begin

end;

function TftAPI.answerShippingQuery(shippingQueryId: String; ok: Boolean;
  shippingOptions: TList<TftShippingOption>; errorMessage: String): Boolean;
begin

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
begin

end;

function TftAPI.editMessageMedia(media: TftInputFile;
  chatId, messageId: Integer; caption: String; const inlineMessageId: String;
  replyMarkup: TftReplyBase): TftMessage;
begin

end;

function TftAPI.editMessageReplyMarkup(chatId, messageId: Integer;
  const inlineMessageId: String; replyMarkup: TftReplyBase): TftMessage;
begin

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
begin

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
begin

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
begin

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
  if (replyToMessageId >= 0) then
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

  Result := FftTypeParser.parseJsonAndGetMessage(sendRequest('sendDocument',
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
begin

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

end.
