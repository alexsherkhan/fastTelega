/// <summary>
/// fastTelega ftInputMedia
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputMedia;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes;

type
  /// <summary>
  /// This object represents the content of a media message to be sent.
  /// </summary>
  TftInputMedia = class
  private
    FTypeS: String;
    FMedia: String;
    FCaption: String;
    FParseMode: String;
    FCaptionEntities: TftMessageEntityList;
  public
    /// <summary>
    /// Type of the result
    /// </summary>
    property TypeS: String read FTypeS write FTypeS;
    /// <summary>
    /// File to send.
    /// Pass a fileId to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name.
    /// https://core.telegram.org/bots/api#sending-files
    /// </summary>
    property Media: String read FMedia write FMedia;
    /// <summary>
    /// Optional. Optional. Caption of the media to be be sent, 0-1024 characters after entities parsing
    /// </summary>
    property Caption: String read FCaption write FCaption;
    /// <summary>
    /// Optional. Mode for parsing entities in the media caption.
    /// See https://core.telegram.org/bots/api#formatting-options for more details.
    /// </summary>
    property ParseMode: String read FParseMode write FParseMode;
    /// <summary>
    /// Optional. List of special entities that appear in the caption, which can be specified instead of ParseMode
    /// </summary>
    property CaptionEntities: TftMessageEntityList read FCaptionEntities
      write FCaptionEntities;
  end;

implementation

end.
