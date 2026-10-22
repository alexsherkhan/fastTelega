unit fastTelega.JsonMapper;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  SysUtils, TypInfo, Generics.Collections, System.JSON, fpjson,
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
  fastTelega.AvailableTypes.ftFile,
  fastTelega.AvailableTypes.ftForceReply,
  fastTelega.AvailableTypes.ftForumTopic,
  fastTelega.AvailableTypes.ftForumTopicClosed,
  fastTelega.AvailableTypes.ftForumTopicCreated,
  fastTelega.AvailableTypes.ftForumTopicEdited,
  fastTelega.AvailableTypes.ftForumTopicReopened,
  fastTelega.AvailableTypes.ftGeneralForumTopicHidden,
  fastTelega.AvailableTypes.ftGeneralForumTopicUnhidden,
  fastTelega.AvailableTypes.ftInlineKeyboardButton,
  fastTelega.AvailableTypes.ftInlineKeyboardMarkup,
  fastTelega.AvailableTypes.ftInlineQueryResult,
  fastTelega.AvailableTypes.ftInputInvoiceMessageContent,
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

procedure FillTftAcceptedGiftTypes(const AJSON: TJSONData; const AObj: TftAcceptedGiftTypes);
function TftAcceptedGiftTypesFromJson(const AJSON: TJSONData): TftAcceptedGiftTypes;
procedure FillTftAnimation(const AJSON: TJSONData; const AObj: TftAnimation);
function TftAnimationFromJson(const AJSON: TJSONData): TftAnimation;
procedure FillTftAudio(const AJSON: TJSONData; const AObj: TftAudio);
function TftAudioFromJson(const AJSON: TJSONData): TftAudio;
procedure FillTftBotAccessSettings(const AJSON: TJSONData; const AObj: TftBotAccessSettings);
function TftBotAccessSettingsFromJson(const AJSON: TJSONData): TftBotAccessSettings;
procedure FillTftBotCommand(const AJSON: TJSONData; const AObj: TftBotCommand);
function TftBotCommandFromJson(const AJSON: TJSONData): TftBotCommand;
procedure FillTftBotCommandScope(const AJSON: TJSONData; const AObj: TftBotCommandScope);
function TftBotCommandScopeFromJson(const AJSON: TJSONData): TftBotCommandScope;
procedure FillTftBotCommandScopeAllChatAdministrators(const AJSON: TJSONData; const AObj: TftBotCommandScopeAllChatAdministrators);
function TftBotCommandScopeAllChatAdministratorsFromJson(const AJSON: TJSONData): TftBotCommandScopeAllChatAdministrators;
procedure FillTftBotCommandScopeAllGroupChats(const AJSON: TJSONData; const AObj: TftBotCommandScopeAllGroupChats);
function TftBotCommandScopeAllGroupChatsFromJson(const AJSON: TJSONData): TftBotCommandScopeAllGroupChats;
procedure FillTftBotCommandScopeAllPrivateChats(const AJSON: TJSONData; const AObj: TftBotCommandScopeAllPrivateChats);
function TftBotCommandScopeAllPrivateChatsFromJson(const AJSON: TJSONData): TftBotCommandScopeAllPrivateChats;
procedure FillTftBotCommandScopeChat(const AJSON: TJSONData; const AObj: TftBotCommandScopeChat);
function TftBotCommandScopeChatFromJson(const AJSON: TJSONData): TftBotCommandScopeChat;
procedure FillTftBotCommandScopeChatAdministrators(const AJSON: TJSONData; const AObj: TftBotCommandScopeChatAdministrators);
function TftBotCommandScopeChatAdministratorsFromJson(const AJSON: TJSONData): TftBotCommandScopeChatAdministrators;
procedure FillTftBotCommandScopeChatMember(const AJSON: TJSONData; const AObj: TftBotCommandScopeChatMember);
function TftBotCommandScopeChatMemberFromJson(const AJSON: TJSONData): TftBotCommandScopeChatMember;
procedure FillTftBotCommandScopeDefault(const AJSON: TJSONData; const AObj: TftBotCommandScopeDefault);
function TftBotCommandScopeDefaultFromJson(const AJSON: TJSONData): TftBotCommandScopeDefault;
procedure FillTftBotDescription(const AJSON: TJSONData; const AObj: TftBotDescription);
function TftBotDescriptionFromJson(const AJSON: TJSONData): TftBotDescription;
procedure FillTftBotName(const AJSON: TJSONData; const AObj: TftBotName);
function TftBotNameFromJson(const AJSON: TJSONData): TftBotName;
procedure FillTftBotShortDescription(const AJSON: TJSONData; const AObj: TftBotShortDescription);
function TftBotShortDescriptionFromJson(const AJSON: TJSONData): TftBotShortDescription;
procedure FillTftBotSubscriptionUpdated(const AJSON: TJSONData; const AObj: TftBotSubscriptionUpdated);
function TftBotSubscriptionUpdatedFromJson(const AJSON: TJSONData): TftBotSubscriptionUpdated;
procedure FillTftBusinessConnection(const AJSON: TJSONData; const AObj: TftBusinessConnection);
function TftBusinessConnectionFromJson(const AJSON: TJSONData): TftBusinessConnection;
procedure FillTftBusinessMessagesDeleted(const AJSON: TJSONData; const AObj: TftBusinessMessagesDeleted);
function TftBusinessMessagesDeletedFromJson(const AJSON: TJSONData): TftBusinessMessagesDeleted;
procedure FillTftCallbackGame(const AJSON: TJSONData; const AObj: TftCallbackGame);
function TftCallbackGameFromJson(const AJSON: TJSONData): TftCallbackGame;
procedure FillTftCallbackQuery(const AJSON: TJSONData; const AObj: TftCallbackQuery);
function TftCallbackQueryFromJson(const AJSON: TJSONData): TftCallbackQuery;
procedure FillTftChat(const AJSON: TJSONData; const AObj: TftChat);
function TftChatFromJson(const AJSON: TJSONData): TftChat;
procedure FillTftChatAdministratorRights(const AJSON: TJSONData; const AObj: TftChatAdministratorRights);
function TftChatAdministratorRightsFromJson(const AJSON: TJSONData): TftChatAdministratorRights;
procedure FillTftChatBoost(const AJSON: TJSONData; const AObj: TftChatBoost);
function TftChatBoostFromJson(const AJSON: TJSONData): TftChatBoost;
procedure FillTftChatBoostAdded(const AJSON: TJSONData; const AObj: TftChatBoostAdded);
function TftChatBoostAddedFromJson(const AJSON: TJSONData): TftChatBoostAdded;
procedure FillTftChatBoostRemoved(const AJSON: TJSONData; const AObj: TftChatBoostRemoved);
function TftChatBoostRemovedFromJson(const AJSON: TJSONData): TftChatBoostRemoved;
procedure FillTftChatBoostSource(const AJSON: TJSONData; const AObj: TftChatBoostSource);
function TftChatBoostSourceFromJson(const AJSON: TJSONData): TftChatBoostSource;
procedure FillTftChatBoostUpdated(const AJSON: TJSONData; const AObj: TftChatBoostUpdated);
function TftChatBoostUpdatedFromJson(const AJSON: TJSONData): TftChatBoostUpdated;
procedure FillTftChatInviteLink(const AJSON: TJSONData; const AObj: TftChatInviteLink);
function TftChatInviteLinkFromJson(const AJSON: TJSONData): TftChatInviteLink;
procedure FillTftChatJoinRequest(const AJSON: TJSONData; const AObj: TftChatJoinRequest);
function TftChatJoinRequestFromJson(const AJSON: TJSONData): TftChatJoinRequest;
procedure FillTftChatLocation(const AJSON: TJSONData; const AObj: TftChatLocation);
function TftChatLocationFromJson(const AJSON: TJSONData): TftChatLocation;
procedure FillTftChatMember(const AJSON: TJSONData; const AObj: TftChatMember);
function TftChatMemberFromJson(const AJSON: TJSONData): TftChatMember;
procedure FillTftChatMemberAdministrator(const AJSON: TJSONData; const AObj: TftChatMemberAdministrator);
function TftChatMemberAdministratorFromJson(const AJSON: TJSONData): TftChatMemberAdministrator;
procedure FillTftChatMemberBanned(const AJSON: TJSONData; const AObj: TftChatMemberBanned);
function TftChatMemberBannedFromJson(const AJSON: TJSONData): TftChatMemberBanned;
procedure FillTftChatMemberLeft(const AJSON: TJSONData; const AObj: TftChatMemberLeft);
function TftChatMemberLeftFromJson(const AJSON: TJSONData): TftChatMemberLeft;
procedure FillTftChatMemberMember(const AJSON: TJSONData; const AObj: TftChatMemberMember);
function TftChatMemberMemberFromJson(const AJSON: TJSONData): TftChatMemberMember;
procedure FillTftChatMemberOwner(const AJSON: TJSONData; const AObj: TftChatMemberOwner);
function TftChatMemberOwnerFromJson(const AJSON: TJSONData): TftChatMemberOwner;
procedure FillTftChatMemberRestricted(const AJSON: TJSONData; const AObj: TftChatMemberRestricted);
function TftChatMemberRestrictedFromJson(const AJSON: TJSONData): TftChatMemberRestricted;
procedure FillTftChatMemberUpdated(const AJSON: TJSONData; const AObj: TftChatMemberUpdated);
function TftChatMemberUpdatedFromJson(const AJSON: TJSONData): TftChatMemberUpdated;
procedure FillTftChatOwnerChanged(const AJSON: TJSONData; const AObj: TftChatOwnerChanged);
function TftChatOwnerChangedFromJson(const AJSON: TJSONData): TftChatOwnerChanged;
procedure FillTftChatOwnerLeft(const AJSON: TJSONData; const AObj: TftChatOwnerLeft);
function TftChatOwnerLeftFromJson(const AJSON: TJSONData): TftChatOwnerLeft;
procedure FillTftChatPermissions(const AJSON: TJSONData; const AObj: TftChatPermissions);
function TftChatPermissionsFromJson(const AJSON: TJSONData): TftChatPermissions;
procedure FillTftChatPhoto(const AJSON: TJSONData; const AObj: TftChatPhoto);
function TftChatPhotoFromJson(const AJSON: TJSONData): TftChatPhoto;
procedure FillTftChecklist(const AJSON: TJSONData; const AObj: TftChecklist);
function TftChecklistFromJson(const AJSON: TJSONData): TftChecklist;
procedure FillTftChecklistTask(const AJSON: TJSONData; const AObj: TftChecklistTask);
function TftChecklistTaskFromJson(const AJSON: TJSONData): TftChecklistTask;
procedure FillTftChecklistTasksAdded(const AJSON: TJSONData; const AObj: TftChecklistTasksAdded);
function TftChecklistTasksAddedFromJson(const AJSON: TJSONData): TftChecklistTasksAdded;
procedure FillTftChecklistTasksDone(const AJSON: TJSONData; const AObj: TftChecklistTasksDone);
function TftChecklistTasksDoneFromJson(const AJSON: TJSONData): TftChecklistTasksDone;
procedure FillTftChosenInlineResult(const AJSON: TJSONData; const AObj: TftChosenInlineResult);
function TftChosenInlineResultFromJson(const AJSON: TJSONData): TftChosenInlineResult;
procedure FillTftContact(const AJSON: TJSONData; const AObj: TftContact);
function TftContactFromJson(const AJSON: TJSONData): TftContact;
procedure FillTftDice(const AJSON: TJSONData; const AObj: TftDice);
function TftDiceFromJson(const AJSON: TJSONData): TftDice;
procedure FillTftDirectMessagePriceChanged(const AJSON: TJSONData; const AObj: TftDirectMessagePriceChanged);
function TftDirectMessagePriceChangedFromJson(const AJSON: TJSONData): TftDirectMessagePriceChanged;
procedure FillTftDirectMessagesTopic(const AJSON: TJSONData; const AObj: TftDirectMessagesTopic);
function TftDirectMessagesTopicFromJson(const AJSON: TJSONData): TftDirectMessagesTopic;
procedure FillTftDocument(const AJSON: TJSONData; const AObj: TftDocument);
function TftDocumentFromJson(const AJSON: TJSONData): TftDocument;
procedure FillTftEncryptedCredential(const AJSON: TJSONData; const AObj: TftEncryptedCredential);
function TftEncryptedCredentialFromJson(const AJSON: TJSONData): TftEncryptedCredential;
procedure FillTftEncryptedCredentials(const AJSON: TJSONData; const AObj: TftEncryptedCredentials);
function TftEncryptedCredentialsFromJson(const AJSON: TJSONData): TftEncryptedCredentials;
procedure FillTftEncryptedPassportElement(const AJSON: TJSONData; const AObj: TftEncryptedPassportElement);
function TftEncryptedPassportElementFromJson(const AJSON: TJSONData): TftEncryptedPassportElement;
procedure FillTftFile(const AJSON: TJSONData; const AObj: TftFile);
function TftFileFromJson(const AJSON: TJSONData): TftFile;
procedure FillTftForceReply(const AJSON: TJSONData; const AObj: TftForceReply);
function TftForceReplyFromJson(const AJSON: TJSONData): TftForceReply;
procedure FillTftForumTopic(const AJSON: TJSONData; const AObj: TftForumTopic);
function TftForumTopicFromJson(const AJSON: TJSONData): TftForumTopic;
procedure FillTftForumTopicClosed(const AJSON: TJSONData; const AObj: TftForumTopicClosed);
function TftForumTopicClosedFromJson(const AJSON: TJSONData): TftForumTopicClosed;
procedure FillTftForumTopicCreated(const AJSON: TJSONData; const AObj: TftForumTopicCreated);
function TftForumTopicCreatedFromJson(const AJSON: TJSONData): TftForumTopicCreated;
procedure FillTftForumTopicEdited(const AJSON: TJSONData; const AObj: TftForumTopicEdited);
function TftForumTopicEditedFromJson(const AJSON: TJSONData): TftForumTopicEdited;
procedure FillTftForumTopicReopened(const AJSON: TJSONData; const AObj: TftForumTopicReopened);
function TftForumTopicReopenedFromJson(const AJSON: TJSONData): TftForumTopicReopened;
procedure FillTftGame(const AJSON: TJSONData; const AObj: TftGame);
function TftGameFromJson(const AJSON: TJSONData): TftGame;
procedure FillTftGameHighScore(const AJSON: TJSONData; const AObj: TftGameHighScore);
function TftGameHighScoreFromJson(const AJSON: TJSONData): TftGameHighScore;
procedure FillTftGeneralForumTopicHidden(const AJSON: TJSONData; const AObj: TftGeneralForumTopicHidden);
function TftGeneralForumTopicHiddenFromJson(const AJSON: TJSONData): TftGeneralForumTopicHidden;
procedure FillTftGeneralForumTopicUnhidden(const AJSON: TJSONData; const AObj: TftGeneralForumTopicUnhidden);
function TftGeneralForumTopicUnhiddenFromJson(const AJSON: TJSONData): TftGeneralForumTopicUnhidden;
procedure FillTftGift(const AJSON: TJSONData; const AObj: TftGift);
function TftGiftFromJson(const AJSON: TJSONData): TftGift;
procedure FillTftGiftBackground(const AJSON: TJSONData; const AObj: TftGiftBackground);
function TftGiftBackgroundFromJson(const AJSON: TJSONData): TftGiftBackground;
procedure FillTftGiftInfo(const AJSON: TJSONData; const AObj: TftGiftInfo);
function TftGiftInfoFromJson(const AJSON: TJSONData): TftGiftInfo;
procedure FillTftGifts(const AJSON: TJSONData; const AObj: TftGifts);
function TftGiftsFromJson(const AJSON: TJSONData): TftGifts;
procedure FillTftInlineKeyboardButton(const AJSON: TJSONData; const AObj: TftInlineKeyboardButton);
function TftInlineKeyboardButtonFromJson(const AJSON: TJSONData): TftInlineKeyboardButton;
procedure FillTftInlineKeyboardMarkup(const AJSON: TJSONData; const AObj: TftInlineKeyboardMarkup);
function TftInlineKeyboardMarkupFromJson(const AJSON: TJSONData): TftInlineKeyboardMarkup;
procedure FillTftInlineQuery(const AJSON: TJSONData; const AObj: TftInlineQuery);
function TftInlineQueryFromJson(const AJSON: TJSONData): TftInlineQuery;
procedure FillTftInlineQueryResult(const AJSON: TJSONData; const AObj: TftInlineQueryResult);
function TftInlineQueryResultFromJson(const AJSON: TJSONData): TftInlineQueryResult;
procedure FillTftInlineQueryResultArticle(const AJSON: TJSONData; const AObj: TftInlineQueryResultArticle);
function TftInlineQueryResultArticleFromJson(const AJSON: TJSONData): TftInlineQueryResultArticle;
procedure FillTftInlineQueryResultAudio(const AJSON: TJSONData; const AObj: TftInlineQueryResultAudio);
function TftInlineQueryResultAudioFromJson(const AJSON: TJSONData): TftInlineQueryResultAudio;
procedure FillTftInlineQueryResultCachedAudio(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedAudio);
function TftInlineQueryResultCachedAudioFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedAudio;
procedure FillTftInlineQueryResultCachedDocument(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedDocument);
function TftInlineQueryResultCachedDocumentFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedDocument;
procedure FillTftInlineQueryResultCachedGif(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedGif);
function TftInlineQueryResultCachedGifFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedGif;
procedure FillTftInlineQueryResultCachedMpeg4Gif(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedMpeg4Gif);
function TftInlineQueryResultCachedMpeg4GifFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedMpeg4Gif;
procedure FillTftInlineQueryResultCachedPhoto(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedPhoto);
function TftInlineQueryResultCachedPhotoFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedPhoto;
procedure FillTftInlineQueryResultCachedSticker(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedSticker);
function TftInlineQueryResultCachedStickerFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedSticker;
procedure FillTftInlineQueryResultCachedVideo(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedVideo);
function TftInlineQueryResultCachedVideoFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedVideo;
procedure FillTftInlineQueryResultCachedVoice(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedVoice);
function TftInlineQueryResultCachedVoiceFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedVoice;
procedure FillTftInlineQueryResultContact(const AJSON: TJSONData; const AObj: TftInlineQueryResultContact);
function TftInlineQueryResultContactFromJson(const AJSON: TJSONData): TftInlineQueryResultContact;
procedure FillTftInlineQueryResultDocument(const AJSON: TJSONData; const AObj: TftInlineQueryResultDocument);
function TftInlineQueryResultDocumentFromJson(const AJSON: TJSONData): TftInlineQueryResultDocument;
procedure FillTftInlineQueryResultGame(const AJSON: TJSONData; const AObj: TftInlineQueryResultGame);
function TftInlineQueryResultGameFromJson(const AJSON: TJSONData): TftInlineQueryResultGame;
procedure FillTftInlineQueryResultGif(const AJSON: TJSONData; const AObj: TftInlineQueryResultGif);
function TftInlineQueryResultGifFromJson(const AJSON: TJSONData): TftInlineQueryResultGif;
procedure FillTftInlineQueryResultLocation(const AJSON: TJSONData; const AObj: TftInlineQueryResultLocation);
function TftInlineQueryResultLocationFromJson(const AJSON: TJSONData): TftInlineQueryResultLocation;
procedure FillTftInlineQueryResultMpeg4Gif(const AJSON: TJSONData; const AObj: TftInlineQueryResultMpeg4Gif);
function TftInlineQueryResultMpeg4GifFromJson(const AJSON: TJSONData): TftInlineQueryResultMpeg4Gif;
procedure FillTftInlineQueryResultPhoto(const AJSON: TJSONData; const AObj: TftInlineQueryResultPhoto);
function TftInlineQueryResultPhotoFromJson(const AJSON: TJSONData): TftInlineQueryResultPhoto;
procedure FillTftInlineQueryResultVenue(const AJSON: TJSONData; const AObj: TftInlineQueryResultVenue);
function TftInlineQueryResultVenueFromJson(const AJSON: TJSONData): TftInlineQueryResultVenue;
procedure FillTftInlineQueryResultVideo(const AJSON: TJSONData; const AObj: TftInlineQueryResultVideo);
function TftInlineQueryResultVideoFromJson(const AJSON: TJSONData): TftInlineQueryResultVideo;
procedure FillTftInlineQueryResultVoice(const AJSON: TJSONData; const AObj: TftInlineQueryResultVoice);
function TftInlineQueryResultVoiceFromJson(const AJSON: TJSONData): TftInlineQueryResultVoice;
procedure FillTftInputChecklist(const AJSON: TJSONData; const AObj: TftInputChecklist);
function TftInputChecklistFromJson(const AJSON: TJSONData): TftInputChecklist;
procedure FillTftInputChecklistTask(const AJSON: TJSONData; const AObj: TftInputChecklistTask);
function TftInputChecklistTaskFromJson(const AJSON: TJSONData): TftInputChecklistTask;
procedure FillTftInputContactMessageContent(const AJSON: TJSONData; const AObj: TftInputContactMessageContent);
function TftInputContactMessageContentFromJson(const AJSON: TJSONData): TftInputContactMessageContent;
procedure FillTftInputFile(const AJSON: TJSONData; const AObj: TftInputFile);
function TftInputFileFromJson(const AJSON: TJSONData): TftInputFile;
procedure FillTftInputInvoiceMessageContent(const AJSON: TJSONData; const AObj: TftInputInvoiceMessageContent);
function TftInputInvoiceMessageContentFromJson(const AJSON: TJSONData): TftInputInvoiceMessageContent;
procedure FillTftInputLocationMessageContent(const AJSON: TJSONData; const AObj: TftInputLocationMessageContent);
function TftInputLocationMessageContentFromJson(const AJSON: TJSONData): TftInputLocationMessageContent;
procedure FillTftInputMedia(const AJSON: TJSONData; const AObj: TftInputMedia);
function TftInputMediaFromJson(const AJSON: TJSONData): TftInputMedia;
procedure FillTftInputMediaAnimation(const AJSON: TJSONData; const AObj: TftInputMediaAnimation);
function TftInputMediaAnimationFromJson(const AJSON: TJSONData): TftInputMediaAnimation;
procedure FillTftInputMediaAudio(const AJSON: TJSONData; const AObj: TftInputMediaAudio);
function TftInputMediaAudioFromJson(const AJSON: TJSONData): TftInputMediaAudio;
procedure FillTftInputMediaDocument(const AJSON: TJSONData; const AObj: TftInputMediaDocument);
function TftInputMediaDocumentFromJson(const AJSON: TJSONData): TftInputMediaDocument;
procedure FillTftInputMediaPhoto(const AJSON: TJSONData; const AObj: TftInputMediaPhoto);
function TftInputMediaPhotoFromJson(const AJSON: TJSONData): TftInputMediaPhoto;
procedure FillTftInputMediaVideo(const AJSON: TJSONData; const AObj: TftInputMediaVideo);
function TftInputMediaVideoFromJson(const AJSON: TJSONData): TftInputMediaVideo;
procedure FillTftInputMessageContent(const AJSON: TJSONData; const AObj: TftInputMessageContent);
function TftInputMessageContentFromJson(const AJSON: TJSONData): TftInputMessageContent;
procedure FillTftInputPaidMedia(const AJSON: TJSONData; const AObj: TftInputPaidMedia);
function TftInputPaidMediaFromJson(const AJSON: TJSONData): TftInputPaidMedia;
procedure FillTftInputPaidMediaLivePhoto(const AJSON: TJSONData; const AObj: TftInputPaidMediaLivePhoto);
function TftInputPaidMediaLivePhotoFromJson(const AJSON: TJSONData): TftInputPaidMediaLivePhoto;
procedure FillTftInputPaidMediaPhoto(const AJSON: TJSONData; const AObj: TftInputPaidMediaPhoto);
function TftInputPaidMediaPhotoFromJson(const AJSON: TJSONData): TftInputPaidMediaPhoto;
procedure FillTftInputPaidMediaVideo(const AJSON: TJSONData; const AObj: TftInputPaidMediaVideo);
function TftInputPaidMediaVideoFromJson(const AJSON: TJSONData): TftInputPaidMediaVideo;
procedure FillTftInputProfilePhoto(const AJSON: TJSONData; const AObj: TftInputProfilePhoto);
function TftInputProfilePhotoFromJson(const AJSON: TJSONData): TftInputProfilePhoto;
procedure FillTftInputRichBlock(const AJSON: TJSONData; const AObj: TftInputRichBlock);
function TftInputRichBlockFromJson(const AJSON: TJSONData): TftInputRichBlock;
procedure FillTftInputRichBlockListItem(const AJSON: TJSONData; const AObj: TftInputRichBlockListItem);
function TftInputRichBlockListItemFromJson(const AJSON: TJSONData): TftInputRichBlockListItem;
procedure FillTftInputRichMessage(const AJSON: TJSONData; const AObj: TftInputRichMessage);
function TftInputRichMessageFromJson(const AJSON: TJSONData): TftInputRichMessage;
procedure FillTftInputRichMessageMedia(const AJSON: TJSONData; const AObj: TftInputRichMessageMedia);
function TftInputRichMessageMediaFromJson(const AJSON: TJSONData): TftInputRichMessageMedia;
procedure FillTftInputSticker(const AJSON: TJSONData; const AObj: TftInputSticker);
function TftInputStickerFromJson(const AJSON: TJSONData): TftInputSticker;
procedure FillTftInputStoryContent(const AJSON: TJSONData; const AObj: TftInputStoryContent);
function TftInputStoryContentFromJson(const AJSON: TJSONData): TftInputStoryContent;
procedure FillTftInputTextMessageContent(const AJSON: TJSONData; const AObj: TftInputTextMessageContent);
function TftInputTextMessageContentFromJson(const AJSON: TJSONData): TftInputTextMessageContent;
procedure FillTftInputVenueMessageContent(const AJSON: TJSONData; const AObj: TftInputVenueMessageContent);
function TftInputVenueMessageContentFromJson(const AJSON: TJSONData): TftInputVenueMessageContent;
procedure FillTftInvoice(const AJSON: TJSONData; const AObj: TftInvoice);
function TftInvoiceFromJson(const AJSON: TJSONData): TftInvoice;
procedure FillTftKeyboardButton(const AJSON: TJSONData; const AObj: TftKeyboardButton);
function TftKeyboardButtonFromJson(const AJSON: TJSONData): TftKeyboardButton;
procedure FillTftKeyboardButtonPollType(const AJSON: TJSONData; const AObj: TftKeyboardButtonPollType);
function TftKeyboardButtonPollTypeFromJson(const AJSON: TJSONData): TftKeyboardButtonPollType;
procedure FillTftLabeledPrice(const AJSON: TJSONData; const AObj: TftLabeledPrice);
function TftLabeledPriceFromJson(const AJSON: TJSONData): TftLabeledPrice;
procedure FillTftLinkPreviewOptions(const AJSON: TJSONData; const AObj: TftLinkPreviewOptions);
function TftLinkPreviewOptionsFromJson(const AJSON: TJSONData): TftLinkPreviewOptions;
procedure FillTftLivePhoto(const AJSON: TJSONData; const AObj: TftLivePhoto);
function TftLivePhotoFromJson(const AJSON: TJSONData): TftLivePhoto;
procedure FillTftLocation(const AJSON: TJSONData; const AObj: TftLocation);
function TftLocationFromJson(const AJSON: TJSONData): TftLocation;
procedure FillTftLoginUrl(const AJSON: TJSONData; const AObj: TftLoginUrl);
function TftLoginUrlFromJson(const AJSON: TJSONData): TftLoginUrl;
procedure FillTftManagedBotUpdated(const AJSON: TJSONData; const AObj: TftManagedBotUpdated);
function TftManagedBotUpdatedFromJson(const AJSON: TJSONData): TftManagedBotUpdated;
procedure FillTftMaskPosition(const AJSON: TJSONData; const AObj: TftMaskPosition);
function TftMaskPositionFromJson(const AJSON: TJSONData): TftMaskPosition;
procedure FillTftMenuButton(const AJSON: TJSONData; const AObj: TftMenuButton);
function TftMenuButtonFromJson(const AJSON: TJSONData): TftMenuButton;
procedure FillTftMenuButtonCommands(const AJSON: TJSONData; const AObj: TftMenuButtonCommands);
function TftMenuButtonCommandsFromJson(const AJSON: TJSONData): TftMenuButtonCommands;
procedure FillTftMenuButtonDefault(const AJSON: TJSONData; const AObj: TftMenuButtonDefault);
function TftMenuButtonDefaultFromJson(const AJSON: TJSONData): TftMenuButtonDefault;
procedure FillTftMenuButtonWebApp(const AJSON: TJSONData; const AObj: TftMenuButtonWebApp);
function TftMenuButtonWebAppFromJson(const AJSON: TJSONData): TftMenuButtonWebApp;
procedure FillTftMessage(const AJSON: TJSONData; const AObj: TftMessage);
function TftMessageFromJson(const AJSON: TJSONData): TftMessage;
procedure FillTftMessageAutoDeleteTimerChanged(const AJSON: TJSONData; const AObj: TftMessageAutoDeleteTimerChanged);
function TftMessageAutoDeleteTimerChangedFromJson(const AJSON: TJSONData): TftMessageAutoDeleteTimerChanged;
procedure FillTftMessageEntity(const AJSON: TJSONData; const AObj: TftMessageEntity);
function TftMessageEntityFromJson(const AJSON: TJSONData): TftMessageEntity;
procedure FillTftMessageGenerationStopped(const AJSON: TJSONData; const AObj: TftMessageGenerationStopped);
function TftMessageGenerationStoppedFromJson(const AJSON: TJSONData): TftMessageGenerationStopped;
procedure FillTftMessageId(const AJSON: TJSONData; const AObj: TftMessageId);
function TftMessageIdFromJson(const AJSON: TJSONData): TftMessageId;
procedure FillTftMessageReactionCountUpdated(const AJSON: TJSONData; const AObj: TftMessageReactionCountUpdated);
function TftMessageReactionCountUpdatedFromJson(const AJSON: TJSONData): TftMessageReactionCountUpdated;
procedure FillTftMessageReactionUpdated(const AJSON: TJSONData; const AObj: TftMessageReactionUpdated);
function TftMessageReactionUpdatedFromJson(const AJSON: TJSONData): TftMessageReactionUpdated;
procedure FillTftOrderInfo(const AJSON: TJSONData; const AObj: TftOrderInfo);
function TftOrderInfoFromJson(const AJSON: TJSONData): TftOrderInfo;
procedure FillTftOwnedGift(const AJSON: TJSONData; const AObj: TftOwnedGift);
function TftOwnedGiftFromJson(const AJSON: TJSONData): TftOwnedGift;
procedure FillTftOwnedGifts(const AJSON: TJSONData; const AObj: TftOwnedGifts);
function TftOwnedGiftsFromJson(const AJSON: TJSONData): TftOwnedGifts;
procedure FillTftPaidMedia(const AJSON: TJSONData; const AObj: TftPaidMedia);
function TftPaidMediaFromJson(const AJSON: TJSONData): TftPaidMedia;
procedure FillTftPaidMediaInfo(const AJSON: TJSONData; const AObj: TftPaidMediaInfo);
function TftPaidMediaInfoFromJson(const AJSON: TJSONData): TftPaidMediaInfo;
procedure FillTftPaidMediaLivePhoto(const AJSON: TJSONData; const AObj: TftPaidMediaLivePhoto);
function TftPaidMediaLivePhotoFromJson(const AJSON: TJSONData): TftPaidMediaLivePhoto;
procedure FillTftPaidMediaPhoto(const AJSON: TJSONData; const AObj: TftPaidMediaPhoto);
function TftPaidMediaPhotoFromJson(const AJSON: TJSONData): TftPaidMediaPhoto;
procedure FillTftPaidMediaPurchased(const AJSON: TJSONData; const AObj: TftPaidMediaPurchased);
function TftPaidMediaPurchasedFromJson(const AJSON: TJSONData): TftPaidMediaPurchased;
procedure FillTftPaidMediaVideo(const AJSON: TJSONData; const AObj: TftPaidMediaVideo);
function TftPaidMediaVideoFromJson(const AJSON: TJSONData): TftPaidMediaVideo;
procedure FillTftPaidMessagePriceChanged(const AJSON: TJSONData; const AObj: TftPaidMessagePriceChanged);
function TftPaidMessagePriceChangedFromJson(const AJSON: TJSONData): TftPaidMessagePriceChanged;
procedure FillTftPassportData(const AJSON: TJSONData; const AObj: TftPassportData);
function TftPassportDataFromJson(const AJSON: TJSONData): TftPassportData;
procedure FillTftPassportElementError(const AJSON: TJSONData; const AObj: TftPassportElementError);
function TftPassportElementErrorFromJson(const AJSON: TJSONData): TftPassportElementError;
procedure FillTftPassportElementErrorDataField(const AJSON: TJSONData; const AObj: TftPassportElementErrorDataField);
function TftPassportElementErrorDataFieldFromJson(const AJSON: TJSONData): TftPassportElementErrorDataField;
procedure FillTftPassportElementErrorFile(const AJSON: TJSONData; const AObj: TftPassportElementErrorFile);
function TftPassportElementErrorFileFromJson(const AJSON: TJSONData): TftPassportElementErrorFile;
procedure FillTftPassportElementErrorFiles(const AJSON: TJSONData; const AObj: TftPassportElementErrorFiles);
function TftPassportElementErrorFilesFromJson(const AJSON: TJSONData): TftPassportElementErrorFiles;
procedure FillTftPassportElementErrorFrontSide(const AJSON: TJSONData; const AObj: TftPassportElementErrorFrontSide);
function TftPassportElementErrorFrontSideFromJson(const AJSON: TJSONData): TftPassportElementErrorFrontSide;
procedure FillTftPassportElementErrorReverseSide(const AJSON: TJSONData; const AObj: TftPassportElementErrorReverseSide);
function TftPassportElementErrorReverseSideFromJson(const AJSON: TJSONData): TftPassportElementErrorReverseSide;
procedure FillTftPassportElementErrorSelfie(const AJSON: TJSONData; const AObj: TftPassportElementErrorSelfie);
function TftPassportElementErrorSelfieFromJson(const AJSON: TJSONData): TftPassportElementErrorSelfie;
procedure FillTftPassportElementErrorTranslationFile(const AJSON: TJSONData; const AObj: TftPassportElementErrorTranslationFile);
function TftPassportElementErrorTranslationFileFromJson(const AJSON: TJSONData): TftPassportElementErrorTranslationFile;
procedure FillTftPassportElementErrorTranslationFiles(const AJSON: TJSONData; const AObj: TftPassportElementErrorTranslationFiles);
function TftPassportElementErrorTranslationFilesFromJson(const AJSON: TJSONData): TftPassportElementErrorTranslationFiles;
procedure FillTftPassportElementErrorUnspecified(const AJSON: TJSONData; const AObj: TftPassportElementErrorUnspecified);
function TftPassportElementErrorUnspecifiedFromJson(const AJSON: TJSONData): TftPassportElementErrorUnspecified;
procedure FillTftPassportFile(const AJSON: TJSONData; const AObj: TftPassportFile);
function TftPassportFileFromJson(const AJSON: TJSONData): TftPassportFile;
procedure FillTftPhotoSize(const AJSON: TJSONData; const AObj: TftPhotoSize);
function TftPhotoSizeFromJson(const AJSON: TJSONData): TftPhotoSize;
procedure FillTftPoll(const AJSON: TJSONData; const AObj: TftPoll);
function TftPollFromJson(const AJSON: TJSONData): TftPoll;
procedure FillTftPollAnswer(const AJSON: TJSONData; const AObj: TftPollAnswer);
function TftPollAnswerFromJson(const AJSON: TJSONData): TftPollAnswer;
procedure FillTftPollOption(const AJSON: TJSONData; const AObj: TftPollOption);
function TftPollOptionFromJson(const AJSON: TJSONData): TftPollOption;
procedure FillTftPollOptionAdded(const AJSON: TJSONData; const AObj: TftPollOptionAdded);
function TftPollOptionAddedFromJson(const AJSON: TJSONData): TftPollOptionAdded;
procedure FillTftPollOptionDeleted(const AJSON: TJSONData; const AObj: TftPollOptionDeleted);
function TftPollOptionDeletedFromJson(const AJSON: TJSONData): TftPollOptionDeleted;
procedure FillTftPreCheckoutQuery(const AJSON: TJSONData; const AObj: TftPreCheckoutQuery);
function TftPreCheckoutQueryFromJson(const AJSON: TJSONData): TftPreCheckoutQuery;
procedure FillTftPreparedInlineMessage(const AJSON: TJSONData; const AObj: TftPreparedInlineMessage);
function TftPreparedInlineMessageFromJson(const AJSON: TJSONData): TftPreparedInlineMessage;
procedure FillTftPreparedKeyboardButton(const AJSON: TJSONData; const AObj: TftPreparedKeyboardButton);
function TftPreparedKeyboardButtonFromJson(const AJSON: TJSONData): TftPreparedKeyboardButton;
procedure FillTftProximityAlertTriggered(const AJSON: TJSONData; const AObj: TftProximityAlertTriggered);
function TftProximityAlertTriggeredFromJson(const AJSON: TJSONData): TftProximityAlertTriggered;
procedure FillTftReactionCount(const AJSON: TJSONData; const AObj: TftReactionCount);
function TftReactionCountFromJson(const AJSON: TJSONData): TftReactionCount;
procedure FillTftReactionType(const AJSON: TJSONData; const AObj: TftReactionType);
function TftReactionTypeFromJson(const AJSON: TJSONData): TftReactionType;
procedure FillTftRefundedPayment(const AJSON: TJSONData; const AObj: TftRefundedPayment);
function TftRefundedPaymentFromJson(const AJSON: TJSONData): TftRefundedPayment;
procedure FillTftReplyBase(const AJSON: TJSONData; const AObj: TftReplyBase);
function TftReplyBaseFromJson(const AJSON: TJSONData): TftReplyBase;
procedure FillTftReplyKeyboardMarkup(const AJSON: TJSONData; const AObj: TftReplyKeyboardMarkup);
function TftReplyKeyboardMarkupFromJson(const AJSON: TJSONData): TftReplyKeyboardMarkup;
procedure FillTftReplyKeyboardRemove(const AJSON: TJSONData; const AObj: TftReplyKeyboardRemove);
function TftReplyKeyboardRemoveFromJson(const AJSON: TJSONData): TftReplyKeyboardRemove;
procedure FillTftReplyParameters(const AJSON: TJSONData; const AObj: TftReplyParameters);
function TftReplyParametersFromJson(const AJSON: TJSONData): TftReplyParameters;
procedure FillTftResponseParameters(const AJSON: TJSONData; const AObj: TftResponseParameters);
function TftResponseParametersFromJson(const AJSON: TJSONData): TftResponseParameters;
procedure FillTftRichBlockCaption(const AJSON: TJSONData; const AObj: TftRichBlockCaption);
function TftRichBlockCaptionFromJson(const AJSON: TJSONData): TftRichBlockCaption;
procedure FillTftRichBlockTableCell(const AJSON: TJSONData; const AObj: TftRichBlockTableCell);
function TftRichBlockTableCellFromJson(const AJSON: TJSONData): TftRichBlockTableCell;
procedure FillTftRichInputMedia(const AJSON: TJSONData; const AObj: TftRichInputMedia);
function TftRichInputMediaFromJson(const AJSON: TJSONData): TftRichInputMedia;
procedure FillTftRichMessage(const AJSON: TJSONData; const AObj: TftRichMessage);
function TftRichMessageFromJson(const AJSON: TJSONData): TftRichMessage;
procedure FillTftRichMessageButton(const AJSON: TJSONData; const AObj: TftRichMessageButton);
function TftRichMessageButtonFromJson(const AJSON: TJSONData): TftRichMessageButton;
procedure FillTftRichText(const AJSON: TJSONData; const AObj: TftRichText);
function TftRichTextFromJson(const AJSON: TJSONData): TftRichText;
procedure FillTftSentGuestMessage(const AJSON: TJSONData; const AObj: TftSentGuestMessage);
function TftSentGuestMessageFromJson(const AJSON: TJSONData): TftSentGuestMessage;
procedure FillTftSentWebAppMessage(const AJSON: TJSONData; const AObj: TftSentWebAppMessage);
function TftSentWebAppMessageFromJson(const AJSON: TJSONData): TftSentWebAppMessage;
procedure FillTftShippingAddress(const AJSON: TJSONData; const AObj: TftShippingAddress);
function TftShippingAddressFromJson(const AJSON: TJSONData): TftShippingAddress;
procedure FillTftShippingOption(const AJSON: TJSONData; const AObj: TftShippingOption);
function TftShippingOptionFromJson(const AJSON: TJSONData): TftShippingOption;
procedure FillTftShippingQuery(const AJSON: TJSONData; const AObj: TftShippingQuery);
function TftShippingQueryFromJson(const AJSON: TJSONData): TftShippingQuery;
procedure FillTftStarAmount(const AJSON: TJSONData; const AObj: TftStarAmount);
function TftStarAmountFromJson(const AJSON: TJSONData): TftStarAmount;
procedure FillTftStarTransaction(const AJSON: TJSONData; const AObj: TftStarTransaction);
function TftStarTransactionFromJson(const AJSON: TJSONData): TftStarTransaction;
procedure FillTftStarTransactions(const AJSON: TJSONData; const AObj: TftStarTransactions);
function TftStarTransactionsFromJson(const AJSON: TJSONData): TftStarTransactions;
procedure FillTftSticker(const AJSON: TJSONData; const AObj: TftSticker);
function TftStickerFromJson(const AJSON: TJSONData): TftSticker;
procedure FillTftStickerSet(const AJSON: TJSONData; const AObj: TftStickerSet);
function TftStickerSetFromJson(const AJSON: TJSONData): TftStickerSet;
procedure FillTftStory(const AJSON: TJSONData; const AObj: TftStory);
function TftStoryFromJson(const AJSON: TJSONData): TftStory;
procedure FillTftSuccessfulPayment(const AJSON: TJSONData; const AObj: TftSuccessfulPayment);
function TftSuccessfulPaymentFromJson(const AJSON: TJSONData): TftSuccessfulPayment;
procedure FillTftSuggestedPostApprovalFailed(const AJSON: TJSONData; const AObj: TftSuggestedPostApprovalFailed);
function TftSuggestedPostApprovalFailedFromJson(const AJSON: TJSONData): TftSuggestedPostApprovalFailed;
procedure FillTftSuggestedPostApproved(const AJSON: TJSONData; const AObj: TftSuggestedPostApproved);
function TftSuggestedPostApprovedFromJson(const AJSON: TJSONData): TftSuggestedPostApproved;
procedure FillTftSuggestedPostDeclined(const AJSON: TJSONData; const AObj: TftSuggestedPostDeclined);
function TftSuggestedPostDeclinedFromJson(const AJSON: TJSONData): TftSuggestedPostDeclined;
procedure FillTftSuggestedPostInfo(const AJSON: TJSONData; const AObj: TftSuggestedPostInfo);
function TftSuggestedPostInfoFromJson(const AJSON: TJSONData): TftSuggestedPostInfo;
procedure FillTftSuggestedPostPaid(const AJSON: TJSONData; const AObj: TftSuggestedPostPaid);
function TftSuggestedPostPaidFromJson(const AJSON: TJSONData): TftSuggestedPostPaid;
procedure FillTftSuggestedPostParameters(const AJSON: TJSONData; const AObj: TftSuggestedPostParameters);
function TftSuggestedPostParametersFromJson(const AJSON: TJSONData): TftSuggestedPostParameters;
procedure FillTftSuggestedPostPrice(const AJSON: TJSONData; const AObj: TftSuggestedPostPrice);
function TftSuggestedPostPriceFromJson(const AJSON: TJSONData): TftSuggestedPostPrice;
procedure FillTftSuggestedPostRefunded(const AJSON: TJSONData; const AObj: TftSuggestedPostRefunded);
function TftSuggestedPostRefundedFromJson(const AJSON: TJSONData): TftSuggestedPostRefunded;
procedure FillTftTransactionPartner(const AJSON: TJSONData; const AObj: TftTransactionPartner);
function TftTransactionPartnerFromJson(const AJSON: TJSONData): TftTransactionPartner;
procedure FillTftUniqueGift(const AJSON: TJSONData; const AObj: TftUniqueGift);
function TftUniqueGiftFromJson(const AJSON: TJSONData): TftUniqueGift;
procedure FillTftUniqueGiftBackdrop(const AJSON: TJSONData; const AObj: TftUniqueGiftBackdrop);
function TftUniqueGiftBackdropFromJson(const AJSON: TJSONData): TftUniqueGiftBackdrop;
procedure FillTftUniqueGiftBackdropColors(const AJSON: TJSONData; const AObj: TftUniqueGiftBackdropColors);
function TftUniqueGiftBackdropColorsFromJson(const AJSON: TJSONData): TftUniqueGiftBackdropColors;
procedure FillTftUniqueGiftColors(const AJSON: TJSONData; const AObj: TftUniqueGiftColors);
function TftUniqueGiftColorsFromJson(const AJSON: TJSONData): TftUniqueGiftColors;
procedure FillTftUniqueGiftInfo(const AJSON: TJSONData; const AObj: TftUniqueGiftInfo);
function TftUniqueGiftInfoFromJson(const AJSON: TJSONData): TftUniqueGiftInfo;
procedure FillTftUniqueGiftModel(const AJSON: TJSONData; const AObj: TftUniqueGiftModel);
function TftUniqueGiftModelFromJson(const AJSON: TJSONData): TftUniqueGiftModel;
procedure FillTftUniqueGiftSymbol(const AJSON: TJSONData; const AObj: TftUniqueGiftSymbol);
function TftUniqueGiftSymbolFromJson(const AJSON: TJSONData): TftUniqueGiftSymbol;
procedure FillTftUpdate(const AJSON: TJSONData; const AObj: TftUpdate);
function TftUpdateFromJson(const AJSON: TJSONData): TftUpdate;
procedure FillTftUser(const AJSON: TJSONData; const AObj: TftUser);
function TftUserFromJson(const AJSON: TJSONData): TftUser;
procedure FillTftUserChatBoosts(const AJSON: TJSONData; const AObj: TftUserChatBoosts);
function TftUserChatBoostsFromJson(const AJSON: TJSONData): TftUserChatBoosts;
procedure FillTftUserProfileAudios(const AJSON: TJSONData; const AObj: TftUserProfileAudios);
function TftUserProfileAudiosFromJson(const AJSON: TJSONData): TftUserProfileAudios;
procedure FillTftUserProfilePhotos(const AJSON: TJSONData; const AObj: TftUserProfilePhotos);
function TftUserProfilePhotosFromJson(const AJSON: TJSONData): TftUserProfilePhotos;
procedure FillTftVenue(const AJSON: TJSONData; const AObj: TftVenue);
function TftVenueFromJson(const AJSON: TJSONData): TftVenue;
procedure FillTftVideo(const AJSON: TJSONData; const AObj: TftVideo);
function TftVideoFromJson(const AJSON: TJSONData): TftVideo;
procedure FillTftVideoChatEnded(const AJSON: TJSONData; const AObj: TftVideoChatEnded);
function TftVideoChatEndedFromJson(const AJSON: TJSONData): TftVideoChatEnded;
procedure FillTftVideoChatParticipantsInvited(const AJSON: TJSONData; const AObj: TftVideoChatParticipantsInvited);
function TftVideoChatParticipantsInvitedFromJson(const AJSON: TJSONData): TftVideoChatParticipantsInvited;
procedure FillTftVideoChatScheduled(const AJSON: TJSONData; const AObj: TftVideoChatScheduled);
function TftVideoChatScheduledFromJson(const AJSON: TJSONData): TftVideoChatScheduled;
procedure FillTftVideoChatStarted(const AJSON: TJSONData; const AObj: TftVideoChatStarted);
function TftVideoChatStartedFromJson(const AJSON: TJSONData): TftVideoChatStarted;
procedure FillTftVideoNote(const AJSON: TJSONData; const AObj: TftVideoNote);
function TftVideoNoteFromJson(const AJSON: TJSONData): TftVideoNote;
procedure FillTftVoice(const AJSON: TJSONData; const AObj: TftVoice);
function TftVoiceFromJson(const AJSON: TJSONData): TftVoice;
procedure FillTftWebAppData(const AJSON: TJSONData; const AObj: TftWebAppData);
function TftWebAppDataFromJson(const AJSON: TJSONData): TftWebAppData;
procedure FillTftWebAppInfo(const AJSON: TJSONData; const AObj: TftWebAppInfo);
function TftWebAppInfoFromJson(const AJSON: TJSONData): TftWebAppInfo;
procedure FillTftWebhookInfo(const AJSON: TJSONData; const AObj: TftWebhookInfo);
function TftWebhookInfoFromJson(const AJSON: TJSONData): TftWebhookInfo;
procedure FillTftWriteAccessAllowed(const AJSON: TJSONData; const AObj: TftWriteAccessAllowed);
function TftWriteAccessAllowedFromJson(const AJSON: TJSONData): TftWriteAccessAllowed;

