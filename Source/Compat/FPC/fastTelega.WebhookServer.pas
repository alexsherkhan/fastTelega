unit fastTelega.WebhookServer;

{$mode delphi}{$H+}

interface

uses
  SysUtils, Classes, ssockets,
  System.JSON, fpjson,
  fastTelega.Bot, fastTelega.AvailableTypes,
  fastTelega.Events.EventHandler, fastTelega.JsonMapper;

type
  TftWebhookUpdateEvent = procedure(const AUpdate: TftUpdate);

  TftWebhookServer = class
  private
    FServer: TInetServer;
    FThread: TThread;
    FHost: String;
    FPort: Integer;
    FPath: String;
    FSecretToken: String;
    FMaxBodySize: Integer;
    FEventHandler: TftEventHandler;
    FOnUpdate: TftWebhookUpdateEvent;
    function GetActive: Boolean;
    procedure HandleConnect(Sender: TObject; Data: TSocketStream);
    function ReadRequest(Data: TSocketStream; out AMethod, AURI,
      ASecretToken, ABody: String): Boolean;
    procedure WriteResponse(Data: TSocketStream; ACode: Integer;
      const AJSON: String);
    procedure DispatchUpdate(const AUpdate: TftUpdate);
  public
    constructor Create; overload;
    constructor Create(AEventHandler: TftEventHandler); overload;
    constructor Create(ABot: TftBot); overload;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    property Host: String read FHost write FHost;
    property Port: Integer read FPort write FPort;
    property Path: String read FPath write FPath;
    property SecretToken: String read FSecretToken write FSecretToken;
    property MaxBodySize: Integer read FMaxBodySize write FMaxBodySize;
    property EventHandler: TftEventHandler read FEventHandler write FEventHandler;
    property OnUpdate: TftWebhookUpdateEvent read FOnUpdate write FOnUpdate;
    property Active: Boolean read GetActive;
  end;

implementation

type
  TftListenThread = class(TThread)
  private
    FServer: TInetServer;
  protected
    procedure Execute; override;
  public
    constructor Create(AServer: TInetServer);
  end;

constructor TftListenThread.Create(AServer: TInetServer);
begin
  inherited Create(True);
  FreeOnTerminate := False;
  FServer := AServer;
end;

procedure TftListenThread.Execute;
begin
  try
    FServer.StartAccepting;
  except
    // Socket closed or bind failure.
  end;
end;

constructor TftWebhookServer.Create;
begin
  inherited Create;
  FHost := '127.0.0.1';
  FPort := 8080;
  FPath := '/telegram';
  FMaxBodySize := 1024 * 1024;
end;

constructor TftWebhookServer.Create(AEventHandler: TftEventHandler);
begin
  Create;
  FEventHandler := AEventHandler;
end;

constructor TftWebhookServer.Create(ABot: TftBot);
begin
  Create;
  if Assigned(ABot) then
    FEventHandler := ABot.EventHandler;
end;

destructor TftWebhookServer.Destroy;
begin
  Stop;
  inherited;
end;

function TftWebhookServer.GetActive: Boolean;
begin
  Result := Assigned(FThread);
end;

procedure TftWebhookServer.Start;
begin
  if Assigned(FThread) then
    Exit;
  FServer := TInetServer.Create(FHost, FPort);
  try
    FServer.OnConnect := HandleConnect;
    FServer.ReuseAddress := True;
    FServer.Bind;
    FServer.Listen;
    FThread := TftListenThread.Create(FServer);
    FThread.Resume;
    Sleep(50);
  except
    FreeAndNil(FServer);
    raise;
  end;
end;

procedure TftWebhookServer.Stop;
begin
  if Assigned(FServer) then
  begin
    FServer.StopAccepting(True);
    if Assigned(FThread) then
    begin
      FThread.WaitFor;
      FreeAndNil(FThread);
    end;
    FreeAndNil(FServer);
  end;
end;

procedure TftWebhookServer.DispatchUpdate(const AUpdate: TftUpdate);
begin
  if Assigned(FOnUpdate) then
    FOnUpdate(AUpdate);
  if Assigned(FEventHandler) then
    FEventHandler.HandleUpdate(AUpdate);
end;

function TftWebhookServer.ReadRequest(Data: TSocketStream;
  out AMethod, AURI, ASecretToken, ABody: String): Boolean;
var
  LByte: Byte;
  LHeader: String;
  LLines: TStringList;
  I, LPos, LContentLength: Integer;
  LName, LValue: String;
  LRead: Integer;
