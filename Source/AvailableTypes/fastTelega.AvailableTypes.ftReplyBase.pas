/// <summary>
/// fastTelega ftReplyBase
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftReplyBase;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This abstract class is base of all keyboard related events.
  /// </summary>
  TftReplyBase = class
  end;

implementation

end.
