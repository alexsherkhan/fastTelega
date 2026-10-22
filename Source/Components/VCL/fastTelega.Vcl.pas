{ ************************************************************************ }
{ }
{ fastTelega }
{ }
{ }
{ Copyright (c) 2021-2023 fastTelega Project. }
{ }
{ Use of this source code is governed by a MIT license that can be }
{ found in the LICENSE file. }
{ }
{ ************************************************************************ }
unit fastTelega.Vcl;

interface

{$SCOPEDENUMS ON}

uses
  {Delphi}
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Messaging,
  System.Generics.Collections,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.ExtCtrls,

  {fastTeleg}
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.EventHandler;

type

  TftTelegramBot = class(TComponent)
    FBot: TftBot;
  private
    function GetToken: String;
    procedure SetToken(const Value: String);
    function GetEventBroadcaster: TftEventBroadcaster;
    function GetEventHandler: TftEventHandler;
    function GetOnAnyMessage: TftListenerType;
    procedure SetOnAnyMessage(const Value: TftListenerType);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Token: String read GetToken write SetToken;
    property Events: TftEventBroadcaster read GetEventBroadcaster;
    property EventHandler: TftEventHandler read GetEventHandler;
    property OnAnyMessage: TftListenerType read GetOnAnyMessage
      write SetOnAnyMessage;
  end;

procedure Register;

implementation

// uses
// {Delphi}
// System.Math,
// System.Math.Vectors,
// System.ZLib,
// System.IOUtils,
// System.TypInfo,
// System.Character,
// System.Generics.Defaults,
// System.RTLConsts,
// Vcl.Forms;

{ Register }

procedure Register;
begin
  RegisterComponents('fastTelega', [TftTelegramBot]);
end;

{ TftTelegramBot }

constructor TftTelegramBot.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBot := TftBot.Create('', 'https://api.telegram.org');
end;

destructor TftTelegramBot.Destroy;
begin
  FreeAndNil(FBot);
  inherited;
end;

function TftTelegramBot.GetEventBroadcaster: TftEventBroadcaster;
begin
  Result := FBot.Events;
end;

function TftTelegramBot.GetEventHandler: TftEventHandler;
begin
  Result := FBot.EventHandler;
end;

function TftTelegramBot.GetOnAnyMessage: TftListenerType;
begin
  //FBot.Events.OnAnyMessage;
end;

function TftTelegramBot.GetToken: String;
begin
  Result := FBot.Token;
end;

procedure TftTelegramBot.SetOnAnyMessage(const Value: TftListenerType);
begin
  FBot.Events.OnAnyMessage(Value);
end;

procedure TftTelegramBot.SetToken(const Value: String);
begin
  FBot.Token := Value;
end;

initialization

finalization

end.
