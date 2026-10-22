/// <summary>
/// fastTelega ftPassportElementErrorFiles
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorFiles;

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
  /// Represents an issue with a list of scans.
  /// The error is considered resolved when the file with the document scan changes.
  /// </summary>
  TftPassportElementErrorFiles = class(TftPassportElementError)
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

{ TftPassportElementErrorFiles }

constructor TftPassportElementErrorFiles.Create;
begin
  Self.Source := PassportElementErrorFilesSOURCE;
  Self.FFileHashes := TList<String>.Create;
end;

end.
