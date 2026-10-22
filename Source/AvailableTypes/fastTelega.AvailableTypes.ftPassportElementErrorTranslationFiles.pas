/// <summary>
/// fastTelega ftPassportElementErrorTranslationFiles
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorTranslationFiles;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
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
