unit fastTelega.ftCardController;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Graphics,
  fastTelega.ftControllerBase,
  fastTelega.ftCardModel,
  fastTelega.ftCardView,
  fastTelega.ftLineLinkController,
  fastTelega.ftMenuItemLinkController,
  fastTelega.ftMenuItemLinkView,
  fastTelega.ftCardSettingsController;

type
  TftCardControllerBase = class(TftControllerBase)
  private
    FModel: TftCardCommandBaseModel;
    FView: TftСardCommandBaseView;
    FCardSettingsController: TObject;
    FLineLinkController: TftLineLinkController;
    FImages: TCustomImageList;
    FMove: Boolean;

    procedure ClickSettings(Sender: TObject);
    function GetOrigin: TPoint;
    procedure SetOrigin(const Value: TPoint);

    procedure SetOnNewClick(const Value: TNotifyEvent);
    procedure СardDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure СardDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure MouseLeave(Sender: TObject);
    procedure Click(Sender: TObject);
    function GetHighlightingDrop: Boolean;
    function GetHoldMouseDown: Boolean;
    function GetMenuLinkList: TList;
    function GetMousePoint: TPoint;
    procedure SetHighlightingDrop(const Value: Boolean);
    procedure SetHoldMouseDown(const Value: Boolean);
    procedure SetMenuLinkList(const Value: TList);
    procedure SetMousePoint(const Value: TPoint);
    procedure UpdateLineLink;
    procedure UpdateLinesMenuLinkList;
    procedure SetImages(const Value: TCustomImageList); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure ClickAddMenuItem(Sender: TObject);
    procedure ClickNewСardCommand(Sender: TObject);
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
    procedure Update; override;
  published
    property Images: TCustomImageList read FImages write SetImages;
    property MenuLinkList: TList read GetMenuLinkList write SetMenuLinkList;
    property HighlightingDrop: Boolean read GetHighlightingDrop
      write SetHighlightingDrop;
    property HoldMouseDown: Boolean read GetHoldMouseDown
      write SetHoldMouseDown;
    property MousePoint: TPoint read GetMousePoint write SetMousePoint;

    property Origin: TPoint read GetOrigin write SetOrigin;
    property LineLinkController: TftLineLinkController read FLineLinkController;
  end;

  TftStartCardController = class(TftCardControllerBase)
  private
    FImages: TCustomImageList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure Update; override;
  published

  end;

  TftSimpleMessageCardController = class(TftCardControllerBase)
  private
    procedure DeleteClick(Sender: TObject);
    procedure SetImages(const Value: TCustomImageList); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure Update; override;
  published
    property Images: TCustomImageList read FImages write SetImages;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TftCardControllerBase }

procedure TftCardControllerBase.Click(Sender: TObject);
begin

end;

procedure TftCardControllerBase.ClickAddMenuItem(Sender: TObject);
var
  LftMenuItemLinkController: TftMenuItemLinkController;
begin
  LftMenuItemLinkController := TftMenuItemLinkController.Create
    (FView.PanelMenuLinks);
  LftMenuItemLinkController.OnNewCardClick := ClickNewСardCommand;
  LftMenuItemLinkController.Text := 'Любой другой текст';
  LftMenuItemLinkController.Color := TColorRec.MoneyGreen;

  FModel.MenuLinkList.Add(LftMenuItemLinkController);
  UpdateLinesMenuLinkList;
  Self.FView.Refresh;
end;

procedure TftCardControllerBase.ClickNewСardCommand(Sender: TObject);
var
  LCardControllerBase: TftCardControllerBase;
  LftMenuItemLinkController: TftMenuItemLinkController;
begin
  if (TMenuItem(Sender).MenuIndex = 0) then
  begin
    LCardControllerBase := TftSimpleMessageCardController.Create
      (Self.FView.Owner);
    TftSimpleMessageCardController(LCardControllerBase).Images := Self.Images;
  end
  else if (TMenuItem(Sender).MenuIndex = 1) then
  begin
    LCardControllerBase := TftSimpleMessageCardController.Create
      (Self.FView.Owner);
    LCardControllerBase.Images := Self.Images;
  end;

  TftMenuItemLinkController
    (TftMenuItemLinkView(TPopupMenu(TMenuItem(Sender).Owner).Owner).Controller)
    .LineLinkController := LCardControllerBase.LineLinkController;

  TftMenuItemLinkController
    (TftMenuItemLinkView(TPopupMenu(TMenuItem(Sender).Owner).Owner).Controller)
    .LineLinkController.NextСardCommand := LCardControllerBase;

  LCardControllerBase.Origin := TPoint.Create(Self.FView.Left + Self.FView.Width
    + Self.FView.Width div 4, Self.FView.Top + Self.FView.Height div 2);

  LCardControllerBase.UpdateLineLink;

  TftMenuItemLinkController
    (TftMenuItemLinkView(TPopupMenu(TMenuItem(Sender).Owner).Owner).Controller)
    .ButtonNewVisible := False;
  Self.FView.Refresh;
