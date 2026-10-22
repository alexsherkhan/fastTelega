/// <summary>
/// fastTelega ftInputMediaVideo
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputMediaVideo;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftInputMedia;

type

  /// <summary>
  /// Represents a video to be sent.
  /// </summary>
  TftInputMediaVideo = class(TftInputMedia)
  private
    FThumb: String;
    FWidth: Integer;
    FHeight: Integer;
    FDuration: Integer;
    FSupportsStreaming: Boolean;
    FHasSpoiler: Boolean;
  public
    constructor Create;
    /// <summary>
    /// Optional. Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side.
    /// The thumbnail should be in JPEG format and less than 200 kB in size.
    /// A thumbnail's width and height should not exceed 320.
    /// Ignored if the file is not uploaded using multipart/form-data.
    /// Thumbnails can't be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>.
    /// https://core.telegram.org/bots/api#sending-files
    /// </summary>
    property Thumb: String read FThumb write FThumb;
    /// <summary>
    /// Optional. Video width
    /// </summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>
    /// Optional. Video height
    /// </summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>
    /// Optional. Video duration in seconds
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
    /// <summary>
    /// Optional. Pass True if the uploaded video is suitable for streaming
    /// </summary>
    property SupportsStreaming: Boolean read FSupportsStreaming
      write FSupportsStreaming;
    /// <summary>
    /// Optional. Pass True if the video needs to be covered with a spoiler animation
    /// </summary>
    property HasSpoiler: Boolean read FHasSpoiler write FHasSpoiler;
  end;

implementation

{ TftInputMediaVideo }

constructor TftInputMediaVideo.Create;
begin
  TypeS := 'video';
end;

end.
