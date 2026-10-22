/// <summary>
/// fastTelega ftMenuButton
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMenuButton;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

const
  MenuButtonCommandsTYPE = 'commands';
  MenuButtonWebAppTYPE = 'web_app';
  MenuButtonDefaultTYPE = 'default';

type

  /// <summary>
  /// This abstract class is base of all bot menu buttons.
  ///
  /// This object describes the bot's menu button in a private chat.
  /// If a menu button other than MenuButtonDefault is set for a private chat, then it is applied in the chat.
  /// Otherwise the default menu button is applied.
  /// By default, the menu button opens the list of bot commands.
  /// </summary>
  TftMenuButton = class
  private
    FType: String;
  public
    /// <summary>
    /// Type of the button
    /// </summary>
    property TypeS: String read FType write FType;
  end;

implementation

end.
