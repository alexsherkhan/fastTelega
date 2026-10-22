# Getting started

This guide creates a console echo bot with long polling.

## 1. Create a bot and get a token

1. Open [@BotFather](https://t.me/BotFather) in Telegram.
2. Send `/newbot`, choose a name and a username.
3. Copy the HTTP API token.

Keep the token out of source control. In production, read it from an
environment variable or a configuration file.

## 2. Minimal echo bot

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
    // A webhook and long polling cannot be active at the same time.
    Bot.API.DeleteWebhook;

    Bot.Events.OnAnyMessage(
      procedure(const Obj: TObject)
      var
        Message: TftMessage;
      begin
        Message := TftMessage(Obj);
        if Message.Text = '' then
          Exit;
        Bot.API.SendMessage(Message.Chat.Id, 'Echo: ' + Message.Text);
      end);

    LongPoll := TftLongPoll.Create(Bot);
    Writeln('Long polling started. Press Ctrl+C to stop.');

    // Start blocks for one getUpdates request and dispatches the received
    // updates. Call it in a loop.
    while True do
      LongPoll.Start;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
```

`TftBot.Create` takes the token and the API base URL. `TftBot` owns the HTTP
client, `TftAPI`, the event broadcaster and the event handler.

## 3. Handle commands

Commands are messages that start with `/`. The dispatcher strips the leading
slash, the bot username suffix and the arguments:

```pascal
Bot.Events.OnCommand('start',
  procedure(const Obj: TObject)
  begin
    Bot.API.SendMessage(TftMessage(Obj).Chat.Id, 'Hello!');
  end);

Bot.Events.OnCommand('help',
  procedure(const Obj: TObject)
  begin
    Bot.API.SendMessage(TftMessage(Obj).Chat.Id,
      'Available commands: /start, /help');
  end);

Bot.Events.OnUnknownCommand(
  procedure(const Obj: TObject)
  begin
    Bot.API.SendMessage(TftMessage(Obj).Chat.Id, 'Unknown command');
  end);
```

Command names are case-sensitive. Only one listener can be registered for a
given command; registering the same command twice raises an exception from the
underlying dictionary. Use `OnCommand(TList<string>, listener)` to register a
listener for several commands.

## 4. Handle callback queries

```pascal
Bot.Events.OnCallbackQuery(
  procedure(const Obj: TObject)
  var
    Query: TftCallbackQuery;
  begin
    Query := TftCallbackQuery(Obj);
    Bot.API.AnswerCallbackQuery(Query.Id, 'Button pressed');
  end);
```

## 5. Stop and restart safely

Long polling is a blocking loop. On shutdown, stop calling `Start` and destroy
the bot. See [Known limitations](Troubleshooting.md#troubleshooting-and-known-limitations) before
freeing `TftLongPoll`: its current destructor releases objects borrowed from
`TftBot`.

## Next steps

- [Events](Events.md) — all listener types and routing rules.
- [API reference](API.md) — request methods and naming conventions.
- [File uploads](FileUploads.md) — send photos, documents and media groups.
- [Examples](Examples.md) — complete runnable projects.
