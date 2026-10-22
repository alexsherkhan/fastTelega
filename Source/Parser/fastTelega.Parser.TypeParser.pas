/// <summary>
/// fastTelega TypeParser
/// Alexander Syrykh
/// </summary>
unit fastTelega.Parser.TypeParser;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  System.Variants,
  System.JSON,
  Rest.JSON,

  {fastTelega}
  fastTelega.AvailableTypes,
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
  fastTelega.AvailableTypes.ftEncryptedCredentials,
  fastTelega.AvailableTypes.ftEncryptedPassportElement,
  fastTelega.AvailableTypes.ftForceReply,
  fastTelega.AvailableTypes.ftForumTopic,
  fastTelega.AvailableTypes.ftForumTopicClosed,
  fastTelega.AvailableTypes.ftForumTopicCreated,
  fastTelega.AvailableTypes.ftForumTopicEdited,
  fastTelega.AvailableTypes.ftForumTopicReopened,
  fastTelega.AvailableTypes.ftFile,
  fastTelega.AvailableTypes.ftGeneralForumTopicHidden,
  fastTelega.AvailableTypes.ftGeneralForumTopicUnhidden,
  fastTelega.AvailableTypes.ftInlineKeyboardButton,
  fastTelega.AvailableTypes.ftInlineKeyboardMarkup,
  fastTelega.AvailableTypes.ftInlineQueryResult,
  fastTelega.AvailableTypes.ftInputMedia,
  fastTelega.AvailableTypes.ftInputMediaAnimation,
  fastTelega.AvailableTypes.ftInputMediaAudio,
  fastTelega.AvailableTypes.ftInputMediaDocument,
  fastTelega.AvailableTypes.ftInputMediaPhoto,
  fastTelega.AvailableTypes.ftInputMediaVideo,
  fastTelega.AvailableTypes.ftInputMessageContent,
  fastTelega.AvailableTypes.ftInvoice,
  fastTelega.AvailableTypes.ftKeyboardButton,
  fastTelega.AvailableTypes.ftKeyboardButtonPollType,
  fastTelega.AvailableTypes.ftLabeledPrice,
  fastTelega.AvailableTypes.ftLocation,
  fastTelega.AvailableTypes.ftLoginUrl,
  fastTelega.AvailableTypes.ftMaskPosition,
  fastTelega.AvailableTypes.ftMenuButton,
  fastTelega.AvailableTypes.ftMenuButtonCommands,
  fastTelega.AvailableTypes.ftMenuButtonDefault,
  fastTelega.AvailableTypes.ftMenuButtonWebApp,
  fastTelega.AvailableTypes.ftMessageAutoDeleteTimerChanged,
  fastTelega.AvailableTypes.ftMessageId,
  fastTelega.AvailableTypes.ftOrderInfo,
  fastTelega.AvailableTypes.ftPassportData,
  fastTelega.AvailableTypes.ftPassportElementError,
  fastTelega.AvailableTypes.ftPassportElementErrorDataField,
  fastTelega.AvailableTypes.ftPassportElementErrorFile,
  fastTelega.AvailableTypes.ftPassportElementErrorFiles,
  fastTelega.AvailableTypes.ftPassportElementErrorFrontSide,
  fastTelega.AvailableTypes.ftPassportElementErrorReverseSide,
  fastTelega.AvailableTypes.ftPassportElementErrorSelfie,
  fastTelega.AvailableTypes.ftPassportElementErrorTranslationFile,
  fastTelega.AvailableTypes.ftPassportElementErrorTranslationFiles,
  fastTelega.AvailableTypes.ftPassportElementErrorUnspecified,
  fastTelega.AvailableTypes.ftPassportFile,
  fastTelega.AvailableTypes.ftPhotoSize,
  fastTelega.AvailableTypes.ftPollOption,
  fastTelega.AvailableTypes.ftReplyBase,
  fastTelega.AvailableTypes.ftReplyKeyboardMarkup,
  fastTelega.AvailableTypes.ftReplyKeyboardRemove,
  fastTelega.AvailableTypes.ftResponseParameters,
  fastTelega.AvailableTypes.ftSentWebAppMessage,
  fastTelega.AvailableTypes.ftShippingAddress,
  fastTelega.AvailableTypes.ftShippingOption,
  fastTelega.AvailableTypes.ftSticker,
  fastTelega.AvailableTypes.ftStickerSet,
  fastTelega.AvailableTypes.ftVenue,
  fastTelega.AvailableTypes.ftVoice,
  fastTelega.AvailableTypes.ftWebAppData,
  fastTelega.AvailableTypes.ftWebAppInfo,
  fastTelega.AvailableTypes.ftWebhookInfo,
  fastTelega.AvailableTypes.ftWriteAccessAllowed;

