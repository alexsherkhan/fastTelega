unit fastTelega.ftÑardCommandBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Forms, Vcl.Buttons, fastTelega.ftMenuItemÑardCommandLink;

type

  TftLineOrigin = (loTopLeft, loTopRight);

  TftLineLink = class(TGraphicControl)
  private
    { Private declarations }
    FOrigin: TftLineOrigin;
    FPen: TPen;
    FArea: TScrollBox;
    FStartPoint: TPoint;
    FEndPoint: TPoint;
    procedure SetOrigin(Value: TftLineOrigin);
    procedure SetPen(Value: TPen);
    procedure SetEndPoint(const Value: TPoint);
    procedure SetStartPoint(const Value: TPoint);
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure Draw;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property Origin: TftLineOrigin read FOrigin write SetOrigin
      default loTopLeft;
    property Pen: TPen read FPen write SetPen;
    property Height default 33;
    property Width default 33;
    property StartPoint: TPoint read FStartPoint write SetStartPoint;
    property EndPoint: TPoint read FEndPoint write SetEndPoint;
    procedure StyleChanged(Sender: TObject);
  end;

  TftÑardCommandBase = class(TPanel)
  private
    FID: Integer;
    FTitle: String;
    FSelected: Boolean;
    FStartÑardCommand: Boolean;
    FLabelTitle: TLabel;
    FButtonCopy: TButton;
    FButtonAlso: TButton;
    FCheckBoxSelected: TCheckBox;
    FContinueLink: TftMenuItemÑardCommandLink;

    FMenuLinkList: TList;

    FHighlightingDrop: Boolean;
    // FLineLink: TftLineLink;
    FMouseDown: Boolean;
    FMousePoint: TPoint;
    FOnClick: TNotifyEvent;

    procedure Update;
    procedure ClickNewÑardCommand(Sender: TObject);
    procedure SetOnNewClick(const Value: TNotifyEvent);
    procedure SetTitle(const Value: String);
    procedure ÑardDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ÑardDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer);
    procedure MouseLeave(Sender: TObject);
    procedure Click(Sender: TObject);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property BorderStyle;
    property Caption;
    property Color;
    property Constraints;
    property Ctl3D;
    property UseDockManager default True;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FullRepaint;
    property Font;
    property Locked;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowCaption;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property VerticalAlignment;
    property Visible;
    property StyleElements;
    property StyleName;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnCanResize;
    property OnClick: TNotifyEvent read FOnClick write SetOnNewClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;

    property Title: String read FTitle write SetTitle;
    property ContinueLink: TftMenuItemÑardCommandLink read FContinueLink
      write FContinueLink;
  end;

  TftStartÑardCommand = class(TftÑardCommandBase)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TftSimpleMessageÑardCommand = class(TftÑardCommandBase)
  private
    FButtonDelete: TButton;
    FMenuList: TList;
    procedure DeleteClick(Sender: TObject);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  end;

  TftMessageChainÑardCommand = class(TftSimpleMessageÑardCommand)
  private
    FButtonDelete: TButton;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  end;

implementation

{ TftÑardCommandBase }

procedure TftÑardCommandBase.ClickNewÑardCommand(Sender: TObject);
var
  LÑardCommandBase: TftÑardCommandBase;
begin

  if (TMenuItem(Sender).MenuIndex = 0) then
  begin
    TftMenuItemÑardCommandLink(TMenuItem(Sender).Owner.Owner).NextÑardCommand :=
      TftSimpleMessageÑardCommand.Create(Self.Owner);
  end
  else if (TMenuItem(Sender).MenuIndex = 1) then
  begin
    TftMenuItemÑardCommandLink(TMenuItem(Sender).Owner.Owner).NextÑardCommand :=
      TftMessageChainÑardCommand.Create(Self.Owner);
  end;
  LÑardCommandBase := TftÑardCommandBase
    (TftMenuItemÑardCommandLink(TMenuItem(Sender).Owner.Owner).NextÑardCommand);
  LÑardCommandBase.Parent := Self.Parent;
  LÑardCommandBase.Left := Self.Left + Self.Width + Self.Width div 4;
  LÑardCommandBase.Top := Self.Top + Self.Height div 2;
  TftMenuItemÑardCommandLink(TMenuItem(Sender).Owner.Owner)
    .PreviousÑardCommand := Self;

  Self.Parent.Refresh;
  // Self.FContinueLink.FButtonNew.Visible := False;
