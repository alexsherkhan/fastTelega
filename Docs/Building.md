# Building

## Packages

| Project | Purpose |
|---|---|
| `Packages/RAD Studio 11 Alexandria/fastTelega.Package.RTL.dpk` | Runtime package: API, bot, parser, events, networking, types |
| `Packages/RAD Studio 11 Alexandria/fastTelega.Package.VCL.dpk` | VCL component package (`TftTelegramBot`) |

The RTL package requires `rtl`, `RESTComponents`, `IndyCore` and
`IndyProtocols`. The VCL package requires `rtl`, `vcl` and the RTL package.

Open `fastTelega.groupproj` to build both visible projects.

## Build script

`Packages/RAD Studio 11 Alexandria/Build.bat`:

1. Calls `..\Common\fastTelega.Build.Delphi.bat 22.0`.
2. Locates `rsvars.bat` for BDS 22.0 (RAD Studio 11 Alexandria).
3. Builds RTL and VCL with `MSBuild` for Win32/Release.

The shared script also attempts to build VCL design-time and FMX packages that
are not present in this repository. Either add those projects or build the RTL
and VCL `.dproj` files directly. Build logs are written next to the projects as
`Build.RTL.log` and `Build.VCL.log`.

To build from a custom RAD Studio location:

```bat
Build.bat "C:\Program Files (x86)\Embarcadero\Studio\22.0"
```

## Manual build

From a RAD Studio command prompt:

```bat
msbuild fastTelega.Package.RTL.dproj /p:Config=Release /p:Platform=Win32
msbuild fastTelega.Package.VCL.dproj /p:Config=Release /p:Platform=Win32
```

For Win64, add `Platform=Win64` and ensure all dependencies support the target
platform. The library itself uses `System.Net` and REST components, which are
available on both Win32 and Win64.

## Compiler compatibility

The package projects target Delphi 11 Alexandria. The source uses language
features such as anonymous methods, generics, inline variables in examples and
`TNetHTTPClient`, so Delphi 10.3 or newer is recommended. Older compilers may
need edits.

## Component resources

`Assets/Resources/Components.dcr` contains the component palette icons. Rebuild
it with `Assets/Resources/BuildResources.bat` if you change the resources. The
`.rc` file and PNG/BMP sources are in `Assets/Resources`.

## Installer

The Inno Setup project is in `Tools/Setup/Setup.iss`. It packages the source,
examples, packages and assets and displays the third-party notices. The
installer supports English and Brazilian Portuguese.

Third-party license texts are installed under `{app}\LICENSES`; see
[Licensing](Licensing.md).

## Continuous integration

No CI configuration is included. A minimal build check can run the two `msbuild`
commands above on a Windows agent with RAD Studio installed.
