/// <summary>
/// fastTelega ftForumTopicClosed
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftForumTopicClosed;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a service message about a forum topic closed in the chat.
  /// Currently holds no information.
  /// </summary>
  TftForumTopicClosed = class
  end;

implementation

end.