type
  TftParseFunc = function(AObj: TObject): String of object;
  TJsonToFtTypeFunc = function(AJSONArray: TJSONArray; AIndex: Integer)
    : TObject;

  TftTypeParser = class
  private
    procedure AppendToJson(var AJSON: String; const AVarName: String;
      const AValue: Variant);
    procedure RemoveLastComma(var AInput: String);
  public
    constructor Create;
    destructor Destroy; override;
    function ParseAnimation(const AObj: TftAnimation): String;
    function ParseAudio(const AObj: TftAudio): String;
    function ParseBotCommand(const AObj: TftBotCommand): String;
    function ParseBotCommandScope(const AObj: TftBotCommandScope): String;
    function ParseBotCommandScopeAllChatAdministrators
      (const AObj: TftBotCommandScopeAllChatAdministrators): String;
    function ParseBotCommandScopeAllGroupChats
      (const AObj: TftBotCommandScopeAllGroupChats): String;
    function ParseBotCommandScopeAllPrivateChats
      (const AObj: TftBotCommandScopeAllPrivateChats): String;
    function ParseBotCommandScopeChat(const AObj
      : TftBotCommandScopeChat): String;
    function ParseBotCommandScopeChatAdministrators
      (const AObj: TftBotCommandScopeChatAdministrators): String;
    function ParseBotCommandScopeChatMember(const AObj
      : TftBotCommandScopeChatMember): String;
    function ParseBotCommandScopeDefault(const AObj
      : TftBotCommandScopeDefault): String;
    function ParseCallbackGame(const AObj: TftCallbackGame): String;
    function ParseCallbackQuery(const AObj: TftCallbackQuery): String;
    function ParseChat(const AObj: TftChat): String;
    function ParseChatAdministratorRights(const AObj
      : TftChatAdministratorRights): String;
    function ParseChatInviteLink(const AObj: TftChatInviteLink): String;
    function ParseChatJoinRequest(const AObj: TftChatJoinRequest): String;
    function ParseChatLocation(const AObj: TftChatLocation): String;
    function ParseChatMember(const AObj: TftChatMember): String;
    function ParseChatMemberAdministrator(const AObj
      : TftChatMemberAdministrator): String;
    function ParseChatMemberBanned(const AObj: TftChatMemberBanned): String;
    function ParseChatMemberLeft(const AObj: TftChatMemberLeft): String;
    function ParseChatMemberMember(const AObj: TftChatMemberMember): String;
    function ParseChatMemberOwner(const AObj: TftChatMemberOwner): String;
    function ParseChatMemberRestricted(const AObj
      : TftChatMemberRestricted): String;
    function ParseChatMemberUpdated(const AObj: TftChatMemberUpdated): String;
    function ParseChatPermissions(const AObj: TftChatPermissions): String;
    function ParseChatPhoto(const AObj: TftChatPhoto): String;
    function ParseChosenInlineResult(const AObj: TftChosenInlineResult): String;
    function ParseContact(const AObj: TftContact): String;
    function ParseDice(const AObj: TftDice): String;
    function ParseDocument(const AObj: TftDocument): String;
    function ParseEncryptedCredentials(const AObj
      : TftEncryptedCredentials): String;
    function ParseEncryptedPassportElement(const AObj
      : TftEncryptedPassportElement): String;
    function ParseFile(const AObj: TftFile): String;
    function ParseForceReply(const AObj: TftForceReply): String;
    function ParseForumTopic(const AObj: TftForumTopic): String;
    function ParseForumTopicClosed(const AObj: TftForumTopicClosed): String;
    function ParseForumTopicEdited(const AObj: TftForumTopicEdited): String;
    function ParseForumTopicCreated(const AObj: TftForumTopicCreated): String;
    function ParseForumTopicReopened(const AObj: TftForumTopicReopened): String;
    function ParseGeneralForumTopicHidden(const AObj
      : TftGeneralForumTopicHidden): String;
    function ParseGeneralForumTopicUnhidden(const AObj
      : TftGeneralForumTopicUnhidden): String;
    function ParseGame(const AObj: TftGame): String;
    function ParseGameHighScore(const AObj: TftGameHighScore): String;

    function ParseInlineKeyboardButton(const AObj
      : TftInlineKeyboardButton): String;
    function ParseInlineKeyboardMarkup(const AObj
      : TftInlineKeyboardMarkup): String;
    function ParseInlineQuery(const AObj: TftInlineQuery): String;
    function ParseInlineQueryResult(const AObj: TftInlineQueryResult): String;
    function ParseInlineQueryResultArticle(const AObj
      : TftInlineQueryResultArticle): String;
    function ParseInlineQueryResultAudio(const AObj
      : TftInlineQueryResultAudio): String;
    function ParseInlineQueryResultCachedAudio
      (const AObj: TftInlineQueryResultCachedAudio): String;
    function ParseInlineQueryResultCachedDocument
      (const AObj: TftInlineQueryResultCachedDocument): String;
    function ParseInlineQueryResultCachedGif(const AObj
      : TftInlineQueryResultCachedGif): String;
    function ParseInlineQueryResultCachedMpeg4Gif
      (const AObj: TftInlineQueryResultCachedMpeg4Gif): String;
    function ParseInlineQueryResultCachedPhoto
      (const AObj: TftInlineQueryResultCachedPhoto): String;
    function ParseInlineQueryResultCachedSticker
      (const AObj: TftInlineQueryResultCachedSticker): String;
    function ParseInlineQueryResultCachedVideo
      (const AObj: TftInlineQueryResultCachedVideo): String;
    function ParseInlineQueryResultCachedVoice
      (const AObj: TftInlineQueryResultCachedVoice): String;
    function ParseInlineQueryResultContact(const AObj
      : TftInlineQueryResultContact): String;
    function ParseInlineQueryResultDocument(const AObj
      : TftInlineQueryResultDocument): String;
    function ParseInlineQueryResultGame(const AObj
      : TftInlineQueryResultGame): String;
    function ParseInlineQueryResultGif(const AObj
      : TftInlineQueryResultGif): String;
    function ParseInlineQueryResultLocation(const AObj
      : TftInlineQueryResultLocation): String;
    function ParseInlineQueryResultMpeg4Gif(const AObj
      : TftInlineQueryResultMpeg4Gif): String;
    function ParseInlineQueryResultPhoto(const AObj
      : TftInlineQueryResultPhoto): String;
    function ParseInlineQueryResultVenue(const AObj
      : TftInlineQueryResultVenue): String;
    function ParseInlineQueryResultVideo(const AObj
      : TftInlineQueryResultVideo): String;
    function ParseInlineQueryResultVoice(const AObj
      : TftInlineQueryResultVoice): String;
    function ParseInputContactMessageContent(const AObj
      : TftInputContactMessageContent): String;
    function ParseInputLocationMessageContent
      (const AObj: TftInputLocationMessageContent): String;
    function ParseInputMedia(const AObj: TftInputMedia): String;
    function ParseInputMediaAnimation(const AObj
      : TftInputMediaAnimation): String;
    function ParseInputMediaAudio(const AObj: TftInputMediaAudio): String;
    function ParseInputMediaDocument(const AObj: TftInputMediaDocument): String;
    function ParseInputMediaPhoto(const AObj: TftInputMediaPhoto): String;
    function ParseInputMediaVideo(const AObj: TftInputMediaVideo): String;
    function ParseInputMessageContent(const AObj
      : TftInputMessageContent): String;
    function ParseInputTextMessageContent(const AObj
      : TftInputTextMessageContent): String;
    function ParseInputVenueMessageContent(const AObj
      : TftInputVenueMessageContent): String;
    function ParseInvoice(const AObj: TftInvoice): String;
    function ParseJson(AServerResponse: String): TJSONObject;
    function ParseJsonAndGetList(AParseFunc: TJsonToFtTypeFunc;
      AJSONObject: TJSONObject): TList;
    function ParseKeyboardButton(const AObj: TftKeyboardButton): String;
    function ParseKeyboardButtonPollType(const AObj
      : TftKeyboardButtonPollType): String;
    function ParseLabeledPrice(const AObj: TftLabeledPrice): String;
    function ParseList(const AObj: TList): String;
    function ParseLocation(const AObj: TftLocation): String;
    function ParseLoginUrl(const AObj: TftLoginUrl): String;
    function ParseMaskPosition(const AObj: TftMaskPosition): String;
    function ParseMenuButton(const AObj: TftMenuButton): String;
    function ParseMenuButtonCommands(const AObj: TftMenuButtonCommands): String;
    function ParseMenuButtonDefault(const AObj: TftMenuButtonDefault): String;
    function ParseMenuButtonWebApp(const AObj: TftMenuButtonWebApp): String;
    function ParseMessage(const AObj: TftMessage): String;
    function ParseMessageAutoDeleteTimerChanged
      (const AObj: TftMessageAutoDeleteTimerChanged): String;
    function ParseMessageEntity(const AObj: TftMessageEntity): String;
    function ParseMessageId(const AObj: TftMessageId): String;
    function ParseOrderInfo(const AObj: TftOrderInfo): String;
    function ParsePassportData(const AObj: TftPassportData): String;
    function ParsePassportElementError(const AObj
      : TftPassportElementError): String;
    function ParsePassportElementErrorDataField
      (const AObj: TftPassportElementErrorDataField): String;
    function ParsePassportElementErrorFile(const AObj
      : TftPassportElementErrorFile): String;
    function ParsePassportElementErrorFiles(const AObj
      : TftPassportElementErrorFiles): String;
    function ParsePassportElementErrorFrontSide
      (const AObj: TftPassportElementErrorFrontSide): String;
    function ParsePassportElementErrorReverseSide
      (const AObj: TftPassportElementErrorReverseSide): String;
    function ParsePassportElementErrorSelfie(const AObj
      : TftPassportElementErrorSelfie): String;
    function ParsePassportElementErrorTranslationFile
      (const AObj: TftPassportElementErrorTranslationFile): String;
    function ParsePassportElementErrorTranslationFiles
      (const AObj: TftPassportElementErrorTranslationFiles): String;
    function ParsePassportElementErrorUnspecified
      (const AObj: TftPassportElementErrorUnspecified): String;
    function ParsePassportFile(const AObj: TftPassportFile): String;
    function ParsePhotoSize(const AObj: TftPhotoSize): String;
    function ParsePoll(const AObj: TftPoll): String;
    function ParsePollAnswer(const AObj: TftPollAnswer): String;
    function ParsePollOption(const AObj: TftPollOption): String;
    function ParsePreCheckoutQuery(const AObj: TftPreCheckoutQuery): String;
    function ParseProximityAlertTriggered(const AObj
      : TftProximityAlertTriggered): String;
    function ParseReplyBase(const AObj: TftReplyBase): String;
    function ParseReplyKeyboardMarkup(const AObj
      : TftReplyKeyboardMarkup): String;
    function ParseReplyKeyboardRemove(const AObj
      : TftReplyKeyboardRemove): String;
    function ParseResponseParameters(const AObj: TftResponseParameters): String;
    function ParseSentWebAppMessage(const AObj: TftSentWebAppMessage): String;
    function ParseShippingAddress(const AObj: TftShippingAddress): String;
    function ParseShippingOption(const AObj: TftShippingOption): String;
    function ParseShippingQuery(const AObj: TftShippingQuery): String;
    function ParseSticker(const AObj: TftSticker): String;
    function ParseStickerSet(const AObj: TftStickerSet): String;
    function ParseStrings(const AObj: TStrings): String;
    function ParseSuccessfulPayment(const AObj: TftSuccessfulPayment): String;
    function ParseUpdate(const AObj: TftUpdate): String;
    function ParseUser(const AObj: TftUser): String;
    function ParseUserProfilePhotos(const AObj: TftUserProfilePhotos): String;
    function ParseVenue(const AObj: TftVenue): String;
    function ParseVideo(const AObj: TftVideo): String;
    function ParseVideoChatEnded(const AObj: TftVideoChatEnded): String;
    function ParseVideoChatParticipantsInvited
      (const AObj: TftVideoChatParticipantsInvited): String;
    function ParseVideoChatScheduled(const AObj: TftVideoChatScheduled): String;
    function ParseVideoChatStarted(const AObj: TftVideoChatStarted): String;
    function ParseVideoNote(const AObj: TftVideoNote): String;
    function ParseVoice(const AObj: TftVoice): String;
    function ParseWebAppData(const AObj: TftWebAppData): String;
    function ParseWebAppInfo(const AObj: TftWebAppInfo): String;
    function ParseWebhookInfo(const AObj: TftWebhookInfo): String;
    function ParseWriteAccessAllowed(const AObj: TftWriteAccessAllowed): String;

    /// ParseJson functions
    function ParseJsonAndGetAnimation(const AData: TJSONObject): TftAnimation;
    function ParseJsonAndGetAudio(const AData: TJSONObject): TftAudio;
    function ParseJsonAndGetBotCommand(const AData: TJSONObject): TftBotCommand;
    function ParseJsonAndGetBotCommandScope(const AData: TJSONObject)
      : TftBotCommandScope;
    function ParseJsonAndGetBotCommandScopeAllChatAdministrators
      (const AData: TJSONObject): TftBotCommandScopeAllChatAdministrators;
    function ParseJsonAndGetBotCommandScopeAllGroupChats
      (const AData: TJSONObject): TftBotCommandScopeAllGroupChats;
    function ParseJsonAndGetBotCommandScopeAllPrivateChats
      (const AData: TJSONObject): TftBotCommandScopeAllPrivateChats;
    function ParseJsonAndGetBotCommandScopeChat(const AData: TJSONObject)
      : TftBotCommandScopeChat;
    function ParseJsonAndGetBotCommandScopeChatAdministrators
      (const AData: TJSONObject): TftBotCommandScopeChatAdministrators;
    function ParseJsonAndGetBotCommandScopeChatMember(const AData: TJSONObject)
      : TftBotCommandScopeChatMember;
    function ParseJsonAndGetBotCommandScopeDefault(const AData: TJSONObject)
      : TftBotCommandScopeDefault;
    function ParseJsonAndGetCallbackGame(const AData: TJSONObject)
      : TftCallbackGame;
    function ParseJsonAndGetCallbackQuery(const AData: TJSONObject)
      : TftCallbackQuery;
    function ParseJsonAndGetChat(const AData: TJSONObject): TftChat;
    function ParseJsonAndGetChatAdministratorRights(const AData: TJSONObject)
      : TftChatAdministratorRights;
    function ParseJsonAndGetChatInviteLink(const AData: TJSONObject)
      : TftChatInviteLink;
    function ParseJsonAndGetChatJoinRequest(const AData: TJSONObject)
      : TftChatJoinRequest;
    function ParseJsonAndGetChatLocation(const AData: TJSONObject)
      : TftChatLocation;
    function ParseJsonAndGetChatMember(const AData: TJSONObject): TftChatMember;
    function ParseJsonAndGetChatMemberAdministrator(const AData: TJSONObject)
      : TftChatMemberAdministrator;
    function ParseJsonAndGetChatMemberBanned(const AData: TJSONObject)
      : TftChatMemberBanned;
    function ParseJsonAndGetChatMemberLeft(const AData: TJSONObject)
      : TftChatMemberLeft;
    function ParseJsonAndGetChatMemberOwner(const AData: TJSONObject)
      : TftChatMemberOwner;
    function ParseJsonAndGetChatMemberRestricted(const AData: TJSONObject)
      : TftChatMemberRestricted;
    function ParseJsonAndGetChatMemberUpdated(const AData: TJSONObject)
      : TftChatMemberUpdated;
    function ParseJsonAndGetChatPermissions(const AData: TJSONObject)
      : TftChatPermissions;
    function ParseJsonAndGetChatPhoto(const AData: TJSONObject): TftChatPhoto;
    function ParseJsonAndGetChosenInlineResult(const AData: TJSONObject)
      : TftChosenInlineResult;
    function ParseJsonAndGetContact(const AData: TJSONObject): TftContact;
    function ParseJsonAndGetDice(const AData: TJSONObject): TftDice;
    function ParseJsonAndGetDocument(const AData: TJSONObject): TftDocument;
    function ParseJsonAndGetEncryptedCredentials(const AData: TJSONObject)
      : TftEncryptedCredentials;
    function ParseJsonAndGetEncryptedPassportElement(const AData: TJSONObject)
      : TftEncryptedPassportElement;
    function ParseJsonAndGetFile(const AData: TJSONObject): TftFile;
    function ParseJsonAndGetForceReply(const AData: TJSONObject): TftForceReply;
    function ParseJsonAndGetForumTopic(const AData: TJSONObject): TftForumTopic;
    function ParseJsonAndGetForumTopicClosed(const AData: TJSONObject)
      : TftForumTopicClosed;
    function ParseJsonAndGetForumTopicCreated(const AData: TJSONObject)
      : TftForumTopicCreated;
    function ParseJsonAndGetForumTopicEdited(const AData: TJSONObject)
      : TftForumTopicEdited;
    function ParseJsonAndGetForumTopicReopened(const AData: TJSONObject)
      : TftForumTopicReopened;
    function ParseJsonAndGetGeneralForumTopicHidden(const AData: TJSONObject)
      : TftGeneralForumTopicHidden;
    function ParseJsonAndGetGeneralForumTopicUnhidden(const AData: TJSONObject)
      : TftGeneralForumTopicUnhidden;
    function ParseJsonAndGetGame(const AData: TJSONObject): TftGame;
    function ParseJsonAndGetGameHighScore(const AData: TJSONObject)
      : TftGameHighScore;
    function ParseJsonAndGetInlineKeyboardButton(const AData: TJSONObject)
      : TftInlineKeyboardButton;
    function ParseJsonAndGetInlineKeyboardMarkup(const AData: TJSONObject)
      : TftInlineKeyboardMarkup;
    function ParseJsonAndGetInlineQuery(const AData: TJSONObject)
      : TftInlineQuery;
    function ParseJsonAndGetInlineQueryResult(const AData: TJSONObject)
      : TftInlineQueryResult;
    function ParseJsonAndGetInlineQueryResultAudio(const AData: TJSONObject)
      : TftInlineQueryResultAudio;
    function ParseJsonAndGetInlineQueryResultCachedAudio
      (const AData: TJSONObject): TftInlineQueryResultCachedAudio;
    function ParseJsonAndGetInlineQueryResultCachedDocument
      (const AData: TJSONObject): TftInlineQueryResultCachedDocument;
    function ParseJsonAndGetInlineQueryResultCachedGif(const AData: TJSONObject)
      : TftInlineQueryResultCachedGif;
    function ParseJsonAndGetInlineQueryResultCachedMpeg4Gif
      (const AData: TJSONObject): TftInlineQueryResultCachedMpeg4Gif;
    function ParseJsonAndGetInlineQueryResultCachedPhoto
      (const AData: TJSONObject): TftInlineQueryResultCachedPhoto;
    function ParseJsonAndGetInlineQueryResultCachedSticker
      (const AData: TJSONObject): TftInlineQueryResultCachedSticker;
    function ParseJsonAndGetInlineQueryResultCachedVideo
      (const AData: TJSONObject): TftInlineQueryResultCachedVideo;
    function ParseJsonAndGetInlineQueryResultCachedVoice
      (const AData: TJSONObject): TftInlineQueryResultCachedVoice;
    function ParseJsonAndGetInlineQueryResultContact(const AData: TJSONObject)
      : TftInlineQueryResultContact;
    function ParseJsonAndGetInlineQueryResultDocument(const AData: TJSONObject)
      : TftInlineQueryResultDocument;
    function ParseJsonAndGetInlineQueryResultGame(const AData: TJSONObject)
      : TftInlineQueryResultGame;
    function ParseJsonAndGetInlineQueryResultGif(const AData: TJSONObject)
      : TftInlineQueryResultGif;
    function ParseJsonAndGetInlineQueryResultLocation(const AData: TJSONObject)
      : TftInlineQueryResultLocation;
    function ParseJsonAndGetInlineQueryResultMpeg4Gif(const AData: TJSONObject)
      : TftInlineQueryResultMpeg4Gif;
    function ParseJsonAndGetInlineQueryResultPhoto(const AData: TJSONObject)
      : TftInlineQueryResultPhoto;
    function ParseJsonAndGetInlineQueryResultVenue(const AData: TJSONObject)
      : TftInlineQueryResultVenue;
    function ParseJsonAndGetInlineQueryResultVideo(const AData: TJSONObject)
      : TftInlineQueryResultVideo;
    function ParseJsonAndGetInlineQueryResultVoice(const AData: TJSONObject)
      : TftInlineQueryResultVoice;
    function ParseJsonAndGetInputFile(const AData: TJSONObject): TftInputFile;
    function ParseJsonAndGetInputContactMessageContent(const AData: TJSONObject)
      : TftInputContactMessageContent;
    function ParseJsonAndGetInputLocationMessageContent
      (const AData: TJSONObject): TftInputLocationMessageContent;
    function ParseJsonAndGetInputMedia(const AData: TJSONObject): TftInputMedia;
    function ParseJsonAndGetInputMediaAnimation(const AData: TJSONObject)
      : TftInputMediaAnimation;
    function ParseJsonAndGetInputMediaAudio(const AData: TJSONObject)
      : TftInputMediaAudio;
    function ParseJsonAndGetInputMediaDocument(const AData: TJSONObject)
      : TftInputMediaDocument;
    function ParseJsonAndGetInputMediaPhoto(const AData: TJSONObject)
      : TftInputMediaPhoto;
    function ParseJsonAndGetInputMediaVideo(const AData: TJSONObject)
      : TftInputMediaVideo;
    function ParseJsonAndGetInputMessageContent(const AData: TJSONObject)
      : TftInputMessageContent;
    function ParseJsonAndGetInputTextMessageContent(const AData: TJSONObject)
      : TftInputTextMessageContent;
    function ParseJsonAndGetInputVenueMessageContent(const AData: TJSONObject)
      : TftInputVenueMessageContent;
    function ParseJsonAndGetInvoice(const AData: TJSONObject): TftInvoice;
    function ParseJsonAndGetKeyboardButton(const AData: TJSONObject)
      : TftKeyboardButton;
    function ParseJsonAndGetKeyboardButtonPollType(const AData: TJSONObject)
      : TftKeyboardButtonPollType;
    function ParseJsonAndGetLabeledPrice(const AData: TJSONObject)
      : TftLabeledPrice;
    function ParseJsonAndGetLocation(const AData: TJSONObject): TftLocation;
    function ParseJsonAndGetLoginUrl(const AData: TJSONObject): TftLoginUrl;
    function ParseJsonAndGetMaskPosition(const AData: TJSONObject)
      : TftMaskPosition;
    function ParseJsonAndGetMenuButton(const AData: TJSONObject): TftMenuButton;
    function ParseJsonAndGetMenuButtonCommands(const AData: TJSONObject)
      : TftMenuButtonCommands;
    function ParseJsonAndGetMenuButtonDefault(const AData: TJSONObject)
      : TftMenuButtonDefault;
    function ParseJsonAndGetMenuButtonWebApp(const AData: TJSONObject)
      : TftMenuButtonWebApp;
    function ParseJsonAndGetMessage(const AData: TJSONObject): TftMessage;
    function ParseJsonAndGetMessageAutoDeleteTimerChanged
      (const AData: TJSONObject): TftMessageAutoDeleteTimerChanged;
    function ParseJsonAndGetMessageEntity(const AData: TJSONObject)
      : TftMessageEntity;
    function ParseJsonAndGetMessageId(const AData: TJSONObject): TftMessageId;
    function ParseJsonAndGetOrderInfo(const AData: TJSONObject): TftOrderInfo;
    function ParseJsonAndGetPassportData(const AData: TJSONObject)
      : TftPassportData;
    function ParseJsonAndGetPassportElementError(const AData: TJSONObject)
      : TftPassportElementError;
    function ParseJsonAndGetPassportElementErrorDataField
      (const AData: TJSONObject): TftPassportElementErrorDataField;
    function ParseJsonAndGetPassportElementErrorFile(const AData: TJSONObject)
      : TftPassportElementErrorFile;
    function ParseJsonAndGetPassportElementErrorFiles(const AData: TJSONObject)
      : TftPassportElementErrorFiles;
    function ParseJsonAndGetPassportElementErrorFrontSide
      (const AData: TJSONObject): TftPassportElementErrorFrontSide;
    function ParseJsonAndGetPassportElementErrorReverseSide
      (const AData: TJSONObject): TftPassportElementErrorReverseSide;
    function ParseJsonAndGetPassportElementErrorSelfie(const AData: TJSONObject)
      : TftPassportElementErrorSelfie;
    function ParseJsonAndGetPassportElementErrorTranslationFile
      (const AData: TJSONObject): TftPassportElementErrorTranslationFile;
    function ParseJsonAndGetPassportElementErrorTranslationFiles
      (const AData: TJSONObject): TftPassportElementErrorTranslationFiles;
    function ParseJsonAndGetPassportElementErrorUnspecified
      (const AData: TJSONObject): TftPassportElementErrorUnspecified;
    function ParseJsonAndGetPassportFile(const AData: TJSONObject)
      : TftPassportFile;
    function ParseJsonAndPhotoSize(const AData: TJSONObject): TftPhotoSize;
    function ParseJsonAndGetPoll(const AData: TJSONObject): TftPoll;
    function ParseJsonAndGetPollOption(const AData: TJSONObject): TftPollOption;
    function ParseJsonAndGetPreCheckoutQuery(const AData: TJSONObject)
      : TftPreCheckoutQuery;
    function ParseJsonAndGetProximityAlertTriggered(const AData: TJSONObject)
      : TftProximityAlertTriggered;
    function ParseJsonAndGetReplyBase(const AData: TJSONObject): TftReplyBase;
    function ParseJsonAndGetReplyKeyboardMarkup(const AData: TJSONObject)
      : TftReplyKeyboardMarkup;
    function ParseJsonAndGetReplyKeyboardRemove(const AData: TJSONObject)
      : TftReplyKeyboardRemove;
    function ParseJsonAndGetResponseParameters(const AData: TJSONObject)
      : TftResponseParameters;
    function ParseJsonAndGetSentWebAppMessage(const AData: TJSONObject)
      : TftSentWebAppMessage;
    function ParseJsonAndGetShippingAddress(const AData: TJSONObject)
      : TftShippingAddress;
    function ParseJsonAndGetShippingOption(const AData: TJSONObject)
      : TftShippingOption;
    function ParseJsonAndGetShippingQuery(const AData: TJSONObject)
      : TftShippingQuery;
    function ParseJsonAndGetSticker(const AData: TJSONObject): TftSticker;
    function ParseJsonAndGetStickerSet(const AData: TJSONObject): TftStickerSet;
    function ParseJsonAndGetSuccessfulPayment(const AData: TJSONObject)
      : TftSuccessfulPayment;
    function ParseJsonAndGetUpdate(const AData: TJSONObject): TftUpdate;
    function ParseJsonAndGetUser(const AData: TJSONObject): TftUser;
    function ParseJsonAndGetUserProfilePhotos(const AData: TJSONObject)
      : TftUserProfilePhotos;
    function ParseJsonAndGetVenue(const AData: TJSONObject): TftVenue;
    function ParseJsonAndGetVideo(const AData: TJSONObject): TftVideo;
    function ParseJsonAndGetVideoChatEnded(const AData: TJSONObject)
      : TftVideoChatEnded;
    function ParseJsonAndGetVideoChatParticipantsInvited
      (const AData: TJSONObject): TftVideoChatParticipantsInvited;
    function ParseJsonAndGetVideoChatScheduled(const AData: TJSONObject)
      : TftVideoChatScheduled;
    function ParseJsonAndGetVideoChatStarted(const AData: TJSONObject)
      : TftVideoChatStarted;
    function ParseJsonAndGetVideoNote(const AData: TJSONObject): TftVideoNote;
    function ParseJsonAndGetVoice(const AData: TJSONObject): TftVoice;
    function ParseJsonAndGetWebAppData(const AData: TJSONObject): TftWebAppData;
    function ParseJsonAndGetWebAppInfo(const AData: TJSONObject): TftWebAppInfo;
    function ParseJsonAndGetWebhookInfo(const AData: TJSONObject)
      : TftWebhookInfo;
    function ParseJsonAndGetWriteAccessAllowed(const AData: TJSONObject)
      : TftWriteAccessAllowed;
  end;

