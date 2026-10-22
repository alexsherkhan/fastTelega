# Webhooks

## Status

Telegram supports two update delivery modes: long polling and webhooks.
fastTelega currently implements **long polling**.

The webhook units are scaffolds:

- `fastTelega.WebhookServer` — base class with empty `Create`/`Destroy`.
- `fastTelega.WebhookLocalServer` — placeholder.
- `fastTelega.WebhookTCPServer` — placeholder.
- `fastTelega.HttpServer`, `fastTelega.HttpParser`, `fastTelega.Url` —
  helper units used by the planned server implementation.

These classes do not listen on a socket, parse requests or call the update
handler. Do not rely on them in production.

## Registering a webhook

The Bot API method is available:

```pascal
Bot.API.SetWebhook(
  'https://example.com/telegram', // public HTTPS URL
  nil,                            // certificate (optional)
  40,                             // max connections
  nil,                            // allowed updates
  '',                             // IP address (optional)
  False,                          // drop pending updates
  SecretToken);                   // X-Telegram-Bot-Api-Secret-Token
```

Telegram requires a public HTTPS endpoint with a valid certificate. The
endpoint must answer quickly and pass the raw JSON body to the library.

## Feeding updates manually

If you implement your own HTTP endpoint, parse the request body into a
`TJSONObject` and deserialize a `TftUpdate`, then dispatch it:

```pascal
var
  JSON: TJSONObject;
  Update: TftUpdate;
begin
  JSON := TJSONObject.ParseJSONValue(Body) as TJSONObject;
  try
    Update := TJSON.JsonToObject<TftUpdate>(JSON.ToJSON);
    try
      Bot.EventHandler.HandleUpdate(Update);
    finally
      Update.Free;
    end;
  finally
    JSON.Free;
  end;
end;
```

Validate the `X-Telegram-Bot-Api-Secret-Token` header when a secret token is
configured.

## Long polling comparison

| | Long polling | Webhooks |
|---|---|---|
| Server required | No | Public HTTPS endpoint |
| Updates while offline | Stored by Telegram | Retried by Telegram |
| Latency | One request per loop | Immediate push |
| Implemented in fastTelega | Yes | No |

Use `TftLongPoll` for now. See [Getting started](GettingStarted.md).
