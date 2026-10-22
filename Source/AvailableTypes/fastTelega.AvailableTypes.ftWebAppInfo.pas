/// <summary>
/// fastTelega ftWebAppInfo
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftWebAppInfo;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// Contains information about a Web App.
  /// </summary>
  TftWebAppInfo = class
  private
    FUrl: String;
  public
    /// <summary>
    /// An HTTPS URL of a Web App to be opened with additional data as specified in https://core.telegram.org/bots/webapps#initializing-web-apps
    /// </summary>
    property Url: String read FUrl write FUrl;
  end;

implementation

end.