implementation

{ TftTypeParser }

procedure TftTypeParser.AppendToJson(var AJSON: String; const AVarName: String;
  const AValue: Variant);
var
  LBasicType: Integer;
begin
  if (VarToStr(AValue) = '') then
    Exit;
  LBasicType := VarType(AValue) and VarTypeMask;
  AJSON := AJSON + '"';
  AJSON := AJSON + AVarName;
  AJSON := AJSON + '":';
  case LBasicType of
    varBoolean:
      AJSON := AJSON + LowerCase(VarToStr(AValue));
    varInteger:
      AJSON := AJSON + VarToStr(AValue);
    varDouble:
      AJSON := AJSON + VarToStr(AValue);
    varString:
      begin
        if (VarToStr(AValue)[1] <> '{') then
        begin
          AJSON := AJSON + '"';
        end;
        AJSON := AJSON + VarToStr(AValue);
        if (VarToStr(AValue)[Length(AValue)] <> '}') then
        begin
          AJSON := AJSON + '"';
        end;
      end;
    varUString:
      begin
        if (VarToStr(AValue)[1] <> '{') then
        begin
          AJSON := AJSON + '"';
        end;
        AJSON := AJSON + VarToStr(AValue);
        if (VarToStr(AValue)[Length(AValue)] <> '}') then
        begin
          AJSON := AJSON + '"';
        end;
      end;
  end;
  AJSON := AJSON + ',';
end;

constructor TftTypeParser.Create;
begin
  // TODO
end;

destructor TftTypeParser.Destroy;
begin
  inherited;
end;

function TftTypeParser.ParseAnimation(const AObj: TftAnimation): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'width', AObj.Width);
  AppendToJson(Result, 'height', AObj.Height);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  AppendToJson(Result, 'file_name', AObj.FileName);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseAudio(const AObj: TftAudio): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseBotCommand(const AObj: TftBotCommand): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'command', AObj.Command);
  AppendToJson(Result, 'description', AObj.Description);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseBotCommandScope(const AObj
  : TftBotCommandScope): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'type', AObj.Type_S);

  if (AObj is TftBotCommandScopeDefault) then
  begin
    Result := Result + ParseBotCommandScopeDefault
      (TftBotCommandScopeDefault(AObj));
  end
  else if (AObj is TftBotCommandScopeAllPrivateChats) then
  begin
    Result := Result + ParseBotCommandScopeAllPrivateChats
      (TftBotCommandScopeAllPrivateChats(AObj));
  end
  else if (AObj is TftBotCommandScopeAllGroupChats) then
  begin
    Result := Result + ParseBotCommandScopeAllGroupChats
      (TftBotCommandScopeAllGroupChats(AObj));
  end
  else if (AObj is TftBotCommandScopeAllChatAdministrators) then
  begin
    Result := Result + ParseBotCommandScopeAllChatAdministrators
      (TftBotCommandScopeAllChatAdministrators(AObj));
  end
  else if (AObj is TftBotCommandScopeChat) then
  begin
    Result := Result + ParseBotCommandScopeChat(TftBotCommandScopeChat(AObj));
  end
  else if (AObj is TftBotCommandScopeChatAdministrators) then
  begin
    Result := Result + ParseBotCommandScopeChatAdministrators
      (TftBotCommandScopeChatAdministrators(AObj));
  end
  else if (AObj is TftBotCommandScopeChatMember) then
  begin
    Result := Result + ParseBotCommandScopeChatMember
      (TftBotCommandScopeChatMember(AObj));
  end;

  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseBotCommandScopeAllChatAdministrators
  (const AObj: TftBotCommandScopeAllChatAdministrators): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseBotCommandScopeAllGroupChats
  (const AObj: TftBotCommandScopeAllGroupChats): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseBotCommandScopeAllPrivateChats
  (const AObj: TftBotCommandScopeAllPrivateChats): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseBotCommandScopeChat
  (const AObj: TftBotCommandScopeChat): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'chat_id', AObj.ChatId);
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseBotCommandScopeChatAdministrators
  (const AObj: TftBotCommandScopeChatAdministrators): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'chat_id', AObj.ChatId);
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseBotCommandScopeChatMember
  (const AObj: TftBotCommandScopeChatMember): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'chat_id', AObj.ChatId);
  AppendToJson(Result, 'user_id', AObj.UserId);
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseBotCommandScopeDefault
  (const AObj: TftBotCommandScopeDefault): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseBotCommandScope(), so I don't add
  // curly brackets to the result String.
  // The last comma will be erased by ParseBotCommandScope().
  Result := '';
end;

function TftTypeParser.ParseCallbackGame(const AObj: TftCallbackGame): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '}';
end;

function TftTypeParser.ParseCallbackQuery(const AObj: TftCallbackQuery): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  AppendToJson(Result, 'from', ParseUser(AObj.From));
  AppendToJson(Result, 'message', ParseMessage(AObj.Message));
  AppendToJson(Result, 'inline_message_id', AObj.InlineMessageId);
  AppendToJson(Result, 'chat_instance', AObj.ChatInstance);
  AppendToJson(Result, 'game_short_name', AObj.GameShortName);
  AppendToJson(Result, 'data', AObj.Data);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChat(const AObj: TftChat): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  if (AObj.TypeChat = TftChatType.ftcPrivate) then
    AppendToJson(Result, 'type', 'private')
  else if (AObj.TypeChat = TftChatType.ftcGroup) then
    AppendToJson(Result, 'type', 'group')
  else if (AObj.TypeChat = TftChatType.ftcSupergroup) then
    AppendToJson(Result, 'type', 'supergroup')
  else if (AObj.TypeChat = TftChatType.ftcChannel) then
    AppendToJson(Result, 'type', 'channel');
  AppendToJson(Result, 'title', AObj.Title);
  AppendToJson(Result, 'username', AObj.UserName);
  AppendToJson(Result, 'first_name', AObj.FirstName);
  AppendToJson(Result, 'last_name', AObj.LastName);
  AppendToJson(Result, 'is_forum', AObj.IsForum);
  AppendToJson(Result, 'photo', ParseChatPhoto(AObj.photo));
  AppendToJson(Result, 'active_usernames',
    ParseList(TList(AObj.ActiveUsernames)));
  AppendToJson(Result, 'emoji_status_custom_emoji_id',
    AObj.EmojiStatusCustomEmojiId);
  AppendToJson(Result, 'bio', AObj.bio);
  AppendToJson(Result, 'has_private_forwards', AObj.HasPrivateForwards);
  AppendToJson(Result, 'has_restricted_voice_and_video_messages',
    AObj.HasRestrictedVoiceAndVideoMessages);
  AppendToJson(Result, 'join_to_send_messages', AObj.JoinToSendMessages);
  AppendToJson(Result, 'join_by_request', AObj.JoinByRequest);
  AppendToJson(Result, 'description', AObj.Description);
  AppendToJson(Result, 'invite_link', AObj.InviteLink);
  AppendToJson(Result, 'pinned_message', ParseMessage(AObj.PinnedMessage));
  AppendToJson(Result, 'permissions', ParseChatPermissions(AObj.Permissions));
  AppendToJson(Result, 'slow_mode_delay', AObj.SlowModeDelay);
  AppendToJson(Result, 'message_auto_delete_time', AObj.MessageAutoDeleteTime);
  AppendToJson(Result, 'has_aggressive_anti_spam_enabled',
    AObj.HasAggressiveAntiSpamEnabled);
  AppendToJson(Result, 'has_hidden_members', AObj.HasHiddenMembers);
  AppendToJson(Result, 'has_protected_content', AObj.HasProtectedContent);
  AppendToJson(Result, 'sticker_set_name', AObj.StickerSetName);
  AppendToJson(Result, 'can_set_sticker_set', AObj.CanSetStickerSet);
  AppendToJson(Result, 'linked_chat_id', AObj.LinkedChatId);
  AppendToJson(Result, 'location', ParseChatLocation(AObj.Location));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatAdministratorRights
  (const AObj: TftChatAdministratorRights): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'is_anonymous', AObj.IsAnonymous);
  AppendToJson(Result, 'can_manage_chat', AObj.CanManageChat);
  AppendToJson(Result, 'can_delete_messages', AObj.CanDeleteMessages);
  AppendToJson(Result, 'can_manage_video_chats', AObj.CanManageVideoChats);
  AppendToJson(Result, 'can_restrict_members', AObj.CanRestriCtMembers);
  AppendToJson(Result, 'can_promote_members', AObj.CanPromoteMembers);
  AppendToJson(Result, 'can_change_info', AObj.CanChangeInfo);
  AppendToJson(Result, 'can_invite_users', AObj.CanInviteUsers);
  AppendToJson(Result, 'can_post_messages', AObj.CanPostMessages);
  AppendToJson(Result, 'can_edit_messages', AObj.CanEditMessages);
  AppendToJson(Result, 'can_pin_messages', AObj.CanPinMessages);
  AppendToJson(Result, 'can_manage_topics', AObj.CanManageTopics);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatInviteLink(const AObj
  : TftChatInviteLink): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'invite_link', AObj.InviteLink);
  AppendToJson(Result, 'creator', ParseUser(AObj.creator));
  AppendToJson(Result, 'creates_join_request', AObj.createsJoinRequest);
  AppendToJson(Result, 'is_primary', AObj.isPrimary);
  AppendToJson(Result, 'is_revoked', AObj.isRevoked);
  AppendToJson(Result, 'name', AObj.name);
  AppendToJson(Result, 'expire_date', AObj.expireDate);
  AppendToJson(Result, 'member_limit', AObj.memberLimit);
  AppendToJson(Result, 'pending_join_request_count',
    AObj.pendingJoinRequestCount);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatJoinRequest(const AObj
  : TftChatJoinRequest): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'chat', ParseChat(AObj.chat));
  AppendToJson(Result, 'from', ParseUser(AObj.From));
  AppendToJson(Result, 'date', AObj.date);
  AppendToJson(Result, 'bio', AObj.bio);
  AppendToJson(Result, 'invite_link', ParseChatInviteLink(AObj.InviteLink));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatLocation(const AObj: TftChatLocation): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'location', ParseLocation(AObj.Location));
  AppendToJson(Result, 'address', AObj.address);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatMember(const AObj: TftChatMember): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'status', AObj.StatuS);
  AppendToJson(Result, 'user', ParseUser(AObj.User));
  if (AObj.StatuS = ChatMemberOwnerSTATUS) then
  begin
    Result := Result + ParseChatMemberOwner(TftChatMemberOwner(AObj));
  end
  else if (AObj.StatuS = ChatMemberAdministratorSTATUS) then
  begin
    Result := Result + ParseChatMemberAdministrator
      (TftChatMemberAdministrator(AObj));
  end
  else if (AObj.StatuS = ChatMemberMemberSTATUS) then
  begin
    Result := Result + ParseChatMemberMember(TftChatMemberMember(AObj));
  end
  else if (AObj.StatuS = ChatMemberRestrictedSTATUS) then
  begin
    Result := Result + ParseChatMemberRestricted(TftChatMemberRestricted(AObj));
  end
  else if (AObj.StatuS = ChatMemberLeftSTATUS) then
  begin
    Result := Result + ParseChatMemberLeft(TftChatMemberLeft(AObj));
  end
  else if (AObj.StatuS = ChatMemberBannedSTATUS) then
  begin
    Result := Result + ParseChatMemberBanned(TftChatMemberBanned(AObj));
  end;

  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatMemberAdministrator
  (const AObj: TftChatMemberAdministrator): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'can_be_edited', AObj.canBeEdited);
  AppendToJson(Result, 'is_anonymous', AObj.IsAnonymous);
  AppendToJson(Result, 'can_manage_chat', AObj.CanManageChat);
  AppendToJson(Result, 'can_delete_messages', AObj.CanDeleteMessages);
  AppendToJson(Result, 'can_manage_video_chats', AObj.CanManageVideoChats);
  AppendToJson(Result, 'can_restrict_members', AObj.CanRestriCtMembers);
  AppendToJson(Result, 'can_promote_members', AObj.CanPromoteMembers);
  AppendToJson(Result, 'can_change_info', AObj.CanChangeInfo);
  AppendToJson(Result, 'can_invite_users', AObj.CanInviteUsers);
  AppendToJson(Result, 'can_post_messages', AObj.CanPostMessages);
  AppendToJson(Result, 'can_edit_messages', AObj.CanEditMessages);
  AppendToJson(Result, 'can_pin_messages', AObj.CanPinMessages);
  AppendToJson(Result, 'can_manage_topics', AObj.CanManageTopics);
  AppendToJson(Result, 'custom_title', AObj.customTitle);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatMemberBanned(const AObj
  : TftChatMemberBanned): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseChatMember(), so I don't add
  // curly brackets to the result String.
  Result := '';
  AppendToJson(Result, 'until_date', AObj.untilDate);
  // The last comma will be erased by ParseChatMember().
end;

function TftTypeParser.ParseChatMemberLeft(const AObj
  : TftChatMemberLeft): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseChatMember(), so I don't add
  // curly brackets to the result String.
  Result := '';
  // The last comma will be erased by ParseChatMember().
end;

function TftTypeParser.ParseChatMemberMember(const AObj
  : TftChatMemberMember): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseChatMember(), so I don't add
  // curly brackets to the result String.
  Result := '';
  // The last comma will be erased by ParseChatMember().
end;

function TftTypeParser.ParseChatMemberOwner(const AObj
  : TftChatMemberOwner): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseChatMember(), so I don't add
  // curly brackets to the result String.
  Result := '';
  AppendToJson(Result, 'custom_title', AObj.customTitle);
  AppendToJson(Result, 'is_anonymous', AObj.IsAnonymous);
  // The last comma will be erased by ParseChatMember().
