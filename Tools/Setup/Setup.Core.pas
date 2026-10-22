unit Setup.Core;

{$mode delphi}{$H+}

interface

uses
  SysUtils, Classes, Process;

type
  TSetupOptions = record
    SourceRoot: String;
    InstallDir: String;
    Docs: Boolean;
    Examples: Boolean;
    Packages: Boolean;
    InstallLazarus: Boolean;
  end;

function PathJoin(const A, B: String): String;
function DefaultInstallDir: String;
function FindSourceRoot: String;
function IsSourceRoot(const ADir: String): Boolean;
function Install(const AOptions: TSetupOptions; out AError: String): Boolean;
function Uninstall(const AInstallDir: String; out AError: String): Boolean;
function PackagePath(const AInstallDir: String): String;
function FindLazbuild: String;
function RegisterLazarusPackage(const ALpkFile: String;
  out AOutput, AError: String): Boolean;

implementation

function FindInPath(const AName: String): String;
var
  LPath, LDir, LFile: String;
  LPos: Integer;
begin
  Result := '';
  LPath := GetEnvironmentVariable('PATH');
  while LPath <> '' do
  begin
    LPos := Pos(PathSeparator, LPath);
    if LPos > 0 then
    begin
      LDir := Copy(LPath, 1, LPos - 1);
      Delete(LPath, 1, LPos);
    end
    else
    begin
      LDir := LPath;
      LPath := '';
    end;
    if LDir <> '' then
    begin
      LFile := PathJoin(LDir, AName);
      {$IFDEF Windows}
      if FileExists(LFile + '.exe') then
        Exit(LFile + '.exe');
      {$ENDIF}
      if FileExists(LFile) then
        Exit(LFile);
    end;
  end;
end;

function FindLazbuild: String;
const
  {$IFDEF Windows}
  CCandidates: array[0..3] of String = (
    'C:\Lazarus\lazbuild.exe',
    'C:\Program Files\Lazarus\lazbuild.exe',
    'C:\Program Files (x86)\Lazarus\lazbuild.exe',
    '');
  {$ELSE}
  {$IFDEF Darwin}
  CCandidates: array[0..3] of String = (
    '/Applications/Lazarus/lazbuild',
    '/usr/local/bin/lazbuild',
    '/opt/homebrew/bin/lazbuild',
    '');
  {$ELSE}
  CCandidates: array[0..3] of String = (
    '/usr/bin/lazbuild',
    '/usr/local/bin/lazbuild',
    '/opt/lazarus/lazbuild',
    '');
  {$ENDIF}
  {$ENDIF}
var
  I: Integer;
begin
  Result := GetEnvironmentVariable('LAZBUILD');
  if (Result <> '') and FileExists(Result) then
    Exit;
  Result := FindInPath('lazbuild');
  if Result <> '' then
    Exit;
  for I := Low(CCandidates) to High(CCandidates) do
    if (CCandidates[I] <> '') and FileExists(CCandidates[I]) then
      Exit(CCandidates[I]);
  Result := '';
end;

function RunProcess(const AExecutable: String; const AArgs: array of String;
  out AOutput, AError: String): Integer;
var
  LProcess: TProcess;
  LBuffer: array[0..4095] of Byte;
  LRead: LongInt;
  I: Integer;
begin
  Result := -1;
  AOutput := '';
  AError := '';
  LProcess := TProcess.Create(nil);
  try
    LProcess.Executable := AExecutable;
    for I := Low(AArgs) to High(AArgs) do
      LProcess.Parameters.Add(AArgs[I]);
    LProcess.Options := [poUsePipes, poWaitOnExit];
    {$IFDEF Windows}
    LProcess.Options := LProcess.Options + [poNoConsole];
    {$ENDIF}
    try
      LProcess.Execute;
      repeat
        LRead := LProcess.Output.Read(LBuffer, SizeOf(LBuffer));
        if LRead > 0 then
          SetLength(AOutput, Length(AOutput) + LRead);
        if LRead > 0 then
          Move(LBuffer, AOutput[Length(AOutput) - LRead + 1], LRead);
      until LRead = 0;
      Result := LProcess.ExitCode;
    except
      on E: Exception do
      begin
        AError := E.Message;
        Result := -1;
      end;
    end;
  finally
    LProcess.Free;
  end;
