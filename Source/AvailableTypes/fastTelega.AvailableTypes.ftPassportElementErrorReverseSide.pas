/// <summary>
/// fastTelega ftPassportElementErrorReverseSide
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorReverseSide;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue with the reverse side of a document.
  /// The error is considered resolved when the file with the document scan changes.
  /// </summary>
  TftPassportElementErrorReverseSide = class(TftPassportElementError)
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

{ TftPassportElementErrorReverseSide }

constructor TftPassportElementErrorReverseSide.Create;
begin
  Self.Source := PassportElementErrorReverseSideSOURCE;
end;

end.
