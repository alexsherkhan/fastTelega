/// <summary>
/// fastTelega ftLoginUrl
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftLoginUrl;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents a parameter of the inline keyboard button used
  /// to automatically authorize a user.
  /// </summary>
  TftLoginUrl = class
  private
    FUrl: String;
    FForwardText: String;
    FBotUsername: String;
    FRequestWriteAccess: Boolean;
  public
    /// <summary>
    /// An HTTP URL to be opened with user authorization data added to the
    /// query string when the button is pressed. If the user refuses to provide
    /// authorization data, the original URL without information about the user
    /// will be opened. The data added is the same as described in Receiving
    /// authorization data.
    /// NOTE: You must always check the hash of the received data to verify
    /// the authentication and the integrity of the data as described in
    /// Checking authorization.
    /// </summary>
    property Url: String read FUrl write FUrl;
    /// <summary>
    /// Optional. New text of the button in forwarded messages.
    /// </summary>
    property ForwardText: String read FForwardText write FForwardText;
    /// <summary>
    /// Optional. Username of a bot, which will be used for user authorization.
    /// See Setting up a bot for more details. If not specified, the current
    /// bot's username will be assumed. The url's domain must be the same as
    /// the domain linked with the bot. See Linking your domain to the bot
    /// for more details.
    /// </summary>
    property BotUsername: String read FBotUsername write FBotUsername;
    /// <summary>
    /// Optional. Pass True to request the permission for your bot to send
    /// messages to the user.
    /// </summary>
    property RequestWriteAccess: Boolean read FRequestWriteAccess
      write FRequestWriteAccess;
  end;

implementation

end.