end;

procedure TftÑardCommandBase.Click(Sender: TObject);
begin
  FSelected := True;
end;

constructor TftÑardCommandBase.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.OnMouseDown := MouseDown;
  Self.OnMouseMove := MouseMove;
  Self.OnMouseUp := MouseUp;
  Self.OnMouseLeave := MouseLeave;
  Self.Width := 250;
  // Self.Height := 500;
  Self.Padding.Left := 10;
  Self.Padding.Right := 10;
  Self.Padding.Top := 5;
  // Self.Padding.Bottom := 10;
  Self.BevelOuter := bvNone;
  // Self.DoubleBuffered := True;
  Self.OnDragOver := ÑardDragOver;
  Self.OnDragDrop := ÑardDragDrop;

  // Self.FPreviousÑardCommand := nil;
  // Self.FNextÑardCommand := nil;
  Self.AutoSize := True;

  FCheckBoxSelected := TCheckBox.Create(AOwner);
  FCheckBoxSelected.Parent := Self;
  FCheckBoxSelected.Caption := '';
  FCheckBoxSelected.Align := alLeft;
  FCheckBoxSelected.Width := 20;
  FCheckBoxSelected.Visible := False;

  FLabelTitle := TLabel.Create(AOwner);
  FLabelTitle.Parent := Self;
  FLabelTitle.Caption := FTitle;
  FLabelTitle.Align := alClient;
  FLabelTitle.Layout := tlCenter;
  FLabelTitle.OnMouseDown := MouseDown;
  FLabelTitle.Height := 30;
  FLabelTitle.Alignment := taCenter;
  // FLabelTitle.Visible := False;
  FLabelTitle.OnMouseDown := MouseDown;
  FLabelTitle.OnMouseMove := MouseMove;
  FLabelTitle.OnMouseUp := MouseUp;

  FButtonAlso := TButton.Create(AOwner);
  FButtonAlso.Parent := Self;
  FButtonAlso.Caption := '+++';
  FButtonAlso.Align := alRight;
  FButtonAlso.Width := 30;

  FButtonCopy := TButton.Create(AOwner);
  FButtonCopy.Parent := Self;
  FButtonCopy.Caption := 'Copy';
  FButtonCopy.Align := alRight;
  FButtonCopy.Width := 40;

  FContinueLink := TftMenuItemÑardCommandLink.Create(AOwner);
  FContinueLink.Parent := Self;
  FContinueLink.Align := alBottom;
  FContinueLink.OnMouseDown := MouseDown;
  FContinueLink.OnNewClick := ClickNewÑardCommand;
  FContinueLink.Padding.Left := 10;
  FContinueLink.Padding.Right := 10;
  FContinueLink.Padding.Bottom := 10;
  FContinueLink.Padding.Top := 10;

  FMenuLinkList := TList.Create();
  FMenuLinkList.Add(FContinueLink);

  // FLineLink := TftLineLink.Create(Self.Parent);
  // FLineLink.Parent := Self.Parent;

  Self.Update;
end;

destructor TftÑardCommandBase.Destroy;
begin
  FLabelTitle.Free;
  // FButtonCopy.Free;
  // FButtonAlso.Free;
  // FContinueLink.Free;
  // FPreviousÑardCommand.Free;
  // FNextÑardCommand.Free;
  inherited;
end;

