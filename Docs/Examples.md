# Examples

## Included projects

| Path | Description |
|---|---|
| `Examples/Console/Echobot_Delphi` | Console echo bot |
| `Examples/Console/Inline_Keyboard_Delphi` | Inline keyboard example |
| `Examples/Console/Reply_Keyboard_Delphi` | Reply keyboard example |
| `Examples/VCL/Echobot_Delphi_VCL` | VCL echo bot |
| `Project/fastTelegaDesignerBotMVC` | DesignerBot MVC application |
| `Project/MenuBot` | Menu editor sample |

The console and VCL examples were written against the pre-1.5 unit names.
They reference `fastTelega.EventBroadcaster`, `fastTelega.EventHandler` and
`fastTelega.LongPoll`; the current names are:

```
fastTelega.Events.EventBroadcaster
fastTelega.Events.EventHandler
fastTelega.Net.LongPoll
```

Update the `uses` clauses when opening the examples.

## Corrected console echo bot

```pascal
program EchoBot;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.Net.LongPoll;

var
  Bot: TftBot;
  LongPoll: TftLongPoll;

begin
  Bot := TftBot.Create('YOUR_BOT_TOKEN', 'https://api.telegram.org');
  try
    Bot.API.DeleteWebhook;

    Bot.Events.OnCommand('start',
      procedure(const Obj: TObject)
      begin
        Bot.API.SendMessage(TftMessage(Obj).Chat.Id, 'Welcome!').Free;
      end);

    Bot.Events.OnAnyMessage(
      procedure(const Obj: TObject)
      var
        Message: TftMessage;
      begin
        Message := TftMessage(Obj);
        if Message.Text = '' then
          Exit;
        if Message.Text.StartsWith('/start') then
          Exit;
        Bot.API.SendMessage(Message.Chat.Id, 'Echo: ' + Message.Text).Free;
      end);

    LongPoll := TftLongPoll.Create(Bot);
    while True do
      LongPoll.Start;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
```

`Message.Text.StartsWith` requires a recent Delphi RTL; use `Pos('/start',
Message.Text) = 1` if you target an older compiler.

## Inline keyboard

```pascal
var
  Markup: TftInlineKeyboardMarkup;
  Row: TList<TftInlineKeyboardButton>;
  Button: TftInlineKeyboardButton;
begin
  Markup := TftInlineKeyboardMarkup.Create;
  Row := TList<TftInlineKeyboardButton>.Create;
  Button := TftInlineKeyboardButton.Create('Click me');
  Button.CallbaCkData := 'click';
  Row.Add(Button);
  Markup.InlineKeyboard.Add(Row);
  try
    Bot.API.SendMessage(ChatId, 'Choose:', False, 0, Markup).Free;
  finally
    Button.Free;
    Row.Free;
    Markup.Free;
  end;
end;
```

`TftInlineKeyboardMarkup.Destroy` frees the list of rows but not the row lists
or buttons, hence the explicit `Button.Free` and `Row.Free`. Note the current
property spelling `CallbaCkData`.

## VCL example

The VCL example drops a `TftTelegramBot` component on a form. Because the
component is experimental (see [VCL component](VCLComponent.md)), the
recommended approach is to create `TftBot` in code and keep the form free of
blocking long-poll code. Run `TftLongPoll.Start` in a worker thread or a timer
that performs one request per tick.
