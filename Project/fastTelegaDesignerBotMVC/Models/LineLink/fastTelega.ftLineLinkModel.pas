unit fastTelega.ftLineLinkModel;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  fastTelega.ftModelBase;

type

  TftLineLinkModel = class(TftModelBase)
  private
    FUpDown : Boolean;
    FColor: TColor;
    FStartPoint: TPoint;
    FEndPoint: TPoint;
    FNextÑardCommand: TObject;
    FOnNewClick: TNotifyEvent;

    procedure SetNextÑardCommand(const Value: TObject);
    procedure SetColor(const Value: TColor);
    procedure SetEndPoint(const Value: TPoint);
    procedure SetStartPoint(const Value: TPoint);
    procedure SetUpDown(const Value: Boolean);
  protected
  public
  published
    property UpDown: Boolean read FUpDown write SetUpDown;
    property Color: TColor read FColor write SetColor;
    property StartPoint: TPoint read FStartPoint write SetStartPoint;
    property EndPoint: TPoint read FEndPoint write SetEndPoint;

    property NextÑardCommand: TObject read FNextÑardCommand
      write SetNextÑardCommand;
    property BoundsRect;
    property OnNotifyModel;
    property OnNewClick: TNotifyEvent read FOnNewClick write FOnNewClick;
  end;

implementation

{ TftLineLinkModel }

procedure TftLineLinkModel.SetColor(const Value: TColor);
begin
  if Value <> FColor then
    FColor := Value;
end;

procedure TftLineLinkModel.SetEndPoint(const Value: TPoint);
begin
  FEndPoint := Value;
end;

procedure TftLineLinkModel.SetNextÑardCommand(const Value: TObject);
begin
  if Assigned(Value) then
    FNextÑardCommand := Value;
end;

procedure TftLineLinkModel.SetStartPoint(const Value: TPoint);
begin
  FStartPoint := Value;
end;

procedure TftLineLinkModel.SetUpDown(const Value: Boolean);
begin
  FUpDown := Value;
end;

end.
