/// <summary>
/// fastTelega ftInputMediaAnimation
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputMediaAnimation;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftInputMedia;

type

  /// <summary>
  /// Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent.
  /// </summary>
  TftInputMediaAnimation = class(TftInputMedia)
  private
    FThumb: String;
    FWidth: Integer;
    FHeight: Integer;
    FDuration: Integer;
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
    /// Optional. Animation width
    /// </summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>
    /// Optional. Animation height
    /// </summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>
    /// Optional. Animation duration
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
    /// <summary>
    /// Optional. Pass True if the animation needs to be covered with a spoiler animation
    /// </summary>
    property HasSpoiler: Boolean read FHasSpoiler write FHasSpoiler;
  end;

implementation

{ TftInputMediaAnimation }

constructor TftInputMediaAnimation.Create;
begin
  TypeS := 'animation';
end;

end.
