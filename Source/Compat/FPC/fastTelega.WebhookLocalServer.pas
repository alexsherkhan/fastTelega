unit fastTelega.WebhookLocalServer;

{$mode delphi}{$H+}

interface

uses
  fastTelega.Bot, fastTelega.Events.EventHandler, fastTelega.WebhookServer;

type
  TftWebhookLocalServer = class(TftWebhookServer)
  public
    constructor Create; overload;
    constructor Create(AEventHandler: TftEventHandler); overload;
    constructor Create(ABot: TftBot); overload;
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

end.
