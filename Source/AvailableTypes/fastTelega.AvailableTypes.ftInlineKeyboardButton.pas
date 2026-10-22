/// <summary>
/// fastTelega TftInlineKeyboardButton
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftInlineKeyboardButton;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftKeyboardButton,
  fastTelega.AvailableTypes.ftLoginUrl,
  fastTelega.AvailableTypes.ftCallbackGame,
  fastTelega.AvailableTypes.ftWebAppInfo;

type

  /// <summary>
  /// This object represents one button of an inline keyboard. You must use
  /// exactly one of the optional fields.
  /// </summary>
  TftInlineKeyboardButton = class(TftKeyboardButton)
  private
    FUrl: String;
    FLoginUrl: TftLoginUrl;
    FCallbackData: String;
    FWebApp: TftWebAppInfo;
    FSwitchInlineQuery: String;
    FSwitchInlineQueryCurrentChat: String;
    FCallbackGame: TftCallbackGame;
    FPay: Boolean;
  public
    constructor Create(AText: String; ArequestContact: Boolean = false;
      ArequestLocation: Boolean = false); override;
    destructor Destroy; override;
    /// <summary>
    /// Optional. HTTP or tg:// url to be opened when button is pressed
    property Url: String read FUrl write FUrl;
    /// <summary>
    /// Optional. An HTTP URL used to automatically authorize the user. Can be
    /// used as a replacement for the Telegram Login Widget.callback_data: String;
    /// Optional. Data to be sent in a callback query to the bot when button
    /// is pressed, 1 - 64 bytes
    /// </summary>
    property LoginUrL: TftLoginUrl read FLoginUrl write FLoginUrl;
    /// <summary>
    /// Optional. Data to be sent in a callback query to the bot when button is pressed.
    /// </summary>
    property CallbaCkData: String read FCallbackData write FCallbackData;
    /// <summary>
    /// Optional. Description of the Web App that will be launched when the user presses the button.
    /// The Web App will be able to send an arbitrary message on behalf of the user using the method Api::answerWebAppQuery.
    /// Available only in private chats between a user and the bot.
    /// </summary>
    property WebApp: TftWebAppInfo read FWebApp write FWebApp;
    /// <summary>
    /// Optional. If set, pressing the button will prompt the user to select
    /// one of their chats, open that Chat and
    /// insert the bot 's username and the specified inline query
    /// in the input field.Can be empty,
    /// in which case just the bot 's username will be inserted.
    /// Note: This offers an easy way for users to start using your bot in
    /// inline mode when they are currently in a private chat with it. Especially
    /// useful when combined with switch_pm… actions – in this case the user
    /// will be automatically returned to the chat they switched from, skipping
    /// the chat selection screen.
    /// </summary>
    property SwitchInlineQuery: String read FSwitchInlineQuery
      write FSwitchInlineQuery;
    /// <summary>
    /// Optional. If set, pressing the button will insert the bot's username
    /// and the specified inline query in the current chat's input field.
    /// Can be empty, in which case only the bot's username will be inserted.
    /// This offers a quick way for the User to open your bot in inline mode
    // in the same Chat – good for selecting something from multiple options.
    /// </summary>
    property SwitchInlineQueryCurrentChat: String
      read FSwitchInlineQueryCurrentChat write FSwitchInlineQueryCurrentChat;
    /// <summary>
    /// Optional. Description of the game that will be launched when the user
    /// presses the button.
    /// NOTE: This type of button must always be the first button in
    /// the first row.
    /// </summary>
    property CallbackGame: TftCallbackGame read FCallbackGame
      write FCallbackGame;
    /// Optional. Specify True, to send a Pay button.
    /// NOTE: This type of button must always be the first button
    /// in the first row.
    /// </summary>
    property Pay: Boolean read FPay write FPay;
  end;

implementation

{ TftInlineKeyboardButton }

constructor TftInlineKeyboardButton.Create(AText: String;
  ArequestContact, ArequestLocation: Boolean);
begin
  inherited Create(AText, ArequestContact, ArequestLocation);
  FLoginUrl := TftLoginUrl.Create;
  FCallbackGame := TftCallbackGame.Create;
  FWebApp := TftWebAppInfo.Create
end;

destructor TftInlineKeyboardButton.Destroy;
begin
  FreeAndNil(FLoginUrl);
  FreeAndNil(FCallbackGame);
  FreeAndNil(FWebApp);
  inherited;
end;

end.
