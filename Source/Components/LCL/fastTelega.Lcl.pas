unit fastTelega.Lcl;

{$mode delphi}{$H+}

interface

uses
  SysUtils, Classes,
  fastTelega.API,
  fastTelega.Bot,
  fastTelega.Events.EventBroadcaster,
  fastTelega.Events.EventHandler;

type
  /// <summary>
  /// Non-visual Lazarus/LCL component wrapping TftBot.
  /// </summary>
  TftTelegramBotLCL = class(TComponent)
  private
    FBot: TftBot;
    FOnAnyMessage: TftListenerType;
    function GetToken: String;
    procedure SetToken(const Value: String);
    function GetAPI: TftAPI;
    function GetEvents: TftEventBroadcaster;
    function GetEventHandler: TftEventHandler;
    function GetOnAnyMessage: TftListenerType;
    procedure SetOnAnyMessage(const Value: TftListenerType);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property API: TftAPI read GetAPI;
    property Events: TftEventBroadcaster read GetEvents;
    property EventHandler: TftEventHandler read GetEventHandler;
    property OnAnyMessage: TftListenerType read GetOnAnyMessage
      write SetOnAnyMessage;
  published
    property Token: String read GetToken write SetToken;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('fastTelega', [TftTelegramBotLCL]);
end;

constructor TftTelegramBotLCL.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBot := TftBot.Create('', 'https://api.telegram.org');
end;

destructor TftTelegramBotLCL.Destroy;
begin
  FreeAndNil(FBot);
  inherited;
end;

function TftTelegramBotLCL.GetToken: String;
begin
  Result := FBot.Token;
end;

procedure TftTelegramBotLCL.SetToken(const Value: String);
begin
  FBot.Token := Value;
end;

function TftTelegramBotLCL.GetAPI: TftAPI;
begin
  Result := FBot.API;
end;

function TftTelegramBotLCL.GetEvents: TftEventBroadcaster;
begin
  Result := FBot.Events;
end;

function TftTelegramBotLCL.GetEventHandler: TftEventHandler;
begin
  Result := FBot.EventHandler;
end;

function TftTelegramBotLCL.GetOnAnyMessage: TftListenerType;
begin
  Result := FOnAnyMessage;
end;

procedure TftTelegramBotLCL.SetOnAnyMessage(const Value: TftListenerType);
begin
  FOnAnyMessage := Value;
  if Assigned(Value) then
    FBot.Events.OnAnyMessage(Value);
end;

initialization
  Register;

end.
