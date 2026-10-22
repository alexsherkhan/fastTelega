/// <summary>
/// fastTelega ftChatPhoto
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftChatPhoto;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents a chat photo.
  /// </summary>
  TftChatPhoto = class
  private
    FSmallFileId: String;
    FSmallFileUniqueId: String;
    FBigFileId: String;
    FBigFileUniqueId: String;
  public
    /// <summary>
    /// File identifier of small (160x160) chat photo. This file_id can be
    /// used only for photo download and only for as long as the photo
    /// is not changed.
    /// </summary>
    property SmallFileId: String read FSmallFileId write FSmallFileId;
    /// <summary>
    /// Unique file identifier of small (160x160) chat photo, which is
    /// supposed to be the same over time and for different bots.
    /// Can't be used to download or reuse the file.
    /// </summary>
    property SmallFileUniqueId: String read FSmallFileUniqueId
      write FSmallFileUniqueId;
    /// <summary>
    /// File identifier of big (640x640) chat photo. This file_id can be used
    /// only for photo download and only for as long as the photo
    /// is not changed.
    /// </summary>
    property BigFileId: String read FBigFileId write FBigFileId;
    /// <summary>
    /// Unique file identifier of big (640x640) chat photo, which is
    /// supposed to be the same over time and for different bots. Can't be
    /// used to download or reuse the file.
    /// </summary>
    property BigFileUniqueId: String read FBigFileUniqueId
      write FBigFileUniqueId;
  end;

implementation

end.
