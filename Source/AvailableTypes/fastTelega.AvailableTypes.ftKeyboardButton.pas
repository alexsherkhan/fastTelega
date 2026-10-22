/// <summary>
/// fastTelega ftKeyboardButton
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftKeyboardButton;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  fastTelega.AvailableTypes.ftKeyboardButtonPollType,
  fastTelega.AvailableTypes.ftWebAppInfo;

type

  /// <summary>
  /// This object represents one button of the reply keyboard. For simple text
  /// buttons String can be used instead of this object to specify text of the
  /// button. Optional fields request_contact, request_location, and
  /// request_poll are mutually exclusive.
  /// </summary>
  TftKeyboardButton = class
  private
    FText: String;
    FRequestContact: Boolean;
    FRequestLocation: Boolean;
    FRequestPoll: TftKeyboardButtonPollType;
    FWebApp: TftWebAppInfo;
  public
    constructor Create(AText: String; ARequestContact: Boolean = false;
      ARequestLocation: Boolean = false); virtual;
    destructor Destroy; override;
    /// <summary>
    /// Text of the button. If none of the optional fields are used,
    /// it will be sent to the bot as a message when the button is pressed
    /// </summary>
    property Text: String read FText write FText;
    /// <summary>
    /// Optional. If True, the user's phone number will be sent as a contact
    /// when the button is pressed. Available in private chats only
    /// </summary>
    property RequestContact: Boolean read FRequestContact write FRequestContact;
    /// <summary>
    /// Optional. If True, the user's current location will be sent when the
    /// button is pressed. Available in private chats only.
    /// </summary>
    property RequestLocation: Boolean read FRequestLocation
      write FRequestLocation;
    /// Optional. If specified, the user will be asked to create a poll and send it to the bot when the button is pressed.
    /// Available in private chats only.
    property RequestPoll: TftKeyboardButtonPollType read FRequestPoll
      write FRequestPoll;
    /// Optional. If specified, the described Web App will be launched when the button is pressed.
    /// The Web App will be able to send a “web_app_data” service message.
    /// Available in private chats only.
    property WebApp: TftWebAppInfo read FWebApp write FWebApp;
  end;

implementation

{ TftKeyboardButton }

constructor TftKeyboardButton.Create(AText: String; ARequestContact: Boolean;
  ARequestLocation: Boolean);
begin
  FText := AText;
  FRequestContact := ARequestContact;
  FRequestLocation := ARequestLocation;
  FRequestPoll := TftKeyboardButtonPollType.Create;
  FWebApp := TftWebAppInfo.Create;
end;

destructor TftKeyboardButton.Destroy;
begin
  FRequestPoll.Free;
  FWebApp.Free;
  inherited;
end;

end.
