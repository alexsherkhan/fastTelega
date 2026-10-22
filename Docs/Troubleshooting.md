# Troubleshooting and known limitations

## Telegram API errors

| Symptom | Cause / fix |
|---|---|
| `401 Unauthorized` | Invalid token. Check `Bot.Token`; tokens look like `123456:ABC-DEF...`. |
| `409 Conflict: terminated by other getUpdates request` | Another process is polling the same bot, or a webhook is active. Stop the other process and call `DeleteWebhook`. |
| `429 Too Many Requests` | Rate limit. Read `retry_after` from the response and slow down. |
| `400 Bad Request: chat not found` | Wrong chat id, or the bot is not a member of the chat. Usernames must include `@`. |
| `400 Bad Request: message is not modified` | Editing with identical content. Treat it as success. |

## Empty responses and swallowed exceptions

`TftHttpClient` catches all exceptions in `GET_Method`, `POST_Method` and
`POST_Method` (multipart) and returns an empty string. Consequently:

- a network failure looks like an empty response;
- Boolean methods may return `False`;
- object methods may return `nil` or an empty object;
- the actual exception is not available to the caller.

If you need diagnostics, add logging or re-raise the exception inside
`Source/Net/fastTelega.Net.HttpClient.pas`.

## Long polling stops after about five seconds

`TftHttpClient.Create` sets `ConnectionTimeout` and `ResponseTimeout` to 5000
ms. The default long-poll timeout is 10 seconds, so a blocking `getUpdates`
request can be aborted by the HTTP client before Telegram responds.

Workarounds:

- pass a long-poll timeout shorter than 5 seconds
  (`TftLongPoll.Create(Bot, 100, 3)`), or
- raise `ResponseTimeout` in `TftHttpClient` before polling, or
- add a timeout setter/property to `TftHttpClient` and set it from the API.

## Double free on shutdown

The current ownership model is inconsistent:

- `TftBot` owns `TftHttpClient`, `TftAPI`, `TftEventBroadcaster` and
  `TftEventHandler`.
- `TftAPI.Destroy` also frees the HTTP client.
- `TftLongPoll.Destroy` frees the API and event handler, which it only borrows.

Destroying a `TftLongPoll` and then the bot can therefore free the same objects
twice. For now:

- keep the long-poll object alive for the process lifetime, or
- remove the `FreeAndNil` calls for borrowed objects in
  `TftLongPoll.Destroy` and remove the HTTP client free in `TftAPI.Destroy`.

## Command parsing includes delimiter

`TftEventHandler.HandleMessage` calculates the command length with
`Copy(Text, 2, LSplitPosition)`. For `/start@MyBot` or `/start payload`, the
result still contains the `@` or space character, so the command does not match
the registered name.

Until the handler is fixed, register commands without arguments and without the
bot username suffix, or patch `Source/Events/fastTelega.Events.EventHandler.pas`:

```pascal
if (LSpacePosition = 0) and (LAtSymbolPosition = 0) then
  LCommand := Copy(Atmessage.Text, 2, Length(Atmessage.Text) - 1)
else
begin
  if LSpacePosition = 0 then
    LSplitPosition := LAtSymbolPosition
  else if LAtSymbolPosition = 0 then
    LSplitPosition := LSpacePosition
  else
    LSplitPosition := Min(LSpacePosition, LAtSymbolPosition);
  LCommand := Copy(Atmessage.Text, 2, LSplitPosition - 2);
end;
```

## Duplicate command listener

```pascal
Bot.Events.OnCommand('start', Handler1);
Bot.Events.OnCommand('start', Handler2); // raises an exception
```

The command registry is a `TDictionary<string, TftListenerType>` and holds one
listener per command. Use one listener that dispatches internally.

## Missing fields after deserialization

`Rest.JSON` matches property names case-insensitively but does not translate
`snake_case` JSON keys to PascalCase properties. If a field such as
`message_id`, `user_chat_id` or `nanostar_amount` stays empty, add a
`JSONName` attribute or rename the property to match the JSON key. See
[Types](Types.md#json-mapping).

## New Bot API models are not dispatched

`TftEventHandler` broadcasts every update through `OnUpdate`. It routes
message-like updates (message, edited message, channel post, business message,
guest message) through the command listeners and also dispatches
`InlineQuery`, `ChosenInlineResult` and `CallbackQuery`. Other update types
(`message_reaction`, `chat_boost`, `purchased_paid_media`, `managed_bot`,
`subscription`, etc.) are available only through `OnUpdate`; dedicated typed
events are not implemented yet.

## Webhooks do not work

The webhook server classes are placeholders. They do not open a socket, parse
HTTP requests or answer Telegram. Use long polling or implement the endpoint
yourself. See [Webhooks](Webhooks.md).

## VCL package does not compile

`Source/Components/VCL/fastTelega.Vcl.pas` references legacy unit names:

```pascal
fastTelega.EventBroadcaster
fastTelega.EventHandler
```

Change them to `fastTelega.Events.EventBroadcaster` and
`fastTelega.Events.EventHandler`. Also, `GetOnAnyMessage` currently has no
`Result` assignment, so the `OnAnyMessage` property needs a backing field or
should be removed.

## Build script fails

`Packages/Common/fastTelega.Build.Delphi.bat` tries to build
`fastTelega.Package.VCL.Designtime.dproj` and FMX packages that do not exist in
the repository. Build `fastTelega.Package.RTL.dproj` and
`fastTelega.Package.VCL.dproj` directly, or edit the script.

## Examples use old unit names

The included examples reference pre-1.5 units:

```
fastTelega.EventBroadcaster -> fastTelega.Events.EventBroadcaster
fastTelega.EventHandler     -> fastTelega.Events.EventHandler
fastTelega.LongPoll         -> fastTelega.Net.LongPoll
```

Update the `uses` clauses before compiling.

## Memory usage grows over time

- API methods create `TStringList` and `TMultipartFormData` request objects and
  do not free them.
- `TftLongPoll` does not free the `FAllowUpdates` list it creates.
- Returned Telegram objects and lists are owned by the caller; free them.

For long-running bots, patch the request methods to wrap argument objects in
`try..finally` blocks, or accept the leak as a known issue of the current
implementation.
