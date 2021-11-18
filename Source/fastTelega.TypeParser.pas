/// <summary>
/// fastTelega TypeParser
/// Alexander Syrykh
/// </summary>
unit fastTelega.TypeParser;

interface

uses
  System.SysUtils, System.Classes, System.JSON, Rest.JSON,
  Rest.JSON.Types,
  System.Generics.Collections,
  fastTelega.AvailableTypes, Variants;

type
  TftParseFunc = function(obj: TObject): String of object;
  TJsonToFtTypeFunc = function(JSONArray: TJSONArray; index: Integer): TObject;

  TftTypeParser = class
  private
    procedure appendToJson(var JSON: String; const varName: String;
      const value: Variant);
    procedure removeLastComma(var input: String);
  public
    constructor Create;
    destructor Destroy; override;
    function parseJson(serverResponse: String): TJSONObject;
    function parseStrings(const obj: TStrings): String;
    function parseList(const obj: TList): String;

    function parseJsonAndGetList(ParseFunc: TJsonToFtTypeFunc;
      JSONObject: TJSONObject): TList;

    function parseChat(const obj: TftChat): String;
    function parseUser(const obj: TftUser): String;
    function parseMessageEntity(const obj: TftMessageEntity): String;
    function parseMessage(const obj: TftMessage): String;
    function parsePhotoSize(const obj: TftPhotoSize): String;
    function parseAudio(const obj: TftAudio): String;
    function parseDocument(const obj: TftDocument): String;
    function parseSticker(const obj: TftSticker): String;
    function parseStickerSet(const obj: TftStickerSet): String;
    function parseMaskPosition(const obj: TftMaskPosition): String;
    function parsePoll(const obj: TftPoll): String;
    function parsePollOption(const obj: TftPollOption): String;
    function parseChatPermissions(const obj: TftChatPermissions): String;
    function parseVideo(const obj: TftVideo): String;
    function parseVoice(const obj: TftVoice): String;
    function parseVideoNote(const obj: TftVideoNote): String;
    function parseGame(const obj: TftGame): String;
    function parseGameHighScore(const obj: TftGameHighScore): String;
    function parseAnimation(const obj: TftAnimation): String;
    function parseContact(const obj: TftContact): String;
    function parseLocation(const obj: TftLocation): String;
    function parseUpdate(const obj: TftUpdate): String;
    function parseUserProfilePhotos(const obj: TftUserProfilePhotos): String;
    function parseInputMedia(const obj: TftInputMedia): String;
    function parseChatMember(const obj: TftChatMember): String;
    function parseChatPhoto(const obj: TftChatPhoto): String;
    function parseResponseParameters(const obj: TftResponseParameters): String;
    function parseInlineQuery(const obj: TftInlineQuery): String;
    function parseInlineQueryResult(const obj: TftInlineQueryResult): String;
    function parseInlineQueryResultArticle
      (const obj: TftInlineQueryResultArticle): String;
    function parseInlineQueryResultAudio(const obj
      : TftInlineQueryResultAudio): String;
    function parseInlineQueryResultCachedAudio
      (const obj: TftInlineQueryResultCachedAudio): String;
    function parseInlineQueryResultCachedDocument
      (const obj: TftInlineQueryResultCachedDocument): String;
    function parseInlineQueryResultCachedGif
      (const obj: TftInlineQueryResultCachedGif): String;
    function parseInlineQueryResultCachedMpeg4Gif
      (const obj: TftInlineQueryResultCachedMpeg4Gif): String;
    function parseInlineQueryResultCachedPhoto
      (const obj: TftInlineQueryResultCachedPhoto): String;
    function parseInlineQueryResultCachedSticker
      (const obj: TftInlineQueryResultCachedSticker): String;
    function parseInlineQueryResultCachedVideo
      (const obj: TftInlineQueryResultCachedVideo): String;
    function parseInlineQueryResultCachedVoice
      (const obj: TftInlineQueryResultCachedVoice): String;
    function parseInlineQueryResultContact
      (const obj: TftInlineQueryResultContact): String;
    function parseInlineQueryResultDocument
      (const obj: TftInlineQueryResultDocument): String;
    function parseInlineQueryResultGame(const obj
      : TftInlineQueryResultGame): String;
    function parseInlineQueryResultGif(const obj
      : TftInlineQueryResultGif): String;
    function parseInlineQueryResultLocation
      (const obj: TftInlineQueryResultLocation): String;
    function parseInlineQueryResultMpeg4Gif
      (const obj: TftInlineQueryResultMpeg4Gif): String;
    function parseInlineQueryResultPhoto(const obj
      : TftInlineQueryResultPhoto): String;
    function parseInlineQueryResultVenue(const obj
      : TftInlineQueryResultVenue): String;
    function parseInlineQueryResultVideo(const obj
      : TftInlineQueryResultVideo): String;
    function parseInlineQueryResultVoice(const obj
      : TftInlineQueryResultVoice): String;
    function parseChosenInlineResult(const obj: TftChosenInlineResult): String;
    function parseCallbackQuery(const obj: TftCallbackQuery): String;
    function parseShippingQuery(const obj: TftShippingQuery): String;
    function parsePreCheckoutQuery(const obj: TftPreCheckoutQuery): String;
    function parseInvoice(const obj: TftInvoice): String;
    function parseLabeledPrice(const obj: TftLabeledPrice): String;
    function parseSuccessfulPayment(const obj: TftSuccessfulPayment): String;
    function parseShippingAddress(const obj: TftShippingAddress): String;
    function parseBotCommand(const obj: TftBotCommand): String;
    function parseOrderInfo(const obj: TftOrderInfo): String;
    function parseShippingOption(const obj: TftShippingOption): String;
    function parseReplyBase(const obj: TftReplyBase): String;
    function parseForceReply(const obj: TftForceReply): String;
    function parseInlineKeyboardButton(const obj
      : TftInlineKeyboardButton): String;
    function parseKeyboardButton(const obj: TftKeyboardButton): String;
    function parseReplyKeyboardRemove(const obj
      : TftReplyKeyboardRemove): String;
    function parseReplyKeyboardMarkup(const obj
      : TftReplyKeyboardMarkup): String;
    function parseInlineKeyboardMarkup(const obj
      : TftInlineKeyboardMarkup): String;
    function parseJsonAndGetWebhookInfo(const data: TJSONObject)
      : TftWebhookInfo;
    function parseWebhookInfo(const obj: TftWebhookInfo): String;
    function parseInputMessageContent(const obj
      : TftInputMessageContent): String;
    function parseInputTextMessageContent
      (const obj: TftInputTextMessageContent): String;
    function parseInputLocationMessageContent
      (const obj: TftInputLocationMessageContent): String;
    function parseInputVenueMessageContent
      (const obj: TftInputVenueMessageContent): String;
    function parseInputContactMessageContent
      (const obj: TftInputContactMessageContent): String;

    /// parseJson functions
    function parseJsonAndGetChat(const data: TJSONObject): TftChat;
    function parseJsonAndGetUser(const data: TJSONObject): TftUser;
    function parseJsonAndGetMessageEntity(const data: TJSONObject)
      : TftMessageEntity;
    function parseJsonAndGetMessage(const data: TJSONObject): TftMessage;
    function parseJsonAndPhotoSize(const data: TJSONObject): TftPhotoSize;
    function parseJsonAndGetAudio(const data: TJSONObject): TftAudio;
    function parseJsonAndGetDocument(const data: TJSONObject): TftDocument;
    function parseJsonAndGetSticker(const data: TJSONObject): TftSticker;
    function parseJsonAndGetStickerSet(const data: TJSONObject): TftStickerSet;
    function parseJsonAndGetMaskPosition(const data: TJSONObject)
      : TftMaskPosition;
    function parseJsonAndGetPoll(const data: TJSONObject): TftPoll;
    function parseJsonAndGetPollOption(const data: TJSONObject): TftPollOption;
    function parseJsonAndGetChatPermissions(const data: TJSONObject)
      : TftChatPermissions;
    function parseJsonAndGetVideo(const data: TJSONObject): TftVideo;
    function parseJsonAndGetVoice(const data: TJSONObject): TftVoice;
    function parseJsonAndGetVideoNote(const data: TJSONObject): TftVideoNote;
    function parseJsonAndGetGame(const data: TJSONObject): TftGame;
    function parseJsonAndGetGameHighScore(const data: TJSONObject)
      : TftGameHighScore;
    function parseJsonAndGetAnimation(const data: TJSONObject): TftAnimation;
    function parseJsonAndGetContact(const data: TJSONObject): TftContact;
    function parseJsonAndGetLocation(const data: TJSONObject): TftLocation;
    function parseJsonAndGetUpdate(const data: TJSONObject): TftUpdate;
    function parseJsonAndGetUserProfilePhotos(const data: TJSONObject)
      : TftUserProfilePhotos;
    function parseJsonAndGetInputMedia(const data: TJSONObject): TftInputMedia;
    function parseJsonAndGetReplyKeyboardMarkup(const data: TJSONObject)
      : TftReplyKeyboardMarkup;
    function parseJsonAndGetKeyboardButton(const data: TJSONObject)
      : TftKeyboardButton;
    function parseJsonAndGetReplyKeyboardRemove(const data: TJSONObject)
      : TftReplyKeyboardRemove;
    function parseJsonAndGetForceReply(const data: TJSONObject): TftForceReply;
    function parseJsonAndGetChatMember(const data: TJSONObject): TftChatMember;
    function parseJsonAndGetChatPhoto(const data: TJSONObject): TftChatPhoto;
    function parseJsonAndGetResponseParameters(const data: TJSONObject)
      : TftResponseParameters;
    function parseJsonAndGetReplyBase(const data: TJSONObject): TftReplyBase;
    function parseJsonAndGetInlineQuery(const data: TJSONObject)
      : TftInlineQuery;
    function parseJsonAndGetInlineQueryResult(const data: TJSONObject)
      : TftInlineQueryResult;
    function parseJsonAndGetInlineQueryResultCachedAudio
      (const data: TJSONObject): TftInlineQueryResultCachedAudio;
    function parseJsonAndGetInlineQueryResultCachedDocument
      (const data: TJSONObject): TftInlineQueryResultCachedDocument;
    function parseJsonAndGetInlineQueryResultCachedGif(const data: TJSONObject)
      : TftInlineQueryResultCachedGif;
    function parseJsonAndGetInlineQueryResultCachedMpeg4Gif
      (const data: TJSONObject): TftInlineQueryResultCachedMpeg4Gif;
    function parseJsonAndGetInlineQueryResultCachedPhoto
      (const data: TJSONObject): TftInlineQueryResultCachedPhoto;
    function parseJsonAndGetInlineQueryResultCachedSticker
      (const data: TJSONObject): TftInlineQueryResultCachedSticker;
    function parseJsonAndGetInlineQueryResultCachedVideo
      (const data: TJSONObject): TftInlineQueryResultCachedVideo;
    function parseJsonAndGetInlineQueryResultCachedVoice
      (const data: TJSONObject): TftInlineQueryResultCachedVoice;
    function parseJsonAndGetInlineQueryResultAudio(const data: TJSONObject)
      : TftInlineQueryResultAudio;
    function parseJsonAndGetInlineQueryResultContact(const data: TJSONObject)
      : TftInlineQueryResultContact;
    function parseJsonAndGetInlineQueryResultGame(const data: TJSONObject)
      : TftInlineQueryResultGame;
    function parseJsonAndGetInlineQueryResultDocument(const data: TJSONObject)
      : TftInlineQueryResultDocument;
    function parseJsonAndGetInlineQueryResultLocation(const data: TJSONObject)
      : TftInlineQueryResultLocation;
    function parseJsonAndGetInlineQueryResultVenue(const data: TJSONObject)
      : TftInlineQueryResultVenue;
    function parseJsonAndGetInlineQueryResultVoice(const data: TJSONObject)
      : TftInlineQueryResultVoice;
    function parseJsonAndGetInlineQueryResultPhoto(const data: TJSONObject)
      : TftInlineQueryResultPhoto;
    function parseJsonAndGetInlineQueryResultGif(const data: TJSONObject)
      : TftInlineQueryResultGif;
    function parseJsonAndGetInlineQueryResultMpeg4Gif(const data: TJSONObject)
      : TftInlineQueryResultMpeg4Gif;
    function parseJsonAndGetInlineQueryResultVideo(const data: TJSONObject)
      : TftInlineQueryResultVideo;
    function parseJsonAndGetChosenInlineResult(const data: TJSONObject)
      : TftChosenInlineResult;
    function parseJsonAndGetCallbackQuery(const data: TJSONObject)
      : TftCallbackQuery;
    function parseJsonAndGetInlineKeyboardMarkup(const data: TJSONObject)
      : TftInlineKeyboardMarkup;
    function parseJsonAndGetInlineKeyboardButton(const data: TJSONObject)
      : TftInlineKeyboardButton;
    function parseJsonAndGetInputMessageContent(const data: TJSONObject)
      : TftInputMessageContent;
    function parseJsonAndGetInputTextMessageContent(const data: TJSONObject)
      : TftInputTextMessageContent;
    function parseJsonAndGetInputLocationMessageContent(const data: TJSONObject)
      : TftInputLocationMessageContent;
    function parseJsonAndGetInputVenueMessageContent(const data: TJSONObject)
      : TftInputVenueMessageContent;
    function parseJsonAndGetInputContactMessageContent(const data: TJSONObject)
      : TftInputContactMessageContent;
    function parseJsonAndGetInvoice(const data: TJSONObject): TftInvoice;
    function parseJsonAndGetLabeledPrice(const data: TJSONObject)
      : TftLabeledPrice;
    function parseJsonAndGetBotCommand(const data: TJSONObject): TftBotCommand;
    function parseJsonAndGetOrderInfo(const data: TJSONObject): TftOrderInfo;
    function parseJsonAndGetPreCheckoutQuery(const data: TJSONObject)
      : TftPreCheckoutQuery;
    function parseJsonAndGetShippingAddress(const data: TJSONObject)
      : TftShippingAddress;
    function parseJsonAndGetShippingOption(const data: TJSONObject)
      : TftShippingOption;
    function parseJsonAndGetShippingQuery(const data: TJSONObject)
      : TftShippingQuery;
    function parseJsonAndGetSuccessfulPayment(const data: TJSONObject)
      : TftSuccessfulPayment;
  end;

