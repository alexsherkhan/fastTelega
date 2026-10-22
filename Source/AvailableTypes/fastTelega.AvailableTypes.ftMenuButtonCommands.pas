/// <summary>
/// fastTelega ftMenuButtonCommands
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMenuButtonCommands;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftMenuButton;

type

  /// <summary>
  /// Represents a menu button, which opens the bot's list of commands.
  /// </summary>
  TftMenuButtonCommands = class(TftMenuButton)
  public
    /// <summary>
    /// Type of the button
    /// </summary>
    property TypeS;
  end;
implementation

end.
