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
  FAPI := ABot.API;
  FEventHandler := ABot.EventHandler;
  FlastUpdateId := 0;
  Flimit := Alimit;
  Ftimeout := Atimeout;
  if AallowUpdates = nil then
    FallowUpdates := TStringList.Create
  else
    FallowUpdates := AallowUpdates;
  FFistInit := true;
end;

constructor TftLongPoll.Create(AAPI: TftAPI; AEventHandler: TftEventHandler;
  Alimit, Atimeout: Integer; AallowUpdates: TStrings);
begin
  FAPI := AAPI;
  FEventHandler := AEventHandler;
  FlastUpdateId := 0;
  Flimit := Alimit;
  Ftimeout := Atimeout;
  if AallowUpdates = nil then
    FallowUpdates := TStrings.Create
  else
    FallowUpdates := AallowUpdates;
  FFistInit := true;
end;

destructor TftLongPoll.Destroy;
begin
  FreeAndNil(FAPI);
  FreeAndNil(FEventHandler);
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
