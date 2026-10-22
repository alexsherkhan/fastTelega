/// <summary>
/// fastTelega ftFile
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftFile;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// <summary>
  /// This object represents a file ready to be downloaded.
  /// The file can be downloaded via Api::downloadFile.
  /// It is guaranteed that the File::filePath will be valid for at least 1 hour.
  /// When the File::filePath expires, a new one can be requested by calling Api::getFile.
  ///
  /// The maximum file size to download is 20 MB
  /// </summary>
  TftFile = class
  private
    FFileId: String;
    FFileUniqueId: String;
    FFileSize: Int64;
    FFilePath: String;
  public
    /// <summary>
    /// Identifier for this file, which can be used to download or reuse the file
    /// </summary>
    property FileId: String read FFileId write FFileId;
    /// <summary>
    /// Unique identifier for this file, which is supposed to be the same over time and for different bots.
    /// Can't be used to download or reuse the file.
    /// </summary>
    property FileUniqueId: String read FFileUniqueId write FFileUniqueId;
    /// <summary>
    /// Optional. File size in bytes.
    ///
    /// It can be bigger than 2^31 and some programming languages may have difficulty/silent defects in interpreting it.
    /// But it has at most 52 significant bits, so a signed 64-bit integer or double-precision float type are safe for storing this value.
    /// </summary>
    property FileSize: Int64 read FFileSize write FFileSize;
    /// <summary>
    /// Optional. File path.
    /// Use Api::downloadFile to get the file.
    /// </summary>
    property FilePath: String read FFilePath write FFilePath;
  end;

implementation

end.
