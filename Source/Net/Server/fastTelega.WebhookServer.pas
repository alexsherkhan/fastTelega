/// <summary>
/// fastTelega WebhookServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.WebhookServer;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  Rest.JSON,

  {Indy}
  IdContext,
  IdCustomHTTPServer,
  IdHTTPServer,
  IdSocketHandle,

  {fastTelega}
  fastTelega.Bot,
  fastTelega.AvailableTypes,
  fastTelega.Events.EventHandler;

type
  /// <summary>
  /// Called for every update received by the webhook server.
  /// </summary>
  TftWebhookUpdateEvent = reference to procedure(const AUpdate: TftUpdate);

  /// <summary>
  /// HTTP server that receives Telegram updates over a webhook.
  ///
  /// The server speaks plain HTTP. Terminate TLS in a reverse proxy
  /// (nginx, Caddy, IIS, etc.) and forward requests to this server.
  /// </summary>
  TftWebhookServer = class
  private
    FServer: TIdHTTPServer;
    FHost: String;
    FPort: Integer;
    FPath: String;
    FSecretToken: String;
    FEventHandler: TftEventHandler;
    FOnUpdate: TftWebhookUpdateEvent;
    FMaxBodySize: Integer;
    function GetActive: Boolean;
    procedure HandleCommand(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure RespondJSON(AResponseInfo: TIdHTTPResponseInfo;
      AStatusCode: Integer; const AJSON: String);
    function ReadBody(ARequestInfo: TIdHTTPRequestInfo): String;
    procedure DispatchUpdate(const AUpdate: TftUpdate);
    procedure Initialize;
  public
    constructor Create; overload;
    constructor Create(AEventHandler: TftEventHandler); overload;
    constructor Create(ABot: TftBot); overload;
    destructor Destroy; override;

    /// <summary>
    /// Binds the socket and starts accepting requests.
    /// </summary>
    procedure Start;
    /// <summary>
    /// Stops accepting requests.
    /// </summary>
    procedure Stop;

    /// <summary>
    /// Bind address. Defaults to 127.0.0.1; use 0.0.0.0 for all interfaces.
    /// </summary>
    property Host: String read FHost write FHost;
    /// <summary>
    /// Listening port. Defaults to 8080.
    /// </summary>
    property Port: Integer read FPort write FPort;
    /// <summary>
    /// Request path, for example /telegram.
    /// </summary>
    property Path: String read FPath write FPath;
    /// <summary>
    /// Value expected in the X-Telegram-Bot-Api-Secret-Token header.
    /// Empty disables the check.
    /// </summary>
    property SecretToken: String read FSecretToken write FSecretToken;
    /// <summary>
    /// Maximum accepted request body in bytes. Defaults to 1 MiB.
    /// </summary>
    property MaxBodySize: Integer read FMaxBodySize write FMaxBodySize;
    /// <summary>
    /// Dispatcher used for received updates. The server does not own it.
    /// </summary>
    property EventHandler: TftEventHandler read FEventHandler
      write FEventHandler;
    /// <summary>
    /// Optional direct callback. If both OnUpdate and EventHandler are set,
    /// both are called.
    /// </summary>
    property OnUpdate: TftWebhookUpdateEvent read FOnUpdate write FOnUpdate;
    property Active: Boolean read GetActive;
  end;

implementation

{ TftWebhookServer }

procedure TftWebhookServer.Initialize;
begin
  FHost := '127.0.0.1';
  FPort := 8080;
  FPath := '/telegram';
  FMaxBodySize := 1024 * 1024;
  FServer := TIdHTTPServer.Create(nil);
  FServer.OnCommandGet := HandleCommand;
  FServer.OnCommandPost := HandleCommand;
end;

constructor TftWebhookServer.Create;
begin
  inherited Create;
  Initialize;
end;

constructor TftWebhookServer.Create(AEventHandler: TftEventHandler);
begin
  inherited Create;
  Initialize;
  FEventHandler := AEventHandler;
end;

constructor TftWebhookServer.Create(ABot: TftBot);
begin
  inherited Create;
  Initialize;
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

procedure TftWebhookServer.Start;
begin
  if FServer.Active then
    Exit;

  FServer.DefaultPort := FPort;
  FServer.Bindings.Clear;
  with FServer.Bindings.Add do
  begin
    IP := FHost;
    Port := FPort;
  end;
  FServer.Active := True;
end;

procedure TftWebhookServer.Stop;
begin
  if Assigned(FServer) then
    FServer.Active := False;
end;

function TftWebhookServer.ReadBody(ARequestInfo: TIdHTTPRequestInfo): String;
var
  LStream: TStringStream;
begin
  Result := '';
  if not Assigned(ARequestInfo.PostStream) then
    Exit;

  LStream := TStringStream.Create('', TEncoding.UTF8);
  try
    ARequestInfo.PostStream.Position := 0;
    LStream.CopyFrom(ARequestInfo.PostStream, 0);
    Result := LStream.DataString;
  finally
    LStream.Free;
  end;
end;

procedure TftWebhookServer.RespondJSON(AResponseInfo: TIdHTTPResponseInfo;
  AStatusCode: Integer; const AJSON: String);
begin
  AResponseInfo.ResponseNo := AStatusCode;
  AResponseInfo.ContentType := 'application/json';
  AResponseInfo.CharSet := 'utf-8';
  AResponseInfo.ContentText := AJSON;
end;

procedure TftWebhookServer.DispatchUpdate(const AUpdate: TftUpdate);
begin
  if Assigned(FOnUpdate) then
    FOnUpdate(AUpdate);
  if Assigned(FEventHandler) then
    FEventHandler.HandleUpdate(AUpdate);
end;

procedure TftWebhookServer.HandleCommand(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  LBody: String;
  LUpdate: TftUpdate;
begin
  // Health check and friendly response for GET requests.
  if not SameText(ARequestInfo.Command, 'POST') then
  begin
    RespondJSON(AResponseInfo, 200, '{"ok":true}');
    Exit;
  end;

  if (FPath <> '') and not SameText(ARequestInfo.Document, FPath) then
  begin
    RespondJSON(AResponseInfo, 404,
      '{"ok":false,"description":"unknown path"}');
    Exit;
  end;

  if (FSecretToken <> '') and
    (ARequestInfo.RawHeaders.Values['X-Telegram-Bot-Api-Secret-Token'] <> FSecretToken) then
  begin
    RespondJSON(AResponseInfo, 403,
      '{"ok":false,"description":"invalid secret token"}');
    Exit;
  end;

  if (ARequestInfo.ContentLength > 0) and
    (ARequestInfo.ContentLength > FMaxBodySize) then
  begin
    RespondJSON(AResponseInfo, 413,
      '{"ok":false,"description":"request body too large"}');
    Exit;
  end;

  try
    LBody := ReadBody(ARequestInfo);
    if Length(LBody) > FMaxBodySize then
    begin
      RespondJSON(AResponseInfo, 413,
        '{"ok":false,"description":"request body too large"}');
      Exit;
    end;
    if LBody = '' then
    begin
      RespondJSON(AResponseInfo, 400,
        '{"ok":false,"description":"empty request body"}');
      Exit;
    end;

    LUpdate := TJSON.JsonToObject<TftUpdate>(LBody);
    if not Assigned(LUpdate) then
    begin
      RespondJSON(AResponseInfo, 400,
        '{"ok":false,"description":"invalid update"}');
      Exit;
    end;
    try
      DispatchUpdate(LUpdate);
    finally
      LUpdate.Free;
    end;
    RespondJSON(AResponseInfo, 200, '{"ok":true}');
  except
    on E: Exception do
      RespondJSON(AResponseInfo, 400,
        '{"ok":false,"description":"' +
        StringReplace(E.Message, '"', '''', [rfReplaceAll]) + '"}');
  end;
end;

end.
