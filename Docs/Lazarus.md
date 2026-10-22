# Lazarus / Free Pascal

The core library is ported to Free Pascal 3.2.2 and Lazarus. Delphi keeps the
original implementation; FPC uses compatibility shims under `Source/Compat/FPC`.

## Status

| Area | Status |
|---|---|
| Types | Compile with FPC |
| Parser | Compiles; JSON mapper verified with `TftUser` |
| API | Compiles (`TftAPI`) |
| Bot and long polling | Compiles |
| Webhook server | `TInetServer` (plain HTTP, TLS via reverse proxy) |
| LCL component | `TftTelegramBotLCL` in `Source/Components/LCL` |
| VCL/FMX components | Not included |
| Lazarus package | `Lazarus/fasttelega.lpk` |
| Example | `Lazarus/EchoBot.lpr` |

Verified with FPC 3.2.2 on Linux. Windows/Lazarus should work but is not tested.

## How it works

- `Source/Compat/FPC/System.JSON.pas` maps the Delphi JSON API to `fpjson`.
- `Rest.JSON.pas` is a placeholder; FPC uses `fastTelega.JsonMapper`.
- `fastTelega.JsonMapper.pas` is generated from the type declarations and
  fills public properties from JSON.
- `System.Net.URLClient`, `System.Net.Mime` and
  `System.Net.HttpClientComponent` are implemented on `fphttpclient`.
- Base Delphi units are selected with `{$IFDEF FPC}` in `uses` clauses.
- Generic list properties are handled by generated helpers; nested generics
  are replaced with row aliases.
- For Delphi, `Source/Delphi/fastTelega.JsonMapper.pas` keeps the
  `TJSON.JsonToObject` path.

## Build the example

```bash
cd Lazarus
./build.sh
TELEGRAM_BOT_TOKEN=... ./EchoBot
```

The build script adds `Source`, `Source/AvailableTypes`, `Source/Events`,
`Source/Helpers`, `Source/Net`, `Source/Parser` and `Source/Compat/FPC` to the
unit path.

## Lazarus package

Open `Lazarus/fasttelega.lpk` in Lazarus and build it. The package requires the
`FCL` package (`fpjson`, `fphttpclient`). It contains the core units and FPC
compatibility units. The FMX/VCL components are excluded. Webhook units use `TInetServer` and are included.

## Limitations

- FPC does not support anonymous methods in the listener type; under FPC
  `TftListenerType` is a plain procedure pointer.
- Application code must use ordinary procedures as listeners, not anonymous
  methods.
- The generator handles declared properties; fields without properties are not
  mapped.
- `TArray<T>` and `TList<T>` handling is generated per property type.
- The FPC JSON shim exposes only the subset used by the library.

## Tests

```bash
cd Tests
./build.sh
./TestRunner --all --format=plain
```

The FPCUnit suite covers the JSON mapper, parser, bot creation and long-poll
lifetime. See `Tests/README.md`.

## Regenerating the mapper

```bash
python3 Tools/generate_fpc_json_mapper.py
```
