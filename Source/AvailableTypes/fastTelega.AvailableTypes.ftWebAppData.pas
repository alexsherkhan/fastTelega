/// <summary>
/// fastTelega ftWebAppData
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftWebAppData;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// Contains data sent from a Web App to the bot.
  /// </summary>
  TftWebAppData = class
  private
    FData: String;
    FButtonText: String;
  public
    /// <summary>
    /// The data.
    /// Be aware that a bad client can send arbitrary data in this field.
    /// </summary>
    property Data: String read FData write FData;
    /// <summary>
    /// Text of the webApp keyboard button, from which the Web App was opened.
    /// Be aware that a bad client can send arbitrary data in this field.
    /// </summary>
    property ButtonText: String read FButtonText write FButtonText;
  end;

implementation

end.
