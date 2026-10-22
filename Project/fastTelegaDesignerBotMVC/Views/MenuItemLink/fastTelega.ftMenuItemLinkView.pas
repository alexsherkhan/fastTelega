unit fastTelega.ftMenuItemLinkView;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.StdCtrls,
  fastTelega.ftViewBase;

type
  // TftMenuItemLinkPosition = (ipLeft = 0, ipRight = 1);

  TftMenuItemLinkView = class(TftViewBase)
  private
    FLabelText: TLabel;
    FButtonNew: TButton;
    FController: TObject;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
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

    property ButtonNew: TButton read FButtonNew write FButtonNew;
    property LabelText: TLabel read FLabelText write FLabelText;
    property Controller: TObject read FController write FController;
  end;

implementation

{ TftMenuItemLinkView }

constructor TftMenuItemLinkView.Create(AOwner: TComponent);
var
  LMenuItem: TMenuItem;
begin
  inherited Create(AOwner);

  FLabelText := TLabel.Create(Self);
  FLabelText.Parent := Self;
  FLabelText.Name := 'lbText' + Self.Name;
  FLabelText.Align := alClient;
  FLabelText.Layout := tlCenter;
  FLabelText.EllipsisPosition := epWordEllipsis;

  FButtonNew := TButton.Create(Self);
  FButtonNew.Parent := Self;
  FButtonNew.Name := 'btNew' + Self.Name;
  FButtonNew.DropDownMenu := TPopupMenu.Create(Self);
  FButtonNew.DropDownMenu.AutoPopup := True;
end;

destructor TftMenuItemLinkView.Destroy;
begin
  FLabelText.Free;
  FButtonNew.Free;
  inherited;
end;

procedure TftMenuItemLinkView.Paint;
var
  LColor: TColor;
begin
  inherited;
  Canvas.Pen.Color := clActiveBorder;
  Canvas.Brush.Color := Self.Color;
  Canvas.RoundRect(Self.GetClientRect.TopLeft.X + Self.Padding.Left - 5,
    Self.GetClientRect.TopLeft.Y + Self.Padding.Top - 5,
    Self.GetClientRect.BottomRight.X - Self.Padding.Right + 5,
    Self.GetClientRect.BottomRight.Y - Self.Padding.Bottom + 5, 10, 10);

  LColor := Canvas.Brush.Color;
  Canvas.Brush.Color := clHotLight;
  Canvas.Pen.Color := clHotLight;
  if { (FLinkPosition = ipRight) } not ButtonNew.Visible then
  begin
    Canvas.RoundRect(Self.GetClientRect.BottomRight.X - 10- Self.Padding.Right,
      (Self.GetClientRect.TopLeft.Y + Self.Height div 2) -
      Self.Padding.Right div 2, Self.GetClientRect.BottomRight.X,
      Self.GetClientRect.BottomRight.Y - Self.Height div 3, 2, 2);
  end;
  // else
  // begin
  // Canvas.Ellipse(Self.GetClientRect.TopLeft.X + Self.Padding.Right,
  // (Self.GetClientRect.TopLeft.Y + Self.Height div 2) -
  // Self.Padding.Right div 2, Self.GetClientRect.TopLeft.X,
  // Self.GetClientRect.BottomRight.Y - Self.Height div 3);
  // end;

  Canvas.Brush.Color := LColor;
end;

end.
