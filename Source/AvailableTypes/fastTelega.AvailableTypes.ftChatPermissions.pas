/// <summary>
/// fastTelega ftChatPermissions
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftChatPermissions;

interface

uses
  {Delphi}
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF};

type

  /// <summary>
  /// Describes actions that a non-administrator user is allowed to take in a chat.
  /// </summary>
  TftChatPermissions = class
  private
    FCanSendMessages: Boolean;
    FCanSendMediaMessages: Boolean;
    FCanSendPolls: Boolean;
    FCanSendOtherMessages: Boolean;
    FCanAddWebPagePreviews: Boolean;
    FCanChangeInfo: Boolean;
    FCanInviteUsers: Boolean;
    FCanPinMessages: Boolean;
    FCanManageTopics: Boolean;
  public
    /// <summary>
    /// Optional. True, if the user is allowed to send text messages, contacts, locations and venues
    /// </summary>
    property CanSendMessages: Boolean read FCanSendMessages
      write FCanSendMessages;
    /// <summary>
    /// Optional. True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages
    /// </summary>
    property CanSendMediaMessages: Boolean read FCanSendMediaMessages
      write FCanSendMediaMessages;
    /// <summary>
    /// Optional. True, if the user is allowed to send polls, implies can_send_messages
    /// </summary>
    property CanSendPolls: Boolean read FCanSendPolls write FCanSendPolls;
    /// <summary>
    /// Optional. True, if the user is allowed to send animations, games, stickers and use inline bots, implies can_send_media_messages
    /// </summary>
    property CanSendOtherMessages: Boolean read FCanSendOtherMessages
      write FCanSendOtherMessages;
    /// <summary>
    /// Optional. True, if the user is allowed to add web page previews to their messages, implies can_send_media_messages
    /// </summary>
    property CanAddWebPagePreviews: Boolean read FCanAddWebPagePreviews
      write FCanAddWebPagePreviews;
    /// <summary>
    /// Optional. True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups
    /// </summary>
    property CanChangeInfo: Boolean read FCanChangeInfo write FCanChangeInfo;
    /// <summary>
    /// Optional. True, if the user is allowed to invite new users to the chat
    /// </summary>
    property CanInviteUsers: Boolean read FCanInviteUsers write FCanInviteUsers;
    /// <summary>
    /// Optional. True, if the user is allowed to pin messages. Ignored in public supergroups
    /// </summary>
    property CanPinMessages: Boolean read FCanPinMessages write FCanPinMessages;
    /// <summary>
    /// Optional. True, if the user is allowed to create forum topics.
    ///
    /// If omitted defaults to the value of canPinMessages
    /// </summary>
    property CanManageTopics: Boolean read FCanManageTopics
      write FCanManageTopics;
  end;

implementation

end.
