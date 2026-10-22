unit fastTelega.JsonMapper;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  System.JSON, Rest.JSON,
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

function TftCallbackQueryFromJson(const AJSON: TJSONValue): TftCallbackQuery;
function TftChosenInlineResultFromJson(const AJSON: TJSONValue): TftChosenInlineResult;
function TftShippingQueryFromJson(const AJSON: TJSONValue): TftShippingQuery;
function TftPreCheckoutQueryFromJson(const AJSON: TJSONValue): TftPreCheckoutQuery;
function TftUpdateFromJson(const AJSON: TJSONValue): TftUpdate;
function TftMessageEntityFromJson(const AJSON: TJSONValue): TftMessageEntity;
function TftSuccessfulPaymentFromJson(const AJSON: TJSONValue): TftSuccessfulPayment;
function TftMessageFromJson(const AJSON: TJSONValue): TftMessage;
function TftInlineQueryFromJson(const AJSON: TJSONValue): TftInlineQuery;
function TftPollFromJson(const AJSON: TJSONValue): TftPoll;
function TftPollAnswerFromJson(const AJSON: TJSONValue): TftPollAnswer;
function TftVideoFromJson(const AJSON: TJSONValue): TftVideo;
function TftVideoNoteFromJson(const AJSON: TJSONValue): TftVideoNote;
function TftVideoChatEndedFromJson(const AJSON: TJSONValue): TftVideoChatEnded;
function TftVideoChatParticipantsInvitedFromJson(const AJSON: TJSONValue): TftVideoChatParticipantsInvited;
function TftVideoChatScheduledFromJson(const AJSON: TJSONValue): TftVideoChatScheduled;
function TftVideoChatStartedFromJson(const AJSON: TJSONValue): TftVideoChatStarted;
function TftEncryptedCredentialFromJson(const AJSON: TJSONValue): TftEncryptedCredential;
function TftGameFromJson(const AJSON: TJSONValue): TftGame;
function TftGameHighScoreFromJson(const AJSON: TJSONValue): TftGameHighScore;
function TftUserFromJson(const AJSON: TJSONValue): TftUser;
function TftUserProfilePhotosFromJson(const AJSON: TJSONValue): TftUserProfilePhotos;
function TftChatFromJson(const AJSON: TJSONValue): TftChat;
function TftChatInviteLinkFromJson(const AJSON: TJSONValue): TftChatInviteLink;
function TftChatJoinRequestFromJson(const AJSON: TJSONValue): TftChatJoinRequest;
function TftChatMemberFromJson(const AJSON: TJSONValue): TftChatMember;
function TftChatMemberAdministratorFromJson(const AJSON: TJSONValue): TftChatMemberAdministrator;
function TftChatMemberBannedFromJson(const AJSON: TJSONValue): TftChatMemberBanned;
function TftChatMemberLeftFromJson(const AJSON: TJSONValue): TftChatMemberLeft;
function TftChatMemberMemberFromJson(const AJSON: TJSONValue): TftChatMemberMember;
function TftChatMemberOwnerFromJson(const AJSON: TJSONValue): TftChatMemberOwner;
function TftChatMemberRestrictedFromJson(const AJSON: TJSONValue): TftChatMemberRestricted;
function TftChatMemberUpdatedFromJson(const AJSON: TJSONValue): TftChatMemberUpdated;
function TftInputFileFromJson(const AJSON: TJSONValue): TftInputFile;
function TftProximityAlertTriggeredFromJson(const AJSON: TJSONValue): TftProximityAlertTriggered;
function TftBotNameFromJson(const AJSON: TJSONValue): TftBotName;
function TftBotDescriptionFromJson(const AJSON: TJSONValue): TftBotDescription;
function TftBotShortDescriptionFromJson(const AJSON: TJSONValue): TftBotShortDescription;
function TftStarAmountFromJson(const AJSON: TJSONValue): TftStarAmount;
function TftUserProfileAudiosFromJson(const AJSON: TJSONValue): TftUserProfileAudios;
function TftPreparedInlineMessageFromJson(const AJSON: TJSONValue): TftPreparedInlineMessage;
function TftPreparedKeyboardButtonFromJson(const AJSON: TJSONValue): TftPreparedKeyboardButton;
function TftBusinessConnectionFromJson(const AJSON: TJSONValue): TftBusinessConnection;
function TftReactionTypeFromJson(const AJSON: TJSONValue): TftReactionType;
function TftInputPaidMediaFromJson(const AJSON: TJSONValue): TftInputPaidMedia;
function TftInputPaidMediaPhotoFromJson(const AJSON: TJSONValue): TftInputPaidMediaPhoto;
function TftInputPaidMediaVideoFromJson(const AJSON: TJSONValue): TftInputPaidMediaVideo;
function TftInputPaidMediaLivePhotoFromJson(const AJSON: TJSONValue): TftInputPaidMediaLivePhoto;
function TftInputChecklistTaskFromJson(const AJSON: TJSONValue): TftInputChecklistTask;
function TftInputChecklistFromJson(const AJSON: TJSONValue): TftInputChecklist;
function TftInputStickerFromJson(const AJSON: TJSONValue): TftInputSticker;
function TftInputProfilePhotoFromJson(const AJSON: TJSONValue): TftInputProfilePhoto;
function TftInputStoryContentFromJson(const AJSON: TJSONValue): TftInputStoryContent;
function TftStoryFromJson(const AJSON: TJSONValue): TftStory;
function TftLinkPreviewOptionsFromJson(const AJSON: TJSONValue): TftLinkPreviewOptions;
function TftSentGuestMessageFromJson(const AJSON: TJSONValue): TftSentGuestMessage;
function TftChatBoostSourceFromJson(const AJSON: TJSONValue): TftChatBoostSource;
function TftChatBoostFromJson(const AJSON: TJSONValue): TftChatBoost;
function TftUserChatBoostsFromJson(const AJSON: TJSONValue): TftUserChatBoosts;
function TftBotAccessSettingsFromJson(const AJSON: TJSONValue): TftBotAccessSettings;
function TftGiftBackgroundFromJson(const AJSON: TJSONValue): TftGiftBackground;
function TftGiftFromJson(const AJSON: TJSONValue): TftGift;
function TftGiftsFromJson(const AJSON: TJSONValue): TftGifts;
function TftUniqueGiftModelFromJson(const AJSON: TJSONValue): TftUniqueGiftModel;
function TftUniqueGiftSymbolFromJson(const AJSON: TJSONValue): TftUniqueGiftSymbol;
function TftUniqueGiftBackdropColorsFromJson(const AJSON: TJSONValue): TftUniqueGiftBackdropColors;
function TftUniqueGiftBackdropFromJson(const AJSON: TJSONValue): TftUniqueGiftBackdrop;
function TftUniqueGiftColorsFromJson(const AJSON: TJSONValue): TftUniqueGiftColors;
function TftUniqueGiftFromJson(const AJSON: TJSONValue): TftUniqueGift;
function TftOwnedGiftFromJson(const AJSON: TJSONValue): TftOwnedGift;
function TftOwnedGiftsFromJson(const AJSON: TJSONValue): TftOwnedGifts;
function TftAcceptedGiftTypesFromJson(const AJSON: TJSONValue): TftAcceptedGiftTypes;
function TftTransactionPartnerFromJson(const AJSON: TJSONValue): TftTransactionPartner;
function TftStarTransactionFromJson(const AJSON: TJSONValue): TftStarTransaction;
function TftStarTransactionsFromJson(const AJSON: TJSONValue): TftStarTransactions;
function TftRichInputMediaFromJson(const AJSON: TJSONValue): TftRichInputMedia;
function TftRichTextFromJson(const AJSON: TJSONValue): TftRichText;
function TftRichMessageButtonFromJson(const AJSON: TJSONValue): TftRichMessageButton;
function TftRichBlockCaptionFromJson(const AJSON: TJSONValue): TftRichBlockCaption;
function TftRichBlockTableCellFromJson(const AJSON: TJSONValue): TftRichBlockTableCell;
function TftInputRichBlockListItemFromJson(const AJSON: TJSONValue): TftInputRichBlockListItem;
function TftInputRichBlockFromJson(const AJSON: TJSONValue): TftInputRichBlock;
function TftInputRichMessageMediaFromJson(const AJSON: TJSONValue): TftInputRichMessageMedia;
function TftInputRichMessageFromJson(const AJSON: TJSONValue): TftInputRichMessage;
function TftBusinessMessagesDeletedFromJson(const AJSON: TJSONValue): TftBusinessMessagesDeleted;
function TftReactionCountFromJson(const AJSON: TJSONValue): TftReactionCount;
function TftMessageReactionUpdatedFromJson(const AJSON: TJSONValue): TftMessageReactionUpdated;
function TftMessageReactionCountUpdatedFromJson(const AJSON: TJSONValue): TftMessageReactionCountUpdated;
function TftChatBoostUpdatedFromJson(const AJSON: TJSONValue): TftChatBoostUpdated;
function TftChatBoostRemovedFromJson(const AJSON: TJSONValue): TftChatBoostRemoved;
function TftPaidMediaPurchasedFromJson(const AJSON: TJSONValue): TftPaidMediaPurchased;
function TftManagedBotUpdatedFromJson(const AJSON: TJSONValue): TftManagedBotUpdated;
function TftBotSubscriptionUpdatedFromJson(const AJSON: TJSONValue): TftBotSubscriptionUpdated;
function TftMessageGenerationStoppedFromJson(const AJSON: TJSONValue): TftMessageGenerationStopped;
function TftDirectMessagesTopicFromJson(const AJSON: TJSONValue): TftDirectMessagesTopic;
function TftLivePhotoFromJson(const AJSON: TJSONValue): TftLivePhoto;
function TftPaidMediaFromJson(const AJSON: TJSONValue): TftPaidMedia;
function TftPaidMediaPhotoFromJson(const AJSON: TJSONValue): TftPaidMediaPhoto;
function TftPaidMediaVideoFromJson(const AJSON: TJSONValue): TftPaidMediaVideo;
function TftPaidMediaLivePhotoFromJson(const AJSON: TJSONValue): TftPaidMediaLivePhoto;
function TftPaidMediaInfoFromJson(const AJSON: TJSONValue): TftPaidMediaInfo;
function TftChecklistTaskFromJson(const AJSON: TJSONValue): TftChecklistTask;
function TftChecklistFromJson(const AJSON: TJSONValue): TftChecklist;
function TftGiftInfoFromJson(const AJSON: TJSONValue): TftGiftInfo;
function TftUniqueGiftInfoFromJson(const AJSON: TJSONValue): TftUniqueGiftInfo;
function TftSuggestedPostPriceFromJson(const AJSON: TJSONValue): TftSuggestedPostPrice;
function TftSuggestedPostInfoFromJson(const AJSON: TJSONValue): TftSuggestedPostInfo;
function TftSuggestedPostParametersFromJson(const AJSON: TJSONValue): TftSuggestedPostParameters;
function TftRefundedPaymentFromJson(const AJSON: TJSONValue): TftRefundedPayment;
function TftChatBoostAddedFromJson(const AJSON: TJSONValue): TftChatBoostAdded;
function TftChatOwnerLeftFromJson(const AJSON: TJSONValue): TftChatOwnerLeft;
function TftChatOwnerChangedFromJson(const AJSON: TJSONValue): TftChatOwnerChanged;
function TftDirectMessagePriceChangedFromJson(const AJSON: TJSONValue): TftDirectMessagePriceChanged;
function TftPaidMessagePriceChangedFromJson(const AJSON: TJSONValue): TftPaidMessagePriceChanged;
function TftChecklistTasksDoneFromJson(const AJSON: TJSONValue): TftChecklistTasksDone;
function TftChecklistTasksAddedFromJson(const AJSON: TJSONValue): TftChecklistTasksAdded;
function TftPollOptionAddedFromJson(const AJSON: TJSONValue): TftPollOptionAdded;
function TftPollOptionDeletedFromJson(const AJSON: TJSONValue): TftPollOptionDeleted;
function TftRichMessageFromJson(const AJSON: TJSONValue): TftRichMessage;
function TftReplyParametersFromJson(const AJSON: TJSONValue): TftReplyParameters;
function TftSuggestedPostApprovedFromJson(const AJSON: TJSONValue): TftSuggestedPostApproved;
function TftSuggestedPostApprovalFailedFromJson(const AJSON: TJSONValue): TftSuggestedPostApprovalFailed;
function TftSuggestedPostDeclinedFromJson(const AJSON: TJSONValue): TftSuggestedPostDeclined;
function TftSuggestedPostPaidFromJson(const AJSON: TJSONValue): TftSuggestedPostPaid;
function TftSuggestedPostRefundedFromJson(const AJSON: TJSONValue): TftSuggestedPostRefunded;
function TftAnimationFromJson(const AJSON: TJSONValue): TftAnimation;
function TftAudioFromJson(const AJSON: TJSONValue): TftAudio;
function TftBotCommandFromJson(const AJSON: TJSONValue): TftBotCommand;
function TftBotCommandScopeFromJson(const AJSON: TJSONValue): TftBotCommandScope;
function TftBotCommandScopeAllChatAdministratorsFromJson(const AJSON: TJSONValue): TftBotCommandScopeAllChatAdministrators;
function TftBotCommandScopeAllGroupChatsFromJson(const AJSON: TJSONValue): TftBotCommandScopeAllGroupChats;
function TftBotCommandScopeAllPrivateChatsFromJson(const AJSON: TJSONValue): TftBotCommandScopeAllPrivateChats;
function TftBotCommandScopeChatFromJson(const AJSON: TJSONValue): TftBotCommandScopeChat;
function TftBotCommandScopeChatAdministratorsFromJson(const AJSON: TJSONValue): TftBotCommandScopeChatAdministrators;
function TftBotCommandScopeChatMemberFromJson(const AJSON: TJSONValue): TftBotCommandScopeChatMember;
function TftBotCommandScopeDefaultFromJson(const AJSON: TJSONValue): TftBotCommandScopeDefault;
function TftCallbackGameFromJson(const AJSON: TJSONValue): TftCallbackGame;
function TftChatAdministratorRightsFromJson(const AJSON: TJSONValue): TftChatAdministratorRights;
function TftChatLocationFromJson(const AJSON: TJSONValue): TftChatLocation;
function TftChatPermissionsFromJson(const AJSON: TJSONValue): TftChatPermissions;
function TftChatPhotoFromJson(const AJSON: TJSONValue): TftChatPhoto;
function TftContactFromJson(const AJSON: TJSONValue): TftContact;
function TftDiceFromJson(const AJSON: TJSONValue): TftDice;
function TftDocumentFromJson(const AJSON: TJSONValue): TftDocument;
function TftEncryptedCredentialsFromJson(const AJSON: TJSONValue): TftEncryptedCredentials;
function TftEncryptedPassportElementFromJson(const AJSON: TJSONValue): TftEncryptedPassportElement;
function TftFileFromJson(const AJSON: TJSONValue): TftFile;
function TftForceReplyFromJson(const AJSON: TJSONValue): TftForceReply;
function TftForumTopicFromJson(const AJSON: TJSONValue): TftForumTopic;
function TftForumTopicClosedFromJson(const AJSON: TJSONValue): TftForumTopicClosed;
function TftForumTopicCreatedFromJson(const AJSON: TJSONValue): TftForumTopicCreated;
function TftForumTopicEditedFromJson(const AJSON: TJSONValue): TftForumTopicEdited;
function TftForumTopicReopenedFromJson(const AJSON: TJSONValue): TftForumTopicReopened;
function TftGeneralForumTopicHiddenFromJson(const AJSON: TJSONValue): TftGeneralForumTopicHidden;
function TftGeneralForumTopicUnhiddenFromJson(const AJSON: TJSONValue): TftGeneralForumTopicUnhidden;
function TftInlineKeyboardButtonFromJson(const AJSON: TJSONValue): TftInlineKeyboardButton;
function TftInlineKeyboardMarkupFromJson(const AJSON: TJSONValue): TftInlineKeyboardMarkup;
function TftInlineQueryResultFromJson(const AJSON: TJSONValue): TftInlineQueryResult;
function TftInlineQueryResultArticleFromJson(const AJSON: TJSONValue): TftInlineQueryResultArticle;
function TftInlineQueryResultAudioFromJson(const AJSON: TJSONValue): TftInlineQueryResultAudio;
function TftInlineQueryResultCachedAudioFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedAudio;
function TftInlineQueryResultCachedDocumentFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedDocument;
function TftInlineQueryResultCachedGifFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedGif;
function TftInlineQueryResultCachedMpeg4GifFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedMpeg4Gif;
function TftInlineQueryResultCachedPhotoFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedPhoto;
function TftInlineQueryResultCachedStickerFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedSticker;
function TftInlineQueryResultCachedVideoFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedVideo;
function TftInlineQueryResultCachedVoiceFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedVoice;
function TftInlineQueryResultContactFromJson(const AJSON: TJSONValue): TftInlineQueryResultContact;
function TftInlineQueryResultDocumentFromJson(const AJSON: TJSONValue): TftInlineQueryResultDocument;
function TftInlineQueryResultGameFromJson(const AJSON: TJSONValue): TftInlineQueryResultGame;
function TftInlineQueryResultGifFromJson(const AJSON: TJSONValue): TftInlineQueryResultGif;
function TftInlineQueryResultLocationFromJson(const AJSON: TJSONValue): TftInlineQueryResultLocation;
function TftInlineQueryResultMpeg4GifFromJson(const AJSON: TJSONValue): TftInlineQueryResultMpeg4Gif;
function TftInlineQueryResultPhotoFromJson(const AJSON: TJSONValue): TftInlineQueryResultPhoto;
function TftInlineQueryResultVenueFromJson(const AJSON: TJSONValue): TftInlineQueryResultVenue;
function TftInlineQueryResultVideoFromJson(const AJSON: TJSONValue): TftInlineQueryResultVideo;
function TftInlineQueryResultVoiceFromJson(const AJSON: TJSONValue): TftInlineQueryResultVoice;
function TftInputInvoiceMessageContentFromJson(const AJSON: TJSONValue): TftInputInvoiceMessageContent;
function TftInputMediaFromJson(const AJSON: TJSONValue): TftInputMedia;
function TftInputMediaAnimationFromJson(const AJSON: TJSONValue): TftInputMediaAnimation;
function TftInputMediaAudioFromJson(const AJSON: TJSONValue): TftInputMediaAudio;
function TftInputMediaDocumentFromJson(const AJSON: TJSONValue): TftInputMediaDocument;
function TftInputMediaPhotoFromJson(const AJSON: TJSONValue): TftInputMediaPhoto;
function TftInputMediaVideoFromJson(const AJSON: TJSONValue): TftInputMediaVideo;
function TftInputMessageContentFromJson(const AJSON: TJSONValue): TftInputMessageContent;
function TftInputTextMessageContentFromJson(const AJSON: TJSONValue): TftInputTextMessageContent;
function TftInputLocationMessageContentFromJson(const AJSON: TJSONValue): TftInputLocationMessageContent;
function TftInputVenueMessageContentFromJson(const AJSON: TJSONValue): TftInputVenueMessageContent;
function TftInputContactMessageContentFromJson(const AJSON: TJSONValue): TftInputContactMessageContent;
function TftInvoiceFromJson(const AJSON: TJSONValue): TftInvoice;
function TftKeyboardButtonFromJson(const AJSON: TJSONValue): TftKeyboardButton;
function TftKeyboardButtonPollTypeFromJson(const AJSON: TJSONValue): TftKeyboardButtonPollType;
function TftLabeledPriceFromJson(const AJSON: TJSONValue): TftLabeledPrice;
function TftLocationFromJson(const AJSON: TJSONValue): TftLocation;
function TftLoginUrlFromJson(const AJSON: TJSONValue): TftLoginUrl;
function TftMaskPositionFromJson(const AJSON: TJSONValue): TftMaskPosition;
function TftMenuButtonFromJson(const AJSON: TJSONValue): TftMenuButton;
function TftMenuButtonCommandsFromJson(const AJSON: TJSONValue): TftMenuButtonCommands;
function TftMenuButtonDefaultFromJson(const AJSON: TJSONValue): TftMenuButtonDefault;
function TftMenuButtonWebAppFromJson(const AJSON: TJSONValue): TftMenuButtonWebApp;
function TftMessageAutoDeleteTimerChangedFromJson(const AJSON: TJSONValue): TftMessageAutoDeleteTimerChanged;
function TftMessageIdFromJson(const AJSON: TJSONValue): TftMessageId;
function TftOrderInfoFromJson(const AJSON: TJSONValue): TftOrderInfo;
function TftPassportDataFromJson(const AJSON: TJSONValue): TftPassportData;
function TftPassportElementErrorFromJson(const AJSON: TJSONValue): TftPassportElementError;
function TftPassportElementErrorDataFieldFromJson(const AJSON: TJSONValue): TftPassportElementErrorDataField;
function TftPassportElementErrorFileFromJson(const AJSON: TJSONValue): TftPassportElementErrorFile;
function TftPassportElementErrorFilesFromJson(const AJSON: TJSONValue): TftPassportElementErrorFiles;
function TftPassportElementErrorFrontSideFromJson(const AJSON: TJSONValue): TftPassportElementErrorFrontSide;
function TftPassportElementErrorReverseSideFromJson(const AJSON: TJSONValue): TftPassportElementErrorReverseSide;
function TftPassportElementErrorSelfieFromJson(const AJSON: TJSONValue): TftPassportElementErrorSelfie;
function TftPassportElementErrorTranslationFileFromJson(const AJSON: TJSONValue): TftPassportElementErrorTranslationFile;
function TftPassportElementErrorTranslationFilesFromJson(const AJSON: TJSONValue): TftPassportElementErrorTranslationFiles;
function TftPassportElementErrorUnspecifiedFromJson(const AJSON: TJSONValue): TftPassportElementErrorUnspecified;
function TftPassportFileFromJson(const AJSON: TJSONValue): TftPassportFile;
function TftPhotoSizeFromJson(const AJSON: TJSONValue): TftPhotoSize;
function TftPollOptionFromJson(const AJSON: TJSONValue): TftPollOption;
function TftReplyBaseFromJson(const AJSON: TJSONValue): TftReplyBase;
function TftReplyKeyboardMarkupFromJson(const AJSON: TJSONValue): TftReplyKeyboardMarkup;
function TftReplyKeyboardRemoveFromJson(const AJSON: TJSONValue): TftReplyKeyboardRemove;
function TftResponseParametersFromJson(const AJSON: TJSONValue): TftResponseParameters;
function TftSentWebAppMessageFromJson(const AJSON: TJSONValue): TftSentWebAppMessage;
function TftShippingAddressFromJson(const AJSON: TJSONValue): TftShippingAddress;
function TftShippingOptionFromJson(const AJSON: TJSONValue): TftShippingOption;
function TftStickerFromJson(const AJSON: TJSONValue): TftSticker;
function TftStickerSetFromJson(const AJSON: TJSONValue): TftStickerSet;
function TftVenueFromJson(const AJSON: TJSONValue): TftVenue;
function TftVoiceFromJson(const AJSON: TJSONValue): TftVoice;
function TftWebAppDataFromJson(const AJSON: TJSONValue): TftWebAppData;
function TftWebAppInfoFromJson(const AJSON: TJSONValue): TftWebAppInfo;
function TftWebhookInfoFromJson(const AJSON: TJSONValue): TftWebhookInfo;
function TftWriteAccessAllowedFromJson(const AJSON: TJSONValue): TftWriteAccessAllowed;

