unit fastTelega.ftLineLinkController;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  Vcl.Controls,
  Vcl.Menus,
  fastTelega.ftControllerBase,
  fastTelega.ftLineLinkModel,
  fastTelega.ftLineLinkView;

type
  TftLineLinkController = class(TftControllerBase)
  private
    FModel: TftLineLinkModel;
    FView: TftLineLinkView;
    function GetNextСardCommand: TObject;
    procedure SetNextСardCommand(const Value: TObject);
    function GetButtonNewVisible: Boolean;
    procedure SetButtonNewVisible(const Value: Boolean);
    function GetOnButtonNewClick: TNotifyEvent;
    procedure SetOnButtonNewClick(const Value: TNotifyEvent);
    function GetOnNewCardClick: TNotifyEvent;

    procedure ButtonNewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LinkDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LinkDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    function GetColor: TColor;
    procedure SetColor(const Value: TColor);
    function GetEndPoint: TPoint;
    function GetStartPoint: TPoint;
    procedure SetEndPoint(const Value: TPoint);
    procedure SetStartPoint(const Value: TPoint);
    function GetUpDown: Boolean;
    procedure SetUpDown(const Value: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published
    property UpDown: Boolean read GetUpDown write SetUpDown;
    property Color: TColor read GetColor write SetColor;
    property StartPoint: TPoint read GetStartPoint write SetStartPoint;
    property EndPoint: TPoint read GetEndPoint write SetEndPoint;
    property NextСardCommand: TObject read GetNextСardCommand
      write SetNextСardCommand;
    property ButtonNewVisible: Boolean read GetButtonNewVisible
      write SetButtonNewVisible;

    property OnButtonNewClick: TNotifyEvent read GetOnButtonNewClick
      write SetOnButtonNewClick;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TftLineLinkController }

procedure TftLineLinkController.ButtonNewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LPt: TPoint;
begin
  if (Button = mbLeft) then
    (Sender as TControl).BeginDrag(False);
  LPt := Mouse.CursorPos;
  // FView.ButtonNew.DropDownMenu.Popup(LPt.X, LPt.Y);
end;

constructor TftLineLinkController.Create(AOwner: TComponent);
var
  LMenuItem: TMenuItem;
begin
  FModel := TftLineLinkModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FView := TftLineLinkView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.BringToFront;
  LoadData;
  UpdateView;

end;

destructor TftLineLinkController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

function TftLineLinkController.GetButtonNewVisible: Boolean;
begin
  // Result := FView.ButtonNew.Visible;
end;

function TftLineLinkController.GetColor: TColor;
begin
  Result := FModel.Color;
end;

function TftLineLinkController.GetEndPoint: TPoint;
begin
  Result := FModel.EndPoint;
end;

function TftLineLinkController.GetNextСardCommand: TObject;
begin
  // Result := FModel.NextСardCommand;
end;

function TftLineLinkController.GetOnButtonNewClick: TNotifyEvent;
begin
  // Result := FView.ButtonNew.OnClick;
end;

function TftLineLinkController.GetOnNewCardClick: TNotifyEvent;
begin
  // Result := FView.ButtonNew.DropDownMenu.Items[0].OnClick;
end;

function TftLineLinkController.GetStartPoint: TPoint;
begin
  Result := FModel.StartPoint;
end;

function TftLineLinkController.GetUpDown: Boolean;
begin
  Result := FModel.UpDown;
end;

procedure TftLineLinkController.LinkDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin

end;

procedure TftLineLinkController.LinkDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin

end;

procedure TftLineLinkController.LoadData;
begin
  // FModel.Text := 'Продолжить';
  // FModel.Left := 1;
  // FModel.Top := 1;
  // FModel.Width := 200;
  // FModel.Height := 40;
  // FModel.Color := TColorRec.SysMenuBar;
//  FModel.StartPoint := TPoint.Create(0, 0);
//  FModel.EndPoint := TPoint.Create(200, 400);
end;

procedure TftLineLinkController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftLineLinkController.SetButtonNewVisible(const Value: Boolean);
begin
  // FView.ButtonNew.Visible := Value;
end;

procedure TftLineLinkController.SetColor(const Value: TColor);
begin
  FModel.Color := Value;
  UpdateView;
end;

procedure TftLineLinkController.SetEndPoint(const Value: TPoint);
begin
  FModel.EndPoint := Value;
  UpdateView;
end;

procedure TftLineLinkController.SetNextСardCommand(const Value: TObject);
begin
  // FModel.NextСardCommand := Value;
  UpdateView;
end;

procedure TftLineLinkController.SetOnButtonNewClick(const Value: TNotifyEvent);
begin
  // FView.ButtonNew.OnClick := Value;
end;

procedure TftLineLinkController.SetStartPoint(const Value: TPoint);
begin
  FModel.StartPoint := Value;
  UpdateView;
end;

procedure TftLineLinkController.SetUpDown(const Value: Boolean);
begin
  FModel.UpDown := Value;
  UpdateView;
end;

procedure TftLineLinkController.UpdateModel;
begin
  // FModel.Text := FView.LabelText.Caption;
  // FModel.BoundsRect := FView.BoundsRect;
  // FModel.LinkPoint := FView.ClientOrigin;
end;

procedure TftLineLinkController.UpdateView;
begin
  FView.Color := FModel.Color;
  FView.StartPoint := FModel.StartPoint;
  FView.EndPoint := FModel.EndPoint;
  FView.UpDown := FModel.UpDown;
  //FView.BoundsRect := FModel.BoundsRect;
end;

end.
