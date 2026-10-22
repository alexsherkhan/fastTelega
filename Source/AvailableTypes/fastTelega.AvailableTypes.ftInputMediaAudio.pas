/// <summary>
/// fastTelega ftInputMediaAudio
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputMediaAudio;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftInputMedia;

type

  /// <summary>
  /// Represents an audio file to be treated as music to be sent
  /// </summary>
  TftInputMediaAudio = class(TftInputMedia)
  private
    FThumb: String;
    FDuration: Integer;
    FPerformer: Integer;
    FTitle: Integer;
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
    /// Optional. Duration of the audio in seconds
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
    /// <summary>
    /// Optional. Performer of the audio
    /// </summary>
    property Performer: Integer read FPerformer write FPerformer;
    /// <summary>
    /// Optional. Title of the audio
    /// </summary>
    property Title: Integer read FTitle write FTitle;
  end;

implementation

{ TftInputMediaAudio }

constructor TftInputMediaAudio.Create;
begin
  TypeS := 'audio';
end;

end.
