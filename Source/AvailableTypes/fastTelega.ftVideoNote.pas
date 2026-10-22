/// <summary>
/// fastTelega ftVideoNote
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftVideoNote;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a video message (available in  apps as of v.4.0).
  /// </summary>
  TftVideoNote = class(TftDocument)
  private
    Flength: Integer;
    Fduration: Integer;
  public
    /// <summary>
    /// Video width and height (diameter of the video message) as defined by sender
    /// </summary>
    property Length: Integer read Flength write Flength;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read Fduration write Fduration;
  end;

implementation

end.
