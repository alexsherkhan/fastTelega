/// <summary>
/// fastTelega ftDice
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftDice;

interface

uses
  {Delphi}
  System.Generics.Collections,
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object represents an animated emoji that displays a random value.
  /// </summary>
  TftDice = class
  private
    FEmoji: String;
    FValue: Integer;
  public
    /// <summary>
    /// Emoji on which the dice throw animation is based
    /// </summary>
    property Emoji: String read FEmoji write FEmoji;
    /// <summary>
    /// Value of the dice, 1-6 for “🎲”, “🎯” and “🎳” base emoji,
    /// 1-5 for “🏀” and “⚽” base emoji, 1-64 for “🎰” base emoji
    /// </summary>
    property Value: Integer read FValue write FValue;
  end;

implementation

end.
