/// <summary>
/// fastTelega ftMessageId
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftMessageId;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents a unique message identifier.
  /// </summary>
  TftMessageId = class
  private
    FMessageId: Integer;
  public
    /// <summary>
    /// Unique message identifier
    /// </summary>
    property messageId: Integer read FMessageId write FMessageId;
  end;

implementation

end.
