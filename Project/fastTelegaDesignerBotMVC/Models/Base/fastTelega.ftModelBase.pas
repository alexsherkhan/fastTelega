unit fastTelega.ftModelBase;

interface

uses System.Classes, System.Types;

type
  TNotifier = procedure(Sender: TObject; AEvent: string) of object;

  IftModel = interface
    ['{5BFD2A94-BE1D-4DD0-9D44-8C2330806B11}']
    procedure Notify(const AEvent: String);
    function GetBoundsRect: TRect;
    procedure SetBoundsRect(const Value: TRect);
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
    procedure SetHeight(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetWidth(const Value: Integer);
  end;

  TftModelBase = class(TInterfacedObject, IftModel)
  private
    FLeft: Integer;
    FTop: Integer;
    FWidth: Integer;
    FHeight: Integer;
    FOrigin: TPoint;
    FOnNotifyModel: TNotifier;
    procedure Notify(const AEvent: String);
    function GetBoundsRect: TRect;
    procedure SetBoundsRect(const Value: TRect);
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
    procedure SetHeight(const Value: Integer);
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetWidth(const Value: Integer);
    procedure SetOrigin(const Value: TPoint);
    function GetOrigin: TPoint;
  published
    property BoundsRect: TRect read GetBoundsRect write SetBoundsRect;
    property OnNotifyModel: TNotifier read FOnNotifyModel write FOnNotifyModel;
    property Left: Integer read FLeft write SetLeft;
    property Top: Integer read FTop write SetTop;
    property Width: Integer read FWidth write SetWidth;
    property Height: Integer read FHeight write SetHeight;
    property Origin: TPoint read GetOrigin write SetOrigin;
  end;

implementation

{ TftModelBase }

function TftModelBase.GetBoundsRect: TRect;
begin
  Result.Left := Left;
  Result.Top := Top;
  Result.Right := Left + Width;
  Result.Bottom := Top + Height;
end;

function TftModelBase.GetOrigin: TPoint;
begin
  Result := TPoint.Create(FLeft,FTop);
end;

procedure TftModelBase.Notify(const AEvent: String);
begin
  if Assigned(FOnNotifyModel) then
    FOnNotifyModel(Self, AEvent);
end;

procedure TftModelBase.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  if ((ALeft <> FLeft) or (ATop <> FTop) or (AWidth <> FWidth) or
    (AHeight <> FHeight)) then
  begin
    FLeft := ALeft;
    FTop := ATop;
    FWidth := AWidth;
    FHeight := AHeight;
  end;
end;

procedure TftModelBase.SetBoundsRect(const Value: TRect);
begin
  SetBounds(Value.Left, Value.Top, Value.Right - Value.Left,
    Value.Bottom - Value.Top);
end;

procedure TftModelBase.SetHeight(const Value: Integer);
begin
  FHeight := Value;
  Notify('Height');
end;

procedure TftModelBase.SetLeft(const Value: Integer);
begin
  FLeft := Value;
  Notify('Left');
end;

procedure TftModelBase.SetOrigin(const Value: TPoint);
begin
  FOrigin := Value;
  FLeft := Value.X;
  FTop := Value.Y;
end;

procedure TftModelBase.SetTop(const Value: Integer);
begin
  FTop := Value;
end;

procedure TftModelBase.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

end.
