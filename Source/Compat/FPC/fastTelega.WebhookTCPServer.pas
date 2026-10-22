unit fastTelega.WebhookTCPServer;

{$mode delphi}{$H+}

interface

uses
  fastTelega.Bot, fastTelega.Events.EventHandler, fastTelega.WebhookServer;

type
  TftWebhookTCPServer = class(TftWebhookServer)
  public
    constructor Create; overload;
    constructor Create(AEventHandler: TftEventHandler); overload;
    constructor Create(ABot: TftBot); overload;
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

end.
