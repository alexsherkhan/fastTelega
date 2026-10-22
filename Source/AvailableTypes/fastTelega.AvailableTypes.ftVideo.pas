/// <summary>
/// fastTelega ftVideo
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftVideo;

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
  /// This object represents a video file.
  /// </summary>
  TftVideo = class(TftDocument)
  private
    FWidth: Integer;
    FHeight: Integer;
    FDuration: Integer;
  public
    /// <summary>
    /// Video width as defined by sender
    /// </summary>
    property Width: Integer read FWidth write FWidth;
    /// <summary>
    /// Video height as defined by sender
    /// </summary>
    property Height: Integer read FHeight write FHeight;
    /// <summary>
    /// Duration of the video in seconds as defined by sender
    /// </summary>
    property Duration: Integer read FDuration write FDuration;
  end;

implementation

end.
