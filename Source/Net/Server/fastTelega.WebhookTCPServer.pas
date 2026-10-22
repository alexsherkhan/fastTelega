/// <summary>
/// fastTelega WebhookTCPServer
/// Alexander Syrykh
/// </summary>
unit fastTelega.WebhookTCPServer;

interface

uses 
  System.SysUtils, 
  System.Classes, 
  fastTelega.WebhookServer;

type
  /// <summary>
  ///
  /// </summary>
  TftWebhookTCPServer = class(TftWebhookServer)
  private
//    FSocket: TSocket;
//    FHandler: TSocketHandle;
  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation

end.
