/// <summary>
/// fastTelega ftKeyboardButtonPollType
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftKeyboardButtonPollType;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents type of a poll, which is allowed to be created and
  /// sent when the corresponding button is pressed.
  /// </summary>
  TftKeyboardButtonPollType = class
  private
    FType: String;
  public
    /// <summary>
    /// ptional. If quiz is passed, the user will be allowed to create only polls in the quiz mode.
    /// If regular is passed, only regular polls will be allowed.
    /// Otherwise, the user will be allowed to create a poll of any type.
    /// </summary>
    property TypeS: String read FType write FType;

  end;

implementation

end.
