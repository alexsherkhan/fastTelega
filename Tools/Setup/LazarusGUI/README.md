# fastTelega GUI installer

LCL GUI installer for the fastTelega source tree. Works on Windows, Linux and
macOS.

## Build

Requires Lazarus 3.0+ with LCL.

```bash
./build.sh
```

## Run

```bash
./lib/x86_64-linux/FastTelegaSetupGui
```

On Windows the executable is written under `lib\<cpu>-<os>\`.

## Features

The installer follows a classic wizard layout with a left step panel:

1. Welcome
2. Destination (source and target folders)
3. Components (Docs, Examples, Delphi packages)
4. Install (summary, progress and log)
5. Finish (package path and "Open folder")

Navigation uses Back / Next / Cancel; on the Install step the Next button
becomes **Install**, on the Finish step it becomes **Finish**. Uninstall is
available from the Destination step.

The installer copies `Source`, `Lazarus`, `Docs`, `Examples`, `Packages`,
licenses and project documentation. Build artifacts are skipped.

The shared copy logic is in `../Setup.Core.pas`; the console installer in
`../Lazarus` uses the same layout.
