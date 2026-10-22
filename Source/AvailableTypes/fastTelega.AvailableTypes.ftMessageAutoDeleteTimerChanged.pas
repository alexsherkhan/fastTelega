/// <summary>
/// fastTelega ftMessageAutoDeleteTimerChanged
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMessageAutoDeleteTimerChanged;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents a service message about a change in auto-delete timer settings.
  /// </summary>
  TftMessageAutoDeleteTimerChanged = class
  private
    FMessageAutoDeleteTime: String;
  public
    /// <summary>
    /// New auto-delete time for messages in the chat
    /// </summary>
    property MessageAutoDeleteTime: String read FMessageAutoDeleteTime
      write FMessageAutoDeleteTime;
  end;

implementation

end.
