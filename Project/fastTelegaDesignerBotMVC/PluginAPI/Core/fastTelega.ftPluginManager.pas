unit fastTelega.ftPluginManager;

interface

uses
  Windows,
  SysUtils,
  Classes,

  {fastTelega}
  fastTelega.ftPluginAPI;

type
  // для всех ошибок менеджера плагинов
  EftPluginManagerError = class(Exception);

  // для ошибок загрузки плагинов
  EftPluginLoadError = class(EftPluginManagerError);

  // для ошибок загрузки плагинов в папке
  EftPluginsLoadError = class(EftPluginLoadError)
  private
    FItems: TStrings;
  public
    constructor Create(const AText: String; const AFailedPlugins: TStrings);
    destructor Destroy; override;
    property FailedPluginFileNames: TStrings read FItems;
  end;

  IftPlugin = interface
    ['{748286DD-3448-431E-9CCB-488DC5E8F550}']
    // protected
    function GetIndex: Integer;
    function GetHandle: HMODULE;
    function GetFileName: String;
    // public
    property Index: Integer read GetIndex;
    property Handle: HMODULE read GetHandle;
    property FileName: String read GetFileName;
  end;

  IftPluginManager = interface
    ['{8B21E878-9FB4-4CAC-A979-FADA83721C4E}']
    // protected
    function GetItem(const AIndex: Integer): IftPlugin;
    function GetCount: Integer;
    // public
    function LoadPlugin(const AFileName: String): IftPlugin;
    procedure UnloadPlugin(const AIndex: Integer);
    procedure LoadPlugins(const AFolder: String; const AFileExt: String = '');

    procedure Ban(const AFileName: String);
    procedure Unban(const AFileName: String);

    procedure SaveSettings(const ARegPath: String);
    procedure LoadSettings(const ARegPath: String);

    property Items[const AIndex: Integer]: IftPlugin read GetItem; default;
    property Count: Integer read GetCount;
  end;

function Plugins: IftPluginManager;

implementation

uses
  Registry;

resourcestring
  rsftPluginsLoadError = 'One or more plugins has failed to load:' +
    sLineBreak + '%s';

const
  SRegDisabledPlugins = 'Disabled plugins';
  SRegPluginX = 'Plugin%d';

