/// <summary>
/// fastTelega ftBotCommand
/// Alexander Syrykh
/// </summary>
unit fastTelega.AvailableTypes.ftBotCommand;

interface

uses
  {$IFDEF FPC}Generics.Collections{$ELSE}System.Generics.Collections{$ENDIF},
  {$IFDEF FPC}SysUtils{$ELSE}System.SysUtils{$ENDIF},
  {$IFDEF FPC}Classes{$ELSE}System.Classes{$ENDIF},

  {fastTelega}
  fastTelega.AvailableTypes.ftCallbackGame;

const
  TypeBotCommandScopeDefault = 'default';
  TypeBotCommandScopeAllPrivateChats = 'all_private_chats';
  TypeBotCommandScopeAllGroupChats = 'all_group_chats';
  TypeBotCommandScopeAllChatAdministrators = 'all_chat_administrators';
  TypeBotCommandScopeChat = 'chat';
  TypeBotCommandScopeChatAdministrators = 'chat_administrators';
  TypeBotCommandScopeChatMember = 'chat_member';

type

  /// <summary>
  /// This object represents a bot command.
  /// https://core.telegram.org/bots/api#botcommand
  /// </summary>
  TftBotCommand = class
  private
    FCommand: String;
    FDescription: String;
  public
    /// <summary>
    /// Command label.
    /// </summary>
    property Command: String read FCommand write FCommand;
    /// <summary>
    /// Description label.
    /// </summary>
    property Description: String read FDescription write FDescription;
  end;

  /// <summary>
  /// This abstract class is base of all bot command scopes.
  /// This object represents the scope to which bot commands are applied.
  /// </summary>
  TftBotCommandScope = class
  private
    FType: String;
  public
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
  end;

  TftBotCommandScopeAllChatAdministrators = class(TftBotCommandScope)
  private
    FType: String;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
  end;

  TftBotCommandScopeAllGroupChats = class(TftBotCommandScope)
  private
    FType: String;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
  end;

  TftBotCommandScopeAllPrivateChats = class(TftBotCommandScope)
  private
    FType: String;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
  end;

  TftBotCommandScopeChat = class(TftBotCommandScope)
  private
    FType: String;
    FChatId: Int64;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
    property ChatId: Int64 read FChatId write FChatId;
  end;

  TftBotCommandScopeChatAdministrators = class(TftBotCommandScope)
  private
    FType: String;
    FChatId: Int64;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
    property ChatId: Int64 read FChatId write FChatId;
  end;

  TftBotCommandScopeChatMember = class(TftBotCommandScope)
  private
    FType: String;
    FChatId: Int64;
    FUserId: Int64;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
    property ChatId: Int64 read FChatId write FChatId;
    property UserId: Int64 read FUserId write FUserId;
  end;

  TftBotCommandScopeDefault = class(TftBotCommandScope)
  private
    FType: String;
  public
    constructor Create;
    /// <summary>
    /// Scope type
    /// </summary>
    property Type_S: String read FType write FType;
  end;

implementation

{ TftBotCommandScopeAllChatAdministrators }

constructor TftBotCommandScopeAllChatAdministrators.Create;
begin
  Self.Type_S := Type_S;
end;

{ TftBotCommandScopeAllGroupChats }

constructor TftBotCommandScopeAllGroupChats.Create;
begin
  Self.Type_S := Type_S;
end;

{ TftBotCommandScopeAllPrivateChats }

constructor TftBotCommandScopeAllPrivateChats.Create;
begin
  Self.Type_S := Type_S;
end;

{ TftBotCommandScopeChat }

constructor TftBotCommandScopeChat.Create;
begin
  Self.Type_S := Type_S;
end;

{ TftBotCommandScopeChatAdministrators }

constructor TftBotCommandScopeChatAdministrators.Create;
begin
  Self.Type_S := Type_S;
end;

{ TftBotCommandScopeChatMember }

constructor TftBotCommandScopeChatMember.Create;
begin
  Self.Type_S := Type_S;
end;

{ TftBotCommandScopeDefault }

constructor TftBotCommandScopeDefault.Create;
begin
  Self.Type_S := Type_S;
end;

end.
