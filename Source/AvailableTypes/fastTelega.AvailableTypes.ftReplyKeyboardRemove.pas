/// <summary>
/// fastTelega ftReplyKeyboardRemove
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftReplyKeyboardRemove;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftReplyBase;

type

  /// <summary>
  /// Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard.
  /// By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden
  /// immediately after the user presses a button (see ReplyKeyboardMarkup).
  /// </summary>
  TftReplyKeyboardRemove = class(TftReplyBase)
  private
    FRemoveKeyboard: Boolean;
    FSelective: Boolean;
  public
    property RemoveKeyboard: Boolean read FRemoveKeyboard write FRemoveKeyboard;
    property Selective: Boolean read FSelective write FSelective;
  end;

implementation

end.
