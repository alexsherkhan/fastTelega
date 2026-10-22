/// <summary>
/// fastTelega HttpServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.HttpServer;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Net.URLClient,
  System.Net.HttpClientComponent,
  System.Net.Mime,
  System.Net.Socket,
  fastTelega.HttpParser;

type

  /// <summary>
  /// This class handles HTTP requests from the Internet.
  /// </summary>
  TftHttpServer = class
  type
    TftConnection = class
    protected
      FSocket: TSocket;
      FHandler: TSocketHandle;
      FHttpParser: TftHttpParser;
      procedure ReadHeader();
      procedure ReadBody();
    public
      constructor Create;
      destructor Destroy; override;
      procedure Start();
      procedure Stop();
    end;
  private
    FProtocol: TSocketType;
    FSocket: TSocket;
    FHandler: TSocketHandle;
    FHttpParser: TftHttpParser;
  protected
    procedure StartAccept;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TftHttpServer.TftConnection }

constructor TftHttpServer.TftConnection.Create;
begin

end;

destructor TftHttpServer.TftConnection.Destroy;
begin

  inherited;
end;

procedure TftHttpServer.TftConnection.ReadBody;
begin

end;

procedure TftHttpServer.TftConnection.ReadHeader;
begin

end;

procedure TftHttpServer.TftConnection.Start;
begin
  StartAccept();
end;

procedure TftHttpServer.TftConnection.Stop;
begin

end;

end.
