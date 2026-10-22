# FMX component

## TftTelegramBotFMX

`fastTelega.Fmx` provides a non-visual FireMonkey component that wraps
`TftBot`.

| Member | Type | Description |
|---|---|---|
| `Token` | `String` | Bot token (published) |
| `API` | `TftAPI` | Bot API client |
| `Events` | `TftEventBroadcaster` | Listener registry |
| `EventHandler` | `TftEventHandler` | Update dispatcher |
| `OnAnyMessage` | `TftListenerType` | Shortcut for registering a message listener |

`OnAnyMessage` is public rather than published because `TftListenerType` is an
anonymous method reference. Register other events through `Events`.

## Installation

1. Open the package group for your compiler, for example
   `Packages/RAD Studio 12 Athens/fastTelega.groupproj`.
2. Build and install `fastTelega.Package.RTL`.
3. Build and install `fastTelega.Package.FMX`.
4. The component appears on the **fastTelega** palette as
   `TftTelegramBotFMX`.

The FMX package requires `rtl`, `fmx` and the RTL package. The RTL package
supplies the API, event system and networking units.

## Example

```pascal
procedure TForm1.FormCreate(Sender: TObject);
begin
  ftTelegramBotFMX1.Token := 'YOUR_BOT_TOKEN';
  ftTelegramBotFMX1.Events.OnAnyMessage(
    procedure(const Obj: TObject)
    var
      Message: TftMessage;
    begin
      Message := TftMessage(Obj);
      ftTelegramBotFMX1.API.SendMessage(Message.Chat.Id,
        'Echo: ' + Message.Text).Free;
    end);
end;
```

Start `TftLongPoll` or `TftWebhookServer` with `ftTelegramBotFMX1.EventHandler`
and `ftTelegramBotFMX1.API`. Do not block the FMX main thread: run long
polling in a worker thread or use the webhook server, and marshal listener work
back to the UI thread with `TThread.Synchronize` or `TThread.Queue`.

## Design-time notes

`Token` is published so it can be set in the Object Inspector, but avoid
storing production tokens in a shared form file. Assign the token at runtime
instead.

## Status

The FMX component is new and has not been compiler-verified in this
repository. It uses the same `TftBot` core as the VCL component and does not
depend on VCL units.
