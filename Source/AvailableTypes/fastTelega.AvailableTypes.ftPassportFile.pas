/// <summary>
/// fastTelega ftPassportFile
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportFile;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a file uploaded to Telegram Passport.
  /// Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB.
  /// </summary>
  TftPassportFile = class
  private
    FFileId: String;
    FFileUniqueId: String;
    FFileSize: Integer;
    FFileDate: Integer;
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
    /// File size
    /// </summary>
    property FileSize: Integer read FFileSize write FFileSize;

    /// <summary>
    /// Unix time when the file was uploaded
    /// </summary>
    property FileDate: Integer read FFileDate write FFileDate;
  end;

implementation

end.
