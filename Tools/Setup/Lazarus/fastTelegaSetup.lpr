program fastTelegaSetup;

{$mode delphi}{$H+}

uses
  SysUtils, Classes;

var
  InstallDir: String;
  SourceRoot: String;
  InstallDocs: Boolean = True;
  InstallExamples: Boolean = True;
  InstallPackages: Boolean = True;
  Uninstall: Boolean = False;
  AssumeYes: Boolean = False;
  LAnswer: String;

function PathJoin(const A, B: String): String;
begin
  Result := IncludeTrailingPathDelimiter(A) + B;
end;

function IsSkipped(const AName: String): Boolean;
begin
  Result := (AName = '.git') or (AName = '__history') or
    (AName = 'TestRunner') or (AName = 'EchoBot') or
    (ExtractFileExt(AName) = '.ppu') or (ExtractFileExt(AName) = '.o') or
    (ExtractFileExt(AName) = '.a') or (ExtractFileExt(AName) = '.or');
end;

procedure CopyFileStream(const ASource, ADest: String);
var
  LIn, LOut: TFileStream;
begin
  LIn := TFileStream.Create(ASource, fmOpenRead or fmShareDenyWrite);
  try
    ForceDirectories(ExtractFileDir(ADest));
    LOut := TFileStream.Create(ADest, fmCreate);
    try
      LOut.CopyFrom(LIn, 0);
    finally
      LOut.Free;
    end;
  finally
    LIn.Free;
  end;
end;

procedure CopyTree(const ASource, ADest: String);
var
  LRec: TSearchRec;
  LSourcePath, LDestPath: String;
begin
  if not DirectoryExists(ASource) then
    Exit;
  ForceDirectories(ADest);
  if FindFirst(PathJoin(ASource, '*'), faAnyFile, LRec) <> 0 then
    Exit;
  try
    repeat
      if (LRec.Name = '.') or (LRec.Name = '..') or IsSkipped(LRec.Name) then
        Continue;
      LSourcePath := PathJoin(ASource, LRec.Name);
      LDestPath := PathJoin(ADest, LRec.Name);
      if (LRec.Attr and faDirectory) <> 0 then
        CopyTree(LSourcePath, LDestPath)
      else
        CopyFileStream(LSourcePath, LDestPath);
    until FindNext(LRec) <> 0;
  finally
    FindClose(LRec);
  end;
end;

procedure RemoveTree(const ADir: String);
var
  LRec: TSearchRec;
  LPath: String;
begin
  if not DirectoryExists(ADir) then
    Exit;
  if FindFirst(PathJoin(ADir, '*'), faAnyFile, LRec) = 0 then
  try
    repeat
      if (LRec.Name = '.') or (LRec.Name = '..') then
        Continue;
      LPath := PathJoin(ADir, LRec.Name);
      if (LRec.Attr and faDirectory) <> 0 then
        RemoveTree(LPath)
      else
        DeleteFile(LPath);
    until FindNext(LRec) <> 0;
  finally
    FindClose(LRec);
  end;
  RemoveDir(ADir);
end;

function FindSourceRoot: String;
var
  LDir: String;
  I: Integer;
begin
  LDir := ExpandFileName(ExtractFileDir(ParamStr(0)));
  for I := 1 to 8 do
  begin
    if FileExists(PathJoin(LDir, PathJoin('Source', 'fastTelega.Bot.pas'))) and
      FileExists(PathJoin(LDir, PathJoin('Lazarus', 'fasttelega.lpk'))) then
      Exit(LDir);
    LDir := ExpandFileName(PathJoin(LDir, '..'));
  end;
  Result := GetCurrentDir;
end;

function DefaultInstallDir: String;
var
  LBase: String;
begin
  {$IFDEF Windows}
  LBase := GetEnvironmentVariable('LOCALAPPDATA');
  if LBase = '' then
    LBase := GetEnvironmentVariable('APPDATA');
  Result := PathJoin(LBase, 'fastTelega');
  {$ELSE}
    {$IFDEF Darwin}
    LBase := PathJoin(GetEnvironmentVariable('HOME'),
      PathJoin('Library', 'Application Support'));
    {$ELSE}
    LBase := GetEnvironmentVariable('XDG_DATA_HOME');
    if LBase = '' then
      LBase := PathJoin(GetEnvironmentVariable('HOME'),
        PathJoin('.local', 'share'));
    {$ENDIF}
    Result := PathJoin(LBase, 'fastTelega');
  {$ENDIF}
end;

