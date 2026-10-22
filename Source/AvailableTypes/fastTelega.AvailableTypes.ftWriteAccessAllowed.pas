/// <summary>
/// fastTelega ftWriteAccessAllowed
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftWriteAccessAllowed;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  ///  This object represents a service message about a user allowing a bot added to the attachment menu to write messages.
  /// Currently holds no information.
  /// </summary>
  TftWriteAccessAllowed = class
  end;

implementation

end.
