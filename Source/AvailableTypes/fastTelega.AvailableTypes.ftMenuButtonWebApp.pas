/// <summary>
/// fastTelega ftMenuButtonWebApp
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMenuButtonWebApp;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftMenuButton,
  fastTelega.AvailableTypes.ftWebAppInfo;

type

  /// <summary>
  /// Represents a menu button, which launches a Web App.
  /// </summary>
  TftMenuButtonWebApp = class(TftMenuButton)
  private
    FText: String;
    FWebApp: TftWebAppInfo;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Text on the button
    /// </summary>
    property Text: String read FText write FText;
    /// <summary>
    /// Description of the Web App that will be launched when the user presses the button.
    /// The Web App will be able to send an arbitrary message on behalf of the user using the method Api::answerWebAppQuery.
    /// </summary>
    property WebApp: TftWebAppInfo read FWebApp write FWebApp;
  end;

implementation

{ TftMenuButtonWebApp }

constructor TftMenuButtonWebApp.Create;
begin
  FWebApp := TftWebAppInfo.Create;
end;

destructor TftMenuButtonWebApp.Destroy;
begin
  FWebApp.Free;
  inherited;
end;

end.