implementation

function TftCallbackQueryFromJson(const AJSON: TJSONValue): TftCallbackQuery;
begin
  Result := TJSON.JsonToObject<TftCallbackQuery>(AJSON.ToJSON);
end;

function TftChosenInlineResultFromJson(const AJSON: TJSONValue): TftChosenInlineResult;
begin
  Result := TJSON.JsonToObject<TftChosenInlineResult>(AJSON.ToJSON);
end;

function TftShippingQueryFromJson(const AJSON: TJSONValue): TftShippingQuery;
begin
  Result := TJSON.JsonToObject<TftShippingQuery>(AJSON.ToJSON);
end;

function TftPreCheckoutQueryFromJson(const AJSON: TJSONValue): TftPreCheckoutQuery;
begin
  Result := TJSON.JsonToObject<TftPreCheckoutQuery>(AJSON.ToJSON);
end;

function TftUpdateFromJson(const AJSON: TJSONValue): TftUpdate;
begin
  Result := TJSON.JsonToObject<TftUpdate>(AJSON.ToJSON);
end;

function TftMessageEntityFromJson(const AJSON: TJSONValue): TftMessageEntity;
begin
  Result := TJSON.JsonToObject<TftMessageEntity>(AJSON.ToJSON);
end;

function TftSuccessfulPaymentFromJson(const AJSON: TJSONValue): TftSuccessfulPayment;
begin
  Result := TJSON.JsonToObject<TftSuccessfulPayment>(AJSON.ToJSON);