implementation

{ TftTypeParser }

procedure TftTypeParser.appendToJson(var JSON: String; const varName: String;
  const value: Variant);
var
  typeString: string;
  basicType: Integer;
begin
  if (VarToStr(value) = '') then
    Exit;
  basicType := VarType(value) and VarTypeMask;
  JSON := JSON + '"';
  JSON := JSON + varName;
  JSON := JSON + '":';
  case basicType of
    varBoolean:
      JSON := JSON + LowerCase(VarToStr(value));
    varInteger:
      JSON := JSON + VarToStr(value);
    varDouble:
      JSON := JSON + VarToStr(value);
    varString:
      begin
        if (VarToStr(value)[1] <> '{') then
        begin
          JSON := JSON + '"';
        end;
        JSON := JSON + VarToStr(value);
        if (VarToStr(value)[Length(value)] <> '}') then
        begin
          JSON := JSON + '"';
        end;
      end;
    varUString:
      begin
        if (VarToStr(value)[1] <> '{') then
        begin
          JSON := JSON + '"';
        end;
        JSON := JSON + VarToStr(value);
        if (VarToStr(value)[Length(value)] <> '}') then
        begin
          JSON := JSON + '"';
        end;
      end;
  end;
  JSON := JSON + ',';
end;

constructor TftTypeParser.Create;
begin

