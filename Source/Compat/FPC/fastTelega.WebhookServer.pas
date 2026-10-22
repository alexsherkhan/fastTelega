unit fastTelega.WebhookServer;

{$mode delphi}{$H+}

interface

uses
  SysUtils, Classes, fphttpserver, httpdefs, sslbase, ssockets,
  System.JSON, fpjson,
  fastTelega.Bot, fastTelega.AvailableTypes,
  fastTelega.Events.EventHandler, fastTelega.JsonMapper;

type
  TftWebhookUpdateEvent = procedure(const AUpdate: TftUpdate);

  TftFpcHttpServer = class(TFPHttpServer)
  public
    procedure SetBindAddress(const AValue: String);
    procedure StopListening;
  end;

  TftWebhookServer = class
  private
    FServer: TftFpcHttpServer;
    FThread: TThread;
    FHost: String;
    FPort: Integer;
    FPath: String;
    FSecretToken: String;
    FMaxBodySize: Integer;
    FUseSSL: Boolean;
    FEventHandler: TftEventHandler;
    FOnUpdate: TftWebhookUpdateEvent;
    function GetActive: Boolean;
    function GetCertificateData: TCertificateData;
    procedure HandleRequest(Sender: TObject;
      var ARequest: TFPHTTPConnectionRequest;
      var AResponse: TFPHTTPConnectionResponse);
    procedure RespondJSON(var AResponse: TFPHTTPConnectionResponse;
      ACode: Integer; const AJSON: String);
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
    property UseSSL: Boolean read FUseSSL write FUseSSL;
    property CertificateData: TCertificateData read GetCertificateData;
    property EventHandler: TftEventHandler read FEventHandler write FEventHandler;
    property OnUpdate: TftWebhookUpdateEvent read FOnUpdate write FOnUpdate;
    property Active: Boolean read GetActive;
  end;

implementation

type
  TftWebhookServerThread = class(TThread)
  private
    FServer: TftFpcHttpServer;
  protected
    procedure Execute; override;
  public
    constructor Create(AServer: TftFpcHttpServer);
  end;

procedure TftFpcHttpServer.SetBindAddress(const AValue: String);
begin
  Address := AValue;
end;

procedure TftFpcHttpServer.StopListening;
begin
  StopServerSocket;
end;

constructor TftWebhookServerThread.Create(AServer: TftFpcHttpServer);
begin
  inherited Create(True);
  FreeOnTerminate := False;
  FServer := AServer;
end;

procedure TftWebhookServerThread.Execute;
begin
  try
    FServer.Active := True;
  except
    // The server stops when the socket cannot be bound or is closed.
  end;
end;

constructor TftWebhookServer.Create;
begin
  inherited Create;
  FHost := '127.0.0.1';
  FPort := 8080;
  FPath := '/telegram';
  FMaxBodySize := 1024 * 1024;
  FServer := TftFpcHttpServer.Create(nil);
  FServer.OnRequest := HandleRequest;
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
  FreeAndNil(FServer);
  inherited;
end;

function TftWebhookServer.GetActive: Boolean;
begin
  Result := FServer.Active;
end;

function TftWebhookServer.GetCertificateData: TCertificateData;
begin
  Result := FServer.CertificateData;
end;

procedure TftWebhookServer.Start;
begin
  if Assigned(FThread) then
    Exit;
  FServer.SetBindAddress(FHost);
  FServer.Port := FPort;
  FServer.UseSSL := FUseSSL;
  FThread := TftWebhookServerThread.Create(FServer);
  FThread.Resume;
  Sleep(50);
end;

procedure TftWebhookServer.Stop;
begin
  if Assigned(FServer) then
    FServer.StopListening;
  if Assigned(FThread) then
  begin
    try
      TInetSocket.Create('127.0.0.1', FPort).Free;
    except
      // The server may already be closed.
    end;
    FThread.WaitFor;
    FreeAndNil(FThread);
  end;
end;

procedure TftWebhookServer.RespondJSON(var AResponse: TFPHTTPConnectionResponse;
  ACode: Integer; const AJSON: String);
begin
  AResponse.Code := ACode;
  AResponse.ContentType := 'application/json';
  AResponse.Content := AJSON;
end;

procedure TftWebhookServer.DispatchUpdate(const AUpdate: TftUpdate);
begin
  if Assigned(FOnUpdate) then
    FOnUpdate(AUpdate);
  if Assigned(FEventHandler) then
    FEventHandler.HandleUpdate(AUpdate);
end;

procedure TftWebhookServer.HandleRequest(Sender: TObject;
  var ARequest: TFPHTTPConnectionRequest;
  var AResponse: TFPHTTPConnectionResponse);
var
  LBody: String;
  LUpdate: TftUpdate;
  LPath: String;
  LValue: TJSONData;
begin
  if not SameText(ARequest.Method, 'POST') then
  begin
    RespondJSON(AResponse, 200, '{"ok":true}');
    Exit;
  end;

  LPath := ARequest.URI;
  if Pos('?', LPath) > 0 then
    LPath := Copy(LPath, 1, Pos('?', LPath) - 1);
  if (FPath <> '') and not SameText(LPath, FPath) then
  begin
    RespondJSON(AResponse, 404, '{"ok":false,"description":"unknown path"}');
    Exit;
  end;

  if (FSecretToken <> '') and
    (ARequest.CustomHeaders.Values['X-Telegram-Bot-Api-Secret-Token'] <> FSecretToken) then
  begin
    RespondJSON(AResponse, 403,
      '{"ok":false,"description":"invalid secret token"}');
    Exit;
  end;

  LBody := ARequest.Content;
  if Length(LBody) > FMaxBodySize then
  begin
    RespondJSON(AResponse, 413,
      '{"ok":false,"description":"request body too large"}');
    Exit;
  end;
  if LBody = '' then
  begin
    RespondJSON(AResponse, 400,
      '{"ok":false,"description":"empty request body"}');
    Exit;
  end;

  LValue := TJSON.ParseJSONValue(LBody);
  if LValue = nil then
  begin
    RespondJSON(AResponse, 400,
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
    RespondJSON(AResponse, 200, '{"ok":true}');
  finally
    LValue.Free;
  end;
end;

end.
