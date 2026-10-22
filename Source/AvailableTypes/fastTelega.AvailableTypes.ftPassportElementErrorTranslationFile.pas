/// <summary>
/// fastTelega ftPassportElementErrorTranslationFile
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorTranslationFile;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue with one of the files that constitute the translation of a document.
  /// The error is considered resolved when the file changes.
  /// </summary>
  TftPassportElementErrorTranslationFile = class(TftPassportElementError)
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

{ TftPassportElementErrorTranslationFile }

constructor TftPassportElementErrorTranslationFile.Create;
begin
  Self.Source := PassportElementErrorTranslationFileSOURCE;
end;

end.
