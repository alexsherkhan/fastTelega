/// <summary>
/// fastTelega EventBroadcaster
/// Alexander Syrykh
/// </summary>
unit fastTelega.EventBroadcaster;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections,
  fastTelega.AvailableTypes;

type
  TftListenerType = reference to procedure(const obj: TObject);

  /// <summary>
  /// This class holds all event listeners.
  /// </summary>
  TftEventBroadcaster = class(TObject)
  private
    FOnAnyMessageListeners: TList< { TftMessageListener } TftListenerType>;
    FOnCommandListeners
      : TDictionary<String, { TftMessageListener } TftListenerType>;
    FOnUnknownCommandListeners: TList< { TftMessageListener } TftListenerType>;
    FOnNonCommandMessageListeners
      : TList< { TftMessageListener } TftListenerType>;
    FOnInlineQueryListeners: TList< { TftInlineQueryListener } TftListenerType>;
    FOnChosenInlineResultListeners
      : TList< { TftChosenInlineResultListener } TftListenerType>;
    FOnCallbackQueryListeners
      : TList< { TftCallbackQueryListener } TftListenerType>;
  protected
    procedure Broadcast(const Listeners: TList<TftListenerType>;
      const obj: TObject);
    procedure BroadcastAnyMessage(const FtMessage: TftMessage);
    function BroadcastCommand(var Command: String;
      const FtMessage: TftMessage): Boolean;
    procedure BroadcastUnknownCommand(const FtMessage: TftMessage);
    procedure BroadcastNonCommandMessage(const FtMessage: TftMessage);
    procedure BroadcastInlineQuery(const Query: TftInlineQuery);
    procedure BroadcastChosenInlineResult(const Result: TftChosenInlineResult);
    procedure BroadcastCallbackQuery(const Result: TftCallbackQuery);
  public
    constructor Create;
    destructor Destroy; override;

    /// <summary>
    // * @brief Registers listener which receives all messages which the bot can ever receive.
    // * @param listener Listener.
    // */
    /// </summary>
    procedure OnAnyMessage(const Listener
      : TftListenerType { TftMessageListener } );

    /// <summary>
    /// Registers listener which receives all messages with commands (messages with leading '/' char).
    // * @param commandName Command name which listener can handle.
    // * @param listener Listener.
    // */
    /// </summary>
    procedure OnCommand(const CommandName: String;
      const Listener: TftListenerType { TftMessageListener } ); overload;
    /// <summary>
    /// Registers listener which receives all messages with commands (messages with leading '/' char).
    // * @param commandsList Commands names which listener can handle.
    // * @param listener Listener.
    /// </summary>
    procedure OnCommand(const CommandsList: TList<String>;
      const Listener: TftListenerType { TftMessageListener } ); overload;
    /// <summary>
    /// Registers listener which receives all messages with commands (messages with leading '/' char) which haven't been handled by other listeners.
    // * @param listener Listener.
    // */
    procedure OnUnknownCommand(const Listener
      : TftListenerType { TftMessageListener } );

    /// <summary>
    /// Registers listener which receives all messages without commands (messages with no leading '/' char)
    // * @param listener Listener.
    /// </summary>
    procedure OnNonCommandMessage(const Listener
      : TftListenerType { TftMessageListener } );
    /// <summary>
    /// Registers listener which receives all the inline query.
    // * @param listener Listener.
    /// </summary>
    procedure OnInlineQuery(const Listener
      : TftListenerType { TftInlineQueryListener } );
    /// <summary>
    /// Registers listener which receives all the chosen inline result.
    // * @param listener Listener.
    /// </summary>
    procedure OnChosenInlineResult(const Listener
      : TftListenerType { TftChosenInlineResultListener); } );

    procedure OnCallbackQuery(const Listener
      : TftListenerType { TftCallbackQueryListener } );
  end;

implementation

{ TftEventBroadcaster }

procedure TftEventBroadcaster.Broadcast(const Listeners: TList<TftListenerType>;
  const obj: TObject);
var
  I: Integer;
begin
  if not(obj <> nil) then
    Exit;
  for I := 0 to Listeners.Count - 1 do
  begin
    Listeners[I](obj);
  end;
end;

