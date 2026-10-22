/// <summary>
/// fastTelega ftChatLocation
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftChatLocation;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftLocation;

type

  /// <summary>
  /// Represents a location to which a chat is connected.
  /// </summary>
  TftChatLocation = class
  private
    FLocation: TftLocation;
    FAddress: String;
  public
    /// <summary>
    /// The location to which the supergroup is connected. Can't be a live location.
    /// </summary>
    property Location: TftLocation read FLocation write FLocation;
    /// <summary>
    /// Location address; 1-64 characters, as defined by the chat owner
    /// </summary>
    property Address: String read FAddress write FAddress;
  end;

implementation

end.
