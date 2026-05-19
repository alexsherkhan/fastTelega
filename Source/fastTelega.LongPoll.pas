/// <summary>
/// fastTelega LongPoll
/// Alexander Syrykh
/// </summary>
unit fastTelega.LongPoll;

interface

uses System.SysUtils, System.Classes, fastTelega.Bot,
  fastTelega.API, fastTelega.EventHandler, fastTelega.AvailableTypes;

type
  /// <summary>
  /// This class handles long polling and updates parsing.
  /// </summary>
  TftLongPoll = class
  private
    FAPI: TftAPI;
    FEventHandler: TftEventHandler;
    FlastUpdateId: Integer;
    Flimit: Integer;
    Ftimeout: Integer;
    FallowUpdates: TStrings;
    FOwnsAllowUpdates: Boolean;  // True only when we created FallowUpdates internally
    FFistInit: Boolean;
  public
    constructor Create(AAPI: TftAPI; AEventHandler: TftEventHandler;
      Alimit: Integer; Atimeout: Integer;
      AallowUpdates: TStrings = nil); overload;
    constructor Create(ABot: TftBot; Alimit: Integer = 100;
      Atimeout: Integer = 10; AallowUpdates: TStrings = nil); overload;
    destructor Destroy; override;
    procedure Start();
  end;

implementation

{ TftLongPoll }

constructor TftLongPoll.Create(ABot: TftBot; Alimit, Atimeout: Integer;
  AallowUpdates: TStrings);
begin
  // We store references to Bot's API and EventHandler — we do NOT own them.
  FAPI := ABot.API;
  FEventHandler := ABot.EventHandler;
  FlastUpdateId := 0;
  Flimit := Alimit;
  Ftimeout := Atimeout;
  if AallowUpdates = nil then
  begin
    FallowUpdates := TStringList.Create;
    FOwnsAllowUpdates := True;
  end
  else
  begin
    FallowUpdates := AallowUpdates;
    FOwnsAllowUpdates := False;
  end;
  FFistInit := true;
end;

constructor TftLongPoll.Create(AAPI: TftAPI; AEventHandler: TftEventHandler;
  Alimit, Atimeout: Integer; AallowUpdates: TStrings);
begin
  // We store references passed in — we do NOT own FAPI or FEventHandler.
  FAPI := AAPI;
  FEventHandler := AEventHandler;
  FlastUpdateId := 0;
  Flimit := Alimit;
  Ftimeout := Atimeout;
  if AallowUpdates = nil then
  begin
    FallowUpdates := TStringList.Create;
    FOwnsAllowUpdates := True;
  end
  else
  begin
    FallowUpdates := AallowUpdates;
    FOwnsAllowUpdates := False;
  end;
  FFistInit := true;
end;

destructor TftLongPoll.Destroy;
begin
  // FAPI and FEventHandler are always owned by the caller (TftBot or external code).
  // Never free them here — doing so causes a double-free when TftBot.Destroy runs.
  if FOwnsAllowUpdates then
    FreeAndNil(FallowUpdates);
  inherited;
end;

procedure TftLongPoll.Start;
var
  I: Integer;
  Updates: TftUpdateList;
begin
  Updates := FAPI.getUpdates(FlastUpdateId, Flimit, Ftimeout, FallowUpdates);
   if (Updates.Count = 0) then
   begin
     FlastUpdateId := -1;
     FFistInit := false;
   end;

  for I := 0 to Updates.Count - 1 do
  begin
    if (TftUpdate(Updates[I]).UpdateId >= FlastUpdateId) then
    begin
      FlastUpdateId := Updates[I].UpdateId + 1;
      FEventHandler.handleUpdate(Updates[I]);
    end;
  end;
  FreeAndNil(Updates);
end;

end.