end;

procedure TftCardControllerBase.ClickSettings(Sender: TObject);
begin
  (FCardSettingsController as TftCardSettingsControllerBase).Visible := True;
end;

constructor TftCardControllerBase.Create(AOwner: TComponent);
var
  LftMenuItemLinkController: TftMenuItemLinkController;
begin
  FView.FullRepaint := False;

  FView.Padding.Left := 0;
  FView.Padding.Right := 0;
  FView.Padding.Bottom := 0;
  FView.Padding.Top := 0;
  FView.ButtonAlso.OnClick := ClickAddMenuItem;
  // FView.ParentBackground := False;

  LftMenuItemLinkController := TftMenuItemLinkController.Create
    (FView.PanelMenuLinks);
  LftMenuItemLinkController.OnNewCardClick := ClickNewСardCommand;

  FModel.MenuLinkList := TList.Create();
  FModel.MenuLinkList.Add(LftMenuItemLinkController);

  FLineLinkController := TftLineLinkController.Create(AOwner);
  FLineLinkController.Color := clHotLight;

  FView.OnMouseDown := MouseDown;
  FView.OnMouseMove := MouseMove;
  FView.OnMouseUp := MouseUp;
  FView.OnMouseLeave := MouseLeave;
  FView.Height := 200;

  FView.BevelOuter := bvNone;
  FView.OnDragOver := СardDragOver;
  FView.OnDragDrop := СardDragDrop;

  FView.CheckBoxSelected.Caption := '';
  FView.CheckBoxSelected.Align := alLeft;
  FView.CheckBoxSelected.Width := 20;
  FView.CheckBoxSelected.Visible := False;

  FView.LabelTitle.Align := alClient;
  FView.LabelTitle.Layout := tlCenter;
  FView.LabelTitle.Height := 30;
  FView.LabelTitle.Alignment := taCenter;
  FView.LabelTitle.OnMouseDown := MouseDown;
  FView.LabelTitle.OnMouseMove := MouseMove;
  FView.LabelTitle.OnMouseUp := MouseUp;

  // FView.ButtonAlso.Caption := '+++';
  FView.ButtonAlso.Align := alRight;
  FView.ButtonAlso.Width := 20;

  // FView.ButtonCopy.Caption := 'Copy';
  FView.ButtonCopy.Align := alRight;
  FView.ButtonCopy.Width := 20;

  FView.PanelMenuLinks.Align := alTop;
  FView.PanelMenuLinks.BevelOuter := bvNone;
  FView.PanelMenuLinks.Left := 1;
  FView.PanelMenuLinks.Top := 1;
  FView.PanelMenuLinks.AutoSize := True;

  FView.PanelTitle.Height := 30;
  FView.PanelTitle.Align := alTop;
  FView.PanelTitle.BevelOuter := bvNone;
  FView.PanelTitle.Padding.Left := 5;
  FView.PanelTitle.Padding.Right := 5;
  FView.PanelTitle.Padding.Bottom := 5;
  FView.PanelTitle.Padding.Top := 5;
end;

destructor TftCardControllerBase.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FCardSettingsController);
  FreeAndNil(FLineLinkController);
  FreeAndNil(FView);
  inherited Destroy;
end;

function TftCardControllerBase.GetHighlightingDrop: Boolean;
begin
  Result := FModel.HighlightingDrop;
end;

function TftCardControllerBase.GetHoldMouseDown: Boolean;
begin
  Result := FModel.HoldMouseDown;
end;

function TftCardControllerBase.GetMenuLinkList: TList;
begin
  Result := FModel.MenuLinkList;
end;

function TftCardControllerBase.GetMousePoint: TPoint;
begin
  Result := FModel.MousePoint;
end;

function TftCardControllerBase.GetOrigin: TPoint;
begin
  Result := FModel.Origin;
end;

procedure TftCardControllerBase.LoadData;
begin
  FModel.Left := 40;
  FModel.Top := 40;
  FModel.Width := 250;
  FModel.Height := 150;
end;

procedure TftCardControllerBase.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardControllerBase.SetOrigin(const Value: TPoint);
begin
  FModel.Origin := Value;
  UpdateView;
end;

procedure TftCardControllerBase.Update;
begin
  inherited;
  UpdateModel;
  UpdateView;