end;

destructor TftTypeParser.Destroy;
begin

  inherited;
end;

function TftTypeParser.parseAnimation(const obj: TftAnimation): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'thumb', parsePhotoSize(obj.Thumb));
  appendToJson(Result, 'file_name', obj.FileName);
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseAudio(const obj: TftAudio): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'duration', obj.Duration);
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'file_size', obj.FileSize);
  appendToJson(Result, 'thumb', parsePhotoSize(obj.Thumb));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseBotCommand(const obj: TftBotCommand): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'command', obj.Command);
  appendToJson(Result, 'description', obj.Description);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseCallbackQuery(const obj: TftCallbackQuery): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  appendToJson(Result, 'from', parseUser(obj.From));
  appendToJson(Result, 'message', parseMessage(obj.Message));
  appendToJson(Result, 'inline_message_id', obj.InlineMessageId);
  appendToJson(Result, 'chat_instance', obj.ChatInstance);
  appendToJson(Result, 'game_short_name', obj.GameShortName);
  appendToJson(Result, 'data', obj.data);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseChat(const obj: TftChat): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  if (obj.TypeChat = TftChatType.ftcPrivate) then
    appendToJson(Result, 'type', 'private')
  else if (obj.TypeChat = TftChatType.ftcGroup) then
    appendToJson(Result, 'type', 'group')
  else if (obj.TypeChat = TftChatType.ftcSupergroup) then
    appendToJson(Result, 'type', 'supergroup')
  else if (obj.TypeChat = TftChatType.ftcChannel) then
    appendToJson(Result, 'type', 'channel');
  appendToJson(Result, 'title', obj.Title);
  appendToJson(Result, 'username', obj.username);
  appendToJson(Result, 'first_name', obj.firstName);
  appendToJson(Result, 'last_name', obj.lastName);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseChatMember(const obj: TftChatMember): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'user', parseUser(obj.User));
  appendToJson(Result, 'status', obj.StatuS);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseChatPermissions
  (const obj: TftChatPermissions): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'can_send_messages', obj.CanSendMessages);
  appendToJson(Result, 'can_send_media_messages', obj.CanSendMediaMessages);
  appendToJson(Result, 'can_send_polls', obj.CanSendPolls);
  appendToJson(Result, 'can_send_other_messages', obj.CanSendOtherMessages);
  appendToJson(Result, 'can_add_web_page_previews', obj.CanAddWebPagePreviews);
  appendToJson(Result, 'can_change_info', obj.CanChangeInfo);
  appendToJson(Result, 'can_invite_users', obj.CanInviteUsers);
  appendToJson(Result, 'can_pin_messages', obj.CanPinMessages);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseChatPhoto(const obj: TftChatPhoto): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'small_file_id', obj.SmallFileId);
  appendToJson(Result, 'big_file_id', obj.BigFileId);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseChosenInlineResult
  (const obj: TftChosenInlineResult): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'result_id', obj.ResultId);
  appendToJson(Result, 'from', parseUser(obj.From));
  appendToJson(Result, 'query', obj.Query);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseContact(const obj: TftContact): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'phone_number', obj.PhoneNumber);
  appendToJson(Result, 'first_name', obj.firstName);
  appendToJson(Result, 'last_name', obj.lastName);
  appendToJson(Result, 'user_id', obj.UserId);
  appendToJson(Result, 'vcard', obj.Vcard);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseDocument(const obj: TftDocument): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'thumb', parsePhotoSize(obj.Thumb));
  appendToJson(Result, 'file_name', obj.FileName);
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseForceReply(const obj: TftForceReply): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'force_reply', obj.ForceReply);
  appendToJson(Result, 'selective', obj.Selective);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseGame(const obj: TftGame): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'title', obj.Title);
  appendToJson(Result, 'description', obj.Description);
  appendToJson(Result, 'photo', parseList(TList(obj.Photo)));
  appendToJson(Result, 'text', obj.Text);
  appendToJson(Result, 'text_entities', parseList(TList(obj.TextEntities)));
  appendToJson(Result, 'animation', parseAnimation(obj.Animation));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseGameHighScore(const obj: TftGameHighScore): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'position', obj.Position);
  appendToJson(Result, 'user', parseUser(obj.User));
  appendToJson(Result, 'score', obj.Score);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseInlineKeyboardButton
  (const obj: TftInlineKeyboardButton): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  if (obj.pay) then
    appendToJson(Result, 'pay', obj.pay);
  appendToJson(Result, 'text', obj.Text);
  appendToJson(Result, 'url', obj.url);
  appendToJson(Result, 'callback_data', obj.callbackData);
  appendToJson(Result, 'switch_inline_query', obj.switchInlineQuery);
  appendToJson(Result, 'switch_inline_query_current_chat',
    obj.switchInlineQueryCurrentChat);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseInlineKeyboardMarkup
  (const obj: TftInlineKeyboardMarkup): String;
var
  I, J: Integer;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '"inline_keyboard":[';
  for I := 0 to obj.inlineKeyboard.Count - 1 do
  begin
    Result := Result + '[';
    for J := 0 to obj.inlineKeyboard[I].Count - 1 do
    begin
      Result := Result + parseInlineKeyboardButton(obj.inlineKeyboard[I][J]);
      Result := Result + ',';
    end;
    removeLastComma(Result);
    Result := Result + '],';
  end;
  if not(obj.inlineKeyboard = nil) then
    removeLastComma(Result);
  Result := Result + ']}';
end;

