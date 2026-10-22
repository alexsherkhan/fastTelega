# fastTelega universal setup

Cross-platform console installer for the fastTelega source tree. A GUI
version is available in `../LazarusGUI`.

## Build

```bash
./build.sh
```

Requires FPC 3.2.2+ (no LCL dependency).

## Install

```bash
./fastTelegaSetup
./fastTelegaSetup --dest=/opt/fastTelega
./fastTelegaSetup --dest=$HOME/fastTelega --no-examples
```

Default destination follows platform conventions:

- Linux: `$XDG_DATA_HOME/fastTelega`, or `~/.local/share/fastTelega` when
  `XDG_DATA_HOME` is not set
- macOS: `~/Library/Application Support/fastTelega`
- Windows: `%LOCALAPPDATA%\fastTelega`

The installer copies:

```
Source/                  library sources
Lazarus/                 Lazarus package (fasttelega.lpk)
Docs/                    Markdown documentation
Examples/                examples
Packages/                Delphi packages
LICENSE, LICENSES/       license files
README.md, CHANGELOG.md  project docs
THIRD-PARTY-NOTICES.txt
INSTALL.txt              installation manifest
```

It skips build artifacts (`.ppu`, `.o`, `.a`, `.or`, `TestRunner`,
`EchoBot`, `.git`).

The console installer also detects `lazbuild` and registers the package when
it is available. After installation open:

```
<dest>/Lazarus/fasttelega.lpk
```

in Lazarus via **Package > Open Package File**, build it, and add it to your
project.

## Uninstall

```bash
./fastTelegaSetup --dest=/opt/fastTelega --uninstall
./fastTelegaSetup --dest=/opt/fastTelega --uninstall --yes
```

## Options

```text
--dest=DIR       install directory
--source=DIR     repository root (auto-detected)
--no-docs        skip Docs
--no-examples    skip Examples
--no-packages    skip Delphi Packages
--uninstall      remove the install directory
--yes            skip confirmation
--help           show help
```
