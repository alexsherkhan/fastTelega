/// <summary>
/// fastTelega ftInlineKeyboardMarkup
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInlineKeyboardMarkup;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftReplyBase,
  fastTelega.AvailableTypes.ftInlineKeyboardButton;

type
  TftInlineKeyboardRow = TList<TftInlineKeyboardButton>;


  /// <summary>
  /// This object represents an inline keyboard that appears right next
  /// to the message it belongs to.
  /// </summary>
  TftInlineKeyboardMarkup = class(TftReplyBase)
  private
    FInlineKeyboard: TList<TftInlineKeyboardRow>;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Array of button rows, each represented by an Array of
    /// TftInlineKeyboardButton objects
    /// </summary>
    property InlineKeyboard: TList<TftInlineKeyboardRow>
      read FInlineKeyboard write FInlineKeyboard;
  end;

implementation

{ TftInlineKeyboardMarkup }

constructor TftInlineKeyboardMarkup.Create;
begin
  FInlineKeyboard := TList<TftInlineKeyboardRow>.Create;
end;

destructor TftInlineKeyboardMarkup.Destroy;
begin
  FreeAndNil(FInlineKeyboard);
  inherited;
end;

end.
