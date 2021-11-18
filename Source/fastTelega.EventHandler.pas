/// <summary>
/// fastTelega EventHandler
/// Alexander Syrykh
/// </summary>
unit fastTelega.EventHandler;

interface

uses fastTelega.AvailableTypes, fastTelega.EventBroadcaster;

type
  TftHackEventBroadcaster = class(TftEventBroadcaster);

  TftEventHandler = class(TObject)
  private
    FBroadCaster: TftEventBroadcaster;
    procedure handleMessage(const Atmessage: TftMessage);
  public
    constructor Create(const Broadcaster: TftEventBroadcaster);
    destructor Destroy; override;

    procedure handleUpdate(const Update: TftUpdate);
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

procedure TftEventHandler.handleMessage(const Atmessage: TftMessage);
var
  splitPosition, spacePosition, atSymbolPosition: Integer;
  Command: String;
begin

  TftHackEventBroadcaster(Broadcaster).BroadcastAnyMessage(Atmessage);
  if Atmessage.Text = '' then
    Exit;
  if (Atmessage.Text[1] = '/') then
  begin
    splitPosition := 0;
    spacePosition := Pos(' ', Atmessage.Text);
    atSymbolPosition := Pos('@', Atmessage.Text);
    if (spacePosition = 0) then
    begin
      if (atSymbolPosition = 0) then
        splitPosition := Length(Atmessage.Text)
      else
        splitPosition := atSymbolPosition;
    end
    else if (atSymbolPosition = 0) then
      splitPosition := spacePosition
    else
      splitPosition := Min(spacePosition, atSymbolPosition);
    Command := Copy(Atmessage.Text, 2, splitPosition);
    if not(TftHackEventBroadcaster(FBroadCaster).broadcastCommand(Command,
      Atmessage)) then
      TftHackEventBroadcaster(FBroadCaster).BroadcastUnknownCommand(Atmessage);
  end
  else
  begin
    TftHackEventBroadcaster(Broadcaster).BroadcastNonCommandMessage(Atmessage);
  end;
end;

procedure TftEventHandler.handleUpdate(const Update: TftUpdate);
begin
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
    handleMessage(Update.Message);
end;

end.
