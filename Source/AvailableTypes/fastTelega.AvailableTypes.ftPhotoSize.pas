/// <summary>
/// fastTelega ftPhotoSize
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPhotoSize;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents one size of a photo or a file / sticker thumbnail.
  /// </summary>
  TftPhotoSize = class
  private
    FFileId: String;
    FFileUniqueId: String;
    FWidth: Integer;
    FHeight: Integer;
    FFileSize: Integer;
  public
    /// <summary>
    /// Identifier for this file, which can be used to download or reuse the file
    /// </summary>
    property FileId: String read FFileId write FFileId;
    /// <summary>
    /// Unique identifier for this file, which is supposed to be the
    /// same over time and for different bots. Can't be used to download
    /// or reuse the file.
    /// </summary>
    property FileUniqueId: String read FFileUniqueId write FFileUniqueId;
    /// <summary>
    /// Photo width
    /// </summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>
    /// Photo height
    /// </summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>
    /// Optional. File size
    /// </summary>
    property FileSize: Integer read FFileSize write FFileSize;
  end;

  TftPhotoSizeList = TArray<TftPhotoSize>;

implementation

end.
