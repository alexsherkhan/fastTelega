unit fastTelega.ftCardView;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  Tft—ardCommandBaseView = class(TPanel)
  private
    FPanelTitle: TPanel;
    FPanelMenuLinks: TPanel;
    FSelected: Boolean;
    FStart—ardCommand: Boolean;

    FLabelTitle: TLabel;
    FButtonCopy: TButton;
    FButtonAlso: TButton;
    FCheckBoxSelected: TCheckBox;

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

    property PanelTitle: TPanel read FPanelTitle write FPanelTitle;
    property LabelTitle: TLabel read FLabelTitle write FLabelTitle;
    property ButtonCopy: TButton read FButtonCopy write FButtonCopy;
    property ButtonAlso: TButton read FButtonAlso write FButtonAlso;
    property CheckBoxSelected: TCheckBox read FCheckBoxSelected
      write FCheckBoxSelected;
    property PanelMenuLinks: TPanel read FPanelMenuLinks write FPanelMenuLinks;
  end;

  TftStart—ardCommandView = class(Tft—ardCommandBaseView)
  private
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TftSimpleMessage—ardCommandView = class(Tft—ardCommandBaseView)
  private
    FButtonDelete: TButton;
    FMenuList: TList;
    procedure DeleteClick(Sender: TObject);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ButtonDelete: TButton read FButtonDelete write FButtonDelete;
  end;

  TftMessageChain—ardCommand = class(TftSimpleMessage—ardCommandView)
  private
    FButtonDelete: TButton;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  end;

implementation

{ Tft—ardCommandBase }

// procedure Tft—ardCommandBaseView.ClickAddMenuItem(Sender: TObject);
// var
// LftMenuItemLinkController: TftMenuItemLinkController;
// begin
// FMenuLinkList.Add(TftMenuItemLinkController.Create(FPanelMenuLinks).Text := 'À˛·ÓÈ ‰Û„ÓÈ ÚÂÍÒÚ';);
// Self.Repaint;
// end;

// procedure Tft—ardCommandBaseView.Click(Sender: TObject);
// begin
// FSelected := True;
// end;

constructor Tft—ardCommandBaseView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPanelTitle := TPanel.Create(Self);
  FPanelTitle.Parent := Self;

  FCheckBoxSelected := TCheckBox.Create(FPanelTitle);
  FCheckBoxSelected.Parent := FPanelTitle;

  FLabelTitle := TLabel.Create(FPanelTitle);
  FLabelTitle.Parent := FPanelTitle;

  FButtonAlso := TButton.Create(FPanelTitle);
  FButtonAlso.Parent := FPanelTitle;

  FButtonCopy := TButton.Create(FPanelTitle);
  FButtonCopy.Parent := FPanelTitle;

  FPanelMenuLinks := TPanel.Create(Self);
  FPanelMenuLinks.Parent := Self;
end;

destructor Tft—ardCommandBaseView.Destroy;
begin
  FLabelTitle.Free;
  // FButtonCopy.Free;
  // FButtonAlso.Free;
  // FContinueLink.Free;
  // FPrevious—ardCommand.Free;
  // FNext—ardCommand.Free;
  inherited;
end;

procedure Tft—ardCommandBaseView.Paint;
var
  LColor: TColor;
begin
  inherited;
  LColor := Canvas.Brush.Color;
  Canvas.Pen.Width := 1;
  // Canvas.Pen.Color := clSkyBlue;
  //if (HighlightingDrop) then
//  begin
//    Canvas.Pen.Width := 3;
//    Canvas.Pen.Color := clGreen;
//    Canvas.RoundRect(Self.GetClientRect.TopLeft.X, Self.GetClientRect.TopLeft.Y,
//      Self.GetClientRect.BottomRight.X,
//      Self.GetClientRect.BottomRight.Y, 10, 10);
//  end
  // if (FSelected) then
  // begin
  // Canvas.Pen.Width := 3;
  // Canvas.RoundRect(Self.GetClientRect.TopLeft.X, Self.GetClientRect.TopLeft.Y,
  // Self.GetClientRect.BottomRight.X,
  // Self.GetClientRect.BottomRight.Y, 10, 10);
  // end
//  else
//  begin

    Canvas.Pen.Width := 1;
    Canvas.Pen.Color := clActiveBorder;
    Canvas.Brush.Color := clMenu;
    Canvas.RoundRect(Self.GetClientRect.TopLeft.X, Self.GetClientRect.TopLeft.Y,
      Self.GetClientRect.BottomRight.X,
      Self.GetClientRect.BottomRight.Y, 10, 10);


    Canvas.MoveTo(FPanelMenuLinks.Left,FPanelMenuLinks.Top);
    Canvas.LineTo(FPanelMenuLinks.Left+ FPanelMenuLinks.Width,FPanelMenuLinks.Top);
//    Canvas.Rectangle(FPanelMenuLinks.BoundsRect);
//  end;
  Canvas.Brush.Color := LColor;
end;

{ TftStart—ardCommandView }
constructor TftStart—ardCommandView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Title := 'Start';
  FStart—ardCommand := True;
end;

destructor TftStart—ardCommandView.Destroy;
begin
  inherited;
end;

{ TftSimple—ardCommandView }

constructor TftSimpleMessage—ardCommandView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLabelTitle.Caption := 'Simple Message';
  FStart—ardCommand := False;
  FButtonDelete := TButton.Create(AOwner);
  FButtonDelete.Parent := FPanelTitle;
//  FButtonDelete.Caption := 'Del';
  FButtonDelete.Align := alRight;
  FButtonDelete.Width := 20;
  FButtonDelete.OnClick := DeleteClick;
end;

procedure TftSimpleMessage—ardCommandView.DeleteClick(Sender: TObject);
var
  LParent: TControl;
begin
  // LParent := Self.Parent;
  // (Self.FPrevious—ardCommand as Tft—ardCommandBase)
  // .FContinueLink.FButtonNew.Visible := True;
  // FreeAndNil((Self.FPrevious—ardCommand as Tft—ardCommandBase)
  // .FNext—ardCommand);
  // LParent.Repaint;
  // Self.Free;
end;

destructor TftSimpleMessage—ardCommandView.Destroy;
begin
  FButtonDelete.Free;
  inherited;
end;

{ TftMessageChain—ardCommand }

constructor TftMessageChain—ardCommand.Create(AOwner: TComponent);
// var
// FAnyLink, FAnyLink2: TftMenuItem—ardCommandLink;
begin
  inherited Create(AOwner);
  FLabelTitle.Caption := 'Message Chain';
  Self.AutoSize := True;
  FStart—ardCommand := False;
  // FAnyLink := TftMenuItem—ardCommandLink.Create(AOwner);
  // FAnyLink.Parent := Self;
  // FAnyLink.Align := alBottom;
  // FAnyLink.Height := 40;
  // FAnyLink.OnMouseDown := MouseDown;
  // FAnyLink.OnNewClick := ClickNew—ardCommand;
  // // FContinueLink.BevelOuter := bvNone;
  // FAnyLink.Padding.Left := 10;
  // FAnyLink.Padding.Right := 10;
  // FAnyLink.Padding.Bottom := 10;
  // FAnyLink.Padding.Top := 10;
end;

destructor TftMessageChain—ardCommand.Destroy;
begin

  inherited;
end;

end.