function TftTypeParser.parseInlineQuery(const obj: TftInlineQuery): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  appendToJson(Result, 'from', parseUser(obj.From));
  appendToJson(Result, 'location', parseLocation(obj.Location));
  appendToJson(Result, 'query', obj.Query);
  appendToJson(Result, 'offset', obj.Offset);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseInlineQueryResult
  (const obj: TftInlineQueryResult): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  appendToJson(Result, 'type', obj.TypeInlineQueryResult);
  appendToJson(Result, 'title', obj.Title);
  appendToJson(Result, 'caption', obj.Caption);
  appendToJson(Result, 'reply_markup',
    parseInlineKeyboardMarkup(obj.ReplyMarkup));
  appendToJson(Result, 'input_message_content',
    parseInputMessageContent(obj.InputMessageContent));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseInlineQueryResultArticle
  (const obj: TftInlineQueryResultArticle): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'url', obj.url);
  appendToJson(Result, 'hide_url', obj.HideUrl);
  appendToJson(Result, 'description', obj.Description);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'thumb_width', obj.ThumbWidth);
  appendToJson(Result, 'thumb_height', obj.ThumbHeight);
  // The last comma will be erased by parseInlineQueryResult()
end;

function TftTypeParser.parseInlineQueryResultAudio
  (const obj: TftInlineQueryResultAudio): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'audio_url', obj.AudioUrl);
  appendToJson(Result, 'performer', obj.Performer);
  appendToJson(Result, 'audio_duration', obj.AudioDuration);
  // The last comma will be erased by parseInlineQueryResult()
end;

function TftTypeParser.parseInlineQueryResultCachedAudio
  (const obj: TftInlineQueryResultCachedAudio): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'audio_file_id', obj.AudioFileId);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedDocument
  (const obj: TftInlineQueryResultCachedDocument): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'document_file_id', obj.DocumentFileId);
  appendToJson(Result, 'description', obj.Description);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedGif
  (const obj: TftInlineQueryResultCachedGif): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'gif_file_id', obj.GifFileId);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedMpeg4Gif
  (const obj: TftInlineQueryResultCachedMpeg4Gif): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'mpeg4_file_id', obj.Mpeg4FileId);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedPhoto
  (const obj: TftInlineQueryResultCachedPhoto): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'photo_file_id', obj.PhotoFileId);
  appendToJson(Result, 'description', obj.Description);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedSticker
  (const obj: TftInlineQueryResultCachedSticker): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'sticker_file_id', obj.StickerFileId);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedVideo
  (const obj: TftInlineQueryResultCachedVideo): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'video_file_id', obj.VideoFileId);
  appendToJson(Result, 'description', obj.Description);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultCachedVoice
  (const obj: TftInlineQueryResultCachedVoice): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'voice_file_id', obj.VoiceFileId);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultContact
  (const obj: TftInlineQueryResultContact): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'phone_number', obj.PhoneNumber);
  appendToJson(Result, 'first_name', obj.firstName);
  appendToJson(Result, 'last_name', obj.lastName);
  appendToJson(Result, 'vcard', obj.Vcard);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'thumb_width', obj.ThumbWidth);
  appendToJson(Result, 'thumb_height', obj.ThumbHeight);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultDocument
  (const obj: TftInlineQueryResultDocument): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'document_url', obj.DocumentUrl);
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'description', obj.Description);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'thumb_width', obj.ThumbWidth);
  appendToJson(Result, 'thumb_height', obj.ThumbHeight);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultGame
  (const obj: TftInlineQueryResultGame): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'game_short_name', obj.GameShortName);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultGif
  (const obj: TftInlineQueryResultGif): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'gif_url', obj.GifUrl);
  appendToJson(Result, 'gif_width', obj.GifWidth);
  appendToJson(Result, 'gif_height', obj.GifHeight);
  appendToJson(Result, 'gif_duration', obj.GifDuration);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultLocation
  (const obj: TftInlineQueryResultLocation): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'latitude', obj.Latitude);
  appendToJson(Result, 'longitude', obj.Longitude);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'thumb_width', obj.ThumbWidth);
  appendToJson(Result, 'thumb_height', obj.ThumbHeight);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultMpeg4Gif
  (const obj: TftInlineQueryResultMpeg4Gif): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'mpeg4_url', obj.Mpeg4Url);
  appendToJson(Result, 'mpeg4_width', obj.Mpeg4Width);
  appendToJson(Result, 'mpeg4_height', obj.Mpeg4Height);
  appendToJson(Result, 'mpeg4_duration', obj.Mpeg4Duration);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultPhoto
  (const obj: TftInlineQueryResultPhoto): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'photo_url', obj.PhotoUrl);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'photo_width', obj.PhotoWidth);
  appendToJson(Result, 'photo_height', obj.PhotoHeight);
  appendToJson(Result, 'description', obj.Description);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultVenue
  (const obj: TftInlineQueryResultVenue): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'latitude', obj.Latitude);
  appendToJson(Result, 'longitude', obj.Longitude);
  appendToJson(Result, 'address', obj.Address);
  appendToJson(Result, 'foursquare_id', obj.FoursquareId);
  appendToJson(Result, 'foursquare_type', obj.FoursquareType);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'thumb_width', obj.ThumbWidth);
  appendToJson(Result, 'thumb_height', obj.ThumbHeight);
  // The last comma will be erased by parseInlineQueryResult().egin
end;

function TftTypeParser.parseInlineQueryResultVideo
  (const obj: TftInlineQueryResultVideo): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'video_url', obj.videoUrl);
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'thumb_url', obj.ThumbUrl);
  appendToJson(Result, 'video_width', obj.VideoWidth);
  appendToJson(Result, 'video_height', obj.VideoHeight);
  appendToJson(Result, 'video_duration', obj.VideoDuration);
  appendToJson(Result, 'description', obj.Description);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInlineQueryResultVoice
  (const obj: TftInlineQueryResultVoice): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  appendToJson(Result, 'voice_url', obj.VoiceUrl);
  appendToJson(Result, 'voice_duration', obj.VoiceDuration);
  // The last comma will be erased by parseInlineQueryResult().
end;

function TftTypeParser.parseInputContactMessageContent
  (const obj: TftInputContactMessageContent): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInputMessageContent()
  appendToJson(Result, 'phone_number', obj.PhoneNumber);
  appendToJson(Result, 'first_name', obj.firstName);
  appendToJson(Result, 'last_name', obj.lastName);
  appendToJson(Result, 'vcard', obj.Vcard);
  // The last comma will be erased by parseInputMessageContent().
end;

function TftTypeParser.parseInputLocationMessageContent
  (const obj: TftInputLocationMessageContent): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInputMessageContent()
  appendToJson(Result, 'latitude', obj.Latitude);
  appendToJson(Result, 'longitude', obj.Longitude);
  // The last comma will be erased by parseInputMessageContent().
end;

