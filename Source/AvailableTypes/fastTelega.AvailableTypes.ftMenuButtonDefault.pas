/// <summary>
/// fastTelega ftMenuButtonDefault
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMenuButtonDefault;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftMenuButton;

type

  /// <summary>
  /// Describes that no specific value for the menu button was set.
  /// </summary>
  TftMenuButtonDefault = class(TftMenuButton)
  public
    /// <summary>
    /// Type of the button
    /// </summary>
    property TypeS;
  end;

implementation

end.