begin
  Result := False;
  AMethod := '';
  AURI := '';
  ASecretToken := '';
  ABody := '';
  LHeader := '';
  repeat
    LRead := Data.Read(LByte, 1);
    if LRead <> 1 then
      Exit;
    LHeader := LHeader + Char(LByte);
    if Length(LHeader) > 65536 then
      Exit;
  until (Length(LHeader) >= 4) and
    (Copy(LHeader, Length(LHeader) - 3, 4) = #13#10#13#10);

  LLines := TStringList.Create;
  try
    LLines.Text := StringReplace(LHeader, #13#10, #10, [rfReplaceAll]);
    if LLines.Count = 0 then
      Exit;
    LPos := Pos(' ', LLines[0]);
    if LPos = 0 then
      Exit;
    AMethod := Copy(LLines[0], 1, LPos - 1);
    AURI := Copy(LLines[0], LPos + 1, Length(LLines[0]));
    LPos := Pos(' ', AURI);
    if LPos > 0 then
      AURI := Copy(AURI, 1, LPos - 1);
    LContentLength := 0;
    for I := 1 to LLines.Count - 1 do
    begin
      LPos := Pos(':', LLines[I]);
      if LPos = 0 then
        Continue;
      LName := LowerCase(Trim(Copy(LLines[I], 1, LPos - 1)));
      LValue := Trim(Copy(LLines[I], LPos + 1, Length(LLines[I])));
      if LName = 'content-length' then
        LContentLength := StrToIntDef(LValue, 0)
      else if LName = 'x-telegram-bot-api-secret-token' then
        ASecretToken := LValue;
    end;
  finally
    LLines.Free;
  end;

  if LContentLength < 0 then
    Exit;
  SetLength(ABody, LContentLength);
  if LContentLength > 0 then
  begin
    LRead := Data.Read(ABody[1], LContentLength);
    if LRead <> LContentLength then
      Exit;
  end;
  Result := True;
end;

procedure TftWebhookServer.WriteResponse(Data: TSocketStream; ACode: Integer;
  const AJSON: String);
var
  LResponse: String;
begin
  LResponse := 'HTTP/1.1 ' + IntToStr(ACode) + ' ' +
    BoolToStr(ACode = 200, 'OK', 'ERROR') + #13#10 +
    'Content-Type: application/json' + #13#10 +
    'Content-Length: ' + IntToStr(Length(AJSON)) + #13#10 +
    'Connection: close' + #13#10#13#10 + AJSON;
  Data.Write(LResponse[1], Length(LResponse));
end;

procedure TftWebhookServer.HandleConnect(Sender: TObject; Data: TSocketStream);
var
  LMethod, LURI, LSecret, LBody: String;
  LValue: TJSONData;
  LUpdate: TftUpdate;
begin
  try
    if not ReadRequest(Data, LMethod, LURI, LSecret, LBody) then
    begin
      WriteResponse(Data, 400, '{"ok":false,"description":"bad request"}');
      Exit;
    end;
    if not SameText(LMethod, 'POST') then
    begin
      WriteResponse(Data, 200, '{"ok":true}');
      Exit;
    end;
    if (FPath <> '') and not SameText(LURI, FPath) then
    begin
      WriteResponse(Data, 404, '{"ok":false,"description":"unknown path"}');
      Exit;
    end;
    if (FSecretToken <> '') and (LSecret <> FSecretToken) then
    begin
      WriteResponse(Data, 403,
        '{"ok":false,"description":"invalid secret token"}');
      Exit;
    end;
    if Length(LBody) > FMaxBodySize then
    begin
      WriteResponse(Data, 413,
        '{"ok":false,"description":"request body too large"}');
      Exit;
    end;
    if LBody = '' then
    begin
      WriteResponse(Data, 400,
        '{"ok":false,"description":"empty request body"}');
      Exit;
    end;
    LValue := TJSON.ParseJSONValue(LBody);
    if LValue = nil then
    begin
      WriteResponse(Data, 400,
        '{"ok":false,"description":"invalid update"}');
      Exit;
    end;
    try
      LUpdate := TftUpdateFromJson(LValue);
      try
        DispatchUpdate(LUpdate);
      finally
        LUpdate.Free;
      end;
      WriteResponse(Data, 200, '{"ok":true}');
    finally
      LValue.Free;
    end;
  except
    try
      WriteResponse(Data, 500, '{"ok":false,"description":"internal error"}');
    except
    end;
  end;
  Data.Free;
end;

end.
