/// <summary>
/// fastTelega ftPassportElementErrorUnspecified
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorUnspecified;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue in an unspecified place.
  /// The error is considered resolved when new data is added.
  /// </summary>
  TftPassportElementErrorUnspecified = class(TftPassportElementError)
  private
    FElementHash: String;
  public
    constructor Create;
    /// <summary>
    /// Base64-encoded element hash
    /// </summary>
    property ElementHash: String read FElementHash write FElementHash;
  end;

implementation

{ TftPassportElementErrorUnspecified }

constructor TftPassportElementErrorUnspecified.Create;
begin
  Self.Source := PassportElementErrorUnspecifiedSOURCE;
end;

end.
