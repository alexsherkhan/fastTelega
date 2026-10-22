{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fasttelega;

{$warn 5023 off : no warning about unused units}
interface

uses
  fastTelega.AvailableTypes.ftAnimation, fastTelega.AvailableTypes.ftAudio, 
  fastTelega.AvailableTypes.ftBotCommand, 
  fastTelega.AvailableTypes.ftCallbackGame, 
  fastTelega.AvailableTypes.ftChatAdministratorRights, 
  fastTelega.AvailableTypes.ftChatLocation, 
  fastTelega.AvailableTypes.ftChatPermissions, 
  fastTelega.AvailableTypes.ftChatPhoto, fastTelega.AvailableTypes.ftContact, 
  fastTelega.AvailableTypes.ftDice, fastTelega.AvailableTypes.ftDocument, 
  fastTelega.AvailableTypes.ftEncryptedCredentials, 
  fastTelega.AvailableTypes.ftEncryptedPassportElement, 
  fastTelega.AvailableTypes.ftFile, fastTelega.AvailableTypes.ftForceReply, 
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
  fastTelega.AvailableTypes.ftLocation, fastTelega.AvailableTypes.ftLoginUrl, 
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
  fastTelega.AvailableTypes.ftSticker, fastTelega.AvailableTypes.ftStickerSet, 
  fastTelega.AvailableTypes.ftSuccessfulPayment, 
  fastTelega.AvailableTypes.ftVenue, fastTelega.AvailableTypes.ftVideo, 
  fastTelega.AvailableTypes.ftVoice, fastTelega.AvailableTypes.ftWebAppData, 
  fastTelega.AvailableTypes.ftWebAppInfo, 
  fastTelega.AvailableTypes.ftWebhookInfo, 
  fastTelega.AvailableTypes.ftWriteAccessAllowed, fastTelega.AvailableTypes, 
  fastTelega.Events.EventBroadcaster, fastTelega.Events.EventHandler, 
  fastTelega.Net.HttpClient, fastTelega.Net.LongPoll, 
  fastTelega.Parser.TypeParser, Rest.JSON, System.JSON, 
  System.Net.HttpClientComponent, System.Net.Mime, System.Net.URLClient, 
  fastTelega.JsonMapper, fastTelega.API, fastTelega.Bot, 
  fastTelega.WebhookServer, fastTelega.WebhookLocalServer, 
  fastTelega.WebhookTCPServer, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fasttelega', @Register);
end.
