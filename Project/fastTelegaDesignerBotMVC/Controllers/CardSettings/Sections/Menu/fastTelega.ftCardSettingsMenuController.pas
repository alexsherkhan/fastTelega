unit fastTelega.ftCardSettingsMenuController;

interface

uses
  System.Classes, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsMenuModel,
  fastTelega.ftCardSettingsMenuView,
  fastTelega.ftCardSettingsMenuItemController;

type
  TftCardSettingsMenuController = class(TftControllerBase)
  private
    FModel: TftCardSettingsMenuModel;
    FView: TftCardSettingsMenuView;

    function GetIsStartNumberingFromScratch: Boolean;
    function GetMenuList: TList;
    function GetTitle: String;
    procedure SetIsStartNumberingFromScratch(const Value: Boolean);
    procedure SetMenuList(const Value: TList);
    procedure SetTitle(const Value: String);
    procedure BtAddItemClick(Sender: TObject);
    procedure PnItemsResize(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;

    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published
    property Title: String read GetTitle write SetTitle;
    property MenuList: TList read GetMenuList write SetMenuList;
    property IsStartNumberingFromScratch: Boolean
      read GetIsStartNumberingFromScratch write SetIsStartNumberingFromScratch;
  end;

implementation

uses
  System.SysUtils, System.UITypes;

{ TftCardSettingsMenuController }

procedure TftCardSettingsMenuController.BtAddItemClick(Sender: TObject);
var
  LDefaultMenuItem: TftCardSettingsMenuItemController;
begin
  LDefaultMenuItem := TftCardSettingsMenuItemController.Create(FView.PnItems);
  LDefaultMenuItem.Text := '';
  LDefaultMenuItem.Enabled := True;

  if IsStartNumberingFromScratch then
    LDefaultMenuItem.ItemIndex := FModel.MenuList.Count - 1
  else
    LDefaultMenuItem.ItemIndex := FModel.MenuList.Count;
  FModel.MenuList.Add(LDefaultMenuItem);
  UpdateView;
end;

constructor TftCardSettingsMenuController.Create(AOwner: TComponent);
begin
  FModel := TftCardSettingsMenuModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FView := TftCardSettingsMenuView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Align := alTop;
  FView.Height := 150;
  // FView.AutoSize := True;

  FView.gbCardSettingsMenu.Align := alClient;
  FView.gbCardSettingsMenu.Caption := 'Меню';
  FView.gbCardSettingsMenu.HeaderFont.Style := [TFontStyle.fsBold];

  FView.PnItems.Align := alTop;
  FView.PnItems.AutoSize := True;
  FView.PnItems.BevelOuter := bvNone;
  FView.PnItems.OnResize := PnItemsResize;

  FView.btAddItem.Height := 30;
  FView.btAddItem.Align := alTop;
  FView.btAddItem.Caption := '+ Добавить ответ';
  FView.btAddItem.OnClick := BtAddItemClick;

  FView.cbIsStartNumberingFromScratch.Caption :=
    'Is Start Numbering From Scratch';
  FView.cbIsStartNumberingFromScratch.Align := alTop;
  FView.cbIsStartNumberingFromScratch.Height := 30;

  FView.btSettingsKeybord.Align := alTop;
  FView.btSettingsKeybord.Caption := 'Настройки клавиатуры';

  LoadData;
  UpdateView;
end;

destructor TftCardSettingsMenuController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

function TftCardSettingsMenuController.GetIsStartNumberingFromScratch: Boolean;
begin
  Result := FModel.IsStartNumberingFromScratch;
  UpdateView;
end;

function TftCardSettingsMenuController.GetMenuList: TList;
begin
  Result := FModel.MenuList;
  UpdateView;
end;

function TftCardSettingsMenuController.GetTitle: String;
begin
  Result := FModel.Title;
  UpdateView;
end;

procedure TftCardSettingsMenuController.LoadData;
var
  LDefaultMenuItem: TftCardSettingsMenuItemController;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;

  LDefaultMenuItem := TftCardSettingsMenuItemController.Create(FView.PnItems);
  LDefaultMenuItem.Text := 'Любой другой ответ';
  LDefaultMenuItem.Enabled := False;

  FModel.MenuList.Add(LDefaultMenuItem);
end;

procedure TftCardSettingsMenuController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsMenuController.PnItemsResize(Sender: TObject);
begin
  FView.Height := FView.PnItems.Height + FView.btAddItem.Height +
    FView.btAddItem.Height + FView.cbIsStartNumberingFromScratch.Height +
    FView.btSettingsKeybord.Height;
end;

procedure TftCardSettingsMenuController.SetIsStartNumberingFromScratch
  (const Value: Boolean);
begin
  FModel.IsStartNumberingFromScratch := Value;
end;

procedure TftCardSettingsMenuController.SetMenuList(const Value: TList);
begin
  FModel.MenuList := Value;
end;

procedure TftCardSettingsMenuController.SetTitle(const Value: String);
begin
  FModel.Title := Value;
end;

procedure TftCardSettingsMenuController.UpdateModel;
begin
  // FModel.Text := FView.LabelText.Caption;
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardSettingsMenuController.UpdateView;
begin
  // FView.lbID.Caption := 'ID ' + IntToStr(FModel.ID);
  // FView.edName.Text := FModel.Name;

  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
