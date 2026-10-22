unit System.Net.HttpClientComponent;

{$IFDEF FPC}
{$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  SysUtils, Classes, fphttpclient,
  System.Net.URLClient,
  System.Net.Mime;

type
  TNetHTTPResponse = class
  private
    FContent: RawByteString;
  public
    constructor Create(const AContent: RawByteString);
    function ContentAsString(const AEncoding: TEncoding): String;
  end;

  TNetHTTPClient = class
  private
    FContentType: String;
    FConnectionTimeout: Integer;
    FResponseTimeout: Integer;
    function DoRequest(const AURL: String; AData: TStrings;
      AMultipart: TMultipartFormData; const AHeaders: TNetHeaders;
      const AMethod: String): TNetHTTPResponse;
  public
    constructor Create(AOwner: TComponent);
    property ContentType: String read FContentType write FContentType;
    property ConnectionTimeout: Integer read FConnectionTimeout
      write FConnectionTimeout;
    property ResponseTimeout: Integer read FResponseTimeout
      write FResponseTimeout;
    function Get(const AURL: String; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): TNetHTTPResponse;
    function Post(const AURL: String; AData: TStrings): TNetHTTPResponse; overload;
    function Post(const AURL: String;
      AData: TMultipartFormData): TNetHTTPResponse; overload;
  end;

implementation

constructor TNetHTTPResponse.Create(const AContent: RawByteString);
begin
  inherited Create;
  FContent := AContent;
end;

function TNetHTTPResponse.ContentAsString(const AEncoding: TEncoding): String;
begin
  Result := String(FContent);
end;

constructor TNetHTTPClient.Create(AOwner: TComponent);
begin
  inherited Create;
  FContentType := 'application/x-www-form-urlencoded';
  FConnectionTimeout := 5000;
  FResponseTimeout := 5000;
end;

function TNetHTTPClient.DoRequest(const AURL: String; AData: TStrings;
  AMultipart: TMultipartFormData; const AHeaders: TNetHeaders;
  const AMethod: String): TNetHTTPResponse;
var
  LHTTP: TFPHTTPClient;
  LResponse: TStringStream;
  LBody: TMemoryStream;
  I: Integer;
  LBoundary: String;
begin
  LHTTP := TFPHTTPClient.Create(nil);
  LResponse := TStringStream.Create('');
  try
    LHTTP.ConnectTimeout := FConnectionTimeout;
    LHTTP.IOTimeout := FResponseTimeout;
    LHTTP.AllowRedirect := True;
    for I := 0 to High(AHeaders) do
      LHTTP.AddHeader(AHeaders[I].Name, AHeaders[I].Value);
    if Assigned(AMultipart) then
    begin
      LBoundary := '----fastTelegaBoundary' + IntToHex(Random(MaxInt), 8);
      LHTTP.AddHeader('Content-Type', 'multipart/form-data; boundary=' + LBoundary);
      LBody := TMemoryStream.Create;
      try
        if not AMultipart.BuildBody(LBoundary, LBody) then
          Exit(nil);
        LBody.Position := 0;
        LHTTP.RequestBody := LBody;
        LHTTP.Post(AURL, LResponse);
      finally
        LHTTP.RequestBody := nil;
        LBody.Free;
      end;
    end
    else if Assigned(AData) then
    begin
      LHTTP.AddHeader('Content-Type', FContentType);
      LResponse.WriteString(LHTTP.FormPost(AURL, AData));
    end
    else
      LResponse.WriteString(LHTTP.Get(AURL));
    Result := TNetHTTPResponse.Create(LResponse.DataString);
  except
    Result := TNetHTTPResponse.Create('');
  end;
  LResponse.Free;
  LHTTP.Free;
end;

function TNetHTTPClient.Get(const AURL: String;
  const AResponseContent: TStream; const AHeaders: TNetHeaders): TNetHTTPResponse;
begin
  Result := DoRequest(AURL, nil, nil, AHeaders, 'GET');
  if Assigned(AResponseContent) and Assigned(Result) then
    AResponseContent.WriteBuffer(PChar(Result.ContentAsString(nil))^,
      Length(Result.ContentAsString(nil)));
end;

function TNetHTTPClient.Post(const AURL: String;
  AData: TStrings): TNetHTTPResponse;
begin
  Result := DoRequest(AURL, AData, nil, nil, 'POST');
end;

function TNetHTTPClient.Post(const AURL: String;
  AData: TMultipartFormData): TNetHTTPResponse;
begin
  Result := DoRequest(AURL, nil, AData, nil, 'POST');
end;

end.
