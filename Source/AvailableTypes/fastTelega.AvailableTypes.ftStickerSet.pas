/// <summary>
/// fastTelega ftStickerSet
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftStickerSet;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftSticker,
  fastTelega.AvailableTypes.ftDocument;

type
  TftStickerList = TObjectList<TftSticker>;
  /// <summary>
  /// Enum of possible types of a sticker.
  /// </summary>
  TftStickerSetType = (stRegular, stMask, stCustomEmoji);

  /// <summary>
  /// This object represents a sticker set.
  /// </summary>
  TftStickerSet = class(TftDocument)
  private
    FName: String;
    FTitle: String;
    FType: TftStickerSetType;
    FIsAnimated: Boolean;
    FIsVideo: Boolean;
    FStickers: TftStickerList;
  public
    // constructor Create;
    /// <summary>
    /// Sticker set name
    /// </summary>
    property Name: String read FName write FName;
    /// <summary>
    /// Sticker set title.
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Type of stickers in the set, currently one of “regular”, “mask”, “custom_emoji”
    /// </summary>
    property TypeS: TftStickerSetType read FType write FType;
    /// <summary>
    /// True, if the sticker set contains animated stickers.
    /// </summary>
    property IsAnimated: Boolean read FIsAnimated write FIsAnimated;
    /// <summary>
    /// True, if the sticker set contains video stickers
    /// </summary>
    property IsVideo: Boolean read FIsVideo write FIsVideo;
    /// <summary>
    /// List of all set stickers.
    /// </summary>
    property Stickers: TftStickerList read FStickers write FStickers;
  end;

implementation

end.
