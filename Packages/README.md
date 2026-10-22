# Packages

Package groups are provided per RAD Studio version. Open the folder that
matches your compiler and build `fastTelega.Package.RTL` first, then
`fastTelega.Package.VCL`.

| RAD Studio | BDS | Folder |
|---|---|---|
| 10.2 Tokyo | 19.0 | `RAD Studio 10.2 Tokyo` |
| 10.3 Rio | 20.0 | `RAD Studio 10.3 Rio` |
| 10.4 Sydney | 21.0 | `RAD Studio 10.4 Sydney` |
| 11 Alexandria | 22.0 | `RAD Studio 11 Alexandria` |
| 12 Athens | 23.0 | `RAD Studio 12 Athens` |
| 13 Florence | 24.0 | `RAD Studio 13 Florence` |

Each folder contains:

- `fastTelega.groupproj`
- `fastTelega.Package.RTL.dpk/.dproj`
- `fastTelega.Package.VCL.dpk/.dproj`
- `Build.bat` (calls `Common/fastTelega.Build.Delphi.bat` with the BDS version)

The RTL package requires `rtl`, `RESTComponents`, `IndyCore` and
`IndyProtocols`. The VCL package requires `rtl`, `vcl` and the RTL package.

Delphi 10.3 or newer is recommended; Delphi 10.2 is the oldest provided group
and may require minor source adjustments.
