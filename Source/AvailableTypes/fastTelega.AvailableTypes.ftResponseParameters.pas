/// <summary>
/// fastTelega ftResponseParameters
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftResponseParameters;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// Contains information about why a request was unsuccessfull.
  /// </summary>
  TftResponseParameters = class
  private
    FMigrateToChatId: Integer;
    FRetryAfter: Integer;
  public
    /// <summary>
    /// Optional. The group has been migrated to a supergroup with the specified identifier.
    ///
    /// This number may be greater than 32 bits and some programming languages may have
    /// difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a
    /// signed 64 bit integer or double-precision float type are safe for storing this identifier.
    /// </summary>
    property MigrateToChatId: Integer read FMigrateToChatId
      write FMigrateToChatId;
    /// <summary>
    /// Optional. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
    /// </summary>
    property RetryAfter: Integer read FRetryAfter write FRetryAfter;
  end;

implementation

end.
