/// <summary>
/// fastTelega ftMenuButtonDefault
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMenuButtonDefault;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

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
