/// <summary>
/// fastTelega WebhookTCPServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.WebhookTCPServer;

interface

uses
  System.SysUtils,
  System.Classes,
  fastTelega.Bot,
  fastTelega.Events.EventHandler,
  fastTelega.WebhookServer;

type
  /// <summary>
  /// Webhook server bound to all interfaces (0.0.0.0). Intended for a reverse
  /// proxy or an external TLS terminator.
  /// </summary>
  TftWebhookTCPServer = class(TftWebhookServer)
  public
    constructor Create; overload;
    constructor Create(AEventHandler: TftEventHandler); overload;
    constructor Create(ABot: TftBot); overload;
    destructor Destroy; override;
  end;

implementation

constructor TftWebhookTCPServer.Create;
begin
  inherited Create;
  Host := '0.0.0.0';
end;

constructor TftWebhookTCPServer.Create(AEventHandler: TftEventHandler);
begin
  inherited Create(AEventHandler);
  Host := '0.0.0.0';
end;

constructor TftWebhookTCPServer.Create(ABot: TftBot);
begin
  inherited Create(ABot);
  Host := '0.0.0.0';
end;

destructor TftWebhookTCPServer.Destroy;
begin
  inherited;
end;

end.
