/// <summary>
/// fastTelega LongPoll
/// Alexander Syrykh
/// </summary>
unit fastTelega.Net.LongPoll;

interface

uses
  {Delphi}
  System.SysUtils,
  System.Classes,

  {fastTelega}
  fastTelega.Bot,
  fastTelega.API,
  fastTelega.Events.EventHandler,
  fastTelega.AvailableTypes;

type
  /// <summary>
  /// This class handles long polling and updates parsing.
  /// </summary>
  TftLongPoll = class
  private
    FAPI: TftAPI;
    FEventHandler: TftEventHandler;
    FLastUpdateId: Integer;
    FLimit: Integer;
    FTimeout: Integer;
    FAllowUpdates: TStringList;
    FFistInit: Boolean;
  public
    constructor Create(AAPI: TftAPI; AEventHandler: TftEventHandler;
      ALimit: Integer; ATimeout: Integer;
      AAllowUpdates: TStringList = nil); overload;
    constructor Create(ABot: TftBot; ALimit: Integer = 100;
      ATimeout: Integer = 10; AAllowUpdates: TStringList = nil); overload;
    destructor Destroy; override;
    procedure Start();
  end;

implementation

{ TftLongPoll }

constructor TftLongPoll.Create(ABot: TftBot; ALimit, ATimeout: Integer;
  AAllowUpdates: TStringList);
begin
  FAPI := ABot.API;
  FEventHandler := ABot.EventHandler;
  FLastUpdateId := 0;
  FLimit := ALimit;
  FTimeout := ATimeout;
  if AAllowUpdates = nil then
    FAllowUpdates := TStringList.Create
  else
    FAllowUpdates := AAllowUpdates;
  FFistInit := true;
end;

constructor TftLongPoll.Create(AAPI: TftAPI; AEventHandler: TftEventHandler;
  ALimit, ATimeout: Integer; AAllowUpdates: TStringList);
begin
  FAPI := AAPI;
  FEventHandler := AEventHandler;
  FLastUpdateId := 0;
  FLimit := ALimit;
  FTimeout := ATimeout;
  if AAllowUpdates = nil then
    FAllowUpdates := TStringList.Create()
  else
    FAllowUpdates := AAllowUpdates;
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
  LUpdates: TftUpdateList;
begin
  LUpdates := FAPI.getUpdates(FLastUpdateId, FLimit, FTimeout, FAllowUpdates);
  if (LUpdates.Count = 0) then
  begin
    FLastUpdateId := -1;
    FFistInit := false;
  end;

  for I := 0 to LUpdates.Count - 1 do
  begin
    if (TftUpdate(LUpdates[I]).UpdateId >= FLastUpdateId) then
    begin
      FLastUpdateId := LUpdates[I].UpdateId + 1;
      FEventHandler.handleUpdate(LUpdates[I]);
    end;
  end;
  FreeAndNil(LUpdates);
end;

end.
