unit fastTelega.ftMenuItemLinkModel;

interface

uses
  System.Classes, System.Types, System.UITypes, fastTelega.ftModelBase;

type

  TftMenuItemLinkPosition = (ipLeft = 0, ipRight = 1);

  TftMenuItemLinkModel = class(TftModelBase)
  private
    FText: String;
    FColor: TColor;
    FLinkPosition: TftMenuItemLinkPosition;
    FLinkPoint: TPoint;
    FNextÑardCommand: TObject;
    FOnNewClick: TNotifyEvent;

    procedure SetText(const Value: String);
    procedure SetLinkPosition(const Value: TftMenuItemLinkPosition);
    procedure SetNextÑardCommand(const Value: TObject);
    procedure SetLinkPoint(const Value: TPoint);
    procedure SetColor(const Value: TColor);
  protected
  public
  published
    property Text: String read FText write SetText;
    property Color: TColor read FColor write SetColor;
    property LinkPosition: TftMenuItemLinkPosition read FLinkPosition
      write SetLinkPosition default ipRight;
    property LinkPoint: TPoint read FLinkPoint write SetLinkPoint;
    property NextÑardCommand: TObject read FNextÑardCommand
      write SetNextÑardCommand;
    property BoundsRect;
    property OnNotifyModel;
    property OnNewClick: TNotifyEvent read FOnNewClick write FOnNewClick;
    property Left;
    property Top;
    property Width;
    property Height;
  end;

implementation

{ TftMenuItemLinkModel }

procedure TftMenuItemLinkModel.SetColor(const Value: TColor);
begin
  if Value <> FColor then
    FColor := Value;
end;

procedure TftMenuItemLinkModel.SetLinkPoint(const Value: TPoint);
begin
  if Value <> FLinkPoint then
    FLinkPoint := Value;
end;

procedure TftMenuItemLinkModel.SetLinkPosition(const Value
  : TftMenuItemLinkPosition);
begin
  if Value <> FLinkPosition then
    FLinkPosition := Value;
end;

procedure TftMenuItemLinkModel.SetNextÑardCommand(const Value: TObject);
begin
  if Assigned(Value) then
    FNextÑardCommand := Value;
end;

procedure TftMenuItemLinkModel.SetText(const Value: String);
begin
  if Value <> FText then
    FText := Value;
end;

end.
