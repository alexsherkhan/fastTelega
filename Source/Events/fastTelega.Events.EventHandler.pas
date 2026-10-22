/// <summary>
/// fastTelega EventHandler
/// Alexander Syrykh
/// </summary>
unit fastTelega.Events.EventHandler;

interface

uses
  {fastTelega}
  fastTelega.AvailableTypes,
  fastTelega.Events.EventBroadcaster;

type
  TftHackEventBroadcaster = class(TftEventBroadcaster);

  TftEventHandler = class(TObject)
  private
    FBroadCaster: TftEventBroadcaster;
    procedure HandleMessage(const Atmessage: TftMessage);
  public
    constructor Create(const Broadcaster: TftEventBroadcaster);
    destructor Destroy; override;
    procedure HandleUpdate(const Update: TftUpdate);
    property Broadcaster: TftEventBroadcaster read FBroadCaster
      write FBroadCaster;
  end;

implementation

uses Math;

{ TftEventHandler }

constructor TftEventHandler.Create(const Broadcaster: TftEventBroadcaster);
begin
  FBroadCaster := Broadcaster;
end;

destructor TftEventHandler.Destroy;
begin
  inherited;
end;

procedure TftEventHandler.HandleMessage(const Atmessage: TftMessage);
var
  LSplitPosition, LSpacePosition, LAtSymbolPosition: Integer;
  LCommand: String;
begin
  TftHackEventBroadcaster(Broadcaster).BroadcastAnyMessage(Atmessage);
  if Atmessage.Text = '' then
    Exit;
  if (Atmessage.Text[1] = '/') then
  begin
   // LSplitPosition := 0;
    LSpacePosition := Pos(' ', Atmessage.Text);
    LAtSymbolPosition := Pos('@', Atmessage.Text);
    if (LSpacePosition = 0) then
    begin
      if (LAtSymbolPosition = 0) then
        LSplitPosition := Length(Atmessage.Text)
      else
        LSplitPosition := LAtSymbolPosition;
    end
    else if (LAtSymbolPosition = 0) then
      LSplitPosition := LSpacePosition
    else
      LSplitPosition := Min(LSpacePosition, LAtSymbolPosition);
    LCommand := Copy(Atmessage.Text, 2, LSplitPosition);
    if not(TftHackEventBroadcaster(FBroadCaster).broadcastCommand(LCommand,
      Atmessage)) then
      TftHackEventBroadcaster(FBroadCaster).BroadcastUnknownCommand(Atmessage);
  end
  else
  begin
    TftHackEventBroadcaster(Broadcaster).BroadcastNonCommandMessage(Atmessage);
  end;
end;

procedure TftEventHandler.HandleUpdate(const Update: TftUpdate);
begin
  TftHackEventBroadcaster(FBroadCaster).BroadcastUpdate(Update);

  if (Update.InlineQuery <> nil) then
    TftHackEventBroadcaster(FBroadCaster).BroadcastInlineQuery
      (Update.InlineQuery);

  if (Update.ChosenInlineResult <> nil) then
    TftHackEventBroadcaster(FBroadCaster).BroadcastChosenInlineResult
      (Update.ChosenInlineResult);

  if (Update.CallbackQuery <> nil) then
    TftHackEventBroadcaster(FBroadCaster).BroadcastCallbackQuery
      (Update.CallbackQuery);

  if (Update.Message <> nil) then
    HandleMessage(Update.Message);
  if (Update.EditedMessage <> nil) then
    HandleMessage(Update.EditedMessage);
  if (Update.ChannelPost <> nil) then
    HandleMessage(Update.ChannelPost);
  if (Update.EditedChannelPost <> nil) then
    HandleMessage(Update.EditedChannelPost);
  if (Update.BusinessMessage <> nil) then
    HandleMessage(Update.BusinessMessage);
  if (Update.EditedBusinessMessage <> nil) then
    HandleMessage(Update.EditedBusinessMessage);
  if (Update.GuestMessage <> nil) then
    HandleMessage(Update.GuestMessage);
end;

end.