end;

function TftMessageFromJson(const AJSON: TJSONValue): TftMessage;
begin
  Result := TJSON.JsonToObject<TftMessage>(AJSON.ToJSON);
end;

function TftInlineQueryFromJson(const AJSON: TJSONValue): TftInlineQuery;
begin
  Result := TJSON.JsonToObject<TftInlineQuery>(AJSON.ToJSON);
end;

function TftPollFromJson(const AJSON: TJSONValue): TftPoll;
begin
  Result := TJSON.JsonToObject<TftPoll>(AJSON.ToJSON);
end;

function TftPollAnswerFromJson(const AJSON: TJSONValue): TftPollAnswer;
begin
  Result := TJSON.JsonToObject<TftPollAnswer>(AJSON.ToJSON);
end;

function TftVideoFromJson(const AJSON: TJSONValue): TftVideo;
begin
  Result := TJSON.JsonToObject<TftVideo>(AJSON.ToJSON);
end;

function TftVideoNoteFromJson(const AJSON: TJSONValue): TftVideoNote;
begin
  Result := TJSON.JsonToObject<TftVideoNote>(AJSON.ToJSON);
end;

function TftVideoChatEndedFromJson(const AJSON: TJSONValue): TftVideoChatEnded;
begin
  Result := TJSON.JsonToObject<TftVideoChatEnded>(AJSON.ToJSON);
