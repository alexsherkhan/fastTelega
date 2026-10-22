/// <summary>
/// fastTelega ChatAdministratorRights
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftChatAdministratorRights;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes;

type
  /// <summary>
  /// Represents the rights of an administrator in a chat.
  /// </summary>
  TftChatAdministratorRights = class
  private
    FIsAnonymous: Boolean;
    FCanManageChat: Boolean;
    FCanDeleteMessages: Boolean;
    FCanManageVideoChats: Boolean;
    FCanRestrictMembers: Boolean;
    FCanPromoteMembers: Boolean;
    FCanChangeInfo: Boolean;
    FCanInviteUsers: Boolean;
    FCanPostMessages: Boolean;
    FCanEditMessages: Boolean;
    FCanPinMessages: Boolean;
    FCanManageTopics: Boolean;
  public
    /// <summary>
    /// True, if the user's presence in the chat is hidden
    /// </summary>
    property IsAnonymous: Boolean read FIsAnonymous write FIsAnonymous;

    /// <summary>
    /// True, if the administrator can access the chat event log, chat statistics, message statistics in channels, see channel members, see anonymous administrators in supergroups and ignore slow mode.
    /// Implied by any other administrator privilege
    /// </summary>
    property CanManageChat: Boolean read FCanManageChat write FCanManageChat;

    /// <summary>
    /// True, if the administrator can delete messages of other users
    /// </summary>
    property CanDeleteMessages: Boolean read FCanDeleteMessages
      write FCanDeleteMessages;

    /// <summary>
    /// True, if the administrator can manage video chats
    /// </summary>
    property CanManageVideoChats: Boolean read FCanManageVideoChats
      write FCanManageVideoChats;

    /// <summary>
    /// True, if the administrator can restrict, ban or unban chat members
    /// </summary>
    property CanRestriCtMembers: Boolean read FCanRestrictMembers
      write FCanRestrictMembers;

    /// <summary>
    /// True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)
    /// </summary>
    property CanPromoteMembers: Boolean read FCanPromoteMembers
      write FCanPromoteMembers;

    /// <summary>
    /// True, if the user is allowed to change the chat title, photo and other settings
    /// </summary>
    property CanChangeInfo: Boolean read FCanChangeInfo write FCanChangeInfo;

    /// <summary>
    /// True, if the user is allowed to invite new users to the chat
    /// </summary>
    property CanInviteUsers: Boolean read FCanInviteUsers write FCanInviteUsers;

    /// <summary>
    /// Optional. True, if the administrator can post in the channel; channels only
    /// </summary>
    property CanPostMessages: Boolean read FCanPostMessages
      write FCanPostMessages;

    /// <summary>
    /// Optional. True, if the administrator can edit messages of other users and can pin messages; channels only
    /// </summary>
    property CanEditMessages: Boolean read FCanEditMessages
      write FCanEditMessages;

    /// <summary>
    /// Optional. True, if the user is allowed to pin messages; groups and supergroups only
    /// </summary>
    property CanPinMessages: Boolean read FCanPinMessages write FCanPinMessages;

    /// <summary>
    /// Optional. True, if the user is allowed to create, rename, close, and reopen forum topics; supergroups only
    /// </summary>
    property CanManageTopics: Boolean read FCanManageTopics
      write FCanManageTopics;
  end;

implementation

end.