end;

function TftTypeParser.ParseChatMemberRestricted
  (const AObj: TftChatMemberRestricted): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by ParseChatMember(), so I don't add
  // curly brackets to the result String.
  Result := '';
  AppendToJson(Result, 'is_member', AObj.isMember);
  AppendToJson(Result, 'can_change_info', AObj.CanChangeInfo);
  AppendToJson(Result, 'can_invite_users', AObj.CanInviteUsers);
  AppendToJson(Result, 'can_pin_messages', AObj.CanPinMessages);
  AppendToJson(Result, 'can_manage_topics', AObj.CanManageTopics);
  AppendToJson(Result, 'can_send_messages', AObj.canSendMessages);
  AppendToJson(Result, 'can_send_media_messages', AObj.canSendMediaMessages);
  AppendToJson(Result, 'can_send_polls', AObj.canSendPolls);
  AppendToJson(Result, 'can_send_other_messages', AObj.canSendOtherMessages);
  AppendToJson(Result, 'can_add_web_page_previews', AObj.canAddWebPagePreviews);
  AppendToJson(Result, 'until_date', AObj.untilDate);
  // The last comma will be erased by ParseChatMember().
end;

function TftTypeParser.ParseChatMemberUpdated
  (const AObj: TftChatMemberUpdated): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'chat', ParseChat(AObj.chat));
  AppendToJson(Result, 'from', ParseUser(AObj.From));
  AppendToJson(Result, 'date', AObj.date);
  AppendToJson(Result, 'old_chat_member', ParseChatMember(AObj.oldChatMember));
  AppendToJson(Result, 'new_chat_member', ParseChatMember(AObj.newChatMember));
  AppendToJson(Result, 'invite_link', ParseChatInviteLink(AObj.InviteLink));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatPermissions(const AObj
  : TftChatPermissions): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'can_send_messages', AObj.canSendMessages);
  AppendToJson(Result, 'can_send_media_messages', AObj.canSendMediaMessages);
  AppendToJson(Result, 'can_send_polls', AObj.canSendPolls);
  AppendToJson(Result, 'can_send_other_messages', AObj.canSendOtherMessages);
  AppendToJson(Result, 'can_add_web_page_previews', AObj.canAddWebPagePreviews);
  AppendToJson(Result, 'can_change_info', AObj.CanChangeInfo);
  AppendToJson(Result, 'can_invite_users', AObj.CanInviteUsers);
  AppendToJson(Result, 'can_pin_messages', AObj.CanPinMessages);
  AppendToJson(Result, 'can_manage_topics', AObj.CanManageTopics);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChatPhoto(const AObj: TftChatPhoto): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'small_file_id', AObj.SmallFileId);
  AppendToJson(Result, 'small_file_unique_id', AObj.SmallFileUniqueId);
  AppendToJson(Result, 'big_file_id', AObj.BigFileId);
  AppendToJson(Result, 'big_file_unique_id', AObj.BigFileUniqueId);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseChosenInlineResult
  (const AObj: TftChosenInlineResult): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'result_id', AObj.ResultId);
  AppendToJson(Result, 'from', ParseUser(AObj.From));
  AppendToJson(Result, 'query', AObj.Query);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseContact(const AObj: TftContact): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'phone_number', AObj.PhoneNumber);
  AppendToJson(Result, 'first_name', AObj.FirstName);
  AppendToJson(Result, 'last_name', AObj.LastName);
  AppendToJson(Result, 'user_id', AObj.UserId);
  AppendToJson(Result, 'vcard', AObj.Vcard);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseDice(const AObj: TftDice): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'emoji', AObj.emoji);
  AppendToJson(Result, 'value', AObj.value);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseDocument(const AObj: TftDocument): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  AppendToJson(Result, 'file_name', AObj.FileName);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseEncryptedCredentials
  (const AObj: TftEncryptedCredentials): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'data', AObj.Data);
  AppendToJson(Result, 'hash', AObj.hash);
  AppendToJson(Result, 'secret', AObj.secret);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseEncryptedPassportElement
  (const AObj: TftEncryptedPassportElement): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'type', AObj.TypeS);
  AppendToJson(Result, 'data', AObj.Data);
  AppendToJson(Result, 'phone_number', AObj.PhoneNumber);
  AppendToJson(Result, 'email', AObj.Email);
  AppendToJson(Result, 'files', ParseList(TList(AObj.Files)));
  AppendToJson(Result, 'front_side', ParsePassportFile(AObj.FrontSide));
  AppendToJson(Result, 'reverse_side', ParsePassportFile(AObj.ReverseSide));
  AppendToJson(Result, 'selfie', ParsePassportFile(AObj.Selfie));
  AppendToJson(Result, 'translation', ParseList(TList(AObj.Translation)));
  AppendToJson(Result, 'hash', AObj.hash);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseFile(const AObj: TftFile): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  AppendToJson(Result, 'file_path', AObj.filePath);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseForceReply(const AObj: TftForceReply): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'force_reply', AObj.ForceReply);
  AppendToJson(Result, 'input_field_placeholder', AObj.InputFieldPlaceholder);
  AppendToJson(Result, 'selective', AObj.Selective);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseForumTopic(const AObj: TftForumTopic): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'message_thread_id', AObj.MessageThreadId);
  AppendToJson(Result, 'name', AObj.name);
  AppendToJson(Result, 'icon_color', AObj.IconColor);
  AppendToJson(Result, 'icon_custom_emoji_id', AObj.IconCustomEmojiId);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseForumTopicClosed(const AObj
  : TftForumTopicClosed): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  Result := Result + '}';
end;

function TftTypeParser.ParseForumTopicCreated
  (const AObj: TftForumTopicCreated): String;
begin

end;

function TftTypeParser.ParseForumTopicEdited(const AObj
  : TftForumTopicEdited): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'name', AObj.name);
  AppendToJson(Result, 'icon_custom_emoji_id', AObj.IconCustomEmojiId);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseForumTopicReopened
  (const AObj: TftForumTopicReopened): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  Result := Result + '}';
end;

function TftTypeParser.ParseGame(const AObj: TftGame): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'title', AObj.Title);
  AppendToJson(Result, 'description', AObj.Description);
  AppendToJson(Result, 'photo', ParseList(TList(AObj.photo)));
  AppendToJson(Result, 'text', AObj.Text);
  AppendToJson(Result, 'text_entities', ParseList(TList(AObj.TextEntities)));
  AppendToJson(Result, 'animation', ParseAnimation(AObj.Animation));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseGameHighScore(const AObj: TftGameHighScore): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'position', AObj.Position);
  AppendToJson(Result, 'user', ParseUser(AObj.User));
  AppendToJson(Result, 'score', AObj.Score);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseGeneralForumTopicHidden
  (const AObj: TftGeneralForumTopicHidden): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  Result := Result + '}';
end;

function TftTypeParser.ParseGeneralForumTopicUnhidden
  (const AObj: TftGeneralForumTopicUnhidden): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  Result := Result + '}';
end;

function TftTypeParser.ParseInlineKeyboardButton
  (const AObj: TftInlineKeyboardButton): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'text', AObj.Text);
  AppendToJson(Result, 'url', AObj.Url);
  AppendToJson(Result, 'callback_data', AObj.CallbaCkData);
  AppendToJson(Result, 'web_app', ParseWebAppInfo(AObj.WebApp));
  AppendToJson(Result, 'login_url', ParseLoginUrl(AObj.LoginUrL));
  AppendToJson(Result, 'switch_inline_query', AObj.SwitchInlineQuery);
  AppendToJson(Result, 'switch_inline_query_current_chat',
    AObj.SwitchInlineQueryCurrentChat);
  AppendToJson(Result, 'callback_game', ParseCallbackGame(AObj.CallbackGame));
  AppendToJson(Result, 'pay', AObj.Pay);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseInlineKeyboardMarkup
  (const AObj: TftInlineKeyboardMarkup): String;
var
  I, J: Integer;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '"inline_keyboard":[';
  for I := 0 to AObj.inlineKeyboard.Count - 1 do
  begin
    Result := Result + '[';
    for J := 0 to AObj.inlineKeyboard[I].Count - 1 do
    begin
      Result := Result + ParseInlineKeyboardButton(AObj.inlineKeyboard[I][J]);
      Result := Result + ',';
    end;
    RemoveLastComma(Result);
    Result := Result + '],';
  end;
  if not(AObj.inlineKeyboard = nil) then
    RemoveLastComma(Result);
  Result := Result + ']}';
end;