implementation

procedure FillTftAcceptedGiftTypes(const AJSON: TJSONData; const AObj: TftAcceptedGiftTypes);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('unlimited_gifts');
  if LValue <> nil then
  begin
    AObj.UnlimitedGifts := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('limited_gifts');
  if LValue <> nil then
  begin
    AObj.LimitedGifts := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('unique_gifts');
  if LValue <> nil then
  begin
    AObj.UniqueGifts := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('premium_subscription');
  if LValue <> nil then
  begin
    AObj.PremiumSubscription := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('gifts_from_channels');
  if LValue <> nil then
  begin
    AObj.GiftsFromChannels := LValue.AsBoolean;
  end;
end;

function TftAcceptedGiftTypesFromJson(const AJSON: TJSONData): TftAcceptedGiftTypes;
begin
  Result := TftAcceptedGiftTypes.Create;
  FillTftAcceptedGiftTypes(AJSON, Result);
end;

procedure FillTftAnimation(const AJSON: TJSONData; const AObj: TftAnimation);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
end;

function TftAnimationFromJson(const AJSON: TJSONData): TftAnimation;
begin
  Result := TftAnimation.Create;
  FillTftAnimation(AJSON, Result);
end;

procedure FillTftAudio(const AJSON: TJSONData; const AObj: TftAudio);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('performer');
  if LValue <> nil then
  begin
    AObj.Performer := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
end;

function TftAudioFromJson(const AJSON: TJSONData): TftAudio;
begin
  Result := TftAudio.Create;
  FillTftAudio(AJSON, Result);
end;

