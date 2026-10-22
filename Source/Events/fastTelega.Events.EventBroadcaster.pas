/// <summary>
/// fastTelega EventBroadcaster
/// Alexander Syrykh
/// </summary>
unit fastTelega.Events.EventBroadcaster;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,

  {fastTelega}
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
    FOnUpdateListeners: TList<TftListenerType>;
  protected
    procedure Broadcast(const AListeners: TList<TftListenerType>;
      const AObj: TObject);
    procedure BroadcastAnyMessage(const AMessage: TftMessage);
    function BroadcastCommand(var ACommand: String;
      const AMessage: TftMessage): Boolean;
    procedure BroadcastUnknownCommand(const AMessage: TftMessage);
    procedure BroadcastNonCommandMessage(const AMessage: TftMessage);
    procedure BroadcastInlineQuery(const AQuery: TftInlineQuery);
    procedure BroadcastChosenInlineResult(const AResult: TftChosenInlineResult);
    procedure BroadcastCallbackQuery(const AResult: TftCallbackQuery);
    procedure BroadcastUpdate(const AUpdate: TftUpdate);
  public
    constructor Create;
    destructor Destroy; override;

    /// <summary>
    // * @brief Registers listener which receives all messages which the bot can ever receive.
    // * @param listener Listener.
    // */
    /// </summary>
    procedure OnAnyMessage(const AListener
      : TftListenerType { TftMessageListener } );

    /// <summary>
    /// Registers listener which receives all messages with commands (messages with leading '/' char).
    // * @param commandName Command name which listener can handle.
    // * @param listener Listener.
    // */
    /// </summary>
    procedure OnCommand(const ACommandName: String;
      const AListener: TftListenerType { TftMessageListener } ); overload;
    /// <summary>
    /// Registers listener which receives all messages with commands (messages with leading '/' char).
    // * @param commandsList Commands names which listener can handle.
    // * @param listener Listener.
    /// </summary>
    procedure OnCommand(const ACommandsList: TList<String>;
      const AListener: TftListenerType { TftMessageListener } ); overload;
    /// <summary>
    /// Registers listener which receives all messages with commands (messages with leading '/' char) which haven't been handled by other listeners.
    // * @param listener Listener.
    // */
    procedure OnUnknownCommand(const AListener
      : TftListenerType { TftMessageListener } );

    /// <summary>
    /// Registers listener which receives all messages without commands (messages with no leading '/' char)
    // * @param listener Listener.
    /// </summary>
    procedure OnNonCommandMessage(const AListener
      : TftListenerType { TftMessageListener } );
    /// <summary>
    /// Registers listener which receives all the inline query.
    // * @param listener Listener.
    /// </summary>
    procedure OnInlineQuery(const AListener
      : TftListenerType { TftInlineQueryListener } );
    /// <summary>
    /// Registers listener which receives all the chosen inline result.
    // * @param listener Listener.
    /// </summary>
    procedure OnChosenInlineResult(const AListener
      : TftListenerType { TftChosenInlineResultListener); } );

    procedure OnCallbackQuery(const AListener
      : TftListenerType { TftCallbackQueryListener } );
    /// <summary>
    /// Registers a listener that receives every update before it is routed.
    /// </summary>
    procedure OnUpdate(const AListener: TftListenerType);
  end;

implementation

{ TftEventBroadcaster }

procedure TftEventBroadcaster.Broadcast(const AListeners
  : TList<TftListenerType>; const AObj: TObject);
var
  I: Integer;
begin
  if not(AObj <> nil) then
    Exit;
  for I := 0 to AListeners.Count - 1 do
  begin
    AListeners[I](AObj);
  end;
end;

procedure TftEventBroadcaster.BroadcastAnyMessage(const AMessage: TftMessage);
begin
  Broadcast(FOnAnyMessageListeners, AMessage);
end;

procedure TftEventBroadcaster.BroadcastCallbackQuery(const AResult
  : TftCallbackQuery);
begin
  Broadcast(FOnCallbackQueryListeners, AResult);
end;

procedure TftEventBroadcaster.BroadcastUpdate(const AUpdate: TftUpdate);
begin
  Broadcast(FOnUpdateListeners, AUpdate);
end;

procedure TftEventBroadcaster.BroadcastChosenInlineResult
  (const AResult: TftChosenInlineResult);
begin
  Broadcast(FOnChosenInlineResultListeners, AResult);
end;

function TftEventBroadcaster.BroadcastCommand(var ACommand: String;
  const AMessage: TftMessage): Boolean;
var
  LListener: TftListenerType;
begin
  if FOnCommandListeners.ContainsKey(ACommand) then
  begin
    LListener := FOnCommandListeners.Items[ACommand];
    LListener(AMessage);
    Result := true;
  end
  else
  begin
    Result := false;
  end;
end;

procedure TftEventBroadcaster.BroadcastInlineQuery(const AQuery
  : TftInlineQuery);
begin
  Broadcast(FOnInlineQueryListeners, TftInlineQuery(AQuery));
end;

procedure TftEventBroadcaster.BroadcastNonCommandMessage(const AMessage
  : TftMessage);
begin
  Broadcast(FOnNonCommandMessageListeners, AMessage);
end;

procedure TftEventBroadcaster.BroadcastUnknownCommand(const AMessage
  : TftMessage);
begin
  Broadcast(FOnUnknownCommandListeners, AMessage);
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
  FOnUpdateListeners := TList<TftListenerType>.Create;
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
  FreeAndNil(FOnUpdateListeners);
  inherited;
end;

procedure TftEventBroadcaster.OnAnyMessage(const AListener
  : TftListenerType { TftMessageListener } );
begin
  FOnAnyMessageListeners.Add(AListener);
end;

procedure TftEventBroadcaster.OnCallbackQuery(const AListener
  : TftListenerType { TftCallbackQueryListener } );
begin
  FOnCallbackQueryListeners.Add(AListener);
end;

procedure TftEventBroadcaster.OnUpdate(const AListener: TftListenerType);
begin
  FOnUpdateListeners.Add(AListener);
end;

procedure TftEventBroadcaster.OnChosenInlineResult(const AListener
  : TftListenerType { TftChosenInlineResultListener } );
begin
  FOnChosenInlineResultListeners.Add(AListener);
end;

procedure TftEventBroadcaster.OnCommand(const ACommandName: String;
  const AListener: TftListenerType { TftMessageListener } );
begin
  FOnCommandListeners.Add(ACommandName, AListener);
end;

procedure TftEventBroadcaster.OnCommand(const ACommandsList: TList<String>;
  const AListener: TftListenerType { TftMessageListener } );
var
  I: Integer;
begin
  for I := 0 to ACommandsList.Count - 1 do
  begin
    FOnCommandListeners.Add(ACommandsList[I], AListener);
  end;
end;

procedure TftEventBroadcaster.OnInlineQuery(const AListener: TftListenerType);
begin
  FOnInlineQueryListeners.Add(AListener);
end;

procedure TftEventBroadcaster.OnNonCommandMessage(const AListener
  : TftListenerType { TftMessageListener } );
begin
  FOnNonCommandMessageListeners.Add(AListener);
end;

procedure TftEventBroadcaster.OnUnknownCommand(const AListener
  : TftListenerType { TftMessageListener } );
begin
  FOnUnknownCommandListeners.Add(AListener);
end;

end.
