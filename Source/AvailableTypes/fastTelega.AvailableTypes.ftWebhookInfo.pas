/// <summary>
/// fastTelega ftWebhookInfo
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftWebhookInfo;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// Contains information about the current status of a webhook.
  /// </summary>
  TftWebhookInfo = class
  private
    FUrl: String;
    FHasCustomCertificate: Boolean;
    FPendingUpdateCount: Integer;
    FIpAddress: String;
    FLastErrorDate: Integer;
    FLastErrorMessage: String;
    FLastSynchronizationErrorDate: String;
    FMaxConnections: Integer;
    FAllowedUpdates: TArray<String>;
  public
    /// <summary>
    /// Webhook URL, may be empty if webhook is not set up
    /// </summary>
    property Url: String read FUrl write FUrl;
    /// <summary>
    /// True, if a custom certificate was provided for webhook certificate checks
    /// </summary>
    property HasCustomCertificate: Boolean read FHasCustomCertificate
      write FHasCustomCertificate;
    /// <summary>
    /// Number of updates awaiting delivery
    /// </summary>
    property PendingUpdateCount: Integer read FPendingUpdateCount
      write FPendingUpdateCount;
    /// <summary>
    /// Optional. Currently used webhook IP address
    /// </summary>
    property IpAddress: String read FIpAddress write FIpAddress;
    /// <summary>
    /// Optional. Unix time for the most recent error that happened when
    /// trying to deliver an update via webhook
    /// </summary>
    property LastErrorDate: Integer read FLastErrorDate write FLastErrorDate;
    /// <summary>
    /// Optional. Error message in human-readable format for the most
    /// recent error that happened when trying to deliver an update via webhook
    /// </summary>
    property LastErrorMessage: String read FLastErrorMessage
      write FLastErrorMessage;
    /// <summary>
    /// Optional. Unix time of the most recent error that happened when trying to synchronize available updates with Telegram datacenters
    /// </summary>
     property LastSynchronizationErrorDate: String read FLastSynchronizationErrorDate
      write FLastSynchronizationErrorDate;
    /// <summary>
    /// Optional. Maximum allowed number of simultaneous HTTPS connections
    /// to the webhook for update delivery
    /// </summary>
    property MaxConnections: Integer read FMaxConnections write FMaxConnections;
    /// <summary>
    /// Optional. A list of update types the bot is subscribed to. Defaults
    /// to all update types except chat_member
    /// </summary>
    property AllowedUpdates: TArray<String> read FAllowedUpdates
      write FAllowedUpdates;
  end;

implementation

end.
