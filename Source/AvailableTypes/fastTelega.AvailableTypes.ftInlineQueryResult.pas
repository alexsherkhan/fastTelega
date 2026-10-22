/// <summary>
/// fastTelega ftInlineQueryResult
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInlineQueryResult;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftInlineKeyboardMarkup,
  fastTelega.AvailableTypes.ftInputMessageContent;

const
  InlineQueryResultCachedAudioTYPE = 'audio';
  InlineQueryResultCachedDocumentTYPE = 'document';
  InlineQueryResultCachedGifTYPE = 'gif';
  InlineQueryResultCachedMpeg4GifTYPE = 'mpeg4_gif';
  InlineQueryResultCachedPhotoTYPE = 'photo';
  InlineQueryResultCachedStickerTYPE = 'sticker';
  InlineQueryResultCachedVideoTYPE = 'video';
  InlineQueryResultCachedVoiceTYPE = 'voice';

  InlineQueryResultArticleTYPE = 'article';
  InlineQueryResultAudioTYPE = 'audio';
  InlineQueryResultContactTYPE = 'contact';
  InlineQueryResultGameTYPE = 'game';
  InlineQueryResultDocumentTYPE = 'document';
  InlineQueryResultGifTYPE = 'gif';
  InlineQueryResultLocationTYPE = 'location';
  InlineQueryResultMpeg4GifTYPE = 'mpeg4_gif';
  InlineQueryResultPhotoTYPE = 'photo';
  InlineQueryResultVenueTYPE = 'venue';
  InlineQueryResultVideoTYPE = 'video';
  InlineQueryResultVoiceTYPE = 'voice';