procedure TftÑardCommandBase.MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDown := (Button = mbLeft);
  if FMouseDown then
  begin
    FMousePoint := Point(X, Y);
    // FMousePoint := TControl(Sender).ClientToScreen(FMousePoint)
  end;
end;

procedure TftÑardCommandBase.MouseLeave(Sender: TObject);
begin
  FMouseDown := False;
  FCheckBoxSelected.Visible := False;
end;

procedure TftÑardCommandBase.MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FCheckBoxSelected.Visible := True;
  if not FMouseDown then
    Exit;
  try
    Self.Parent.Repaint;
    Screen.Cursor := crHandPoint;
    SetBounds(Left + X - FMousePoint.X, Top + Y - FMousePoint.Y, Width, Height);
  finally

  end;
end;

procedure TftÑardCommandBase.MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FMouseDown := False;
  Screen.Cursor := crDefault;
end;

procedure TftÑardCommandBase.Paint;
begin
  inherited;
  Canvas.Pen.Width := 1;
  // Canvas.Pen.Color := clSkyBlue;
  if (FHighlightingDrop) then
  begin
    Canvas.Pen.Width := 3;
    Canvas.Pen.Color := clGreen;
    Canvas.RoundRect(Self.GetClientRect.TopLeft.X, Self.GetClientRect.TopLeft.Y,
      Self.GetClientRect.BottomRight.X,
      Self.GetClientRect.BottomRight.Y, 10, 10);
  end
  // if (FSelected) then
  // begin
  // Canvas.Pen.Width := 3;
  // Canvas.RoundRect(Self.GetClientRect.TopLeft.X, Self.GetClientRect.TopLeft.Y,
  // Self.GetClientRect.BottomRight.X,
  // Self.GetClientRect.BottomRight.Y, 10, 10);
  // end
  else
  begin
    Canvas.Pen.Width := 1;
    Canvas.Pen.Color := clBlack;
    Canvas.RoundRect(Self.GetClientRect.TopLeft.X, Self.GetClientRect.TopLeft.Y,
      Self.GetClientRect.BottomRight.X,
      Self.GetClientRect.BottomRight.Y, 10, 10);
  end;
end;

procedure TftÑardCommandBase.SetOnNewClick(const Value: TNotifyEvent);
begin
  FOnClick := Value;
  FLabelTitle.OnClick := Value;
  FContinueLink.OnClick := Value;
end;

procedure TftÑardCommandBase.SetTitle(const Value: String);
begin
  FTitle := Value;
  FLabelTitle.Caption := Value;
end;

procedure TftÑardCommandBase.Update;
begin
  Self.Height := FLabelTitle.Height + FContinueLink.Height;
  Self.Refresh;
end;

procedure TftÑardCommandBase.ÑardDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  if (FHighlightingDrop) then
  begin
    // TftÑardCommandBase((Source as TControl).Owner).FNextÑardCommand := Self;
    // Self.FPreviousÑardCommand := TftÑardCommandBase((Source as TControl).Owner);
    // (Self.Owner as TControl).Repaint;
  end;
end;

procedure TftÑardCommandBase.ÑardDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Sender as TControl <> Source) then
    Accept := Source is TButton
  else
    Accept := False;
  FHighlightingDrop := Accept;
end;

{ TftStartÑardCommand }
constructor TftStartÑardCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Title := 'Start';
  FStartÑardCommand := True;
end;

destructor TftStartÑardCommand.Destroy;
begin
  inherited;
end;

{ TftSimpleÑardCommand }

constructor TftSimpleMessageÑardCommand.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Title := 'Simple Message';
  FStartÑardCommand := False;
  FButtonDelete := TButton.Create(AOwner);
  FButtonDelete.Parent := Self;
  FButtonDelete.Caption := 'Del';
  FButtonDelete.Align := alRight;
  FButtonDelete.Width := 40;
  FButtonDelete.OnClick := DeleteClick;
end;

