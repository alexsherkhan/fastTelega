/// <summary>
/// fastTelega FireMonkey component
/// Alexander Syrykh
/// </summary>
unit fastTelega.Fmx;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

  {FireMonkey}
  FMX.Controls,
  FMX.Types,

  {fastTelega}
  fastTelega.API,
  fastTelega.Bot,
  fastTelega.Events.EventBroadcaster,
  fastTelega.Events.EventHandler;

type
  /// <summary>
  /// Non-visual FireMonkey component that wraps TftBot.
  /// </summary>
  TftTelegramBotFMX = class(TComponent)
  private
    FBot: TftBot;
    FOnAnyMessage: TftListenerType;
    function GetToken: String;
    procedure SetToken(const Value: String);
    function GetAPI: TftAPI;
    function GetEventBroadcaster: TftEventBroadcaster;
    function GetEventHandler: TftEventHandler;
    function GetOnAnyMessage: TftListenerType;
    procedure SetOnAnyMessage(const Value: TftListenerType);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    /// <summary>
    /// Object which can execute Telegram Bot API methods.
    /// </summary>
    property API: TftAPI read GetAPI;
    /// <summary>
    /// Object which holds all event listeners.
    /// </summary>
    property Events: TftEventBroadcaster read GetEventBroadcaster;
    /// <summary>
    /// Object which handles new updates.
    /// </summary>
    property EventHandler: TftEventHandler read GetEventHandler;
    /// <summary>
    /// Shortcut for registering an OnAnyMessage listener.
    /// The property is public rather than published because listener types are
    /// anonymous method references.
    /// </summary>
    property OnAnyMessage: TftListenerType read GetOnAnyMessage
      write SetOnAnyMessage;
  published
    /// <summary>
    /// Bot token. Assign it at runtime; avoid storing production tokens in
    /// the form file.
    /// </summary>
    property Token: String read GetToken write SetToken;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('fastTelega', [TftTelegramBotFMX]);
end;

{ TftTelegramBotFMX }

constructor TftTelegramBotFMX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBot := TftBot.Create('', 'https://api.telegram.org');
end;

destructor TftTelegramBotFMX.Destroy;
begin
  FreeAndNil(FBot);
  inherited;
end;

function TftTelegramBotFMX.GetAPI: TftAPI;
begin
  Result := FBot.API;
end;

function TftTelegramBotFMX.GetToken: String;
begin
  Result := FBot.Token;
end;

procedure TftTelegramBotFMX.SetToken(const Value: String);
begin
  FBot.Token := Value;
end;

function TftTelegramBotFMX.GetEventBroadcaster: TftEventBroadcaster;
begin
  Result := FBot.Events;
end;

function TftTelegramBotFMX.GetEventHandler: TftEventHandler;
begin
  Result := FBot.EventHandler;
end;

function TftTelegramBotFMX.GetOnAnyMessage: TftListenerType;
begin
  Result := FOnAnyMessage;
end;

procedure TftTelegramBotFMX.SetOnAnyMessage(const Value: TftListenerType);
begin
  FOnAnyMessage := Value;
  if Assigned(Value) then
    FBot.Events.OnAnyMessage(Value);
end;

end.
