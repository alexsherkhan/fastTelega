/// <summary>
/// fastTelega ftPassportElementErrorSelfie
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorSelfie;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue with the selfie with a document.
  /// The error is considered resolved when the file with the selfie changes.
  /// </summary>
  TftPassportElementErrorSelfie = class(TftPassportElementError)
  private
    FFileHash: String;
  public
    constructor Create;
    /// <summary>
    /// Base64-encoded data hash
    /// </summary>
    property FileHash: String read FFileHash write FFileHash;
  end;

implementation

{ TftPassportElementErrorSelfie }

constructor TftPassportElementErrorSelfie.Create;
begin
  Self.Source := PassportElementErrorSelfieSOURCE;
end;

end.
