/// <summary>
/// fastTelega ftLabeledPrice
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftLabeledPrice;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a portion of the price for goods or services.
  /// https://core.telegram.org/bots/api#labeledprice
  /// </summary>
  TftLabeledPrice = class
  private
    FLabel: String;
    FAmount: Integer;
  public
    /// <summary>
    /// Portion label.
    /// </summary>
    property LabelPrice: String read FLabel write FLabel;
    /// <summary>
    /// Price of the product in the smallest units of the currency (integer,
    /// not float/double).
    /// For example, for a price of US$ 1.45 pass amount = 145. See the exp parameter
    /// in currencies.json, it shows the number of digits past the decimal point
    /// for each currency  (2 for the majority of currencies).
    ///
    /// https://core.telegram.org/bots/payments/currencies.json
    /// </summary>
    property Amount: Integer read FAmount write FAmount;
  end;

implementation

end.
