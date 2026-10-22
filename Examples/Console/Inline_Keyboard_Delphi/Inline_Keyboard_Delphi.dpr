program Inline_Keyboard_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.Generics.Collections,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;
  Keyboard: TftInlineKeyboardMarkup;
  Row0Keyboard: TList<TftInlineKeyboardButton>;
  CheckButton: TftInlineKeyboardButton;
  Response: String;

begin
  try
    Bot := TftBot.Create('BOT_TOKEN', 'https://api.telegram.org');
    Keyboard := TftInlineKeyboardMarkup.Create;
    Row0Keyboard := TList<TftInlineKeyboardButton>.Create;
    CheckButton := TftInlineKeyboardButton.Create('check');
    CheckButton.callbackData := 'check';
    Row0Keyboard.Add(CheckButton);
    Keyboard.inlineKeyboard.Add(Row0Keyboard);

    Bot.Events.OnCommand('start',
      procedure(const FTMessage: TObject)
      begin
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, 'Hi!');
      end);
    Bot.Events.OnCommand('check',
      procedure(const FTMessage: TObject)
      begin
        Response := 'ok';
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);
    Bot.Events.OnCallbackQuery(
      procedure(const Query: TObject)
      begin
        Response := 'ok';
        if Pos('check', TftCallbackQuery(Query).Data) > 0 then
        begin
          Bot.API.sendMessage(TftCallbackQuery(Query).Message.Chat.id, Response,
            false, 0, Keyboard, 'Markdown');
        end;
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
