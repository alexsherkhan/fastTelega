/// <summary>
/// fastTelega ftPassportElementErrorFrontSide
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorFrontSide;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue with the front side of a document.
  /// The error is considered resolved when the file with the document scan changes.
  /// </summary>
  TftPassportElementErrorFrontSide = class(TftPassportElementError)
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

{ TftPassportElementErrorFrontSide }

constructor TftPassportElementErrorFrontSide.Create;
begin
  Self.Source := PassportElementErrorFrontSideSOURCE;
end;

end.