function TftTypeParser.parseInputMedia(const obj: TftInputMedia): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  if obj.TypeMedia = imtPhoto then
    appendToJson(Result, 'type', 'photo')
  else if obj.TypeMedia = imtVideo then
    appendToJson(Result, 'type', 'video')
  else if obj.TypeMedia = imtAnimation then
    appendToJson(Result, 'type', 'animation')
  else if obj.TypeMedia = imtDocument then
    appendToJson(Result, 'type', 'document')
  else if obj.TypeMedia = imtAudio then
    appendToJson(Result, 'type', 'audio');

  appendToJson(Result, 'media', obj.Media);
  appendToJson(Result, 'caption', obj.Caption);
  appendToJson(Result, 'parse_mode', obj.ParseMode);
  if obj.Width >= 0 then
    appendToJson(Result, 'width', obj.Width);
  if obj.Height >= 0 then
    appendToJson(Result, 'height', obj.Height);
  if obj.Duration >= 0 then
    appendToJson(Result, 'duration', obj.Duration);
  if obj.Performer >= 0 then
    appendToJson(Result, 'performer', obj.Performer);
  if obj.SupportSStreaming then
    appendToJson(Result, 'supports_streaming', obj.SupportSStreaming);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseInputMessageContent
  (const obj: TftInputMessageContent): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  if Pos(obj.TypeMessageContent, 'InputTextMessageContent') > 0 then
    Result := Result + parseInputTextMessageContent
      (TftInputTextMessageContent(obj))
  else if Pos(obj.TypeMessageContent, 'InputLocationMessageContent') > 0 then
    Result := Result + parseInputLocationMessageContent
      (TftInputLocationMessageContent(obj))
  else if Pos(obj.TypeMessageContent, 'InputVenueMessageContent') > 0 then
    Result := Result + parseInputVenueMessageContent
      (TftInputVenueMessageContent(obj))
  else if Pos(obj.TypeMessageContent, 'InputContactMessageContent') > 0 then
    Result := Result + parseInputContactMessageContent
      (TftInputContactMessageContent(obj));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseInputTextMessageContent
  (const obj: TftInputTextMessageContent): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInputMessageContent()
  appendToJson(Result, 'message_text', obj.MessageText);
  appendToJson(Result, 'parse_mode', obj.ParseMode);
  appendToJson(Result, 'disable_web_page_preview', obj.DisableWebPagePreview);
  // The last comma will be erased by parseInputMessageContent().
end;

function TftTypeParser.parseInputVenueMessageContent
  (const obj: TftInputVenueMessageContent): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  // This function will be called by parseInputMessageContent()
  appendToJson(Result, 'latitude', obj.Latitude);
  appendToJson(Result, 'longitude', obj.Longitude);
  // The last comma will be erased by parseInputMessageContent().
end;

function TftTypeParser.parseInvoice(const obj: TftInvoice): String;
begin
  Result := '';
  if (obj <> nil) then
    Result := '';
  Result := Result + '{';
  appendToJson(Result, 'title', obj.Title);
  appendToJson(Result, 'description', obj.Description);
  appendToJson(Result, 'start_parameter', obj.StartParameter);
  appendToJson(Result, 'currency', obj.Currency);
  appendToJson(Result, 'total_amount', obj.TotalAmount);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseJson(serverResponse: String): TJSONObject;
begin
  try
    Result := TJSONObject.ParseJSONValue(serverResponse) as TJSONObject;
  except
    // on E: Exception do
    // begin
    //
    // end;
  end;

end;

function TftTypeParser.parseJsonAndGetAnimation(const data: TJSONObject)
  : TftAnimation;