type

  /// <summary>
  /// This abstract class is base of all inline query results.
  /// </summary>
  TftInlineQueryResult = class
  private
    FType: String;
    FId: String;
    FReplyMarkup: TftInlineKeyboardMarkup;
  public
    /// <summary>
    /// Type of the result.
    /// </summary>
    property TypeS: String read FType write FType;
    /// <summary>
    /// Unique identifier for this result. (1-64 bytes)
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Optional. Inline keyboard attached to the message
    /// </summary>
    property ReplyMarkup: TftInlineKeyboardMarkup read FReplyMarkup
      write FReplyMarkup;
  end;

  /// <summary>
  /// Represents a link to an article of web page.
  /// </summary>
  TftInlineQueryResultArticle = class(TftInlineQueryResult)
  private
    FTitle: String;
    FInputMessageContent: TftInputMessageContent;
    FUrl: String;
    FHideUrl: Boolean;
    FDescription: String;
    FThumbUrl: String;
    FThumbWidth: Integer;
    FThumbHeight: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property TypeS;
    /// <summary>
    /// Title of the result
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Content of the message to be sent
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FInputMessageContent write FInputMessageContent;
    /// <summary>
    /// Optional. URL of the result.
    /// </summary>
    property Url: String read FUrl write FUrl;
    /// <summary>
    /// Optional. Pass True if you don't want the URL to be shown in the message.
    /// </summary>
    property HideUrl: Boolean read FHideUrl write FHideUrl;
    /// <summary>
    /// Optional. Short description of the result.
    /// </summary>
    property Description: String read FDescription write FDescription;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FThumbWidth write FThumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FThumbHeight write FThumbHeight;
  end;

  /// <summary>
  /// Represents a link to an mp3 audio file.
  /// </summary>
  TftInlineQueryResultAudio = class(TftInlineQueryResult)
  private
    FAudioUrl: String;
    FTitle: String;
    FCaption: String;
    FParseMode: String;
    // FCaptionEntities: TList<TftMessageEntity>;
    FPerformer: String;
    FAudioDuration: Integer;
    FInputMessageContent: TftInputMessageContent;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL for the audio file
    /// </summary>
    property AudioUrl: String read FAudioUrl write FAudioUrl;
    /// <summary>
    /// Title
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Optional. Caption, 0-1024 characters after entities parsing
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional. Mode for parsing entities in the audio caption.
    /// See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    // /// <summary>
    // /// Optional. List of special entities that appear in the caption, which can be specified instead of parseMode
    // /// </summary>
    // property CaptionEntities: TList<TftMessageEntity>: read FCaptionEntities
    // write FCaptionEntities;
    /// <summary>
    /// Optional. Performer
    /// </summary>
    property Performer: String read FPerformer write FPerformer;
    /// <summary>
    /// Optional. Audio duration in seconds
    /// </summary>
    property AudioDuration: Integer read FAudioDuration write FAudioDuration;
    /// <summary>
    /// Optional. Content of the message to be sent instead of the audio
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FInputMessageContent write FInputMessageContent;
  end;

  /// <summary>
  /// Represents a link to an mp3 audio file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedAudio = class(TftInlineQueryResult)
  private
    FAudioFileId: String;
    FCaption: String;
    FParseMode: String;
    // FCaptionEntities: TList<TftMessageEntity>;
    FInputMessageContent: TftInputMessageContent;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier for the audio file
    /// </summary>
    property AudioFileId: String read FAudioFileId write FAudioFileId;
    /// <summary>
    /// Optional. Caption, 0-1024 characters after entities parsing
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional. Mode for parsing entities in the audio caption.
    /// See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    // /// <summary>
    // /// Optional. List of special entities that appear in the caption, which can be specified instead of parseMode
    // /// </summary>
    // property CaptionEntities: TList<TftMessageEntity>: read FCaptionEntities
    // write FCaptionEntities;
    /// <summary>
    /// Optional. Content of the message to be sent instead of the audio
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FInputMessageContent write FInputMessageContent;
  end;

  /// <summary>
  /// Represents a link to a file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedDocument = class(TftInlineQueryResult)
  private
    FDocumentFileId: String;
    FDescription: String;
    FCaption: String;
    FParseMode: String;
    // FCaptionEntities: TList<TftMessageEntity>;
    FInputMessageContent: TftInputMessageContent;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier for the file
    /// </summary>
    property DocumentFileId: String read FDocumentFileId write FDocumentFileId;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read FDescription write FDescription;
    /// <summary>
    /// Optional. Caption, 0-1024 characters after entities parsing
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional. Mode for parsing entities in the document caption.
    /// See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    // /// <summary>
    // /// Optional. List of special entities that appear in the caption, which can be specified instead of parseMode
    // /// </summary>
    // property CaptionEntities: TList<TftMessageEntity>: read FCaptionEntities
    // write FCaptionEntities;
    /// <summary>
    /// Optional. Content of the message to be sent instead of the file
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FInputMessageContent write FInputMessageContent;
  end;

  /// <summary>
  /// Represents a link to an animated GIF file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedGif = class(TftInlineQueryResult)
  private
    FGifFileId: String;
    FTitle: String;
    FCaption: String;
    FParseMode: String;
    // FCaptionEntities: TList<TftMessageEntity>;
    FInputMessageContent: TftInputMessageContent;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier for the GIF file
    /// </summary>
    property GifFileId: String read FGifFileId write FGifFileId;
    /// <summary>
    /// Optional. Title for the result
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Optional. Caption of the GIF file to be sent, 0-1024 characters after entities parsing
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional. Mode for parsing entities in the caption.
    /// See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    // /// <summary>
    // /// Optional. List of special entities that appear in the caption, which can be specified instead of parseMode
    // /// </summary>
    // property CaptionEntities: TList<TftMessageEntity>: read FCaptionEntities
    // write FCaptionEntities;;
    /// <summary>
    /// Optional. Content of the message to be sent instead of the GIF animation
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FInputMessageContent write FInputMessageContent;
  end;

  /// <summary>
  /// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedMpeg4Gif = class(TftInlineQueryResult)
  private
    FMpeg4FileId: String;
    FTitle: String;
    FCaption: String;
    FParseMode: String;
    // FCaptionEntities: TList<TftMessageEntity>;
    FInputMessageContent: TftInputMessageContent;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier for the MP4 file
    /// </summary>
    property Mpeg4FileId: String read FMpeg4FileId write FMpeg4FileId;
    /// <summary>
    /// Optional. Title for the result
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Optional. Caption of the MPEG-4 file to be sent, 0-1024 characters after entities parsing
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional. Mode for parsing entities in the caption.
    /// See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    // /// <summary>
    // /// Optional. List of special entities that appear in the caption, which can be specified instead of parseMode
    // /// </summary>
    // property CaptionEntities: TList<TftMessageEntity>: read FCaptionEntities
    // write FCaptionEntities;;
    /// <summary>
    /// Optional. Content of the message to be sent instead of the video animation
    /// </summary>
    property InputMessageContent: TftInputMessageContent
      read FInputMessageContent write FInputMessageContent;
  end;

  /// <summary>
  /// Represents a link to a photo stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedPhoto = class(TftInlineQueryResult)
  private
    FPhotoFileId: String;
    FDescription: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier of the photo
    /// </summary>
    property PhotoFileId: String read FPhotoFileId write FPhotoFileId;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read FDescription write FDescription;
  end;

  /// <summary>
  /// Represents a link to a sticker stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedSticker = class(TftInlineQueryResult)
  private
    FStickerFileId: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier of the sticker
    /// </summary>
    property StickerFileId: String read FStickerFileId write FStickerFileId;
  end;

  /// <summary>
  /// Represents a link to a video file stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedVideo = class(TftInlineQueryResult)
  private
    FVideoFileId: String;
    FDescription: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier of the video
    /// </summary>
    property VideoFileId: String read FVideoFileId write FVideoFileId;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read FDescription write FDescription;
  end;

  /// <summary>
  /// Represents a link to a voice message stored on the Telegram servers.
  /// </summary>
  TftInlineQueryResultCachedVoice = class(TftInlineQueryResult)
  private
    FVoiceFileId: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid file identifier of the voice message
    /// </summary>
    property VoiceFileId: String read FVoiceFileId write FVoiceFileId;
  end;

  /// <summary>
  /// Represents a contact with a phone number
  /// </summary>
  TftInlineQueryResultContact = class(TftInlineQueryResult)
  private
    FPhoneNumber: String;
    FFirstName: String;
    FLastName: String;
    FVcard: String;
    FThumbUrl: String;
    FThumbWidth: Integer;
    FThumbHeight: Integer;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// Contact's phone number
    /// </summary>
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
    /// <summary>
    /// Contact's first name
    /// </summary>
    property FirstName: String read FFirstName write FFirstName;
    /// <summary>
    /// Optional. Contact's last name
    /// </summary>
    property LastName: String read FLastName write FLastName;
    /// <summary>
    /// Optional. Additional data about the contact in the form of a vCard
    /// </summary>
    property Vcard: String read FVcard write FVcard;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FThumbWidth write FThumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FThumbHeight write FThumbHeight;
  end;

  /// <summary>
  /// Represents a link to a file.
  /// </summary>
  TftInlineQueryResultDocument = class(TftInlineQueryResult)
  private
    FDocumentUrl: String;
    FMimeType: String;
    FDescription: String;
    FThumbUrl: String;
    FThumbWidth: Integer;
    FThumbHeight: Integer;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL for the file
    /// </summary>
    property DocumentUrl: String read FDocumentUrl write FDocumentUrl;
    /// <summary>
    /// Mime type of the content of the file, either 'application/pdf' or 'application/zip'
    /// </summary>
    property MimeType: String read FMimeType write FMimeType;
    /// <summary>
    /// Optional. Short description of the result
    /// </summary>
    property Description: String read FDescription write FDescription;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FThumbWidth write FThumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FThumbHeight write FThumbHeight;
  end;

  /// <summary>
  /// Represents a Game.
  /// </summary>
  TftInlineQueryResultGame = class(TftInlineQueryResult)
  private
    FGameShortName: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// Short name of the game
    /// </summary>
    property GameShortName: String read FGameShortName write FGameShortName;
  end;

  /// <summary>
  /// Represents a link to an animated GIF file.
  /// </summary>
  TftInlineQueryResultGif = class(TftInlineQueryResult)
  private
    FGifUrl: String;
    FGifWidth: Integer;
    FGifHeight: Integer;
    FGifDuration: Integer;
    FThumbUrl: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL for the GIF file.
    /// </summary>
    property GifUrl: String read FGifUrl write FGifUrl;
    /// <summary>
    /// Optional. Width of the GIF.
    /// </summary>
    property GifWidth: Integer read FGifWidth write FGifWidth;
    /// <summary>
    /// Optional. Height of the GIF.
    /// </summary>
    property GifHeight: Integer read FGifHeight write FGifHeight;
    /// <summary>
    /// Optional. Duration of the GIF
    /// </summary>
    property GifDuration: Integer read FGifDuration write FGifDuration;
    /// <summary>
    /// URL of the static thumbnail for the result (jpeg or gif)
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
  end;

  /// <summary>
  /// Represents a location on a map.
  /// </summary>
  TftInlineQueryResultLocation = class(TftInlineQueryResult)
  private
    FLatitude: Double;
    FLongitude: Double;
    FThumbUrl: String;
    FThumbWidth: Integer;
    FThumbHeight: Integer;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// Location latitude in degrees
    /// </summary>
    property Latitude: Double read FLatitude write FLatitude;
    /// <summary>
    /// Location longitude in degrees
    /// </summary>
    property Longitude: Double read FLongitude write FLongitude;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FThumbWidth write FThumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FThumbHeight write FThumbHeight;
  end;

  /// <summary>
  /// Represents a link to a video animation (H.264/MPEG-4 AVC video without sound).
  /// </summary>
  TftInlineQueryResultMpeg4Gif = class(TftInlineQueryResult)
  private
    FMpeg4Url: String;
    FMpeg4Width: Integer;
    FMpeg4Height: Integer;
    FMpeg4Duration: Integer;
    FThumbUrl: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL for the MP4 file.
    /// </summary>
    property Mpeg4Url: String read FMpeg4Url write FMpeg4Url;
    /// <summary>
    /// Optional. Video width.
    /// </summary>
    property Mpeg4Width: Integer read FMpeg4Width write FMpeg4Width;
    /// <summary>
    /// Optional. Video height.
    /// </summary>
    property Mpeg4Height: Integer read FMpeg4Height write FMpeg4Height;
    /// <summary>
    /// Optional. Video duration.
    /// </summary>
    property Mpeg4Duration: Integer read FMpeg4Duration write FMpeg4Duration;
    /// <summary>
    /// URL of the static thumbnail (jpeg or gif) for the result
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
  end;

  /// <summary>
  /// Represents a link to a photo.
  /// </summary>
  TftInlineQueryResultPhoto = class(TftInlineQueryResult)
  private
    FPhotoUrl: String;
    FThumbUrl: String;
    FPhotoWidth: Integer;
    FPhotoHeight: Integer;
    FPhotoDuration: Integer;
    FDescription: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL of the photo.
    /// </summary>
    property PhotoUrl: String read FPhotoUrl write FPhotoUrl;
    /// <summary>
    /// Optional. Width of the photo.
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// URL of the thumbnail for the photo
    /// </summary>
    property PhotoWidth: Integer read FPhotoWidth write FPhotoWidth;
    /// <summary>
    /// Optional. Width of the photo.
    /// </summary>
    property PhotoHeight: Integer read FPhotoHeight write FPhotoHeight;
    /// <summary>
    /// Optional. Height of the photo.
    /// </summary>
    property PhotoDuration: Integer read FPhotoDuration write FPhotoDuration;
    /// <summary>
    /// Optional. Short description of the result.
    /// </summary>
    property Description: String read FDescription write FDescription;
  end;

  /// <summary>
  /// Represents a venue.
  /// </summary>
  TftInlineQueryResultVenue = class(TftInlineQueryResult)
  private
    FLatitude: Double;
    FLongitude: Double;
    FAddress: String;
    FFoursquareId: String;
    FFoursquareType: String;
    FThumbUrl: String;
    FThumbWidth: Integer;
    FThumbHeight: Integer;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// Location latitude in degrees
    /// </summary>
    property Latitude: Double read FLatitude write FLatitude;
    /// <summary>
    /// Location longitude in degrees
    /// </summary>
    property Longitude: Double read FLongitude write FLongitude;
    /// <summary>
    /// Address of the venue
    /// </summary>
    property Address: String read FAddress write FAddress;
    /// <summary>
    /// Optional. Foursquare identifier of the venue if known
    /// </summary>
    property FoursquareId: String read FFoursquareId write FFoursquareId;
    /// <summary>
    /// Optional. Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)
    /// </summary>
    property FoursquareType: String read FFoursquareType write FFoursquareType;
    /// <summary>
    /// Optional. Url of the thumbnail for the result
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// Optional. Thumbnail width.
    /// </summary>
    property ThumbWidth: Integer read FThumbWidth write FThumbWidth;
    /// <summary>
    /// Optinal. Thumbnail height
    /// </summary>
    property ThumbHeight: Integer read FThumbHeight write FThumbHeight;
  end;

  /// <summary>
  /// Represents link to a page containing an embedded video player or a video file.
  /// </summary>
  TftInlineQueryResultVideo = class(TftInlineQueryResult)
  private
    FVideoUrl: String;
    FMimeType: String;
    FThumbUrl: String;
    FVideoWidth: Integer;
    FVideoHeight: Integer;
    FVideoDuration: Integer;
    FDescription: String;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL for the embedded video player or video file.
    /// </summary>
    property VideoUrl: String read FVideoUrl write FVideoUrl;
    /// <summary>
    /// Mime type of the content of video url, "text/html" or "video/mp4".
    /// </summary>
    property MimeType: String read FMimeType write FMimeType;
    /// <summary>
    /// URL of the thumbnail (jpeg only) for the video
    /// </summary>
    property ThumbUrl: String read FThumbUrl write FThumbUrl;
    /// <summary>
    /// Optional. Video width.
    /// </summary>
    property VideoWidth: Integer read FVideoWidth write FVideoWidth;
    /// <summary>
    /// Optional. Video height.
    /// </summary>
    property VideoHeight: Integer read FVideoHeight write FVideoHeight;
    /// <summary>
    /// Optional. Video duration
    /// </summary>
    property VideoDuration: Integer read FVideoDuration write FVideoDuration;
    /// <summary>
    /// Optional. Short description of the result.
    /// </summary>
    property Description: String read FDescription write FDescription;
  end;

  /// <summary>
  /// Represents link to a page containing an embedded Voice player or a Voice file.
  /// </summary>
  TftInlineQueryResultVoice = class(TftInlineQueryResult)
  private
    FVoiceUrl: String;
    FVoiceDuration: Integer;
  public
    constructor Create;
    property TypeS;
    /// <summary>
    /// A valid URL for the voice recording
    /// </summary>
    property VoiceUrl: String read FVoiceUrl write FVoiceUrl;
    /// <summary>
    /// Optional. Recording duration in seconds
    /// </summary>
    property VoiceDuration: Integer read FVoiceDuration write FVoiceDuration;
  end;

