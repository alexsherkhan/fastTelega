# Webhooks

## Overview

fastTelega includes an HTTP webhook server based on Indy
(`TIdHTTPServer`). It receives Telegram updates over HTTP and dispatches them
through `TftEventHandler`.

The built-in server speaks **plain HTTP**. TLS is expected to be terminated by
a reverse proxy (nginx, Caddy, IIS, etc.). This keeps the library independent
of OpenSSL DLLs and certificate management.

## Quick start

```pascal
var
  Bot: TftBot;
  Webhook: TftWebhookLocalServer;
begin
  Bot := TftBot.Create(Token, 'https://api.telegram.org');
  Webhook := TftWebhookLocalServer.Create(Bot);
  try
    Webhook.Port := 8080;
    Webhook.Path := '/telegram';
    Webhook.SecretToken := 'change-me';
    Webhook.Start;

    Bot.API.SetWebhook(
      'https://bot.example.com/telegram', // public HTTPS URL
      nil,                                // certificate
      40,                                 // max connections
      nil,                                // allowed updates
      '',                                 // IP address
      False,                              // drop pending updates
      'change-me');                       // secret token

    WriteLn('Webhook listening on ', Webhook.Host, ':', Webhook.Port);
    ReadLn; // keep the process alive
  finally
    Webhook.Stop;
    Webhook.Free;
    Bot.Free;
  end;
end.
```

## Server classes

| Class | Bind address | Use case |
|---|---|---|
| `TftWebhookServer` | `127.0.0.1` by default | Base class; configure `Host` |
| `TftWebhookLocalServer` | `127.0.0.1` | Behind a local reverse proxy |
| `TftWebhookTCPServer` | `0.0.0.0` | Direct access or external proxy |

Properties:

| Property | Default | Description |
|---|---|---|
| `Host` | `127.0.0.1` | Bind address |
| `Port` | `8080` | Listening port |
| `Path` | `/telegram` | Accepted request path |
| `SecretToken` | empty | Expected `X-Telegram-Bot-Api-Secret-Token` |
| `MaxBodySize` | 1 MiB | Maximum request body size |
| `EventHandler` | `nil` | Dispatcher; set from `TftBot` |
| `OnUpdate` | `nil` | Optional direct update callback |
| `Active` | `False` | Whether the server is listening |

`Start` binds the socket and begins accepting requests. `Stop` stops accepting
new requests; requests already in progress may finish.

## Reverse proxy and TLS

Telegram requires a public HTTPS endpoint with a valid certificate. A minimal
nginx configuration:

```nginx
server {
    listen 443 ssl;
    server_name bot.example.com;

    ssl_certificate     /etc/letsencrypt/live/bot.example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/bot.example.com/privkey.pem;

    location /telegram {
        proxy_pass http://127.0.0.1:8080/telegram;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Telegram-Bot-Api-Secret-Token $http_x_telegram_bot_api_secret_token;
    }
}
```

Keep the webhook server bound to `127.0.0.1` and expose only the proxy. Do not
expose port 8080 to the internet.

## Dispatch and threading

For every valid POST request the server:

1. validates the path and secret token;
2. parses the JSON body into `TftUpdate`;
3. calls `OnUpdate` if assigned;
4. calls `EventHandler.HandleUpdate` if assigned (this broadcasts `OnUpdate`
   and the typed events);
5. frees the update and returns `{"ok":true}`.

Indy handles requests on worker threads. Listeners therefore run on an Indy
thread, not on the main thread. In VCL/FMX applications, synchronize UI access
with `TThread.Synchronize` or `TThread.Queue`.

## Error responses

| Status | Reason |
|---|---|
| `200` | Update accepted (also returned for GET health checks) |
| `400` | Empty or invalid JSON body |
| `403` | Secret token mismatch |
| `404` | Wrong request path |
| `413` | Body larger than `MaxBodySize` |
| `405` | Not used; non-POST requests get a health response |

## Switching back to long polling

Call `DeleteWebhook`, stop the server and start `TftLongPoll`:

```pascal
Bot.API.DeleteWebhook;
Webhook.Stop;
```

A webhook and long polling cannot be active for the same bot at the same time.
