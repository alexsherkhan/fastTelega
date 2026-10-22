/// <summary>
/// fastTelega WebhookServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.WebhookServer;

interface

uses 
  System.SysUtils, 
  System.Classes, 
  System.Net.URLClient,
  System.Net.HttpClientComponent,
  System.Net.Mime, 
  System.Net.Socket,
  fastTelega.HttpServer;

type
  /// <summary>
  ///
  /// </summary>
  TftWebhookServer = class(TftHttpServer)
  private
    FSocket: TSocket;
    FHandler: TSocketHandle;
  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

end.
