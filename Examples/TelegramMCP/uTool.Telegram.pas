// MIT License
//
// FastTelega MCP Server — Telegram Tools
//
// Exposes the Telegram Bot API as MCP tools so AI agents (Claude, etc.)
// can send messages, photos, documents, locations, and more via Telegram.

unit uTool.Telegram;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  uMakerAi.MCPServer.Core;

procedure InitTelegramTools(const AToken: string);
procedure RegisterTelegramTools(AServer: TAiMCPServer);
procedure FinalizeTelegramTools;

implementation

// ---------------------------------------------------------------------------
// Global bot instance shared by all tool instances
// ---------------------------------------------------------------------------

var
  GBot: TftBot;

// ===========================================================================
//  PARAMETER CLASSES (DTOs)
//  Attributes control JSON schema generation and parameter deserialization.
// ===========================================================================

type

  // Helper for tools with no input parameters
  TNoParams = class
  end;

  // ---------------------------------------------------------------------------
  TSendMessageParams = class
  private
    FChatId: Integer;
    FText: string;
    FParseMode: string;
    FReplyToMessageId: Integer;
  public
    [AiMCPSchemaDescription('Target chat ID (negative for groups/channels)')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription('Text of the message to send')]
    property Text: string read FText write FText;

    [AiMCPOptional]
    [AiMCPSchemaDescription('Formatting mode: HTML or Markdown (default: plain text)')]
    property ParseMode: string read FParseMode write FParseMode;

    [AiMCPOptional]
    [AiMCPSchemaDescription('ID of the message to reply to (0 = no reply)')]
    property ReplyToMessageId: Integer read FReplyToMessageId write FReplyToMessageId;
  end;

  // ---------------------------------------------------------------------------
  TSendPhotoParams = class
  private
    FChatId: Integer;
    FPhotoPath: string;
    FCaption: string;
  public
    [AiMCPSchemaDescription('Target chat ID')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription('Full local file path of the photo to send (JPG or PNG)')]
    property PhotoPath: string read FPhotoPath write FPhotoPath;

    [AiMCPOptional]
    [AiMCPSchemaDescription('Optional caption text for the photo (HTML or Markdown supported)')]
    property Caption: string read FCaption write FCaption;
  end;

  // ---------------------------------------------------------------------------
  TSendDocumentParams = class
  private
    FChatId: Integer;
    FDocumentPath: string;
    FCaption: string;
  public
    [AiMCPSchemaDescription('Target chat ID')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription('Full local file path of the document to send')]
    property DocumentPath: string read FDocumentPath write FDocumentPath;

    [AiMCPOptional]
    [AiMCPSchemaDescription('Optional caption text for the document')]
    property Caption: string read FCaption write FCaption;
  end;

  // ---------------------------------------------------------------------------
  TSendLocationParams = class
  private
    FChatId: Integer;
    FLatitude: Double;
    FLongitude: Double;
  public
    [AiMCPSchemaDescription('Target chat ID')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription('Latitude of the location, in degrees (-90 to 90)')]
    property Latitude: Double read FLatitude write FLatitude;

    [AiMCPSchemaDescription('Longitude of the location, in degrees (-180 to 180)')]
    property Longitude: Double read FLongitude write FLongitude;
  end;

  // ---------------------------------------------------------------------------
  TSendContactParams = class
  private
    FChatId: Integer;
    FPhoneNumber: string;
    FFirstName: string;
    FLastName: string;
  public
    [AiMCPSchemaDescription('Target chat ID')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription('Contact phone number in international format (e.g. +1 555 123 4567)')]
    property PhoneNumber: string read FPhoneNumber write FPhoneNumber;

    [AiMCPSchemaDescription('Contact first name')]
    property FirstName: string read FFirstName write FFirstName;

    [AiMCPOptional]
    [AiMCPSchemaDescription('Contact last name (optional)')]
    property LastName: string read FLastName write FLastName;
  end;

  // ---------------------------------------------------------------------------
  TSendDiceParams = class
  private
    FChatId: Integer;
    FEmoji: string;
  public
    [AiMCPSchemaDescription('Target chat ID')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPOptional]
    [AiMCPSchemaDescription('Dice emoji: 🎲 (default), 🎯, 🏀, ⚽, 🎳 or 🎰')]
    property Emoji: string read FEmoji write FEmoji;
  end;

  // ---------------------------------------------------------------------------
  TSendChatActionParams = class
  private
    FChatId: Integer;
    FAction: string;
  public
    [AiMCPSchemaDescription('Target chat ID')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription(
      'Action to broadcast. One of: typing, upload_photo, record_video, ' +
      'upload_video, record_voice, upload_voice, upload_document, find_location')]
    property Action: string read FAction write FAction;
  end;

  // ---------------------------------------------------------------------------
  TForwardMessageParams = class
  private
    FChatId: Integer;
    FFromChatId: Integer;
    FMessageId: Integer;
  public
    [AiMCPSchemaDescription('Target chat ID to forward the message to')]
    property ChatId: Integer read FChatId write FChatId;

    [AiMCPSchemaDescription('Source chat ID where the original message is located')]
    property FromChatId: Integer read FFromChatId write FFromChatId;

    [AiMCPSchemaDescription('ID of the message to forward')]
    property MessageId: Integer read FMessageId write FMessageId;
  end;

  // ---------------------------------------------------------------------------
  TGetChatParams = class
  private
    FChatId: Integer;
  public
    [AiMCPSchemaDescription('Chat ID to retrieve information about')]
    property ChatId: Integer read FChatId write FChatId;
  end;

  // ---------------------------------------------------------------------------
  TGetUpdatesParams = class
  private
    FOffset: Integer;
    FLimit: Integer;
  public
    [AiMCPOptional]
    [AiMCPSchemaDescription('Offset: ID of the first update to return. Pass (last_update_id + 1) to acknowledge previous updates (default: 0)')]
    property Offset: Integer read FOffset write FOffset;

    [AiMCPOptional]
    [AiMCPSchemaDescription('Maximum number of updates to return (1-100, default: 20)')]
    property Limit: Integer read FLimit write FLimit;
  end;