end;

function TftVideoChatParticipantsInvitedFromJson(const AJSON: TJSONValue): TftVideoChatParticipantsInvited;
begin
  Result := TJSON.JsonToObject<TftVideoChatParticipantsInvited>(AJSON.ToJSON);
end;

function TftVideoChatScheduledFromJson(const AJSON: TJSONValue): TftVideoChatScheduled;
begin
  Result := TJSON.JsonToObject<TftVideoChatScheduled>(AJSON.ToJSON);
end;

function TftVideoChatStartedFromJson(const AJSON: TJSONValue): TftVideoChatStarted;
begin
  Result := TJSON.JsonToObject<TftVideoChatStarted>(AJSON.ToJSON);
end;

function TftEncryptedCredentialFromJson(const AJSON: TJSONValue): TftEncryptedCredential;
begin
  Result := TJSON.JsonToObject<TftEncryptedCredential>(AJSON.ToJSON);
end;

function TftGameFromJson(const AJSON: TJSONValue): TftGame;
begin
  Result := TJSON.JsonToObject<TftGame>(AJSON.ToJSON);
end;

function TftGameHighScoreFromJson(const AJSON: TJSONValue): TftGameHighScore;
begin
  Result := TJSON.JsonToObject<TftGameHighScore>(AJSON.ToJSON);
end;

function TftUserFromJson(const AJSON: TJSONValue): TftUser;
begin
  Result := TJSON.JsonToObject<TftUser>(AJSON.ToJSON);
end;

function TftUserProfilePhotosFromJson(const AJSON: TJSONValue): TftUserProfilePhotos;
begin
  Result := TJSON.JsonToObject<TftUserProfilePhotos>(AJSON.ToJSON);
end;

function TftChatFromJson(const AJSON: TJSONValue): TftChat;
begin
  Result := TJSON.JsonToObject<TftChat>(AJSON.ToJSON);
end;

function TftChatInviteLinkFromJson(const AJSON: TJSONValue): TftChatInviteLink;
begin
  Result := TJSON.JsonToObject<TftChatInviteLink>(AJSON.ToJSON);
end;

function TftChatJoinRequestFromJson(const AJSON: TJSONValue): TftChatJoinRequest;
begin
  Result := TJSON.JsonToObject<TftChatJoinRequest>(AJSON.ToJSON);
end;

function TftChatMemberFromJson(const AJSON: TJSONValue): TftChatMember;
begin
  Result := TJSON.JsonToObject<TftChatMember>(AJSON.ToJSON);
end;

function TftChatMemberAdministratorFromJson(const AJSON: TJSONValue): TftChatMemberAdministrator;
begin
  Result := TJSON.JsonToObject<TftChatMemberAdministrator>(AJSON.ToJSON);
end;

function TftChatMemberBannedFromJson(const AJSON: TJSONValue): TftChatMemberBanned;
begin
  Result := TJSON.JsonToObject<TftChatMemberBanned>(AJSON.ToJSON);
end;

function TftChatMemberLeftFromJson(const AJSON: TJSONValue): TftChatMemberLeft;
begin
  Result := TJSON.JsonToObject<TftChatMemberLeft>(AJSON.ToJSON);
end;

function TftChatMemberMemberFromJson(const AJSON: TJSONValue): TftChatMemberMember;
begin
  Result := TJSON.JsonToObject<TftChatMemberMember>(AJSON.ToJSON);
end;

function TftChatMemberOwnerFromJson(const AJSON: TJSONValue): TftChatMemberOwner;
begin
  Result := TJSON.JsonToObject<TftChatMemberOwner>(AJSON.ToJSON);
end;

function TftChatMemberRestrictedFromJson(const AJSON: TJSONValue): TftChatMemberRestricted;
begin
  Result := TJSON.JsonToObject<TftChatMemberRestricted>(AJSON.ToJSON);
end;

function TftChatMemberUpdatedFromJson(const AJSON: TJSONValue): TftChatMemberUpdated;
begin
  Result := TJSON.JsonToObject<TftChatMemberUpdated>(AJSON.ToJSON);
end;

function TftInputFileFromJson(const AJSON: TJSONValue): TftInputFile;
begin
  Result := TJSON.JsonToObject<TftInputFile>(AJSON.ToJSON);
end;

function TftProximityAlertTriggeredFromJson(const AJSON: TJSONValue): TftProximityAlertTriggered;
begin
  Result := TJSON.JsonToObject<TftProximityAlertTriggered>(AJSON.ToJSON);
end;

function TftBotNameFromJson(const AJSON: TJSONValue): TftBotName;
begin
  Result := TJSON.JsonToObject<TftBotName>(AJSON.ToJSON);
end;

function TftBotDescriptionFromJson(const AJSON: TJSONValue): TftBotDescription;
begin
  Result := TJSON.JsonToObject<TftBotDescription>(AJSON.ToJSON);
end;

function TftBotShortDescriptionFromJson(const AJSON: TJSONValue): TftBotShortDescription;
begin
  Result := TJSON.JsonToObject<TftBotShortDescription>(AJSON.ToJSON);
end;

function TftStarAmountFromJson(const AJSON: TJSONValue): TftStarAmount;
begin
  Result := TJSON.JsonToObject<TftStarAmount>(AJSON.ToJSON);
end;

function TftUserProfileAudiosFromJson(const AJSON: TJSONValue): TftUserProfileAudios;
begin
  Result := TJSON.JsonToObject<TftUserProfileAudios>(AJSON.ToJSON);
end;

function TftPreparedInlineMessageFromJson(const AJSON: TJSONValue): TftPreparedInlineMessage;
begin
  Result := TJSON.JsonToObject<TftPreparedInlineMessage>(AJSON.ToJSON);
end;

function TftPreparedKeyboardButtonFromJson(const AJSON: TJSONValue): TftPreparedKeyboardButton;
begin
  Result := TJSON.JsonToObject<TftPreparedKeyboardButton>(AJSON.ToJSON);
end;

function TftBusinessConnectionFromJson(const AJSON: TJSONValue): TftBusinessConnection;
begin
  Result := TJSON.JsonToObject<TftBusinessConnection>(AJSON.ToJSON);
end;

function TftReactionTypeFromJson(const AJSON: TJSONValue): TftReactionType;
begin
  Result := TJSON.JsonToObject<TftReactionType>(AJSON.ToJSON);
end;

function TftInputPaidMediaFromJson(const AJSON: TJSONValue): TftInputPaidMedia;
begin
  Result := TJSON.JsonToObject<TftInputPaidMedia>(AJSON.ToJSON);
end;

function TftInputPaidMediaPhotoFromJson(const AJSON: TJSONValue): TftInputPaidMediaPhoto;
begin
  Result := TJSON.JsonToObject<TftInputPaidMediaPhoto>(AJSON.ToJSON);
end;

function TftInputPaidMediaVideoFromJson(const AJSON: TJSONValue): TftInputPaidMediaVideo;
begin
  Result := TJSON.JsonToObject<TftInputPaidMediaVideo>(AJSON.ToJSON);
end;

function TftInputPaidMediaLivePhotoFromJson(const AJSON: TJSONValue): TftInputPaidMediaLivePhoto;
begin
  Result := TJSON.JsonToObject<TftInputPaidMediaLivePhoto>(AJSON.ToJSON);
end;

function TftInputChecklistTaskFromJson(const AJSON: TJSONValue): TftInputChecklistTask;
begin
  Result := TJSON.JsonToObject<TftInputChecklistTask>(AJSON.ToJSON);
end;

function TftInputChecklistFromJson(const AJSON: TJSONValue): TftInputChecklist;
begin
  Result := TJSON.JsonToObject<TftInputChecklist>(AJSON.ToJSON);
end;

function TftInputStickerFromJson(const AJSON: TJSONValue): TftInputSticker;
begin
  Result := TJSON.JsonToObject<TftInputSticker>(AJSON.ToJSON);
end;

function TftInputProfilePhotoFromJson(const AJSON: TJSONValue): TftInputProfilePhoto;
begin
  Result := TJSON.JsonToObject<TftInputProfilePhoto>(AJSON.ToJSON);
end;

function TftInputStoryContentFromJson(const AJSON: TJSONValue): TftInputStoryContent;
begin
  Result := TJSON.JsonToObject<TftInputStoryContent>(AJSON.ToJSON);
end;

function TftStoryFromJson(const AJSON: TJSONValue): TftStory;
begin
  Result := TJSON.JsonToObject<TftStory>(AJSON.ToJSON);
end;

function TftLinkPreviewOptionsFromJson(const AJSON: TJSONValue): TftLinkPreviewOptions;
begin
  Result := TJSON.JsonToObject<TftLinkPreviewOptions>(AJSON.ToJSON);
end;

function TftSentGuestMessageFromJson(const AJSON: TJSONValue): TftSentGuestMessage;
begin
  Result := TJSON.JsonToObject<TftSentGuestMessage>(AJSON.ToJSON);
