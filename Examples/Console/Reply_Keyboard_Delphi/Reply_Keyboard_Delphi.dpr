program Reply_Keyboard_Delphi;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;
  Response: String;
  KeyboardOneCol: TftReplyKeyboardMarkup;
  strArray: TArray<string>;
  KeyboardWithLayout: TftReplyKeyboardMarkup;

procedure OneColumnKeyboard(ButtonStrings: TArray<String>;
  Kb: TftReplyKeyboardMarkup);
var
  I: Integer;
  Row: TList<TftKeyboardButton>;
  Button: TftKeyboardButton;
begin
  for I := 0 to Length(ButtonStrings) - 1 do
  begin
    Row := TList<TftKeyboardButton>.Create;
    Button := TftKeyboardButton.Create(ButtonStrings[I]);
    Row.Add(Button);
    Kb.Keyboard.Add(Row);
  end;
end;

procedure Keyboard(ButtonLayout: TArray<TArray<String>>;
  Kb: TftReplyKeyboardMarkup);
var
  I, J: Integer;
  Row: TList<TftKeyboardButton>;
  Button: TftKeyboardButton;
begin
  for I := 0 to Length(ButtonLayout) - 1 do
  begin
    Row := TList<TftKeyboardButton>.Create;
    for J := 0 to Length(ButtonLayout[I]) - 1 do
    begin
      Button := TftKeyboardButton.Create(ButtonLayout[I][J]);
      Row.Add(Button);
    end;
    Kb.Keyboard.Add(Row);
  end;
end;

begin
  try
    Bot := TftBot.Create('BOT_TOKEN',
      'https://api.telegram.org');
    KeyboardOneCol := TftReplyKeyboardMarkup.Create;
    strArray := ['Option 1', 'Option 2', 'Option 3'];
    OneColumnKeyboard(strArray, KeyboardOneCol);

    KeyboardWithLayout := TftReplyKeyboardMarkup.Create;
    Keyboard([['Dog', 'Cat', 'Mouse'], ['Green', 'White', 'Red'], ['On', 'Off'],
      ['Back'], ['Info', 'About', 'Map', 'Etc']], KeyboardWithLayout);

    Bot.Events.OnCommand('start',
      procedure(const FTMessage: TObject)
      begin
        Response :=
          '/start for one column keyboard\n/layout for a more complex keyboard';
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          KeyboardOneCol, 'Markdown');
      end);

    Bot.Events.OnCommand('layout',
      procedure(const FTMessage: TObject)
      begin
        Response :=
          '/start for one column keyboard\n/layout for a more complex keyboard';
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          KeyboardWithLayout, 'Markdown');
      end);
    Bot.Events.OnAnyMessage(
      procedure(const FTMessage: TObject)
      begin
        Writeln('User wrote ', TftMessage(FTMessage).text);
        if (Pos('/start', TftMessage(FTMessage).text) > 0) or
          (Pos('/layout', TftMessage(FTMessage).text) > 0) then
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