implementation

{ TftInlineQueryResultArticle }

constructor TftInlineQueryResultArticle.Create;
begin
  FType := InlineQueryResultArticleTYPE;
  FHideUrl := false;
  FThumbWidth := 0;
  FThumbHeight := 0;
  FInputMessageContent := TftInputMessageContent.Create('');
end;

destructor TftInlineQueryResultArticle.Destroy;
begin
  FInputMessageContent.Free;
  inherited;
end;

{ TftInlineQueryResultAudio }

constructor TftInlineQueryResultAudio.Create;
begin
  FType := InlineQueryResultAudioTYPE;
  FAudioDuration := 0;
end;

{ TftInlineQueryResultCachedAudio }

constructor TftInlineQueryResultCachedAudio.Create;
begin
  FType := InlineQueryResultCachedAudioTYPE;
end;

{ TftInlineQueryResultCachedDocument }

constructor TftInlineQueryResultCachedDocument.Create;
begin
  FType := InlineQueryResultCachedDocumentTYPE;
end;

{ TftInlineQueryResultCachedGif }

constructor TftInlineQueryResultCachedGif.Create;
begin
  FType := InlineQueryResultCachedGifTYPE;
end;

{ TftInlineQueryResultCachedMpeg4Gif }

constructor TftInlineQueryResultCachedMpeg4Gif.Create;
begin
  FType := InlineQueryResultCachedMpeg4GifTYPE;
