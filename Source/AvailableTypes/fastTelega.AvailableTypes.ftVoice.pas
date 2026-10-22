/// <summary>
/// fastTelega ftVoice
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftVoice;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftDocument;

type

  /// <summary>
  /// This object represents a voice note.
  /// </summary>
  TftVoice = class(TftDocument)
  private
    FDuration: Integer;
  public
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
  end;

implementation

end.
