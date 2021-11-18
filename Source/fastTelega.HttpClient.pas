/// <summary>
/// fastTelega HttpClient
/// Alexander Syrykh
/// </summary>
unit fastTelega.HttpClient;

interface

uses System.SysUtils, System.Classes, System.Net.URLClient,
  System.Net.HttpClientComponent,
  System.Net.Mime;

type
  /// <summary>
  /// This class makes http requests.
  /// </summary>
  TftHttpClient = class
  private
    FHttpClient: TNetHTTPClient;
    function POST_Method(AUrl: String; AData: TStrings): String; overload;
    function POST_Method(AUrl: String; AData: TMultipartFormData)
      : String; overload;
    function GET_Method(AUrl: String; const AResponseContent: TStream = nil;
      const AHeaders: TNetHeaders = nil): String;
    function GetContentType: String;
    procedure SetContentType(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Sends a request to the url.
    /// If there's no args specified, a GET request will be sent, otherwise a POST request will be sent.
    /// If at least 1 arg is marked as file, the content type of a request will be multipart/form-data, otherwise it will be application/x-www-form-urlencoded.
    /// </summary>
    function makeRequest(const AUrl: String; args: TObject;
      const MethodType: String): string;
    property ContentType: String read GetContentType write SetContentType;
  end;

implementation

{ TftHttpClient }

constructor TftHttpClient.Create;
begin
  FHttpClient := TNetHTTPClient.Create(nil);
  FHttpClient.ConnectionTimeout := 5000;
  FHttpClient.ResponseTimeout := 5000;
end;

destructor TftHttpClient.Destroy;
begin
  FreeAndNil(FHttpClient);
  inherited;
end;

function TftHttpClient.makeRequest(const AUrl: String; args: TObject;
  const MethodType: String): string;
var
  I: Integer;
  AHeaders: TNetHeaders;
begin
  if ((AnsiCompareText(MethodType, 'GET') = 0) and (args <> nil)) then
  begin
    SetLength(AHeaders, TStringList(args).Count);
    for I := 0 to TStringList(args).Count - 1 do
    begin
      TNameValuePair(AHeaders[I]) := TNameValuePair.Create
        (TStringList(args).KeyNames[I], TStringList(args).ValueFromIndex[I]);
    end;
    Result := GET_Method(AUrl, nil, AHeaders);
  end
  else if AnsiCompareText(MethodType, 'GET') = 0 then
    Result := GET_Method(AUrl)
  else if AnsiCompareText(ContentType, 'multipart/form-data') = 0 then
    Result := POST_Method(AUrl, TMultipartFormData(args))
  else
    Result := POST_Method(AUrl, TStrings(args));
end;

function TftHttpClient.GetContentType: String;
begin
  Result := FHttpClient.ContentType;
end;

function TftHttpClient.GET_Method(AUrl: String; const AResponseContent: TStream;
  const AHeaders: TNetHeaders): String;
begin
  Result := '';
  try
    Result := FHttpClient.Get(AUrl, AResponseContent, AHeaders)
      .ContentAsString(TEncoding.UTF8);
  except
    on E: Exception do
    begin
      // if Assigned(FProcedureErrorException) then
      // FProcedureErrorException(E);
    end;
  end;
end;

function TftHttpClient.POST_Method(AUrl: String; AData: TStrings): String;
begin
  Result := '';
  try
    Result := FHttpClient.Post(AUrl, AData).ContentAsString(TEncoding.UTF8);
  except
    on E: Exception do
    begin
      // if Assigned(FProcedureErrorException) then
      // FProcedureErrorException(E);
    end;
  end;
end;

function TftHttpClient.POST_Method(AUrl: String;
  AData: TMultipartFormData): String;
begin
  Result := '';
  try
    Result := FHttpClient.Post(AUrl, AData).ContentAsString(TEncoding.UTF8);
  except
    on E: Exception do
    begin
      // if Assigned(FProcedureErrorException) then
      // FProcedureErrorException(E);
    end;
  end;
end;

procedure TftHttpClient.SetContentType(const Value: String);
begin
  FHttpClient.ContentType := Value;
end;

end.
