/// <summary>
/// fastTelega ftSticker
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftSticker;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftMaskPosition,
  fastTelega.AvailableTypes.ftDocument,
  fastTelega.AvailableTypes.ftFile;

type
  /// <summary>
  /// Enum of possible types of a sticker.
  /// </summary>
  TftStickerType = (stRegular, stMask, stCustomEmoji);

  /// <summary>
  /// This object represents a sticker.
  /// </summary>
  TftSticker = class(TftDocument)
  private
    FType: TftStickerType;
    FWidth: Integer;
    FHeight: Integer;
    FIsAnimated: Boolean;
    FIsVideo: Boolean;
    FEmoji: String;
    FSetName: String;
    FPremiumAnimation: TftFile;
    FMaskPosition: TftMaskPosition;
    FCustomEmojiId: String;
  public
    constructor Create;
    /// <summary>
    /// Type of the sticker, currently one of “regular”, “mask”, “custom_emoji”.
    /// The type of the sticker is independent from its format, which is determined by the fields isAnimated and isVideo.
    /// </summary>
    property TypeS: TftStickerType read FType write FType;
    /// <summary>
    /// Video width as defined by sender
    /// </summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>
    /// Video height as defined by sender
    /// </summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>
    /// True,if the sticker is animated
    /// </summary>
    property IsAnimated: Boolean read FIsAnimated write FIsAnimated;
    /// <summary>
    /// True, if the sticker is a video sticker
    /// </summary>
    property IsVideo: Boolean read FIsVideo write FIsVideo;
    /// <summary>
    /// Optional.Name of the sticker set to which the sticker belongs
    /// </summary>
    property Emoji: String read FEmoji write FEmoji;
    /// <summary>
    /// Optional. Name of the sticker set to which the sticker belongs.
    /// </summary>
    property SetName: String read FSetName write FSetName;
    /// <summary>
    /// Optional. For premium regular stickers, premium animation for the sticke
    /// </summary>
    property PremiumAnimation: TftFile read FPremiumAnimation
      write FPremiumAnimation;
    /// <summary>
    /// Optional.For mask stickers the position where the mask should be placed
    /// </summary>
    property MaskPosition: TftMaskPosition read FMaskPosition
      write FMaskPosition;
    /// <summary>
    /// Optional. For custom emoji stickers, unique identifier of the custom emoji
    /// </summary>
    property CustomEmojiId: String read FCustomEmojiId write FCustomEmojiId;
  end;

implementation

{ TftSticker }

constructor TftSticker.Create;
begin
  FIsAnimated := false;
end;

end.
