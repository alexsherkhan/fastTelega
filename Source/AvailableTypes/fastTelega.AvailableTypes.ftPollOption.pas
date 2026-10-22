/// <summary>
/// fastTelega ftPollOption
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftPollOption;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type

  /// <summary>
  /// This object contains information about one answer option in a poll.
  /// </summary>
  TftPollOption = class
  private
    FText: String;
    FVoterCount: Integer;
  public
    /// <summary>
    /// Option text, 1-100 characters
    /// </summary>
    property Text: String read FText write FText;
    /// <summary>
    /// Number of users that voted for this option
    /// </summary>
    property VoterCount: Integer read FVoterCount write FVoterCount;
  end;

  TftPollOptionList = TArray<TftPollOption>;

implementation

end.
