/// <summary>
/// fastTelega ftShippingOption
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftShippingOption;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  fastTelega.AvailableTypes.ftLabeledPrice;

type

  /// <summary>
  /// This object represents one shipping option.
  /// https://core.telegram.org/bots/api#shippingoption
  /// </summary>
  TftShippingOption = class
  private
    FId: String;
    FTitle: String;
    FPrices: TArray<TftLabeledPrice>;
  public
    /// <summary>
    /// Shipping option identifier.
    /// </summary>
    property Id: String read FId write FId;
    /// <summary>
    /// Option title.
    /// </summary>
    property Title: String read FTitle write FTitle;
    /// <summary>
    /// List of price options.
    /// </summary>
    property Prices: TArray<TftLabeledPrice> read FPrices write FPrices;
  end;

implementation

end.
