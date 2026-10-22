/// <summary>
/// fastTelega ftInlineKeyboardMarkup
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInlineKeyboardMarkup;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftReplyBase,
  fastTelega.AvailableTypes.ftInlineKeyboardButton;

type

  /// <summary>
  /// This object represents an inline keyboard that appears right next
  /// to the message it belongs to.
  /// </summary>
  TftInlineKeyboardMarkup = class(TftReplyBase)
  private
    FInlineKeyboard: TList<TList<TftInlineKeyboardButton>>;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Array of button rows, each represented by an Array of
    /// TftInlineKeyboardButton objects
    /// </summary>
    property InlineKeyboard: TList < TList < TftInlineKeyboardButton >>
      read FInlineKeyboard write FInlineKeyboard;
  end;

implementation

{ TftInlineKeyboardMarkup }

constructor TftInlineKeyboardMarkup.Create;
begin
  FInlineKeyboard := TList < TList < TftInlineKeyboardButton >>.Create;
end;

destructor TftInlineKeyboardMarkup.Destroy;
begin
  FreeAndNil(FInlineKeyboard);
  inherited;
end;

end.