procedure FillTftBotAccessSettings(const AJSON: TJSONData; const AObj: TftBotAccessSettings);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_AddedUsers: TArray<TftUser>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('is_access_restricted');
  if LValue <> nil then
  begin
    AObj.IsAccessRestricted := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('added_users');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_AddedUsers := AObj.AddedUsers;
      SetLength(LArr_AddedUsers, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_AddedUsers[LI] := TftUserFromJson(TJSONArray(LValue).Items[LI]);
      AObj.AddedUsers := LArr_AddedUsers;
    end;
  end;
end;

function TftBotAccessSettingsFromJson(const AJSON: TJSONData): TftBotAccessSettings;
begin
  Result := TftBotAccessSettings.Create;
  FillTftBotAccessSettings(AJSON, Result);
end;

procedure FillTftBotCommand(const AJSON: TJSONData; const AObj: TftBotCommand);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('command');
  if LValue <> nil then
  begin
    AObj.Command := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
end;

function TftBotCommandFromJson(const AJSON: TJSONData): TftBotCommand;
begin
  Result := TftBotCommand.Create;
  FillTftBotCommand(AJSON, Result);
end;

procedure FillTftBotCommandScope(const AJSON: TJSONData; const AObj: TftBotCommandScope);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftBotCommandScopeFromJson(const AJSON: TJSONData): TftBotCommandScope;
begin
  Result := TftBotCommandScope.Create;
  FillTftBotCommandScope(AJSON, Result);
end;

procedure FillTftBotCommandScopeAllChatAdministrators(const AJSON: TJSONData; const AObj: TftBotCommandScopeAllChatAdministrators);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftBotCommandScopeAllChatAdministratorsFromJson(const AJSON: TJSONData): TftBotCommandScopeAllChatAdministrators;
begin
  Result := TftBotCommandScopeAllChatAdministrators.Create;
  FillTftBotCommandScopeAllChatAdministrators(AJSON, Result);
end;

procedure FillTftBotCommandScopeAllGroupChats(const AJSON: TJSONData; const AObj: TftBotCommandScopeAllGroupChats);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftBotCommandScopeAllGroupChatsFromJson(const AJSON: TJSONData): TftBotCommandScopeAllGroupChats;
begin
  Result := TftBotCommandScopeAllGroupChats.Create;
  FillTftBotCommandScopeAllGroupChats(AJSON, Result);
end;

procedure FillTftBotCommandScopeAllPrivateChats(const AJSON: TJSONData; const AObj: TftBotCommandScopeAllPrivateChats);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftBotCommandScopeAllPrivateChatsFromJson(const AJSON: TJSONData): TftBotCommandScopeAllPrivateChats;
begin
  Result := TftBotCommandScopeAllPrivateChats.Create;
  FillTftBotCommandScopeAllPrivateChats(AJSON, Result);
end;

procedure FillTftBotCommandScopeChat(const AJSON: TJSONData; const AObj: TftBotCommandScopeChat);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('chat_id');
  if LValue <> nil then
  begin
    AObj.ChatId := LValue.AsInt64;
  end;
end;

function TftBotCommandScopeChatFromJson(const AJSON: TJSONData): TftBotCommandScopeChat;
begin
  Result := TftBotCommandScopeChat.Create;
  FillTftBotCommandScopeChat(AJSON, Result);
end;

procedure FillTftBotCommandScopeChatAdministrators(const AJSON: TJSONData; const AObj: TftBotCommandScopeChatAdministrators);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('chat_id');
  if LValue <> nil then
  begin
    AObj.ChatId := LValue.AsInt64;
  end;
end;

function TftBotCommandScopeChatAdministratorsFromJson(const AJSON: TJSONData): TftBotCommandScopeChatAdministrators;
begin
  Result := TftBotCommandScopeChatAdministrators.Create;
  FillTftBotCommandScopeChatAdministrators(AJSON, Result);
end;

procedure FillTftBotCommandScopeChatMember(const AJSON: TJSONData; const AObj: TftBotCommandScopeChatMember);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('chat_id');
  if LValue <> nil then
  begin
    AObj.ChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('user_id');
  if LValue <> nil then
  begin
    AObj.UserId := LValue.AsInt64;
  end;
end;

function TftBotCommandScopeChatMemberFromJson(const AJSON: TJSONData): TftBotCommandScopeChatMember;
begin
  Result := TftBotCommandScopeChatMember.Create;
  FillTftBotCommandScopeChatMember(AJSON, Result);
end;

procedure FillTftBotCommandScopeDefault(const AJSON: TJSONData; const AObj: TftBotCommandScopeDefault);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftBotCommandScope(AJSON, TftBotCommandScope(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftBotCommandScopeDefaultFromJson(const AJSON: TJSONData): TftBotCommandScopeDefault;
begin
  Result := TftBotCommandScopeDefault.Create;
  FillTftBotCommandScopeDefault(AJSON, Result);
end;

procedure FillTftBotDescription(const AJSON: TJSONData; const AObj: TftBotDescription);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
end;

function TftBotDescriptionFromJson(const AJSON: TJSONData): TftBotDescription;
begin
  Result := TftBotDescription.Create;
  FillTftBotDescription(AJSON, Result);
end;

procedure FillTftBotName(const AJSON: TJSONData; const AObj: TftBotName);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
end;

function TftBotNameFromJson(const AJSON: TJSONData): TftBotName;
begin
  Result := TftBotName.Create;
  FillTftBotName(AJSON, Result);
end;

procedure FillTftBotShortDescription(const AJSON: TJSONData; const AObj: TftBotShortDescription);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('short_description');
  if LValue <> nil then
  begin
    AObj.ShortDescription := LValue.AsString;
  end;
end;

function TftBotShortDescriptionFromJson(const AJSON: TJSONData): TftBotShortDescription;
begin
  Result := TftBotShortDescription.Create;
  FillTftBotShortDescription(AJSON, Result);
end;

procedure FillTftBotSubscriptionUpdated(const AJSON: TJSONData; const AObj: TftBotSubscriptionUpdated);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('invoice_payload');
  if LValue <> nil then
  begin
    AObj.InvoicePayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('state');
  if LValue <> nil then
  begin
    AObj.State := LValue.AsString;
  end;
end;

function TftBotSubscriptionUpdatedFromJson(const AJSON: TJSONData): TftBotSubscriptionUpdated;
begin
  Result := TftBotSubscriptionUpdated.Create;
  FillTftBotSubscriptionUpdated(AJSON, Result);
end;

procedure FillTftBusinessConnection(const AJSON: TJSONData; const AObj: TftBusinessConnection);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('user_chat_id');
  if LValue <> nil then
  begin
    AObj.UserChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('can_reply');
  if LValue <> nil then
  begin
    AObj.CanReply := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_enabled');
  if LValue <> nil then
  begin
    AObj.IsEnabled := LValue.AsBoolean;
  end;
end;

function TftBusinessConnectionFromJson(const AJSON: TJSONData): TftBusinessConnection;
begin
  Result := TftBusinessConnection.Create;
  FillTftBusinessConnection(AJSON, Result);
end;

procedure FillTftBusinessMessagesDeleted(const AJSON: TJSONData; const AObj: TftBusinessMessagesDeleted);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_MessageIds: TArray<Integer>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('business_connection_id');
  if LValue <> nil then
  begin
    AObj.BusinessConnectionId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('message_ids');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_MessageIds := AObj.MessageIds;
      SetLength(LArr_MessageIds, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_MessageIds[LI] := TJSONArray(LValue).Items[LI].AsInt64;
      AObj.MessageIds := LArr_MessageIds;
    end;
  end;
end;

function TftBusinessMessagesDeletedFromJson(const AJSON: TJSONData): TftBusinessMessagesDeleted;
begin
  Result := TftBusinessMessagesDeleted.Create;
  FillTftBusinessMessagesDeleted(AJSON, Result);
end;

procedure FillTftCallbackGame(const AJSON: TJSONData; const AObj: TftCallbackGame);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftCallbackGameFromJson(const AJSON: TJSONData): TftCallbackGame;
begin
  Result := TftCallbackGame.Create;
  FillTftCallbackGame(AJSON, Result);
end;

procedure FillTftCallbackQuery(const AJSON: TJSONData; const AObj: TftCallbackQuery);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Message = nil then AObj.Message := TftMessage.Create;
      FillTftMessage(LValue, AObj.Message);
    end;
  end;
  LValue := AJSON.GetValue('inl_ine_message_id');
  if LValue <> nil then
  begin
    AObj.InlIneMessageId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('chat_instance');
  if LValue <> nil then
  begin
    AObj.ChatInstance := LValue.AsString;
  end;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    AObj.Data := LValue.AsString;
  end;
  LValue := AJSON.GetValue('game_short_name');
  if LValue <> nil then
  begin
    AObj.GameShortName := LValue.AsString;
  end;
end;

function TftCallbackQueryFromJson(const AJSON: TJSONData): TftCallbackQuery;
begin
  Result := TftCallbackQuery.Create;
  FillTftCallbackQuery(AJSON, Result);
end;

procedure FillTftChat(const AJSON: TJSONData; const AObj: TftChat);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeChat := TftChatType(GetEnumValue(TypeInfo(TftChatType), LValue.AsString));
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('username');
  if LValue <> nil then
  begin
    AObj.UserName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('first_name');
  if LValue <> nil then
  begin
    AObj.FirstName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_name');
  if LValue <> nil then
  begin
    AObj.LastName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('is_forum');
  if LValue <> nil then
  begin
    AObj.IsForum := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Photo = nil then AObj.Photo := TftChatPhoto.Create;
      FillTftChatPhoto(LValue, AObj.Photo);
    end;
  end;
  LValue := AJSON.GetValue('active_usernames');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.ActiveUsernames = nil then AObj.ActiveUsernames := TList<string>.Create;
      AObj.ActiveUsernames.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.ActiveUsernames.Add(TJSONArray(LValue).Items[LI].AsString);
    end;
  end;
  LValue := AJSON.GetValue('emoji_status_custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.EmojiStatusCustomEmojiId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('bio');
  if LValue <> nil then
  begin
    AObj.Bio := LValue.AsString;
  end;
  LValue := AJSON.GetValue('has_private_forwards');
  if LValue <> nil then
  begin
    AObj.HasPrivateForwards := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('has_restricted_voice_and_video_messages');
  if LValue <> nil then
  begin
    AObj.HasRestrictedVoiceAndVideoMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('join_to_send_messages');
  if LValue <> nil then
  begin
    AObj.JoinToSendMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('join_by_request');
  if LValue <> nil then
  begin
    AObj.JoinByRequest := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('invite_link');
  if LValue <> nil then
  begin
    AObj.InviteLink := LValue.AsString;
  end;
  LValue := AJSON.GetValue('pinned_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PinnedMessage = nil then AObj.PinnedMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.PinnedMessage);
    end;
  end;
  LValue := AJSON.GetValue('permissions');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Permissions = nil then AObj.Permissions := TftChatPermissions.Create;
      FillTftChatPermissions(LValue, AObj.Permissions);
    end;
  end;
  LValue := AJSON.GetValue('slow_mode_delay');
  if LValue <> nil then
  begin
    AObj.SlowModeDelay := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('message_auto_delete_time');
  if LValue <> nil then
  begin
    AObj.MessageAutoDeleteTime := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('has_aggressive_anti_spam_enabled');
  if LValue <> nil then
  begin
    AObj.HasAggressiveAntiSpamEnabled := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('has_hidden_members');
  if LValue <> nil then
  begin
    AObj.HasHiddenMembers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('has_protected_content');
  if LValue <> nil then
  begin
    AObj.HasProtectedContent := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('sticker_set_name');
  if LValue <> nil then
  begin
    AObj.StickerSetName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('can_set_sticker_set');
  if LValue <> nil then
  begin
    AObj.CanSetStickerSet := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('linked_chat_id');
  if LValue <> nil then
  begin
    AObj.LinkedChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftChatLocation.Create;
      FillTftChatLocation(LValue, AObj.Location);
    end;
  end;
end;

function TftChatFromJson(const AJSON: TJSONData): TftChat;
begin
  Result := TftChat.Create;
  FillTftChat(AJSON, Result);
end;

procedure FillTftChatAdministratorRights(const AJSON: TJSONData; const AObj: TftChatAdministratorRights);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('is_anonymous');
  if LValue <> nil then
  begin
    AObj.IsAnonymous := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_chat');
  if LValue <> nil then
  begin
    AObj.CanManageChat := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_delete_messages');
  if LValue <> nil then
  begin
    AObj.CanDeleteMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_video_chats');
  if LValue <> nil then
  begin
    AObj.CanManageVideoChats := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_restri_ct_members');
  if LValue <> nil then
  begin
    AObj.CanRestriCtMembers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_promote_members');
  if LValue <> nil then
  begin
    AObj.CanPromoteMembers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_change_info');
  if LValue <> nil then
  begin
    AObj.CanChangeInfo := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_invite_users');
  if LValue <> nil then
  begin
    AObj.CanInviteUsers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_post_messages');
  if LValue <> nil then
  begin
    AObj.CanPostMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_edit_messages');
  if LValue <> nil then
  begin
    AObj.CanEditMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_pin_messages');
  if LValue <> nil then
  begin
    AObj.CanPinMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_topics');
  if LValue <> nil then
  begin
    AObj.CanManageTopics := LValue.AsBoolean;
  end;
end;

function TftChatAdministratorRightsFromJson(const AJSON: TJSONData): TftChatAdministratorRights;
begin
  Result := TftChatAdministratorRights.Create;
  FillTftChatAdministratorRights(AJSON, Result);
end;

procedure FillTftChatBoost(const AJSON: TJSONData; const AObj: TftChatBoost);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('boost_id');
  if LValue <> nil then
  begin
    AObj.BoostId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('add_date');
  if LValue <> nil then
  begin
    AObj.AddDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('expiration_date');
  if LValue <> nil then
  begin
    AObj.ExpirationDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('source');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Source = nil then AObj.Source := TftChatBoostSource.Create;
      FillTftChatBoostSource(LValue, AObj.Source);
    end;
  end;
end;

function TftChatBoostFromJson(const AJSON: TJSONData): TftChatBoost;
begin
  Result := TftChatBoost.Create;
  FillTftChatBoost(AJSON, Result);
end;

procedure FillTftChatBoostAdded(const AJSON: TJSONData; const AObj: TftChatBoostAdded);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('boost_count');
  if LValue <> nil then
  begin
    AObj.BoostCount := LValue.AsInt64;
  end;
end;

function TftChatBoostAddedFromJson(const AJSON: TJSONData): TftChatBoostAdded;
begin
  Result := TftChatBoostAdded.Create;
  FillTftChatBoostAdded(AJSON, Result);
end;

procedure FillTftChatBoostRemoved(const AJSON: TJSONData; const AObj: TftChatBoostRemoved);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('boost_id');
  if LValue <> nil then
  begin
    AObj.BoostId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('remove_date');
  if LValue <> nil then
  begin
    AObj.RemoveDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('source');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Source = nil then AObj.Source := TftChatBoostSource.Create;
      FillTftChatBoostSource(LValue, AObj.Source);
    end;
  end;
end;

function TftChatBoostRemovedFromJson(const AJSON: TJSONData): TftChatBoostRemoved;
begin
  Result := TftChatBoostRemoved.Create;
  FillTftChatBoostRemoved(AJSON, Result);
end;

procedure FillTftChatBoostSource(const AJSON: TJSONData; const AObj: TftChatBoostSource);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('source');
  if LValue <> nil then
  begin
    AObj.Source := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('giveaway_message_id');
  if LValue <> nil then
  begin
    AObj.GiveawayMessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('prize_star_count');
  if LValue <> nil then
  begin
    AObj.PrizeStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_unclaimed');
  if LValue <> nil then
  begin
    AObj.IsUnclaimed := LValue.AsBoolean;
  end;
end;

function TftChatBoostSourceFromJson(const AJSON: TJSONData): TftChatBoostSource;
begin
  Result := TftChatBoostSource.Create;
  FillTftChatBoostSource(AJSON, Result);
end;

procedure FillTftChatBoostUpdated(const AJSON: TJSONData; const AObj: TftChatBoostUpdated);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('boost');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Boost = nil then AObj.Boost := TftChatBoost.Create;
      FillTftChatBoost(LValue, AObj.Boost);
    end;
  end;
end;

function TftChatBoostUpdatedFromJson(const AJSON: TJSONData): TftChatBoostUpdated;
begin
  Result := TftChatBoostUpdated.Create;
  FillTftChatBoostUpdated(AJSON, Result);
end;

procedure FillTftChatInviteLink(const AJSON: TJSONData; const AObj: TftChatInviteLink);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('invite_link');
  if LValue <> nil then
  begin
    AObj.InviteLink := LValue.AsString;
  end;
  LValue := AJSON.GetValue('creator');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Creator = nil then AObj.Creator := TftUser.Create;
      FillTftUser(LValue, AObj.Creator);
    end;
  end;
  LValue := AJSON.GetValue('creates_join_request');
  if LValue <> nil then
  begin
    AObj.CreatesJoinRequest := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_primary');
  if LValue <> nil then
  begin
    AObj.IsPrimary := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_revoked');
  if LValue <> nil then
  begin
    AObj.IsRevoked := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('expire_date');
  if LValue <> nil then
  begin
    AObj.ExpireDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('member_limit');
  if LValue <> nil then
  begin
    AObj.MemberLimit := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('pending_join_request_count');
  if LValue <> nil then
  begin
    AObj.PendingJoinRequestCount := LValue.AsInt64;
  end;
end;

function TftChatInviteLinkFromJson(const AJSON: TJSONData): TftChatInviteLink;
begin
  Result := TftChatInviteLink.Create;
  FillTftChatInviteLink(AJSON, Result);
end;

procedure FillTftChatJoinRequest(const AJSON: TJSONData; const AObj: TftChatJoinRequest);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('bio');
  if LValue <> nil then
  begin
    AObj.Bio := LValue.AsString;
  end;
  LValue := AJSON.GetValue('invite_link');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InviteLink = nil then AObj.InviteLink := TftChatInviteLink.Create;
      FillTftChatInviteLink(LValue, AObj.InviteLink);
    end;
  end;
end;

function TftChatJoinRequestFromJson(const AJSON: TJSONData): TftChatJoinRequest;
begin
  Result := TftChatJoinRequest.Create;
  FillTftChatJoinRequest(AJSON, Result);
end;

procedure FillTftChatLocation(const AJSON: TJSONData; const AObj: TftChatLocation);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftLocation.Create;
      FillTftLocation(LValue, AObj.Location);
    end;
  end;
  LValue := AJSON.GetValue('address');
  if LValue <> nil then
  begin
    AObj.Address := LValue.AsString;
  end;
end;

function TftChatLocationFromJson(const AJSON: TJSONData): TftChatLocation;
begin
  Result := TftChatLocation.Create;
  FillTftChatLocation(AJSON, Result);
end;

procedure FillTftChatMember(const AJSON: TJSONData; const AObj: TftChatMember);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('status');
  if LValue <> nil then
  begin
    AObj.Status := LValue.AsString;
  end;
end;

function TftChatMemberFromJson(const AJSON: TJSONData): TftChatMember;
begin
  Result := TftChatMember.Create;
  FillTftChatMember(AJSON, Result);
end;

procedure FillTftChatMemberAdministrator(const AJSON: TJSONData; const AObj: TftChatMemberAdministrator);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftChatMember(AJSON, TftChatMember(AObj));
  LValue := AJSON.GetValue('can_be_edited');
  if LValue <> nil then
  begin
    AObj.CanBeEdited := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_anonymous');
  if LValue <> nil then
  begin
    AObj.IsAnonymous := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_chat');
  if LValue <> nil then
  begin
    AObj.CanManageChat := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_delete_messages');
  if LValue <> nil then
  begin
    AObj.CanDeleteMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_video_chats');
  if LValue <> nil then
  begin
    AObj.CanManageVideoChats := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_restri_ct_members');
  if LValue <> nil then
  begin
    AObj.CanRestriCtMembers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_promote_members');
  if LValue <> nil then
  begin
    AObj.CanPromoteMembers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_change_info');
  if LValue <> nil then
  begin
    AObj.CanChangeInfo := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_invite_users');
  if LValue <> nil then
  begin
    AObj.CanInviteUsers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_post_messages');
  if LValue <> nil then
  begin
    AObj.CanPostMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_edit_messages');
  if LValue <> nil then
  begin
    AObj.CanEditMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_pin_messages');
  if LValue <> nil then
  begin
    AObj.CanPinMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_topics');
  if LValue <> nil then
  begin
    AObj.CanManageTopics := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('custom_title');
  if LValue <> nil then
  begin
    AObj.CustomTitle := LValue.AsString;
  end;
end;

function TftChatMemberAdministratorFromJson(const AJSON: TJSONData): TftChatMemberAdministrator;
begin
  Result := TftChatMemberAdministrator.Create;
  FillTftChatMemberAdministrator(AJSON, Result);
end;

procedure FillTftChatMemberBanned(const AJSON: TJSONData; const AObj: TftChatMemberBanned);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftChatMember(AJSON, TftChatMember(AObj));
  LValue := AJSON.GetValue('until_date');
  if LValue <> nil then
  begin
    AObj.UntilDate := LValue.AsInt64;
  end;
end;

function TftChatMemberBannedFromJson(const AJSON: TJSONData): TftChatMemberBanned;
begin
  Result := TftChatMemberBanned.Create;
  FillTftChatMemberBanned(AJSON, Result);
end;

procedure FillTftChatMemberLeft(const AJSON: TJSONData; const AObj: TftChatMemberLeft);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftChatMember(AJSON, TftChatMember(AObj));
end;

function TftChatMemberLeftFromJson(const AJSON: TJSONData): TftChatMemberLeft;
begin
  Result := TftChatMemberLeft.Create;
  FillTftChatMemberLeft(AJSON, Result);
end;

procedure FillTftChatMemberMember(const AJSON: TJSONData; const AObj: TftChatMemberMember);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftChatMember(AJSON, TftChatMember(AObj));
end;

function TftChatMemberMemberFromJson(const AJSON: TJSONData): TftChatMemberMember;
begin
  Result := TftChatMemberMember.Create;
  FillTftChatMemberMember(AJSON, Result);
end;

procedure FillTftChatMemberOwner(const AJSON: TJSONData; const AObj: TftChatMemberOwner);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftChatMember(AJSON, TftChatMember(AObj));
  LValue := AJSON.GetValue('is_anonymous');
  if LValue <> nil then
  begin
    AObj.IsAnonymous := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('custom_title');
  if LValue <> nil then
  begin
    AObj.CustomTitle := LValue.AsString;
  end;
end;

function TftChatMemberOwnerFromJson(const AJSON: TJSONData): TftChatMemberOwner;
begin
  Result := TftChatMemberOwner.Create;
  FillTftChatMemberOwner(AJSON, Result);
end;

procedure FillTftChatMemberRestricted(const AJSON: TJSONData; const AObj: TftChatMemberRestricted);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftChatMember(AJSON, TftChatMember(AObj));
  LValue := AJSON.GetValue('until_date');
  if LValue <> nil then
  begin
    AObj.UntilDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('can_change_info');
  if LValue <> nil then
  begin
    AObj.CanChangeInfo := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_invite_users');
  if LValue <> nil then
  begin
    AObj.CanInviteUsers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_pin_messages');
  if LValue <> nil then
  begin
    AObj.CanPinMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_topics');
  if LValue <> nil then
  begin
    AObj.CanManageTopics := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_member');
  if LValue <> nil then
  begin
    AObj.IsMember := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_messages');
  if LValue <> nil then
  begin
    AObj.CanSendMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_media_messages');
  if LValue <> nil then
  begin
    AObj.CanSendMediaMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_other_messages');
  if LValue <> nil then
  begin
    AObj.CanSendOtherMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_polls');
  if LValue <> nil then
  begin
    AObj.CanSendPolls := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_add_web_page_previews');
  if LValue <> nil then
  begin
    AObj.CanAddWebPagePreviews := LValue.AsBoolean;
  end;
end;

function TftChatMemberRestrictedFromJson(const AJSON: TJSONData): TftChatMemberRestricted;
begin
  Result := TftChatMemberRestricted.Create;
  FillTftChatMemberRestricted(AJSON, Result);
end;

procedure FillTftChatMemberUpdated(const AJSON: TJSONData; const AObj: TftChatMemberUpdated);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('old_chat_member');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.OldChatMember = nil then AObj.OldChatMember := TftChatMember.Create;
      FillTftChatMember(LValue, AObj.OldChatMember);
    end;
  end;
  LValue := AJSON.GetValue('new_chat_member');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.NewChatMember = nil then AObj.NewChatMember := TftChatMember.Create;
      FillTftChatMember(LValue, AObj.NewChatMember);
    end;
  end;
  LValue := AJSON.GetValue('invite_link');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InviteLink = nil then AObj.InviteLink := TftChatInviteLink.Create;
      FillTftChatInviteLink(LValue, AObj.InviteLink);
    end;
  end;
end;

function TftChatMemberUpdatedFromJson(const AJSON: TJSONData): TftChatMemberUpdated;
begin
  Result := TftChatMemberUpdated.Create;
  FillTftChatMemberUpdated(AJSON, Result);
end;

procedure FillTftChatOwnerChanged(const AJSON: TJSONData; const AObj: TftChatOwnerChanged);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('new_owner');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.NewOwner = nil then AObj.NewOwner := TftUser.Create;
      FillTftUser(LValue, AObj.NewOwner);
    end;
  end;
end;

function TftChatOwnerChangedFromJson(const AJSON: TJSONData): TftChatOwnerChanged;
begin
  Result := TftChatOwnerChanged.Create;
  FillTftChatOwnerChanged(AJSON, Result);
end;

procedure FillTftChatOwnerLeft(const AJSON: TJSONData; const AObj: TftChatOwnerLeft);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('new_owner');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.NewOwner = nil then AObj.NewOwner := TftUser.Create;
      FillTftUser(LValue, AObj.NewOwner);
    end;
  end;
end;

function TftChatOwnerLeftFromJson(const AJSON: TJSONData): TftChatOwnerLeft;
begin
  Result := TftChatOwnerLeft.Create;
  FillTftChatOwnerLeft(AJSON, Result);
end;

procedure FillTftChatPermissions(const AJSON: TJSONData; const AObj: TftChatPermissions);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('can_send_messages');
  if LValue <> nil then
  begin
    AObj.CanSendMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_media_messages');
  if LValue <> nil then
  begin
    AObj.CanSendMediaMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_polls');
  if LValue <> nil then
  begin
    AObj.CanSendPolls := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_send_other_messages');
  if LValue <> nil then
  begin
    AObj.CanSendOtherMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_add_web_page_previews');
  if LValue <> nil then
  begin
    AObj.CanAddWebPagePreviews := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_change_info');
  if LValue <> nil then
  begin
    AObj.CanChangeInfo := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_invite_users');
  if LValue <> nil then
  begin
    AObj.CanInviteUsers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_pin_messages');
  if LValue <> nil then
  begin
    AObj.CanPinMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_manage_topics');
  if LValue <> nil then
  begin
    AObj.CanManageTopics := LValue.AsBoolean;
  end;
end;

function TftChatPermissionsFromJson(const AJSON: TJSONData): TftChatPermissions;
begin
  Result := TftChatPermissions.Create;
  FillTftChatPermissions(AJSON, Result);
end;

procedure FillTftChatPhoto(const AJSON: TJSONData; const AObj: TftChatPhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('small_file_id');
  if LValue <> nil then
  begin
    AObj.SmallFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('small_file_unique_id');
  if LValue <> nil then
  begin
    AObj.SmallFileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('big_file_id');
  if LValue <> nil then
  begin
    AObj.BigFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('big_file_unique_id');
  if LValue <> nil then
  begin
    AObj.BigFileUniqueId := LValue.AsString;
  end;
end;

function TftChatPhotoFromJson(const AJSON: TJSONData): TftChatPhoto;
begin
  Result := TftChatPhoto.Create;
  FillTftChatPhoto(AJSON, Result);
end;

procedure FillTftChecklist(const AJSON: TJSONData; const AObj: TftChecklist);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_TitleEntities: TftMessageEntityList;
  LArr_Tasks: TArray<TftChecklistTask>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_TitleEntities := AObj.TitleEntities;
      SetLength(LArr_TitleEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_TitleEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.TitleEntities := LArr_TitleEntities;
    end;
  end;
  LValue := AJSON.GetValue('tasks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Tasks := AObj.Tasks;
      SetLength(LArr_Tasks, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Tasks[LI] := TftChecklistTaskFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Tasks := LArr_Tasks;
    end;
  end;
  LValue := AJSON.GetValue('others_can_add_tasks');
  if LValue <> nil then
  begin
    AObj.OthersCanAddTasks := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('others_can_mark_tasks_as_done');
  if LValue <> nil then
  begin
    AObj.OthersCanMarkTasksAsDone := LValue.AsBoolean;
  end;
end;

function TftChecklistFromJson(const AJSON: TJSONData): TftChecklist;
begin
  Result := TftChecklist.Create;
  FillTftChecklist(AJSON, Result);
end;

procedure FillTftChecklistTask(const AJSON: TJSONData; const AObj: TftChecklistTask);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_TextEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_TextEntities := AObj.TextEntities;
      SetLength(LArr_TextEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_TextEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.TextEntities := LArr_TextEntities;
    end;
  end;
  LValue := AJSON.GetValue('completed_by_user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.CompletedByUser = nil then AObj.CompletedByUser := TftUser.Create;
      FillTftUser(LValue, AObj.CompletedByUser);
    end;
  end;
  LValue := AJSON.GetValue('completed_by_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.CompletedByChat = nil then AObj.CompletedByChat := TftChat.Create;
      FillTftChat(LValue, AObj.CompletedByChat);
    end;
  end;
  LValue := AJSON.GetValue('completion_date');
  if LValue <> nil then
  begin
    AObj.CompletionDate := LValue.AsInt64;
  end;
end;

function TftChecklistTaskFromJson(const AJSON: TJSONData): TftChecklistTask;
begin
  Result := TftChecklistTask.Create;
  FillTftChecklistTask(AJSON, Result);
end;

procedure FillTftChecklistTasksAdded(const AJSON: TJSONData; const AObj: TftChecklistTasksAdded);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Tasks: TArray<TftChecklistTask>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('checklist_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChecklistMessage = nil then AObj.ChecklistMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.ChecklistMessage);
    end;
  end;
  LValue := AJSON.GetValue('tasks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Tasks := AObj.Tasks;
      SetLength(LArr_Tasks, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Tasks[LI] := TftChecklistTaskFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Tasks := LArr_Tasks;
    end;
  end;
end;

function TftChecklistTasksAddedFromJson(const AJSON: TJSONData): TftChecklistTasksAdded;
begin
  Result := TftChecklistTasksAdded.Create;
  FillTftChecklistTasksAdded(AJSON, Result);
end;

procedure FillTftChecklistTasksDone(const AJSON: TJSONData; const AObj: TftChecklistTasksDone);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_MarkedAsDoneTaskIds: TArray<Integer>;
  LArr_MarkedAsNotDoneTaskIds: TArray<Integer>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('checklist_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChecklistMessage = nil then AObj.ChecklistMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.ChecklistMessage);
    end;
  end;
  LValue := AJSON.GetValue('marked_as_done_task_ids');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_MarkedAsDoneTaskIds := AObj.MarkedAsDoneTaskIds;
      SetLength(LArr_MarkedAsDoneTaskIds, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_MarkedAsDoneTaskIds[LI] := TJSONArray(LValue).Items[LI].AsInt64;
      AObj.MarkedAsDoneTaskIds := LArr_MarkedAsDoneTaskIds;
    end;
  end;
  LValue := AJSON.GetValue('marked_as_not_done_task_ids');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_MarkedAsNotDoneTaskIds := AObj.MarkedAsNotDoneTaskIds;
      SetLength(LArr_MarkedAsNotDoneTaskIds, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_MarkedAsNotDoneTaskIds[LI] := TJSONArray(LValue).Items[LI].AsInt64;
      AObj.MarkedAsNotDoneTaskIds := LArr_MarkedAsNotDoneTaskIds;
    end;
  end;
end;

function TftChecklistTasksDoneFromJson(const AJSON: TJSONData): TftChecklistTasksDone;
begin
  Result := TftChecklistTasksDone.Create;
  FillTftChecklistTasksDone(AJSON, Result);
end;

procedure FillTftChosenInlineResult(const AJSON: TJSONData; const AObj: TftChosenInlineResult);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('result_id');
  if LValue <> nil then
  begin
    AObj.ResultId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftLocation.Create;
      FillTftLocation(LValue, AObj.Location);
    end;
  end;
  LValue := AJSON.GetValue('inl_ine_message_id');
  if LValue <> nil then
  begin
    AObj.InlIneMessageId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('query');
  if LValue <> nil then
  begin
    AObj.Query := LValue.AsString;
  end;
end;

function TftChosenInlineResultFromJson(const AJSON: TJSONData): TftChosenInlineResult;
begin
  Result := TftChosenInlineResult.Create;
  FillTftChosenInlineResult(AJSON, Result);
end;

procedure FillTftContact(const AJSON: TJSONData; const AObj: TftContact);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('phone_number');
  if LValue <> nil then
  begin
    AObj.PhoneNumber := LValue.AsString;
  end;
  LValue := AJSON.GetValue('first_name');
  if LValue <> nil then
  begin
    AObj.FirstName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_name');
  if LValue <> nil then
  begin
    AObj.LastName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user_id');
  if LValue <> nil then
  begin
    AObj.UserId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('vcard');
  if LValue <> nil then
  begin
    AObj.Vcard := LValue.AsString;
  end;
end;

function TftContactFromJson(const AJSON: TJSONData): TftContact;
begin
  Result := TftContact.Create;
  FillTftContact(AJSON, Result);
end;

procedure FillTftDice(const AJSON: TJSONData; const AObj: TftDice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('emoji');
  if LValue <> nil then
  begin
    AObj.Emoji := LValue.AsString;
  end;
  LValue := AJSON.GetValue('value');
  if LValue <> nil then
  begin
    AObj.Value := LValue.AsInt64;
  end;
end;

function TftDiceFromJson(const AJSON: TJSONData): TftDice;
begin
  Result := TftDice.Create;
  FillTftDice(AJSON, Result);
end;

procedure FillTftDirectMessagePriceChanged(const AJSON: TJSONData; const AObj: TftDirectMessagePriceChanged);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('are_direct_messages_enabled');
  if LValue <> nil then
  begin
    AObj.AreDirectMessagesEnabled := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('direct_message_star_count');
  if LValue <> nil then
  begin
    AObj.DirectMessageStarCount := LValue.AsInt64;
  end;
end;

function TftDirectMessagePriceChangedFromJson(const AJSON: TJSONData): TftDirectMessagePriceChanged;
begin
  Result := TftDirectMessagePriceChanged.Create;
  FillTftDirectMessagePriceChanged(AJSON, Result);
end;

procedure FillTftDirectMessagesTopic(const AJSON: TJSONData; const AObj: TftDirectMessagesTopic);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('topic_id');
  if LValue <> nil then
  begin
    AObj.TopicId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
end;

function TftDirectMessagesTopicFromJson(const AJSON: TJSONData): TftDirectMessagesTopic;
begin
  Result := TftDirectMessagesTopic.Create;
  FillTftDirectMessagesTopic(AJSON, Result);
end;

procedure FillTftDocument(const AJSON: TJSONData; const AObj: TftDocument);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('file_id');
  if LValue <> nil then
  begin
    AObj.FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_unique_id');
  if LValue <> nil then
  begin
    AObj.FileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Thumb = nil then AObj.Thumb := TftPhotoSize.Create;
      FillTftPhotoSize(LValue, AObj.Thumb);
    end;
  end;
  LValue := AJSON.GetValue('file_name');
  if LValue <> nil then
  begin
    AObj.FileName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('mime_type');
  if LValue <> nil then
  begin
    AObj.MimeType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_size');
  if LValue <> nil then
  begin
    AObj.FileSize := LValue.AsInt64;
  end;
end;

function TftDocumentFromJson(const AJSON: TJSONData): TftDocument;
begin
  Result := TftDocument.Create;
  FillTftDocument(AJSON, Result);
end;

procedure FillTftEncryptedCredential(const AJSON: TJSONData; const AObj: TftEncryptedCredential);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    AObj.Data := LValue.AsString;
  end;
  LValue := AJSON.GetValue('hash');
  if LValue <> nil then
  begin
    AObj.Hash := LValue.AsString;
  end;
  LValue := AJSON.GetValue('secret');
  if LValue <> nil then
  begin
    AObj.Secret := LValue.AsString;
  end;
end;

function TftEncryptedCredentialFromJson(const AJSON: TJSONData): TftEncryptedCredential;
begin
  Result := TftEncryptedCredential.Create;
  FillTftEncryptedCredential(AJSON, Result);
end;

procedure FillTftEncryptedCredentials(const AJSON: TJSONData; const AObj: TftEncryptedCredentials);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    AObj.Data := LValue.AsString;
  end;
  LValue := AJSON.GetValue('hash');
  if LValue <> nil then
  begin
    AObj.Hash := LValue.AsString;
  end;
  LValue := AJSON.GetValue('secret');
  if LValue <> nil then
  begin
    AObj.Secret := LValue.AsString;
  end;
end;

function TftEncryptedCredentialsFromJson(const AJSON: TJSONData): TftEncryptedCredentials;
begin
  Result := TftEncryptedCredentials.Create;
  FillTftEncryptedCredentials(AJSON, Result);
end;

procedure FillTftEncryptedPassportElement(const AJSON: TJSONData; const AObj: TftEncryptedPassportElement);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := LValue.AsString;
  end;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    AObj.Data := LValue.AsString;
  end;
  LValue := AJSON.GetValue('phone_number');
  if LValue <> nil then
  begin
    AObj.PhoneNumber := LValue.AsString;
  end;
  LValue := AJSON.GetValue('email');
  if LValue <> nil then
  begin
    AObj.Email := LValue.AsString;
  end;
  LValue := AJSON.GetValue('files');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Files = nil then AObj.Files := TList<TftPassportFile>.Create;
      AObj.Files.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Files.Add(TftPassportFileFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('front_side');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.FrontSide = nil then AObj.FrontSide := TftPassportFile.Create;
      FillTftPassportFile(LValue, AObj.FrontSide);
    end;
  end;
  LValue := AJSON.GetValue('reverse_side');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ReverseSide = nil then AObj.ReverseSide := TftPassportFile.Create;
      FillTftPassportFile(LValue, AObj.ReverseSide);
    end;
  end;
  LValue := AJSON.GetValue('selfie');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Selfie = nil then AObj.Selfie := TftPassportFile.Create;
      FillTftPassportFile(LValue, AObj.Selfie);
    end;
  end;
  LValue := AJSON.GetValue('translation');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Translation = nil then AObj.Translation := TList<TftPassportFile>.Create;
      AObj.Translation.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Translation.Add(TftPassportFileFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('hash');
  if LValue <> nil then
  begin
    AObj.Hash := LValue.AsString;
  end;
end;

function TftEncryptedPassportElementFromJson(const AJSON: TJSONData): TftEncryptedPassportElement;
begin
  Result := TftEncryptedPassportElement.Create;
  FillTftEncryptedPassportElement(AJSON, Result);
end;

procedure FillTftFile(const AJSON: TJSONData; const AObj: TftFile);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('file_id');
  if LValue <> nil then
  begin
    AObj.FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_unique_id');
  if LValue <> nil then
  begin
    AObj.FileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_size');
  if LValue <> nil then
  begin
    AObj.FileSize := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('file_path');
  if LValue <> nil then
  begin
    AObj.FilePath := LValue.AsString;
  end;
end;

function TftFileFromJson(const AJSON: TJSONData): TftFile;
begin
  Result := TftFile.Create;
  FillTftFile(AJSON, Result);
end;

procedure FillTftForceReply(const AJSON: TJSONData; const AObj: TftForceReply);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftReplyBase(AJSON, TftReplyBase(AObj));
  LValue := AJSON.GetValue('force_reply');
  if LValue <> nil then
  begin
    AObj.ForceReply := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('input_field_placeholder');
  if LValue <> nil then
  begin
    AObj.InputFieldPlaceholder := LValue.AsString;
  end;
  LValue := AJSON.GetValue('selective');
  if LValue <> nil then
  begin
    AObj.Selective := LValue.AsBoolean;
  end;
end;

function TftForceReplyFromJson(const AJSON: TJSONData): TftForceReply;
begin
  Result := TftForceReply.Create;
  FillTftForceReply(AJSON, Result);
end;

procedure FillTftForumTopic(const AJSON: TJSONData; const AObj: TftForumTopic);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('message_thread_id');
  if LValue <> nil then
  begin
    AObj.MessageThreadId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('icon_color');
  if LValue <> nil then
  begin
    AObj.IconColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('icon_custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.IconCustomEmojiId := LValue.AsString;
  end;
end;

function TftForumTopicFromJson(const AJSON: TJSONData): TftForumTopic;
begin
  Result := TftForumTopic.Create;
  FillTftForumTopic(AJSON, Result);
end;

procedure FillTftForumTopicClosed(const AJSON: TJSONData; const AObj: TftForumTopicClosed);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftForumTopicClosedFromJson(const AJSON: TJSONData): TftForumTopicClosed;
begin
  Result := TftForumTopicClosed.Create;
  FillTftForumTopicClosed(AJSON, Result);
end;

procedure FillTftForumTopicCreated(const AJSON: TJSONData; const AObj: TftForumTopicCreated);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('icon_color');
  if LValue <> nil then
  begin
    AObj.IconColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('icon_custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.IconCustomEmojiId := LValue.AsString;
  end;
end;

function TftForumTopicCreatedFromJson(const AJSON: TJSONData): TftForumTopicCreated;
begin
  Result := TftForumTopicCreated.Create;
  FillTftForumTopicCreated(AJSON, Result);
end;

procedure FillTftForumTopicEdited(const AJSON: TJSONData; const AObj: TftForumTopicEdited);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('icon_custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.IconCustomEmojiId := LValue.AsString;
  end;
end;

function TftForumTopicEditedFromJson(const AJSON: TJSONData): TftForumTopicEdited;
begin
  Result := TftForumTopicEdited.Create;
  FillTftForumTopicEdited(AJSON, Result);
end;

procedure FillTftForumTopicReopened(const AJSON: TJSONData; const AObj: TftForumTopicReopened);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftForumTopicReopenedFromJson(const AJSON: TJSONData): TftForumTopicReopened;
begin
  Result := TftForumTopicReopened.Create;
  FillTftForumTopicReopened(AJSON, Result);
end;

procedure FillTftGame(const AJSON: TJSONData; const AObj: TftGame);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Photo: TftPhotoSizeList;
  LArr_TextEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Photo := AObj.Photo;
      SetLength(LArr_Photo, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Photo[LI] := TftPhotoSizeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Photo := LArr_Photo;
    end;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_TextEntities := AObj.TextEntities;
      SetLength(LArr_TextEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_TextEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.TextEntities := LArr_TextEntities;
    end;
  end;
  LValue := AJSON.GetValue('animation');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Animation = nil then AObj.Animation := TftAnimation.Create;
      FillTftAnimation(LValue, AObj.Animation);
    end;
  end;
end;

function TftGameFromJson(const AJSON: TJSONData): TftGame;
begin
  Result := TftGame.Create;
  FillTftGame(AJSON, Result);
end;

procedure FillTftGameHighScore(const AJSON: TJSONData; const AObj: TftGameHighScore);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('position');
  if LValue <> nil then
  begin
    AObj.Position := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('score');
  if LValue <> nil then
  begin
    AObj.Score := LValue.AsInt64;
  end;
end;

function TftGameHighScoreFromJson(const AJSON: TJSONData): TftGameHighScore;
begin
  Result := TftGameHighScore.Create;
  FillTftGameHighScore(AJSON, Result);
end;

procedure FillTftGeneralForumTopicHidden(const AJSON: TJSONData; const AObj: TftGeneralForumTopicHidden);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftGeneralForumTopicHiddenFromJson(const AJSON: TJSONData): TftGeneralForumTopicHidden;
begin
  Result := TftGeneralForumTopicHidden.Create;
  FillTftGeneralForumTopicHidden(AJSON, Result);
end;

procedure FillTftGeneralForumTopicUnhidden(const AJSON: TJSONData; const AObj: TftGeneralForumTopicUnhidden);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftGeneralForumTopicUnhiddenFromJson(const AJSON: TJSONData): TftGeneralForumTopicUnhidden;
begin
  Result := TftGeneralForumTopicUnhidden.Create;
  FillTftGeneralForumTopicUnhidden(AJSON, Result);
end;

procedure FillTftGift(const AJSON: TJSONData; const AObj: TftGift);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('sticker');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Sticker = nil then AObj.Sticker := TftSticker.Create;
      FillTftSticker(LValue, AObj.Sticker);
    end;
  end;
  LValue := AJSON.GetValue('star_count');
  if LValue <> nil then
  begin
    AObj.StarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('upgrade_star_count');
  if LValue <> nil then
  begin
    AObj.UpgradeStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_premium');
  if LValue <> nil then
  begin
    AObj.IsPremium := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('has_colors');
  if LValue <> nil then
  begin
    AObj.HasColors := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('total_count');
  if LValue <> nil then
  begin
    AObj.TotalCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('remaining_count');
  if LValue <> nil then
  begin
    AObj.RemainingCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('personal_total_count');
  if LValue <> nil then
  begin
    AObj.PersonalTotalCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('personal_remaining_count');
  if LValue <> nil then
  begin
    AObj.PersonalRemainingCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('background');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Background = nil then AObj.Background := TftGiftBackground.Create;
      FillTftGiftBackground(LValue, AObj.Background);
    end;
  end;
  LValue := AJSON.GetValue('unique_gift_variant_count');
  if LValue <> nil then
  begin
    AObj.UniqueGiftVariantCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('publisher_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PublisherChat = nil then AObj.PublisherChat := TftChat.Create;
      FillTftChat(LValue, AObj.PublisherChat);
    end;
  end;
end;

function TftGiftFromJson(const AJSON: TJSONData): TftGift;
begin
  Result := TftGift.Create;
  FillTftGift(AJSON, Result);
end;

procedure FillTftGiftBackground(const AJSON: TJSONData; const AObj: TftGiftBackground);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('center_color');
  if LValue <> nil then
  begin
    AObj.CenterColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('edge_color');
  if LValue <> nil then
  begin
    AObj.EdgeColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('text_color');
  if LValue <> nil then
  begin
    AObj.TextColor := LValue.AsInt64;
  end;
end;

function TftGiftBackgroundFromJson(const AJSON: TJSONData): TftGiftBackground;
begin
  Result := TftGiftBackground.Create;
  FillTftGiftBackground(AJSON, Result);
end;

procedure FillTftGiftInfo(const AJSON: TJSONData; const AObj: TftGiftInfo);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Entities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Gift = nil then AObj.Gift := TftGift.Create;
      FillTftGift(LValue, AObj.Gift);
    end;
  end;
  LValue := AJSON.GetValue('owned_gift_id');
  if LValue <> nil then
  begin
    AObj.OwnedGiftId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('convert_star_count');
  if LValue <> nil then
  begin
    AObj.ConvertStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('prepaid_upgrade_star_count');
  if LValue <> nil then
  begin
    AObj.PrepaidUpgradeStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_upgrade_separate');
  if LValue <> nil then
  begin
    AObj.IsUpgradeSeparate := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_be_upgraded');
  if LValue <> nil then
  begin
    AObj.CanBeUpgraded := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Entities := AObj.Entities;
      SetLength(LArr_Entities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Entities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Entities := LArr_Entities;
    end;
  end;
  LValue := AJSON.GetValue('is_private');
  if LValue <> nil then
  begin
    AObj.IsPrivate := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('unique_gift_number');
  if LValue <> nil then
  begin
    AObj.UniqueGiftNumber := LValue.AsInt64;
  end;
end;

function TftGiftInfoFromJson(const AJSON: TJSONData): TftGiftInfo;
begin
  Result := TftGiftInfo.Create;
  FillTftGiftInfo(AJSON, Result);
end;

procedure FillTftGifts(const AJSON: TJSONData; const AObj: TftGifts);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Gifts: TArray<TftGift>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('gifts');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Gifts := AObj.Gifts;
      SetLength(LArr_Gifts, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Gifts[LI] := TftGiftFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Gifts := LArr_Gifts;
    end;
  end;
end;

function TftGiftsFromJson(const AJSON: TJSONData): TftGifts;
begin
  Result := TftGifts.Create;
  FillTftGifts(AJSON, Result);
end;

procedure FillTftInlineKeyboardButton(const AJSON: TJSONData; const AObj: TftInlineKeyboardButton);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftKeyboardButton(AJSON, TftKeyboardButton(AObj));
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.Url := LValue.AsString;
  end;
  LValue := AJSON.GetValue('login_ur_l');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.LoginUrL = nil then AObj.LoginUrL := TftLoginUrl.Create;
      FillTftLoginUrl(LValue, AObj.LoginUrL);
    end;
  end;
  LValue := AJSON.GetValue('callba_ck_data');
  if LValue <> nil then
  begin
    AObj.CallbaCkData := LValue.AsString;
  end;
  LValue := AJSON.GetValue('web_app');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.WebApp = nil then AObj.WebApp := TftWebAppInfo.Create;
      FillTftWebAppInfo(LValue, AObj.WebApp);
    end;
  end;
  LValue := AJSON.GetValue('switch_inline_query');
  if LValue <> nil then
  begin
    AObj.SwitchInlineQuery := LValue.AsString;
  end;
  LValue := AJSON.GetValue('switch_inline_query_current_chat');
  if LValue <> nil then
  begin
    AObj.SwitchInlineQueryCurrentChat := LValue.AsString;
  end;
  LValue := AJSON.GetValue('callback_game');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.CallbackGame = nil then AObj.CallbackGame := TftCallbackGame.Create;
      FillTftCallbackGame(LValue, AObj.CallbackGame);
    end;
  end;
  LValue := AJSON.GetValue('pay');
  if LValue <> nil then
  begin
    AObj.Pay := LValue.AsBoolean;
  end;
end;

function TftInlineKeyboardButtonFromJson(const AJSON: TJSONData): TftInlineKeyboardButton;
begin
  Result := TftInlineKeyboardButton.Create('');
  FillTftInlineKeyboardButton(AJSON, Result);
end;

procedure FillTftInlineKeyboardMarkup(const AJSON: TJSONData; const AObj: TftInlineKeyboardMarkup);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftReplyBase(AJSON, TftReplyBase(AObj));
  // skipped unsupported property TftInlineKeyboardMarkup.InlineKeyboard: TList<TftInlineKeyboardRow>
end;

function TftInlineKeyboardMarkupFromJson(const AJSON: TJSONData): TftInlineKeyboardMarkup;
begin
  Result := TftInlineKeyboardMarkup.Create;
  FillTftInlineKeyboardMarkup(AJSON, Result);
end;

procedure FillTftInlineQuery(const AJSON: TJSONData; const AObj: TftInlineQuery);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('query');
  if LValue <> nil then
  begin
    AObj.Query := LValue.AsString;
  end;
  LValue := AJSON.GetValue('offset');
  if LValue <> nil then
  begin
    AObj.Offset := LValue.AsString;
  end;
  LValue := AJSON.GetValue('chat_type');
  if LValue <> nil then
  begin
    AObj.ChatType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftLocation.Create;
      FillTftLocation(LValue, AObj.Location);
    end;
  end;
end;

function TftInlineQueryFromJson(const AJSON: TJSONData): TftInlineQuery;
begin
  Result := TftInlineQuery.Create;
  FillTftInlineQuery(AJSON, Result);
end;

procedure FillTftInlineQueryResult(const AJSON: TJSONData; const AObj: TftInlineQueryResult);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := LValue.AsString;
  end;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('reply_markup');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ReplyMarkup = nil then AObj.ReplyMarkup := TftInlineKeyboardMarkup.Create;
      FillTftInlineKeyboardMarkup(LValue, AObj.ReplyMarkup);
    end;
  end;
end;

function TftInlineQueryResultFromJson(const AJSON: TJSONData): TftInlineQueryResult;
begin
  Result := TftInlineQueryResult.Create;
  FillTftInlineQueryResult(AJSON, Result);
end;

procedure FillTftInlineQueryResultArticle(const AJSON: TJSONData; const AObj: TftInlineQueryResultArticle);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('input_message_content');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InputMessageContent = nil then AObj.InputMessageContent := TftInputMessageContent.Create('');
      FillTftInputMessageContent(LValue, AObj.InputMessageContent);
    end;
  end;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.Url := LValue.AsString;
  end;
  LValue := AJSON.GetValue('hide_url');
  if LValue <> nil then
  begin
    AObj.HideUrl := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_width');
  if LValue <> nil then
  begin
    AObj.ThumbWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_height');
  if LValue <> nil then
  begin
    AObj.ThumbHeight := LValue.AsInt64;
  end;
end;

function TftInlineQueryResultArticleFromJson(const AJSON: TJSONData): TftInlineQueryResultArticle;
begin
  Result := TftInlineQueryResultArticle.Create;
  FillTftInlineQueryResultArticle(AJSON, Result);
end;

procedure FillTftInlineQueryResultAudio(const AJSON: TJSONData; const AObj: TftInlineQueryResultAudio);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('audio_url');
  if LValue <> nil then
  begin
    AObj.AudioUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('performer');
  if LValue <> nil then
  begin
    AObj.Performer := LValue.AsString;
  end;
  LValue := AJSON.GetValue('audio_duration');
  if LValue <> nil then
  begin
    AObj.AudioDuration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('input_message_content');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InputMessageContent = nil then AObj.InputMessageContent := TftInputMessageContent.Create('');
      FillTftInputMessageContent(LValue, AObj.InputMessageContent);
    end;
  end;
end;

function TftInlineQueryResultAudioFromJson(const AJSON: TJSONData): TftInlineQueryResultAudio;
begin
  Result := TftInlineQueryResultAudio.Create;
  FillTftInlineQueryResultAudio(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedAudio(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedAudio);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('audio_file_id');
  if LValue <> nil then
  begin
    AObj.AudioFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('input_message_content');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InputMessageContent = nil then AObj.InputMessageContent := TftInputMessageContent.Create('');
      FillTftInputMessageContent(LValue, AObj.InputMessageContent);
    end;
  end;
end;

function TftInlineQueryResultCachedAudioFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedAudio;
begin
  Result := TftInlineQueryResultCachedAudio.Create;
  FillTftInlineQueryResultCachedAudio(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedDocument(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedDocument);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('document_file_id');
  if LValue <> nil then
  begin
    AObj.DocumentFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('input_message_content');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InputMessageContent = nil then AObj.InputMessageContent := TftInputMessageContent.Create('');
      FillTftInputMessageContent(LValue, AObj.InputMessageContent);
    end;
  end;
end;

function TftInlineQueryResultCachedDocumentFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedDocument;
begin
  Result := TftInlineQueryResultCachedDocument.Create;
  FillTftInlineQueryResultCachedDocument(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedGif(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedGif);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('gif_file_id');
  if LValue <> nil then
  begin
    AObj.GifFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('input_message_content');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InputMessageContent = nil then AObj.InputMessageContent := TftInputMessageContent.Create('');
      FillTftInputMessageContent(LValue, AObj.InputMessageContent);
    end;
  end;
end;

function TftInlineQueryResultCachedGifFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedGif;
begin
  Result := TftInlineQueryResultCachedGif.Create;
  FillTftInlineQueryResultCachedGif(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedMpeg4Gif(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedMpeg4Gif);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('mpeg4_file_id');
  if LValue <> nil then
  begin
    AObj.Mpeg4FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('input_message_content');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InputMessageContent = nil then AObj.InputMessageContent := TftInputMessageContent.Create('');
      FillTftInputMessageContent(LValue, AObj.InputMessageContent);
    end;
  end;
end;

function TftInlineQueryResultCachedMpeg4GifFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedMpeg4Gif;
begin
  Result := TftInlineQueryResultCachedMpeg4Gif.Create;
  FillTftInlineQueryResultCachedMpeg4Gif(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedPhoto(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedPhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('photo_file_id');
  if LValue <> nil then
  begin
    AObj.PhotoFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
end;

function TftInlineQueryResultCachedPhotoFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedPhoto;
begin
  Result := TftInlineQueryResultCachedPhoto.Create;
  FillTftInlineQueryResultCachedPhoto(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedSticker(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedSticker);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('sticker_file_id');
  if LValue <> nil then
  begin
    AObj.StickerFileId := LValue.AsString;
  end;
end;

function TftInlineQueryResultCachedStickerFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedSticker;
begin
  Result := TftInlineQueryResultCachedSticker.Create;
  FillTftInlineQueryResultCachedSticker(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedVideo(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedVideo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('video_file_id');
  if LValue <> nil then
  begin
    AObj.VideoFileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
end;

function TftInlineQueryResultCachedVideoFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedVideo;
begin
  Result := TftInlineQueryResultCachedVideo.Create;
  FillTftInlineQueryResultCachedVideo(AJSON, Result);
end;

procedure FillTftInlineQueryResultCachedVoice(const AJSON: TJSONData; const AObj: TftInlineQueryResultCachedVoice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('voice_file_id');
  if LValue <> nil then
  begin
    AObj.VoiceFileId := LValue.AsString;
  end;
end;

function TftInlineQueryResultCachedVoiceFromJson(const AJSON: TJSONData): TftInlineQueryResultCachedVoice;
begin
  Result := TftInlineQueryResultCachedVoice.Create;
  FillTftInlineQueryResultCachedVoice(AJSON, Result);
end;

procedure FillTftInlineQueryResultContact(const AJSON: TJSONData; const AObj: TftInlineQueryResultContact);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('phone_number');
  if LValue <> nil then
  begin
    AObj.PhoneNumber := LValue.AsString;
  end;
  LValue := AJSON.GetValue('first_name');
  if LValue <> nil then
  begin
    AObj.FirstName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_name');
  if LValue <> nil then
  begin
    AObj.LastName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('vcard');
  if LValue <> nil then
  begin
    AObj.Vcard := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_width');
  if LValue <> nil then
  begin
    AObj.ThumbWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_height');
  if LValue <> nil then
  begin
    AObj.ThumbHeight := LValue.AsInt64;
  end;
end;

function TftInlineQueryResultContactFromJson(const AJSON: TJSONData): TftInlineQueryResultContact;
begin
  Result := TftInlineQueryResultContact.Create;
  FillTftInlineQueryResultContact(AJSON, Result);
end;

procedure FillTftInlineQueryResultDocument(const AJSON: TJSONData; const AObj: TftInlineQueryResultDocument);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('document_url');
  if LValue <> nil then
  begin
    AObj.DocumentUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('mime_type');
  if LValue <> nil then
  begin
    AObj.MimeType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_width');
  if LValue <> nil then
  begin
    AObj.ThumbWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_height');
  if LValue <> nil then
  begin
    AObj.ThumbHeight := LValue.AsInt64;
  end;
end;

function TftInlineQueryResultDocumentFromJson(const AJSON: TJSONData): TftInlineQueryResultDocument;
begin
  Result := TftInlineQueryResultDocument.Create;
  FillTftInlineQueryResultDocument(AJSON, Result);
end;

procedure FillTftInlineQueryResultGame(const AJSON: TJSONData; const AObj: TftInlineQueryResultGame);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('game_short_name');
  if LValue <> nil then
  begin
    AObj.GameShortName := LValue.AsString;
  end;
end;

function TftInlineQueryResultGameFromJson(const AJSON: TJSONData): TftInlineQueryResultGame;
begin
  Result := TftInlineQueryResultGame.Create;
  FillTftInlineQueryResultGame(AJSON, Result);
end;

procedure FillTftInlineQueryResultGif(const AJSON: TJSONData; const AObj: TftInlineQueryResultGif);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('gif_url');
  if LValue <> nil then
  begin
    AObj.GifUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('gif_width');
  if LValue <> nil then
  begin
    AObj.GifWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('gif_height');
  if LValue <> nil then
  begin
    AObj.GifHeight := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('gif_duration');
  if LValue <> nil then
  begin
    AObj.GifDuration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
end;

function TftInlineQueryResultGifFromJson(const AJSON: TJSONData): TftInlineQueryResultGif;
begin
  Result := TftInlineQueryResultGif.Create;
  FillTftInlineQueryResultGif(AJSON, Result);
end;

procedure FillTftInlineQueryResultLocation(const AJSON: TJSONData; const AObj: TftInlineQueryResultLocation);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('latitude');
  if LValue <> nil then
  begin
    AObj.Latitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('longitude');
  if LValue <> nil then
  begin
    AObj.Longitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_width');
  if LValue <> nil then
  begin
    AObj.ThumbWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_height');
  if LValue <> nil then
  begin
    AObj.ThumbHeight := LValue.AsInt64;
  end;
end;

function TftInlineQueryResultLocationFromJson(const AJSON: TJSONData): TftInlineQueryResultLocation;
begin
  Result := TftInlineQueryResultLocation.Create;
  FillTftInlineQueryResultLocation(AJSON, Result);
end;

procedure FillTftInlineQueryResultMpeg4Gif(const AJSON: TJSONData; const AObj: TftInlineQueryResultMpeg4Gif);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('mpeg4_url');
  if LValue <> nil then
  begin
    AObj.Mpeg4Url := LValue.AsString;
  end;
  LValue := AJSON.GetValue('mpeg4_width');
  if LValue <> nil then
  begin
    AObj.Mpeg4Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('mpeg4_height');
  if LValue <> nil then
  begin
    AObj.Mpeg4Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('mpeg4_duration');
  if LValue <> nil then
  begin
    AObj.Mpeg4Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
end;

function TftInlineQueryResultMpeg4GifFromJson(const AJSON: TJSONData): TftInlineQueryResultMpeg4Gif;
begin
  Result := TftInlineQueryResultMpeg4Gif.Create;
  FillTftInlineQueryResultMpeg4Gif(AJSON, Result);
end;

procedure FillTftInlineQueryResultPhoto(const AJSON: TJSONData; const AObj: TftInlineQueryResultPhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('photo_url');
  if LValue <> nil then
  begin
    AObj.PhotoUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('photo_width');
  if LValue <> nil then
  begin
    AObj.PhotoWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('photo_height');
  if LValue <> nil then
  begin
    AObj.PhotoHeight := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('photo_duration');
  if LValue <> nil then
  begin
    AObj.PhotoDuration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
end;

function TftInlineQueryResultPhotoFromJson(const AJSON: TJSONData): TftInlineQueryResultPhoto;
begin
  Result := TftInlineQueryResultPhoto.Create;
  FillTftInlineQueryResultPhoto(AJSON, Result);
end;

procedure FillTftInlineQueryResultVenue(const AJSON: TJSONData; const AObj: TftInlineQueryResultVenue);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('latitude');
  if LValue <> nil then
  begin
    AObj.Latitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('longitude');
  if LValue <> nil then
  begin
    AObj.Longitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('address');
  if LValue <> nil then
  begin
    AObj.Address := LValue.AsString;
  end;
  LValue := AJSON.GetValue('foursquare_id');
  if LValue <> nil then
  begin
    AObj.FoursquareId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('foursquare_type');
  if LValue <> nil then
  begin
    AObj.FoursquareType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_width');
  if LValue <> nil then
  begin
    AObj.ThumbWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb_height');
  if LValue <> nil then
  begin
    AObj.ThumbHeight := LValue.AsInt64;
  end;
end;

function TftInlineQueryResultVenueFromJson(const AJSON: TJSONData): TftInlineQueryResultVenue;
begin
  Result := TftInlineQueryResultVenue.Create;
  FillTftInlineQueryResultVenue(AJSON, Result);
end;

procedure FillTftInlineQueryResultVideo(const AJSON: TJSONData; const AObj: TftInlineQueryResultVideo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('video_url');
  if LValue <> nil then
  begin
    AObj.VideoUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('mime_type');
  if LValue <> nil then
  begin
    AObj.MimeType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('thumb_url');
  if LValue <> nil then
  begin
    AObj.ThumbUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('video_width');
  if LValue <> nil then
  begin
    AObj.VideoWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('video_height');
  if LValue <> nil then
  begin
    AObj.VideoHeight := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('video_duration');
  if LValue <> nil then
  begin
    AObj.VideoDuration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
end;

function TftInlineQueryResultVideoFromJson(const AJSON: TJSONData): TftInlineQueryResultVideo;
begin
  Result := TftInlineQueryResultVideo.Create;
  FillTftInlineQueryResultVideo(AJSON, Result);
end;

procedure FillTftInlineQueryResultVoice(const AJSON: TJSONData; const AObj: TftInlineQueryResultVoice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInlineQueryResult(AJSON, TftInlineQueryResult(AObj));
  LValue := AJSON.GetValue('voice_url');
  if LValue <> nil then
  begin
    AObj.VoiceUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('voice_duration');
  if LValue <> nil then
  begin
    AObj.VoiceDuration := LValue.AsInt64;
  end;
end;

function TftInlineQueryResultVoiceFromJson(const AJSON: TJSONData): TftInlineQueryResultVoice;
begin
  Result := TftInlineQueryResultVoice.Create;
  FillTftInlineQueryResultVoice(AJSON, Result);
end;

procedure FillTftInputChecklist(const AJSON: TJSONData; const AObj: TftInputChecklist);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_TitleEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_TitleEntities := AObj.TitleEntities;
      SetLength(LArr_TitleEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_TitleEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.TitleEntities := LArr_TitleEntities;
    end;
  end;
  LValue := AJSON.GetValue('tasks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Tasks = nil then AObj.Tasks := TList<TftInputChecklistTask>.Create;
      AObj.Tasks.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Tasks.Add(TftInputChecklistTaskFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('others_can_add_tasks');
  if LValue <> nil then
  begin
    AObj.OthersCanAddTasks := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('others_can_mark_tasks_as_done');
  if LValue <> nil then
  begin
    AObj.OthersCanMarkTasksAsDone := LValue.AsBoolean;
  end;
end;

function TftInputChecklistFromJson(const AJSON: TJSONData): TftInputChecklist;
begin
  Result := TftInputChecklist.Create;
  FillTftInputChecklist(AJSON, Result);
end;

procedure FillTftInputChecklistTask(const AJSON: TJSONData; const AObj: TftInputChecklistTask);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_TextEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_TextEntities := AObj.TextEntities;
      SetLength(LArr_TextEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_TextEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.TextEntities := LArr_TextEntities;
    end;
  end;
end;

function TftInputChecklistTaskFromJson(const AJSON: TJSONData): TftInputChecklistTask;
begin
  Result := TftInputChecklistTask.Create;
  FillTftInputChecklistTask(AJSON, Result);
end;

procedure FillTftInputContactMessageContent(const AJSON: TJSONData; const AObj: TftInputContactMessageContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMessageContent(AJSON, TftInputMessageContent(AObj));
  LValue := AJSON.GetValue('phone_number');
  if LValue <> nil then
  begin
    AObj.PhoneNumber := LValue.AsString;
  end;
  LValue := AJSON.GetValue('first_name');
  if LValue <> nil then
  begin
    AObj.FirstName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_name');
  if LValue <> nil then
  begin
    AObj.LastName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('vcard');
  if LValue <> nil then
  begin
    AObj.Vcard := LValue.AsString;
  end;
end;

function TftInputContactMessageContentFromJson(const AJSON: TJSONData): TftInputContactMessageContent;
begin
  Result := TftInputContactMessageContent.Create;
  FillTftInputContactMessageContent(AJSON, Result);
end;

procedure FillTftInputFile(const AJSON: TJSONData; const AObj: TftInputFile);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    AObj.Data := LValue.AsString;
  end;
  LValue := AJSON.GetValue('mime_type');
  if LValue <> nil then
  begin
    AObj.MimeType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_name');
  if LValue <> nil then
  begin
    AObj.FileName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_path');
  if LValue <> nil then
  begin
    AObj.FilePath := LValue.AsString;
  end;
end;

function TftInputFileFromJson(const AJSON: TJSONData): TftInputFile;
begin
  Result := TftInputFile.Create;
  FillTftInputFile(AJSON, Result);
end;

procedure FillTftInputInvoiceMessageContent(const AJSON: TJSONData; const AObj: TftInputInvoiceMessageContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMessageContent(AJSON, TftInputMessageContent(AObj));
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('payload');
  if LValue <> nil then
  begin
    AObj.Payload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('provider_token');
  if LValue <> nil then
  begin
    AObj.ProviderToken := LValue.AsString;
  end;
  LValue := AJSON.GetValue('currency');
  if LValue <> nil then
  begin
    AObj.Currency := LValue.AsString;
  end;
  LValue := AJSON.GetValue('prices');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Prices = nil then AObj.Prices := TList<Integer>.Create;
      AObj.Prices.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Prices.Add(TJSONArray(LValue).Items[LI].AsInt64);
    end;
  end;
  LValue := AJSON.GetValue('max_tip_amount');
  if LValue <> nil then
  begin
    AObj.MaxTipAmount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('suggested_tip_amounts');
  if LValue <> nil then
  begin
    AObj.SuggestedTipAmounts := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('provider_data');
  if LValue <> nil then
  begin
    AObj.ProviderData := LValue.AsString;
  end;
  LValue := AJSON.GetValue('photo_url');
  if LValue <> nil then
  begin
    AObj.PhotoUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('photo_size');
  if LValue <> nil then
  begin
    AObj.PhotoSize := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('photo_width');
  if LValue <> nil then
  begin
    AObj.PhotoWidth := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('photo_height');
  if LValue <> nil then
  begin
    AObj.PhotoHeight := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('need_name');
  if LValue <> nil then
  begin
    AObj.NeedName := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('need_phone_number');
  if LValue <> nil then
  begin
    AObj.NeedPhoneNumber := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('need_email');
  if LValue <> nil then
  begin
    AObj.NeedEmail := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('need_shipping_address');
  if LValue <> nil then
  begin
    AObj.NeedShippingAddress := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('send_phone_number_to_provider');
  if LValue <> nil then
  begin
    AObj.SendPhoneNumberToProvider := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('send_email_to_provider');
  if LValue <> nil then
  begin
    AObj.SendEmailToProvider := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_flexible');
  if LValue <> nil then
  begin
    AObj.IsFlexible := LValue.AsBoolean;
  end;
end;

function TftInputInvoiceMessageContentFromJson(const AJSON: TJSONData): TftInputInvoiceMessageContent;
begin
  Result := TftInputInvoiceMessageContent.Create;
  FillTftInputInvoiceMessageContent(AJSON, Result);
end;

procedure FillTftInputLocationMessageContent(const AJSON: TJSONData; const AObj: TftInputLocationMessageContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMessageContent(AJSON, TftInputMessageContent(AObj));
  LValue := AJSON.GetValue('latitude');
  if LValue <> nil then
  begin
    AObj.Latitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('longitude');
  if LValue <> nil then
  begin
    AObj.Longitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('horizontal_accuracy');
  if LValue <> nil then
  begin
    AObj.HorizontalAccuracy := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('live_period');
  if LValue <> nil then
  begin
    AObj.LivePeriod := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('heading');
  if LValue <> nil then
  begin
    AObj.Heading := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('proximity_alert_radius');
  if LValue <> nil then
  begin
    AObj.ProximityAlertRadius := LValue.AsInt64;
  end;
end;

function TftInputLocationMessageContentFromJson(const AJSON: TJSONData): TftInputLocationMessageContent;
begin
  Result := TftInputLocationMessageContent.Create;
  FillTftInputLocationMessageContent(AJSON, Result);
end;

procedure FillTftInputMedia(const AJSON: TJSONData; const AObj: TftInputMedia);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_CaptionEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := LValue.AsString;
  end;
  LValue := AJSON.GetValue('media');
  if LValue <> nil then
  begin
    AObj.Media := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_CaptionEntities := AObj.CaptionEntities;
      SetLength(LArr_CaptionEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_CaptionEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.CaptionEntities := LArr_CaptionEntities;
    end;
  end;
  LValue := AJSON.GetValue('media_file');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MediaFile = nil then AObj.MediaFile := TftInputFile.Create;
      FillTftInputFile(LValue, AObj.MediaFile);
    end;
  end;
  LValue := AJSON.GetValue('attach_name');
  if LValue <> nil then
  begin
    AObj.AttachName := LValue.AsString;
  end;
end;

function TftInputMediaFromJson(const AJSON: TJSONData): TftInputMedia;
begin
  Result := TftInputMedia.Create;
  FillTftInputMedia(AJSON, Result);
end;

procedure FillTftInputMediaAnimation(const AJSON: TJSONData; const AObj: TftInputMediaAnimation);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMedia(AJSON, TftInputMedia(AObj));
  LValue := AJSON.GetValue('thumb');
  if LValue <> nil then
  begin
    AObj.Thumb := LValue.AsString;
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('has_spoiler');
  if LValue <> nil then
  begin
    AObj.HasSpoiler := LValue.AsBoolean;
  end;
end;

function TftInputMediaAnimationFromJson(const AJSON: TJSONData): TftInputMediaAnimation;
begin
  Result := TftInputMediaAnimation.Create;
  FillTftInputMediaAnimation(AJSON, Result);
end;

procedure FillTftInputMediaAudio(const AJSON: TJSONData; const AObj: TftInputMediaAudio);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMedia(AJSON, TftInputMedia(AObj));
  LValue := AJSON.GetValue('thumb');
  if LValue <> nil then
  begin
    AObj.Thumb := LValue.AsString;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('performer');
  if LValue <> nil then
  begin
    AObj.Performer := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsInt64;
  end;
end;

function TftInputMediaAudioFromJson(const AJSON: TJSONData): TftInputMediaAudio;
begin
  Result := TftInputMediaAudio.Create;
  FillTftInputMediaAudio(AJSON, Result);
end;

procedure FillTftInputMediaDocument(const AJSON: TJSONData; const AObj: TftInputMediaDocument);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMedia(AJSON, TftInputMedia(AObj));
  LValue := AJSON.GetValue('thumb');
  if LValue <> nil then
  begin
    AObj.Thumb := LValue.AsString;
  end;
  LValue := AJSON.GetValue('disable_content_type_detection');
  if LValue <> nil then
  begin
    AObj.DisableContentTypeDetection := LValue.AsBoolean;
  end;
end;

function TftInputMediaDocumentFromJson(const AJSON: TJSONData): TftInputMediaDocument;
begin
  Result := TftInputMediaDocument.Create;
  FillTftInputMediaDocument(AJSON, Result);
end;

procedure FillTftInputMediaPhoto(const AJSON: TJSONData; const AObj: TftInputMediaPhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMedia(AJSON, TftInputMedia(AObj));
  LValue := AJSON.GetValue('has_spoiler');
  if LValue <> nil then
  begin
    AObj.HasSpoiler := LValue.AsBoolean;
  end;
end;

function TftInputMediaPhotoFromJson(const AJSON: TJSONData): TftInputMediaPhoto;
begin
  Result := TftInputMediaPhoto.Create;
  FillTftInputMediaPhoto(AJSON, Result);
end;

procedure FillTftInputMediaVideo(const AJSON: TJSONData; const AObj: TftInputMediaVideo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMedia(AJSON, TftInputMedia(AObj));
  LValue := AJSON.GetValue('thumb');
  if LValue <> nil then
  begin
    AObj.Thumb := LValue.AsString;
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('supports_streaming');
  if LValue <> nil then
  begin
    AObj.SupportsStreaming := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('has_spoiler');
  if LValue <> nil then
  begin
    AObj.HasSpoiler := LValue.AsBoolean;
  end;
end;

function TftInputMediaVideoFromJson(const AJSON: TJSONData): TftInputMediaVideo;
begin
  Result := TftInputMediaVideo.Create;
  FillTftInputMediaVideo(AJSON, Result);
end;

procedure FillTftInputMessageContent(const AJSON: TJSONData; const AObj: TftInputMessageContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeMessageContent := LValue.AsString;
  end;
end;

function TftInputMessageContentFromJson(const AJSON: TJSONData): TftInputMessageContent;
begin
  Result := TftInputMessageContent.Create('');
  FillTftInputMessageContent(AJSON, Result);
end;

procedure FillTftInputPaidMedia(const AJSON: TJSONData; const AObj: TftInputPaidMedia);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('media');
  if LValue <> nil then
  begin
    AObj.Media := LValue.AsString;
  end;
end;

function TftInputPaidMediaFromJson(const AJSON: TJSONData): TftInputPaidMedia;
begin
  Result := TftInputPaidMedia.Create;
  FillTftInputPaidMedia(AJSON, Result);
end;

procedure FillTftInputPaidMediaLivePhoto(const AJSON: TJSONData; const AObj: TftInputPaidMediaLivePhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputPaidMedia(AJSON, TftInputPaidMedia(AObj));
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    AObj.Photo := LValue.AsString;
  end;
end;

function TftInputPaidMediaLivePhotoFromJson(const AJSON: TJSONData): TftInputPaidMediaLivePhoto;
begin
  Result := TftInputPaidMediaLivePhoto.Create;
  FillTftInputPaidMediaLivePhoto(AJSON, Result);
end;

procedure FillTftInputPaidMediaPhoto(const AJSON: TJSONData; const AObj: TftInputPaidMediaPhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputPaidMedia(AJSON, TftInputPaidMedia(AObj));
end;

function TftInputPaidMediaPhotoFromJson(const AJSON: TJSONData): TftInputPaidMediaPhoto;
begin
  Result := TftInputPaidMediaPhoto.Create;
  FillTftInputPaidMediaPhoto(AJSON, Result);
end;

procedure FillTftInputPaidMediaVideo(const AJSON: TJSONData; const AObj: TftInputPaidMediaVideo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputPaidMedia(AJSON, TftInputPaidMedia(AObj));
  LValue := AJSON.GetValue('thumbnail');
  if LValue <> nil then
  begin
    AObj.Thumbnail := LValue.AsString;
  end;
  LValue := AJSON.GetValue('cover');
  if LValue <> nil then
  begin
    AObj.Cover := LValue.AsString;
  end;
  LValue := AJSON.GetValue('start_timestamp');
  if LValue <> nil then
  begin
    AObj.StartTimestamp := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('supports_streaming');
  if LValue <> nil then
  begin
    AObj.SupportsStreaming := LValue.AsBoolean;
  end;
end;

function TftInputPaidMediaVideoFromJson(const AJSON: TJSONData): TftInputPaidMediaVideo;
begin
  Result := TftInputPaidMediaVideo.Create;
  FillTftInputPaidMediaVideo(AJSON, Result);
end;

procedure FillTftInputProfilePhoto(const AJSON: TJSONData; const AObj: TftInputProfilePhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    AObj.Photo := LValue.AsString;
  end;
  LValue := AJSON.GetValue('animation');
  if LValue <> nil then
  begin
    AObj.Animation := LValue.AsString;
  end;
  LValue := AJSON.GetValue('main_frame_timestamp');
  if LValue <> nil then
  begin
    AObj.MainFrameTimestamp := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('photo_file');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PhotoFile = nil then AObj.PhotoFile := TftInputFile.Create;
      FillTftInputFile(LValue, AObj.PhotoFile);
    end;
  end;
  LValue := AJSON.GetValue('animation_file');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.AnimationFile = nil then AObj.AnimationFile := TftInputFile.Create;
      FillTftInputFile(LValue, AObj.AnimationFile);
    end;
  end;
end;

function TftInputProfilePhotoFromJson(const AJSON: TJSONData): TftInputProfilePhoto;
begin
  Result := TftInputProfilePhoto.Create;
  FillTftInputProfilePhoto(AJSON, Result);
end;

procedure FillTftInputRichBlock(const AJSON: TJSONData; const AObj: TftInputRichBlock);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Text = nil then AObj.Text := TftRichText.Create;
      FillTftRichText(LValue, AObj.Text);
    end;
  end;
  LValue := AJSON.GetValue('blocks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Blocks = nil then AObj.Blocks := TList<TftInputRichBlock>.Create;
      AObj.Blocks.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Blocks.Add(TftInputRichBlockFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('items');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Items = nil then AObj.Items := TList<TftInputRichBlockListItem>.Create;
      AObj.Items.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Items.Add(TftInputRichBlockListItemFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  // skipped unsupported property TftInputRichBlock.Cells: TList<TftRichBlockTableRow>
  LValue := AJSON.GetValue('buttons');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Buttons = nil then AObj.Buttons := TList<TftRichMessageButton>.Create;
      AObj.Buttons.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Buttons.Add(TftRichMessageButtonFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Caption = nil then AObj.Caption := TftRichBlockCaption.Create;
      FillTftRichBlockCaption(LValue, AObj.Caption);
    end;
  end;
  LValue := AJSON.GetValue('credit');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Credit = nil then AObj.Credit := TftRichText.Create;
      FillTftRichText(LValue, AObj.Credit);
    end;
  end;
  LValue := AJSON.GetValue('media');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Media = nil then AObj.Media := TftRichInputMedia.Create;
      FillTftRichInputMedia(LValue, AObj.Media);
    end;
  end;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftLocation.Create;
      FillTftLocation(LValue, AObj.Location);
    end;
  end;
  LValue := AJSON.GetValue('expression');
  if LValue <> nil then
  begin
    AObj.Expression := LValue.AsString;
  end;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('summary');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Summary = nil then AObj.Summary := TftRichText.Create;
      FillTftRichText(LValue, AObj.Summary);
    end;
  end;
  LValue := AJSON.GetValue('language');
  if LValue <> nil then
  begin
    AObj.Language := LValue.AsString;
  end;
  LValue := AJSON.GetValue('align');
  if LValue <> nil then
  begin
    AObj.Align := LValue.AsString;
  end;
  LValue := AJSON.GetValue('size');
  if LValue <> nil then
  begin
    AObj.Size := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('zoom');
  if LValue <> nil then
  begin
    AObj.Zoom := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_bordered');
  if LValue <> nil then
  begin
    AObj.IsBordered := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_striped');
  if LValue <> nil then
  begin
    AObj.IsStriped := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_compact');
  if LValue <> nil then
  begin
    AObj.IsCompact := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_open');
  if LValue <> nil then
  begin
    AObj.IsOpen := LValue.AsBoolean;
  end;
end;

function TftInputRichBlockFromJson(const AJSON: TJSONData): TftInputRichBlock;
begin
  Result := TftInputRichBlock.Create;
  FillTftInputRichBlock(AJSON, Result);
end;

procedure FillTftInputRichBlockListItem(const AJSON: TJSONData; const AObj: TftInputRichBlockListItem);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('blocks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Blocks = nil then AObj.Blocks := TList<TftInputRichBlock>.Create;
      AObj.Blocks.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Blocks.Add(TftInputRichBlockFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('has_checkbox');
  if LValue <> nil then
  begin
    AObj.HasCheckbox := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_checked');
  if LValue <> nil then
  begin
    AObj.IsChecked := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('value');
  if LValue <> nil then
  begin
    AObj.Value := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftInputRichBlockListItemFromJson(const AJSON: TJSONData): TftInputRichBlockListItem;
begin
  Result := TftInputRichBlockListItem.Create;
  FillTftInputRichBlockListItem(AJSON, Result);
end;

procedure FillTftInputRichMessage(const AJSON: TJSONData; const AObj: TftInputRichMessage);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('html');
  if LValue <> nil then
  begin
    AObj.Html := LValue.AsString;
  end;
  LValue := AJSON.GetValue('markdown');
  if LValue <> nil then
  begin
    AObj.Markdown := LValue.AsString;
  end;
  LValue := AJSON.GetValue('blocks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Blocks = nil then AObj.Blocks := TList<TftInputRichBlock>.Create;
      AObj.Blocks.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Blocks.Add(TftInputRichBlockFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('media');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Media = nil then AObj.Media := TList<TftInputRichMessageMedia>.Create;
      AObj.Media.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Media.Add(TftInputRichMessageMediaFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('blocks_json');
  if LValue <> nil then
  begin
    AObj.BlocksJson := LValue.AsString;
  end;
  LValue := AJSON.GetValue('media_json');
  if LValue <> nil then
  begin
    AObj.MediaJson := LValue.AsString;
  end;
  LValue := AJSON.GetValue('is_rtl');
  if LValue <> nil then
  begin
    AObj.IsRtl := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('skip_entity_detection');
  if LValue <> nil then
  begin
    AObj.SkipEntityDetection := LValue.AsBoolean;
  end;
end;

function TftInputRichMessageFromJson(const AJSON: TJSONData): TftInputRichMessage;
begin
  Result := TftInputRichMessage.Create;
  FillTftInputRichMessage(AJSON, Result);
end;

procedure FillTftInputRichMessageMedia(const AJSON: TJSONData; const AObj: TftInputRichMessageMedia);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('media');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Media = nil then AObj.Media := TftRichInputMedia.Create;
      FillTftRichInputMedia(LValue, AObj.Media);
    end;
  end;
end;

function TftInputRichMessageMediaFromJson(const AJSON: TJSONData): TftInputRichMessageMedia;
begin
  Result := TftInputRichMessageMedia.Create;
  FillTftInputRichMessageMedia(AJSON, Result);
end;

procedure FillTftInputSticker(const AJSON: TJSONData; const AObj: TftInputSticker);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_EmojiList: TArray<String>;
  LArr_Keywords: TArray<String>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('sticker');
  if LValue <> nil then
  begin
    AObj.Sticker := LValue.AsString;
  end;
  LValue := AJSON.GetValue('format');
  if LValue <> nil then
  begin
    AObj.Format := LValue.AsString;
  end;
  LValue := AJSON.GetValue('emoji_list');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_EmojiList := AObj.EmojiList;
      SetLength(LArr_EmojiList, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_EmojiList[LI] := TJSONArray(LValue).Items[LI].AsString;
      AObj.EmojiList := LArr_EmojiList;
    end;
  end;
  LValue := AJSON.GetValue('mask_position');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MaskPosition = nil then AObj.MaskPosition := TftMaskPosition.Create;
      FillTftMaskPosition(LValue, AObj.MaskPosition);
    end;
  end;
  LValue := AJSON.GetValue('keywords');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Keywords := AObj.Keywords;
      SetLength(LArr_Keywords, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Keywords[LI] := TJSONArray(LValue).Items[LI].AsString;
      AObj.Keywords := LArr_Keywords;
    end;
  end;
end;

function TftInputStickerFromJson(const AJSON: TJSONData): TftInputSticker;
begin
  Result := TftInputSticker.Create;
  FillTftInputSticker(AJSON, Result);
end;

procedure FillTftInputStoryContent(const AJSON: TJSONData; const AObj: TftInputStoryContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    AObj.Photo := LValue.AsString;
  end;
  LValue := AJSON.GetValue('video');
  if LValue <> nil then
  begin
    AObj.Video := LValue.AsString;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('cover_frame_timestamp');
  if LValue <> nil then
  begin
    AObj.CoverFrameTimestamp := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('is_animation');
  if LValue <> nil then
  begin
    AObj.IsAnimation := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('photo_file');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PhotoFile = nil then AObj.PhotoFile := TftInputFile.Create;
      FillTftInputFile(LValue, AObj.PhotoFile);
    end;
  end;
  LValue := AJSON.GetValue('video_file');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.VideoFile = nil then AObj.VideoFile := TftInputFile.Create;
      FillTftInputFile(LValue, AObj.VideoFile);
    end;
  end;
end;

function TftInputStoryContentFromJson(const AJSON: TJSONData): TftInputStoryContent;
begin
  Result := TftInputStoryContent.Create;
  FillTftInputStoryContent(AJSON, Result);
end;

procedure FillTftInputTextMessageContent(const AJSON: TJSONData; const AObj: TftInputTextMessageContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMessageContent(AJSON, TftInputMessageContent(AObj));
  LValue := AJSON.GetValue('message_text');
  if LValue <> nil then
  begin
    AObj.MessageText := LValue.AsString;
  end;
  LValue := AJSON.GetValue('parse_mode');
  if LValue <> nil then
  begin
    AObj.ParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('disable_web_page_preview');
  if LValue <> nil then
  begin
    AObj.DisableWebPagePreview := LValue.AsBoolean;
  end;
end;

function TftInputTextMessageContentFromJson(const AJSON: TJSONData): TftInputTextMessageContent;
begin
  Result := TftInputTextMessageContent.Create;
  FillTftInputTextMessageContent(AJSON, Result);
end;

procedure FillTftInputVenueMessageContent(const AJSON: TJSONData; const AObj: TftInputVenueMessageContent);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftInputMessageContent(AJSON, TftInputMessageContent(AObj));
  LValue := AJSON.GetValue('latitude');
  if LValue <> nil then
  begin
    AObj.Latitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('longitude');
  if LValue <> nil then
  begin
    AObj.Longitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('address');
  if LValue <> nil then
  begin
    AObj.Address := LValue.AsString;
  end;
  LValue := AJSON.GetValue('foursquare_id');
  if LValue <> nil then
  begin
    AObj.FoursquareId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('foursquare_type');
  if LValue <> nil then
  begin
    AObj.FoursquareType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('google_place_id');
  if LValue <> nil then
  begin
    AObj.GooglePlaceId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('google_place_type');
  if LValue <> nil then
  begin
    AObj.GooglePlaceType := LValue.AsString;
  end;
end;

function TftInputVenueMessageContentFromJson(const AJSON: TJSONData): TftInputVenueMessageContent;
begin
  Result := TftInputVenueMessageContent.Create;
  FillTftInputVenueMessageContent(AJSON, Result);
end;

procedure FillTftInvoice(const AJSON: TJSONData; const AObj: TftInvoice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('description');
  if LValue <> nil then
  begin
    AObj.Description := LValue.AsString;
  end;
  LValue := AJSON.GetValue('start_parameter');
  if LValue <> nil then
  begin
    AObj.StartParameter := LValue.AsString;
  end;
  LValue := AJSON.GetValue('curren_cy');
  if LValue <> nil then
  begin
    AObj.CurrenCy := LValue.AsString;
  end;
  LValue := AJSON.GetValue('total_amount');
  if LValue <> nil then
  begin
    AObj.TotalAmount := LValue.AsInt64;
  end;
end;

function TftInvoiceFromJson(const AJSON: TJSONData): TftInvoice;
begin
  Result := TftInvoice.Create;
  FillTftInvoice(AJSON, Result);
end;

procedure FillTftKeyboardButton(const AJSON: TJSONData; const AObj: TftKeyboardButton);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('request_contact');
  if LValue <> nil then
  begin
    AObj.RequestContact := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('request_location');
  if LValue <> nil then
  begin
    AObj.RequestLocation := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('request_poll');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.RequestPoll = nil then AObj.RequestPoll := TftKeyboardButtonPollType.Create;
      FillTftKeyboardButtonPollType(LValue, AObj.RequestPoll);
    end;
  end;
  LValue := AJSON.GetValue('web_app');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.WebApp = nil then AObj.WebApp := TftWebAppInfo.Create;
      FillTftWebAppInfo(LValue, AObj.WebApp);
    end;
  end;
end;

function TftKeyboardButtonFromJson(const AJSON: TJSONData): TftKeyboardButton;
begin
  Result := TftKeyboardButton.Create('');
  FillTftKeyboardButton(AJSON, Result);
end;

procedure FillTftKeyboardButtonPollType(const AJSON: TJSONData; const AObj: TftKeyboardButtonPollType);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := LValue.AsString;
  end;
end;

function TftKeyboardButtonPollTypeFromJson(const AJSON: TJSONData): TftKeyboardButtonPollType;
begin
  Result := TftKeyboardButtonPollType.Create;
  FillTftKeyboardButtonPollType(AJSON, Result);
end;

procedure FillTftLabeledPrice(const AJSON: TJSONData; const AObj: TftLabeledPrice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('label_price');
  if LValue <> nil then
  begin
    AObj.LabelPrice := LValue.AsString;
  end;
  LValue := AJSON.GetValue('amount');
  if LValue <> nil then
  begin
    AObj.Amount := LValue.AsInt64;
  end;
end;

function TftLabeledPriceFromJson(const AJSON: TJSONData): TftLabeledPrice;
begin
  Result := TftLabeledPrice.Create;
  FillTftLabeledPrice(AJSON, Result);
end;

procedure FillTftLinkPreviewOptions(const AJSON: TJSONData; const AObj: TftLinkPreviewOptions);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('is_disabled');
  if LValue <> nil then
  begin
    AObj.IsDisabled := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.URL := LValue.AsString;
  end;
  LValue := AJSON.GetValue('prefer_small_media');
  if LValue <> nil then
  begin
    AObj.PreferSmallMedia := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('prefer_large_media');
  if LValue <> nil then
  begin
    AObj.PreferLargeMedia := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('show_above_text');
  if LValue <> nil then
  begin
    AObj.ShowAboveText := LValue.AsBoolean;
  end;
end;

function TftLinkPreviewOptionsFromJson(const AJSON: TJSONData): TftLinkPreviewOptions;
begin
  Result := TftLinkPreviewOptions.Create;
  FillTftLinkPreviewOptions(AJSON, Result);
end;

procedure FillTftLivePhoto(const AJSON: TJSONData; const AObj: TftLivePhoto);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Photo: TftPhotoSizeList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Photo := AObj.Photo;
      SetLength(LArr_Photo, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Photo[LI] := TftPhotoSizeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Photo := LArr_Photo;
    end;
  end;
  LValue := AJSON.GetValue('file_id');
  if LValue <> nil then
  begin
    AObj.FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_unique_id');
  if LValue <> nil then
  begin
    AObj.FileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('mime_type');
  if LValue <> nil then
  begin
    AObj.MimeType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_size');
  if LValue <> nil then
  begin
    AObj.FileSize := LValue.AsInt64;
  end;
end;

function TftLivePhotoFromJson(const AJSON: TJSONData): TftLivePhoto;
begin
  Result := TftLivePhoto.Create;
  FillTftLivePhoto(AJSON, Result);
end;

procedure FillTftLocation(const AJSON: TJSONData; const AObj: TftLocation);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('longitude');
  if LValue <> nil then
  begin
    AObj.Longitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('latitude');
  if LValue <> nil then
  begin
    AObj.Latitude := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('horizontal_accuracy');
  if LValue <> nil then
  begin
    AObj.HorizontalAccuracy := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('live_period');
  if LValue <> nil then
  begin
    AObj.LivePeriod := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('heading');
  if LValue <> nil then
  begin
    AObj.Heading := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('proximity_alert_radius');
  if LValue <> nil then
  begin
    AObj.ProximityAlertRadius := LValue.AsInt64;
  end;
end;

function TftLocationFromJson(const AJSON: TJSONData): TftLocation;
begin
  Result := TftLocation.Create;
  FillTftLocation(AJSON, Result);
end;

procedure FillTftLoginUrl(const AJSON: TJSONData; const AObj: TftLoginUrl);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.Url := LValue.AsString;
  end;
  LValue := AJSON.GetValue('forward_text');
  if LValue <> nil then
  begin
    AObj.ForwardText := LValue.AsString;
  end;
  LValue := AJSON.GetValue('bot_username');
  if LValue <> nil then
  begin
    AObj.BotUsername := LValue.AsString;
  end;
  LValue := AJSON.GetValue('request_write_access');
  if LValue <> nil then
  begin
    AObj.RequestWriteAccess := LValue.AsBoolean;
  end;
end;

function TftLoginUrlFromJson(const AJSON: TJSONData): TftLoginUrl;
begin
  Result := TftLoginUrl.Create;
  FillTftLoginUrl(AJSON, Result);
end;

procedure FillTftManagedBotUpdated(const AJSON: TJSONData; const AObj: TftManagedBotUpdated);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('bot');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Bot = nil then AObj.Bot := TftUser.Create;
      FillTftUser(LValue, AObj.Bot);
    end;
  end;
end;

function TftManagedBotUpdatedFromJson(const AJSON: TJSONData): TftManagedBotUpdated;
begin
  Result := TftManagedBotUpdated.Create;
  FillTftManagedBotUpdated(AJSON, Result);
end;

procedure FillTftMaskPosition(const AJSON: TJSONData; const AObj: TftMaskPosition);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('point');
  if LValue <> nil then
  begin
    AObj.Point := LValue.AsString;
  end;
  LValue := AJSON.GetValue('x_shift');
  if LValue <> nil then
  begin
    AObj.XShift := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('y_shift');
  if LValue <> nil then
  begin
    AObj.YShift := LValue.AsFloat;
  end;
  LValue := AJSON.GetValue('scale');
  if LValue <> nil then
  begin
    AObj.Scale := LValue.AsFloat;
  end;
end;

function TftMaskPositionFromJson(const AJSON: TJSONData): TftMaskPosition;
begin
  Result := TftMaskPosition.Create;
  FillTftMaskPosition(AJSON, Result);
end;

procedure FillTftMenuButton(const AJSON: TJSONData; const AObj: TftMenuButton);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := LValue.AsString;
  end;
end;

function TftMenuButtonFromJson(const AJSON: TJSONData): TftMenuButton;
begin
  Result := TftMenuButton.Create;
  FillTftMenuButton(AJSON, Result);
end;

procedure FillTftMenuButtonCommands(const AJSON: TJSONData; const AObj: TftMenuButtonCommands);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftMenuButton(AJSON, TftMenuButton(AObj));
end;

function TftMenuButtonCommandsFromJson(const AJSON: TJSONData): TftMenuButtonCommands;
begin
  Result := TftMenuButtonCommands.Create;
  FillTftMenuButtonCommands(AJSON, Result);
end;

procedure FillTftMenuButtonDefault(const AJSON: TJSONData; const AObj: TftMenuButtonDefault);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftMenuButton(AJSON, TftMenuButton(AObj));
end;

function TftMenuButtonDefaultFromJson(const AJSON: TJSONData): TftMenuButtonDefault;
begin
  Result := TftMenuButtonDefault.Create;
  FillTftMenuButtonDefault(AJSON, Result);
end;

procedure FillTftMenuButtonWebApp(const AJSON: TJSONData; const AObj: TftMenuButtonWebApp);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftMenuButton(AJSON, TftMenuButton(AObj));
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('web_app');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.WebApp = nil then AObj.WebApp := TftWebAppInfo.Create;
      FillTftWebAppInfo(LValue, AObj.WebApp);
    end;
  end;
end;

function TftMenuButtonWebAppFromJson(const AJSON: TJSONData): TftMenuButtonWebApp;
begin
  Result := TftMenuButtonWebApp.Create;
  FillTftMenuButtonWebApp(AJSON, Result);
end;

procedure FillTftMessage(const AJSON: TJSONData; const AObj: TftMessage);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Entities: TftMessageEntityList;
  LArr_CaptionEntities: TftMessageEntityList;
  LArr_Photo: TftPhotoSizeList;
  LArr_NewChatMembers: TftUserList;
  LArr_NewChatPhoto: TftPhotoSizeList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('message_id');
  if LValue <> nil then
  begin
    AObj.MessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('message_thread_id');
  if LValue <> nil then
  begin
    AObj.MessageThreadId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('sender_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SenderChat = nil then AObj.SenderChat := TftChat.Create;
      FillTftChat(LValue, AObj.SenderChat);
    end;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('forward_from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ForwardFrom = nil then AObj.ForwardFrom := TftUser.Create;
      FillTftUser(LValue, AObj.ForwardFrom);
    end;
  end;
  LValue := AJSON.GetValue('forward_from_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ForwardFromChat = nil then AObj.ForwardFromChat := TftChat.Create;
      FillTftChat(LValue, AObj.ForwardFromChat);
    end;
  end;
  LValue := AJSON.GetValue('forward_from_message_id');
  if LValue <> nil then
  begin
    AObj.ForwardFromMessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('forward_signature');
  if LValue <> nil then
  begin
    AObj.ForwardSignature := LValue.AsString;
  end;
  LValue := AJSON.GetValue('forward_sender_name');
  if LValue <> nil then
  begin
    AObj.ForwardSenderName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('forward_date');
  if LValue <> nil then
  begin
    AObj.ForwardDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_topic_message');
  if LValue <> nil then
  begin
    AObj.IsTopicMessage := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_automatic_forward');
  if LValue <> nil then
  begin
    AObj.IsAutomaticForward := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('reply_to_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ReplyToMessage = nil then AObj.ReplyToMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.ReplyToMessage);
    end;
  end;
  LValue := AJSON.GetValue('via_bot');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ViaBot = nil then AObj.ViaBot := TftUser.Create;
      FillTftUser(LValue, AObj.ViaBot);
    end;
  end;
  LValue := AJSON.GetValue('edit_date');
  if LValue <> nil then
  begin
    AObj.EditDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('has_protected_content');
  if LValue <> nil then
  begin
    AObj.HasProtectedContent := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('media_group_id');
  if LValue <> nil then
  begin
    AObj.MediaGroupId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('author_signature');
  if LValue <> nil then
  begin
    AObj.AuthorSignature := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Entities := AObj.Entities;
      SetLength(LArr_Entities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Entities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Entities := LArr_Entities;
    end;
  end;
  LValue := AJSON.GetValue('caption');
  if LValue <> nil then
  begin
    AObj.Caption := LValue.AsString;
  end;
  LValue := AJSON.GetValue('caption_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_CaptionEntities := AObj.CaptionEntities;
      SetLength(LArr_CaptionEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_CaptionEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.CaptionEntities := LArr_CaptionEntities;
    end;
  end;
  LValue := AJSON.GetValue('has_media_spoiler');
  if LValue <> nil then
  begin
    AObj.HasMediaSpoiler := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('animation');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Animation = nil then AObj.Animation := TftAnimation.Create;
      FillTftAnimation(LValue, AObj.Animation);
    end;
  end;
  LValue := AJSON.GetValue('audio');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Audio = nil then AObj.Audio := TftAudio.Create;
      FillTftAudio(LValue, AObj.Audio);
    end;
  end;
  LValue := AJSON.GetValue('document');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Document = nil then AObj.Document := TftDocument.Create;
      FillTftDocument(LValue, AObj.Document);
    end;
  end;
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Photo := AObj.Photo;
      SetLength(LArr_Photo, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Photo[LI] := TftPhotoSizeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Photo := LArr_Photo;
    end;
  end;
  LValue := AJSON.GetValue('sticker');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Sticker = nil then AObj.Sticker := TftSticker.Create;
      FillTftSticker(LValue, AObj.Sticker);
    end;
  end;
  LValue := AJSON.GetValue('video');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Video = nil then AObj.Video := TftVideo.Create;
      FillTftVideo(LValue, AObj.Video);
    end;
  end;
  LValue := AJSON.GetValue('video_note');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.VideoNote = nil then AObj.VideoNote := TftVideoNote.Create;
      FillTftVideoNote(LValue, AObj.VideoNote);
    end;
  end;
  LValue := AJSON.GetValue('voice');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Voice = nil then AObj.Voice := TftVoice.Create;
      FillTftVoice(LValue, AObj.Voice);
    end;
  end;
  LValue := AJSON.GetValue('contact');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Contact = nil then AObj.Contact := TftContact.Create;
      FillTftContact(LValue, AObj.Contact);
    end;
  end;
  LValue := AJSON.GetValue('dice');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Dice = nil then AObj.Dice := TftDice.Create;
      FillTftDice(LValue, AObj.Dice);
    end;
  end;
  LValue := AJSON.GetValue('game');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Game = nil then AObj.Game := TftGame.Create;
      FillTftGame(LValue, AObj.Game);
    end;
  end;
  LValue := AJSON.GetValue('poll');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Poll = nil then AObj.Poll := TftPoll.Create;
      FillTftPoll(LValue, AObj.Poll);
    end;
  end;
  LValue := AJSON.GetValue('venue');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Venue = nil then AObj.Venue := TftVenue.Create;
      FillTftVenue(LValue, AObj.Venue);
    end;
  end;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftLocation.Create;
      FillTftLocation(LValue, AObj.Location);
    end;
  end;
  LValue := AJSON.GetValue('new_chat_members');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_NewChatMembers := AObj.NewChatMembers;
      SetLength(LArr_NewChatMembers, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_NewChatMembers[LI] := TftUserFromJson(TJSONArray(LValue).Items[LI]);
      AObj.NewChatMembers := LArr_NewChatMembers;
    end;
  end;
  LValue := AJSON.GetValue('left_chat_member');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.LeftChatMember = nil then AObj.LeftChatMember := TftUser.Create;
      FillTftUser(LValue, AObj.LeftChatMember);
    end;
  end;
  LValue := AJSON.GetValue('new_chat_title');
  if LValue <> nil then
  begin
    AObj.NewChatTitle := LValue.AsString;
  end;
  LValue := AJSON.GetValue('new_chat_photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_NewChatPhoto := AObj.NewChatPhoto;
      SetLength(LArr_NewChatPhoto, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_NewChatPhoto[LI] := TftPhotoSizeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.NewChatPhoto := LArr_NewChatPhoto;
    end;
  end;
  LValue := AJSON.GetValue('message_auto_delete_timer_changed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MessageAutoDeleteTimerChanged = nil then AObj.MessageAutoDeleteTimerChanged := TftMessageAutoDeleteTimerChanged.Create;
      FillTftMessageAutoDeleteTimerChanged(LValue, AObj.MessageAutoDeleteTimerChanged);
    end;
  end;
  LValue := AJSON.GetValue('migrate_to_chat_id');
  if LValue <> nil then
  begin
    AObj.MigrateToChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('migrate_from_chat_id');
  if LValue <> nil then
  begin
    AObj.MigrateFromChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('pinned_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PinnedMessage = nil then AObj.PinnedMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.PinnedMessage);
    end;
  end;
  LValue := AJSON.GetValue('invoice');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Invoice = nil then AObj.Invoice := TftInvoice.Create;
      FillTftInvoice(LValue, AObj.Invoice);
    end;
  end;
  LValue := AJSON.GetValue('successful_payment');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuccessfulPayment = nil then AObj.SuccessfulPayment := TftSuccessfulPayment.Create;
      FillTftSuccessfulPayment(LValue, AObj.SuccessfulPayment);
    end;
  end;
  LValue := AJSON.GetValue('connected_website');
  if LValue <> nil then
  begin
    AObj.ConnectedWebsite := LValue.AsString;
  end;
  LValue := AJSON.GetValue('write_access_allowed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.WriteAccessAllowed = nil then AObj.WriteAccessAllowed := TftWriteAccessAllowed.Create;
      FillTftWriteAccessAllowed(LValue, AObj.WriteAccessAllowed);
    end;
  end;
  LValue := AJSON.GetValue('passport_data');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PassportData = nil then AObj.PassportData := TftPassportData.Create;
      FillTftPassportData(LValue, AObj.PassportData);
    end;
  end;
  LValue := AJSON.GetValue('proximity_alert_triggered');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ProximityAlertTriggered = nil then AObj.ProximityAlertTriggered := TftProximityAlertTriggered.Create;
      FillTftProximityAlertTriggered(LValue, AObj.ProximityAlertTriggered);
    end;
  end;
  LValue := AJSON.GetValue('forum_topic_created');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ForumTopicCreated = nil then AObj.ForumTopicCreated := TftForumTopicCreated.Create;
      FillTftForumTopicCreated(LValue, AObj.ForumTopicCreated);
    end;
  end;
  LValue := AJSON.GetValue('forum_topic_edited');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ForumTopicEdited = nil then AObj.ForumTopicEdited := TftForumTopicEdited.Create;
      FillTftForumTopicEdited(LValue, AObj.ForumTopicEdited);
    end;
  end;
  LValue := AJSON.GetValue('forum_topic_closed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ForumTopicClosed = nil then AObj.ForumTopicClosed := TftForumTopicClosed.Create;
      FillTftForumTopicClosed(LValue, AObj.ForumTopicClosed);
    end;
  end;
  LValue := AJSON.GetValue('forum_topic_reopened');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ForumTopicReopened = nil then AObj.ForumTopicReopened := TftForumTopicReopened.Create;
      FillTftForumTopicReopened(LValue, AObj.ForumTopicReopened);
    end;
  end;
  LValue := AJSON.GetValue('general_forum_topic_hidden');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.GeneralForumTopicHidden = nil then AObj.GeneralForumTopicHidden := TftGeneralForumTopicHidden.Create;
      FillTftGeneralForumTopicHidden(LValue, AObj.GeneralForumTopicHidden);
    end;
  end;
  LValue := AJSON.GetValue('general_forum_topic_unhidden');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.GeneralForumTopicUnhidden = nil then AObj.GeneralForumTopicUnhidden := TftGeneralForumTopicUnhidden.Create;
      FillTftGeneralForumTopicUnhidden(LValue, AObj.GeneralForumTopicUnhidden);
    end;
  end;
  LValue := AJSON.GetValue('video_chat_scheduled');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.VideoChatScheduled = nil then AObj.VideoChatScheduled := TftVideoChatScheduled.Create;
      FillTftVideoChatScheduled(LValue, AObj.VideoChatScheduled);
    end;
  end;
  LValue := AJSON.GetValue('video_chat_started');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.VideoChatStarted = nil then AObj.VideoChatStarted := TftVideoChatStarted.Create;
      FillTftVideoChatStarted(LValue, AObj.VideoChatStarted);
    end;
  end;
  LValue := AJSON.GetValue('video_chat_ended');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.VideoChatEnded = nil then AObj.VideoChatEnded := TftVideoChatEnded.Create;
      FillTftVideoChatEnded(LValue, AObj.VideoChatEnded);
    end;
  end;
  LValue := AJSON.GetValue('video_chat_participantsinvited');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.VideoChatParticipantsinvited = nil then AObj.VideoChatParticipantsinvited := TftVideoChatParticipantsInvited.Create;
      FillTftVideoChatParticipantsInvited(LValue, AObj.VideoChatParticipantsinvited);
    end;
  end;
  LValue := AJSON.GetValue('web_app_data');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.WebAppData = nil then AObj.WebAppData := TftWebAppData.Create;
      FillTftWebAppData(LValue, AObj.WebAppData);
    end;
  end;
  LValue := AJSON.GetValue('reply_markup');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ReplyMarkup = nil then AObj.ReplyMarkup := TftInlineKeyboardMarkup.Create;
      FillTftInlineKeyboardMarkup(LValue, AObj.ReplyMarkup);
    end;
  end;
  LValue := AJSON.GetValue('direct_messages_topic');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.DirectMessagesTopic = nil then AObj.DirectMessagesTopic := TftDirectMessagesTopic.Create;
      FillTftDirectMessagesTopic(LValue, AObj.DirectMessagesTopic);
    end;
  end;
  LValue := AJSON.GetValue('sender_boost_count');
  if LValue <> nil then
  begin
    AObj.SenderBoostCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('sender_business_bot');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SenderBusinessBot = nil then AObj.SenderBusinessBot := TftUser.Create;
      FillTftUser(LValue, AObj.SenderBusinessBot);
    end;
  end;
  LValue := AJSON.GetValue('sender_tag');
  if LValue <> nil then
  begin
    AObj.SenderTag := LValue.AsString;
  end;
  LValue := AJSON.GetValue('receiver_user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ReceiverUser = nil then AObj.ReceiverUser := TftUser.Create;
      FillTftUser(LValue, AObj.ReceiverUser);
    end;
  end;
  LValue := AJSON.GetValue('ephemeral_message_id');
  if LValue <> nil then
  begin
    AObj.EphemeralMessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('guest_query_id');
  if LValue <> nil then
  begin
    AObj.GuestQueryId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('business_connection_id');
  if LValue <> nil then
  begin
    AObj.BusinessConnectionId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('guest_bot_caller_user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.GuestBotCallerUser = nil then AObj.GuestBotCallerUser := TftUser.Create;
      FillTftUser(LValue, AObj.GuestBotCallerUser);
    end;
  end;
  LValue := AJSON.GetValue('guest_bot_caller_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.GuestBotCallerChat = nil then AObj.GuestBotCallerChat := TftChat.Create;
      FillTftChat(LValue, AObj.GuestBotCallerChat);
    end;
  end;
  LValue := AJSON.GetValue('is_from_offline');
  if LValue <> nil then
  begin
    AObj.IsFromOffline := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_paid_post');
  if LValue <> nil then
  begin
    AObj.IsPaidPost := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('paid_star_count');
  if LValue <> nil then
  begin
    AObj.PaidStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('link_preview_options');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.LinkPreviewOptions = nil then AObj.LinkPreviewOptions := TftLinkPreviewOptions.Create;
      FillTftLinkPreviewOptions(LValue, AObj.LinkPreviewOptions);
    end;
  end;
  LValue := AJSON.GetValue('show_caption_above_media');
  if LValue <> nil then
  begin
    AObj.ShowCaptionAboveMedia := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('reply_to_checklist_task_id');
  if LValue <> nil then
  begin
    AObj.ReplyToChecklistTaskId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('reply_to_poll_option_id');
  if LValue <> nil then
  begin
    AObj.ReplyToPollOptionId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('effect_id');
  if LValue <> nil then
  begin
    AObj.EffectId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('paid_media');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PaidMedia = nil then AObj.PaidMedia := TftPaidMediaInfo.Create;
      FillTftPaidMediaInfo(LValue, AObj.PaidMedia);
    end;
  end;
  LValue := AJSON.GetValue('live_photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.LivePhoto = nil then AObj.LivePhoto := TftLivePhoto.Create;
      FillTftLivePhoto(LValue, AObj.LivePhoto);
    end;
  end;
  LValue := AJSON.GetValue('checklist');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Checklist = nil then AObj.Checklist := TftChecklist.Create;
      FillTftChecklist(LValue, AObj.Checklist);
    end;
  end;
  LValue := AJSON.GetValue('rich_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.RichMessage = nil then AObj.RichMessage := TftRichMessage.Create;
      FillTftRichMessage(LValue, AObj.RichMessage);
    end;
  end;
  LValue := AJSON.GetValue('story');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Story = nil then AObj.Story := TftStory.Create;
      FillTftStory(LValue, AObj.Story);
    end;
  end;
  LValue := AJSON.GetValue('gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Gift = nil then AObj.Gift := TftGiftInfo.Create;
      FillTftGiftInfo(LValue, AObj.Gift);
    end;
  end;
  LValue := AJSON.GetValue('unique_gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.UniqueGift = nil then AObj.UniqueGift := TftUniqueGiftInfo.Create;
      FillTftUniqueGiftInfo(LValue, AObj.UniqueGift);
    end;
  end;
  LValue := AJSON.GetValue('gift_upgrade_sent');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.GiftUpgradeSent = nil then AObj.GiftUpgradeSent := TftGiftInfo.Create;
      FillTftGiftInfo(LValue, AObj.GiftUpgradeSent);
    end;
  end;
  LValue := AJSON.GetValue('refunded_payment');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.RefundedPayment = nil then AObj.RefundedPayment := TftRefundedPayment.Create;
      FillTftRefundedPayment(LValue, AObj.RefundedPayment);
    end;
  end;
  LValue := AJSON.GetValue('boost_added');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.BoostAdded = nil then AObj.BoostAdded := TftChatBoostAdded.Create;
      FillTftChatBoostAdded(LValue, AObj.BoostAdded);
    end;
  end;
  LValue := AJSON.GetValue('checklist_tasks_done');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChecklistTasksDone = nil then AObj.ChecklistTasksDone := TftChecklistTasksDone.Create;
      FillTftChecklistTasksDone(LValue, AObj.ChecklistTasksDone);
    end;
  end;
  LValue := AJSON.GetValue('checklist_tasks_added');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChecklistTasksAdded = nil then AObj.ChecklistTasksAdded := TftChecklistTasksAdded.Create;
      FillTftChecklistTasksAdded(LValue, AObj.ChecklistTasksAdded);
    end;
  end;
  LValue := AJSON.GetValue('direct_message_price_changed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.DirectMessagePriceChanged = nil then AObj.DirectMessagePriceChanged := TftDirectMessagePriceChanged.Create;
      FillTftDirectMessagePriceChanged(LValue, AObj.DirectMessagePriceChanged);
    end;
  end;
  LValue := AJSON.GetValue('paid_message_price_changed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PaidMessagePriceChanged = nil then AObj.PaidMessagePriceChanged := TftPaidMessagePriceChanged.Create;
      FillTftPaidMessagePriceChanged(LValue, AObj.PaidMessagePriceChanged);
    end;
  end;
  LValue := AJSON.GetValue('poll_option_added');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PollOptionAdded = nil then AObj.PollOptionAdded := TftPollOptionAdded.Create;
      FillTftPollOptionAdded(LValue, AObj.PollOptionAdded);
    end;
  end;
  LValue := AJSON.GetValue('poll_option_deleted');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PollOptionDeleted = nil then AObj.PollOptionDeleted := TftPollOptionDeleted.Create;
      FillTftPollOptionDeleted(LValue, AObj.PollOptionDeleted);
    end;
  end;
  LValue := AJSON.GetValue('suggested_post_info');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostInfo = nil then AObj.SuggestedPostInfo := TftSuggestedPostInfo.Create;
      FillTftSuggestedPostInfo(LValue, AObj.SuggestedPostInfo);
    end;
  end;
  LValue := AJSON.GetValue('suggested_post_approved');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostApproved = nil then AObj.SuggestedPostApproved := TftSuggestedPostApproved.Create;
      FillTftSuggestedPostApproved(LValue, AObj.SuggestedPostApproved);
    end;
  end;
  LValue := AJSON.GetValue('suggested_post_approval_failed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostApprovalFailed = nil then AObj.SuggestedPostApprovalFailed := TftSuggestedPostApprovalFailed.Create;
      FillTftSuggestedPostApprovalFailed(LValue, AObj.SuggestedPostApprovalFailed);
    end;
  end;
  LValue := AJSON.GetValue('suggested_post_declined');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostDeclined = nil then AObj.SuggestedPostDeclined := TftSuggestedPostDeclined.Create;
      FillTftSuggestedPostDeclined(LValue, AObj.SuggestedPostDeclined);
    end;
  end;
  LValue := AJSON.GetValue('suggested_post_paid');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostPaid = nil then AObj.SuggestedPostPaid := TftSuggestedPostPaid.Create;
      FillTftSuggestedPostPaid(LValue, AObj.SuggestedPostPaid);
    end;
  end;
  LValue := AJSON.GetValue('suggested_post_refunded');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostRefunded = nil then AObj.SuggestedPostRefunded := TftSuggestedPostRefunded.Create;
      FillTftSuggestedPostRefunded(LValue, AObj.SuggestedPostRefunded);
    end;
  end;
  LValue := AJSON.GetValue('chat_owner_left');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChatOwnerLeft = nil then AObj.ChatOwnerLeft := TftChatOwnerLeft.Create;
      FillTftChatOwnerLeft(LValue, AObj.ChatOwnerLeft);
    end;
  end;
  LValue := AJSON.GetValue('chat_owner_changed');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChatOwnerChanged = nil then AObj.ChatOwnerChanged := TftChatOwnerChanged.Create;
      FillTftChatOwnerChanged(LValue, AObj.ChatOwnerChanged);
    end;
  end;
end;

function TftMessageFromJson(const AJSON: TJSONData): TftMessage;
begin
  Result := TftMessage.Create;
  FillTftMessage(AJSON, Result);
end;

procedure FillTftMessageAutoDeleteTimerChanged(const AJSON: TJSONData; const AObj: TftMessageAutoDeleteTimerChanged);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('message_auto_delete_time');
  if LValue <> nil then
  begin
    AObj.MessageAutoDeleteTime := LValue.AsString;
  end;
end;

function TftMessageAutoDeleteTimerChangedFromJson(const AJSON: TJSONData): TftMessageAutoDeleteTimerChanged;
begin
  Result := TftMessageAutoDeleteTimerChanged.Create;
  FillTftMessageAutoDeleteTimerChanged(AJSON, Result);
end;

procedure FillTftMessageEntity(const AJSON: TJSONData; const AObj: TftMessageEntity);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeMessageEntity := TftMessageEntityType(GetEnumValue(TypeInfo(TftMessageEntityType), LValue.AsString));
  end;
  LValue := AJSON.GetValue('offset');
  if LValue <> nil then
  begin
    AObj.Offset := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('length');
  if LValue <> nil then
  begin
    AObj.Length := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.Url := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('language');
  if LValue <> nil then
  begin
    AObj.Language := LValue.AsString;
  end;
  LValue := AJSON.GetValue('custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.CustomEmojiId := LValue.AsString;
  end;
end;

function TftMessageEntityFromJson(const AJSON: TJSONData): TftMessageEntity;
begin
  Result := TftMessageEntity.Create;
  FillTftMessageEntity(AJSON, Result);
end;

procedure FillTftMessageGenerationStopped(const AJSON: TJSONData; const AObj: TftMessageGenerationStopped);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('message_thread_id');
  if LValue <> nil then
  begin
    AObj.MessageThreadId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('draft_id');
  if LValue <> nil then
  begin
    AObj.DraftId := LValue.AsInt64;
  end;
end;

function TftMessageGenerationStoppedFromJson(const AJSON: TJSONData): TftMessageGenerationStopped;
begin
  Result := TftMessageGenerationStopped.Create;
  FillTftMessageGenerationStopped(AJSON, Result);
end;

procedure FillTftMessageId(const AJSON: TJSONData; const AObj: TftMessageId);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('message_id');
  if LValue <> nil then
  begin
    AObj.messageId := LValue.AsInt64;
  end;
end;

function TftMessageIdFromJson(const AJSON: TJSONData): TftMessageId;
begin
  Result := TftMessageId.Create;
  FillTftMessageId(AJSON, Result);
end;

procedure FillTftMessageReactionCountUpdated(const AJSON: TJSONData; const AObj: TftMessageReactionCountUpdated);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Reactions: TArray<TftReactionCount>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('message_id');
  if LValue <> nil then
  begin
    AObj.MessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('reactions');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Reactions := AObj.Reactions;
      SetLength(LArr_Reactions, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Reactions[LI] := TftReactionCountFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Reactions := LArr_Reactions;
    end;
  end;
end;

function TftMessageReactionCountUpdatedFromJson(const AJSON: TJSONData): TftMessageReactionCountUpdated;
begin
  Result := TftMessageReactionCountUpdated.Create;
  FillTftMessageReactionCountUpdated(AJSON, Result);
end;

procedure FillTftMessageReactionUpdated(const AJSON: TJSONData; const AObj: TftMessageReactionUpdated);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_OldReaction: TArray<TftReactionType>;
  LArr_NewReaction: TArray<TftReactionType>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('message_id');
  if LValue <> nil then
  begin
    AObj.MessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('actor_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ActorChat = nil then AObj.ActorChat := TftChat.Create;
      FillTftChat(LValue, AObj.ActorChat);
    end;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('old_reaction');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_OldReaction := AObj.OldReaction;
      SetLength(LArr_OldReaction, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_OldReaction[LI] := TftReactionTypeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.OldReaction := LArr_OldReaction;
    end;
  end;
  LValue := AJSON.GetValue('new_reaction');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_NewReaction := AObj.NewReaction;
      SetLength(LArr_NewReaction, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_NewReaction[LI] := TftReactionTypeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.NewReaction := LArr_NewReaction;
    end;
  end;
end;

function TftMessageReactionUpdatedFromJson(const AJSON: TJSONData): TftMessageReactionUpdated;
begin
  Result := TftMessageReactionUpdated.Create;
  FillTftMessageReactionUpdated(AJSON, Result);
end;

procedure FillTftOrderInfo(const AJSON: TJSONData; const AObj: TftOrderInfo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('phone_number');
  if LValue <> nil then
  begin
    AObj.PhoneNumber := LValue.AsString;
  end;
  LValue := AJSON.GetValue('email');
  if LValue <> nil then
  begin
    AObj.Email := LValue.AsString;
  end;
  LValue := AJSON.GetValue('shipping_addre_ss');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ShippingAddreSS = nil then AObj.ShippingAddreSS := TftShippingAddress.Create;
      FillTftShippingAddress(LValue, AObj.ShippingAddreSS);
    end;
  end;
end;

function TftOrderInfoFromJson(const AJSON: TJSONData): TftOrderInfo;
begin
  Result := TftOrderInfo.Create;
  FillTftOrderInfo(AJSON, Result);
end;

procedure FillTftOwnedGift(const AJSON: TJSONData; const AObj: TftOwnedGift);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Gift = nil then AObj.Gift := TftGift.Create;
      FillTftGift(LValue, AObj.Gift);
    end;
  end;
  LValue := AJSON.GetValue('unique_gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.UniqueGift = nil then AObj.UniqueGift := TftUniqueGift.Create;
      FillTftUniqueGift(LValue, AObj.UniqueGift);
    end;
  end;
  LValue := AJSON.GetValue('owned_gift_id');
  if LValue <> nil then
  begin
    AObj.OwnedGiftId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('sender_user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SenderUser = nil then AObj.SenderUser := TftUser.Create;
      FillTftUser(LValue, AObj.SenderUser);
    end;
  end;
  LValue := AJSON.GetValue('send_date');
  if LValue <> nil then
  begin
    AObj.SendDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('is_private');
  if LValue <> nil then
  begin
    AObj.IsPrivate := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_saved');
  if LValue <> nil then
  begin
    AObj.IsSaved := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_be_upgraded');
  if LValue <> nil then
  begin
    AObj.CanBeUpgraded := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('was_refunded');
  if LValue <> nil then
  begin
    AObj.WasRefunded := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('convert_star_count');
  if LValue <> nil then
  begin
    AObj.ConvertStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('prepaid_upgrade_star_count');
  if LValue <> nil then
  begin
    AObj.PrepaidUpgradeStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_upgrade_separate');
  if LValue <> nil then
  begin
    AObj.IsUpgradeSeparate := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('unique_gift_number');
  if LValue <> nil then
  begin
    AObj.UniqueGiftNumber := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('can_be_transferred');
  if LValue <> nil then
  begin
    AObj.CanBeTransferred := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('transfer_star_count');
  if LValue <> nil then
  begin
    AObj.TransferStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('next_transfer_date');
  if LValue <> nil then
  begin
    AObj.NextTransferDate := LValue.AsInt64;
  end;
end;

function TftOwnedGiftFromJson(const AJSON: TJSONData): TftOwnedGift;
begin
  Result := TftOwnedGift.Create;
  FillTftOwnedGift(AJSON, Result);
end;

procedure FillTftOwnedGifts(const AJSON: TJSONData; const AObj: TftOwnedGifts);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Gifts: TArray<TftOwnedGift>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('total_count');
  if LValue <> nil then
  begin
    AObj.TotalCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('gifts');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Gifts := AObj.Gifts;
      SetLength(LArr_Gifts, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Gifts[LI] := TftOwnedGiftFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Gifts := LArr_Gifts;
    end;
  end;
  LValue := AJSON.GetValue('next_offset');
  if LValue <> nil then
  begin
    AObj.NextOffset := LValue.AsString;
  end;
end;

function TftOwnedGiftsFromJson(const AJSON: TJSONData): TftOwnedGifts;
begin
  Result := TftOwnedGifts.Create;
  FillTftOwnedGifts(AJSON, Result);
end;

procedure FillTftPaidMedia(const AJSON: TJSONData; const AObj: TftPaidMedia);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
end;

function TftPaidMediaFromJson(const AJSON: TJSONData): TftPaidMedia;
begin
  Result := TftPaidMedia.Create;
  FillTftPaidMedia(AJSON, Result);
end;

procedure FillTftPaidMediaInfo(const AJSON: TJSONData; const AObj: TftPaidMediaInfo);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_PaidMedia: TArray<TftPaidMedia>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('star_count');
  if LValue <> nil then
  begin
    AObj.StarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('paid_media');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_PaidMedia := AObj.PaidMedia;
      SetLength(LArr_PaidMedia, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_PaidMedia[LI] := TftPaidMediaFromJson(TJSONArray(LValue).Items[LI]);
      AObj.PaidMedia := LArr_PaidMedia;
    end;
  end;
end;

function TftPaidMediaInfoFromJson(const AJSON: TJSONData): TftPaidMediaInfo;
begin
  Result := TftPaidMediaInfo.Create;
  FillTftPaidMediaInfo(AJSON, Result);
end;

procedure FillTftPaidMediaLivePhoto(const AJSON: TJSONData; const AObj: TftPaidMediaLivePhoto);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPaidMedia(AJSON, TftPaidMedia(AObj));
  LValue := AJSON.GetValue('live_photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.LivePhoto = nil then AObj.LivePhoto := TftLivePhoto.Create;
      FillTftLivePhoto(LValue, AObj.LivePhoto);
    end;
  end;
end;

function TftPaidMediaLivePhotoFromJson(const AJSON: TJSONData): TftPaidMediaLivePhoto;
begin
  Result := TftPaidMediaLivePhoto.Create;
  FillTftPaidMediaLivePhoto(AJSON, Result);
end;

procedure FillTftPaidMediaPhoto(const AJSON: TJSONData; const AObj: TftPaidMediaPhoto);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Photo: TftPhotoSizeList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPaidMedia(AJSON, TftPaidMedia(AObj));
  LValue := AJSON.GetValue('photo');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Photo := AObj.Photo;
      SetLength(LArr_Photo, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Photo[LI] := TftPhotoSizeFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Photo := LArr_Photo;
    end;
  end;
end;

function TftPaidMediaPhotoFromJson(const AJSON: TJSONData): TftPaidMediaPhoto;
begin
  Result := TftPaidMediaPhoto.Create;
  FillTftPaidMediaPhoto(AJSON, Result);
end;

procedure FillTftPaidMediaPurchased(const AJSON: TJSONData; const AObj: TftPaidMediaPurchased);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('paid_media_payload');
  if LValue <> nil then
  begin
    AObj.PaidMediaPayload := LValue.AsString;
  end;
end;

function TftPaidMediaPurchasedFromJson(const AJSON: TJSONData): TftPaidMediaPurchased;
begin
  Result := TftPaidMediaPurchased.Create;
  FillTftPaidMediaPurchased(AJSON, Result);
end;

procedure FillTftPaidMediaVideo(const AJSON: TJSONData; const AObj: TftPaidMediaVideo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPaidMedia(AJSON, TftPaidMedia(AObj));
  LValue := AJSON.GetValue('video');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Video = nil then AObj.Video := TftVideo.Create;
      FillTftVideo(LValue, AObj.Video);
    end;
  end;
end;

function TftPaidMediaVideoFromJson(const AJSON: TJSONData): TftPaidMediaVideo;
begin
  Result := TftPaidMediaVideo.Create;
  FillTftPaidMediaVideo(AJSON, Result);
end;

procedure FillTftPaidMessagePriceChanged(const AJSON: TJSONData; const AObj: TftPaidMessagePriceChanged);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('paid_message_star_count');
  if LValue <> nil then
  begin
    AObj.PaidMessageStarCount := LValue.AsInt64;
  end;
end;

function TftPaidMessagePriceChangedFromJson(const AJSON: TJSONData): TftPaidMessagePriceChanged;
begin
  Result := TftPaidMessagePriceChanged.Create;
  FillTftPaidMessagePriceChanged(AJSON, Result);
end;

procedure FillTftPassportData(const AJSON: TJSONData; const AObj: TftPassportData);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Data = nil then AObj.Data := TList<TftEncryptedPassportElement>.Create;
      AObj.Data.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Data.Add(TftEncryptedPassportElementFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('credentials');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Credentials = nil then AObj.Credentials := TftEncryptedCredentials.Create;
      FillTftEncryptedCredentials(LValue, AObj.Credentials);
    end;
  end;
end;

function TftPassportDataFromJson(const AJSON: TJSONData): TftPassportData;
begin
  Result := TftPassportData.Create;
  FillTftPassportData(AJSON, Result);
end;

procedure FillTftPassportElementError(const AJSON: TJSONData; const AObj: TftPassportElementError);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('source');
  if LValue <> nil then
  begin
    AObj.Source := LValue.AsString;
  end;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := LValue.AsString;
  end;
  LValue := AJSON.GetValue('message');
  if LValue <> nil then
  begin
    AObj.Message := LValue.AsString;
  end;
end;

function TftPassportElementErrorFromJson(const AJSON: TJSONData): TftPassportElementError;
begin
  Result := TftPassportElementError.Create;
  FillTftPassportElementError(AJSON, Result);
end;

procedure FillTftPassportElementErrorDataField(const AJSON: TJSONData; const AObj: TftPassportElementErrorDataField);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('field_name');
  if LValue <> nil then
  begin
    AObj.FieldName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('data_hash');
  if LValue <> nil then
  begin
    AObj.DataHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorDataFieldFromJson(const AJSON: TJSONData): TftPassportElementErrorDataField;
begin
  Result := TftPassportElementErrorDataField.Create;
  FillTftPassportElementErrorDataField(AJSON, Result);
end;

procedure FillTftPassportElementErrorFile(const AJSON: TJSONData; const AObj: TftPassportElementErrorFile);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hash');
  if LValue <> nil then
  begin
    AObj.FileHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorFileFromJson(const AJSON: TJSONData): TftPassportElementErrorFile;
begin
  Result := TftPassportElementErrorFile.Create;
  FillTftPassportElementErrorFile(AJSON, Result);
end;

procedure FillTftPassportElementErrorFiles(const AJSON: TJSONData; const AObj: TftPassportElementErrorFiles);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hashes');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.FileHashes = nil then AObj.FileHashes := TList<String>.Create;
      AObj.FileHashes.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.FileHashes.Add(TJSONArray(LValue).Items[LI].AsString);
    end;
  end;
end;

function TftPassportElementErrorFilesFromJson(const AJSON: TJSONData): TftPassportElementErrorFiles;
begin
  Result := TftPassportElementErrorFiles.Create;
  FillTftPassportElementErrorFiles(AJSON, Result);
end;

procedure FillTftPassportElementErrorFrontSide(const AJSON: TJSONData; const AObj: TftPassportElementErrorFrontSide);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hash');
  if LValue <> nil then
  begin
    AObj.FileHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorFrontSideFromJson(const AJSON: TJSONData): TftPassportElementErrorFrontSide;
begin
  Result := TftPassportElementErrorFrontSide.Create;
  FillTftPassportElementErrorFrontSide(AJSON, Result);
end;

procedure FillTftPassportElementErrorReverseSide(const AJSON: TJSONData; const AObj: TftPassportElementErrorReverseSide);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hash');
  if LValue <> nil then
  begin
    AObj.FileHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorReverseSideFromJson(const AJSON: TJSONData): TftPassportElementErrorReverseSide;
begin
  Result := TftPassportElementErrorReverseSide.Create;
  FillTftPassportElementErrorReverseSide(AJSON, Result);
end;

procedure FillTftPassportElementErrorSelfie(const AJSON: TJSONData; const AObj: TftPassportElementErrorSelfie);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hash');
  if LValue <> nil then
  begin
    AObj.FileHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorSelfieFromJson(const AJSON: TJSONData): TftPassportElementErrorSelfie;
begin
  Result := TftPassportElementErrorSelfie.Create;
  FillTftPassportElementErrorSelfie(AJSON, Result);
end;

procedure FillTftPassportElementErrorTranslationFile(const AJSON: TJSONData; const AObj: TftPassportElementErrorTranslationFile);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hash');
  if LValue <> nil then
  begin
    AObj.FileHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorTranslationFileFromJson(const AJSON: TJSONData): TftPassportElementErrorTranslationFile;
begin
  Result := TftPassportElementErrorTranslationFile.Create;
  FillTftPassportElementErrorTranslationFile(AJSON, Result);
end;

procedure FillTftPassportElementErrorTranslationFiles(const AJSON: TJSONData; const AObj: TftPassportElementErrorTranslationFiles);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('file_hashes');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.FileHashes = nil then AObj.FileHashes := TList<String>.Create;
      AObj.FileHashes.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.FileHashes.Add(TJSONArray(LValue).Items[LI].AsString);
    end;
  end;
end;

function TftPassportElementErrorTranslationFilesFromJson(const AJSON: TJSONData): TftPassportElementErrorTranslationFiles;
begin
  Result := TftPassportElementErrorTranslationFiles.Create;
  FillTftPassportElementErrorTranslationFiles(AJSON, Result);
end;

procedure FillTftPassportElementErrorUnspecified(const AJSON: TJSONData; const AObj: TftPassportElementErrorUnspecified);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftPassportElementError(AJSON, TftPassportElementError(AObj));
  LValue := AJSON.GetValue('element_hash');
  if LValue <> nil then
  begin
    AObj.ElementHash := LValue.AsString;
  end;
end;

function TftPassportElementErrorUnspecifiedFromJson(const AJSON: TJSONData): TftPassportElementErrorUnspecified;
begin
  Result := TftPassportElementErrorUnspecified.Create;
  FillTftPassportElementErrorUnspecified(AJSON, Result);
end;

procedure FillTftPassportFile(const AJSON: TJSONData; const AObj: TftPassportFile);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('file_id');
  if LValue <> nil then
  begin
    AObj.FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_unique_id');
  if LValue <> nil then
  begin
    AObj.FileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_size');
  if LValue <> nil then
  begin
    AObj.FileSize := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('file_date');
  if LValue <> nil then
  begin
    AObj.FileDate := LValue.AsInt64;
  end;
end;

function TftPassportFileFromJson(const AJSON: TJSONData): TftPassportFile;
begin
  Result := TftPassportFile.Create;
  FillTftPassportFile(AJSON, Result);
end;

procedure FillTftPhotoSize(const AJSON: TJSONData; const AObj: TftPhotoSize);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('file_id');
  if LValue <> nil then
  begin
    AObj.FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_unique_id');
  if LValue <> nil then
  begin
    AObj.FileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('file_size');
  if LValue <> nil then
  begin
    AObj.FileSize := LValue.AsInt64;
  end;
end;

function TftPhotoSizeFromJson(const AJSON: TJSONData): TftPhotoSize;
begin
  Result := TftPhotoSize.Create;
  FillTftPhotoSize(AJSON, Result);
end;

procedure FillTftPoll(const AJSON: TJSONData; const AObj: TftPoll);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_ExplanationEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('question');
  if LValue <> nil then
  begin
    AObj.Question := LValue.AsString;
  end;
  // skipped unsupported property TftPoll.Options: TftPollOptionList
  LValue := AJSON.GetValue('total_voter_count');
  if LValue <> nil then
  begin
    AObj.TotalVoterCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_closed');
  if LValue <> nil then
  begin
    AObj.IsClosed := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_anonymous');
  if LValue <> nil then
  begin
    AObj.IsAnonymous := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypePoll := LValue.AsString;
  end;
  LValue := AJSON.GetValue('allows_multiple_answers');
  if LValue <> nil then
  begin
    AObj.AllowsMultipleAnswers := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('correct_option_id');
  if LValue <> nil then
  begin
    AObj.CorrectOptionId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('explanation');
  if LValue <> nil then
  begin
    AObj.Explanation := LValue.AsString;
  end;
  LValue := AJSON.GetValue('explanation_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_ExplanationEntities := AObj.ExplanationEntities;
      SetLength(LArr_ExplanationEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_ExplanationEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.ExplanationEntities := LArr_ExplanationEntities;
    end;
  end;
  LValue := AJSON.GetValue('open_period');
  if LValue <> nil then
  begin
    AObj.OpenPeriod := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('close_date');
  if LValue <> nil then
  begin
    AObj.CloseDate := LValue.AsInt64;
  end;
end;

function TftPollFromJson(const AJSON: TJSONData): TftPoll;
begin
  Result := TftPoll.Create;
  FillTftPoll(AJSON, Result);
end;

procedure FillTftPollAnswer(const AJSON: TJSONData; const AObj: TftPollAnswer);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('poll_id');
  if LValue <> nil then
  begin
    AObj.PollId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('option_ids');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.OptionIds = nil then AObj.OptionIds := TList<Integer>.Create;
      AObj.OptionIds.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.OptionIds.Add(TJSONArray(LValue).Items[LI].AsInt64);
    end;
  end;
end;

function TftPollAnswerFromJson(const AJSON: TJSONData): TftPollAnswer;
begin
  Result := TftPollAnswer.Create;
  FillTftPollAnswer(AJSON, Result);
end;

procedure FillTftPollOption(const AJSON: TJSONData; const AObj: TftPollOption);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('voter_count');
  if LValue <> nil then
  begin
    AObj.VoterCount := LValue.AsInt64;
  end;
end;

function TftPollOptionFromJson(const AJSON: TJSONData): TftPollOption;
begin
  Result := TftPollOption.Create;
  FillTftPollOption(AJSON, Result);
end;

procedure FillTftPollOptionAdded(const AJSON: TJSONData; const AObj: TftPollOptionAdded);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_OptionTextEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('poll_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PollMessage = nil then AObj.PollMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.PollMessage);
    end;
  end;
  LValue := AJSON.GetValue('option_persistent_id');
  if LValue <> nil then
  begin
    AObj.OptionPersistentId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('option_text');
  if LValue <> nil then
  begin
    AObj.OptionText := LValue.AsString;
  end;
  LValue := AJSON.GetValue('option_text_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_OptionTextEntities := AObj.OptionTextEntities;
      SetLength(LArr_OptionTextEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_OptionTextEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.OptionTextEntities := LArr_OptionTextEntities;
    end;
  end;
end;

function TftPollOptionAddedFromJson(const AJSON: TJSONData): TftPollOptionAdded;
begin
  Result := TftPollOptionAdded.Create;
  FillTftPollOptionAdded(AJSON, Result);
end;

procedure FillTftPollOptionDeleted(const AJSON: TJSONData; const AObj: TftPollOptionDeleted);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_OptionTextEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('poll_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PollMessage = nil then AObj.PollMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.PollMessage);
    end;
  end;
  LValue := AJSON.GetValue('option_persistent_id');
  if LValue <> nil then
  begin
    AObj.OptionPersistentId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('option_text');
  if LValue <> nil then
  begin
    AObj.OptionText := LValue.AsString;
  end;
  LValue := AJSON.GetValue('option_text_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_OptionTextEntities := AObj.OptionTextEntities;
      SetLength(LArr_OptionTextEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_OptionTextEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.OptionTextEntities := LArr_OptionTextEntities;
    end;
  end;
end;

function TftPollOptionDeletedFromJson(const AJSON: TJSONData): TftPollOptionDeleted;
begin
  Result := TftPollOptionDeleted.Create;
  FillTftPollOptionDeleted(AJSON, Result);
end;

procedure FillTftPreCheckoutQuery(const AJSON: TJSONData; const AObj: TftPreCheckoutQuery);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('curren_cy');
  if LValue <> nil then
  begin
    AObj.CurrenCy := LValue.AsString;
  end;
  LValue := AJSON.GetValue('total_amount');
  if LValue <> nil then
  begin
    AObj.TotalAmount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('invo_ice_payload');
  if LValue <> nil then
  begin
    AObj.InvoIcePayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('shipping_option_id');
  if LValue <> nil then
  begin
    AObj.ShippingOptionId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('order_info');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.OrderInfo = nil then AObj.OrderInfo := TftOrderInfo.Create;
      FillTftOrderInfo(LValue, AObj.OrderInfo);
    end;
  end;
end;

function TftPreCheckoutQueryFromJson(const AJSON: TJSONData): TftPreCheckoutQuery;
begin
  Result := TftPreCheckoutQuery.Create;
  FillTftPreCheckoutQuery(AJSON, Result);
end;

procedure FillTftPreparedInlineMessage(const AJSON: TJSONData; const AObj: TftPreparedInlineMessage);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('expiration_date');
  if LValue <> nil then
  begin
    AObj.ExpirationDate := LValue.AsInt64;
  end;
end;

function TftPreparedInlineMessageFromJson(const AJSON: TJSONData): TftPreparedInlineMessage;
begin
  Result := TftPreparedInlineMessage.Create;
  FillTftPreparedInlineMessage(AJSON, Result);
end;

procedure FillTftPreparedKeyboardButton(const AJSON: TJSONData; const AObj: TftPreparedKeyboardButton);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
end;

function TftPreparedKeyboardButtonFromJson(const AJSON: TJSONData): TftPreparedKeyboardButton;
begin
  Result := TftPreparedKeyboardButton.Create;
  FillTftPreparedKeyboardButton(AJSON, Result);
end;

procedure FillTftProximityAlertTriggered(const AJSON: TJSONData; const AObj: TftProximityAlertTriggered);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('traveler');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Traveler = nil then AObj.Traveler := TftUser.Create;
      FillTftUser(LValue, AObj.Traveler);
    end;
  end;
  LValue := AJSON.GetValue('watcher');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Watcher = nil then AObj.Watcher := TftUser.Create;
      FillTftUser(LValue, AObj.Watcher);
    end;
  end;
  LValue := AJSON.GetValue('distance');
  if LValue <> nil then
  begin
    AObj.Distance := LValue.AsInt64;
  end;
end;

function TftProximityAlertTriggeredFromJson(const AJSON: TJSONData): TftProximityAlertTriggered;
begin
  Result := TftProximityAlertTriggered.Create;
  FillTftProximityAlertTriggered(AJSON, Result);
end;

procedure FillTftReactionCount(const AJSON: TJSONData; const AObj: TftReactionCount);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Type_S = nil then AObj.Type_S := TftReactionType.Create;
      FillTftReactionType(LValue, AObj.Type_S);
    end;
  end;
  LValue := AJSON.GetValue('total_count');
  if LValue <> nil then
  begin
    AObj.TotalCount := LValue.AsInt64;
  end;
end;

function TftReactionCountFromJson(const AJSON: TJSONData): TftReactionCount;
begin
  Result := TftReactionCount.Create;
  FillTftReactionCount(AJSON, Result);
end;

procedure FillTftReactionType(const AJSON: TJSONData; const AObj: TftReactionType);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('emoji');
  if LValue <> nil then
  begin
    AObj.Emoji := LValue.AsString;
  end;
  LValue := AJSON.GetValue('custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.CustomEmojiId := LValue.AsString;
  end;
end;

function TftReactionTypeFromJson(const AJSON: TJSONData): TftReactionType;
begin
  Result := TftReactionType.Create;
  FillTftReactionType(AJSON, Result);
end;

procedure FillTftRefundedPayment(const AJSON: TJSONData; const AObj: TftRefundedPayment);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('currency');
  if LValue <> nil then
  begin
    AObj.Currency := LValue.AsString;
  end;
  LValue := AJSON.GetValue('total_amount');
  if LValue <> nil then
  begin
    AObj.TotalAmount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('invoice_payload');
  if LValue <> nil then
  begin
    AObj.InvoicePayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('telegram_payment_charge_id');
  if LValue <> nil then
  begin
    AObj.TelegramPaymentChargeId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('provider_payment_charge_id');
  if LValue <> nil then
  begin
    AObj.ProviderPaymentChargeId := LValue.AsString;
  end;
end;

function TftRefundedPaymentFromJson(const AJSON: TJSONData): TftRefundedPayment;
begin
  Result := TftRefundedPayment.Create;
  FillTftRefundedPayment(AJSON, Result);
end;

procedure FillTftReplyBase(const AJSON: TJSONData; const AObj: TftReplyBase);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftReplyBaseFromJson(const AJSON: TJSONData): TftReplyBase;
begin
  Result := TftReplyBase.Create;
  FillTftReplyBase(AJSON, Result);
end;

procedure FillTftReplyKeyboardMarkup(const AJSON: TJSONData; const AObj: TftReplyKeyboardMarkup);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftReplyBase(AJSON, TftReplyBase(AObj));
  // skipped unsupported property TftReplyKeyboardMarkup.Keyboard: TList<TftKeyboardRow>
  LValue := AJSON.GetValue('is_persistent');
  if LValue <> nil then
  begin
    AObj.IsPersistent := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('resize_keyboard');
  if LValue <> nil then
  begin
    AObj.ResizeKeyboard := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('one_time_keyboard');
  if LValue <> nil then
  begin
    AObj.OneTimeKeyboard := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('input_field_placeholder');
  if LValue <> nil then
  begin
    AObj.InputFieldPlaceholder := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('selective');
  if LValue <> nil then
  begin
    AObj.Selective := LValue.AsBoolean;
  end;
end;

function TftReplyKeyboardMarkupFromJson(const AJSON: TJSONData): TftReplyKeyboardMarkup;
begin
  Result := TftReplyKeyboardMarkup.Create;
  FillTftReplyKeyboardMarkup(AJSON, Result);
end;

procedure FillTftReplyKeyboardRemove(const AJSON: TJSONData; const AObj: TftReplyKeyboardRemove);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftReplyBase(AJSON, TftReplyBase(AObj));
  LValue := AJSON.GetValue('remove_keyboard');
  if LValue <> nil then
  begin
    AObj.RemoveKeyboard := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('selective');
  if LValue <> nil then
  begin
    AObj.Selective := LValue.AsBoolean;
  end;
end;

function TftReplyKeyboardRemoveFromJson(const AJSON: TJSONData): TftReplyKeyboardRemove;
begin
  Result := TftReplyKeyboardRemove.Create;
  FillTftReplyKeyboardRemove(AJSON, Result);
end;

procedure FillTftReplyParameters(const AJSON: TJSONData; const AObj: TftReplyParameters);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_QuoteEntities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('message_id');
  if LValue <> nil then
  begin
    AObj.MessageId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('chat_id');
  if LValue <> nil then
  begin
    AObj.ChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('allow_sending_without_reply');
  if LValue <> nil then
  begin
    AObj.AllowSendingWithoutReply := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('quote');
  if LValue <> nil then
  begin
    AObj.Quote := LValue.AsString;
  end;
  LValue := AJSON.GetValue('quote_parse_mode');
  if LValue <> nil then
  begin
    AObj.QuoteParseMode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('quote_entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_QuoteEntities := AObj.QuoteEntities;
      SetLength(LArr_QuoteEntities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_QuoteEntities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.QuoteEntities := LArr_QuoteEntities;
    end;
  end;
  LValue := AJSON.GetValue('quote_position');
  if LValue <> nil then
  begin
    AObj.QuotePosition := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('checklist_task_id');
  if LValue <> nil then
  begin
    AObj.ChecklistTaskId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('poll_option_id');
  if LValue <> nil then
  begin
    AObj.PollOptionId := LValue.AsString;
  end;
end;

function TftReplyParametersFromJson(const AJSON: TJSONData): TftReplyParameters;
begin
  Result := TftReplyParameters.Create;
  FillTftReplyParameters(AJSON, Result);
end;

procedure FillTftResponseParameters(const AJSON: TJSONData; const AObj: TftResponseParameters);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('migrate_to_chat_id');
  if LValue <> nil then
  begin
    AObj.MigrateToChatId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('retry_after');
  if LValue <> nil then
  begin
    AObj.RetryAfter := LValue.AsInt64;
  end;
end;

function TftResponseParametersFromJson(const AJSON: TJSONData): TftResponseParameters;
begin
  Result := TftResponseParameters.Create;
  FillTftResponseParameters(AJSON, Result);
end;

procedure FillTftRichBlockCaption(const AJSON: TJSONData; const AObj: TftRichBlockCaption);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Text = nil then AObj.Text := TftRichText.Create;
      FillTftRichText(LValue, AObj.Text);
    end;
  end;
  LValue := AJSON.GetValue('credit');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Credit = nil then AObj.Credit := TftRichText.Create;
      FillTftRichText(LValue, AObj.Credit);
    end;
  end;
end;

function TftRichBlockCaptionFromJson(const AJSON: TJSONData): TftRichBlockCaption;
begin
  Result := TftRichBlockCaption.Create;
  FillTftRichBlockCaption(AJSON, Result);
end;

procedure FillTftRichBlockTableCell(const AJSON: TJSONData; const AObj: TftRichBlockTableCell);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Text = nil then AObj.Text := TftRichText.Create;
      FillTftRichText(LValue, AObj.Text);
    end;
  end;
  LValue := AJSON.GetValue('is_header');
  if LValue <> nil then
  begin
    AObj.IsHeader := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('colspan');
  if LValue <> nil then
  begin
    AObj.Colspan := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('rowspan');
  if LValue <> nil then
  begin
    AObj.Rowspan := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('align');
  if LValue <> nil then
  begin
    AObj.Align := LValue.AsString;
  end;
  LValue := AJSON.GetValue('valign');
  if LValue <> nil then
  begin
    AObj.Valign := LValue.AsString;
  end;
end;

function TftRichBlockTableCellFromJson(const AJSON: TJSONData): TftRichBlockTableCell;
begin
  Result := TftRichBlockTableCell.Create;
  FillTftRichBlockTableCell(AJSON, Result);
end;

procedure FillTftRichInputMedia(const AJSON: TJSONData; const AObj: TftRichInputMedia);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('media');
  if LValue <> nil then
  begin
    AObj.Media := LValue.AsString;
  end;
  LValue := AJSON.GetValue('media_file');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MediaFile = nil then AObj.MediaFile := TftInputFile.Create;
      FillTftInputFile(LValue, AObj.MediaFile);
    end;
  end;
  LValue := AJSON.GetValue('attach_name');
  if LValue <> nil then
  begin
    AObj.AttachName := LValue.AsString;
  end;
end;

function TftRichInputMediaFromJson(const AJSON: TJSONData): TftRichInputMedia;
begin
  Result := TftRichInputMedia.Create;
  FillTftRichInputMedia(AJSON, Result);
end;

procedure FillTftRichMessage(const AJSON: TJSONData; const AObj: TftRichMessage);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('blocks');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Blocks = nil then AObj.Blocks := TList<TftInputRichBlock>.Create;
      AObj.Blocks.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Blocks.Add(TftInputRichBlockFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('is_rtl');
  if LValue <> nil then
  begin
    AObj.IsRtl := LValue.AsBoolean;
  end;
end;

function TftRichMessageFromJson(const AJSON: TJSONData): TftRichMessage;
begin
  Result := TftRichMessage.Create;
  FillTftRichMessage(AJSON, Result);
end;

procedure FillTftRichMessageButton(const AJSON: TJSONData; const AObj: TftRichMessageButton);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Text = nil then AObj.Text := TftRichText.Create;
      FillTftRichText(LValue, AObj.Text);
    end;
  end;
  LValue := AJSON.GetValue('style');
  if LValue <> nil then
  begin
    AObj.Style := LValue.AsString;
  end;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.URL := LValue.AsString;
  end;
  LValue := AJSON.GetValue('callback_data');
  if LValue <> nil then
  begin
    AObj.CallbackData := LValue.AsString;
  end;
  LValue := AJSON.GetValue('web_app_url');
  if LValue <> nil then
  begin
    AObj.WebAppUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('login_url');
  if LValue <> nil then
  begin
    AObj.LoginUrl := LValue.AsString;
  end;
  LValue := AJSON.GetValue('switch_inline_query');
  if LValue <> nil then
  begin
    AObj.SwitchInlineQuery := LValue.AsString;
  end;
  LValue := AJSON.GetValue('switch_inline_query_current_chat');
  if LValue <> nil then
  begin
    AObj.SwitchInlineQueryCurrentChat := LValue.AsString;
  end;
  LValue := AJSON.GetValue('copy_text');
  if LValue <> nil then
  begin
    AObj.CopyText := LValue.AsString;
  end;
end;

function TftRichMessageButtonFromJson(const AJSON: TJSONData): TftRichMessageButton;
begin
  Result := TftRichMessageButton.Create;
  FillTftRichMessageButton(AJSON, Result);
end;

procedure FillTftRichText(const AJSON: TJSONData; const AObj: TftRichText);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('value');
  if LValue <> nil then
  begin
    AObj.Value := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Text = nil then AObj.Text := TftRichText.Create;
      FillTftRichText(LValue, AObj.Text);
    end;
  end;
  LValue := AJSON.GetValue('children');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Children = nil then AObj.Children := TList<TftRichText>.Create;
      AObj.Children.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Children.Add(TftRichTextFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('button');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Button = nil then AObj.Button := TftRichMessageButton.Create;
      FillTftRichMessageButton(LValue, AObj.Button);
    end;
  end;
  LValue := AJSON.GetValue('unix_time');
  if LValue <> nil then
  begin
    AObj.UnixTime := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('date_time_format');
  if LValue <> nil then
  begin
    AObj.DateTimeFormat := LValue.AsString;
  end;
  LValue := AJSON.GetValue('custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.CustomEmojiId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('alternative_text');
  if LValue <> nil then
  begin
    AObj.AlternativeText := LValue.AsString;
  end;
  LValue := AJSON.GetValue('anchor_name');
  if LValue <> nil then
  begin
    AObj.AnchorName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('reference_name');
  if LValue <> nil then
  begin
    AObj.ReferenceName := LValue.AsString;
  end;
end;

function TftRichTextFromJson(const AJSON: TJSONData): TftRichText;
begin
  Result := TftRichText.Create;
  FillTftRichText(AJSON, Result);
end;

procedure FillTftSentGuestMessage(const AJSON: TJSONData; const AObj: TftSentGuestMessage);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('inline_message_id');
  if LValue <> nil then
  begin
    AObj.InlineMessageId := LValue.AsString;
  end;
end;

function TftSentGuestMessageFromJson(const AJSON: TJSONData): TftSentGuestMessage;
begin
  Result := TftSentGuestMessage.Create;
  FillTftSentGuestMessage(AJSON, Result);
end;

procedure FillTftSentWebAppMessage(const AJSON: TJSONData; const AObj: TftSentWebAppMessage);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('inline_message_id');
  if LValue <> nil then
  begin
    AObj.InlineMessageId := LValue.AsString;
  end;
end;

function TftSentWebAppMessageFromJson(const AJSON: TJSONData): TftSentWebAppMessage;
begin
  Result := TftSentWebAppMessage.Create;
  FillTftSentWebAppMessage(AJSON, Result);
end;

procedure FillTftShippingAddress(const AJSON: TJSONData; const AObj: TftShippingAddress);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('country_code');
  if LValue <> nil then
  begin
    AObj.CountryCode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('state');
  if LValue <> nil then
  begin
    AObj.State := LValue.AsString;
  end;
  LValue := AJSON.GetValue('city');
  if LValue <> nil then
  begin
    AObj.City := LValue.AsString;
  end;
  LValue := AJSON.GetValue('street_line1');
  if LValue <> nil then
  begin
    AObj.StreetLine1 := LValue.AsString;
  end;
  LValue := AJSON.GetValue('street_line2');
  if LValue <> nil then
  begin
    AObj.StreetLine2 := LValue.AsString;
  end;
  LValue := AJSON.GetValue('post_code');
  if LValue <> nil then
  begin
    AObj.PostCode := LValue.AsString;
  end;
end;

function TftShippingAddressFromJson(const AJSON: TJSONData): TftShippingAddress;
begin
  Result := TftShippingAddress.Create;
  FillTftShippingAddress(AJSON, Result);
end;

procedure FillTftShippingOption(const AJSON: TJSONData; const AObj: TftShippingOption);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Prices: TArray<TftLabeledPrice>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('prices');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Prices := AObj.Prices;
      SetLength(LArr_Prices, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Prices[LI] := TftLabeledPriceFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Prices := LArr_Prices;
    end;
  end;
end;

function TftShippingOptionFromJson(const AJSON: TJSONData): TftShippingOption;
begin
  Result := TftShippingOption.Create;
  FillTftShippingOption(AJSON, Result);
end;

procedure FillTftShippingQuery(const AJSON: TJSONData; const AObj: TftShippingQuery);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('from');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.From = nil then AObj.From := TftUser.Create;
      FillTftUser(LValue, AObj.From);
    end;
  end;
  LValue := AJSON.GetValue('invo_ice_payload');
  if LValue <> nil then
  begin
    AObj.InvoIcePayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('shipping_addre_ss');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ShippingAddreSS = nil then AObj.ShippingAddreSS := TftShippingAddress.Create;
      FillTftShippingAddress(LValue, AObj.ShippingAddreSS);
    end;
  end;
end;

function TftShippingQueryFromJson(const AJSON: TJSONData): TftShippingQuery;
begin
  Result := TftShippingQuery.Create;
  FillTftShippingQuery(AJSON, Result);
end;

procedure FillTftStarAmount(const AJSON: TJSONData; const AObj: TftStarAmount);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('amount');
  if LValue <> nil then
  begin
    AObj.Amount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('nanostar_amount');
  if LValue <> nil then
  begin
    AObj.NanostarAmount := LValue.AsInt64;
  end;
end;

function TftStarAmountFromJson(const AJSON: TJSONData): TftStarAmount;
begin
  Result := TftStarAmount.Create;
  FillTftStarAmount(AJSON, Result);
end;

procedure FillTftStarTransaction(const AJSON: TJSONData; const AObj: TftStarTransaction);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsString;
  end;
  LValue := AJSON.GetValue('amount');
  if LValue <> nil then
  begin
    AObj.Amount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('nanostar_amount');
  if LValue <> nil then
  begin
    AObj.NanostarAmount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('date');
  if LValue <> nil then
  begin
    AObj.Date := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('source');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Source = nil then AObj.Source := TftTransactionPartner.Create;
      FillTftTransactionPartner(LValue, AObj.Source);
    end;
  end;
  LValue := AJSON.GetValue('receiver');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Receiver = nil then AObj.Receiver := TftTransactionPartner.Create;
      FillTftTransactionPartner(LValue, AObj.Receiver);
    end;
  end;
end;

function TftStarTransactionFromJson(const AJSON: TJSONData): TftStarTransaction;
begin
  Result := TftStarTransaction.Create;
  FillTftStarTransaction(AJSON, Result);
end;

procedure FillTftStarTransactions(const AJSON: TJSONData; const AObj: TftStarTransactions);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Transactions: TArray<TftStarTransaction>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('transactions');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Transactions := AObj.Transactions;
      SetLength(LArr_Transactions, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Transactions[LI] := TftStarTransactionFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Transactions := LArr_Transactions;
    end;
  end;
end;

function TftStarTransactionsFromJson(const AJSON: TJSONData): TftStarTransactions;
begin
  Result := TftStarTransactions.Create;
  FillTftStarTransactions(AJSON, Result);
end;

procedure FillTftSticker(const AJSON: TJSONData; const AObj: TftSticker);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := TftStickerType(GetEnumValue(TypeInfo(TftStickerType), LValue.AsString));
  end;
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_animated');
  if LValue <> nil then
  begin
    AObj.IsAnimated := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_video');
  if LValue <> nil then
  begin
    AObj.IsVideo := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('emoji');
  if LValue <> nil then
  begin
    AObj.Emoji := LValue.AsString;
  end;
  LValue := AJSON.GetValue('set_name');
  if LValue <> nil then
  begin
    AObj.SetName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('premium_animation');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PremiumAnimation = nil then AObj.PremiumAnimation := TftFile.Create;
      FillTftFile(LValue, AObj.PremiumAnimation);
    end;
  end;
  LValue := AJSON.GetValue('mask_position');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MaskPosition = nil then AObj.MaskPosition := TftMaskPosition.Create;
      FillTftMaskPosition(LValue, AObj.MaskPosition);
    end;
  end;
  LValue := AJSON.GetValue('custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.CustomEmojiId := LValue.AsString;
  end;
end;

function TftStickerFromJson(const AJSON: TJSONData): TftSticker;
begin
  Result := TftSticker.Create;
  FillTftSticker(AJSON, Result);
end;

procedure FillTftStickerSet(const AJSON: TJSONData; const AObj: TftStickerSet);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.TypeS := TftStickerSetType(GetEnumValue(TypeInfo(TftStickerSetType), LValue.AsString));
  end;
  LValue := AJSON.GetValue('is_animated');
  if LValue <> nil then
  begin
    AObj.IsAnimated := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_video');
  if LValue <> nil then
  begin
    AObj.IsVideo := LValue.AsBoolean;
  end;
  // skipped unsupported property TftStickerSet.Stickers: TftStickerList
end;

function TftStickerSetFromJson(const AJSON: TJSONData): TftStickerSet;
begin
  Result := TftStickerSet.Create;
  FillTftStickerSet(AJSON, Result);
end;

procedure FillTftStory(const AJSON: TJSONData; const AObj: TftStory);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsInt64;
  end;
end;

function TftStoryFromJson(const AJSON: TJSONData): TftStory;
begin
  Result := TftStory.Create;
  FillTftStory(AJSON, Result);
end;

procedure FillTftSuccessfulPayment(const AJSON: TJSONData; const AObj: TftSuccessfulPayment);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('curren_cy');
  if LValue <> nil then
  begin
    AObj.CurrenCy := LValue.AsString;
  end;
  LValue := AJSON.GetValue('total_amount');
  if LValue <> nil then
  begin
    AObj.TotalAmount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('invo_ice_payload');
  if LValue <> nil then
  begin
    AObj.InvoIcePayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('shipping_option_id');
  if LValue <> nil then
  begin
    AObj.ShippingOptionId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('order_info');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.OrderInfo = nil then AObj.OrderInfo := TftOrderInfo.Create;
      FillTftOrderInfo(LValue, AObj.OrderInfo);
    end;
  end;
  LValue := AJSON.GetValue('telegram_paymen_t_charge_id');
  if LValue <> nil then
  begin
    AObj.TelegramPaymenTChargeId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('provider_payment_charge_id');
  if LValue <> nil then
  begin
    AObj.ProviderPaymentChargeId := LValue.AsString;
  end;
end;

function TftSuccessfulPaymentFromJson(const AJSON: TJSONData): TftSuccessfulPayment;
begin
  Result := TftSuccessfulPayment.Create;
  FillTftSuccessfulPayment(AJSON, Result);
end;

procedure FillTftSuggestedPostApprovalFailed(const AJSON: TJSONData; const AObj: TftSuggestedPostApprovalFailed);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('suggested_post_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostMessage = nil then AObj.SuggestedPostMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.SuggestedPostMessage);
    end;
  end;
  LValue := AJSON.GetValue('price');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Price = nil then AObj.Price := TftSuggestedPostPrice.Create;
      FillTftSuggestedPostPrice(LValue, AObj.Price);
    end;
  end;
end;

function TftSuggestedPostApprovalFailedFromJson(const AJSON: TJSONData): TftSuggestedPostApprovalFailed;
begin
  Result := TftSuggestedPostApprovalFailed.Create;
  FillTftSuggestedPostApprovalFailed(AJSON, Result);
end;

procedure FillTftSuggestedPostApproved(const AJSON: TJSONData; const AObj: TftSuggestedPostApproved);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('suggested_post_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostMessage = nil then AObj.SuggestedPostMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.SuggestedPostMessage);
    end;
  end;
  LValue := AJSON.GetValue('price');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Price = nil then AObj.Price := TftSuggestedPostPrice.Create;
      FillTftSuggestedPostPrice(LValue, AObj.Price);
    end;
  end;
  LValue := AJSON.GetValue('send_date');
  if LValue <> nil then
  begin
    AObj.SendDate := LValue.AsInt64;
  end;
end;

function TftSuggestedPostApprovedFromJson(const AJSON: TJSONData): TftSuggestedPostApproved;
begin
  Result := TftSuggestedPostApproved.Create;
  FillTftSuggestedPostApproved(AJSON, Result);
end;

procedure FillTftSuggestedPostDeclined(const AJSON: TJSONData; const AObj: TftSuggestedPostDeclined);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('suggested_post_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostMessage = nil then AObj.SuggestedPostMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.SuggestedPostMessage);
    end;
  end;
  LValue := AJSON.GetValue('comment');
  if LValue <> nil then
  begin
    AObj.Comment := LValue.AsString;
  end;
end;

function TftSuggestedPostDeclinedFromJson(const AJSON: TJSONData): TftSuggestedPostDeclined;
begin
  Result := TftSuggestedPostDeclined.Create;
  FillTftSuggestedPostDeclined(AJSON, Result);
end;

procedure FillTftSuggestedPostInfo(const AJSON: TJSONData; const AObj: TftSuggestedPostInfo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('state');
  if LValue <> nil then
  begin
    AObj.State := LValue.AsString;
  end;
  LValue := AJSON.GetValue('price');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Price = nil then AObj.Price := TftSuggestedPostPrice.Create;
      FillTftSuggestedPostPrice(LValue, AObj.Price);
    end;
  end;
  LValue := AJSON.GetValue('send_date');
  if LValue <> nil then
  begin
    AObj.SendDate := LValue.AsInt64;
  end;
end;

function TftSuggestedPostInfoFromJson(const AJSON: TJSONData): TftSuggestedPostInfo;
begin
  Result := TftSuggestedPostInfo.Create;
  FillTftSuggestedPostInfo(AJSON, Result);
end;

procedure FillTftSuggestedPostPaid(const AJSON: TJSONData; const AObj: TftSuggestedPostPaid);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('suggested_post_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostMessage = nil then AObj.SuggestedPostMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.SuggestedPostMessage);
    end;
  end;
  LValue := AJSON.GetValue('currency');
  if LValue <> nil then
  begin
    AObj.Currency := LValue.AsString;
  end;
  LValue := AJSON.GetValue('amount');
  if LValue <> nil then
  begin
    AObj.Amount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('star_amount');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.StarAmount = nil then AObj.StarAmount := TftStarAmount.Create;
      FillTftStarAmount(LValue, AObj.StarAmount);
    end;
  end;
end;

function TftSuggestedPostPaidFromJson(const AJSON: TJSONData): TftSuggestedPostPaid;
begin
  Result := TftSuggestedPostPaid.Create;
  FillTftSuggestedPostPaid(AJSON, Result);
end;

procedure FillTftSuggestedPostParameters(const AJSON: TJSONData; const AObj: TftSuggestedPostParameters);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('price');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Price = nil then AObj.Price := TftSuggestedPostPrice.Create;
      FillTftSuggestedPostPrice(LValue, AObj.Price);
    end;
  end;
  LValue := AJSON.GetValue('send_date');
  if LValue <> nil then
  begin
    AObj.SendDate := LValue.AsInt64;
  end;
end;

function TftSuggestedPostParametersFromJson(const AJSON: TJSONData): TftSuggestedPostParameters;
begin
  Result := TftSuggestedPostParameters.Create;
  FillTftSuggestedPostParameters(AJSON, Result);
end;

procedure FillTftSuggestedPostPrice(const AJSON: TJSONData; const AObj: TftSuggestedPostPrice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('currency');
  if LValue <> nil then
  begin
    AObj.Currency := LValue.AsString;
  end;
  LValue := AJSON.GetValue('amount');
  if LValue <> nil then
  begin
    AObj.Amount := LValue.AsInt64;
  end;
end;

function TftSuggestedPostPriceFromJson(const AJSON: TJSONData): TftSuggestedPostPrice;
begin
  Result := TftSuggestedPostPrice.Create;
  FillTftSuggestedPostPrice(AJSON, Result);
end;

procedure FillTftSuggestedPostRefunded(const AJSON: TJSONData; const AObj: TftSuggestedPostRefunded);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('suggested_post_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SuggestedPostMessage = nil then AObj.SuggestedPostMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.SuggestedPostMessage);
    end;
  end;
  LValue := AJSON.GetValue('reason');
  if LValue <> nil then
  begin
    AObj.Reason := LValue.AsString;
  end;
end;

function TftSuggestedPostRefundedFromJson(const AJSON: TJSONData): TftSuggestedPostRefunded;
begin
  Result := TftSuggestedPostRefunded.Create;
  FillTftSuggestedPostRefunded(AJSON, Result);
end;

procedure FillTftTransactionPartner(const AJSON: TJSONData; const AObj: TftTransactionPartner);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('type');
  if LValue <> nil then
  begin
    AObj.Type_S := LValue.AsString;
  end;
  LValue := AJSON.GetValue('user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.User = nil then AObj.User := TftUser.Create;
      FillTftUser(LValue, AObj.User);
    end;
  end;
  LValue := AJSON.GetValue('chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Chat = nil then AObj.Chat := TftChat.Create;
      FillTftChat(LValue, AObj.Chat);
    end;
  end;
  LValue := AJSON.GetValue('gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Gift = nil then AObj.Gift := TftGift.Create;
      FillTftGift(LValue, AObj.Gift);
    end;
  end;
  LValue := AJSON.GetValue('invoice_payload');
  if LValue <> nil then
  begin
    AObj.InvoicePayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('subscription_period');
  if LValue <> nil then
  begin
    AObj.SubscriptionPeriod := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('paid_media_payload');
  if LValue <> nil then
  begin
    AObj.PaidMediaPayload := LValue.AsString;
  end;
  LValue := AJSON.GetValue('premium_subscription_duration');
  if LValue <> nil then
  begin
    AObj.PremiumSubscriptionDuration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('sponsor_user');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.SponsorUser = nil then AObj.SponsorUser := TftUser.Create;
      FillTftUser(LValue, AObj.SponsorUser);
    end;
  end;
  LValue := AJSON.GetValue('commission_per_mille');
  if LValue <> nil then
  begin
    AObj.CommissionPerMille := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('request_count');
  if LValue <> nil then
  begin
    AObj.RequestCount := LValue.AsInt64;
  end;
end;

function TftTransactionPartnerFromJson(const AJSON: TJSONData): TftTransactionPartner;
begin
  Result := TftTransactionPartner.Create;
  FillTftTransactionPartner(AJSON, Result);
end;

procedure FillTftUniqueGift(const AJSON: TJSONData; const AObj: TftUniqueGift);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('gift_id');
  if LValue <> nil then
  begin
    AObj.GiftId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('base_name');
  if LValue <> nil then
  begin
    AObj.BaseName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('number');
  if LValue <> nil then
  begin
    AObj.Number := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('model');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Model = nil then AObj.Model := TftUniqueGiftModel.Create;
      FillTftUniqueGiftModel(LValue, AObj.Model);
    end;
  end;
  LValue := AJSON.GetValue('symbol');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Symbol = nil then AObj.Symbol := TftUniqueGiftSymbol.Create;
      FillTftUniqueGiftSymbol(LValue, AObj.Symbol);
    end;
  end;
  LValue := AJSON.GetValue('backdrop');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Backdrop = nil then AObj.Backdrop := TftUniqueGiftBackdrop.Create;
      FillTftUniqueGiftBackdrop(LValue, AObj.Backdrop);
    end;
  end;
  LValue := AJSON.GetValue('is_premium');
  if LValue <> nil then
  begin
    AObj.IsPremium := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_burned');
  if LValue <> nil then
  begin
    AObj.IsBurned := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('is_from_blockchain');
  if LValue <> nil then
  begin
    AObj.IsFromBlockchain := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('colors');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Colors = nil then AObj.Colors := TftUniqueGiftColors.Create;
      FillTftUniqueGiftColors(LValue, AObj.Colors);
    end;
  end;
  LValue := AJSON.GetValue('publisher_chat');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PublisherChat = nil then AObj.PublisherChat := TftChat.Create;
      FillTftChat(LValue, AObj.PublisherChat);
    end;
  end;
end;

function TftUniqueGiftFromJson(const AJSON: TJSONData): TftUniqueGift;
begin
  Result := TftUniqueGift.Create;
  FillTftUniqueGift(AJSON, Result);
end;

procedure FillTftUniqueGiftBackdrop(const AJSON: TJSONData; const AObj: TftUniqueGiftBackdrop);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('colors');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Colors = nil then AObj.Colors := TftUniqueGiftBackdropColors.Create;
      FillTftUniqueGiftBackdropColors(LValue, AObj.Colors);
    end;
  end;
  LValue := AJSON.GetValue('rarity_per_mille');
  if LValue <> nil then
  begin
    AObj.RarityPerMille := LValue.AsInt64;
  end;
end;

function TftUniqueGiftBackdropFromJson(const AJSON: TJSONData): TftUniqueGiftBackdrop;
begin
  Result := TftUniqueGiftBackdrop.Create;
  FillTftUniqueGiftBackdrop(AJSON, Result);
end;

procedure FillTftUniqueGiftBackdropColors(const AJSON: TJSONData; const AObj: TftUniqueGiftBackdropColors);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('center_color');
  if LValue <> nil then
  begin
    AObj.CenterColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('edge_color');
  if LValue <> nil then
  begin
    AObj.EdgeColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('symbol_color');
  if LValue <> nil then
  begin
    AObj.SymbolColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('text_color');
  if LValue <> nil then
  begin
    AObj.TextColor := LValue.AsInt64;
  end;
end;

function TftUniqueGiftBackdropColorsFromJson(const AJSON: TJSONData): TftUniqueGiftBackdropColors;
begin
  Result := TftUniqueGiftBackdropColors.Create;
  FillTftUniqueGiftBackdropColors(AJSON, Result);
end;

procedure FillTftUniqueGiftColors(const AJSON: TJSONData; const AObj: TftUniqueGiftColors);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_LightThemeOtherColors: TArray<Integer>;
  LArr_DarkThemeOtherColors: TArray<Integer>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('model_custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.ModelCustomEmojiId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('symbol_custom_emoji_id');
  if LValue <> nil then
  begin
    AObj.SymbolCustomEmojiId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('light_theme_main_color');
  if LValue <> nil then
  begin
    AObj.LightThemeMainColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('light_theme_other_colors');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_LightThemeOtherColors := AObj.LightThemeOtherColors;
      SetLength(LArr_LightThemeOtherColors, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_LightThemeOtherColors[LI] := TJSONArray(LValue).Items[LI].AsInt64;
      AObj.LightThemeOtherColors := LArr_LightThemeOtherColors;
    end;
  end;
  LValue := AJSON.GetValue('dark_theme_main_color');
  if LValue <> nil then
  begin
    AObj.DarkThemeMainColor := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('dark_theme_other_colors');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_DarkThemeOtherColors := AObj.DarkThemeOtherColors;
      SetLength(LArr_DarkThemeOtherColors, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_DarkThemeOtherColors[LI] := TJSONArray(LValue).Items[LI].AsInt64;
      AObj.DarkThemeOtherColors := LArr_DarkThemeOtherColors;
    end;
  end;
end;

function TftUniqueGiftColorsFromJson(const AJSON: TJSONData): TftUniqueGiftColors;
begin
  Result := TftUniqueGiftColors.Create;
  FillTftUniqueGiftColors(AJSON, Result);
end;

procedure FillTftUniqueGiftInfo(const AJSON: TJSONData; const AObj: TftUniqueGiftInfo);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Entities: TftMessageEntityList;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('gift');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Gift = nil then AObj.Gift := TftUniqueGift.Create;
      FillTftUniqueGift(LValue, AObj.Gift);
    end;
  end;
  LValue := AJSON.GetValue('origin');
  if LValue <> nil then
  begin
    AObj.Origin := LValue.AsString;
  end;
  LValue := AJSON.GetValue('text');
  if LValue <> nil then
  begin
    AObj.Text := LValue.AsString;
  end;
  LValue := AJSON.GetValue('entities');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Entities := AObj.Entities;
      SetLength(LArr_Entities, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Entities[LI] := TftMessageEntityFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Entities := LArr_Entities;
    end;
  end;
  LValue := AJSON.GetValue('is_private');
  if LValue <> nil then
  begin
    AObj.IsPrivate := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('last_resale_currency');
  if LValue <> nil then
  begin
    AObj.LastResaleCurrency := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_resale_amount');
  if LValue <> nil then
  begin
    AObj.LastResaleAmount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('owned_gift_id');
  if LValue <> nil then
  begin
    AObj.OwnedGiftId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('transfer_star_count');
  if LValue <> nil then
  begin
    AObj.TransferStarCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('next_transfer_date');
  if LValue <> nil then
  begin
    AObj.NextTransferDate := LValue.AsInt64;
  end;
end;

function TftUniqueGiftInfoFromJson(const AJSON: TJSONData): TftUniqueGiftInfo;
begin
  Result := TftUniqueGiftInfo.Create;
  FillTftUniqueGiftInfo(AJSON, Result);
end;

procedure FillTftUniqueGiftModel(const AJSON: TJSONData; const AObj: TftUniqueGiftModel);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('sticker');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Sticker = nil then AObj.Sticker := TftSticker.Create;
      FillTftSticker(LValue, AObj.Sticker);
    end;
  end;
  LValue := AJSON.GetValue('rarity_per_mille');
  if LValue <> nil then
  begin
    AObj.RarityPerMille := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('rarity');
  if LValue <> nil then
  begin
    AObj.Rarity := LValue.AsString;
  end;
end;

function TftUniqueGiftModelFromJson(const AJSON: TJSONData): TftUniqueGiftModel;
begin
  Result := TftUniqueGiftModel.Create;
  FillTftUniqueGiftModel(AJSON, Result);
end;

procedure FillTftUniqueGiftSymbol(const AJSON: TJSONData; const AObj: TftUniqueGiftSymbol);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('name');
  if LValue <> nil then
  begin
    AObj.Name := LValue.AsString;
  end;
  LValue := AJSON.GetValue('sticker');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Sticker = nil then AObj.Sticker := TftSticker.Create;
      FillTftSticker(LValue, AObj.Sticker);
    end;
  end;
  LValue := AJSON.GetValue('rarity_per_mille');
  if LValue <> nil then
  begin
    AObj.RarityPerMille := LValue.AsInt64;
  end;
end;

function TftUniqueGiftSymbolFromJson(const AJSON: TJSONData): TftUniqueGiftSymbol;
begin
  Result := TftUniqueGiftSymbol.Create;
  FillTftUniqueGiftSymbol(AJSON, Result);
end;

procedure FillTftUpdate(const AJSON: TJSONData; const AObj: TftUpdate);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('update_id');
  if LValue <> nil then
  begin
    AObj.UpdateId := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Message = nil then AObj.Message := TftMessage.Create;
      FillTftMessage(LValue, AObj.Message);
    end;
  end;
  LValue := AJSON.GetValue('edited_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.EditedMessage = nil then AObj.EditedMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.EditedMessage);
    end;
  end;
  LValue := AJSON.GetValue('channel_post');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChannelPost = nil then AObj.ChannelPost := TftMessage.Create;
      FillTftMessage(LValue, AObj.ChannelPost);
    end;
  end;
  LValue := AJSON.GetValue('edited_channel_post');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.EditedChannelPost = nil then AObj.EditedChannelPost := TftMessage.Create;
      FillTftMessage(LValue, AObj.EditedChannelPost);
    end;
  end;
  LValue := AJSON.GetValue('inline_query');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.InlineQuery = nil then AObj.InlineQuery := TftInlineQuery.Create;
      FillTftInlineQuery(LValue, AObj.InlineQuery);
    end;
  end;
  LValue := AJSON.GetValue('chosen_inline_result');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChosenInlineResult = nil then AObj.ChosenInlineResult := TftChosenInlineResult.Create;
      FillTftChosenInlineResult(LValue, AObj.ChosenInlineResult);
    end;
  end;
  LValue := AJSON.GetValue('callback_query');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.CallbackQuery = nil then AObj.CallbackQuery := TftCallbackQuery.Create;
      FillTftCallbackQuery(LValue, AObj.CallbackQuery);
    end;
  end;
  LValue := AJSON.GetValue('shipping_query');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ShippingQuery = nil then AObj.ShippingQuery := TftShippingQuery.Create;
      FillTftShippingQuery(LValue, AObj.ShippingQuery);
    end;
  end;
  LValue := AJSON.GetValue('pre_checkout_query');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PreCheckoutQuery = nil then AObj.PreCheckoutQuery := TftPreCheckoutQuery.Create;
      FillTftPreCheckoutQuery(LValue, AObj.PreCheckoutQuery);
    end;
  end;
  LValue := AJSON.GetValue('poll');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Poll = nil then AObj.Poll := TftPoll.Create;
      FillTftPoll(LValue, AObj.Poll);
    end;
  end;
  LValue := AJSON.GetValue('poll_answer');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PollAnswer = nil then AObj.PollAnswer := TftPollAnswer.Create;
      FillTftPollAnswer(LValue, AObj.PollAnswer);
    end;
  end;
  LValue := AJSON.GetValue('my_chat_member');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MyChatMember = nil then AObj.MyChatMember := TftChatMemberUpdated.Create;
      FillTftChatMemberUpdated(LValue, AObj.MyChatMember);
    end;
  end;
  LValue := AJSON.GetValue('chat_member');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChatMember = nil then AObj.ChatMember := TftChatMemberUpdated.Create;
      FillTftChatMemberUpdated(LValue, AObj.ChatMember);
    end;
  end;
  LValue := AJSON.GetValue('chat_join_request');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChatJoinRequest = nil then AObj.ChatJoinRequest := TftChatJoinRequest.Create;
      FillTftChatJoinRequest(LValue, AObj.ChatJoinRequest);
    end;
  end;
  LValue := AJSON.GetValue('business_connection');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.BusinessConnection = nil then AObj.BusinessConnection := TftBusinessConnection.Create;
      FillTftBusinessConnection(LValue, AObj.BusinessConnection);
    end;
  end;
  LValue := AJSON.GetValue('business_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.BusinessMessage = nil then AObj.BusinessMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.BusinessMessage);
    end;
  end;
  LValue := AJSON.GetValue('edited_business_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.EditedBusinessMessage = nil then AObj.EditedBusinessMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.EditedBusinessMessage);
    end;
  end;
  LValue := AJSON.GetValue('guest_message');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.GuestMessage = nil then AObj.GuestMessage := TftMessage.Create;
      FillTftMessage(LValue, AObj.GuestMessage);
    end;
  end;
  LValue := AJSON.GetValue('deleted_business_messages');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.DeletedBusinessMessages = nil then AObj.DeletedBusinessMessages := TftBusinessMessagesDeleted.Create;
      FillTftBusinessMessagesDeleted(LValue, AObj.DeletedBusinessMessages);
    end;
  end;
  LValue := AJSON.GetValue('message_reaction');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MessageReaction = nil then AObj.MessageReaction := TftMessageReactionUpdated.Create;
      FillTftMessageReactionUpdated(LValue, AObj.MessageReaction);
    end;
  end;
  LValue := AJSON.GetValue('message_reaction_count');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.MessageReactionCount = nil then AObj.MessageReactionCount := TftMessageReactionCountUpdated.Create;
      FillTftMessageReactionCountUpdated(LValue, AObj.MessageReactionCount);
    end;
  end;
  LValue := AJSON.GetValue('purchased_paid_media');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.PurchasedPaidMedia = nil then AObj.PurchasedPaidMedia := TftPaidMediaPurchased.Create;
      FillTftPaidMediaPurchased(LValue, AObj.PurchasedPaidMedia);
    end;
  end;
  LValue := AJSON.GetValue('chat_boost');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ChatBoost = nil then AObj.ChatBoost := TftChatBoostUpdated.Create;
      FillTftChatBoostUpdated(LValue, AObj.ChatBoost);
    end;
  end;
  LValue := AJSON.GetValue('removed_chat_boost');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.RemovedChatBoost = nil then AObj.RemovedChatBoost := TftChatBoostRemoved.Create;
      FillTftChatBoostRemoved(LValue, AObj.RemovedChatBoost);
    end;
  end;
  LValue := AJSON.GetValue('managed_bot');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.ManagedBot = nil then AObj.ManagedBot := TftManagedBotUpdated.Create;
      FillTftManagedBotUpdated(LValue, AObj.ManagedBot);
    end;
  end;
  LValue := AJSON.GetValue('subscription');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Subscription = nil then AObj.Subscription := TftBotSubscriptionUpdated.Create;
      FillTftBotSubscriptionUpdated(LValue, AObj.Subscription);
    end;
  end;
  LValue := AJSON.GetValue('stopped_message_generation');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.StoppedMessageGeneration = nil then AObj.StoppedMessageGeneration := TftMessageGenerationStopped.Create;
      FillTftMessageGenerationStopped(LValue, AObj.StoppedMessageGeneration);
    end;
  end;
end;

function TftUpdateFromJson(const AJSON: TJSONData): TftUpdate;
begin
  Result := TftUpdate.Create;
  FillTftUpdate(AJSON, Result);
end;

procedure FillTftUser(const AJSON: TJSONData; const AObj: TftUser);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('id');
  if LValue <> nil then
  begin
    AObj.Id := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('is_bot');
  if LValue <> nil then
  begin
    AObj.IsBot := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('first_name');
  if LValue <> nil then
  begin
    AObj.FirstName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_name');
  if LValue <> nil then
  begin
    AObj.LastName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('username');
  if LValue <> nil then
  begin
    AObj.UserName := LValue.AsString;
  end;
  LValue := AJSON.GetValue('language_code');
  if LValue <> nil then
  begin
    AObj.LanguageCode := LValue.AsString;
  end;
  LValue := AJSON.GetValue('is_premium');
  if LValue <> nil then
  begin
    AObj.IsPremium := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('added_to_attachment_menu');
  if LValue <> nil then
  begin
    AObj.AddedToAttachmentMenu := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_join_groups');
  if LValue <> nil then
  begin
    AObj.CanJoinGroups := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('can_read_all_group_messages');
  if LValue <> nil then
  begin
    AObj.CanReadAllGroupMessages := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('supports_inline_queries');
  if LValue <> nil then
  begin
    AObj.SupportsInlineQueries := LValue.AsBoolean;
  end;
end;

function TftUserFromJson(const AJSON: TJSONData): TftUser;
begin
  Result := TftUser.Create;
  FillTftUser(AJSON, Result);
end;

procedure FillTftUserChatBoosts(const AJSON: TJSONData; const AObj: TftUserChatBoosts);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Boosts: TArray<TftChatBoost>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('boosts');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Boosts := AObj.Boosts;
      SetLength(LArr_Boosts, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Boosts[LI] := TftChatBoostFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Boosts := LArr_Boosts;
    end;
  end;
end;

function TftUserChatBoostsFromJson(const AJSON: TJSONData): TftUserChatBoosts;
begin
  Result := TftUserChatBoosts.Create;
  FillTftUserChatBoosts(AJSON, Result);
end;

procedure FillTftUserProfileAudios(const AJSON: TJSONData; const AObj: TftUserProfileAudios);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_Audios: TArray<TftAudio>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('total_count');
  if LValue <> nil then
  begin
    AObj.TotalCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('audios');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_Audios := AObj.Audios;
      SetLength(LArr_Audios, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_Audios[LI] := TftAudioFromJson(TJSONArray(LValue).Items[LI]);
      AObj.Audios := LArr_Audios;
    end;
  end;
end;

function TftUserProfileAudiosFromJson(const AJSON: TJSONData): TftUserProfileAudios;
begin
  Result := TftUserProfileAudios.Create;
  FillTftUserProfileAudios(AJSON, Result);
end;

procedure FillTftUserProfilePhotos(const AJSON: TJSONData; const AObj: TftUserProfilePhotos);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('total_count');
  if LValue <> nil then
  begin
    AObj.TotalCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('photos');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Photos = nil then AObj.Photos := TList<TftPhotoSize>.Create;
      AObj.Photos.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Photos.Add(TftPhotoSizeFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
end;

function TftUserProfilePhotosFromJson(const AJSON: TJSONData): TftUserProfilePhotos;
begin
  Result := TftUserProfilePhotos.Create;
  FillTftUserProfilePhotos(AJSON, Result);
end;

procedure FillTftVenue(const AJSON: TJSONData; const AObj: TftVenue);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('location');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Location = nil then AObj.Location := TftLocation.Create;
      FillTftLocation(LValue, AObj.Location);
    end;
  end;
  LValue := AJSON.GetValue('title');
  if LValue <> nil then
  begin
    AObj.Title := LValue.AsString;
  end;
  LValue := AJSON.GetValue('address');
  if LValue <> nil then
  begin
    AObj.Address := LValue.AsString;
  end;
  LValue := AJSON.GetValue('foursquare_id');
  if LValue <> nil then
  begin
    AObj.FoursquareId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('foursquare_type');
  if LValue <> nil then
  begin
    AObj.FoursquareType := LValue.AsString;
  end;
  LValue := AJSON.GetValue('google_place_id');
  if LValue <> nil then
  begin
    AObj.GooglePlaceId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('google_place_type');
  if LValue <> nil then
  begin
    AObj.GooglePlaceType := LValue.AsString;
  end;
end;

function TftVenueFromJson(const AJSON: TJSONData): TftVenue;
begin
  Result := TftVenue.Create;
  FillTftVenue(AJSON, Result);
end;

procedure FillTftVideo(const AJSON: TJSONData; const AObj: TftVideo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('width');
  if LValue <> nil then
  begin
    AObj.Width := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('height');
  if LValue <> nil then
  begin
    AObj.Height := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
end;

function TftVideoFromJson(const AJSON: TJSONData): TftVideo;
begin
  Result := TftVideo.Create;
  FillTftVideo(AJSON, Result);
end;

procedure FillTftVideoChatEnded(const AJSON: TJSONData; const AObj: TftVideoChatEnded);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
end;

function TftVideoChatEndedFromJson(const AJSON: TJSONData): TftVideoChatEnded;
begin
  Result := TftVideoChatEnded.Create;
  FillTftVideoChatEnded(AJSON, Result);
end;

procedure FillTftVideoChatParticipantsInvited(const AJSON: TJSONData; const AObj: TftVideoChatParticipantsInvited);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('users');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      if AObj.Users = nil then AObj.Users := TList<TftUser>.Create;
      AObj.Users.Clear;
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        AObj.Users.Add(TftUserFromJson(TJSONArray(LValue).Items[LI]));
    end;
  end;
end;

function TftVideoChatParticipantsInvitedFromJson(const AJSON: TJSONData): TftVideoChatParticipantsInvited;
begin
  Result := TftVideoChatParticipantsInvited.Create;
  FillTftVideoChatParticipantsInvited(AJSON, Result);
end;

procedure FillTftVideoChatScheduled(const AJSON: TJSONData; const AObj: TftVideoChatScheduled);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('start_date');
  if LValue <> nil then
  begin
    AObj.StartDate := LValue.AsInt64;
  end;
end;

function TftVideoChatScheduledFromJson(const AJSON: TJSONData): TftVideoChatScheduled;
begin
  Result := TftVideoChatScheduled.Create;
  FillTftVideoChatScheduled(AJSON, Result);
end;

procedure FillTftVideoChatStarted(const AJSON: TJSONData; const AObj: TftVideoChatStarted);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftVideoChatStartedFromJson(const AJSON: TJSONData): TftVideoChatStarted;
begin
  Result := TftVideoChatStarted.Create;
  FillTftVideoChatStarted(AJSON, Result);
end;

procedure FillTftVideoNote(const AJSON: TJSONData; const AObj: TftVideoNote);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('file_id');
  if LValue <> nil then
  begin
    AObj.FileId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('file_unique_id');
  if LValue <> nil then
  begin
    AObj.FileUniqueId := LValue.AsString;
  end;
  LValue := AJSON.GetValue('length');
  if LValue <> nil then
  begin
    AObj.Length := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('thumb');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtObject then
    begin
      if AObj.Thumb = nil then AObj.Thumb := TftPhotoSize.Create;
      FillTftPhotoSize(LValue, AObj.Thumb);
    end;
  end;
  LValue := AJSON.GetValue('file_size');
  if LValue <> nil then
  begin
    AObj.FileSize := LValue.AsInt64;
  end;
end;

function TftVideoNoteFromJson(const AJSON: TJSONData): TftVideoNote;
begin
  Result := TftVideoNote.Create;
  FillTftVideoNote(AJSON, Result);
end;

procedure FillTftVoice(const AJSON: TJSONData; const AObj: TftVoice);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  if Assigned(AObj) then FillTftDocument(AJSON, TftDocument(AObj));
  LValue := AJSON.GetValue('duration');
  if LValue <> nil then
  begin
    AObj.Duration := LValue.AsInt64;
  end;
end;

function TftVoiceFromJson(const AJSON: TJSONData): TftVoice;
begin
  Result := TftVoice.Create;
  FillTftVoice(AJSON, Result);
end;

procedure FillTftWebAppData(const AJSON: TJSONData; const AObj: TftWebAppData);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('data');
  if LValue <> nil then
  begin
    AObj.Data := LValue.AsString;
  end;
  LValue := AJSON.GetValue('button_text');
  if LValue <> nil then
  begin
    AObj.ButtonText := LValue.AsString;
  end;
end;

function TftWebAppDataFromJson(const AJSON: TJSONData): TftWebAppData;
begin
  Result := TftWebAppData.Create;
  FillTftWebAppData(AJSON, Result);
end;

procedure FillTftWebAppInfo(const AJSON: TJSONData; const AObj: TftWebAppInfo);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.Url := LValue.AsString;
  end;
end;

function TftWebAppInfoFromJson(const AJSON: TJSONData): TftWebAppInfo;
begin
  Result := TftWebAppInfo.Create;
  FillTftWebAppInfo(AJSON, Result);
end;

procedure FillTftWebhookInfo(const AJSON: TJSONData; const AObj: TftWebhookInfo);
var
  LValue: TJSONData;
  LI: Integer;
  LArr_AllowedUpdates: TArray<String>;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
  LValue := AJSON.GetValue('url');
  if LValue <> nil then
  begin
    AObj.Url := LValue.AsString;
  end;
  LValue := AJSON.GetValue('has_custom_certificate');
  if LValue <> nil then
  begin
    AObj.HasCustomCertificate := LValue.AsBoolean;
  end;
  LValue := AJSON.GetValue('pending_update_count');
  if LValue <> nil then
  begin
    AObj.PendingUpdateCount := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('ip_address');
  if LValue <> nil then
  begin
    AObj.IpAddress := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_error_date');
  if LValue <> nil then
  begin
    AObj.LastErrorDate := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('last_error_message');
  if LValue <> nil then
  begin
    AObj.LastErrorMessage := LValue.AsString;
  end;
  LValue := AJSON.GetValue('last_synchronization_error_date');
  if LValue <> nil then
  begin
    AObj.LastSynchronizationErrorDate := LValue.AsString;
  end;
  LValue := AJSON.GetValue('max_connections');
  if LValue <> nil then
  begin
    AObj.MaxConnections := LValue.AsInt64;
  end;
  LValue := AJSON.GetValue('allowed_updates');
  if LValue <> nil then
  begin
    if LValue.JSONType = jtArray then
    begin
      LArr_AllowedUpdates := AObj.AllowedUpdates;
      SetLength(LArr_AllowedUpdates, TJSONArray(LValue).Count);
      for LI := 0 to TJSONArray(LValue).Count - 1 do
        LArr_AllowedUpdates[LI] := TJSONArray(LValue).Items[LI].AsString;
      AObj.AllowedUpdates := LArr_AllowedUpdates;
    end;
  end;
end;

function TftWebhookInfoFromJson(const AJSON: TJSONData): TftWebhookInfo;
begin
  Result := TftWebhookInfo.Create;
  FillTftWebhookInfo(AJSON, Result);
end;

procedure FillTftWriteAccessAllowed(const AJSON: TJSONData; const AObj: TftWriteAccessAllowed);
var
  LValue: TJSONData;
  LI: Integer;
begin
  if (AJSON = nil) or (AObj = nil) then Exit;
end;

function TftWriteAccessAllowedFromJson(const AJSON: TJSONData): TftWriteAccessAllowed;
begin
  Result := TftWriteAccessAllowed.Create;
  FillTftWriteAccessAllowed(AJSON, Result);
end;

end.