begin
  Result := TftAnimation.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftAnimation>((data.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.parseJsonAndGetAudio(const data: TJSONObject): TftAudio;
begin
  Result := TftAudio.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftAudio>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetBotCommand(const data: TJSONObject)
  : TftBotCommand;
begin
  Result := TftBotCommand.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommand>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetCallbackQuery(const data: TJSONObject)
  : TftCallbackQuery;
begin
  Result := TftCallbackQuery.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftCallbackQuery>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetChat(const data: TJSONObject): TftChat;
begin
  Result := TftChat.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChat>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetChatMember(const data: TJSONObject)
  : TftChatMember;
begin
  Result := TftChatMember.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMember>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetChatPermissions(const data: TJSONObject)
  : TftChatPermissions;
begin
  Result := TftChatPermissions.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatPermissions>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetChatPhoto(const data: TJSONObject)
  : TftChatPhoto;
begin
  Result := TftChatPhoto.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatPhoto>((data.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.parseJsonAndGetChosenInlineResult
  (const data: TJSONObject): TftChosenInlineResult;
begin
  Result := TftChosenInlineResult.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChosenInlineResult>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetContact(const data: TJSONObject)
  : TftContact;
begin
  Result := TftContact.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftContact>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetDocument(const data: TJSONObject)
  : TftDocument;
begin
  Result := TftDocument.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftDocument>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetForceReply(const data: TJSONObject)
  : TftForceReply;
begin
  Result := TftForceReply.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForceReply>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetGame(const data: TJSONObject): TftGame;
begin
  Result := TftGame.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftGame>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetGameHighScore(const data: TJSONObject)
  : TftGameHighScore;
begin
  Result := TftGameHighScore.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftGameHighScore>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineKeyboardButton
  (const data: TJSONObject): TftInlineKeyboardButton;
begin
  Result := TftInlineKeyboardButton.Create('');
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineKeyboardButton>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineKeyboardMarkup
  (const data: TJSONObject): TftInlineKeyboardMarkup;
begin
  Result := TftInlineKeyboardMarkup.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineKeyboardMarkup>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQuery(const data: TJSONObject)
  : TftInlineQuery;
begin
  Result := TftInlineQuery.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQuery>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResult(const data: TJSONObject)
  : TftInlineQueryResult;
begin
  Result := TftInlineQueryResult.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResult>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultAudio
  (const data: TJSONObject): TftInlineQueryResultAudio;
begin
  Result := TftInlineQueryResultAudio.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultAudio>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedAudio
  (const data: TJSONObject): TftInlineQueryResultCachedAudio;
begin
  Result := TftInlineQueryResultCachedAudio.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedAudio>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedDocument
  (const data: TJSONObject): TftInlineQueryResultCachedDocument;
begin
  Result := TftInlineQueryResultCachedDocument.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedDocument>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedGif
  (const data: TJSONObject): TftInlineQueryResultCachedGif;
begin
  Result := TftInlineQueryResultCachedGif.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedGif>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedMpeg4Gif
  (const data: TJSONObject): TftInlineQueryResultCachedMpeg4Gif;
begin
  Result := TftInlineQueryResultCachedMpeg4Gif.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedMpeg4Gif>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedPhoto
  (const data: TJSONObject): TftInlineQueryResultCachedPhoto;
begin
  Result := TftInlineQueryResultCachedPhoto.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedPhoto>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedSticker
  (const data: TJSONObject): TftInlineQueryResultCachedSticker;
begin
  Result := TftInlineQueryResultCachedSticker.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedSticker>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedVideo
  (const data: TJSONObject): TftInlineQueryResultCachedVideo;
begin
  Result := TftInlineQueryResultCachedVideo.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedVideo>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultCachedVoice
  (const data: TJSONObject): TftInlineQueryResultCachedVoice;
begin
  Result := TftInlineQueryResultCachedVoice.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedVoice>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultContact
  (const data: TJSONObject): TftInlineQueryResultContact;
begin
  Result := TftInlineQueryResultContact.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultContact>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultDocument
  (const data: TJSONObject): TftInlineQueryResultDocument;
begin
  Result := TftInlineQueryResultDocument.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultDocument>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultGame
  (const data: TJSONObject): TftInlineQueryResultGame;
begin
  Result := TftInlineQueryResultGame.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultGame>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultGif
  (const data: TJSONObject): TftInlineQueryResultGif;
begin
  Result := TftInlineQueryResultGif.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultGif>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultLocation
  (const data: TJSONObject): TftInlineQueryResultLocation;
begin
  Result := TftInlineQueryResultLocation.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultLocation>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultMpeg4Gif
  (const data: TJSONObject): TftInlineQueryResultMpeg4Gif;
begin
  Result := TftInlineQueryResultMpeg4Gif.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultMpeg4Gif>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultPhoto
  (const data: TJSONObject): TftInlineQueryResultPhoto;
begin
  Result := TftInlineQueryResultPhoto.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultPhoto>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultVenue
  (const data: TJSONObject): TftInlineQueryResultVenue;
begin
  Result := TftInlineQueryResultVenue.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultVenue>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultVideo
  (const data: TJSONObject): TftInlineQueryResultVideo;
begin
  Result := TftInlineQueryResultVideo.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultVideo>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInlineQueryResultVoice
  (const data: TJSONObject): TftInlineQueryResultVoice;
begin
  Result := TftInlineQueryResultVoice.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultVoice>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInputContactMessageContent
  (const data: TJSONObject): TftInputContactMessageContent;
begin
  Result := TftInputContactMessageContent.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputContactMessageContent>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInputLocationMessageContent
  (const data: TJSONObject): TftInputLocationMessageContent;
begin
  Result := TftInputLocationMessageContent.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputLocationMessageContent>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInputMedia(const data: TJSONObject)
  : TftInputMedia;
begin
  Result := TftInputMedia.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMedia>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInputMessageContent
  (const data: TJSONObject): TftInputMessageContent;
begin
  Result := TftInputMessageContent.Create('');
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMessageContent>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInputTextMessageContent
  (const data: TJSONObject): TftInputTextMessageContent;
begin
  Result := TftInputTextMessageContent.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputTextMessageContent>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInputVenueMessageContent
  (const data: TJSONObject): TftInputVenueMessageContent;
begin
  Result := TftInputVenueMessageContent.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputVenueMessageContent>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetInvoice(const data: TJSONObject)
  : TftInvoice;
begin
  Result := TftInvoice.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInvoice>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetKeyboardButton(const data: TJSONObject)
  : TftKeyboardButton;
begin
  Result := TftKeyboardButton.Create('');
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftKeyboardButton>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetLabeledPrice(const data: TJSONObject)
  : TftLabeledPrice;
begin
  Result := TftLabeledPrice.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftLabeledPrice>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetList(ParseFunc: TJsonToFtTypeFunc;
  JSONObject: TJSONObject): TList;
var
  getArrayJSON: TJSONArray;
  I: Byte;
begin
  Result := TList.Create;
  try
    getArrayJSON := (JSONObject).GetValue('result') as TJSONArray;
    if getArrayJSON.Count <= 0 then
      Exit;
    for I := 0 to Pred(getArrayJSON.Count) do
    begin
      Result.Add(ParseFunc(getArrayJSON, I));
    end;
  except
    on E: Exception do
    begin
      // if Assigned(FProcedureErrorException) then
      // FProcedureErrorException(E);
    end;
  end;
end;

function TftTypeParser.parseJsonAndGetLocation(const data: TJSONObject)
  : TftLocation;
begin
  Result := TftLocation.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftLocation>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetMaskPosition(const data: TJSONObject)
  : TftMaskPosition;
begin
  Result := TftMaskPosition.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMaskPosition>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetMessage(const data: TJSONObject)
  : TftMessage;
begin
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMessage>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetMessageEntity(const data: TJSONObject)
  : TftMessageEntity;
begin
  Result := TftMessageEntity.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMessageEntity>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetOrderInfo(const data: TJSONObject)
  : TftOrderInfo;
begin
  Result := TftOrderInfo.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftOrderInfo>((data.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.parseJsonAndGetPoll(const data: TJSONObject): TftPoll;
begin
  Result := TftPoll.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPoll>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetPollOption(const data: TJSONObject)
  : TftPollOption;
begin
  Result := TftPollOption.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPollOption>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetPreCheckoutQuery(const data: TJSONObject)
  : TftPreCheckoutQuery;
begin
  Result := TftPreCheckoutQuery.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPreCheckoutQuery>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetReplyBase(const data: TJSONObject)
  : TftReplyBase;
begin
  Result := TftReplyBase.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftReplyBase>((data.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.parseJsonAndGetReplyKeyboardMarkup
  (const data: TJSONObject): TftReplyKeyboardMarkup;
begin
  Result := TftReplyKeyboardMarkup.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftReplyKeyboardMarkup>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetReplyKeyboardRemove
  (const data: TJSONObject): TftReplyKeyboardRemove;
begin
  Result := TftReplyKeyboardRemove.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftReplyKeyboardRemove>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetResponseParameters
  (const data: TJSONObject): TftResponseParameters;
begin
  Result := TftResponseParameters.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftResponseParameters>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetShippingAddress(const data: TJSONObject)
  : TftShippingAddress;
begin
  Result := TftShippingAddress.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftShippingAddress>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetShippingOption(const data: TJSONObject)
  : TftShippingOption;
begin
  Result := TftShippingOption.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftShippingOption>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetShippingQuery(const data: TJSONObject)
  : TftShippingQuery;
begin
  Result := TftShippingQuery.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftShippingQuery>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetSticker(const data: TJSONObject)
  : TftSticker;
begin
  Result := TftSticker.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftSticker>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetStickerSet(const data: TJSONObject)
  : TftStickerSet;
begin
  Result := TftStickerSet.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftStickerSet>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetSuccessfulPayment(const data: TJSONObject)
  : TftSuccessfulPayment;
begin
  Result := TftSuccessfulPayment.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftSuccessfulPayment>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetUpdate(const data: TJSONObject)
  : TftUpdate;
begin
  Result := TftUpdate.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftUpdate>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetUser(const data: TJSONObject): TftUser;
begin
  Result := TJSON.JsonToObject<TftUser>
    ((data.GetValue('result') as TJSONObject).ToJSON);
end;

function TftTypeParser.parseJsonAndGetUserProfilePhotos(const data: TJSONObject)
  : TftUserProfilePhotos;
begin
  Result := TftUserProfilePhotos.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftUserProfilePhotos>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetVideo(const data: TJSONObject): TftVideo;
begin
  Result := TftVideo.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideo>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetVideoNote(const data: TJSONObject)
  : TftVideoNote;
begin
  Result := TftVideoNote.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideoNote>((data.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.parseJsonAndGetVoice(const data: TJSONObject): TftVoice;
begin
  Result := TftVoice.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVoice>((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndGetWebhookInfo(const data: TJSONObject)
  : TftWebhookInfo;
begin
  Result := TftWebhookInfo.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftWebhookInfo>
      ((data.GetValue('result')).ToJSON);
end;

function TftTypeParser.parseJsonAndPhotoSize(const data: TJSONObject)
  : TftPhotoSize;
begin
  Result := TftPhotoSize.Create;
  if data.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPhotoSize>((data.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.parseKeyboardButton
  (const obj: TftKeyboardButton): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'text', obj.Text);
  appendToJson(Result, 'request_contact', obj.requestContact);
  appendToJson(Result, 'request_location', obj.requestLocation);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseStrings(const obj: TStrings): string;
var
  I: Integer;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';

  for I := 0 to obj.Count - 1 do
  begin
    Result := Result + obj[I];
    Result := Result + ',';
  end;
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseLabeledPrice(const obj: TftLabeledPrice): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'label', obj.LabelPrice);
  appendToJson(Result, 'amount', obj.Amount);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseList(const obj: TList): string;
var
  I: Integer;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';

  for I := 0 to obj.Count - 1 do
  begin
    if (TftPhotoSize(obj[I]) is TftPhotoSize) then
      Result := Result + parsePhotoSize(obj[I])
    else if (TftUser(obj[I]) is TftUser) then
      Result := Result + parseUser(obj[I])
    else if (TftSticker(obj[I]) is TftSticker) then
      Result := Result + parseSticker(obj[I])
    else if (TftPollOption(obj[I]) is TftPollOption) then
      Result := Result + parsePollOption(obj[I])
    else if (TftMessageEntity(obj[I]) is TftMessageEntity) then
      Result := Result + parseMessageEntity(obj[I])
    else if (TftBotCommand(obj[I]) is TftBotCommand) then
      Result := Result + parseBotCommand(obj[I]);
    Result := Result + ',';
  end;
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseLocation(const obj: TftLocation): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'longitude', obj.Longitude);
  appendToJson(Result, 'latitude', obj.Latitude);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseMaskPosition(const obj: TftMaskPosition): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'point', obj.Point);
  appendToJson(Result, 'x_shift', obj.XShift);
  appendToJson(Result, 'y_shift', obj.YShift);
  appendToJson(Result, 'scale', obj.Scale);
  Result := Result + '}';
end;

function TftTypeParser.parseMessage(const obj: TftMessage): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'message_id', obj.MessageId);
  appendToJson(Result, 'from', parseUser(obj.From));
  appendToJson(Result, 'date', obj.Date);
  appendToJson(Result, 'chat', parseChat(obj.Chat));
  appendToJson(Result, 'forward_from', parseUser(obj.ForwardFrom));
  appendToJson(Result, 'forward_from_chat', parseChat(obj.ForwardFromChat));
  appendToJson(Result, 'forward_from_message_id', obj.ForwardFromMessageId);
  appendToJson(Result, 'forward_signature', obj.ForwardSignature);
  appendToJson(Result, 'forward_sender_name', obj.ForwardSenderName);
  appendToJson(Result, 'forward_date', obj.ForwardDate);
  appendToJson(Result, 'reply_to_message', parseMessage(obj.ReplyToMessage));
  appendToJson(Result, 'edit_date', obj.EditDate);
  appendToJson(Result, 'author_signature', obj.AuthorSignature);
  appendToJson(Result, 'text', obj.Text);
  appendToJson(Result, 'audio', parseAudio(obj.Audio));
  appendToJson(Result, 'document', parseDocument(obj.Document));
  appendToJson(Result, 'animation', parseAnimation(obj.Animation));
  appendToJson(Result, 'photo', parseList(TList(obj.Photo)));
  appendToJson(Result, 'sticker', parseSticker(obj.Sticker));
  appendToJson(Result, 'video', parseVideo(obj.Video));
  appendToJson(Result, 'voice', parseVoice(obj.Voice));
  appendToJson(Result, 'contact', parseContact(obj.Contact));
  appendToJson(Result, 'location', parseLocation(obj.Location));
  appendToJson(Result, 'poll', parsePoll(obj.Poll));
  appendToJson(Result, 'new_chat_member', parseUser(obj.NewChatMember));
  appendToJson(Result, 'new_chat_members',
    parseList(TList(obj.NewChatMembers)));
  appendToJson(Result, 'left_chat_member', parseUser(obj.LeftChatMember));
  appendToJson(Result, 'new_chat_title', obj.NewChatTitle);
  appendToJson(Result, 'new_chat_photo', parseList(TList(obj.NewChatPhoto)));
  appendToJson(Result, 'delete_chat_photo', obj.DeleteChatPhoto);
  appendToJson(Result, 'group_chat_created', obj.GroupChatCreated);
  appendToJson(Result, 'caption', obj.Caption);
  appendToJson(Result, 'supergroup_chat_created', obj.SupergroupChatCreated);
  appendToJson(Result, 'channel_chat_created', obj.ChannelChatCreated);
  appendToJson(Result, 'migrate_to_chat_id', obj.MigrateToChatId);
  appendToJson(Result, 'migrate_from_chat_id', obj.MigrateFromChatId);
  appendToJson(Result, 'pinned_message', parseMessage(obj.PinnedMessage));
  appendToJson(Result, 'connected_website', obj.ConnectedWebsite);
  appendToJson(Result, 'invoice', parseInvoice(obj.Invoice));
  appendToJson(Result, 'successful_payment',
    parseSuccessfulPayment(obj.SuccessfulPayment));
  appendToJson(Result, 'reply_markup',
    parseInlineKeyboardMarkup(obj.ReplyMarkup));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseMessageEntity(const obj: TftMessageEntity): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'type', obj.TypeMessageEntity);
  appendToJson(Result, 'offset', obj.Offset);
  appendToJson(Result, 'length', obj.Length);
  appendToJson(Result, 'url', obj.url);
  appendToJson(Result, 'user', parseUser(obj.User));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseOrderInfo(const obj: TftOrderInfo): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  if (obj.Name <> '') then
    appendToJson(Result, 'name', obj.Name);
  if (obj.PhoneNumber <> '') then
    appendToJson(Result, 'phone_number', obj.PhoneNumber);
  if (obj.Email <> '') then
    appendToJson(Result, 'email', obj.Email);
  if (obj.ShippingAddress <> nil) then
  begin
    Result := Result + '"shipping_address":';
    Result := Result + parseShippingAddress(obj.ShippingAddress);
    Result := Result + ',';
  end;
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parsePhotoSize(const obj: TftPhotoSize): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'width', obj.Width);
  appendToJson(Result, 'height', obj.Height);
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parsePoll(const obj: TftPoll): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  appendToJson(Result, 'question', obj.Question);
  appendToJson(Result, 'options', parseList(TList(obj.Options)));
  appendToJson(Result, 'is_closed', obj.IsClosed);
  appendToJson(Result, 'is_anonymous', obj.IsAnonymous);
  appendToJson(Result, 'type', obj.TypePoll);
  appendToJson(Result, 'allows_multiple_answers', obj.AllowsMultipleAnswers);
  appendToJson(Result, 'correct_option_id', obj.CorrectOptionId);
  appendToJson(Result, 'explanation', obj.Explanation);
  appendToJson(Result, 'explanation_entities',
    parseList(TList(obj.ExplanationEntities)));
  appendToJson(Result, 'open_period', obj.OpenPeriod);
  appendToJson(Result, 'close_date', obj.CloseDate);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parsePollOption(const obj: TftPollOption): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'text', obj.Text);
  appendToJson(Result, 'voter_count', obj.VoterCount);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parsePreCheckoutQuery
  (const obj: TftPreCheckoutQuery): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  Result := Result + '"user":';
  Result := Result + parseUser(obj.From);
  Result := Result + ',';
  appendToJson(Result, 'currency', obj.Currency);
  appendToJson(Result, 'total_amount', obj.TotalAmount);
  appendToJson(Result, 'invoicePayload', obj.InvoIcePayload);
  appendToJson(Result, 'shippingOptionId', obj.ShippingOptionId);
  appendToJson(Result, 'orderInfo', parseOrderInfo(obj.OrderInfo));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseReplyBase(const obj: TftReplyBase): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  if (obj is TftForceReply) then
    Result := parseForceReply(TftForceReply(obj))
  else if (obj is TftReplyKeyboardRemove) then
    Result := parseReplyKeyboardRemove(TftReplyKeyboardRemove(obj))
  else if (obj is TftReplyKeyboardMarkup) then
    Result := parseReplyKeyboardMarkup(TftReplyKeyboardMarkup(obj))
  else if (obj is TftInlineKeyboardMarkup) then
    Result := parseInlineKeyboardMarkup(TftInlineKeyboardMarkup(obj));
end;

function TftTypeParser.parseReplyKeyboardMarkup
  (const obj: TftReplyKeyboardMarkup): String;
var
  I, J: Integer;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '"keyboard":[';
  for I := 0 to obj.keyboard.Count - 1 do
  begin
    Result := Result + '[';
    for J := 0 to obj.keyboard[I].Count - 1 do
    begin
      Result := Result + parseKeyboardButton(obj.keyboard[I][J]);
      Result := Result + ',';
    end;
    removeLastComma(Result);
    Result := Result + '],';
  end;
  if not(obj.keyboard.Count = 0) then
    removeLastComma(Result);
  Result := Result + '],';
  appendToJson(Result, 'resize_keyboard', obj.resizeKeyboard);
  appendToJson(Result, 'one_time_keyboard', obj.oneTimeKeyboard);
  appendToJson(Result, 'selective', obj.Selective);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseReplyKeyboardRemove
  (const obj: TftReplyKeyboardRemove): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'remove_keyboard', obj.removeKeyboard);
  appendToJson(Result, 'selective', obj.Selective);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseResponseParameters
  (const obj: TftResponseParameters): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'migrate_to_chat_id', obj.MigrateToChatId);
  appendToJson(Result, 'retry_after', obj.RetryAfter);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseShippingAddress
  (const obj: TftShippingAddress): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  if (obj.State <> '') then
    appendToJson(Result, 'state', obj.State);
  appendToJson(Result, 'city', obj.City);
  appendToJson(Result, 'street_line1', obj.StreetLine1);
  appendToJson(Result, 'street_line2', obj.StreetLine2);
  appendToJson(Result, 'post_code', obj.PostCode);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseShippingOption
  (const obj: TftShippingOption): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  appendToJson(Result, 'title', obj.Title);
  removeLastComma(Result);
  Result := Result + '"prices":';
  Result := Result + parseList(TList(obj.Prices));
  Result := Result + '}';
end;

function TftTypeParser.parseShippingQuery(const obj: TftShippingQuery): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  Result := Result + '"from":';
  Result := Result + parseUser(obj.From);
  Result := Result + ',';
  appendToJson(Result, 'invoice_payload', obj.InvoIcePayload);
  Result := Result + '"shipping_address":';
  Result := Result + parseShippingAddress(obj.ShippingAddress);
  Result := Result + ',';
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseSticker(const obj: TftSticker): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'width', obj.Width);
  appendToJson(Result, 'height', obj.Height);
  appendToJson(Result, 'is_animated', obj.IsAnimated);
  appendToJson(Result, 'thumb', parsePhotoSize(obj.Thumb));
  appendToJson(Result, 'emoji', obj.Emoji);
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseStickerSet(const obj: TftStickerSet): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'name', obj.Name);
  appendToJson(Result, 'title', obj.Title);
  appendToJson(Result, 'is_animated', obj.IsAnimated);
  appendToJson(Result, 'contains_masks', obj.ContainsMasks);
  appendToJson(Result, 'stickers', parseList(TList(obj.Stickers)));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseSuccessfulPayment
  (const obj: TftSuccessfulPayment): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'currency', obj.Currency);
  appendToJson(Result, 'total_amount', obj.TotalAmount);
  appendToJson(Result, 'invoice_payload', obj.InvoIcePayload);
  appendToJson(Result, 'shipping_option_id', obj.ShippingOptionId);
  Result := Result + '"order_info":';
  Result := Result + parseOrderInfo(obj.OrderInfo);
  Result := Result + ',';
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseUpdate(const obj: TftUpdate): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'update_id', obj.UpdateId);
  appendToJson(Result, 'message', parseMessage(obj.Message));
  appendToJson(Result, 'edited_message', parseMessage(obj.EditedMessage));
  appendToJson(Result, 'channel_post', parseMessage(obj.ChannelPost));
  appendToJson(Result, 'edited_channel_post',
    parseMessage(obj.EditedChannelPost));
  appendToJson(Result, 'inline_query', parseInlineQuery(obj.InlineQuery));
  appendToJson(Result, 'chosen_inline_result',
    parseChosenInlineResult(obj.ChosenInlineResult));
  appendToJson(Result, 'callback_query', parseCallbackQuery(obj.CallbackQuery));
  appendToJson(Result, 'shipping_query', parseShippingQuery(obj.ShippingQuery));
  appendToJson(Result, 'pre_checkout_query',
    parsePreCheckoutQuery(obj.PreCheckoutQuery));
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseUser(const obj: TftUser): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'id', obj.Id);
  appendToJson(Result, 'is_bot', obj.IsBot);
  appendToJson(Result, 'first_name', obj.firstName);
  appendToJson(Result, 'last_name', obj.lastName);
  appendToJson(Result, 'username', obj.username);
  appendToJson(Result, 'language_code', obj.languageCode);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseUserProfilePhotos
  (const obj: TftUserProfilePhotos): String;
