# Unit tests

FPCUnit tests for the Free Pascal build.

## Run

```bash
./build.sh
./TestRunner --all --format=plain
```

## Coverage

- JSON mapper: `TftUser`, nested `TftMessage`, missing fields, arrays of objects.
- Parser: valid/invalid JSON, `TftUser`, `TftMessage`, user serialization.
- Bot: creation, API/events/handler wiring, long-poll lifetime, listener registration.

The suite currently has 12 tests. It targets FPC 3.2.2 and the
`Source/Compat/FPC` shims. Delphi builds use `Rest.JSON` and are tested
separately in RAD Studio.