function TftTypeParser.ParseInlineQuery(const AObj: TftInlineQuery): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  AppendToJson(Result, 'from', ParseUser(AObj.From));
  AppendToJson(Result, 'query', AObj.Query);
  AppendToJson(Result, 'offset', AObj.Offset);
  AppendToJson(Result, 'chat_type', AObj.ChatType);
  AppendToJson(Result, 'location', ParseLocation(AObj.Location));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseInlineQueryResult
  (const AObj: TftInlineQueryResult): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  AppendToJson(Result, 'type', AObj.TypeS);
  AppendToJson(Result, 'reply_markup',
    ParseInlineKeyboardMarkup(AObj.ReplyMarkup));
  if (CompareStr(AObj.TypeS, InlineQueryResultCachedAudioTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedAudio(TftInlineQueryResultCachedAudio(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedDocumentTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedDocument
      (TftInlineQueryResultCachedDocument(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedGifTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedGif(TftInlineQueryResultCachedGif(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedMpeg4GifTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedMpeg4Gif
      (TftInlineQueryResultCachedMpeg4Gif(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedPhotoTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedPhoto(TftInlineQueryResultCachedPhoto(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedStickerTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedSticker
      (TftInlineQueryResultCachedSticker(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedVideoTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedVideo(TftInlineQueryResultCachedVideo(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultCachedVoiceTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultCachedVoice(TftInlineQueryResultCachedVoice(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultArticleTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultArticle(TftInlineQueryResultArticle(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultAudioTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultAudio(TftInlineQueryResultAudio(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultContactTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultContact(TftInlineQueryResultContact(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultGameTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultGame(TftInlineQueryResultGame(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultDocumentTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultDocument(TftInlineQueryResultDocument(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultLocationTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultLocation(TftInlineQueryResultLocation(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultVenueTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultVenue(TftInlineQueryResultVenue(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultVoiceTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultVoice(TftInlineQueryResultVoice(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultPhotoTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultPhoto(TftInlineQueryResultPhoto(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultGifTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultGif(TftInlineQueryResultGif(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultMpeg4GifTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultMpeg4Gif(TftInlineQueryResultMpeg4Gif(AObj)))
  else if (CompareStr(AObj.TypeS, InlineQueryResultVideoTYPE) = 0) then
    Result := Result +
      (ParseInlineQueryResultVideo(TftInlineQueryResultVideo(AObj)));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseInlineQueryResultArticle
  (const AObj: TftInlineQueryResultArticle): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'title', AObj.Title);
  AppendToJson(Result, 'input_message_content',
    ParseInputMessageContent(AObj.InputMessageContent));
  AppendToJson(Result, 'url', AObj.Url);
  AppendToJson(Result, 'hide_url', AObj.HideUrl);
  AppendToJson(Result, 'description', AObj.Description);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'thumb_width', AObj.ThumbWidth);
  AppendToJson(Result, 'thumb_height', AObj.ThumbHeight);
  // The last comma will be erased by ParseInlineQueryResult()
end;

function TftTypeParser.ParseInlineQueryResultAudio
  (const AObj: TftInlineQueryResultAudio): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'audio_url', AObj.AudioUrl);
  AppendToJson(Result, 'performer', AObj.Performer);
  AppendToJson(Result, 'audio_duration', AObj.AudioDuration);
  // The last comma will be erased by ParseInlineQueryResult()
end;

function TftTypeParser.ParseInlineQueryResultCachedAudio
  (const AObj: TftInlineQueryResultCachedAudio): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'audio_file_id', AObj.AudioFileId);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedDocument
  (const AObj: TftInlineQueryResultCachedDocument): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'document_file_id', AObj.DocumentFileId);
  AppendToJson(Result, 'description', AObj.Description);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedGif
  (const AObj: TftInlineQueryResultCachedGif): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'gif_file_id', AObj.GifFileId);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedMpeg4Gif
  (const AObj: TftInlineQueryResultCachedMpeg4Gif): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'mpeg4_file_id', AObj.Mpeg4FileId);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedPhoto
  (const AObj: TftInlineQueryResultCachedPhoto): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'photo_file_id', AObj.PhotoFileId);
  AppendToJson(Result, 'description', AObj.Description);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedSticker
  (const AObj: TftInlineQueryResultCachedSticker): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'sticker_file_id', AObj.StickerFileId);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedVideo
  (const AObj: TftInlineQueryResultCachedVideo): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'video_file_id', AObj.VideoFileId);
  AppendToJson(Result, 'description', AObj.Description);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultCachedVoice
  (const AObj: TftInlineQueryResultCachedVoice): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'voice_file_id', AObj.VoiceFileId);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultContact
  (const AObj: TftInlineQueryResultContact): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'phone_number', AObj.PhoneNumber);
  AppendToJson(Result, 'first_name', AObj.FirstName);
  AppendToJson(Result, 'last_name', AObj.LastName);
  AppendToJson(Result, 'vcard', AObj.Vcard);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'thumb_width', AObj.ThumbWidth);
  AppendToJson(Result, 'thumb_height', AObj.ThumbHeight);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultDocument
  (const AObj: TftInlineQueryResultDocument): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'document_url', AObj.DocumentUrl);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'description', AObj.Description);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'thumb_width', AObj.ThumbWidth);
  AppendToJson(Result, 'thumb_height', AObj.ThumbHeight);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultGame
  (const AObj: TftInlineQueryResultGame): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'game_short_name', AObj.GameShortName);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultGif
  (const AObj: TftInlineQueryResultGif): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'gif_url', AObj.GifUrl);
  AppendToJson(Result, 'gif_width', AObj.GifWidth);
  AppendToJson(Result, 'gif_height', AObj.GifHeight);
  AppendToJson(Result, 'gif_duration', AObj.GifDuration);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultLocation
  (const AObj: TftInlineQueryResultLocation): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'latitude', AObj.Latitude);
  AppendToJson(Result, 'longitude', AObj.Longitude);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'thumb_width', AObj.ThumbWidth);
  AppendToJson(Result, 'thumb_height', AObj.ThumbHeight);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultMpeg4Gif
  (const AObj: TftInlineQueryResultMpeg4Gif): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'mpeg4_url', AObj.Mpeg4Url);
  AppendToJson(Result, 'mpeg4_width', AObj.Mpeg4Width);
  AppendToJson(Result, 'mpeg4_height', AObj.Mpeg4Height);
  AppendToJson(Result, 'mpeg4_duration', AObj.Mpeg4Duration);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultPhoto
  (const AObj: TftInlineQueryResultPhoto): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'photo_url', AObj.PhotoUrl);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'photo_width', AObj.PhotoWidth);
  AppendToJson(Result, 'photo_height', AObj.PhotoHeight);
  AppendToJson(Result, 'description', AObj.Description);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultVenue
  (const AObj: TftInlineQueryResultVenue): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'latitude', AObj.Latitude);
  AppendToJson(Result, 'longitude', AObj.Longitude);
  AppendToJson(Result, 'address', AObj.address);
  AppendToJson(Result, 'foursquare_id', AObj.FoursquareId);
  AppendToJson(Result, 'foursquare_type', AObj.FoursquareType);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'thumb_width', AObj.ThumbWidth);
  AppendToJson(Result, 'thumb_height', AObj.ThumbHeight);
  // The last comma will be erased by ParseInlineQueryResult().egin
end;

function TftTypeParser.ParseInlineQueryResultVideo
  (const AObj: TftInlineQueryResultVideo): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'video_url', AObj.videoUrl);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'thumb_url', AObj.ThumbUrl);
  AppendToJson(Result, 'video_width', AObj.VideoWidth);
  AppendToJson(Result, 'video_height', AObj.VideoHeight);
  AppendToJson(Result, 'video_duration', AObj.VideoDuration);
  AppendToJson(Result, 'description', AObj.Description);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInlineQueryResultVoice
  (const AObj: TftInlineQueryResultVoice): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInlineQueryResult(), so I don't add
  // curly brackets to the result string.
  AppendToJson(Result, 'voice_url', AObj.VoiceUrl);
  AppendToJson(Result, 'voice_duration', AObj.VoiceDuration);
  // The last comma will be erased by ParseInlineQueryResult().
end;

function TftTypeParser.ParseInputContactMessageContent
  (const AObj: TftInputContactMessageContent): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMessageContent()
  AppendToJson(Result, 'phone_number', AObj.PhoneNumber);
  AppendToJson(Result, 'first_name', AObj.FirstName);
  AppendToJson(Result, 'last_name', AObj.LastName);
  AppendToJson(Result, 'vcard', AObj.Vcard);
  // The last comma will be erased by ParseInputMessageContent().
end;

function TftTypeParser.ParseInputLocationMessageContent
  (const AObj: TftInputLocationMessageContent): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMessageContent()
  AppendToJson(Result, 'latitude', AObj.Latitude);
  AppendToJson(Result, 'longitude', AObj.Longitude);
  AppendToJson(Result, 'horizontal_accuracy', AObj.HorizontalAccuracy);
  AppendToJson(Result, 'live_period', AObj.LivePeriod);
  AppendToJson(Result, 'heading', AObj.Heading);
  AppendToJson(Result, 'proximity_alert_radius', AObj.ProximityAlertRadius);
  // The last comma will be erased by ParseInputMessageContent().
end;

function TftTypeParser.ParseInputMedia(const AObj: TftInputMedia): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'type', AObj.TypeS);
  AppendToJson(Result, 'media', AObj.Media);
  AppendToJson(Result, 'caption', AObj.Caption);
  AppendToJson(Result, 'parse_mode', AObj.ParseMode);
  AppendToJson(Result, 'caption_entities',
    ParseList(TList(AObj.CaptionEntities)));

  if CompareStr(AObj.TypeS, 'photo') = 0 then
    ParseInputMediaPhoto(AObj as TftInputMediaPhoto)
  else if CompareStr(AObj.TypeS, 'video') = 0 then
    ParseInputMediaVideo(AObj as TftInputMediaVideo)
  else if CompareStr(AObj.TypeS, 'animation') = 0 then
    ParseInputMediaAnimation(AObj as TftInputMediaAnimation)
  else if CompareStr(AObj.TypeS, 'document') = 0 then
    ParseInputMediaDocument(AObj as TftInputMediaDocument)
  else if CompareStr(AObj.TypeS, 'audio') = 0 then
    ParseInputMediaAudio(AObj as TftInputMediaAudio);

  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseInputMediaAnimation
  (const AObj: TftInputMediaAnimation): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMedia(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'thumb', AObj.Thumb);
  AppendToJson(Result, 'width', AObj.Width);
  AppendToJson(Result, 'height', AObj.Height);
  AppendToJson(Result, 'duration', AObj.Duration);
  // The last comma will be erased by ParseInputMedia().
end;

function TftTypeParser.ParseInputMediaAudio(const AObj
  : TftInputMediaAudio): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMedia(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'thumb', AObj.Thumb);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'performer', AObj.Performer);
  AppendToJson(Result, 'title', AObj.Title);
  // The last comma will be erased by ParseInputMedia().
end;

function TftTypeParser.ParseInputMediaDocument
  (const AObj: TftInputMediaDocument): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMedia(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'thumb', AObj.Thumb);
  AppendToJson(Result, 'disable_content_type_detection',
    AObj.DisableContentTypeDetection);
  // The last comma will be erased by ParseInputMedia().
end;

function TftTypeParser.ParseInputMediaPhoto(const AObj
  : TftInputMediaPhoto): String;
begin
  // This function will be called by ParseInputMedia(), so I don't add
  // curly brackets to the result String.
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMedia(), so I don't add
  // curly brackets to the result String.
  // The last comma will be erased by ParseInputMedia().
end;

function TftTypeParser.ParseInputMediaVideo(const AObj
  : TftInputMediaVideo): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMedia(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'thumb', AObj.Thumb);
  AppendToJson(Result, 'width', AObj.Width);
  AppendToJson(Result, 'height', AObj.Height);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'supports_streaming', AObj.supportsStreaming);
  // The last comma will be erased by ParseInputMedia().
end;

function TftTypeParser.ParseInputMessageContent
  (const AObj: TftInputMessageContent): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  if Pos(AObj.TypeMessageContent, 'InputTextMessageContent') > 0 then
    Result := Result + ParseInputTextMessageContent
      (TftInputTextMessageContent(AObj))
  else if Pos(AObj.TypeMessageContent, 'InputLocationMessageContent') > 0 then
    Result := Result + ParseInputLocationMessageContent
      (TftInputLocationMessageContent(AObj))
  else if Pos(AObj.TypeMessageContent, 'InputVenueMessageContent') > 0 then
    Result := Result + ParseInputVenueMessageContent
      (TftInputVenueMessageContent(AObj))
  else if Pos(AObj.TypeMessageContent, 'InputContactMessageContent') > 0 then
    Result := Result + ParseInputContactMessageContent
      (TftInputContactMessageContent(AObj));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseInputTextMessageContent
  (const AObj: TftInputTextMessageContent): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMessageContent()
  AppendToJson(Result, 'message_text', AObj.MessageText);
  AppendToJson(Result, 'Parse_mode', AObj.ParseMode);
  AppendToJson(Result, 'disable_web_page_preview', AObj.DisableWebPagePreview);
  // The last comma will be erased by ParseInputMessageContent().
end;

function TftTypeParser.ParseInputVenueMessageContent
  (const AObj: TftInputVenueMessageContent): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  // This function will be called by ParseInputMessageContent()
  AppendToJson(Result, 'latitude', AObj.Latitude);
  AppendToJson(Result, 'longitude', AObj.Longitude);
  AppendToJson(Result, 'title', AObj.Title);
  AppendToJson(Result, 'address', AObj.address);
  AppendToJson(Result, 'foursquare_id', AObj.FoursquareId);
  AppendToJson(Result, 'foursquare_type', AObj.FoursquareType);
  AppendToJson(Result, 'google_place_id', AObj.GooglePlaceId);
  AppendToJson(Result, 'google_place_type', AObj.GooglePlaceType);
  // The last comma will be erased by ParseInputMessageContent().
end;

function TftTypeParser.ParseInvoice(const AObj: TftInvoice): String;
begin
  Result := '';
  if (AObj <> nil) then
    Result := '';
  Result := Result + '{';
  AppendToJson(Result, 'title', AObj.Title);
  AppendToJson(Result, 'description', AObj.Description);
  AppendToJson(Result, 'start_parameter', AObj.StartParameter);
  AppendToJson(Result, 'currency', AObj.Currency);
  AppendToJson(Result, 'total_amount', AObj.TotalAmount);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseJson(AServerResponse: String): TJSONObject;
begin
  Result := nil;
  try
    Result := TJSONObject.ParseJSONValue(AServerResponse) as TJSONObject;
  except
    // on E: Exception do
    // begin
    //
    // end;
  end;
end;

function TftTypeParser.ParseJsonAndGetAnimation(const AData: TJSONObject)
  : TftAnimation;
begin
  Result := TftAnimation.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftAnimation>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetAudio(const AData: TJSONObject): TftAudio;
begin
  Result := TftAudio.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftAudio>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommand(const AData: TJSONObject)
  : TftBotCommand;
begin
  Result := TftBotCommand.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommand>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScope(const AData: TJSONObject)
  : TftBotCommandScope;
var
  LType: String;
begin

  Result := TftBotCommandScope.Create;

  if AData.GetValue('result') <> nil then
  begin
    LType := AData.GetValue('type').ToString;

    if (LType = TypeBotCommandScopeDefault) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeDefault>
        ((AData.GetValue('result')).ToJSON);
    end
    else if (LType = TypeBotCommandScopeAllPrivateChats) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeAllPrivateChats>
        ((AData.GetValue('result')).ToJSON);
    end
    else if (LType = TypeBotCommandScopeAllGroupChats) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeAllGroupChats>
        ((AData.GetValue('result')).ToJSON);
    end
    else if (LType = TypeBotCommandScopeAllChatAdministrators) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeAllChatAdministrators>
        ((AData.GetValue('result')).ToJSON);
    end
    else if (LType = TypeBotCommandScopeChat) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeChat>
        ((AData.GetValue('result')).ToJSON);
    end
    else if (LType = TypeBotCommandScopeChatAdministrators) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeChatAdministrators>
        ((AData.GetValue('result')).ToJSON);
    end
    else if (LType = TypeBotCommandScopeChatMember) then
    begin
      Result := TJSON.JsonToObject<TftBotCommandScopeChatMember>
        ((AData.GetValue('result')).ToJSON);
    end;
  end;

end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeAllChatAdministrators
  (const AData: TJSONObject): TftBotCommandScopeAllChatAdministrators;
begin
  Result := TftBotCommandScopeAllChatAdministrators.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeAllChatAdministrators>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeAllGroupChats
  (const AData: TJSONObject): TftBotCommandScopeAllGroupChats;
begin
  Result := TftBotCommandScopeAllGroupChats.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeAllGroupChats>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeAllPrivateChats
  (const AData: TJSONObject): TftBotCommandScopeAllPrivateChats;
begin
  Result := TftBotCommandScopeAllPrivateChats.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeAllPrivateChats>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeChat
  (const AData: TJSONObject): TftBotCommandScopeChat;
begin
  Result := TftBotCommandScopeChat.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeChat>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeChatAdministrators
  (const AData: TJSONObject): TftBotCommandScopeChatAdministrators;
begin
  Result := TftBotCommandScopeChatAdministrators.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeChatAdministrators>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeChatMember
  (const AData: TJSONObject): TftBotCommandScopeChatMember;
begin
  Result := TftBotCommandScopeChatMember.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeChatMember>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetBotCommandScopeDefault
  (const AData: TJSONObject): TftBotCommandScopeDefault;
begin
  Result := TftBotCommandScopeDefault.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftBotCommandScopeDefault>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetCallbackGame(const AData: TJSONObject)
  : TftCallbackGame;
begin
  Result := TftCallbackGame.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftCallbackGame>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetCallbackQuery(const AData: TJSONObject)
  : TftCallbackQuery;
begin
  Result := TftCallbackQuery.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftCallbackQuery>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChat(const AData: TJSONObject): TftChat;
begin
  Result := TftChat.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChat>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatAdministratorRights
  (const AData: TJSONObject): TftChatAdministratorRights;
begin
  Result := TftChatAdministratorRights.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatAdministratorRights>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatInviteLink(const AData: TJSONObject)
  : TftChatInviteLink;
begin
  Result := TftChatInviteLink.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatInviteLink>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatJoinRequest(const AData: TJSONObject)
  : TftChatJoinRequest;
begin
  Result := TftChatJoinRequest.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatJoinRequest>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatLocation(const AData: TJSONObject)
  : TftChatLocation;
begin
  Result := TftChatLocation.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatLocation>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMember(const AData: TJSONObject)
  : TftChatMember;
begin
  Result := TftChatMember.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMember>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMemberAdministrator
  (const AData: TJSONObject): TftChatMemberAdministrator;
begin
  Result := TftChatMemberAdministrator.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMemberAdministrator>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMemberBanned(const AData: TJSONObject)
  : TftChatMemberBanned;
begin
  Result := TftChatMemberBanned.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMemberBanned>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMemberLeft(const AData: TJSONObject)
  : TftChatMemberLeft;
begin
  Result := TftChatMemberLeft.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMemberLeft>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMemberOwner(const AData: TJSONObject)
  : TftChatMemberOwner;
begin
  Result := TftChatMemberOwner.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMemberOwner>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMemberRestricted
  (const AData: TJSONObject): TftChatMemberRestricted;
begin
  Result := TftChatMemberRestricted.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMemberRestricted>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatMemberUpdated
  (const AData: TJSONObject): TftChatMemberUpdated;
begin
  Result := TftChatMemberUpdated.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatMemberUpdated>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatPermissions(const AData: TJSONObject)
  : TftChatPermissions;
begin
  Result := TftChatPermissions.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatPermissions>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChatPhoto(const AData: TJSONObject)
  : TftChatPhoto;
begin
  Result := TftChatPhoto.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChatPhoto>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetChosenInlineResult
  (const AData: TJSONObject): TftChosenInlineResult;
begin
  Result := TftChosenInlineResult.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftChosenInlineResult>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetContact(const AData: TJSONObject)
  : TftContact;
begin
  Result := TftContact.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftContact>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetDice(const AData: TJSONObject): TftDice;
begin
  Result := TftDice.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftDice>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetDocument(const AData: TJSONObject)
  : TftDocument;
begin
  Result := TftDocument.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftDocument>((AData.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetEncryptedCredentials
  (const AData: TJSONObject): TftEncryptedCredentials;
begin
  Result := TftEncryptedCredentials.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftEncryptedCredentials>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetEncryptedPassportElement
  (const AData: TJSONObject): TftEncryptedPassportElement;
begin
  Result := TftEncryptedPassportElement.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftEncryptedPassportElement>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetFile(const AData: TJSONObject): TftFile;
begin
  Result := TftFile.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftFile>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetForceReply(const AData: TJSONObject)
  : TftForceReply;
begin
  Result := TftForceReply.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForceReply>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetForumTopic(const AData: TJSONObject)
  : TftForumTopic;
begin
  Result := TftForumTopic.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForumTopic>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetForumTopicClosed(const AData: TJSONObject)
  : TftForumTopicClosed;
begin
  Result := TftForumTopicClosed.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForumTopicClosed>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetForumTopicCreated
  (const AData: TJSONObject): TftForumTopicCreated;
begin
  Result := TftForumTopicCreated.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForumTopicCreated>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetForumTopicEdited(const AData: TJSONObject)
  : TftForumTopicEdited;
begin
  Result := TftForumTopicEdited.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForumTopicEdited>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetForumTopicReopened
  (const AData: TJSONObject): TftForumTopicReopened;
begin
  Result := TftForumTopicReopened.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftForumTopicReopened>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetGame(const AData: TJSONObject): TftGame;
begin
  Result := TftGame.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftGame>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetGameHighScore(const AData: TJSONObject)
  : TftGameHighScore;
begin
  Result := TftGameHighScore.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftGameHighScore>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetGeneralForumTopicHidden
  (const AData: TJSONObject): TftGeneralForumTopicHidden;
begin
  Result := TftGeneralForumTopicHidden.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftGeneralForumTopicHidden>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetGeneralForumTopicUnhidden
  (const AData: TJSONObject): TftGeneralForumTopicUnhidden;
begin
  Result := TftGeneralForumTopicUnhidden.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftGeneralForumTopicUnhidden>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineKeyboardButton
  (const AData: TJSONObject): TftInlineKeyboardButton;
begin
  Result := TftInlineKeyboardButton.Create('');
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineKeyboardButton>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineKeyboardMarkup
  (const AData: TJSONObject): TftInlineKeyboardMarkup;
begin
  Result := TftInlineKeyboardMarkup.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineKeyboardMarkup>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQuery(const AData: TJSONObject)
  : TftInlineQuery;
begin
  Result := TftInlineQuery.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQuery>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResult
  (const AData: TJSONObject): TftInlineQueryResult;
begin
  Result := TftInlineQueryResult.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResult>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultAudio
  (const AData: TJSONObject): TftInlineQueryResultAudio;
begin
  Result := TftInlineQueryResultAudio.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultAudio>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedAudio
  (const AData: TJSONObject): TftInlineQueryResultCachedAudio;
begin
  Result := TftInlineQueryResultCachedAudio.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedAudio>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedDocument
  (const AData: TJSONObject): TftInlineQueryResultCachedDocument;
begin
  Result := TftInlineQueryResultCachedDocument.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedDocument>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedGif
  (const AData: TJSONObject): TftInlineQueryResultCachedGif;
begin
  Result := TftInlineQueryResultCachedGif.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedGif>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedMpeg4Gif
  (const AData: TJSONObject): TftInlineQueryResultCachedMpeg4Gif;
begin
  Result := TftInlineQueryResultCachedMpeg4Gif.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedMpeg4Gif>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedPhoto
  (const AData: TJSONObject): TftInlineQueryResultCachedPhoto;
begin
  Result := TftInlineQueryResultCachedPhoto.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedPhoto>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedSticker
  (const AData: TJSONObject): TftInlineQueryResultCachedSticker;
begin
  Result := TftInlineQueryResultCachedSticker.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedSticker>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedVideo
  (const AData: TJSONObject): TftInlineQueryResultCachedVideo;
begin
  Result := TftInlineQueryResultCachedVideo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedVideo>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultCachedVoice
  (const AData: TJSONObject): TftInlineQueryResultCachedVoice;
begin
  Result := TftInlineQueryResultCachedVoice.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultCachedVoice>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultContact
  (const AData: TJSONObject): TftInlineQueryResultContact;
begin
  Result := TftInlineQueryResultContact.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultContact>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultDocument
  (const AData: TJSONObject): TftInlineQueryResultDocument;
begin
  Result := TftInlineQueryResultDocument.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultDocument>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultGame
  (const AData: TJSONObject): TftInlineQueryResultGame;
begin
  Result := TftInlineQueryResultGame.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultGame>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultGif
  (const AData: TJSONObject): TftInlineQueryResultGif;
begin
  Result := TftInlineQueryResultGif.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultGif>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultLocation
  (const AData: TJSONObject): TftInlineQueryResultLocation;
begin
  Result := TftInlineQueryResultLocation.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultLocation>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultMpeg4Gif
  (const AData: TJSONObject): TftInlineQueryResultMpeg4Gif;
begin
  Result := TftInlineQueryResultMpeg4Gif.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultMpeg4Gif>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultPhoto
  (const AData: TJSONObject): TftInlineQueryResultPhoto;
begin
  Result := TftInlineQueryResultPhoto.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultPhoto>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultVenue
  (const AData: TJSONObject): TftInlineQueryResultVenue;
begin
  Result := TftInlineQueryResultVenue.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultVenue>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultVideo
  (const AData: TJSONObject): TftInlineQueryResultVideo;
begin
  Result := TftInlineQueryResultVideo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultVideo>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInlineQueryResultVoice
  (const AData: TJSONObject): TftInlineQueryResultVoice;
begin
  Result := TftInlineQueryResultVoice.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInlineQueryResultVoice>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputContactMessageContent
  (const AData: TJSONObject): TftInputContactMessageContent;
begin
  Result := TftInputContactMessageContent.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputContactMessageContent>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputFile(const AData: TJSONObject)
  : TftInputFile;
begin
  Result := TftInputFile.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputFile>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputLocationMessageContent
  (const AData: TJSONObject): TftInputLocationMessageContent;
begin
  Result := TftInputLocationMessageContent.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputLocationMessageContent>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMedia(const AData: TJSONObject)
  : TftInputMedia;
begin
  Result := TftInputMedia.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMedia>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMediaAnimation
  (const AData: TJSONObject): TftInputMediaAnimation;
begin
  Result := TftInputMediaAnimation.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMediaAnimation>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMediaAudio(const AData: TJSONObject)
  : TftInputMediaAudio;
begin
  Result := TftInputMediaAudio.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMediaAudio>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMediaDocument
  (const AData: TJSONObject): TftInputMediaDocument;
begin
  Result := TftInputMediaDocument.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMediaDocument>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMediaPhoto(const AData: TJSONObject)
  : TftInputMediaPhoto;
begin
  Result := TftInputMediaPhoto.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMediaPhoto>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMediaVideo(const AData: TJSONObject)
  : TftInputMediaVideo;
begin
  Result := TftInputMediaVideo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMediaVideo>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputMessageContent
  (const AData: TJSONObject): TftInputMessageContent;
begin
  Result := TftInputMessageContent.Create('');
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputMessageContent>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputTextMessageContent
  (const AData: TJSONObject): TftInputTextMessageContent;
begin
  Result := TftInputTextMessageContent.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputTextMessageContent>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInputVenueMessageContent
  (const AData: TJSONObject): TftInputVenueMessageContent;
begin
  Result := TftInputVenueMessageContent.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInputVenueMessageContent>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetInvoice(const AData: TJSONObject)
  : TftInvoice;
begin
  Result := TftInvoice.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftInvoice>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetKeyboardButton(const AData: TJSONObject)
  : TftKeyboardButton;
begin
  Result := TftKeyboardButton.Create('');
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftKeyboardButton>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetKeyboardButtonPollType
  (const AData: TJSONObject): TftKeyboardButtonPollType;
begin
  Result := TftKeyboardButtonPollType.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftKeyboardButtonPollType>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetLabeledPrice(const AData: TJSONObject)
  : TftLabeledPrice;
begin
  Result := TftLabeledPrice.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftLabeledPrice>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetList(AParseFunc: TJsonToFtTypeFunc;
  AJSONObject: TJSONObject): TList;
var
  getArrayJSON: TJSONArray;
  I: Byte;
begin
  Result := TList.Create;
  try
    getArrayJSON := (AJSONObject).GetValue('result') as TJSONArray;
    if getArrayJSON.Count <= 0 then
      Exit;
    for I := 0 to Pred(getArrayJSON.Count) do
    begin
      Result.Add(AParseFunc(getArrayJSON, I));
    end;
  except
    on E: Exception do
    begin
      // if Assigned(FProcedureErrorException) then
      // FProcedureErrorException(E);
    end;
  end;
end;

function TftTypeParser.ParseJsonAndGetLocation(const AData: TJSONObject)
  : TftLocation;
begin
  Result := TftLocation.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftLocation>((AData.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetLoginUrl(const AData: TJSONObject)
  : TftLoginUrl;
begin
  Result := TftLoginUrl.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftLoginUrl>((AData.GetValue('result')
      ).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMaskPosition(const AData: TJSONObject)
  : TftMaskPosition;
begin
  Result := TftMaskPosition.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMaskPosition>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMenuButton(const AData: TJSONObject)
  : TftMenuButton;
begin
  Result := TftMenuButton.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMenuButton>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMenuButtonCommands
  (const AData: TJSONObject): TftMenuButtonCommands;
begin
  Result := TftMenuButtonCommands.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMenuButtonCommands>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMenuButtonDefault
  (const AData: TJSONObject): TftMenuButtonDefault;
begin
  Result := TftMenuButtonDefault.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMenuButtonDefault>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMenuButtonWebApp(const AData: TJSONObject)
  : TftMenuButtonWebApp;
begin
  Result := TftMenuButtonWebApp.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMenuButtonWebApp>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMessage(const AData: TJSONObject)
  : TftMessage;
begin
  Result := nil;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMessage>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMessageAutoDeleteTimerChanged
  (const AData: TJSONObject): TftMessageAutoDeleteTimerChanged;
begin
  Result := TftMessageAutoDeleteTimerChanged.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMessageAutoDeleteTimerChanged>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMessageEntity(const AData: TJSONObject)
  : TftMessageEntity;
begin
  Result := TftMessageEntity.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMessageEntity>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetMessageId(const AData: TJSONObject)
  : TftMessageId;
begin
  Result := TftMessageId.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftMessageId>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetOrderInfo(const AData: TJSONObject)
  : TftOrderInfo;
begin
  Result := TftOrderInfo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftOrderInfo>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportData(const AData: TJSONObject)
  : TftPassportData;
begin
  Result := TftPassportData.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportData>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementError
  (const AData: TJSONObject): TftPassportElementError;
begin
  Result := TftPassportElementError.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementError>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorDataField
  (const AData: TJSONObject): TftPassportElementErrorDataField;
begin
  Result := TftPassportElementErrorDataField.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorDataField>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorFile
  (const AData: TJSONObject): TftPassportElementErrorFile;
begin
  Result := TftPassportElementErrorFile.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorFile>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorFiles
  (const AData: TJSONObject): TftPassportElementErrorFiles;
begin
  Result := TftPassportElementErrorFiles.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorFiles>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorFrontSide
  (const AData: TJSONObject): TftPassportElementErrorFrontSide;
begin
  Result := TftPassportElementErrorFrontSide.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorFrontSide>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorReverseSide
  (const AData: TJSONObject): TftPassportElementErrorReverseSide;
begin
  Result := TftPassportElementErrorReverseSide.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorReverseSide>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorSelfie
  (const AData: TJSONObject): TftPassportElementErrorSelfie;
begin
  Result := TftPassportElementErrorSelfie.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorSelfie>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorTranslationFile
  (const AData: TJSONObject): TftPassportElementErrorTranslationFile;
begin
  Result := TftPassportElementErrorTranslationFile.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorTranslationFile>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorTranslationFiles
  (const AData: TJSONObject): TftPassportElementErrorTranslationFiles;
begin
  Result := TftPassportElementErrorTranslationFiles.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorTranslationFiles>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportElementErrorUnspecified
  (const AData: TJSONObject): TftPassportElementErrorUnspecified;
begin
  Result := TftPassportElementErrorUnspecified.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportElementErrorUnspecified>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPassportFile(const AData: TJSONObject)
  : TftPassportFile;
begin
  Result := TftPassportFile.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPassportFile>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPoll(const AData: TJSONObject): TftPoll;
begin
  Result := TftPoll.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPoll>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPollOption(const AData: TJSONObject)
  : TftPollOption;
begin
  Result := TftPollOption.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPollOption>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetPreCheckoutQuery(const AData: TJSONObject)
  : TftPreCheckoutQuery;
begin
  Result := TftPreCheckoutQuery.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPreCheckoutQuery>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetProximityAlertTriggered
  (const AData: TJSONObject): TftProximityAlertTriggered;
begin
  Result := TftProximityAlertTriggered.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftProximityAlertTriggered>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetReplyBase(const AData: TJSONObject)
  : TftReplyBase;
begin
  Result := TftReplyBase.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftReplyBase>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetReplyKeyboardMarkup
  (const AData: TJSONObject): TftReplyKeyboardMarkup;
begin
  Result := TftReplyKeyboardMarkup.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftReplyKeyboardMarkup>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetReplyKeyboardRemove
  (const AData: TJSONObject): TftReplyKeyboardRemove;
begin
  Result := TftReplyKeyboardRemove.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftReplyKeyboardRemove>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetResponseParameters
  (const AData: TJSONObject): TftResponseParameters;
begin
  Result := TftResponseParameters.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftResponseParameters>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetSentWebAppMessage
  (const AData: TJSONObject): TftSentWebAppMessage;
begin
  Result := TftSentWebAppMessage.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftSentWebAppMessage>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetShippingAddress(const AData: TJSONObject)
  : TftShippingAddress;
begin
  Result := TftShippingAddress.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftShippingAddress>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetShippingOption(const AData: TJSONObject)
  : TftShippingOption;
begin
  Result := TftShippingOption.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftShippingOption>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetShippingQuery(const AData: TJSONObject)
  : TftShippingQuery;
begin
  Result := TftShippingQuery.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftShippingQuery>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetSticker(const AData: TJSONObject)
  : TftSticker;
begin
  Result := TftSticker.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftSticker>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetStickerSet(const AData: TJSONObject)
  : TftStickerSet;
begin
  Result := TftStickerSet.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftStickerSet>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetSuccessfulPayment
  (const AData: TJSONObject): TftSuccessfulPayment;
begin
  Result := TftSuccessfulPayment.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftSuccessfulPayment>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetUpdate(const AData: TJSONObject)
  : TftUpdate;
begin
  Result := TftUpdate.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftUpdate>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetUser(const AData: TJSONObject): TftUser;
begin
  Result := TJSON.JsonToObject<TftUser>
    ((AData.GetValue('result') as TJSONObject).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetUserProfilePhotos
  (const AData: TJSONObject): TftUserProfilePhotos;
begin
  Result := TftUserProfilePhotos.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftUserProfilePhotos>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVenue(const AData: TJSONObject): TftVenue;
begin
  Result := TftVenue.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVenue>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVideo(const AData: TJSONObject): TftVideo;
begin
  Result := TftVideo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideo>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVideoChatEnded(const AData: TJSONObject)
  : TftVideoChatEnded;
begin
  Result := TftVideoChatEnded.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideoChatEnded>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVideoChatParticipantsInvited
  (const AData: TJSONObject): TftVideoChatParticipantsInvited;
begin
  Result := TftVideoChatParticipantsInvited.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideoChatParticipantsInvited>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVideoChatScheduled
  (const AData: TJSONObject): TftVideoChatScheduled;
begin
  Result := TftVideoChatScheduled.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideoChatScheduled>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVideoChatStarted(const AData: TJSONObject)
  : TftVideoChatStarted;
begin
  Result := TftVideoChatStarted.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideoChatStarted>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVideoNote(const AData: TJSONObject)
  : TftVideoNote;
begin
  Result := TftVideoNote.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVideoNote>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetVoice(const AData: TJSONObject): TftVoice;
begin
  Result := TftVoice.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftVoice>((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetWebAppData(const AData: TJSONObject)
  : TftWebAppData;
begin
  Result := TftWebAppData.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftWebAppData>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetWebAppInfo(const AData: TJSONObject)
  : TftWebAppInfo;
begin
  Result := TftWebAppInfo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftWebAppInfo>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetWebhookInfo(const AData: TJSONObject)
  : TftWebhookInfo;
begin
  Result := TftWebhookInfo.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftWebhookInfo>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndGetWriteAccessAllowed
  (const AData: TJSONObject): TftWriteAccessAllowed;
begin
  Result := TftWriteAccessAllowed.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftWriteAccessAllowed>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseJsonAndPhotoSize(const AData: TJSONObject)
  : TftPhotoSize;
begin
  Result := TftPhotoSize.Create;
  if AData.GetValue('result') <> nil then
    Result := TJSON.JsonToObject<TftPhotoSize>
      ((AData.GetValue('result')).ToJSON);
end;

function TftTypeParser.ParseKeyboardButton(const AObj
  : TftKeyboardButton): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'text', AObj.Text);
  AppendToJson(Result, 'request_contact', AObj.requestContact);
  AppendToJson(Result, 'request_location', AObj.requestLocation);
  AppendToJson(Result, 'request_poll',
    ParseKeyboardButtonPollType(AObj.requestPoll));
  AppendToJson(Result, 'web_app', ParseWebAppInfo(AObj.WebApp));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseKeyboardButtonPollType
  (const AObj: TftKeyboardButtonPollType): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'type', AObj.TypeS);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseStrings(const AObj: TStrings): string;
var
  I: Integer;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';

  for I := 0 to AObj.Count - 1 do
  begin
    Result := Result + AObj[I];
    Result := Result + ',';
  end;
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseLabeledPrice(const AObj: TftLabeledPrice): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'label', AObj.LabelPrice);
  AppendToJson(Result, 'amount', AObj.Amount);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseList(const AObj: TList): string;
var
  I: Integer;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';

  for I := 0 to AObj.Count - 1 do
  begin
    if (TftPhotoSize(AObj[I]) is TftPhotoSize) then
      Result := Result + ParsePhotoSize(AObj[I])
    else if (TftUser(AObj[I]) is TftUser) then
      Result := Result + ParseUser(AObj[I])
    else if (TftSticker(AObj[I]) is TftSticker) then
      Result := Result + ParseSticker(AObj[I])
    else if (TftPollOption(AObj[I]) is TftPollOption) then
      Result := Result + ParsePollOption(AObj[I])
    else if (TftMessageEntity(AObj[I]) is TftMessageEntity) then
      Result := Result + ParseMessageEntity(AObj[I])
    else if (TftBotCommand(AObj[I]) is TftBotCommand) then
      Result := Result + ParseBotCommand(AObj[I])
    else if (TftPassportFile(AObj[I]) is TftPassportFile) then
      Result := Result + ParsePassportFile(AObj[I])
    else if (TftInlineQueryResult(AObj[I]) is TftInlineQueryResult) then
      Result := Result + ParseInlineQueryResult(AObj[I])
    else if (TftLabeledPrice(AObj[I]) is TftLabeledPrice) then
      Result := Result + ParseLabeledPrice(AObj[I])
    else if (TftPassportElementError(AObj[I]) is TftPassportElementError) then
      Result := Result + ParsePassportElementError(AObj[I])
    else if (TftInputMedia(AObj[I]) is TftInputMedia) then
      Result := Result + ParseInputMedia(AObj[I]);

    Result := Result + ',';
  end;
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseLocation(const AObj: TftLocation): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'longitude', AObj.Longitude);
  AppendToJson(Result, 'latitude', AObj.Latitude);
  AppendToJson(Result, 'horizontal_accuracy', AObj.HorizontalAccuracy);
  AppendToJson(Result, 'live_period', AObj.LivePeriod);
  AppendToJson(Result, 'heading', AObj.Heading);
  AppendToJson(Result, 'proximity_alert_radius', AObj.ProximityAlertRadius);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseLoginUrl(const AObj: TftLoginUrl): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'url', AObj.Url);
  AppendToJson(Result, 'forward_text', AObj.ForwardText);
  AppendToJson(Result, 'bot_username', AObj.BotUsername);
  AppendToJson(Result, 'request_write_access', AObj.RequestWriteAccess);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseMaskPosition(const AObj: TftMaskPosition): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'point', AObj.Point);
  AppendToJson(Result, 'x_shift', AObj.XShift);
  AppendToJson(Result, 'y_shift', AObj.YShift);
  AppendToJson(Result, 'scale', AObj.Scale);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseMenuButton(const AObj: TftMenuButton): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'type', AObj.TypeS);
  if (AObj.TypeS = MenuButtonCommandsTYPE) then
  begin
    Result := Result + ParseMenuButtonCommands(TftMenuButtonCommands(AObj));
  end
  else if (AObj.TypeS = MenuButtonWebAppTYPE) then
  begin
    Result := Result + ParseMenuButtonWebApp(TftMenuButtonWebApp(AObj));
  end
  else if (AObj.TypeS = MenuButtonDefaultTYPE) then
  begin
    Result := Result + ParseMenuButtonDefault(TftMenuButtonDefault(AObj));
  end;
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseMenuButtonCommands
  (const AObj: TftMenuButtonCommands): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by parseMenuButton(), so I don't add
  // curly brackets to the result String.
  Result := '';
  // The last comma will be erased by ParseMenuButton().
end;

function TftTypeParser.ParseMenuButtonDefault
  (const AObj: TftMenuButtonDefault): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by parseMenuButton(), so I don't add
  // curly brackets to the result String.
  Result := '';
  // The last comma will be erased by ParseMenuButton().
end;

function TftTypeParser.ParseMenuButtonWebApp(const AObj
  : TftMenuButtonWebApp): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  // This function will be called by parseMenuButton(), so I don't add
  // curly brackets to the result String.
  Result := '';
  AppendToJson(Result, 'text', AObj.Text);
  AppendToJson(Result, 'web_app', ParseWebAppInfo(AObj.WebApp));
  // The last comma will be erased by ParseMenuButton().
end;

function TftTypeParser.ParseMessage(const AObj: TftMessage): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'message_id', AObj.MessageId);
  AppendToJson(Result, 'message_thread_id', AObj.MessageThreadId);
  AppendToJson(Result, 'from', ParseUser(AObj.From));
  AppendToJson(Result, 'sender_chat', ParseChat(AObj.SenderChat));
  AppendToJson(Result, 'date', AObj.date);
  AppendToJson(Result, 'chat', ParseChat(AObj.chat));
  AppendToJson(Result, 'forward_from', ParseUser(AObj.ForwardFrom));
  AppendToJson(Result, 'forward_from_chat', ParseChat(AObj.ForwardFromChat));
  AppendToJson(Result, 'forward_from_message_id', AObj.ForwardFromMessageId);
  AppendToJson(Result, 'forward_signature', AObj.ForwardSignature);
  AppendToJson(Result, 'forward_sender_name', AObj.ForwardSenderName);
  AppendToJson(Result, 'forward_date', AObj.ForwardDate);
  AppendToJson(Result, 'is_topic_message', AObj.IsTopicMessage);
  AppendToJson(Result, 'is_automatic_forward', AObj.isAutomaticForward);
  AppendToJson(Result, 'reply_to_message', ParseMessage(AObj.ReplyToMessage));
  AppendToJson(Result, 'via_bot', ParseUser(AObj.viaBot));
  AppendToJson(Result, 'edit_date', AObj.EditDate);
  AppendToJson(Result, 'has_protected_content', AObj.HasProtectedContent);
  AppendToJson(Result, 'media_group_id', AObj.mediaGroupId);
  AppendToJson(Result, 'author_signature', AObj.AuthorSignature);
  AppendToJson(Result, 'text', AObj.Text);
  AppendToJson(Result, 'entities', ParseList(TList(AObj.entities)));
  AppendToJson(Result, 'animation', ParseAnimation(AObj.Animation));
  AppendToJson(Result, 'audio', ParseAudio(AObj.Audio));
  AppendToJson(Result, 'document', ParseDocument(AObj.Document));
  AppendToJson(Result, 'photo', ParseList(TList(AObj.photo)));
  AppendToJson(Result, 'sticker', ParseSticker(AObj.Sticker));
  AppendToJson(Result, 'video', ParseVideo(AObj.Video));
  AppendToJson(Result, 'video_note', ParseVideoNote(AObj.videoNote));
  AppendToJson(Result, 'voice', ParseVoice(AObj.Voice));
  AppendToJson(Result, 'caption', AObj.Caption);
  AppendToJson(Result, 'caption_entities',
    ParseList(TList(AObj.CaptionEntities)));
  AppendToJson(Result, 'has_media_spoiler', AObj.HasMediaSpoiler);
  AppendToJson(Result, 'contact', ParseContact(AObj.Contact));
  AppendToJson(Result, 'dice', ParseDice(AObj.Dice));
  AppendToJson(Result, 'game', ParseGame(AObj.Game));
  AppendToJson(Result, 'poll', ParsePoll(AObj.Poll));
  AppendToJson(Result, 'venue', ParseVenue(AObj.venue));
  AppendToJson(Result, 'location', ParseLocation(AObj.Location));
  AppendToJson(Result, 'new_chat_members',
    ParseList(TList(AObj.NewChatMembers)));
  AppendToJson(Result, 'left_chat_member', ParseUser(AObj.LeftChatMember));
  AppendToJson(Result, 'new_chat_title', AObj.NewChatTitle);
  AppendToJson(Result, 'new_chat_photo', ParseList(TList(AObj.NewChatPhoto)));
  AppendToJson(Result, 'delete_chat_photo', AObj.DeleteChatPhoto);
  AppendToJson(Result, 'group_chat_created', AObj.GroupChatCreated);
  AppendToJson(Result, 'supergroup_chat_created', AObj.SupergroupChatCreated);
  AppendToJson(Result, 'channel_chat_created', AObj.ChannelChatCreated);
  AppendToJson(Result, 'message_auto_delete_timer_changed',
    ParseMessageAutoDeleteTimerChanged(AObj.messageAutoDeleteTimerChanged));
  AppendToJson(Result, 'migrate_to_chat_id', AObj.MigrateToChatId);
  AppendToJson(Result, 'migrate_from_chat_id', AObj.MigrateFromChatId);
  AppendToJson(Result, 'pinned_message', ParseMessage(AObj.PinnedMessage));
  AppendToJson(Result, 'invoice', ParseInvoice(AObj.Invoice));
  AppendToJson(Result, 'successful_payment',
    ParseSuccessfulPayment(AObj.successfulPayment));
  AppendToJson(Result, 'connected_website', AObj.ConnectedWebsite);
  AppendToJson(Result, 'write_access_allowed',
    ParseWriteAccessAllowed(AObj.WriteAccessAllowed));
  AppendToJson(Result, 'passport_data', ParsePassportData(AObj.passportData));
  AppendToJson(Result, 'proximity_alert_triggered',
    ParseProximityAlertTriggered(AObj.proximityAlertTriggered));
  AppendToJson(Result, 'forum_topic_created',
    ParseForumTopicCreated(AObj.ForumTopicCreated));
  AppendToJson(Result, 'forum_topic_edited',
    ParseForumTopicEdited(AObj.ForumTopicEdited));
  AppendToJson(Result, 'forum_topic_closed',
    ParseForumTopicClosed(AObj.ForumTopicClosed));
  AppendToJson(Result, 'forum_topic_reopened',
    ParseForumTopicReopened(AObj.ForumTopicReopened));
  AppendToJson(Result, 'general_forum_topic_hidden',
    ParseGeneralForumTopicHidden(AObj.GeneralForumTopicHidden));
  AppendToJson(Result, 'general_forum_topic_unhidden',
    ParseGeneralForumTopicUnhidden(AObj.GeneralForumTopicUnhidden));
  AppendToJson(Result, 'video_chat_scheduled',
    ParseVideoChatScheduled(AObj.videoChatScheduled));
  AppendToJson(Result, 'video_chat_started',
    ParseVideoChatStarted(AObj.videoChatStarted));
  AppendToJson(Result, 'video_chat_ended',
    ParseVideoChatEnded(AObj.videoChatEnded));
  AppendToJson(Result, 'video_chat_participants_invited',
    ParseVideoChatParticipantsInvited(AObj.videoChatParticipantsInvited));
  AppendToJson(Result, 'web_app_data', ParseWebAppData(AObj.webAppData));
  AppendToJson(Result, 'reply_markup',
    ParseInlineKeyboardMarkup(AObj.ReplyMarkup));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseMessageAutoDeleteTimerChanged
  (const AObj: TftMessageAutoDeleteTimerChanged): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'message_auto_delete_time', AObj.MessageAutoDeleteTime);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseMessageEntity(const AObj: TftMessageEntity): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  if (AObj.TypeMessageEntity = TftMessageEntityType.Mention) then
    AppendToJson(Result, 'type', 'mention')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Hashtag) then
    AppendToJson(Result, 'type', 'hashtag')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Cashtag) then
    AppendToJson(Result, 'type', 'cashtag')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.BotCommand) then
    AppendToJson(Result, 'type', 'bot_command')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Url) then
    AppendToJson(Result, 'type', 'url')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Email) then
    AppendToJson(Result, 'type', 'email')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.PhoneNumber) then
    AppendToJson(Result, 'type', 'phone_number')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Bold) then
    AppendToJson(Result, 'type', 'bold')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Italic) then
    AppendToJson(Result, 'type', 'italic')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Underline) then
    AppendToJson(Result, 'type', 'underline')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Strikethrough) then
    AppendToJson(Result, 'type', 'strikethrough')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Spoiler) then
    AppendToJson(Result, 'type', 'spoiler')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Code) then
    AppendToJson(Result, 'type', 'code')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.Pre) then
    AppendToJson(Result, 'type', 'pre')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.TextLink) then
    AppendToJson(Result, 'type', 'text_link')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.TextMention) then
    AppendToJson(Result, 'type', 'text_mention')
  else if (AObj.TypeMessageEntity = TftMessageEntityType.CustomEmoji) then
    AppendToJson(Result, 'type', 'custom_emoji');

  AppendToJson(Result, 'offset', AObj.Offset);
  AppendToJson(Result, 'length', AObj.Length);
  AppendToJson(Result, 'url', AObj.Url);
  AppendToJson(Result, 'user', ParseUser(AObj.User));
  AppendToJson(Result, 'language', AObj.language);
  AppendToJson(Result, 'custom_emoji_id', AObj.customEmojiId);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseMessageId(const AObj: TftMessageId): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'message_id', AObj.MessageId);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseOrderInfo(const AObj: TftOrderInfo): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  if (AObj.name <> '') then
    AppendToJson(Result, 'name', AObj.name);
  if (AObj.PhoneNumber <> '') then
    AppendToJson(Result, 'phone_number', AObj.PhoneNumber);
  if (AObj.Email <> '') then
    AppendToJson(Result, 'email', AObj.Email);
  if (AObj.ShippingAddress <> nil) then
  begin
    Result := Result + '"shipping_address":';
    Result := Result + ParseShippingAddress(AObj.ShippingAddress);
    Result := Result + ',';
  end;
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVideoChatScheduled
  (const AObj: TftVideoChatScheduled): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'start_date', AObj.StartDate);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePassportData(const AObj: TftPassportData): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'data', ParseList(TList(AObj.Data)));
  AppendToJson(Result, 'credentials',
    ParseEncryptedCredentials(AObj.credentials));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePassportElementError
  (const AObj: TftPassportElementError): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'source', AObj.Source);
  AppendToJson(Result, 'type', AObj.TypeS);
  AppendToJson(Result, 'message', AObj.Message);
  if (AObj.Source = PassportElementErrorDataFieldSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorDataField
      (TftPassportElementErrorDataField(AObj));
  end
  else if (AObj.Source = PassportElementErrorFrontSideSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorFrontSide
      (TftPassportElementErrorFrontSide(AObj));
  end
  else if (AObj.Source = PassportElementErrorReverseSideSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorReverseSide
      (TftPassportElementErrorReverseSide(AObj));
  end
  else if (AObj.Source = PassportElementErrorSelfieSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorSelfie
      (TftPassportElementErrorSelfie(AObj));
  end
  else if (AObj.Source = PassportElementErrorFileSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorFile
      (TftPassportElementErrorFile(AObj));
  end
  else if (AObj.Source = PassportElementErrorFilesSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorFiles
      (TftPassportElementErrorFiles(AObj));
  end
  else if (AObj.Source = PassportElementErrorTranslationFileSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorTranslationFile
      (TftPassportElementErrorTranslationFile(AObj));
  end
  else if (AObj.Source = PassportElementErrorTranslationFilesSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorTranslationFiles
      (TftPassportElementErrorTranslationFiles(AObj));
  end
  else if (AObj.Source = PassportElementErrorUnspecifiedSOURCE) then
  begin
    Result := Result + ParsePassportElementErrorUnspecified
      (TftPassportElementErrorUnspecified(AObj));
  end;
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePassportElementErrorDataField
  (const AObj: TftPassportElementErrorDataField): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'field_name', AObj.FieldName);
  AppendToJson(Result, 'data_hash', AObj.DataHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorFile
  (const AObj: TftPassportElementErrorFile): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'file_hash', AObj.FileHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorFiles
  (const AObj: TftPassportElementErrorFiles): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'file_hashes', ParseList(TList(AObj.FileHashes)));
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorFrontSide
  (const AObj: TftPassportElementErrorFrontSide): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'file_hash', AObj.FileHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorReverseSide
  (const AObj: TftPassportElementErrorReverseSide): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result Sstring.
  AppendToJson(Result, 'file_hash', AObj.FileHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorSelfie
  (const AObj: TftPassportElementErrorSelfie): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'file_hash', AObj.FileHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorTranslationFile
  (const AObj: TftPassportElementErrorTranslationFile): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'file_hash', AObj.FileHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorTranslationFiles
  (const AObj: TftPassportElementErrorTranslationFiles): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'file_hashes', ParseList(TList(AObj.FileHashes)));
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportElementErrorUnspecified
  (const AObj: TftPassportElementErrorUnspecified): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := '';
  // This function will be called by ParsePassportElementError(), so I don't add
  // curly brackets to the result String.
  AppendToJson(Result, 'element_hash', AObj.ElementHash);
  // The last comma will be erased by ParsePassportElementError().
end;

function TftTypeParser.ParsePassportFile(const AObj: TftPassportFile): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  AppendToJson(Result, 'file_date', AObj.FileDate);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePhotoSize(const AObj: TftPhotoSize): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'width', AObj.Width);
  AppendToJson(Result, 'height', AObj.Height);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePoll(const AObj: TftPoll): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  AppendToJson(Result, 'question', AObj.Question);
  AppendToJson(Result, 'options', ParseList(TList(AObj.Options)));
  AppendToJson(Result, 'total_voter_count', AObj.TotalVoterCount);
  AppendToJson(Result, 'is_closed', AObj.IsClosed);
  AppendToJson(Result, 'is_anonymous', AObj.IsAnonymous);
  AppendToJson(Result, 'type', AObj.TypePoll);
  AppendToJson(Result, 'allows_multiple_answers', AObj.AllowsMultipleAnswers);
  AppendToJson(Result, 'correct_option_id', AObj.CorrectOptionId);
  AppendToJson(Result, 'explanation', AObj.Explanation);
  AppendToJson(Result, 'explanation_entities',
    ParseList(TList(AObj.ExplanationEntities)));
  AppendToJson(Result, 'open_period', AObj.OpenPeriod);
  AppendToJson(Result, 'close_date', AObj.CloseDate);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePollAnswer(const AObj: TftPollAnswer): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'poll_id', AObj.PollId);
  AppendToJson(Result, 'user', ParseUser(AObj.User));
  AppendToJson(Result, 'option_ids', ParseList(TList(AObj.OptionIds)));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePollOption(const AObj: TftPollOption): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'text', AObj.Text);
  AppendToJson(Result, 'voter_count', AObj.VoterCount);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParsePreCheckoutQuery(const AObj
  : TftPreCheckoutQuery): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  Result := Result + '"user":';
  Result := Result + ParseUser(AObj.From);
  Result := Result + ',';
  AppendToJson(Result, 'currency', AObj.Currency);
  AppendToJson(Result, 'total_amount', AObj.TotalAmount);
  AppendToJson(Result, 'invoicePayload', AObj.InvoIcePayload);
  AppendToJson(Result, 'shippingOptionId', AObj.ShippingOptionId);
  AppendToJson(Result, 'orderInfo', ParseOrderInfo(AObj.OrderInfo));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseProximityAlertTriggered
  (const AObj: TftProximityAlertTriggered): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'traveler', ParseUser(AObj.Traveler));
  AppendToJson(Result, 'watcher', ParseUser(AObj.Watcher));
  AppendToJson(Result, 'distance', AObj.Distance);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseReplyBase(const AObj: TftReplyBase): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  if (AObj is TftForceReply) then
    Result := ParseForceReply(TftForceReply(AObj))
  else if (AObj is TftReplyKeyboardRemove) then
    Result := ParseReplyKeyboardRemove(TftReplyKeyboardRemove(AObj))
  else if (AObj is TftReplyKeyboardMarkup) then
    Result := ParseReplyKeyboardMarkup(TftReplyKeyboardMarkup(AObj))
  else if (AObj is TftInlineKeyboardMarkup) then
    Result := ParseInlineKeyboardMarkup(TftInlineKeyboardMarkup(AObj));
end;

function TftTypeParser.ParseReplyKeyboardMarkup
  (const AObj: TftReplyKeyboardMarkup): String;
var
  I, J: Integer;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '"keyboard":[';
  for I := 0 to AObj.Keyboard.Count - 1 do
  begin
    Result := Result + '[';
    for J := 0 to AObj.Keyboard[I].Count - 1 do
    begin
      Result := Result + ParseKeyboardButton(AObj.Keyboard[I][J]);
      Result := Result + ',';
    end;
    RemoveLastComma(Result);
    Result := Result + '],';
  end;
  if not(AObj.Keyboard.Count = 0) then
    RemoveLastComma(Result);
  Result := Result + '],';
  AppendToJson(Result, 'resize_keyboard', AObj.ResizeKeyboard);
  AppendToJson(Result, 'one_time_keyboard', AObj.OneTimeKeyboard);
  AppendToJson(Result, 'input_field_placeholder', AObj.InputFieldPlaceholder);
  AppendToJson(Result, 'selective', AObj.Selective);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseReplyKeyboardRemove
  (const AObj: TftReplyKeyboardRemove): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'remove_keyboard', AObj.RemoveKeyboard);
  AppendToJson(Result, 'selective', AObj.Selective);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseResponseParameters
  (const AObj: TftResponseParameters): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'migrate_to_chat_id', AObj.MigrateToChatId);
  AppendToJson(Result, 'retry_after', AObj.RetryAfter);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseSentWebAppMessage
  (const AObj: TftSentWebAppMessage): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'inline_message_id', AObj.InlineMessageId);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseShippingAddress(const AObj
  : TftShippingAddress): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  if (AObj.State <> '') then
    AppendToJson(Result, 'state', AObj.State);
  AppendToJson(Result, 'city', AObj.City);
  AppendToJson(Result, 'street_line1', AObj.StreetLine1);
  AppendToJson(Result, 'street_line2', AObj.StreetLine2);
  AppendToJson(Result, 'post_code', AObj.PostCode);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseShippingOption(const AObj
  : TftShippingOption): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  AppendToJson(Result, 'title', AObj.Title);
  RemoveLastComma(Result);
  Result := Result + '"prices":';
  Result := Result + ParseList(TList(AObj.prices));
  Result := Result + '}';
