/// <summary>
/// fastTelega ftForumTopic
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftForumTopic;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// This object represents a forum topic.
  /// </summary>
  TftForumTopic = class
  private
    FMessageThreadId: Integer;
    FName: String;
    FIconColor: Integer;
    FIconCustomEmojiId: String;
  public
    /// <summary>
    /// Unique identifier of the forum topic
    /// </summary>
    property MessageThreadId: Integer read FMessageThreadId
      write FMessageThreadId;
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
