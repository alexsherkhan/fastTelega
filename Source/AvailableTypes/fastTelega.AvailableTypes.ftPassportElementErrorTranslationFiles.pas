/// <summary>
/// fastTelega ftPassportElementErrorTranslationFiles
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorTranslationFiles;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue with the translated version of a document.
  /// The error is considered resolved when a file with the document translation change.
  /// </summary>
  TftPassportElementErrorTranslationFiles = class(TftPassportElementError)
  private
    FFileHashes: TList<String>;
  public
    constructor Create;
    /// <summary>
    /// List of base64-encoded file hashes
    /// </summary>
    property FileHashes: TList<String> read FFileHashes write FFileHashes;
  end;

implementation

{ TftPassportElementErrorTranslationFiles }

constructor TftPassportElementErrorTranslationFiles.Create;
begin
  Self.Source := PassportElementErrorTranslationFilesSOURCE;
  Self.FFileHashes := TList<String>.Create;
end;

end.