begin

end;

function TftTypeParser.parseVideo(const obj: TftVideo): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'width', obj.Width);
  appendToJson(Result, 'height', obj.Height);
  appendToJson(Result, 'duration', obj.Duration);
  appendToJson(Result, 'thumb', parsePhotoSize(obj.Thumb));
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseVideoNote(const obj: TftVideoNote): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'length', obj.Length);
  appendToJson(Result, 'duration', obj.Duration);
  appendToJson(Result, 'thumb', parsePhotoSize(obj.Thumb));
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseVoice(const obj: TftVoice): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'file_id', obj.FileId);
  appendToJson(Result, 'duration', obj.Duration);
  appendToJson(Result, 'mime_type', obj.MimeType);
  appendToJson(Result, 'file_size', obj.FileSize);
  removeLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.parseWebhookInfo(const obj: TftWebhookInfo): String;
begin
  Result := '';
  if (obj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  appendToJson(Result, 'url', obj.url);
  appendToJson(Result, 'has_custom_certificate', obj.has_custom_certificate);
  appendToJson(Result, 'pending_update_count', obj.pending_update_count);
  appendToJson(Result, 'last_error_date', obj.last_error_date);
  appendToJson(Result, 'last_error_message', obj.last_error_message);
  appendToJson(Result, 'max_connections', obj.max_connections);
  appendToJson(Result, 'allowed_updates',
    parseList(TList(obj.allowed_updates)));
  removeLastComma(Result);
  Result := Result + '}';
end;

procedure TftTypeParser.removeLastComma(var input: String);
begin
  Delete(input, Length(input), 1);
end;

end.
