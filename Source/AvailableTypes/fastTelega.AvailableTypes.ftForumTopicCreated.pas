/// <summary>
/// fastTelega ftForumTopicCreated
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftForumTopicCreated;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a service message about a new forum topic created in the chat.
  /// </summary>
  TftForumTopicCreated = class
  private
    FName: String;
    FIconColor: Integer;
    FIconCustomEmojiId: String;
  public
    /// <summary>
    /// Name of the topic
    /// </summary>
    property Name: String read FName write FName;
    /// <summary>
    /// Color of the topic icon in RGB format
    /// </summary>
    property IconColor: Integer read FIconColor write FIconColor;
    /// <summary>
    /// Optional. Unique identifier of the custom emoji shown as the topic icon
    /// </summary>
    property IconCustomEmojiId: String read FIconCustomEmojiId
      write FIconCustomEmojiId;
  end;

implementation

end.