end;

function RegisterLazarusPackage(const ALpkFile: String;
  out AOutput, AError: String): Boolean;
var
  LLazbuild: String;
  LCode: Integer;
begin
  Result := False;
  AOutput := '';
  AError := '';
  LLazbuild := FindLazbuild;
  if LLazbuild = '' then
  begin
    AError := 'lazbuild not found; install Lazarus or add lazbuild to PATH';
    Exit;
  end;
  LCode := RunProcess(LLazbuild, ['--add-package-link', ALpkFile],
    AOutput, AError);
  if LCode <> 0 then
  begin
    AError := 'lazbuild --add-package-link failed: ' + AError;
    Exit;
  end;
  LCode := RunProcess(LLazbuild, ['--add-package', 'fasttelega'],
    AOutput, AError);
  if LCode <> 0 then
  begin
    AError := 'lazbuild --add-package failed: ' + AError;
    Exit;
  end;
  Result := True;
end;


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

function IsSourceRoot(const ADir: String): Boolean;
begin
  Result := FileExists(PathJoin(ADir, PathJoin('Source', 'fastTelega.Bot.pas'))) and
    FileExists(PathJoin(ADir, PathJoin('Lazarus', 'fasttelega.lpk')));
end;

function FindSourceRoot: String;
var
  LDir: String;
  I: Integer;
begin
  LDir := ExpandFileName(ExtractFileDir(ParamStr(0)));
  for I := 1 to 8 do
  begin
    if IsSourceRoot(LDir) then
      Exit(LDir);
    LDir := ExpandFileName(PathJoin(LDir, '..'));
  end;
  Result := GetCurrentDir;
end;

procedure CopyEntry(const ASourceRoot, AInstallDir, ARelative: String;
  ADirectory: Boolean = False);
var
  LSource, LDest: String;
begin
  LSource := PathJoin(ASourceRoot, ARelative);
  LDest := PathJoin(AInstallDir, ARelative);
  if not FileExists(LSource) and not DirectoryExists(LSource) then
    Exit;
  if ADirectory or DirectoryExists(LSource) then
    CopyTree(LSource, LDest)
  else
    CopyFileStream(LSource, LDest);
end;

function Install(const AOptions: TSetupOptions; out AError: String): Boolean;
var
  LText: TStringList;
begin
  Result := False;
  AError := '';
  if not IsSourceRoot(AOptions.SourceRoot) then
  begin
    AError := 'Source tree not found: ' + AOptions.SourceRoot;
    Exit;
  end;
  try
    ForceDirectories(AOptions.InstallDir);
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'Source', True);
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'Lazarus', True);
    if AOptions.Docs then
      CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'Docs', True);
    if AOptions.Examples then
      CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'Examples', True);
    if AOptions.Packages then
      CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'Packages', True);
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'LICENSE');
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'README.md');
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'CHANGELOG.md');
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'THIRD-PARTY-NOTICES.txt');
    CopyEntry(AOptions.SourceRoot, AOptions.InstallDir, 'LICENSES', True);
    LText := TStringList.Create;
    try
      LText.Add('fastTelega');
      LText.Add('Installed: ' + DateTimeToStr(Now));
      LText.Add('Source: ' + AOptions.SourceRoot);
      LText.Add('Package: ' + PackagePath(AOptions.InstallDir));
      LText.SaveToFile(PathJoin(AOptions.InstallDir, 'INSTALL.txt'));
    finally
      LText.Free;
    end;
    Result := True;
  except
    on E: Exception do
      AError := E.Message;
  end;
end;

function Uninstall(const AInstallDir: String; out AError: String): Boolean;
begin
  Result := False;
  AError := '';
  try
    RemoveTree(AInstallDir);
    Result := True;
  except
    on E: Exception do
      AError := E.Message;
  end;
end;

function PackagePath(const AInstallDir: String): String;
begin
  Result := PathJoin(AInstallDir, PathJoin('Lazarus', 'fasttelega.lpk'));
end;

end.