end;

function TftTypeParser.ParseShippingQuery(const AObj: TftShippingQuery): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  Result := Result + '"from":';
  Result := Result + ParseUser(AObj.From);
  Result := Result + ',';
  AppendToJson(Result, 'invoice_payload', AObj.InvoIcePayload);
  Result := Result + '"shipping_address":';
  Result := Result + ParseShippingAddress(AObj.ShippingAddress);
  Result := Result + ',';
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseSticker(const AObj: TftSticker): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  if (AObj.TypeS = TftStickerType.stRegular) then
    AppendToJson(Result, 'type', 'regular')
  else if (AObj.TypeS = TftStickerType.stMask) then
    AppendToJson(Result, 'type', 'mask')
  else if (AObj.TypeS = TftStickerType.stCustomEmoji) then
    AppendToJson(Result, 'type', 'custom_emoji');

  AppendToJson(Result, 'width', AObj.Width);
  AppendToJson(Result, 'height', AObj.Height);
  AppendToJson(Result, 'is_animated', AObj.IsAnimated);
  AppendToJson(Result, 'is_video', AObj.IsVideo);
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  AppendToJson(Result, 'emoji', AObj.emoji);
  AppendToJson(Result, 'premium_animation', ParseFile(AObj.PremiumAnimation));
  AppendToJson(Result, 'mask_position', ParseMaskPosition(AObj.MaskPosition));
  AppendToJson(Result, 'custom_emoji_id', AObj.customEmojiId);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseStickerSet(const AObj: TftStickerSet): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'name', AObj.name);
  AppendToJson(Result, 'title', AObj.Title);

  if (AObj.TypeS = TftStickerSetType.stRegular) then
    AppendToJson(Result, 'type', 'regular')
  else if (AObj.TypeS = TftStickerSetType.stMask) then
    AppendToJson(Result, 'type', 'mask')
  else if (AObj.TypeS = TftStickerSetType.stCustomEmoji) then
    AppendToJson(Result, 'type', 'custom_emoji');

  AppendToJson(Result, 'is_animated', AObj.IsAnimated);
  AppendToJson(Result, 'is_video', AObj.IsVideo);
  AppendToJson(Result, 'stickers', ParseList(TList(AObj.Stickers)));
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseSuccessfulPayment
  (const AObj: TftSuccessfulPayment): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'currency', AObj.Currency);
  AppendToJson(Result, 'total_amount', AObj.TotalAmount);
  AppendToJson(Result, 'invoice_payload', AObj.InvoIcePayload);
  AppendToJson(Result, 'shipping_option_id', AObj.ShippingOptionId);
  Result := Result + '"order_info":';
  Result := Result + ParseOrderInfo(AObj.OrderInfo);
  Result := Result + ',';
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseUpdate(const AObj: TftUpdate): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'update_id', AObj.UpdateId);
  AppendToJson(Result, 'message', ParseMessage(AObj.Message));
  AppendToJson(Result, 'edited_message', ParseMessage(AObj.EditedMessage));
  AppendToJson(Result, 'channel_post', ParseMessage(AObj.ChannelPost));
  AppendToJson(Result, 'edited_channel_post',
    ParseMessage(AObj.EditedChannelPost));
  AppendToJson(Result, 'inline_query', ParseInlineQuery(AObj.InlineQuery));
  AppendToJson(Result, 'chosen_inline_result',
    ParseChosenInlineResult(AObj.ChosenInlineResult));
  AppendToJson(Result, 'callback_query',
    ParseCallbackQuery(AObj.CallbackQuery));
  AppendToJson(Result, 'shipping_query',
    ParseShippingQuery(AObj.ShippingQuery));
  AppendToJson(Result, 'pre_checkout_query',
    ParsePreCheckoutQuery(AObj.PreCheckoutQuery));
  AppendToJson(Result, 'poll', ParsePoll(AObj.Poll));
  AppendToJson(Result, 'poll_answer', ParsePollAnswer(AObj.PollAnswer));
  AppendToJson(Result, 'my_chat_member',
    ParseChatMemberUpdated(AObj.MyChatMember));
  AppendToJson(Result, 'chat_member', ParseChatMemberUpdated(AObj.ChatMember));
  AppendToJson(Result, 'chat_join_request',
    ParseChatJoinRequest(AObj.ChatJoinRequest));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseUser(const AObj: TftUser): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'id', AObj.Id);
  AppendToJson(Result, 'is_bot', AObj.IsBot);
  AppendToJson(Result, 'first_name', AObj.FirstName);
  AppendToJson(Result, 'last_name', AObj.LastName);
  AppendToJson(Result, 'username', AObj.UserName);
  AppendToJson(Result, 'language_code', AObj.languageCode);
  AppendToJson(Result, 'is_premium', AObj.isPremium);
  AppendToJson(Result, 'added_to_attachment_menu', AObj.addedToAttachmentMenu);
  AppendToJson(Result, 'can_join_groups', AObj.canJoinGroups);
  AppendToJson(Result, 'can_read_all_group_messages',
    AObj.canReadAllGroupMessages);
  AppendToJson(Result, 'supports_inline_queries', AObj.supportsInlineQueries);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseUserProfilePhotos
  (const AObj: TftUserProfilePhotos): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'total_count', AObj.TotalCount);
  AppendToJson(Result, 'photos', ParseList(TList(AObj.Photos)));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVenue(const AObj: TftVenue): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'location', ParseLocation(AObj.Location));
  AppendToJson(Result, 'title', AObj.Title);
  AppendToJson(Result, 'address', AObj.address);
  AppendToJson(Result, 'foursquare_id', AObj.FoursquareId);
  AppendToJson(Result, 'foursquare_type', AObj.FoursquareType);
  AppendToJson(Result, 'google_place_id', AObj.GooglePlaceId);
  AppendToJson(Result, 'google_place_type', AObj.GooglePlaceType);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVideo(const AObj: TftVideo): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'width', AObj.Width);
  AppendToJson(Result, 'height', AObj.Height);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  AppendToJson(Result, 'file_name', AObj.FileName);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVideoChatEnded(const AObj
  : TftVideoChatEnded): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'duration', AObj.Duration);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVideoChatParticipantsInvited
  (const AObj: TftVideoChatParticipantsInvited): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'users', ParseList(TList(AObj.Users)));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVideoChatStarted(const AObj
  : TftVideoChatStarted): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '}';
