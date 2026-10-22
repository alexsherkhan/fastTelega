unit Tests.Webhook;

{$mode delphi}{$H+}

interface

uses
  SysUtils, Classes, fpcunit, testregistry, fphttpclient,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.WebhookLocalServer;

type
  TWebhookTests = class(TTestCase)
  published
    procedure TestPostUpdate;
  end;

implementation

var
  LastUpdateId: Integer = -1;

procedure OnUpdate(const AUpdate: TftUpdate);
begin
  LastUpdateId := AUpdate.UpdateId;
end;

procedure TWebhookTests.TestPostUpdate;
var
  LBot: TftBot;
  LWebhook: TftWebhookLocalServer;
  LHTTP: TFPHTTPClient;
  LBody: TStringStream;
  LResponse: String;
begin
  LastUpdateId := -1;
  LBot := TftBot.Create('', 'https://api.telegram.org');
  LWebhook := TftWebhookLocalServer.Create(LBot);
  try
    LWebhook.Port := 18100;
    LWebhook.Path := '/telegram';
    LWebhook.SecretToken := 'secret';
    LWebhook.OnUpdate := OnUpdate;
    LWebhook.Start;

    LHTTP := TFPHTTPClient.Create(nil);
    LBody := TStringStream.Create(
      '{"update_id":777,"message":{"message_id":1,' +
      '"chat":{"id":1,"type":"private"},"date":1,"text":"hi"}}');
    try
      LHTTP.AddHeader('Content-Type', 'application/json');
      LHTTP.AddHeader('X-Telegram-Bot-Api-Secret-Token', 'secret');
      LHTTP.RequestBody := LBody;
      LResponse := LHTTP.Post('http://127.0.0.1:18100/telegram');
    finally
      LHTTP.RequestBody := nil;
      LBody.Free;
      LHTTP.Free;
    end;

    AssertEquals('{"ok":true}', LResponse);
    AssertEquals(777, LastUpdateId);
  finally
    LWebhook.Stop;
    LWebhook.Free;
    LBot.Free;
  end;
end;

initialization
  RegisterTest(TWebhookTests);

end.
