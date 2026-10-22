/// <summary>
/// fastTelega ftPollAnswer
/// Alexander Syrykh
/// </summary>
unit fastTelega.ftPollAnswer;

interface

uses
  {Delphi}
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents an answer of a user in a non-anonymous poll.
  /// </summary>
  TftPollAnswer = class
  private
    Fpoll_id: String;
    Fuser: TftUser;
    Foption_ids: Array of Integer;
  public
    /// <summary>
    /// Unique poll identifier
    /// </summary>
    property poll_id: String read Fpoll_id write Fpoll_id;
    /// <summary>
    /// The user, who changed the answer to the poll
    /// </summary>
    property User: TftUser read Fuser write Fuser;
    // /// <summary>
    // /// 0-based identifiers of answer options, chosen by the user. May be empty if the user retracted their vote.
    // /// </summary>
    // property option_ids: Array of Integer read Foption_ids write Foption_ids;
  end;

implementation

end.
