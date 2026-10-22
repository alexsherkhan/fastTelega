/// <summary>
/// fastTelega ftAudio
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftAudio;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftDocument;

type

  /// <summary>
  /// This object represents an audio file to be treated as music by the  clients.
  /// </summary>
  TftAudio = class(TftDocument)
  private
    FDuration: Integer;
    FPerformer: String;
    FTitle: String;
  public
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
    /// <summary>
    /// Optional. Performer of the audio as defined by sender or by audio tags
    /// </summary>
    property Performer: String read FPerformer write FPerformer;
    /// <summary>
    /// Optional. Title of the audio as defined by sender or by audio tags
    /// </summary>
    property Title: String read FTitle write FTitle;
  end;

implementation

end.
