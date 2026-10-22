/// <summary>
/// fastTelega ftDocument
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftDocument;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftPhotoSize;

type

  /// <summary>
  /// This object represents a general file (as opposed to photos, voice messages and audio files).
  /// </summary>
  TftDocument = class
  private
    FFileId: String;
    FFileUniqueId: String;
    FThumb: TftPhotoSize;
    FFileName: String;
    FMimeType: String;
    FFileSize: Int64;
  public
    constructor Create;
    /// <summary>
    /// Identifier for this file, which can be used to download or reuse the file
    /// </summary>
    property FileId: String read FFileId write FFileId;
    /// <summary>
    /// Unique identifier for this file, which is supposed to be the
    /// same over time and for different bots. Can't be used to
    /// download or reuse the file.
    /// </summary>
    property FileUniqueId: String read FFileUniqueId write FFileUniqueId;
    /// <summary>
    /// Optional. Animation thumbnail as defined by sender
    /// </summary>
    property Thumb: TftPhotoSize read FThumb write FThumb;
    /// <summary>
    /// <summary>
    /// Optional. Original animation filename as defined by sender
    /// </summary>
    property FileName: String read FFileName write FFileName;
    /// <summary>
    /// Optional. MIME type of the file as defined by sender
    /// </summary>
    property MimeType: String read FMimeType write FMimeType;
    /// <summary>
    /// Optional. File size
    /// </summary>
    property FileSize: Int64 read FFileSize write FFileSize;
  end;

implementation

{ TftDocument }

constructor TftDocument.Create;
begin
  //TODO
end;

end.