end;

function TftChatBoostSourceFromJson(const AJSON: TJSONValue): TftChatBoostSource;
begin
  Result := TJSON.JsonToObject<TftChatBoostSource>(AJSON.ToJSON);
end;

function TftChatBoostFromJson(const AJSON: TJSONValue): TftChatBoost;
begin
  Result := TJSON.JsonToObject<TftChatBoost>(AJSON.ToJSON);
end;

function TftUserChatBoostsFromJson(const AJSON: TJSONValue): TftUserChatBoosts;
begin
  Result := TJSON.JsonToObject<TftUserChatBoosts>(AJSON.ToJSON);
end;

function TftBotAccessSettingsFromJson(const AJSON: TJSONValue): TftBotAccessSettings;
begin
  Result := TJSON.JsonToObject<TftBotAccessSettings>(AJSON.ToJSON);
end;

function TftGiftBackgroundFromJson(const AJSON: TJSONValue): TftGiftBackground;
begin
  Result := TJSON.JsonToObject<TftGiftBackground>(AJSON.ToJSON);
end;

function TftGiftFromJson(const AJSON: TJSONValue): TftGift;
begin
  Result := TJSON.JsonToObject<TftGift>(AJSON.ToJSON);
end;

function TftGiftsFromJson(const AJSON: TJSONValue): TftGifts;
begin
  Result := TJSON.JsonToObject<TftGifts>(AJSON.ToJSON);
end;

function TftUniqueGiftModelFromJson(const AJSON: TJSONValue): TftUniqueGiftModel;
begin
  Result := TJSON.JsonToObject<TftUniqueGiftModel>(AJSON.ToJSON);
end;

function TftUniqueGiftSymbolFromJson(const AJSON: TJSONValue): TftUniqueGiftSymbol;
begin
  Result := TJSON.JsonToObject<TftUniqueGiftSymbol>(AJSON.ToJSON);
end;

function TftUniqueGiftBackdropColorsFromJson(const AJSON: TJSONValue): TftUniqueGiftBackdropColors;
begin
  Result := TJSON.JsonToObject<TftUniqueGiftBackdropColors>(AJSON.ToJSON);
end;

function TftUniqueGiftBackdropFromJson(const AJSON: TJSONValue): TftUniqueGiftBackdrop;
begin
  Result := TJSON.JsonToObject<TftUniqueGiftBackdrop>(AJSON.ToJSON);
end;

function TftUniqueGiftColorsFromJson(const AJSON: TJSONValue): TftUniqueGiftColors;
begin
  Result := TJSON.JsonToObject<TftUniqueGiftColors>(AJSON.ToJSON);
end;

function TftUniqueGiftFromJson(const AJSON: TJSONValue): TftUniqueGift;
begin
  Result := TJSON.JsonToObject<TftUniqueGift>(AJSON.ToJSON);
end;

function TftOwnedGiftFromJson(const AJSON: TJSONValue): TftOwnedGift;
begin
  Result := TJSON.JsonToObject<TftOwnedGift>(AJSON.ToJSON);
end;

function TftOwnedGiftsFromJson(const AJSON: TJSONValue): TftOwnedGifts;
begin
  Result := TJSON.JsonToObject<TftOwnedGifts>(AJSON.ToJSON);
end;

function TftAcceptedGiftTypesFromJson(const AJSON: TJSONValue): TftAcceptedGiftTypes;
begin
  Result := TJSON.JsonToObject<TftAcceptedGiftTypes>(AJSON.ToJSON);
end;

function TftTransactionPartnerFromJson(const AJSON: TJSONValue): TftTransactionPartner;
begin
  Result := TJSON.JsonToObject<TftTransactionPartner>(AJSON.ToJSON);
end;

function TftStarTransactionFromJson(const AJSON: TJSONValue): TftStarTransaction;
begin
  Result := TJSON.JsonToObject<TftStarTransaction>(AJSON.ToJSON);
end;

function TftStarTransactionsFromJson(const AJSON: TJSONValue): TftStarTransactions;
begin
  Result := TJSON.JsonToObject<TftStarTransactions>(AJSON.ToJSON);
end;

function TftRichInputMediaFromJson(const AJSON: TJSONValue): TftRichInputMedia;
begin
  Result := TJSON.JsonToObject<TftRichInputMedia>(AJSON.ToJSON);
end;

function TftRichTextFromJson(const AJSON: TJSONValue): TftRichText;
begin
  Result := TJSON.JsonToObject<TftRichText>(AJSON.ToJSON);
end;

function TftRichMessageButtonFromJson(const AJSON: TJSONValue): TftRichMessageButton;
begin
  Result := TJSON.JsonToObject<TftRichMessageButton>(AJSON.ToJSON);
end;

function TftRichBlockCaptionFromJson(const AJSON: TJSONValue): TftRichBlockCaption;
begin
  Result := TJSON.JsonToObject<TftRichBlockCaption>(AJSON.ToJSON);
end;

function TftRichBlockTableCellFromJson(const AJSON: TJSONValue): TftRichBlockTableCell;
begin
  Result := TJSON.JsonToObject<TftRichBlockTableCell>(AJSON.ToJSON);
end;

function TftInputRichBlockListItemFromJson(const AJSON: TJSONValue): TftInputRichBlockListItem;
begin
  Result := TJSON.JsonToObject<TftInputRichBlockListItem>(AJSON.ToJSON);
end;

function TftInputRichBlockFromJson(const AJSON: TJSONValue): TftInputRichBlock;
begin
  Result := TJSON.JsonToObject<TftInputRichBlock>(AJSON.ToJSON);
end;

function TftInputRichMessageMediaFromJson(const AJSON: TJSONValue): TftInputRichMessageMedia;
begin
  Result := TJSON.JsonToObject<TftInputRichMessageMedia>(AJSON.ToJSON);
end;

function TftInputRichMessageFromJson(const AJSON: TJSONValue): TftInputRichMessage;
begin
  Result := TJSON.JsonToObject<TftInputRichMessage>(AJSON.ToJSON);
end;

function TftBusinessMessagesDeletedFromJson(const AJSON: TJSONValue): TftBusinessMessagesDeleted;
begin
  Result := TJSON.JsonToObject<TftBusinessMessagesDeleted>(AJSON.ToJSON);
end;

function TftReactionCountFromJson(const AJSON: TJSONValue): TftReactionCount;
begin
  Result := TJSON.JsonToObject<TftReactionCount>(AJSON.ToJSON);
end;

function TftMessageReactionUpdatedFromJson(const AJSON: TJSONValue): TftMessageReactionUpdated;
begin
  Result := TJSON.JsonToObject<TftMessageReactionUpdated>(AJSON.ToJSON);
end;

function TftMessageReactionCountUpdatedFromJson(const AJSON: TJSONValue): TftMessageReactionCountUpdated;
begin
  Result := TJSON.JsonToObject<TftMessageReactionCountUpdated>(AJSON.ToJSON);
end;

function TftChatBoostUpdatedFromJson(const AJSON: TJSONValue): TftChatBoostUpdated;
begin
  Result := TJSON.JsonToObject<TftChatBoostUpdated>(AJSON.ToJSON);
end;

function TftChatBoostRemovedFromJson(const AJSON: TJSONValue): TftChatBoostRemoved;
begin
  Result := TJSON.JsonToObject<TftChatBoostRemoved>(AJSON.ToJSON);
end;

function TftPaidMediaPurchasedFromJson(const AJSON: TJSONValue): TftPaidMediaPurchased;
begin
  Result := TJSON.JsonToObject<TftPaidMediaPurchased>(AJSON.ToJSON);
end;

function TftManagedBotUpdatedFromJson(const AJSON: TJSONValue): TftManagedBotUpdated;
begin
  Result := TJSON.JsonToObject<TftManagedBotUpdated>(AJSON.ToJSON);
end;

function TftBotSubscriptionUpdatedFromJson(const AJSON: TJSONValue): TftBotSubscriptionUpdated;
begin
  Result := TJSON.JsonToObject<TftBotSubscriptionUpdated>(AJSON.ToJSON);
end;

function TftMessageGenerationStoppedFromJson(const AJSON: TJSONValue): TftMessageGenerationStopped;
begin
  Result := TJSON.JsonToObject<TftMessageGenerationStopped>(AJSON.ToJSON);
end;

function TftDirectMessagesTopicFromJson(const AJSON: TJSONValue): TftDirectMessagesTopic;
begin
  Result := TJSON.JsonToObject<TftDirectMessagesTopic>(AJSON.ToJSON);
end;

function TftLivePhotoFromJson(const AJSON: TJSONValue): TftLivePhoto;
begin
  Result := TJSON.JsonToObject<TftLivePhoto>(AJSON.ToJSON);
end;

function TftPaidMediaFromJson(const AJSON: TJSONValue): TftPaidMedia;
begin
  Result := TJSON.JsonToObject<TftPaidMedia>(AJSON.ToJSON);
