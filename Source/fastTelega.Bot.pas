/// <summary>
/// fastTelega Bot
/// Alexander Syrykh
/// </summary>
unit fastTelega.Bot;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.Net.HttpClient,
  fastTelega.API,
  fastTelega.Events.EventBroadcaster,
  fastTelega.Events.EventHandler;

type
  /// <summary>
  /// This object holds other objects specific for this bot instance.
  /// </summary>
  TftBot = class
  private
    FHttpClient: TftHTTPClient;
    FToken: String;
    FAPI: TftAPI;
    FEventBroadcaster: TftEventBroadcaster;
    FEventHandler: TftEventHandler;
    function GetHttpClient: TftHTTPClient;
    function GetToken: String;
    function GetEventBroadcaster: TftEventBroadcaster;
    function GetEventHandler: TftEventHandler;
    procedure SetToken(const Value: String);
  public
    constructor Create(AToken: String; AURL: String);
    destructor Destroy; override;

    /// <summary>
    /// Token for accessing api.
    /// </summary>
    property Token: String read GetToken write SetToken;
    /// <summary>
    /// Object which can execute Telegram Bot API methods.
    /// </summary>
    property API: TftAPI read FAPI;
    /// <summary>
    /// Object which holds all event listeners.
    /// </summary>
    property Events: TftEventBroadcaster read GetEventBroadcaster;
    /// <summary>
    /// Object which handles new update objects.
    /// Usually it's only needed for TftLongPoll, TftWebhookLocalServer
    /// and TftWebhookTcpServer objects.
    /// </summary>
    property EventHandler: TftEventHandler read GetEventHandler;
  end;

implementation

{ TftBot }

constructor TftBot.Create(AToken: String; AURL: String);
begin
  FHttpClient := TftHTTPClient.Create;
  FToken := AToken;
  FAPI := TftAPI.Create(FToken, FHttpClient, AURL);
  FEventBroadcaster := TftEventBroadcaster.Create;
  FEventHandler := TftEventHandler.Create(Events);
end;

destructor TftBot.Destroy;
begin
  FreeAndNil(FEventHandler);
  FreeAndNil(FAPI);
  FreeAndNil(FHttpClient);
  FreeAndNil(FEventBroadcaster);
  inherited;
end;

function TftBot.GetEventBroadcaster: TftEventBroadcaster;
begin
  Result := FEventBroadcaster;
end;

function TftBot.GetEventHandler: TftEventHandler;
begin
  Result := FEventHandler;
end;

function TftBot.GetHttpClient: TftHTTPClient;
begin
  Result := FHttpClient;
end;

function TftBot.GetToken: String;
begin
  Result := FToken;
end;

procedure TftBot.SetToken(const Value: String);
begin
  FToken := Value;
  FAPI.Token := Value;
end;

end.