procedure PrintHelp;
begin
  WriteLn('fastTelega universal setup');
  WriteLn;
  WriteLn('Usage: fastTelegaSetup [options]');
  WriteLn('  --dest=DIR       install directory (default: ', DefaultInstallDir, ')');
  WriteLn('  --source=DIR     repository root (auto-detected)');
  WriteLn('  --no-docs        do not copy Docs');
  WriteLn('  --no-examples    do not copy Examples');
  WriteLn('  --no-packages    do not copy Delphi Packages');
  WriteLn('  --uninstall      remove the install directory');
  WriteLn('  --yes            do not ask for confirmation');
  WriteLn('  --help           show this help');
end;

function HasPrefix(const AValue, APrefix: String): Boolean;
begin
  Result := Copy(AValue, 1, Length(APrefix)) = APrefix;
end;

procedure ParseArgs;
var
  I: Integer;
  LArg: String;
begin
  InstallDir := DefaultInstallDir;
  SourceRoot := FindSourceRoot;
  for I := 1 to ParamCount do
  begin
    LArg := ParamStr(I);
    if HasPrefix(LArg, '--dest=') then
      InstallDir := Copy(LArg, 8, Length(LArg))
    else if HasPrefix(LArg, '--source=') then
      SourceRoot := ExpandFileName(Copy(LArg, 10, Length(LArg)))
    else if LArg = '--no-docs' then
      InstallDocs := False
    else if LArg = '--no-examples' then
      InstallExamples := False
    else if LArg = '--no-packages' then
      InstallPackages := False
    else if LArg = '--uninstall' then
      Uninstall := True
    else if LArg = '--yes' then
      AssumeYes := True
    else if (LArg = '--help') or (LArg = '-h') then
    begin
      PrintHelp;
      Halt(0);
    end
    else
    begin
      WriteLn('Unknown option: ', LArg);
      PrintHelp;
      Halt(1);
    end;
  end;
end;

procedure CopyEntry(const ARelative: String; ADirectory: Boolean = False);
var
  LSource, LDest: String;
begin
  LSource := PathJoin(SourceRoot, ARelative);
  LDest := PathJoin(InstallDir, ARelative);
  if not FileExists(LSource) and not DirectoryExists(LSource) then
    Exit;
  if ADirectory or DirectoryExists(LSource) then
    CopyTree(LSource, LDest)
  else
    CopyFileStream(LSource, LDest);
end;

procedure WriteManifest;
var
  LText: TStringList;
begin
  LText := TStringList.Create;
  try
    LText.Add('fastTelega');
    LText.Add('Installed: ' + DateTimeToStr(Now));
    LText.Add('Source: ' + SourceRoot);
    LText.Add('Package: ' + PathJoin(InstallDir, PathJoin('Lazarus', 'fasttelega.lpk')));
    LText.SaveToFile(PathJoin(InstallDir, 'INSTALL.txt'));
  finally
    LText.Free;
  end;
end;

begin
  ParseArgs;
  if InstallDir = '' then
    InstallDir := DefaultInstallDir;
  InstallDir := ExpandFileName(InstallDir);

  if Uninstall then
  begin
    if not DirectoryExists(InstallDir) then
    begin
      WriteLn('Not installed: ', InstallDir);
      Halt(0);
    end;
    if not AssumeYes then
    begin
      Write('Remove ', InstallDir, '? [y/N] ');
      ReadLn(LAnswer);
      if not (LowerCase(Trim(LAnswer)) = 'y') then
      begin
        WriteLn('Cancelled.');
        Halt(0);
      end;
    end;
    RemoveTree(InstallDir);
    WriteLn('Removed ', InstallDir);
    Halt(0);
  end;

  if not FileExists(PathJoin(SourceRoot, PathJoin('Source', 'fastTelega.Bot.pas'))) then
  begin
    WriteLn('Source tree not found. Use --source=DIR.');
    Halt(1);
  end;

  WriteLn('fastTelega setup');
  WriteLn('  source: ', SourceRoot);
  WriteLn('  target: ', InstallDir);

  ForceDirectories(InstallDir);
  CopyEntry('Source', True);
  CopyEntry('Lazarus', True);
  if InstallDocs then
    CopyEntry('Docs', True);
  if InstallExamples then
    CopyEntry('Examples', True);
  if InstallPackages then
    CopyEntry('Packages', True);
  CopyEntry('LICENSE');
  CopyEntry('README.md');
  CopyEntry('CHANGELOG.md');
  CopyEntry('THIRD-PARTY-NOTICES.txt');
  CopyEntry('LICENSES', True);
  WriteManifest;

  WriteLn;
  WriteLn('Installed to ', InstallDir);
  WriteLn('Open Lazarus and install:');
  WriteLn('  ', PathJoin(InstallDir, PathJoin('Lazarus', 'fasttelega.lpk')));
  WriteLn('Then add the package to your project.');
end.
