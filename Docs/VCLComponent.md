# VCL component

## TftTelegramBot

`fastTelega.Components.VCL` provides a non-visual component that wraps `TftBot`.

| Property | Type | Description |
|---|---|---|
| `Token` | `String` | Bot token; assigning it updates the API client |
| `Events` | `TftEventBroadcaster` | Listener registry |
| `EventHandler` | `TftEventHandler` | Update dispatcher |
| `OnAnyMessage` | `TftListenerType` | Registers an `OnAnyMessage` listener |

The component is registered on the **fastTelega** palette by
`RegisterComponents('fastTelega', [TftTelegramBot])`.

## Installation

1. Open `Packages/RAD Studio 11 Alexandria/fastTelega.Package.VCL.dproj`.
2. Build the project.
3. Install the package and add the source directories to the library path.

## Status

The component is experimental:

- It still references legacy unit names (`fastTelega.EventBroadcaster`,
  `fastTelega.EventHandler`) instead of `fastTelega.Events.EventBroadcaster`
  and `fastTelega.Events.EventHandler`. Update the `uses` clause before
  compiling.
- `GetOnAnyMessage` currently has no return value, so the `OnAnyMessage`
  property cannot read the registered listener.
- Only `OnAnyMessage` is published; other events must be registered through
  `Events` in code.

For production code, use `TftBot` directly:

```pascal
var
  Bot: TftBot;
begin
  Bot := TftBot.Create(Token, 'https://api.telegram.org');
  try
    Bot.Events.OnAnyMessage(
      procedure(const Obj: TObject)
      begin
        // ...
      end);
  finally
    Bot.Free;
  end;
end;
```

## Design-time notes

Keep the token out of a form file if the project is shared publicly. Assign the
token at runtime, for example from an environment variable, in `FormCreate`.
