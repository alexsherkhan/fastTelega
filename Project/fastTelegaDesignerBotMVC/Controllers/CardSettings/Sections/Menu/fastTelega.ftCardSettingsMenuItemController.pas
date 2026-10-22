unit fastTelega.ftCardSettingsMenuItemController;

interface

uses
  System.Classes, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsMenuItemModel,
  fastTelega.ftCardSettingsMenuItemView;

type
  TftCardSettingsMenuItemController = class(TftControllerBase)
  private
    FModel: TftCardSettingsMenuItemModel;
    FView: TftCardSettingsMenuItemView;
    FMenuItemMove: Boolean;

    function GetIsStartNumberingFromScratch: Boolean;
    function GetItemIndex: Integer;
    function GetItemType: Integer;
    function GetText: String;
    procedure SetIsStartNumberingFromScratch(const Value: Boolean);
    procedure SetItemIndex(const Value: Integer);
    procedure SetItemType(const Value: Integer);
    procedure SetText(const Value: String);

    procedure BtWrapClick(Sender: TObject);
    function GetEnabled: Boolean;
    procedure SetEnabled(const Value: Boolean);
    procedure MouseDownMenuItem(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseUpMenuItem(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseMoveMenuItem(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure DelItemClick(Sender: TObject);
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property ItemType: Integer read GetItemType write SetItemType;
    property Text: String read GetText write SetText;
    property IsStartNumberingFromScratch: Boolean
      read GetIsStartNumberingFromScratch write SetIsStartNumberingFromScratch;
    property Enabled: Boolean read GetEnabled write SetEnabled;
  end;

implementation

uses
  System.SysUtils, System.UITypes,
  Vcl.StdCtrls;

{ TftCardSettingsMenuItemController }

procedure TftCardSettingsMenuItemController.BtWrapClick(Sender: TObject);
begin
  if FView.BtWrap.Caption = '<' then
  begin
    FView.BtWrap.Caption := '>';
    FView.BtBack.Visible := True;
    FView.BtBegin.Visible := True;
    FView.BtWrap.Left := 0;
  end
  else
  begin
    FView.BtWrap.Caption := '<';
    FView.BtBack.Visible := False;
    FView.BtBegin.Visible := False;
  end;

end;

constructor TftCardSettingsMenuItemController.Create(AOwner: TComponent);
begin
  FModel := TftCardSettingsMenuItemModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FView := TftCardSettingsMenuItemView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Align := alTop;
  FView.Height := 40;
  FView.BtWrap.OnClick := BtWrapClick;
  FView.Padding.Top := 5;
  FView.Padding.Bottom := 5;

  FView.lbMove.Align := alLeft;
  FView.lbMove.Layout := tlCenter;
  FView.lbMove.Caption := '...';
  FView.lbMove.Width := 20;

  FView.lbMove.OnMouseMove := MouseMoveMenuItem;
  FView.lbMove.OnMouseUp := MouseUpMenuItem;
  FView.lbMove.OnMouseDown := MouseDownMenuItem;

  FView.edItemTest.Align := alClient;
  FView.edItemTest.Text := '';
  FView.edItemTest.AutoSize := True;

  FView.pnItemMenu.Align := alRight;
  FView.pnItemMenu.AutoSize := True;
  FView.pnItemMenu.BevelOuter := bvNone;

  FView.BtWrap.Align := alLeft;
  FView.BtWrap.Caption := '<';
  FView.BtWrap.Width := 30;

  FView.BtBegin.Align := alLeft;
  FView.BtBegin.Caption := 'Начало';
  FView.BtBegin.Width := 50;
  FView.BtBegin.Visible := False;
  FView.BtBegin.Left := 100;

  FView.BtBack.Align := alLeft;
  FView.BtBack.Caption := 'Назад';
  FView.BtBack.Width := 50;
  FView.BtBack.Visible := False;
  FView.BtBack.Left := 200;

  FView.BtItemSettings.Align := alLeft;
  FView.BtItemSettings.Caption := 'S';
  FView.BtItemSettings.Width := 30;
  FView.BtItemSettings.Left := 300;

  FView.BtAddSmilies.Align := alLeft;
  FView.BtAddSmilies.Caption := 'E';
  FView.BtAddSmilies.Width := 30;
  FView.BtAddSmilies.Left := 400;

  FView.BtDel.Align := alLeft;
  FView.BtDel.Caption := 'D';
  FView.BtDel.Width := 30;
  FView.BtDel.Left := 500;

  FView.BtDel.OnClick := DelItemClick;

  LoadData;
  UpdateView;
end;

procedure TftCardSettingsMenuItemController.DelItemClick(Sender: TObject);
begin
  Self.Destroy;
end;

destructor TftCardSettingsMenuItemController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

function TftCardSettingsMenuItemController.GetEnabled: Boolean;
begin
  Result := FModel.Enabled;
end;

function TftCardSettingsMenuItemController.
  GetIsStartNumberingFromScratch: Boolean;
begin
  Result := FModel.IsStartNumberingFromScratch;
  UpdateView;
end;

function TftCardSettingsMenuItemController.GetItemIndex: Integer;
begin
  Result := FModel.ItemIndex;
end;

function TftCardSettingsMenuItemController.GetItemType: Integer;
begin
  Result := FModel.ItemType;
end;

function TftCardSettingsMenuItemController.GetText: String;
begin
  Result := FModel.Text;
end;

procedure TftCardSettingsMenuItemController.LoadData;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
end;

procedure TftCardSettingsMenuItemController.MouseDownMenuItem(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbLeft then
  begin
    FMenuItemMove := True;
  end;
end;

procedure TftCardSettingsMenuItemController.MouseMoveMenuItem(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMenuItemMove = True then
  begin
   // FView.Top := FView.Top + Y;
  end;
end;

procedure TftCardSettingsMenuItemController.MouseUpMenuItem(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 FView.Top := FView.Top + Y;
  FMenuItemMove := False;
end;

procedure TftCardSettingsMenuItemController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsMenuItemController.SetEnabled(const Value: Boolean);
begin
  FModel.Enabled := Value;
  FView.BtItemSettings.Visible := Value;
  FView.BtAddSmilies.Visible := Value;
  FView.BtDel.Visible := Value;

  UpdateView;
end;

procedure TftCardSettingsMenuItemController.SetIsStartNumberingFromScratch
  (const Value: Boolean);
begin
  FModel.IsStartNumberingFromScratch := Value;
  UpdateView;
end;

procedure TftCardSettingsMenuItemController.SetItemIndex(const Value: Integer);
begin
  FModel.ItemIndex := Value;
  UpdateView;
end;

procedure TftCardSettingsMenuItemController.SetItemType(const Value: Integer);
begin
  FModel.ItemType := Value;
  UpdateView;
end;

procedure TftCardSettingsMenuItemController.SetText(const Value: String);
begin
  FModel.Text := Value;
  UpdateView;
end;

procedure TftCardSettingsMenuItemController.UpdateModel;
begin
  // FModel.Text := FView.LabelText.Caption;
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardSettingsMenuItemController.UpdateView;
begin

  FView.edItemTest.Text := FModel.Text;
  FView.LbMove.Caption := IntToStr(FModel.ItemIndex)+ '  ';
  FView.Enabled := FModel.Enabled;
  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
