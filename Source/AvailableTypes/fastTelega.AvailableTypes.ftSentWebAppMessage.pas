/// <summary>
/// fastTelega ftSentWebAppMessage
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftSentWebAppMessage;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// Contains information about an inline message sent by a Web App on behalf of a user.
  /// </summary>
  TftSentWebAppMessage = class
  private
    FInlineMessageId: String;
  public
    /// <summary>
    /// Optional. Identifier of the sent inline message.
    /// Available only if there is an inline keyboard attached to the message.
    /// </summary>
    property InlineMessageId: String read FInlineMessageId
      write FInlineMessageId;
  end;

implementation

end.
