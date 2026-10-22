/// <summary>
/// fastTelega ftPassportElementErrorFile
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorFile;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue with a document scan.
  /// The error is considered resolved when the file with the document scan changes.
  /// </summary>
  TftPassportElementErrorFile = class(TftPassportElementError)
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

{ TftPassportElementErrorFile }

constructor TftPassportElementErrorFile.Create;
begin
  Self.Source := PassportElementErrorFileSOURCE;
end;

end.
