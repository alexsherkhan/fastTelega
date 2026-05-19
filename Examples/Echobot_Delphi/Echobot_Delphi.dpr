program Echobot_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

const
  BOT_TOKEN = 'YOUR_BOT_TOKEN_HERE';

var
  Bot: TftBot;
  LongPoll: TftLongPoll;

begin
  try
    Bot := TftBot.Create(BOT_TOKEN, 'https://api.telegram.org');

    Bot.Events.OnCommand('start',
      procedure(const FTMessage: TObject)
      begin
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.Id, 'Hi!');
      end);

    Bot.Events.OnAnyMessage(
      procedure(const FTMessage: TObject)
      var
        Msg: TftMessage;
      begin
        Msg := TftMessage(FTMessage);
        Writeln('User wrote: ' + Msg.Text);
        if Pos('/start', Msg.Text) > 0 then
          Exit;
        Bot.API.sendMessage(Msg.Chat.Id, 'Your message is: ' + Msg.Text);
      end);

    try
      Writeln('Bot username: @' + Bot.API.getMe.UserName);
      Bot.API.deleteWebhook();

      LongPoll := TftLongPoll.Create(Bot);
      try
        while True do
          LongPoll.start();
      finally
        LongPoll.Free;
      end;
    except
      on E: Exception do
        Writeln(E.ClassName + ': ' + E.Message);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName + ': ' + E.Message);
  end;
end.
