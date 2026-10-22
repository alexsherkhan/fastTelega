/// <summary>
/// fastTelega ftShippingAddress
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftShippingAddress;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a shipping address.
  /// https://core.telegram.org/bots/api#shippingaddress
  /// </summary>
  TftShippingAddress = class
  private
    FCountryCode: String;
    FState: String;
    FCity: String;
    FStreetLine1: String;
    FStreetLine2: String;
    FPostCode: String;
  public
    /// <summary>
    /// ISO 3166-1 alpha-2 country code.
    /// </summary>
    property CountryCode: String read FCountryCode write FCountryCode;
    /// <summary>
    /// State, if applicable.
    /// </summary>
    property State: String read FState write FState;
    /// <summary>
    /// City.
    /// </summary>
    property City: String read FCity write FCity;
    /// <summary>
    /// First line for the address.
    /// </summary>
    property StreetLine1: String read FStreetLine1 write FStreetLine1;
    /// <summary>
    /// Second line for the address.
    /// </summary>
    property StreetLine2: String read FStreetLine2 write FStreetLine2;
    /// <summary>
    /// Address post code.
    /// </summary>
    property PostCode: String read FPostCode write FPostCode;
  end;

implementation

end.