// ===========================================================================
//  TOOL CLASS DECLARATIONS
// ===========================================================================

  TGetMeTool = class(TAiMCPToolBase<TNoParams>)
  protected
    function ExecuteWithParams(const AParams: TNoParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendMessageTool = class(TAiMCPToolBase<TSendMessageParams>)
  protected
    function ExecuteWithParams(const AParams: TSendMessageParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendPhotoTool = class(TAiMCPToolBase<TSendPhotoParams>)
  protected
    function ExecuteWithParams(const AParams: TSendPhotoParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendDocumentTool = class(TAiMCPToolBase<TSendDocumentParams>)
  protected
    function ExecuteWithParams(const AParams: TSendDocumentParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendLocationTool = class(TAiMCPToolBase<TSendLocationParams>)
  protected
    function ExecuteWithParams(const AParams: TSendLocationParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendContactTool = class(TAiMCPToolBase<TSendContactParams>)
  protected
    function ExecuteWithParams(const AParams: TSendContactParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendDiceTool = class(TAiMCPToolBase<TSendDiceParams>)
  protected
    function ExecuteWithParams(const AParams: TSendDiceParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TSendChatActionTool = class(TAiMCPToolBase<TSendChatActionParams>)
  protected
    function ExecuteWithParams(const AParams: TSendChatActionParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TForwardMessageTool = class(TAiMCPToolBase<TForwardMessageParams>)
  protected
    function ExecuteWithParams(const AParams: TForwardMessageParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TGetChatTool = class(TAiMCPToolBase<TGetChatParams>)
  protected
    function ExecuteWithParams(const AParams: TGetChatParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

  TGetUpdatesTool = class(TAiMCPToolBase<TGetUpdatesParams>)
  protected
    function ExecuteWithParams(const AParams: TGetUpdatesParams;
      const AuthContext: TAiAuthContext): TJSONObject; override;
  public
    constructor Create; override;
  end;

// ===========================================================================
//  PUBLIC PROCEDURES
// ===========================================================================

procedure InitTelegramTools(const AToken: string);
begin
  GBot := TftBot.Create(AToken, 'https://api.telegram.org');
end;

procedure FinalizeTelegramTools;
begin
  FreeAndNil(GBot);
end;

procedure RegisterTelegramTools(AServer: TAiMCPServer);
begin
  AServer.RegisterTool('telegram_get_me',
    function: IAiMCPTool begin Result := TGetMeTool.Create; end);

  AServer.RegisterTool('telegram_send_message',
    function: IAiMCPTool begin Result := TSendMessageTool.Create; end);

  AServer.RegisterTool('telegram_send_photo',
    function: IAiMCPTool begin Result := TSendPhotoTool.Create; end);

  AServer.RegisterTool('telegram_send_document',
    function: IAiMCPTool begin Result := TSendDocumentTool.Create; end);

  AServer.RegisterTool('telegram_send_location',
    function: IAiMCPTool begin Result := TSendLocationTool.Create; end);

  AServer.RegisterTool('telegram_send_contact',
    function: IAiMCPTool begin Result := TSendContactTool.Create; end);

  AServer.RegisterTool('telegram_send_dice',
    function: IAiMCPTool begin Result := TSendDiceTool.Create; end);

  AServer.RegisterTool('telegram_send_chat_action',
    function: IAiMCPTool begin Result := TSendChatActionTool.Create; end);

  AServer.RegisterTool('telegram_forward_message',
    function: IAiMCPTool begin Result := TForwardMessageTool.Create; end);

  AServer.RegisterTool('telegram_get_chat',
    function: IAiMCPTool begin Result := TGetChatTool.Create; end);

  AServer.RegisterTool('telegram_get_updates',
    function: IAiMCPTool begin Result := TGetUpdatesTool.Create; end);
end;

// ===========================================================================
//  TOOL IMPLEMENTATIONS
// ===========================================================================

// ---------------------------------------------------------------------------
// telegram_get_me
// ---------------------------------------------------------------------------

constructor TGetMeTool.Create;
begin
  inherited;
  FName        := 'telegram_get_me';
  FDescription := 'Returns basic information about the bot: ID, username, and display name.';
end;

function TGetMeTool.ExecuteWithParams(const AParams: TNoParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  User: TftUser;
  Info: string;
begin
  try
    User := GBot.API.getMe;
    try
      Info :=
        'Bot ID:    ' + IntToStr(User.Id)       + #10 +
        'Name:      ' + User.FirstName           + #10 +
        'Username:  @' + User.UserName           + #10 +
        'Is bot:    ' + BoolToStr(User.IsBot, True);
      Result := TAiMCPResponseBuilder.New.AddText(Info).Build;
    finally
      User.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error calling getMe: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_message
// ---------------------------------------------------------------------------

constructor TSendMessageTool.Create;
begin
  inherited;
  FName        := 'telegram_send_message';
  FDescription :=
    'Sends a text message to a Telegram chat. ' +
    'Supports HTML and Markdown formatting via the parse_mode parameter.';
end;

function TSendMessageTool.ExecuteWithParams(const AParams: TSendMessageParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Msg: TftMessage;
begin
  try
    Msg := GBot.API.sendMessage(
      AParams.ChatId, AParams.Text,
      False, AParams.ReplyToMessageId,
      nil, AParams.ParseMode);
    try
      Result := TAiMCPResponseBuilder.New
        .AddText('Message sent successfully. Message ID: ' + IntToStr(Msg.MessageId))
        .Build;
    finally
      Msg.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending message: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_photo
// ---------------------------------------------------------------------------

constructor TSendPhotoTool.Create;
begin
  inherited;
  FName        := 'telegram_send_photo';
  FDescription := 'Sends a photo from a local file path to a Telegram chat.';
end;

function TSendPhotoTool.ExecuteWithParams(const AParams: TSendPhotoParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  InputFile: TftInputFile;
  Msg: TftMessage;
begin
  try
    if not FileExists(AParams.PhotoPath) then
      Exit(TAiMCPResponseBuilder.New
        .AddText('Error: File not found: ' + AParams.PhotoPath).Build);

    InputFile := TftInputFile.fromFile(AParams.PhotoPath, 'image/jpeg');
    try
      Msg := GBot.API.sendPhoto(
        AParams.ChatId, InputFile, AParams.Caption);
      try
        Result := TAiMCPResponseBuilder.New
          .AddText('Photo sent successfully. Message ID: ' + IntToStr(Msg.MessageId))
          .Build;
      finally
        Msg.Free;
      end;
    finally
      InputFile.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending photo: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_document
// ---------------------------------------------------------------------------

constructor TSendDocumentTool.Create;
begin
  inherited;
  FName        := 'telegram_send_document';
  FDescription := 'Sends any local file as a document to a Telegram chat.';
end;

function TSendDocumentTool.ExecuteWithParams(const AParams: TSendDocumentParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  InputFile: TftInputFile;
  Msg: TftMessage;
begin
  try
    if not FileExists(AParams.DocumentPath) then
      Exit(TAiMCPResponseBuilder.New
        .AddText('Error: File not found: ' + AParams.DocumentPath).Build);

    InputFile := TftInputFile.fromFile(
      AParams.DocumentPath, 'application/octet-stream');
    try
      Msg := GBot.API.sendDocument(
        AParams.ChatId, InputFile, nil, AParams.Caption);
      try
        Result := TAiMCPResponseBuilder.New
          .AddText('Document sent successfully. Message ID: ' + IntToStr(Msg.MessageId))
          .Build;
      finally
        Msg.Free;
      end;
    finally
      InputFile.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending document: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_location
// ---------------------------------------------------------------------------

constructor TSendLocationTool.Create;
begin
  inherited;
  FName        := 'telegram_send_location';
  FDescription := 'Sends a GPS location pin to a Telegram chat.';
end;

function TSendLocationTool.ExecuteWithParams(const AParams: TSendLocationParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Msg: TftMessage;
begin
  try
    Msg := GBot.API.sendLocation(
      AParams.ChatId, AParams.Latitude, AParams.Longitude);
    try
      Result := TAiMCPResponseBuilder.New
        .AddText(Format(
          'Location sent (%.6f, %.6f). Message ID: %d',
          [AParams.Latitude, AParams.Longitude, Msg.MessageId]))
        .Build;
    finally
      Msg.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending location: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_contact
// ---------------------------------------------------------------------------

constructor TSendContactTool.Create;
begin
  inherited;
  FName        := 'telegram_send_contact';
  FDescription := 'Sends a contact card (phone number + name) to a Telegram chat.';
end;

function TSendContactTool.ExecuteWithParams(const AParams: TSendContactParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Msg: TftMessage;
begin
  try
    Msg := GBot.API.sendContact(
      AParams.ChatId,
      AParams.PhoneNumber,
      AParams.FirstName,
      AParams.LastName);
    try
      Result := TAiMCPResponseBuilder.New
        .AddText('Contact sent successfully. Message ID: ' + IntToStr(Msg.MessageId))
        .Build;
    finally
      Msg.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending contact: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_dice
// ---------------------------------------------------------------------------

constructor TSendDiceTool.Create;
begin
  inherited;
  FName        := 'telegram_send_dice';
  FDescription :=
    'Sends an animated dice emoji that rolls to a random value. ' +
    'Supported emojis: 🎲 🎯 🏀 ⚽ 🎳 🎰';
end;

function TSendDiceTool.ExecuteWithParams(const AParams: TSendDiceParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Msg: TftMessage;
  Emoji: string;
begin
  try
    Emoji := AParams.Emoji;
    if Emoji = '' then
      Emoji := '🎲';

    Msg := GBot.API.sendDice(AParams.ChatId, Emoji);
    try
      Result := TAiMCPResponseBuilder.New
        .AddText(Format(
          'Dice %s rolled to %d. Message ID: %d',
          [Emoji, Msg.Dice.Value, Msg.MessageId]))
        .Build;
    finally
      Msg.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending dice: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_send_chat_action
// ---------------------------------------------------------------------------

constructor TSendChatActionTool.Create;
begin
  inherited;
  FName        := 'telegram_send_chat_action';
  FDescription :=
    'Broadcasts a status indicator to the chat (typing, uploading, etc.). ' +
    'The indicator lasts ~5 seconds and disappears automatically.';
end;

function TSendChatActionTool.ExecuteWithParams(const AParams: TSendChatActionParams;
  const AuthContext: TAiAuthContext): TJSONObject;
begin
  try
    GBot.API.sendChatAction(AParams.ChatId, AParams.Action);
    Result := TAiMCPResponseBuilder.New
      .AddText(
        'Chat action "' + AParams.Action + '" sent to chat ' +
        IntToStr(AParams.ChatId))
      .Build;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error sending chat action: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_forward_message
// ---------------------------------------------------------------------------

constructor TForwardMessageTool.Create;
begin
  inherited;
  FName        := 'telegram_forward_message';
  FDescription :=
    'Forwards a message from one chat to another, preserving the original sender attribution.';
end;

function TForwardMessageTool.ExecuteWithParams(const AParams: TForwardMessageParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Msg: TftMessage;
begin
  try
    Msg := GBot.API.forwardMessage(
      AParams.ChatId, AParams.FromChatId, AParams.MessageId);
    try
      Result := TAiMCPResponseBuilder.New
        .AddText('Message forwarded. New message ID: ' + IntToStr(Msg.MessageId))
        .Build;
    finally
      Msg.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error forwarding message: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_get_chat
// ---------------------------------------------------------------------------

constructor TGetChatTool.Create;
begin
  inherited;
  FName        := 'telegram_get_chat';
  FDescription := 'Gets information about a chat: ID, title, and username.';
end;

function TGetChatTool.ExecuteWithParams(const AParams: TGetChatParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Chat: TftChat;
  Info: string;
begin
  try
    Chat := GBot.API.getChat(AParams.ChatId);
    try
      Info := 'Chat ID:  ' + IntToStr(Chat.Id);
      if Chat.Title <> '' then
        Info := Info + #10 + 'Title:    ' + Chat.Title;
      if Chat.UserName <> '' then
        Info := Info + #10 + 'Username: @' + Chat.UserName;
      Result := TAiMCPResponseBuilder.New.AddText(Info).Build;
    finally
      Chat.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error getting chat info: ' + E.Message).Build;
  end;
end;

// ---------------------------------------------------------------------------
// telegram_get_updates
// ---------------------------------------------------------------------------

constructor TGetUpdatesTool.Create;
begin
  inherited;
  FName        := 'telegram_get_updates';
  FDescription :=
    'Retrieves pending incoming updates (messages, callback queries, etc.) ' +
    'from Telegram using long polling. Returns up to ''limit'' updates starting ' +
    'from ''offset''. To acknowledge updates pass (last_update_id + 1) as offset.';
end;

function TGetUpdatesTool.ExecuteWithParams(const AParams: TGetUpdatesParams;
  const AuthContext: TAiAuthContext): TJSONObject;
var
  Updates: TftUpdateList;
  Update: TftUpdate;
  I: Integer;
  Limit: Integer;
  Lines: TStringList;
  Line: string;
  Msg: TftMessage;
begin
  try
    Limit := AParams.Limit;
    if Limit <= 0 then
      Limit := 20;

    Updates := GBot.API.getUpdates(AParams.Offset, Limit, 0, nil);
    try
      if Updates.Count = 0 then
        Exit(TAiMCPResponseBuilder.New.AddText('No pending updates.').Build);

      Lines := TStringList.Create;
      try
        Lines.Add(Format('%d update(s) received:', [Updates.Count]));
        Lines.Add('');

        for I := 0 to Updates.Count - 1 do
        begin
          Update := TftUpdate(Updates[I]);
          Line := Format('[update_id: %d]', [Update.UpdateId]);

          Msg := nil;
          if Assigned(Update.Message) then
            Msg := Update.Message
          else if Assigned(Update.EditedMessage) then
          begin
            Msg := Update.EditedMessage;
            Line := Line + ' (edited)';
          end;

          if Assigned(Msg) then
          begin
            Line := Line + Format(' chat_id: %d', [Msg.Chat.Id]);
            if Assigned(Msg.From) then
              Line := Line + Format(' | from: %s (id: %d)',
                [Msg.From.FirstName, Msg.From.Id]);
            if Msg.Text <> '' then
              Line := Line + Format(' | text: %s', [Msg.Text])
            else
              Line := Line + ' | (non-text message)';
          end
          else if Assigned(Update.CallbackQuery) then
          begin
            Line := Line + ' [callback_query]';
            if Assigned(Update.CallbackQuery.Message) then
              Line := Line + Format(' chat_id: %d',
                [Update.CallbackQuery.Message.Chat.Id]);
            Line := Line + Format(' | data: %s', [Update.CallbackQuery.Data]);
          end
          else
            Line := Line + ' (unsupported update type)';

          Lines.Add(Line);
        end;

        Result := TAiMCPResponseBuilder.New.AddText(Lines.Text).Build;
      finally
        Lines.Free;
      end;
    finally
      Updates.Free;
    end;
  except
    on E: Exception do
      Result := TAiMCPResponseBuilder.New
        .AddText('Error getting updates: ' + E.Message).Build;
  end;
end;

end.
