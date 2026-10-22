/// <summary>
/// fastTelega WebhookLocalServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.WebhookLocalServer;

interface

uses 
  System.SysUtils, 
  System.Classes, 
  fastTelega.WebhookServer;

type
  /// <summary>
  /// This class setups HTTP server for receiving Telegram Update objects from unix socket.
  /// </summary>
  TftWebhookLocalServer = class(TftWebhookServer)
  private
//    FSocket: TSocket;
//    FHandler: TSocketHandle;
  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

end.
