/// <summary>
/// fastTelega ftForumTopicEdited
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftForumTopicEdited;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a service message about an edited forum topic.
  /// </summary>
  TftForumTopicEdited = class
  private
    FName: String;
    FIconCustomEmojiId: String;
  public
    /// <summary>
    /// Optional. New name of the topic, if it was edited
    /// </summary>
    property Name: String read FName write FName;
    /// <summary>
    /// Optional. New identifier of the custom emoji shown as the topic icon, if it was edited; an empty string if the icon was removed
    /// </summary>
    property IconCustomEmojiId: String read FIconCustomEmojiId
      write FIconCustomEmojiId;
  end;

implementation

end.
