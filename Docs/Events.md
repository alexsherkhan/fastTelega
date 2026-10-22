# Events

## Listener type

All listeners share one signature:

```pascal
type
  TftListenerType = reference to procedure(const Obj: TObject);
```

The `Obj` parameter is the concrete Telegram object (`TftMessage`,
`TftCallbackQuery`, `TftInlineQuery` or `TftChosenInlineResult`), so cast it
before use:

```pascal
Bot.Events.OnAnyMessage(
  procedure(const Obj: TObject)
  var
    Message: TftMessage;
  begin
    Message := TftMessage(Obj);
    WriteLn(Message.Text);
  end);
```

Because `TftListenerType` is a `reference to procedure`, both anonymous methods
and regular methods with a matching signature can be registered. The
broadcaster keeps references, so the captured variables stay alive as long as
the bot exists.

## Registration API

| Method | Fires for |
|---|---|
| `OnAnyMessage` | Every `Message` update, before command routing |
| `OnCommand(Name, Listener)` | Messages whose command equals `Name` |
| `OnCommand(List, Listener)` | The same listener for several command names |
| `OnUnknownCommand` | Command messages that did not match a registered command |
| `OnNonCommandMessage` | Text messages that do not start with `/` |
| `OnInlineQuery` | `InlineQuery` updates |
| `OnChosenInlineResult` | `ChosenInlineResult` updates |
| `OnCallbackQuery` | `CallbackQuery` updates |

### Commands

```pascal
Bot.Events.OnCommand('start',
  procedure(const Obj: TObject)
  begin
    Bot.API.SendMessage(TftMessage(Obj).Chat.Id, 'Welcome');
  end);

Bot.Events.OnCommand('help',
  procedure(const Obj: TObject)
  begin
    Bot.API.SendMessage(TftMessage(Obj).Chat.Id, '/start - start the bot');
  end);
```

Register several commands at once:

```pascal
var
  Commands: TList<string>;
begin
  Commands := TList<string>.Create;
  try
    Commands.Add('a');
    Commands.Add('b');
    Bot.Events.OnCommand(Commands,
      procedure(const Obj: TObject)
      begin
        // ...
      end);
  finally
    Commands.Free;
  end;
end;
```

### Inline queries and callbacks

```pascal
Bot.Events.OnInlineQuery(
  procedure(const Obj: TObject)
  begin
    // Obj is TftInlineQuery; answer with Bot.API.AnswerInlineQuery(...)
  end);

Bot.Events.OnCallbackQuery(
  procedure(const Obj: TObject)
  var
    Query: TftCallbackQuery;
  begin
    Query := TftCallbackQuery(Obj);
    Bot.API.AnswerCallbackQuery(Query.Id, 'OK');
  end);
```

## Routing rules

1. `BroadcastAnyMessage` is called first for every message.
2. If the message text is empty, routing stops.
3. If the text starts with `/`, the command name is extracted. A bare
   `/start` is routed as `start`. Commands with arguments or an `@username`
   suffix are affected by the parsing bug described in
   [Troubleshooting](Troubleshooting.md#command-parsing-includes-delimiter).
4. A registered command listener is called. If none exists,
   `OnUnknownCommand` is called.
5. Non-command text is sent to `OnNonCommandMessage`.
6. `InlineQuery`, `ChosenInlineResult` and `CallbackQuery` are dispatched
   independently before the message branch.

## Threading

Listeners run synchronously on the thread that calls
`TftLongPoll.Start`. Long-running listeners delay subsequent updates. Use your
own worker threads or queue if a handler performs blocking I/O.

## Limitations

- Command names are **case-sensitive** (`Start` does not match `start`).
- The command registry stores one listener per command name. Registering the
  same command twice raises an exception; use one listener that dispatches
  internally if you need multiple handlers.
- `TftEventHandler` handles only `Message`, `InlineQuery`,
  `ChosenInlineResult` and `CallbackQuery` updates. Edited messages, channel
  posts, business messages, chat member updates and other update types are not
  dispatched.
- `OnAnyMessage` does not fire for edited messages.
- The dispatcher does not catch exceptions raised by listeners. An exception
  propagates out of `Start` and stops the polling loop unless the caller
  handles it.