end;

function TftPaidMediaPhotoFromJson(const AJSON: TJSONValue): TftPaidMediaPhoto;
begin
  Result := TJSON.JsonToObject<TftPaidMediaPhoto>(AJSON.ToJSON);
end;

function TftPaidMediaVideoFromJson(const AJSON: TJSONValue): TftPaidMediaVideo;
begin
  Result := TJSON.JsonToObject<TftPaidMediaVideo>(AJSON.ToJSON);
end;

function TftPaidMediaLivePhotoFromJson(const AJSON: TJSONValue): TftPaidMediaLivePhoto;
begin
  Result := TJSON.JsonToObject<TftPaidMediaLivePhoto>(AJSON.ToJSON);
end;

function TftPaidMediaInfoFromJson(const AJSON: TJSONValue): TftPaidMediaInfo;
begin
  Result := TJSON.JsonToObject<TftPaidMediaInfo>(AJSON.ToJSON);
end;

function TftChecklistTaskFromJson(const AJSON: TJSONValue): TftChecklistTask;
begin
  Result := TJSON.JsonToObject<TftChecklistTask>(AJSON.ToJSON);
end;

function TftChecklistFromJson(const AJSON: TJSONValue): TftChecklist;
begin
  Result := TJSON.JsonToObject<TftChecklist>(AJSON.ToJSON);
end;

function TftGiftInfoFromJson(const AJSON: TJSONValue): TftGiftInfo;
begin
  Result := TJSON.JsonToObject<TftGiftInfo>(AJSON.ToJSON);
end;

function TftUniqueGiftInfoFromJson(const AJSON: TJSONValue): TftUniqueGiftInfo;
begin
  Result := TJSON.JsonToObject<TftUniqueGiftInfo>(AJSON.ToJSON);
end;

function TftSuggestedPostPriceFromJson(const AJSON: TJSONValue): TftSuggestedPostPrice;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostPrice>(AJSON.ToJSON);
end;

function TftSuggestedPostInfoFromJson(const AJSON: TJSONValue): TftSuggestedPostInfo;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostInfo>(AJSON.ToJSON);
end;

function TftSuggestedPostParametersFromJson(const AJSON: TJSONValue): TftSuggestedPostParameters;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostParameters>(AJSON.ToJSON);
end;

function TftRefundedPaymentFromJson(const AJSON: TJSONValue): TftRefundedPayment;
begin
  Result := TJSON.JsonToObject<TftRefundedPayment>(AJSON.ToJSON);
end;

function TftChatBoostAddedFromJson(const AJSON: TJSONValue): TftChatBoostAdded;
begin
  Result := TJSON.JsonToObject<TftChatBoostAdded>(AJSON.ToJSON);
end;

function TftChatOwnerLeftFromJson(const AJSON: TJSONValue): TftChatOwnerLeft;
begin
  Result := TJSON.JsonToObject<TftChatOwnerLeft>(AJSON.ToJSON);
end;

function TftChatOwnerChangedFromJson(const AJSON: TJSONValue): TftChatOwnerChanged;
begin
  Result := TJSON.JsonToObject<TftChatOwnerChanged>(AJSON.ToJSON);
end;

function TftDirectMessagePriceChangedFromJson(const AJSON: TJSONValue): TftDirectMessagePriceChanged;
begin
  Result := TJSON.JsonToObject<TftDirectMessagePriceChanged>(AJSON.ToJSON);
end;

function TftPaidMessagePriceChangedFromJson(const AJSON: TJSONValue): TftPaidMessagePriceChanged;
begin
  Result := TJSON.JsonToObject<TftPaidMessagePriceChanged>(AJSON.ToJSON);
end;

function TftChecklistTasksDoneFromJson(const AJSON: TJSONValue): TftChecklistTasksDone;
begin
  Result := TJSON.JsonToObject<TftChecklistTasksDone>(AJSON.ToJSON);
end;

function TftChecklistTasksAddedFromJson(const AJSON: TJSONValue): TftChecklistTasksAdded;
begin
  Result := TJSON.JsonToObject<TftChecklistTasksAdded>(AJSON.ToJSON);
end;

function TftPollOptionAddedFromJson(const AJSON: TJSONValue): TftPollOptionAdded;
begin
  Result := TJSON.JsonToObject<TftPollOptionAdded>(AJSON.ToJSON);
end;

function TftPollOptionDeletedFromJson(const AJSON: TJSONValue): TftPollOptionDeleted;
begin
  Result := TJSON.JsonToObject<TftPollOptionDeleted>(AJSON.ToJSON);
end;

function TftRichMessageFromJson(const AJSON: TJSONValue): TftRichMessage;
begin
  Result := TJSON.JsonToObject<TftRichMessage>(AJSON.ToJSON);
end;

function TftReplyParametersFromJson(const AJSON: TJSONValue): TftReplyParameters;
begin
  Result := TJSON.JsonToObject<TftReplyParameters>(AJSON.ToJSON);
end;

function TftSuggestedPostApprovedFromJson(const AJSON: TJSONValue): TftSuggestedPostApproved;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostApproved>(AJSON.ToJSON);
end;

function TftSuggestedPostApprovalFailedFromJson(const AJSON: TJSONValue): TftSuggestedPostApprovalFailed;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostApprovalFailed>(AJSON.ToJSON);
end;

function TftSuggestedPostDeclinedFromJson(const AJSON: TJSONValue): TftSuggestedPostDeclined;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostDeclined>(AJSON.ToJSON);
end;

function TftSuggestedPostPaidFromJson(const AJSON: TJSONValue): TftSuggestedPostPaid;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostPaid>(AJSON.ToJSON);
end;

function TftSuggestedPostRefundedFromJson(const AJSON: TJSONValue): TftSuggestedPostRefunded;
begin
  Result := TJSON.JsonToObject<TftSuggestedPostRefunded>(AJSON.ToJSON);
end;

function TftAnimationFromJson(const AJSON: TJSONValue): TftAnimation;
begin
  Result := TJSON.JsonToObject<TftAnimation>(AJSON.ToJSON);
end;

function TftAudioFromJson(const AJSON: TJSONValue): TftAudio;
begin
  Result := TJSON.JsonToObject<TftAudio>(AJSON.ToJSON);
end;

function TftBotCommandFromJson(const AJSON: TJSONValue): TftBotCommand;
begin
  Result := TJSON.JsonToObject<TftBotCommand>(AJSON.ToJSON);
end;

function TftBotCommandScopeFromJson(const AJSON: TJSONValue): TftBotCommandScope;
begin
  Result := TJSON.JsonToObject<TftBotCommandScope>(AJSON.ToJSON);
end;

function TftBotCommandScopeAllChatAdministratorsFromJson(const AJSON: TJSONValue): TftBotCommandScopeAllChatAdministrators;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeAllChatAdministrators>(AJSON.ToJSON);
end;

function TftBotCommandScopeAllGroupChatsFromJson(const AJSON: TJSONValue): TftBotCommandScopeAllGroupChats;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeAllGroupChats>(AJSON.ToJSON);
end;

function TftBotCommandScopeAllPrivateChatsFromJson(const AJSON: TJSONValue): TftBotCommandScopeAllPrivateChats;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeAllPrivateChats>(AJSON.ToJSON);
end;

function TftBotCommandScopeChatFromJson(const AJSON: TJSONValue): TftBotCommandScopeChat;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeChat>(AJSON.ToJSON);
end;

function TftBotCommandScopeChatAdministratorsFromJson(const AJSON: TJSONValue): TftBotCommandScopeChatAdministrators;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeChatAdministrators>(AJSON.ToJSON);
end;

function TftBotCommandScopeChatMemberFromJson(const AJSON: TJSONValue): TftBotCommandScopeChatMember;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeChatMember>(AJSON.ToJSON);
end;

function TftBotCommandScopeDefaultFromJson(const AJSON: TJSONValue): TftBotCommandScopeDefault;
begin
  Result := TJSON.JsonToObject<TftBotCommandScopeDefault>(AJSON.ToJSON);
end;

function TftCallbackGameFromJson(const AJSON: TJSONValue): TftCallbackGame;
begin
  Result := TJSON.JsonToObject<TftCallbackGame>(AJSON.ToJSON);
end;

function TftChatAdministratorRightsFromJson(const AJSON: TJSONValue): TftChatAdministratorRights;
begin
  Result := TJSON.JsonToObject<TftChatAdministratorRights>(AJSON.ToJSON);
end;

function TftChatLocationFromJson(const AJSON: TJSONValue): TftChatLocation;
begin
  Result := TJSON.JsonToObject<TftChatLocation>(AJSON.ToJSON);
end;

function TftChatPermissionsFromJson(const AJSON: TJSONValue): TftChatPermissions;
begin
  Result := TJSON.JsonToObject<TftChatPermissions>(AJSON.ToJSON);
end;

