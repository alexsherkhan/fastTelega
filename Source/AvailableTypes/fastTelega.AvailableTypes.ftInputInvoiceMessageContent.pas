/// <summary>
/// fastTelega ftInputInvoiceMessageContent
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInputInvoiceMessageContent;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftInputMessageContent;

type

  /// <summary>
  /// This object represents the content of a media message to be sent.
  /// </summary>
  TftInputInvoiceMessageContent = class(TftInputMessageContent)
  private
    FTitle: string;
    FDescription: string;
    FPayload: string;
    FProviderToken: string;
    FCurrency: string;
    FPrices: TList<Integer>;
    FMaxTipAmount: Integer;
    FSuggestedTipAmounts: Integer;
    FProviderData: string;
    FPhotoUrl: string;
    FPhotoSize: Integer;
    FPhotoWidth: Integer;
    FPhotoHeight: Integer;
    FNeedName: Boolean;
    FNeedPhoneNumber: Boolean;
    FNeedEmail: Boolean;
    FNeedShippingAddress: Boolean;
    FSendPhoneNumberToProvider: Boolean;
    FSendEmailToProvider: Boolean;
    FIsFlexible: Boolean;
  public
    constructor Create();

    /// <summary>
    /// Product name, 1-32 characters
    /// </summary>
    property Title: string read FTitle write FTitle;

    /// <summary>
    /// Product description, 1-255 characters
    /// </summary>
    property Description: string read FDescription write FDescription;

    /// <summary>
    /// Bot-defined invoice payload, 1-128 bytes.
    /// This will not be displayed to the user, use for your internal processes.
    /// </summary>
    property Payload: string read FPayload write FPayload;

    /// <summary>
    /// Payment provider token, obtained via Botfather
    /// </summary>
    property ProviderToken: string read FProviderToken write FProviderToken;

    /// <summary>
    /// Three-letter ISO 4217 currency code, see https://core.telegram.org/bots/payments#supported-currencies
    /// </summary>
    property Currency: string read FCurrency write FCurrency;

    /// <summary>
    /// Price breakdown, a JSON-serialized list of components (e.g. product price, tax, discount, delivery cost, delivery tax, bonus, etc.)
    /// </summary>
    property Prices: TList<Integer> read FPrices write FPrices;

    /// <summary>
    /// Optional. The maximum accepted amount for tips in the smallest units of the currency (integer, not float/double).
    /// For example, for a maximum tip of US$ 1.45 pass max_tip_amount = 145.
    /// See the exp parameter in https://core.telegram.org/bots/payments/currencies.json, it shows the number of digits past the decimal point for each currency (2 for the majority of currencies).
    /// Defaults to 0
    /// </summary>
    property MaxTipAmount: Integer read FMaxTipAmount write FMaxTipAmount;

    /// <summary>
    /// Optional. A JSON-serialized array of suggested amounts of tip in the smallest units of the currency (integer, not float/double).
    /// At most 4 suggested tip amounts can be specified.
    /// The suggested tip amounts must be positive, passed in a strictly increased order and must not exceed maxTipAmount.
    /// </summary>
    property SuggestedTipAmounts: Integer read FSuggestedTipAmounts
      write FSuggestedTipAmounts;

    /// <summary>
    /// Optional. A JSON-serialized object for data about the invoice, which will be shared with the payment provider.
    /// A detailed description of the required fields should be provided by the payment provider.
    /// </summary>
    property ProviderData: string read FProviderData write FProviderData;

    /// <summary>
    /// Optional. URL of the product photo for the invoice.
    /// Can be a photo of the goods or a marketing image for a service.
    /// People like it better when they see what they are paying for.
    /// </summary>
    property PhotoUrl: string read FPhotoUrl write FPhotoUrl;

    /// <summary>
    /// Optional. Photo size
    /// </summary>
    property PhotoSize: Integer read FPhotoSize write FPhotoSize;

    /// <summary>
    /// Optional. Photo width
    /// </summary>
    property PhotoWidth: Integer read FPhotoWidth write FPhotoWidth;

    /// <summary>
    /// Optional. Photo height
    /// </summary>
    property PhotoHeight: Integer read FPhotoHeight write FPhotoHeight;

    /// <summary>
    /// Optional. Pass True, if you require the user's full name to complete the order
    /// </summary>
    property NeedName: Boolean read FNeedName write FNeedName;

    /// <summary>
    /// Optional. Pass True, if you require the user's phone number to complete the order
    /// </summary>
    property NeedPhoneNumber: Boolean read FNeedPhoneNumber
      write FNeedPhoneNumber;

    /// <summary>
    /// Optional. Pass True, if you require the user's email address to complete the order
    /// </summary>
    property NeedEmail: Boolean read FNeedEmail write FNeedEmail;

    /// <summary>
    /// Optional. Pass True, if you require the user's shipping address to complete the order
    /// </summary>
    property NeedShippingAddress: Boolean read FNeedShippingAddress
      write FNeedShippingAddress;

    /// <summary>
    /// Optional. Pass True, if user's phone number should be sent to provider
    /// </summary>
    property SendPhoneNumberToProvider: Boolean read FSendPhoneNumberToProvider
      write FSendPhoneNumberToProvider;

    /// <summary>
    /// Optional. Pass True, if user's email address should be sent to provider
    /// </summary>
    property SendEmailToProvider: Boolean read FSendEmailToProvider
      write FSendEmailToProvider;

    /// <summary>
    /// Optional. Pass True, if the final price depends on the shipping method
    /// </summary>
    property IsFlexible: Boolean read FIsFlexible write FIsFlexible;
  end;

implementation

{ TftInputInvoiceMessageContent }

constructor TftInputInvoiceMessageContent.Create;
begin

end;

end.