procedure TftSimpleMessageÑardCommand.DeleteClick(Sender: TObject);
var
  LParent: TControl;
begin
  LParent := Self.Parent;
  // (Self.FPreviousÑardCommand as TftÑardCommandBase)
  // .FContinueLink.FButtonNew.Visible := True;
  // FreeAndNil((Self.FPreviousÑardCommand as TftÑardCommandBase)
  // .FNextÑardCommand);
  LParent.Repaint;
end;

destructor TftSimpleMessageÑardCommand.Destroy;
begin
  FButtonDelete.Free;
  inherited;
end;

{ TftLineLink }

constructor TftLineLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Hint := 'Line';
  Height := 33;
  Width := 33;
  FPen := TPen.Create;
  FPen.OnChange := StyleChanged;
  if csOpaque in ControlStyle then
    ControlStyle := ControlStyle - [csOpaque];
end;

destructor TftLineLink.Destroy;
begin
  FPen.Free;
  inherited Destroy;
end;

procedure TftLineLink.Draw;
begin
  // FArea.Ca MoveTo(0, 0);
  // LineTo(0, Height);
end;

procedure TftLineLink.Paint;
begin
  with Canvas do
  begin
    FPen.Color := clBlue;
    Pen := FPen;
    Pen.Width := 1;

    Rectangle(Self.BoundsRect);
    // Self.Left := FStartPoint.X;
    // Self.Top := FStartPoint.Y;
    // Self.Width := FEndPoint.X - FStartPoint.X;
    // Self.Height := FEndPoint.Y - FStartPoint.Y;
    if (Width <= Pen.Width) or (Height <= Pen.Width) then
    begin
      if Width <= Pen.Width then
      begin
        MoveTo(0, 0);
        LineTo(0, Height);
      end;
      if Height <= Pen.Width then
      begin
        MoveTo(0, 0);
        LineTo(Width, 0);
      end;
    end
    else
      case FOrigin of
        loTopLeft:
          begin
            MoveTo(0, 0);
            LineTo(Width, Height);
          end;
        loTopRight:
          begin
            MoveTo(Width, 0);
            LineTo(0, Height);
          end;
      end;

  end;

end;

procedure TftLineLink.SetEndPoint(const Value: TPoint);
begin
  if FEndPoint <> Value then
  begin
    FEndPoint := Value;
    Refresh;
  end;
end;

procedure TftLineLink.SetOrigin(Value: TftLineOrigin);
begin
  if FOrigin <> Value then
  begin
    FOrigin := Value;
    Refresh;
  end;
end;

procedure TftLineLink.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TftLineLink.SetStartPoint(const Value: TPoint);
begin
  if FStartPoint <> Value then
  begin
    FStartPoint := Value;
    Invalidate;
  end;
end;

procedure TftLineLink.StyleChanged(Sender: TObject);
begin
  Invalidate;
end;

{ TftMessageChainÑardCommand }

constructor TftMessageChainÑardCommand.Create(AOwner: TComponent);
var
  FAnyLink, FAnyLink2: TftMenuItemÑardCommandLink;
begin
  inherited Create(AOwner);
  Title := 'Message Chain';
  Self.AutoSize := True;
  FStartÑardCommand := False;
  // FAnyLink := TftMenuItemÑardCommandLink.Create(AOwner);
  // FAnyLink.Parent := Self;
  // FAnyLink.Align := alBottom;
  // FAnyLink.Height := 40;
  // FAnyLink.OnMouseDown := MouseDown;
  // FAnyLink.OnNewClick := ClickNewÑardCommand;
  // // FContinueLink.BevelOuter := bvNone;
  // FAnyLink.Padding.Left := 10;
  // FAnyLink.Padding.Right := 10;
  // FAnyLink.Padding.Bottom := 10;
  // FAnyLink.Padding.Top := 10;
end;

destructor TftMessageChainÑardCommand.Destroy;
begin

  inherited;
end;

end.