function TftChatPhotoFromJson(const AJSON: TJSONValue): TftChatPhoto;
begin
  Result := TJSON.JsonToObject<TftChatPhoto>(AJSON.ToJSON);
end;

function TftContactFromJson(const AJSON: TJSONValue): TftContact;
begin
  Result := TJSON.JsonToObject<TftContact>(AJSON.ToJSON);
end;

function TftDiceFromJson(const AJSON: TJSONValue): TftDice;
begin
  Result := TJSON.JsonToObject<TftDice>(AJSON.ToJSON);
end;

function TftDocumentFromJson(const AJSON: TJSONValue): TftDocument;
begin
  Result := TJSON.JsonToObject<TftDocument>(AJSON.ToJSON);
end;

function TftEncryptedCredentialsFromJson(const AJSON: TJSONValue): TftEncryptedCredentials;
begin
  Result := TJSON.JsonToObject<TftEncryptedCredentials>(AJSON.ToJSON);
end;

function TftEncryptedPassportElementFromJson(const AJSON: TJSONValue): TftEncryptedPassportElement;
begin
  Result := TJSON.JsonToObject<TftEncryptedPassportElement>(AJSON.ToJSON);
end;

function TftFileFromJson(const AJSON: TJSONValue): TftFile;
begin
  Result := TJSON.JsonToObject<TftFile>(AJSON.ToJSON);
end;

function TftForceReplyFromJson(const AJSON: TJSONValue): TftForceReply;
begin
  Result := TJSON.JsonToObject<TftForceReply>(AJSON.ToJSON);
end;

function TftForumTopicFromJson(const AJSON: TJSONValue): TftForumTopic;
begin
  Result := TJSON.JsonToObject<TftForumTopic>(AJSON.ToJSON);
end;

function TftForumTopicClosedFromJson(const AJSON: TJSONValue): TftForumTopicClosed;
begin
  Result := TJSON.JsonToObject<TftForumTopicClosed>(AJSON.ToJSON);
end;

function TftForumTopicCreatedFromJson(const AJSON: TJSONValue): TftForumTopicCreated;
begin
  Result := TJSON.JsonToObject<TftForumTopicCreated>(AJSON.ToJSON);
end;

function TftForumTopicEditedFromJson(const AJSON: TJSONValue): TftForumTopicEdited;
begin
  Result := TJSON.JsonToObject<TftForumTopicEdited>(AJSON.ToJSON);
end;

function TftForumTopicReopenedFromJson(const AJSON: TJSONValue): TftForumTopicReopened;
begin
  Result := TJSON.JsonToObject<TftForumTopicReopened>(AJSON.ToJSON);
end;

function TftGeneralForumTopicHiddenFromJson(const AJSON: TJSONValue): TftGeneralForumTopicHidden;
begin
  Result := TJSON.JsonToObject<TftGeneralForumTopicHidden>(AJSON.ToJSON);
end;

function TftGeneralForumTopicUnhiddenFromJson(const AJSON: TJSONValue): TftGeneralForumTopicUnhidden;
begin
  Result := TJSON.JsonToObject<TftGeneralForumTopicUnhidden>(AJSON.ToJSON);
end;

function TftInlineKeyboardButtonFromJson(const AJSON: TJSONValue): TftInlineKeyboardButton;
begin
  Result := TJSON.JsonToObject<TftInlineKeyboardButton>(AJSON.ToJSON);
end;

function TftInlineKeyboardMarkupFromJson(const AJSON: TJSONValue): TftInlineKeyboardMarkup;
begin
  Result := TJSON.JsonToObject<TftInlineKeyboardMarkup>(AJSON.ToJSON);
end;

function TftInlineQueryResultFromJson(const AJSON: TJSONValue): TftInlineQueryResult;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResult>(AJSON.ToJSON);
end;

function TftInlineQueryResultArticleFromJson(const AJSON: TJSONValue): TftInlineQueryResultArticle;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultArticle>(AJSON.ToJSON);
end;

function TftInlineQueryResultAudioFromJson(const AJSON: TJSONValue): TftInlineQueryResultAudio;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultAudio>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedAudioFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedAudio;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedAudio>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedDocumentFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedDocument;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedDocument>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedGifFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedGif;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedGif>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedMpeg4GifFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedMpeg4Gif;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedMpeg4Gif>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedPhotoFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedPhoto;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedPhoto>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedStickerFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedSticker;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedSticker>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedVideoFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedVideo;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedVideo>(AJSON.ToJSON);
end;

function TftInlineQueryResultCachedVoiceFromJson(const AJSON: TJSONValue): TftInlineQueryResultCachedVoice;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultCachedVoice>(AJSON.ToJSON);
end;

function TftInlineQueryResultContactFromJson(const AJSON: TJSONValue): TftInlineQueryResultContact;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultContact>(AJSON.ToJSON);
end;

function TftInlineQueryResultDocumentFromJson(const AJSON: TJSONValue): TftInlineQueryResultDocument;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultDocument>(AJSON.ToJSON);
end;

function TftInlineQueryResultGameFromJson(const AJSON: TJSONValue): TftInlineQueryResultGame;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultGame>(AJSON.ToJSON);
end;

function TftInlineQueryResultGifFromJson(const AJSON: TJSONValue): TftInlineQueryResultGif;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultGif>(AJSON.ToJSON);
end;

function TftInlineQueryResultLocationFromJson(const AJSON: TJSONValue): TftInlineQueryResultLocation;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultLocation>(AJSON.ToJSON);
end;

function TftInlineQueryResultMpeg4GifFromJson(const AJSON: TJSONValue): TftInlineQueryResultMpeg4Gif;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultMpeg4Gif>(AJSON.ToJSON);
end;

function TftInlineQueryResultPhotoFromJson(const AJSON: TJSONValue): TftInlineQueryResultPhoto;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultPhoto>(AJSON.ToJSON);
end;

function TftInlineQueryResultVenueFromJson(const AJSON: TJSONValue): TftInlineQueryResultVenue;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultVenue>(AJSON.ToJSON);
end;

function TftInlineQueryResultVideoFromJson(const AJSON: TJSONValue): TftInlineQueryResultVideo;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultVideo>(AJSON.ToJSON);
end;

function TftInlineQueryResultVoiceFromJson(const AJSON: TJSONValue): TftInlineQueryResultVoice;
begin
  Result := TJSON.JsonToObject<TftInlineQueryResultVoice>(AJSON.ToJSON);
end;

function TftInputInvoiceMessageContentFromJson(const AJSON: TJSONValue): TftInputInvoiceMessageContent;
begin
  Result := TJSON.JsonToObject<TftInputInvoiceMessageContent>(AJSON.ToJSON);
end;

function TftInputMediaFromJson(const AJSON: TJSONValue): TftInputMedia;
begin
  Result := TJSON.JsonToObject<TftInputMedia>(AJSON.ToJSON);
end;

function TftInputMediaAnimationFromJson(const AJSON: TJSONValue): TftInputMediaAnimation;
begin
  Result := TJSON.JsonToObject<TftInputMediaAnimation>(AJSON.ToJSON);
end;

function TftInputMediaAudioFromJson(const AJSON: TJSONValue): TftInputMediaAudio;
begin
  Result := TJSON.JsonToObject<TftInputMediaAudio>(AJSON.ToJSON);
end;

function TftInputMediaDocumentFromJson(const AJSON: TJSONValue): TftInputMediaDocument;
begin
  Result := TJSON.JsonToObject<TftInputMediaDocument>(AJSON.ToJSON);
end;

function TftInputMediaPhotoFromJson(const AJSON: TJSONValue): TftInputMediaPhoto;
begin
  Result := TJSON.JsonToObject<TftInputMediaPhoto>(AJSON.ToJSON);
end;

function TftInputMediaVideoFromJson(const AJSON: TJSONValue): TftInputMediaVideo;
begin
  Result := TJSON.JsonToObject<TftInputMediaVideo>(AJSON.ToJSON);
end;

function TftInputMessageContentFromJson(const AJSON: TJSONValue): TftInputMessageContent;
begin
  Result := TJSON.JsonToObject<TftInputMessageContent>(AJSON.ToJSON);
end;

function TftInputTextMessageContentFromJson(const AJSON: TJSONValue): TftInputTextMessageContent;
begin
  Result := TJSON.JsonToObject<TftInputTextMessageContent>(AJSON.ToJSON);
end;

function TftInputLocationMessageContentFromJson(const AJSON: TJSONValue): TftInputLocationMessageContent;
begin
  Result := TJSON.JsonToObject<TftInputLocationMessageContent>(AJSON.ToJSON);
end;

function TftInputVenueMessageContentFromJson(const AJSON: TJSONValue): TftInputVenueMessageContent;
begin
  Result := TJSON.JsonToObject<TftInputVenueMessageContent>(AJSON.ToJSON);
end;