end;

{ TftInlineQueryResultCachedPhoto }

constructor TftInlineQueryResultCachedPhoto.Create;
begin
  FType := InlineQueryResultCachedPhotoTYPE;
end;

{ TftInlineQueryResultCachedSticker }

constructor TftInlineQueryResultCachedSticker.Create;
begin
  FType := InlineQueryResultCachedStickerTYPE;
end;

{ TftInlineQueryResultCachedVideo }

constructor TftInlineQueryResultCachedVideo.Create;
begin
  FType := InlineQueryResultCachedVideoTYPE;
end;

{ TftInlineQueryResultCachedVoice }

constructor TftInlineQueryResultCachedVoice.Create;
begin
  FType := InlineQueryResultCachedVoiceTYPE;
end;

{ TftInlineQueryResultContact }

constructor TftInlineQueryResultContact.Create;
begin
  FType := InlineQueryResultContactTYPE;
  FThumbWidth := 0;
  FThumbHeight := 0;
end;

{ TftInlineQueryResultDocument }

constructor TftInlineQueryResultDocument.Create;
begin
  FType := InlineQueryResultDocumentTYPE;
  FThumbWidth := 0;
  FThumbHeight := 0;
end;

{ TftInlineQueryResultGame }

constructor TftInlineQueryResultGame.Create;
begin
  FType := InlineQueryResultGameTYPE;
