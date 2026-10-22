/// <summary>
/// fastTelega ftPassportElementErrorDataField
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPassportElementErrorDataField;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {fastTelega}
  fastTelega.AvailableTypes.ftPassportElementError;

type
  /// <summary>
  /// Represents an issue in one of the data fields that was provided by the user.
  /// The error is considered resolved when the field's value changes.'
  /// </summary>
  TftPassportElementErrorDataField = class(TftPassportElementError)
  private
    FFieldName: String;
    FDataHash: String;
  public
    constructor Create;

    /// <summary>
    /// Name of the data field which has the error
    /// </summary>
    property FieldName: String read FFieldName write FFieldName;

    /// <summary>
    /// Base64-encoded data hash
    /// </summary>
    property DataHash: String read FDataHash write FDataHash;
  end;

implementation

{ TftPassportElementErrorDataField }

constructor TftPassportElementErrorDataField.Create;
begin
  Self.Source := PassportElementErrorDataFieldSOURCE;
end;

end.