end;

procedure TftCardControllerBase.UpdateLineLink;
var
  LPoint: TPoint;
begin
  UpdateModel;
  if not Assigned(FLineLinkController) then
    Exit;

  LPoint := FLineLinkController.EndPoint;
  FLineLinkController.UpDown := False;

  if FLineLinkController.StartPoint.Y < FModel.Origin.Y then
  begin
    if (Abs(FLineLinkController.StartPoint.Y - FModel.Origin.Y) >
      FModel.Height div 2) then
    begin
      LPoint.X := FModel.Origin.X + FModel.Width div 2;
      LPoint.Y := FModel.Origin.Y;
      FLineLinkController.UpDown := True;
    end
    else
    begin
      if FLineLinkController.StartPoint.X < FModel.Origin.X + FModel.Width then
      begin
        LPoint.X := FModel.Origin.X;
      end
      else
      begin
        LPoint.X := FModel.Origin.X + FModel.Width;
      end;

      LPoint.Y := FModel.Origin.Y + 15;
    end;
  end
  else
  begin
    if (Abs(FLineLinkController.StartPoint.Y - (FModel.Origin.Y + FModel.Height)
      ) > FModel.Height) then
    begin
      LPoint.X := FModel.Origin.X + FModel.Width div 2;
      LPoint.Y := FModel.Origin.Y + FModel.Height;
      FLineLinkController.UpDown := True;
    end
    else
    begin
      if FLineLinkController.StartPoint.X < FModel.Origin.X + FModel.Width then
      begin
        LPoint.X := FModel.Origin.X;
      end
      else
      begin
        LPoint.X := FModel.Origin.X + FModel.Width;
      end;
      LPoint.Y := FModel.Origin.Y + 15;
    end;
  end;

  FLineLinkController.EndPoint := LPoint;
end;

procedure TftCardControllerBase.UpdateLinesMenuLinkList;
var
  I: Integer;
begin
  if Assigned(MenuLinkList) then
  begin
    for I := 0 to MenuLinkList.Count - 1 do
    begin
      TftMenuItemLinkController(MenuLinkList.Items[I]).UpdateStartPoint;
    end;
  end;
end;

procedure TftCardControllerBase.UpdateModel;
begin
  FModel.Title := FView.LabelTitle.Caption;
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardControllerBase.UpdateView;
begin
  FView.Left := FModel.Origin.X;
  FView.Top := FModel.Origin.Y;

  // FView.LabelTitle.Caption := FModel.Title;
  FView.BoundsRect := FModel.BoundsRect;
  FView.AutoSize := True;

end;

procedure TftCardControllerBase.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  HoldMouseDown := (Button = mbLeft);
  FMove := False;
  if HoldMouseDown then
  begin
    MousePoint := Point(X, Y);
  end;
end;

procedure TftCardControllerBase.MouseLeave(Sender: TObject);
begin
  HoldMouseDown := False;
  FView.CheckBoxSelected.Visible := False;
end;

procedure TftCardControllerBase.MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FView.CheckBoxSelected.Visible := True;
  if not HoldMouseDown then
    Exit;
  try
    FMove := True;
    // Self.Parent.Repaint;
    Screen.Cursor := crHandPoint;
    FView.SetBounds(FView.Left + X - MousePoint.X, FView.Top + Y - MousePoint.Y,
      FView.Width, FView.Height);
    UpdateModel;
    UpdateLineLink;
    UpdateLinesMenuLinkList;
  finally

  end;
end;

procedure TftCardControllerBase.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not FMove then
  begin
    ClickSettings(Sender);
  end;

  HoldMouseDown := False;
  Screen.Cursor := crDefault;
end;

procedure TftCardControllerBase.SetHighlightingDrop(const Value: Boolean);
begin
  FModel.HighlightingDrop := Value;
  UpdateView;
end;

procedure TftCardControllerBase.SetHoldMouseDown(const Value: Boolean);
begin
  FModel.HoldMouseDown := Value;
  UpdateView;
end;

procedure TftCardControllerBase.SetImages(const Value: TCustomImageList);
begin
  FImages := Value;
  FView.ButtonCopy.Images := Self.Images;
  FView.ButtonCopy.ImageName := 'content-copy';
  FView.ButtonAlso.Images := Self.Images;
  FView.ButtonAlso.ImageName := 'dots-horizontal';
end;

procedure TftCardControllerBase.SetMenuLinkList(const Value: TList);
begin
  FModel.MenuLinkList := Value;
  UpdateView;
end;

procedure TftCardControllerBase.SetMousePoint(const Value: TPoint);
begin
  FModel.MousePoint := Value;
  UpdateView;