end;

{ TftInlineQueryResultGif }

constructor TftInlineQueryResultGif.Create;
begin
  FType := InlineQueryResultGifTYPE;
  FGifWidth := 0;
  FGifHeight := 0;
end;

{ TftInlineQueryResultLocation }

constructor TftInlineQueryResultLocation.Create;
begin
  FType := InlineQueryResultLocationTYPE;
  FThumbWidth := 0;
  FThumbHeight := 0;
end;

{ TftInlineQueryResultMpeg4Gif }

constructor TftInlineQueryResultMpeg4Gif.Create;
begin
  FType := InlineQueryResultMpeg4GifTYPE;
  FMpeg4Width := 0;
  FMpeg4Height := 0;
end;

{ TftInlineQueryResultPhoto }

constructor TftInlineQueryResultPhoto.Create;
begin
  FType := InlineQueryResultPhotoTYPE;
  FPhotoWidth := 0;
  FPhotoHeight := 0;
end;

{ TftInlineQueryResultVenue }

constructor TftInlineQueryResultVenue.Create;
begin
  FType := InlineQueryResultVenueTYPE;
  FThumbWidth := 0;
  FThumbHeight := 0;
end;

{ TftInlineQueryResultVideo }

constructor TftInlineQueryResultVideo.Create;
begin
  FType := InlineQueryResultVideoTYPE;
  FVideoWidth := 0;
  FVideoHeight := 0;
  FVideoDuration := 0;
end;

{ TftInlineQueryResultVoice }

constructor TftInlineQueryResultVoice.Create;
begin
  FType := InlineQueryResultVoiceTYPE;
  FVoiceDuration := 0;
end;

end.
