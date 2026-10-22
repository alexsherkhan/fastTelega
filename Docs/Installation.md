# Installation

## Requirements

- Windows with RAD Studio 11 Alexandria (the packages target BDS 22.0).
- Delphi RTL and REST components (`RESTComponents` is required by the RTL package).
- VCL only if you use the `TftTelegramBot` component.
- A Telegram bot token from [@BotFather](https://t.me/BotFather).

The library uses `System.Net.HttpClientComponent`, `System.Net.Mime`,
`System.Net.Socket` and `REST.JSON` from the standard Delphi installation.

## Option 1: install the RTL package

1. Open `Packages/RAD Studio 11 Alexandria/fastTelega.groupproj`.
2. Build `fastTelega.Package.RTL.dproj` (Win32 is the configured target).
3. Add the package's output directory to the IDE library path, or install the
   package from **Component > Install Packages**.
4. Add the source directories listed below to **Tools > Options > Language >
   Delphi > Library > Library path** if you compile the sources directly.

The RTL package contains the API, bot facade, event system, long polling,
parser and all type units.

## Option 2: use the sources without packages

Add these directories to the project or IDE search path:

```
Source
Source/AvailableTypes
Source/Events
Source/Helpers
Source/Net
Source/Net/Server
Source/Parser
Source/Components/VCL   (only for the VCL component)
```

Then add the units you need to the `uses` clause:

```pascal
uses
  fastTelega.Bot,
  fastTelega.Net.LongPoll,
  fastTelega.Events.EventBroadcaster,
  fastTelega.AvailableTypes;
```

The umbrella unit `fastTelega.pas` exposes the version constant and exception
classes:

```pascal
uses fastTelega;
WriteLn(FtVersion); // 1.5
```

## VCL package

`fastTelega.Package.VCL.dpk` registers `TftTelegramBot` on the `fastTelega`
palette. The component is experimental and the unit still references legacy
unit names; read [VCL component](VCLComponent.md) before installing it.

## Build script

`Packages/RAD Studio 11 Alexandria/Build.bat` calls
`Packages/Common/fastTelega.Build.Delphi.bat` and builds with MSBuild. The
script refers to VCL/FMX design-time packages that are not included in this
repository. Build the RTL/VCL projects directly or adjust the script. See
[Building](Building.md).

## Verifying the installation

Create a console application with a single unit:

```pascal
program CheckInstall;

{$APPTYPE CONSOLE}

uses
  System.SysUtils,
  fastTelega.Bot;

begin
  var Bot := TftBot.Create('YOUR_TOKEN', 'https://api.telegram.org');
  try
    var Me := Bot.API.GetMe;
    try
      WriteLn('Connected as @', Me.Username);
    finally
      Me.Free;
    end;
  finally
    Bot.Free;
  end;
end.
```

If the program prints the bot username, the units and HTTP layer are wired
correctly. A `401 Unauthorized` response means the token is wrong; see
[Troubleshooting](Troubleshooting.md).
