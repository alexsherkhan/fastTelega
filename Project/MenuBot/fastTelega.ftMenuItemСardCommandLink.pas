unit fastTelega.ftMenuItem—ardCommandLink;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TftMenuItemLinkPosition = (ipLeft = 0, ipRight = 1);

  TftMenuItem—ardCommandLink = class(TCustomControl)
  private
    FText: String;
    FLabelText: TLabel;
    FButtonNew: TButton;
    FOnNewClick: TNotifyEvent;

    FLinkPosition: TftMenuItemLinkPosition;
    FPrevious—ardCommand: TObject;
    FNext—ardCommand: TObject;

    procedure ButtonNewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonNewClick(Sender: TObject);
    procedure SetOnNewClick(const Value: TNotifyEvent);
    procedure LinkDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LinkDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnNewClick: TNotifyEvent read FOnNewClick write SetOnNewClick;
    property OnCanResize;

    property Align;
    property Anchors;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
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
    property Font;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property StyleElements;
    property StyleName;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnClick;
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

    property Previous—ardCommand: TObject read FPrevious—ardCommand
      write FPrevious—ardCommand;
    property Next—ardCommand: TObject read FNext—ardCommand
      write FNext—ardCommand;
  end;

implementation

{ TftMenuItem—ardCommandLink }

procedure TftMenuItem—ardCommandLink.ButtonNewClick(Sender: TObject);

var
  LPt: TPoint;
begin
  LPt := Mouse.CursorPos;
  FButtonNew.DropDownMenu.Popup(LPt.X, LPt.Y);
end;

constructor TftMenuItem—ardCommandLink.Create(AOwner: TComponent);
var
  LMenuItem: TMenuItem;
begin
  inherited Create(AOwner);
  Self.Height := 40;
  Self.FText := 'œÓ‰ÓÎÊËÚ¸';
  Self.ParentBackground := True;
  FLinkPosition := ipRight;
  FLabelText := TLabel.Create(AOwner);
  FLabelText.Parent := Self;
  FLabelText.Caption := FText;
  FLabelText.Align := alLeft;
  FLabelText.Layout := tlCenter;
  FLabelText.Enabled := False;

  FText := '+';
  FButtonNew := TButton.Create(AOwner);
  FButtonNew.Parent := Self;
  FButtonNew.Caption := FText;
  FButtonNew.Align := alRight;
  FButtonNew.Width := 20;
  FButtonNew.DragMode := TDragMode.dmManual;

  FButtonNew.DropDownMenu := TPopupMenu.Create(AOwner);
  FButtonNew.DropDownMenu.AutoPopup := True;
  FButtonNew.OnDropDownClick := ButtonNewClick;

  FButtonNew.OnDragDrop := LinkDragDrop;
  FButtonNew.OnDragOver := LinkDragOver;

  LMenuItem := TMenuItem.Create(FButtonNew.DropDownMenu);
  LMenuItem.Caption := 'œÓÒÚÓÂ ÒÓÓ·˘ÂÌËÂ';
  LMenuItem.OnClick := OnNewClick;
  FButtonNew.DropDownMenu.Items.Add(LMenuItem);

  LMenuItem := TMenuItem.Create(FButtonNew.DropDownMenu);
  LMenuItem.Caption := '÷ÂÔÓ˜Í‡ ÒÓÓ·˘ÂÌËÈ';
  LMenuItem.OnClick := OnNewClick;
  FButtonNew.DropDownMenu.Items.Add(LMenuItem);

  FButtonNew.OnClick := ButtonNewClick;
  // FButtonNew.OnMouseDown := ButtonNewMouseDown;
end;

destructor TftMenuItem—ardCommandLink.Destroy;
begin
  FLabelText.Free;
  FButtonNew.Free;
  inherited;
end;

procedure TftMenuItem—ardCommandLink.LinkDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin

end;

procedure TftMenuItem—ardCommandLink.LinkDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin

end;

procedure TftMenuItem—ardCommandLink.ButtonNewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

var
  LPt: TPoint;
begin
  if (Button = mbLeft) then
    (Sender as TControl).BeginDrag(False);
  // LPt := Mouse.CursorPos;
  // FButtonNew.DropDownMenu.Popup(LPt.X, LPt.Y);
end;

procedure TftMenuItem—ardCommandLink.Paint;

var
  LColor: TColor;
begin
  inherited;
  // Canvas.Brush.Color := clGray;
  // Canvas.FillRect(Self.GetClientRect);

  Canvas.RoundRect(Self.GetClientRect.TopLeft.X + Self.Padding.Left - 5,
    Self.GetClientRect.TopLeft.Y + Self.Padding.Top - 5,
    Self.GetClientRect.BottomRight.X - Self.Padding.Right + 5,
    Self.GetClientRect.BottomRight.Y - Self.Padding.Bottom + 5, 10, 10);

  LColor := Canvas.Brush.Color;
  Canvas.Brush.Color := clSkyBlue;
  Canvas.Pen.Color := clSkyBlue;
  if (FLinkPosition = ipRight) then
  begin
    Canvas.Ellipse(Self.GetClientRect.BottomRight.X - Self.Padding.Right,
      (Self.GetClientRect.TopLeft.Y + Self.Height div 2) -
      Self.Padding.Right div 2, Self.GetClientRect.BottomRight.X,
      Self.GetClientRect.BottomRight.Y - Self.Height div 3);
  end
  else
  begin
    Canvas.Ellipse(Self.GetClientRect.TopLeft.X + Self.Padding.Right,
      (Self.GetClientRect.TopLeft.Y + Self.Height div 2) -
      Self.Padding.Right div 2, Self.GetClientRect.TopLeft.X,
      Self.GetClientRect.BottomRight.Y - Self.Height div 3);
  end;

  Canvas.Brush.Color := LColor;
end;

procedure TftMenuItem—ardCommandLink.SetOnNewClick(const Value: TNotifyEvent);
var
  I: Integer;
begin
  FOnNewClick := Value;
  for I := 0 to FButtonNew.DropDownMenu.Items.Count - 1 do
    FButtonNew.DropDownMenu.Items[I].OnClick := FOnNewClick;
end;

end.
