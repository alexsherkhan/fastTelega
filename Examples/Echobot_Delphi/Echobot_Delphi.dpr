program Echobot_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;

begin
  try
    Bot := TftBot.Create('BOT_TOKEN',
      'https://api.telegram.org');
    Bot.Events.OnCommand('start',
      procedure(const FTMessage: TObject)
      begin
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, 'Hi!');
      end);
    Bot.Events.OnAnyMessage(
      procedure(const FTMessage: TObject)
      begin
        Writeln('User wrote ', TftMessage(FTMessage).text);
        if Pos('/start', TftMessage(FTMessage).text) > 0 then
          Exit;
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id,
          'Your message is: ' + TftMessage(FTMessage).text);
      end);
    try
      Writeln('Bot username: ' + Bot.API.getMe.username);
      Bot.API.deleteWebhook();

      LongPoll := TftLongPoll.Create(Bot);
      while (True) do
      begin
        Writeln('Long poll started\n');
        LongPoll.start();
      end
    except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
