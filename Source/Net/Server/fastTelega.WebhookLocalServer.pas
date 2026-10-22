/// <summary>
/// fastTelega WebhookLocalServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.WebhookLocalServer;

interface

uses
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  fastTelega.Bot,
  fastTelega.Events.EventHandler,
  fastTelega.WebhookServer;

type
  /// <summary>
  /// Webhook server bound to 127.0.0.1. Use it behind a local reverse proxy
  /// that terminates TLS.
  /// </summary>
  TftWebhookLocalServer = class(TftWebhookServer)
  public
    constructor Create; overload;
    constructor Create(AEventHandler: TftEventHandler); overload;
    constructor Create(ABot: TftBot); overload;
    destructor Destroy; override;
  end;

implementation

constructor TftWebhookLocalServer.Create;
begin
  inherited Create;
  Host := '127.0.0.1';
end;

constructor TftWebhookLocalServer.Create(AEventHandler: TftEventHandler);
begin
  inherited Create(AEventHandler);
  Host := '127.0.0.1';
end;

constructor TftWebhookLocalServer.Create(ABot: TftBot);
begin
  inherited Create(ABot);
  Host := '127.0.0.1';
end;

destructor TftWebhookLocalServer.Destroy;
begin
  inherited;
end;

end.
