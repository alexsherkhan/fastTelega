/// <summary>
/// fastTelega ftReplyKeyboardMarkup
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftReplyKeyboardMarkup;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftReplyBase,
  fastTelega.AvailableTypes.ftKeyboardButton;

type
  TftKeyboardRow = TList<TftKeyboardButton>;


  /// <summary>
  /// This object represents a custom keyboard with reply options
  /// (see https://core.telegram.org/bots/features#keyboards for details and examples).
  /// </summary>
  TftReplyKeyboardMarkup = class(TftReplyBase)
  private
    FKeyboard: TList<TftKeyboardRow>;
    FIsPersistent: Boolean;
    FResizeKeyboard: Boolean;
    FOneTimeKeyboard: Boolean;
    FInputFieldPlaceholder: Boolean;
    FSelective: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    /// <summary>
    /// Array of button rows, each represented by an Array of KeyboardButton objects
    /// </summary>
    property Keyboard: TList<TftKeyboardRow> read FKeyboard
      write FKeyboard;
    /// <summary>
    /// Requests clients to always show the keyboard when the regular keyboard is hidden.
    /// Defaults to false, in which case the custom keyboard can be hidden and opened with a keyboard icon.
    /// </summary>
    property IsPersistent: Boolean read FIsPersistent write FIsPersistent;
    /// <summary>
    /// Optional. Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons).
    /// Defaults to false, in which case the custom keyboard is always of the same height as the app's standard keyboard.
    /// </summary>
    property ResizeKeyboard: Boolean read FResizeKeyboard write FResizeKeyboard;
    /// <summary>
    /// Optional. Requests clients to hide the keyboard as soon as it's been used.
    /// The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again.
    /// Defaults to false
    /// </summary>
    property OneTimeKeyboard: Boolean read FOneTimeKeyboard
      write FOneTimeKeyboard;
    /// <summary>
    /// Optional. The placeholder to be shown in the input field when the keyboard is active; 1-64 characters
    /// </summary>
    property InputFieldPlaceholder: Boolean read FInputFieldPlaceholder
      write FInputFieldPlaceholder;
    /// <summary>
    /// Optional. Use this parameter if you want to show the keyboard to specific users only.
    /// Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has replyToMessageId), sender of the original message.
    ///
    /// Example: A user requests to change the bot's language, bot replies to the request with a keyboard to select the new language.
    /// Other users in the group don't see the keyboard.
    /// </summary>
    property Selective: Boolean read FSelective write FSelective;
  end;

implementation

{ TftReplyKeyboardMarkup }

constructor TftReplyKeyboardMarkup.Create;
begin
  FKeyboard := TList<TftKeyboardRow>.Create;
  FResizeKeyboard := false;
  FOneTimeKeyboard := false;
  FSelective := false;
end;

destructor TftReplyKeyboardMarkup.Destroy;
begin
  FreeAndNil(FKeyboard);
  inherited;
end;

end.
