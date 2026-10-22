program EchoBot;

{$mode delphi}{$H+}

uses
  SysUtils,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.Net.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;

procedure OnMessage(const Obj: TObject);
var
  Message: TftMessage;
begin
  Message := TftMessage(Obj);
  if Message.Text <> '' then
    Bot.API.SendMessage(Message.Chat.Id, 'Echo: ' + Message.Text).Free;
end;

begin
  Bot := TftBot.Create(GetEnvironmentVariable('TELEGRAM_BOT_TOKEN'),
    'https://api.telegram.org');
  try
    Bot.API.DeleteWebhook;
    Bot.Events.OnAnyMessage(OnMessage);
    LongPoll := TftLongPoll.Create(Bot, 100, 3);
    try
      while True do
        LongPoll.Start;
    finally
      LongPoll.Free;
    end;
  finally
    Bot.Free;
  end;
end.
