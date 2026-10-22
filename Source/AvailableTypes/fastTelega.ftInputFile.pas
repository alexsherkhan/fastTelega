/// <summary>
/// fastTelega ftInputFile
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftInputFile;
interface
uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  fastTelega.ftMessageEntity;
type
   /// <summary>
  /// This object represents the contents of a file to be uploaded.
  /// </summary>
  TftInputFile = class
  private
    Fdata: String;
    FfilePath: String;
    FmimeType: String;
    FfileName: String;
  public
    /// <summary>
    /// Creates new TftInputFile from an existing file.
    /// </summary>
    class function fromFile(const filePath: String; const MimeType: String)
      : TftInputFile;
    /// <summary>
    /// Contents of a file.
    /// </summary>
    property Data: String read Fdata write Fdata;
    /// <summary>
    /// Mime type of a file.
    /// </summary>
    property MimeType: String read FmimeType write FmimeType;
    /// <summary>
    /// File name.
    /// </summary>
    property fileName: String read FfileName write FfileName;
    /// <summary>
    /// File path.
    /// </summary>
    property filePath: String read FfilePath write FfilePath;
  end;


implementation
{ TftInputFile }

class function TftInputFile.fromFile(const filePath,
  MimeType: String): TftInputFile;
begin
  Result := TftInputFile.Create;
  // Result.data := FileTools: : read(filePath);
  Result.filePath := filePath;
  Result.MimeType := MimeType;
  Result.fileName := ExtractFileName(filePath);
end;

end.