end;

procedure TftCardControllerBase.SetOnNewClick(const Value: TNotifyEvent);
begin
  FView.OnClick := Value;
  FView.LabelTitle.OnClick := Value;

end;

procedure TftCardControllerBase.СardDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin

  // if (FHighlightingDrop) then
  begin
    // TftСardCommandBase((Source as TControl).Owner).FNextСardCommand := Self;
    // Self.FPreviousСardCommand := TftСardCommandBase((Source as TControl).Owner);
    // (Self.Owner as TControl).Repaint;
  end;
end;

procedure TftCardControllerBase.СardDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Sender as TControl <> Source) then
    Accept := Source is TButton
  else
    Accept := False;
  // FHighlightingDrop := Accept;
end;

{ TftStartCardController }

constructor TftStartCardController.Create(AOwner: TComponent);
begin

  FModel := TftStartCardCommandModel.Create;

  FView := TftStartСardCommandView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FCardSettingsController := TftStartCardSettingsController.Create(AOwner);
  (FCardSettingsController as TftStartCardSettingsController).Visible := False;
  (FCardSettingsController as TftStartCardSettingsController)
    .CardController := Self;
  inherited;
  FreeAndNil(FLineLinkController);

  LoadData;
  UpdateView;
end;

destructor TftStartCardController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TftStartCardController.LoadData;
begin
  inherited;
  FModel.Title := 'Start';
  FModel.Left := 40;
  FModel.Top := 40;
  FModel.Width := 250;
  FModel.Height := 150;
end;

procedure TftStartCardController.Update;
begin
  inherited;
  UpdateModel;
  UpdateView;
end;

procedure TftStartCardController.UpdateModel;
begin
  inherited;
  if ((FCardSettingsController as TftStartCardSettingsController)
    .Name = 'Имя карточки') or
    ((FCardSettingsController as TftStartCardSettingsController).Name = '') then
  begin
    FModel.Title := 'Start';
  end
  else
  begin
    FModel.Title :=
      (FCardSettingsController as TftStartCardSettingsController).Name;
  end;

  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftStartCardController.UpdateView;
begin
  inherited;
  FView.LabelTitle.Caption := FModel.Title;
  FView.BoundsRect := FModel.BoundsRect;
end;

{ TftSimpleMessageCardController }

constructor TftSimpleMessageCardController.Create(AOwner: TComponent);
begin
  FModel := TftSimpleMessageCardCommandModel.Create;

  FCardSettingsController := TftSimpleMessageCardSettingsController.
    Create(AOwner);
  (FCardSettingsController as TftSimpleMessageCardSettingsController)
    .Visible := False;
  (FCardSettingsController as TftSimpleMessageCardSettingsController)
    .CardController := Self;
  FView := TftSimpleMessageСardCommandView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);

  inherited;

  // FView.LabelTitle.OnClick := ClickSettings;
  (FView as TftSimpleMessageСardCommandView).ButtonDelete.OnClick :=
    DeleteClick;
  LoadData;
  UpdateView;
end;

procedure TftSimpleMessageCardController.DeleteClick(Sender: TObject);
begin
  Self.Free;
end;

destructor TftSimpleMessageCardController.Destroy;
begin

  inherited;
end;

procedure TftSimpleMessageCardController.LoadData;
begin
  inherited;
  FModel.Title := 'SimpleMessage';
  FModel.Left := 40;
  FModel.Top := 40;
  FModel.Width := 250;
  FModel.Height := 150;
end;

procedure TftSimpleMessageCardController.SetImages
  (const Value: TCustomImageList);
begin
  inherited;
  (FView as TftSimpleMessageСardCommandView).ButtonDelete.Images := Value;
  (FView as TftSimpleMessageСardCommandView).ButtonDelete.ImageName := 'delete';
end;

procedure TftSimpleMessageCardController.Update;
begin
  inherited;
  UpdateModel;
  UpdateView;
end;

procedure TftSimpleMessageCardController.UpdateModel;
begin
  inherited;
  if ((FCardSettingsController as TftSimpleMessageCardSettingsController)
    .Name = 'Имя карточки') or
    ((FCardSettingsController as TftSimpleMessageCardSettingsController)
    .Name = '') then
  begin
    FModel.Title := 'Сообщение от бота';
  end
  else
  begin
    FModel.Title :=
      (FCardSettingsController as TftSimpleMessageCardSettingsController).Name;
  end;
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftSimpleMessageCardController.UpdateView;
begin
  inherited;
  FView.LabelTitle.Caption := FModel.Title;
  FView.BoundsRect := FModel.BoundsRect;
end;

end.