end;

function TftTypeParser.ParseVideoNote(const AObj: TftVideoNote): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'length', AObj.Length);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'thumb', ParsePhotoSize(AObj.Thumb));
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseVoice(const AObj: TftVoice): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'file_id', AObj.FileId);
  AppendToJson(Result, 'file_unique_id', AObj.FileUniqueId);
  AppendToJson(Result, 'duration', AObj.Duration);
  AppendToJson(Result, 'mime_type', AObj.MimeType);
  AppendToJson(Result, 'file_size', AObj.FileSize);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseWebAppData(const AObj: TftWebAppData): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'data', AObj.Data);
  AppendToJson(Result, 'button_text', AObj.ButtonText);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseWebAppInfo(const AObj: TftWebAppInfo): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'url', AObj.Url);
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseWebhookInfo(const AObj: TftWebhookInfo): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  AppendToJson(Result, 'url', AObj.Url);
  AppendToJson(Result, 'has_custom_certificate', AObj.HasCustomCertificate);
  AppendToJson(Result, 'pending_update_count', AObj.PendingUpdateCount);
  AppendToJson(Result, 'ip_address', AObj.IpAddress);
  AppendToJson(Result, 'last_error_date', AObj.LastErrorDate);
  AppendToJson(Result, 'last_error_message', AObj.LastErrorDate);
  AppendToJson(Result, 'last_synchronization_error_date',
    AObj.LastSynchronizationErrorDate);
  AppendToJson(Result, 'max_connections', AObj.MaxConnections);
  AppendToJson(Result, 'allowed_updates',
    ParseList(TList(AObj.AllowedUpdates)));
  RemoveLastComma(Result);
  Result := Result + '}';
end;

function TftTypeParser.ParseWriteAccessAllowed
  (const AObj: TftWriteAccessAllowed): String;
begin
  Result := '';
  if (AObj = nil) then
  begin
    Result := '';
    Exit;
  end;
  Result := Result + '{';
  Result := Result + '}';
end;

procedure TftTypeParser.RemoveLastComma(var AInput: String);
begin
  Delete(AInput, Length(AInput), 1);
end;

end.
