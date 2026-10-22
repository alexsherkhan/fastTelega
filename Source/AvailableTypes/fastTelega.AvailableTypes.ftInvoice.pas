/// <summary>
/// fastTelega ftInvoice
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInvoice;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object contains basic information about an invoice.
  /// </summary>
  TftInvoice = class
  private
    FTitle: String;
    FDescription: String;
    FStartParameter: String;
    FCurrency: String;
    FTotalAmount: Integer;
  public
    /// <summary>
    /// Product name
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// Product description
    /// </summary>
    property Description: String read FDescription write FDescription;
    /// <summary>
    /// Unique bot deep-linking parameter that can be
    /// used to generate this invoice
    /// </summary>
    property StartParameter: String read FStartParameter write FStartParameter;
    /// <summary>
    /// Three-letter ISO 4217 currency code
    /// </summary>
    property CurrenCy: String read FCurrency write FCurrency;
    /// <summary>
    /// Total price in the smallest units of the currency (integer,
    /// not float/double). For example, for a price of US$ 1.45 pass
    /// amount = 145. See the exp parameter in currencies.json,
    /// it shows the number of digits past the decimal point for
    /// each currency (2 for the majority of currencies).
    /// </summary>
    property TotalAmount: Integer read FTotalAmount write FTotalAmount;
  end;

implementation

{ TftInlineKeyboardMarkup }

end.
