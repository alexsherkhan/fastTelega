unit fastTelega.ftMenuItemLinkController;

interface

uses
  System.Classes, System.Types, System.UITypes,
  Vcl.Controls, Vcl.Menus,
  fastTelega.ftControllerBase,
  fastTelega.ftMenuItemLinkModel,
  fastTelega.ftMenuItemLinkView,
  fastTelega.ftLineLinkController;

type
  TftMenuItemLinkController = class(TftControllerBase)
  private
    FModel: TftMenuItemLinkModel;
    FView: TftMenuItemLinkView;
    FLineLinkController: TftLineLinkController;
    function GetNextСardCommand: TObject;
    procedure SetNextСardCommand(const Value: TObject);
    function GetButtonNewVisible: Boolean;
    procedure SetButtonNewVisible(const Value: Boolean);
    function GetOnButtonNewClick: TNotifyEvent;
    procedure SetOnButtonNewClick(const Value: TNotifyEvent);
    function GetOnNewCardClick: TNotifyEvent;
    procedure SetOnNewCardClick(const Value: TNotifyEvent);
    function GetText: String;
    procedure SetText(const Value: String);

    procedure ButtonNewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LinkDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LinkDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    function GetColor: TColor;
    procedure SetColor(const Value: TColor);
    procedure SetLineLinkController(const Value: TftLineLinkController);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
    procedure UpdateStartPoint;
  published
    property Text: String read GetText write SetText;

    property Color: TColor read GetColor write SetColor;

    property NextСardCommand: TObject read GetNextСardCommand
      write SetNextСardCommand;
    property ButtonNewVisible: Boolean read GetButtonNewVisible
      write SetButtonNewVisible;

    property OnButtonNewClick: TNotifyEvent read GetOnButtonNewClick
      write SetOnButtonNewClick;
    property OnNewCardClick: TNotifyEvent read GetOnNewCardClick
      write SetOnNewCardClick;
    property LineLinkController: TftLineLinkController read FLineLinkController
      write SetLineLinkController;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TftMenuItemLinkController }

procedure TftMenuItemLinkController.ButtonNewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LPt: TPoint;
begin
  if (Button = mbLeft) then
    (Sender as TControl).BeginDrag(False);
  LPt := Mouse.CursorPos;
  FView.ButtonNew.DropDownMenu.Popup(LPt.X, LPt.Y);
end;

constructor TftMenuItemLinkController.Create(AOwner: TComponent);
var
  LMenuItem: TMenuItem;
begin
  FModel := TftMenuItemLinkModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FView := TftMenuItemLinkView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Controller := Self;
  FView.Align := alTop;
  FView.Padding.Left := 10;
  FView.Padding.Right := 10;
  FView.Padding.Bottom := 10;
  FView.Padding.Top := 10;
  FView.Height := 40;
  FView.ParentBackground := True;

  FView.ButtonNew.Caption := '+';
  FView.ButtonNew.Align := alRight;
  FView.ButtonNew.Width := 20;
  FView.ButtonNew.Height := 40;
  FView.ButtonNew.DragMode := TDragMode.dmManual;
  FView.ButtonNew.OnMouseDown := ButtonNewMouseDown;

  LMenuItem := TMenuItem.Create(FView.ButtonNew.DropDownMenu);
  LMenuItem.Caption := 'Простое сообщение';
  FView.ButtonNew.DropDownMenu.Items.Add(LMenuItem);

  LMenuItem := TMenuItem.Create(FView.ButtonNew.DropDownMenu);
  LMenuItem.Caption := 'Цепочка сообщений';
  FView.ButtonNew.DropDownMenu.Items.Add(LMenuItem);
  LoadData;
  UpdateView;


  // FButtonNew.OnDropDownClick := ButtonNewClick;

  // FButtonNew.OnDragDrop := LinkDragDrop;
  // FButtonNew.OnDragOver := LinkDragOver;
end;

destructor TftMenuItemLinkController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

function TftMenuItemLinkController.GetButtonNewVisible: Boolean;
begin
  Result := FView.ButtonNew.Visible;
end;

function TftMenuItemLinkController.GetColor: TColor;
begin
  Result := FModel.Color;
end;

function TftMenuItemLinkController.GetNextСardCommand: TObject;
begin
  Result := FModel.NextСardCommand;
end;

function TftMenuItemLinkController.GetOnButtonNewClick: TNotifyEvent;
begin
  Result := FView.ButtonNew.OnClick;
end;

function TftMenuItemLinkController.GetOnNewCardClick: TNotifyEvent;
begin
  Result := FView.ButtonNew.DropDownMenu.Items[0].OnClick;
end;

function TftMenuItemLinkController.GetText: String;
begin
  Result := FModel.Text;
end;

procedure TftMenuItemLinkController.LinkDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin

end;

procedure TftMenuItemLinkController.LinkDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin

end;

procedure TftMenuItemLinkController.LoadData;
begin
  FModel.Text := 'Продолжить';
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
  FModel.Color := TColorRec.SysMenuBar;
end;

procedure TftMenuItemLinkController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftMenuItemLinkController.SetButtonNewVisible(const Value: Boolean);
begin
  FView.ButtonNew.Visible := Value;
end;

procedure TftMenuItemLinkController.SetColor(const Value: TColor);
begin
  FModel.Color := Value;
  UpdateView;
end;

procedure TftMenuItemLinkController.SetLineLinkController
  (const Value: TftLineLinkController);
begin
  FLineLinkController := Value;
  UpdateStartPoint;
end;

procedure TftMenuItemLinkController.SetNextСardCommand(const Value: TObject);
begin
  FModel.NextСardCommand := Value;
  UpdateView;
end;

procedure TftMenuItemLinkController.SetOnButtonNewClick
  (const Value: TNotifyEvent);
begin
  FView.ButtonNew.OnClick := Value;
end;

procedure TftMenuItemLinkController.SetOnNewCardClick
  (const Value: TNotifyEvent);
var
  I: Integer;
begin
  for I := 0 to FView.ButtonNew.DropDownMenu.ComponentCount - 2 do
  begin
    FView.ButtonNew.DropDownMenu.Items[I].OnClick := Value;
  end;
end;

procedure TftMenuItemLinkController.SetText(const Value: String);
begin
  FModel.Text := Value;
  UpdateView;
end;

procedure TftMenuItemLinkController.UpdateModel;
begin
  FModel.Text := FView.LabelText.Caption;
  FModel.BoundsRect := FView.BoundsRect;
  FModel.LinkPoint := FView.ClientOrigin;
end;

procedure TftMenuItemLinkController.UpdateStartPoint;
begin
  if Assigned(FLineLinkController) then
    FLineLinkController.StartPoint :=
      TPoint.Create(FView.Parent.Parent.Left + FView.ClientWidth,
      FView.Parent.Parent.Top + FView.Parent.Top + FView.Top + (FView.Height div 2));
end;

procedure TftMenuItemLinkController.UpdateView;
begin
  FView.LabelText.Caption := FModel.Text;
  FView.Color := FModel.Color;

  // FView.Repaint;
  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