function TftInputContactMessageContentFromJson(const AJSON: TJSONValue): TftInputContactMessageContent;
begin
  Result := TJSON.JsonToObject<TftInputContactMessageContent>(AJSON.ToJSON);
end;

function TftInvoiceFromJson(const AJSON: TJSONValue): TftInvoice;
begin
  Result := TJSON.JsonToObject<TftInvoice>(AJSON.ToJSON);
end;

function TftKeyboardButtonFromJson(const AJSON: TJSONValue): TftKeyboardButton;
begin
  Result := TJSON.JsonToObject<TftKeyboardButton>(AJSON.ToJSON);
end;

function TftKeyboardButtonPollTypeFromJson(const AJSON: TJSONValue): TftKeyboardButtonPollType;
begin
  Result := TJSON.JsonToObject<TftKeyboardButtonPollType>(AJSON.ToJSON);
end;

function TftLabeledPriceFromJson(const AJSON: TJSONValue): TftLabeledPrice;
begin
  Result := TJSON.JsonToObject<TftLabeledPrice>(AJSON.ToJSON);
end;

function TftLocationFromJson(const AJSON: TJSONValue): TftLocation;
begin
  Result := TJSON.JsonToObject<TftLocation>(AJSON.ToJSON);
end;

function TftLoginUrlFromJson(const AJSON: TJSONValue): TftLoginUrl;
begin
  Result := TJSON.JsonToObject<TftLoginUrl>(AJSON.ToJSON);
end;

function TftMaskPositionFromJson(const AJSON: TJSONValue): TftMaskPosition;
begin
  Result := TJSON.JsonToObject<TftMaskPosition>(AJSON.ToJSON);
end;

function TftMenuButtonFromJson(const AJSON: TJSONValue): TftMenuButton;
begin
  Result := TJSON.JsonToObject<TftMenuButton>(AJSON.ToJSON);
end;

function TftMenuButtonCommandsFromJson(const AJSON: TJSONValue): TftMenuButtonCommands;
begin
  Result := TJSON.JsonToObject<TftMenuButtonCommands>(AJSON.ToJSON);
end;

function TftMenuButtonDefaultFromJson(const AJSON: TJSONValue): TftMenuButtonDefault;
begin
  Result := TJSON.JsonToObject<TftMenuButtonDefault>(AJSON.ToJSON);
end;

function TftMenuButtonWebAppFromJson(const AJSON: TJSONValue): TftMenuButtonWebApp;
begin
  Result := TJSON.JsonToObject<TftMenuButtonWebApp>(AJSON.ToJSON);
end;

function TftMessageAutoDeleteTimerChangedFromJson(const AJSON: TJSONValue): TftMessageAutoDeleteTimerChanged;
begin
  Result := TJSON.JsonToObject<TftMessageAutoDeleteTimerChanged>(AJSON.ToJSON);
end;

function TftMessageIdFromJson(const AJSON: TJSONValue): TftMessageId;
begin
  Result := TJSON.JsonToObject<TftMessageId>(AJSON.ToJSON);
end;

function TftOrderInfoFromJson(const AJSON: TJSONValue): TftOrderInfo;
begin
  Result := TJSON.JsonToObject<TftOrderInfo>(AJSON.ToJSON);
end;

function TftPassportDataFromJson(const AJSON: TJSONValue): TftPassportData;
begin
  Result := TJSON.JsonToObject<TftPassportData>(AJSON.ToJSON);
end;

function TftPassportElementErrorFromJson(const AJSON: TJSONValue): TftPassportElementError;
begin
  Result := TJSON.JsonToObject<TftPassportElementError>(AJSON.ToJSON);
end;

function TftPassportElementErrorDataFieldFromJson(const AJSON: TJSONValue): TftPassportElementErrorDataField;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorDataField>(AJSON.ToJSON);
end;

function TftPassportElementErrorFileFromJson(const AJSON: TJSONValue): TftPassportElementErrorFile;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorFile>(AJSON.ToJSON);
end;

function TftPassportElementErrorFilesFromJson(const AJSON: TJSONValue): TftPassportElementErrorFiles;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorFiles>(AJSON.ToJSON);
end;

function TftPassportElementErrorFrontSideFromJson(const AJSON: TJSONValue): TftPassportElementErrorFrontSide;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorFrontSide>(AJSON.ToJSON);
end;

function TftPassportElementErrorReverseSideFromJson(const AJSON: TJSONValue): TftPassportElementErrorReverseSide;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorReverseSide>(AJSON.ToJSON);
end;

function TftPassportElementErrorSelfieFromJson(const AJSON: TJSONValue): TftPassportElementErrorSelfie;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorSelfie>(AJSON.ToJSON);
end;

function TftPassportElementErrorTranslationFileFromJson(const AJSON: TJSONValue): TftPassportElementErrorTranslationFile;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorTranslationFile>(AJSON.ToJSON);
end;

function TftPassportElementErrorTranslationFilesFromJson(const AJSON: TJSONValue): TftPassportElementErrorTranslationFiles;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorTranslationFiles>(AJSON.ToJSON);
end;

function TftPassportElementErrorUnspecifiedFromJson(const AJSON: TJSONValue): TftPassportElementErrorUnspecified;
begin
  Result := TJSON.JsonToObject<TftPassportElementErrorUnspecified>(AJSON.ToJSON);
end;

function TftPassportFileFromJson(const AJSON: TJSONValue): TftPassportFile;
begin
  Result := TJSON.JsonToObject<TftPassportFile>(AJSON.ToJSON);
end;

function TftPhotoSizeFromJson(const AJSON: TJSONValue): TftPhotoSize;
begin
  Result := TJSON.JsonToObject<TftPhotoSize>(AJSON.ToJSON);
end;

function TftPollOptionFromJson(const AJSON: TJSONValue): TftPollOption;
begin
  Result := TJSON.JsonToObject<TftPollOption>(AJSON.ToJSON);
end;

function TftReplyBaseFromJson(const AJSON: TJSONValue): TftReplyBase;
begin
  Result := TJSON.JsonToObject<TftReplyBase>(AJSON.ToJSON);
end;

function TftReplyKeyboardMarkupFromJson(const AJSON: TJSONValue): TftReplyKeyboardMarkup;
begin
  Result := TJSON.JsonToObject<TftReplyKeyboardMarkup>(AJSON.ToJSON);
end;

function TftReplyKeyboardRemoveFromJson(const AJSON: TJSONValue): TftReplyKeyboardRemove;
begin
  Result := TJSON.JsonToObject<TftReplyKeyboardRemove>(AJSON.ToJSON);
end;

function TftResponseParametersFromJson(const AJSON: TJSONValue): TftResponseParameters;
begin
  Result := TJSON.JsonToObject<TftResponseParameters>(AJSON.ToJSON);
end;

function TftSentWebAppMessageFromJson(const AJSON: TJSONValue): TftSentWebAppMessage;
begin
  Result := TJSON.JsonToObject<TftSentWebAppMessage>(AJSON.ToJSON);
end;

function TftShippingAddressFromJson(const AJSON: TJSONValue): TftShippingAddress;
begin
  Result := TJSON.JsonToObject<TftShippingAddress>(AJSON.ToJSON);
end;

function TftShippingOptionFromJson(const AJSON: TJSONValue): TftShippingOption;
begin
  Result := TJSON.JsonToObject<TftShippingOption>(AJSON.ToJSON);
end;

function TftStickerFromJson(const AJSON: TJSONValue): TftSticker;
begin
  Result := TJSON.JsonToObject<TftSticker>(AJSON.ToJSON);
end;

function TftStickerSetFromJson(const AJSON: TJSONValue): TftStickerSet;
begin
  Result := TJSON.JsonToObject<TftStickerSet>(AJSON.ToJSON);
end;

function TftVenueFromJson(const AJSON: TJSONValue): TftVenue;
begin
  Result := TJSON.JsonToObject<TftVenue>(AJSON.ToJSON);
end;

function TftVoiceFromJson(const AJSON: TJSONValue): TftVoice;
begin
  Result := TJSON.JsonToObject<TftVoice>(AJSON.ToJSON);
end;

function TftWebAppDataFromJson(const AJSON: TJSONValue): TftWebAppData;
begin
  Result := TJSON.JsonToObject<TftWebAppData>(AJSON.ToJSON);
end;

function TftWebAppInfoFromJson(const AJSON: TJSONValue): TftWebAppInfo;
begin
  Result := TJSON.JsonToObject<TftWebAppInfo>(AJSON.ToJSON);
end;

function TftWebhookInfoFromJson(const AJSON: TJSONValue): TftWebhookInfo;
begin
  Result := TJSON.JsonToObject<TftWebhookInfo>(AJSON.ToJSON);
end;

function TftWriteAccessAllowedFromJson(const AJSON: TJSONValue): TftWriteAccessAllowed;
begin
  Result := TJSON.JsonToObject<TftWriteAccessAllowed>(AJSON.ToJSON);
end;

end.