procedure TftEventBroadcaster.BroadcastAnyMessage(const FtMessage: TftMessage);
begin
  Broadcast(FOnAnyMessageListeners, FtMessage);
end;

procedure TftEventBroadcaster.BroadcastCallbackQuery(const Result
  : TftCallbackQuery);
begin
  Broadcast(FOnCallbackQueryListeners, Result);
end;

procedure TftEventBroadcaster.BroadcastChosenInlineResult
  (const Result: TftChosenInlineResult);
begin
  Broadcast(FOnChosenInlineResultListeners, Result);
end;

function TftEventBroadcaster.BroadcastCommand(var Command: String;
  const FtMessage: TftMessage): Boolean;
var
  Listener: TftListenerType;
begin
  if FOnCommandListeners.ContainsKey(Command) then
  begin
    Listener := FOnCommandListeners.Items[Command];
    Listener(FtMessage);
    Result := true;
  end
  else
  begin
    Result := false;
  end;

end;

procedure TftEventBroadcaster.BroadcastInlineQuery(const Query: TftInlineQuery);
begin
  Broadcast(FOnInlineQueryListeners, TftInlineQuery(Query));
end;

procedure TftEventBroadcaster.BroadcastNonCommandMessage(const FtMessage
  : TftMessage);
begin
  Broadcast(FOnNonCommandMessageListeners, FtMessage);
end;

procedure TftEventBroadcaster.BroadcastUnknownCommand(const FtMessage
  : TftMessage);
begin
  Broadcast(FOnUnknownCommandListeners, FtMessage);
end;

constructor TftEventBroadcaster.Create;
begin
  FOnAnyMessageListeners := TList<TftListenerType>.Create;
  FOnCommandListeners := TDictionary<String, TftListenerType>.Create;
  FOnUnknownCommandListeners := TList<TftListenerType>.Create;
  FOnNonCommandMessageListeners := TList<TftListenerType>.Create;
  FOnInlineQueryListeners := TList<TftListenerType>.Create;
  FOnChosenInlineResultListeners := TList<TftListenerType>.Create;
  FOnCallbackQueryListeners := TList<TftListenerType>.Create;
end;

destructor TftEventBroadcaster.Destroy;
begin
  FreeAndNil(FOnAnyMessageListeners);
  FreeAndNil(FOnCommandListeners);
  FreeAndNil(FOnUnknownCommandListeners);
  FreeAndNil(FOnNonCommandMessageListeners);
  FreeAndNil(FOnInlineQueryListeners);
  FreeAndNil(FOnChosenInlineResultListeners);
  FreeAndNil(FOnCallbackQueryListeners);
  inherited;
end;

procedure TftEventBroadcaster.OnAnyMessage(const Listener
  : TftListenerType { TftMessageListener } );
begin
  FOnAnyMessageListeners.Add(Listener);
end;

procedure TftEventBroadcaster.OnCallbackQuery(const Listener
  : TftListenerType { TftCallbackQueryListener } );
begin
  FOnCallbackQueryListeners.Add(Listener);
end;

procedure TftEventBroadcaster.OnChosenInlineResult(const Listener
  : TftListenerType { TftChosenInlineResultListener } );
begin
  FOnChosenInlineResultListeners.Add(Listener);
end;

procedure TftEventBroadcaster.OnCommand(const CommandName: String;
  const Listener: TftListenerType { TftMessageListener } );
begin
  FOnCommandListeners.Add(CommandName, Listener);
end;

procedure TftEventBroadcaster.OnCommand(const CommandsList: TList<String>;
  const Listener: TftListenerType { TftMessageListener } );
var
  I: Integer;
begin
  for I := 0 to CommandsList.Count - 1 do
  begin
    FOnCommandListeners.Add(CommandsList[I], Listener);
  end;
end;

procedure TftEventBroadcaster.OnInlineQuery(const Listener
  : TftListenerType);
begin
  FOnInlineQueryListeners.Add(Listener);
end;

procedure TftEventBroadcaster.OnNonCommandMessage(const Listener
  : TftListenerType { TftMessageListener } );
begin
  FOnNonCommandMessageListeners.Add(Listener);
end;

procedure TftEventBroadcaster.OnUnknownCommand(const Listener
  : TftListenerType { TftMessageListener } );
begin
  FOnUnknownCommandListeners.Add(Listener);
end;

end.