type
  TftPluginManager = class(TInterfacedObject, IftPluginManager)
  private
    FItems: array of IftPlugin;
    FCount: Integer;
    FBanned: TStringList;
  protected
    function GetItem(const AIndex: Integer): IftPlugin;
    function GetCount: Integer;
    function CanLoad(const AFileName: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function LoadPlugin(const AFileName: String): IftPlugin;
    procedure UnloadPlugin(const AIndex: Integer);
    procedure LoadPlugins(const AFolder: String; const AFileExt: String = '');
    function IndexOf(const APlugin: IftPlugin): Integer;

    procedure Ban(const AFileName: String);
    procedure Unban(const AFileName: String);

    procedure SaveSettings(const ARegPath: String);
    procedure LoadSettings(const ARegPath: String);
  end;

  TftPlugin = class(TInterfacedObject, IftPlugin)
  private
    FManager: TftPluginManager;
    FFileName: String;
    FHandle: HMODULE;
    FInit: TftInitPluginFunc;
    FDone: TftDonePluginFunc;
    FPlugin: IInterface;
  protected
    function GetIndex: Integer;
    function GetHandle: HMODULE;
    function GetFileName: String;
  public
    constructor Create(const APluginManger: TftPluginManager;
      const AFileName: String); virtual;
    destructor Destroy; override;
  end;


  // ________________________________________________________________

var
  FPluginManager: IftPluginManager;

function Plugins: IftPluginManager;
begin
  Result := FPluginManager;
end;

{ TftPluginManager }

procedure TftPluginManager.Ban(const AFileName: String);
begin
  Unban(AFileName);
  FBanned.Add(AFileName);
end;

function TftPluginManager.CanLoad(const AFileName: String): Boolean;
var
  X: Integer;
begin
  // Не грузить отключенные
  for X := 0 to FBanned.Count - 1 do
    if SameFileName(FBanned[X], AFileName) then
    begin
      Result := False;
      Exit;
    end;

  // Не грузить уже загруженные
  for X := 0 to FCount - 1 do
    if SameFileName(FItems[X].FileName, AFileName) then
    begin
      Result := False;
      Exit;
    end;

  Result := True;
end;

constructor TftPluginManager.Create;
begin
  inherited Create;
  FBanned := TStringList.Create;
end;

destructor TftPluginManager.Destroy;
begin
  FreeAndNil(FBanned);
  inherited;
end;

function TftPluginManager.GetCount: Integer;
begin
  Result := FCount;
end;

function TftPluginManager.GetItem(const AIndex: Integer): IftPlugin;
begin
  Result := FItems[AIndex];
end;

function TftPluginManager.IndexOf(const APlugin: IftPlugin): Integer;
var
  X: Integer;
begin
  Result := -1;
  for X := 0 to FCount - 1 do
    if FItems[X] = APlugin then
    begin
      Result := X;
      Break;
    end;
end;

function TftPluginManager.LoadPlugin(const AFileName: String): IftPlugin;
begin
  if not CanLoad(AFileName) then
  begin
    Result := nil;
    Exit;
  end;

  // Загружаем плагин
  try
    Result := TftPlugin.Create(Self, AFileName);
  except
    on E: Exception do
      raise EftPluginLoadError.Create
        (Format('[%s] %s', [E.ClassName, E.Message]));
  end;
end;

procedure TftPluginManager.LoadPlugins(const AFolder, AFileExt: String);

  function PluginOK(const APluginName, AFileExt: String): Boolean;
  begin
    Result := (AFileExt = '');
    if Result then
      Exit;
    Result := SameFileName(ExtractFileExt(APluginName), AFileExt);
  end;

var
  LPath: String;
  LSearchRec: TSearchRec;
  LFailures: TStringList;
  LFailedPlugins: TStringList;
begin
  LPath := IncludeTrailingPathDelimiter(AFolder);

  LFailures := TStringList.Create;
  LFailedPlugins := TStringList.Create;
  try
    if FindFirst(LPath + '*.*', faNormal, LSearchRec) = 0 then
      try
        repeat
          if ((LSearchRec.Attr and faDirectory) = 0) and
            PluginOK(LSearchRec.Name, AFileExt) then
            try
              LoadPlugin(LPath + LSearchRec.Name);
            except
              on E: Exception do
              begin
                LFailedPlugins.Add(LSearchRec.Name);
                LFailures.Add(Format('%s: %s', [LSearchRec.Name, E.Message]));
              end;
            end;
        until FindNext(LSearchRec) <> 0;
      finally
        FindClose(LSearchRec);
      end;

    if LFailures.Count > 0 then
      raise EftPluginsLoadError.Create(Format(rsftPluginsLoadError,
        [LFailures.Text]), LFailedPlugins);
  finally
    FreeAndNil(LFailedPlugins);
    FreeAndNil(LFailures);
  end;
end;

procedure TftPluginManager.LoadSettings(const ARegPath: String);
var
  LReg: TRegIniFile;
  LPath: String;
  X: Integer;
begin
  LReg := TRegIniFile.Create(ARegPath, KEY_READ);
  try
    FBanned.BeginUpdate;
    try
      FBanned.Clear;

      // Читаем
      LPath := ARegPath + '\' + SRegDisabledPlugins;
      if not LReg.OpenKey(LPath, True) then
        Exit;
      LReg.ReadSectionValues(LPath, FBanned);

      // Убираем "Plugin5=" из строк
      for X := 0 to FBanned.Count - 1 do
        FBanned[X] := FBanned.ValueFromIndex[X];
    finally
      FBanned.EndUpdate;
    end;
  finally
    FreeAndNil(LReg);
  end;

end;

procedure TftPluginManager.SaveSettings(const ARegPath: String);
var
  LReg: TRegIniFile;
  LPath: String;
  X: Integer;
begin
  LReg := TRegIniFile.Create(ARegPath, KEY_ALL_ACCESS);
  try
    // Удаляем старые
    LReg.EraseSection(SRegDisabledPlugins);
    LPath := ARegPath + '\' + SRegDisabledPlugins;
    if not LReg.OpenKey(LPath, True) then
      Exit;

    // Сохраняем новые
    for X := 0 to FBanned.Count - 1 do
      LReg.WriteString(LPath, Format(SRegPluginX, [X]), FBanned[X]);
  finally
    FreeAndNil(LReg);
  end;

end;

procedure TftPluginManager.Unban(const AFileName: String);
var
  X: Integer;
begin
  for X := 0 to FBanned.Count - 1 do
    if SameFileName(FBanned[X], AFileName) then
    begin
      FBanned.Delete(X);
      Break;
    end;

end;

procedure TftPluginManager.UnloadPlugin(const AIndex: Integer);
var
  X: Integer;
begin
  // Выгрузить плагин
  FItems[AIndex] := nil;
  // Сдвинуть плагины в списке, чтобы закрыть "дырку"
  for X := AIndex to FCount - 1 do
    FItems[X] := FItems[X + 1];
  // Не забыть учесть последний
  FItems[FCount - 1] := nil;
  Dec(FCount);
end;

{ TftPlugin }

constructor TftPlugin.Create(const APluginManger: TftPluginManager;
  const AFileName: String);
begin
  inherited Create;
  FManager := APluginManger;
  FFileName := AFileName;
  FHandle := SafeLoadLibrary(AFileName);
  Win32Check(FHandle <> 0);

  FDone := GetProcAddress(FHandle, SPluginDoneFuncName);
  FInit := GetProcAddress(FHandle, SPluginInitFuncName);
  Win32Check(Assigned(FInit));
  FPlugin := FInit(FManager);
end;

destructor TftPlugin.Destroy;
begin
  FPlugin := nil;
  if Assigned(FDone) then
    FDone;
  if FHandle <> 0 then
  begin
    FreeLibrary(FHandle);
    FHandle := 0;
  end;
  inherited;
end;

function TftPlugin.GetFileName: String;
begin
  Result := FFileName;
end;

function TftPlugin.GetHandle: HMODULE;
begin
  Result := FHandle;
end;

function TftPlugin.GetIndex: Integer;
begin
  Result := FManager.IndexOf(Self);
end;

{ EftPluginsLoadError }

constructor EftPluginsLoadError.Create(const AText: String;
  const AFailedPlugins: TStrings);
begin
  inherited Create(AText);
  FItems := TStringList.Create;
  FItems.Assign(AFailedPlugins);
end;

destructor EftPluginsLoadError.Destroy;
begin
  FreeAndNil(FItems);
  inherited;
end;

initialization

FPluginManager := TftPluginManager.Create;

finalization

FPluginManager := nil;

end.
