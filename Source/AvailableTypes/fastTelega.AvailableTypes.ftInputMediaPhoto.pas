/// <summary>
/// fastTelega ftInputMediaPhoto
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputMediaPhoto;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftInputMedia;

type

  /// <summary>
  /// Represents a photo to be sent.
  /// </summary>
  TftInputMediaPhoto = class(TftInputMedia)
  private
    FHasSpoiler: Boolean;
  public
    constructor Create;
    /// <summary>
    /// Optional. Pass True if the photo needs to be covered with a spoiler animation
    /// </summary>
    property HasSpoiler: Boolean read FHasSpoiler write FHasSpoiler;
  end;

implementation

{ TftInputMediaPhoto }

constructor TftInputMediaPhoto.Create;
begin
  TypeS := 'photo';
end;

end.
