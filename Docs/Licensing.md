# Licensing

## fastTelega

fastTelega is distributed under the MIT License. The full text is in
[`LICENSE`](../LICENSE).

Some source files still carry a header saying that the code is governed by a
"BSD-style license". The authoritative project license is the MIT text in
`LICENSE`; the headers are legacy and are being aligned.

## Third-party components

The installer and setup tooling include third-party components that remain
under their own licenses. They are **not** relicensed under MIT.

| Component | License | Location |
|---|---|---|
| VCL Styles Utils (Rodrigo Ruz) | MPL 1.1 | `Tools/Setup/Style/vcl-styles-plugins/Common` |
| Delphi Detours Library (Mahdi Safsafi) | MPL 1.1 | `Tools/Setup/Style/vcl-styles-plugins/Common/delphi-detours-library` |
| VCL Styles for Inno Setup (Rodrigo Ruz) | MPL 1.1 | `Tools/Setup/Style/vcl-styles-plugins/InnoSetup plugin` |
| Font Awesome 4.3.0 | SIL OFL 1.1; CC BY 3.0 for documentation/attribution | `Tools/Setup/Style/vcl-styles-plugins/Common/AwesomeFont*.RES` |
| Inno Setup | Inno Setup License | Installer, language files |
| Skia4Delphi setup scripts/assets | MIT | `Tools/Setup`, `SKIA-LICENSE` |

Full notices are in [`THIRD-PARTY-NOTICES.txt`](../THIRD-PARTY-NOTICES.txt).
License texts are in [`LICENSES`](../LICENSES):

- `MPL-1.1.txt`
- `OFL-1.1.txt`
- `Inno-Setup-License.txt`
- `Skia4Delphi-MIT.txt`

The installer displays the third-party notices after installation and installs
the license texts into `{app}\LICENSES`.

## MPL obligations

The MPL 1.1 is file-level copyleft. The MPL-covered files keep their original
copyright and license headers. Their complete source code is included in the
repository, and `Setup.Styles.dll` is distributed with a corresponding source
and a notice. Do not relicense these files as MIT.

## Redistribution checklist

- Keep `LICENSE`, `THIRD-PARTY-NOTICES.txt` and the `LICENSES` directory.
- Keep the copyright and license headers in third-party source files.
- If you modify MPL-covered files, publish the modified source under MPL 1.1.
- If you distribute the installer, keep the notices and license files with it.
- Do not use Font Awesome's name to endorse modified versions.
