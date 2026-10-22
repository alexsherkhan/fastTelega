unit fastTelega.ftCardController;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.StdCtrls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardModel,
  fastTelega.ftCardView,
  fastTelega.ftLineLinkView,
  fastTelega.ftMenuItemLinkController,
  fastTelega.ftCardSettingsController;

type
  TftCardController = class(TftControllerBase)
  private
    FModel: TftCardCommandBaseModel;
    FView: TftСardCommandBaseView;
    FCardSettingsController: TftCardSettingsController;
    procedure ClickSettings(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure ClickAddMenuItem(Sender: TObject);
    procedure ClickNewСardCommand(Sender: TObject);
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published

  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TftCardController }

procedure TftCardController.ClickAddMenuItem(Sender: TObject);
var
  LftMenuItemLinkController: TftMenuItemLinkController;
begin
  LftMenuItemLinkController := TftMenuItemLinkController.Create
    (FView.PanelMenuLinks);
  LftMenuItemLinkController.OnNewCardClick := ClickNewСardCommand;
  LftMenuItemLinkController.Text := 'Любой другой текст';
  LftMenuItemLinkController.Color := TColorRec.MoneyGreen;

  FView.MenuLinkList.Add(LftMenuItemLinkController);

  FView.Repaint;
end;

procedure TftCardController.ClickNewСardCommand(Sender: TObject);
var
  LСardCommandBaseView: TftСardCommandBaseView;
  LftMenuItemLinkController: TftMenuItemLinkController;
  ftLineLink: TftLineLinkView;
begin
  if (TMenuItem(Sender).MenuIndex = 0) then
  begin
    // TftMenuItemLinkController(TMenuItem(Sender).Owner.Owner.Owner).NextСardCommand :=
    LСardCommandBaseView := TftSimpleMessageСardCommand.Create
      (Self.FView.Owner);
  end
  else if (TMenuItem(Sender).MenuIndex = 1) then
  begin
    // TftMenuItemLinkController(TMenuItem(Sender).Owner.Owner).NextСardCommand :=
    LСardCommandBaseView := TftMessageChainСardCommand.Create(Self.FView.Owner);
  end;
  // LСardCommandBase := TftСardCommandBaseView
  // (TftMenuItemLinkController(TMenuItem(Sender).Owner.Owner).NextСardCommand);
  LСardCommandBaseView.Parent := Self.FView.Parent;
  LСardCommandBaseView.FullRepaint := false;

  LСardCommandBaseView.Left := Self.FView.Left + Self.FView.Width +
    Self.FView.Width div 4;
  LСardCommandBaseView.Top := Self.FView.Top + Self.FView.Height div 2;

  LftMenuItemLinkController := TftMenuItemLinkController.Create
    (LСardCommandBaseView.PanelMenuLinks);
  LftMenuItemLinkController.OnNewCardClick := ClickNewСardCommand;

  LСardCommandBaseView.MenuLinkList := TList.Create();
  LСardCommandBaseView.MenuLinkList.Add(LftMenuItemLinkController);
  // TftMenuItemLinkController(TMenuItem(Sender).Owner.Owner)
  // .PreviousСardCommand := Self;

//  ftLineLink := TftLineLinkView.Create(Self.FView.Owner);
//  ftLineLink.Parent := Self.FView.Parent;
//  ftLineLink.SendToBack;

//  ftLineLink.StartPoint := TPoint.Create(TButton(TMenuItem(Sender).Owner.Owner)
//    .ClientOrigin.X, TButton(TMenuItem(Sender).Owner.Owner).ClientOrigin.Y);
//  ftLineLink.EndPoint := TPoint.Create(LСardCommandBaseView.Left,
//    LСardCommandBaseView.Top + 20);
  Self.FView.Refresh;
 // Self.FView.Parent.Refresh;
  // TftMenuItemLinkController(TMenuItem(Sender).Owner.Owner)
  // .ButtonNewVisible := False;
end;

procedure TftCardController.ClickSettings(Sender: TObject);
begin
//  if FCardSettingsController.Visible then
//    FCardSettingsController.Visible := false
//  else
    FCardSettingsController.Visible := True;
end;

constructor TftCardController.Create(AOwner: TComponent);
var
  LftMenuItemLinkController: TftMenuItemLinkController;
  ftLineLink: TftLineLinkView;
begin
  FModel := TftCardCommandBaseModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FCardSettingsController := TftCardSettingsController.Create(AOwner);
  FCardSettingsController.Visible := false;
  // ftLineLink := TftLineLinkView.Create(AOwner);
  // ftLineLink.Parent := AOwner;
  // ftLineLink.StartPoint := TPoint.Create(500,500);
  // ftLineLink.EndPoint := TPoint.Create(100,100);

  FView := TftСardCommandBaseView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.LabelTitle.OnClick := ClickSettings;
  FView.FullRepaint := false;

  FView.Padding.Left := 0;
  FView.Padding.Right := 0;
  FView.Padding.Bottom := 0;
  FView.Padding.Top := 0;
  FView.ButtonAlso.OnClick := ClickAddMenuItem;
  LftMenuItemLinkController := TftMenuItemLinkController.Create
    (FView.PanelMenuLinks);
  LftMenuItemLinkController.OnNewCardClick := ClickNewСardCommand;

  FView.MenuLinkList := TList.Create();
  FView.MenuLinkList.Add(LftMenuItemLinkController);

  LoadData;
  UpdateView;
end;

destructor TftCardController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

procedure TftCardController.LoadData;
begin
  FModel.Title := 'Start';
  FModel.Left := 40;
  FModel.Top := 40;
  FModel.Width := 250;
  FModel.Height := 150;
end;

procedure TftCardController.NotifyFromModel(Sender: TObject; AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardController.UpdateModel;
begin
  FModel.Title := FView.LabelTitle.Caption;
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardController.UpdateView;
begin
  FView.LabelTitle.Caption := FModel.Title;
  FView.BoundsRect := FModel.BoundsRect;
end;

end.
