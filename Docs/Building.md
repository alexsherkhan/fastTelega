# Building

## Supported compilers

Package groups are provided for:

| RAD Studio | BDS version | Folder |
|---|---|---|
| 10.2 Tokyo | 19.0 | `Packages/RAD Studio 10.2 Tokyo` |
| 10.3 Rio | 20.0 | `Packages/RAD Studio 10.3 Rio` |
| 10.4 Sydney | 21.0 | `Packages/RAD Studio 10.4 Sydney` |
| 11 Alexandria | 22.0 | `Packages/RAD Studio 11 Alexandria` |
| 12 Athens | 23.0 | `Packages/RAD Studio 12 Athens` |
| 13 Florence | 24.0 | `Packages/RAD Studio 13 Florence` |

Delphi 10.3 or newer is recommended. The source uses `TNetHTTPClient`,
REST.JSON and Indy, which are included with these versions.

## Packages

| Project | Purpose |
|---|---|
| `Packages/RAD Studio 11 Alexandria/fastTelega.Package.RTL.dpk` | Runtime package: API, bot, parser, events, networking, types |
| `Packages/RAD Studio 11 Alexandria/fastTelega.Package.VCL.dpk` | VCL component package (`TftTelegramBot`) |

The RTL package requires `rtl`, `RESTComponents`, `IndyCore` and
`IndyProtocols`. The VCL package requires `rtl`, `vcl` and the RTL package.

Open the `fastTelega.groupproj` from the folder matching your compiler to
build both visible projects.

## Build script

`Packages/RAD Studio 11 Alexandria/Build.bat`:

1. Calls `..\Common\fastTelega.Build.Delphi.bat <BDS version>`.
2. Locates `rsvars.bat` for the requested BDS version.
3. Builds RTL and VCL with `MSBuild` for Win32/Release.

Build logs are written next to the projects as `Build.RTL.log` and
`Build.VCL.log`.

To build from a custom RAD Studio location:

```bat
Build.bat "C:\Program Files (x86)\Embarcadero\Studio\23.0"
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

The source uses anonymous methods, generics and `TNetHTTPClient`. Delphi 10.2
is the oldest provided package group; Delphi 10.3 or newer is recommended.
Older compilers may need edits.

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
