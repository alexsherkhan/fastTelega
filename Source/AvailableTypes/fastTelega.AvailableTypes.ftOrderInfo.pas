/// <summary>
/// fastTelega ftOrderInfo
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftOrderInfo;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.AvailableTypes.ftShippingAddress;

type

/// <summary>
  /// This object represents information about an order.
  /// https://core.telegram.org/bots/api#orderinfo *
  /// </summary>
  TftOrderInfo = class
  private
    FName: String;
    FPhoneNumber: String;
    FEmail: String;
    FShippingAddress: TftShippingAddress;
  public
    /// <summary>
    /// Optional. User name.
    /// <summary>
    property Name: String read FName write FName;
    /// <summary>
    /// Optional. User's phone number.
    /// </summary>
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
    /// <summary>
    /// Optional. User email.
    /// </summary>
    property Email: String read FEmail write FEmail;
    /// <summary>
    /// Optional. User shipping address.
    /// </summary>
    property ShippingAddreSS: TftShippingAddress read FShippingAddress
      write FShippingAddress;
  end;

implementation

end.
