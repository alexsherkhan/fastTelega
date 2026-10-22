unit fastTelega.ftDesignerBotView;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  fastTelega.ftViewBase,
  fastTelega.ftPlotGrid;

type
  TftDesignerBotView = Class(TftViewScrollBoxBase)
  private
    FNewCardButton: TButton;
    FftPlotGrid: TftPlotGrid;
    FBitmap: TBitmap;
    FCanvas: TCanvas;
    FDragPosition: TPoint;
    // procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure SetBitmap(Value: TBitmap);
    procedure NewCardButtonClick(Sender: TObject);
    procedure DesktopDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  protected
    procedure Painting;
    procedure PaintWindow(DC: HDC); override;
  published
    property BackBitmap: TBitmap read FBitmap write SetBitmap;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    property NewCardButton: TButton read FNewCardButton write FNewCardButton;

    property Align;
    property Anchors;
    property AutoScroll default True;
    property AutoSize;
    property BevelEdges;
    property BevelInner;
    property BevelOuter;
    property BevelKind;
    property BevelWidth;
    property BiDiMode;
    property BorderStyle;
    property Constraints;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Color nodefault;
    property Ctl3D;
    property Font;
    property Padding;
    property ParentBiDiMode;
    property ParentBackground default False;
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
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDblClick;
    property OnDockDrop;
    property OnDockOver;
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
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;

    property PlotGrid: TftPlotGrid read FftPlotGrid write FftPlotGrid;
  end;

implementation

{ TftDesignerBotView }

constructor TftDesignerBotView.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  Self.Align := alClient;
  Self.Color := clSkyBlue;
  Self.OnDragOver := DesktopDragOver;

//  FftPlotGrid := TftPlotGrid.Create(Self);
//  FftPlotGrid.Parent := Self;
//  FftPlotGrid.Align := alClient;
//  FftPlotGrid.Frequency := 10;
//  FftPlotGrid.Marks := 5;


  FNewCardButton := TButton.Create(Self);
  FNewCardButton.Parent := Self;
  FNewCardButton.Width := 80;
  FNewCardButton.Left := 10;
  FNewCardButton.Top := 10;
  FNewCardButton.Caption := 'New Card';
  FNewCardButton.OnClick := NewCardButtonClick;

  FBitmap := TBitmap.Create;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
end;

procedure TftDesignerBotView.DesktopDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  FDragPosition.X := X;
  FDragPosition.Y := Y;
  Self.Repaint;
end;

destructor TftDesignerBotView.Destroy;
begin
  FBitmap.Destroy;
  FCanvas.Destroy;
  inherited Destroy;
end;

procedure TftDesignerBotView.NewCardButtonClick(Sender: TObject);
// var
// SimpleMessageÑardCommand: TftSimpleMessageÑardCommand;
begin
  // SimpleMessageÑardCommand := TftSimpleMessageÑardCommand.Create(Self);
  // SimpleMessageÑardCommand.Parent := Self;
end;

procedure TftDesignerBotView.Painting;
// var
// I: Integer;
// LDrawHeight, LDrawWidth: Integer;
// LRow, LColumn, LBitmapLeft, LBitmapTop, LBitmapWidth, LBitmapHeight: Integer;
// Lxdl, Lxdt: Integer;
// LClientRect: TRect;
// Lxhdl: Word;
// LStartPoint: TPoint;
// LEndPoint: TPoint;
// LÑardCommandBase: TftÑardCommandBase;
//
// LPolyBezier: array [1 .. 3] of TPoint;
begin

  // I := 0;
  // while I < ClientRect.Width do
  // begin
  // FBitmap.Width := ClientRect.Width;
  // FBitmap.Height := ClientRect.Height;
  // FBitmap.Canvas.Pen.Width := 1;
  // FBitmap.Canvas.Pen.Color := clGray;
  // FBitmap.Canvas.MoveTo(I, 0);
  // FBitmap.Canvas.LineTo(I, ClientRect.Height);
  // FBitmap.Canvas.MoveTo(0, I);
  // FBitmap.Canvas.LineTo(ClientRect.Width, I);
  // I := I + 100;
  // end;

  // for I := 0 to Self.ControlCount - 1 do
  // if (Self.ControlCount > 0) then
  // LÑardCommandBase := TftÑardCommandBase(Self.Components[1]);
  // while (LÑardCommandBase <> nil) do
  // begin
  // // if (Self.Components[I] is TftÑardCommandBase) then
  // if (LÑardCommandBase.ContinueLink.NextÑardCommand <> nil) then
  // begin
  // // LÑardCommandBase := TftÑardCommandBase(Self.Components[I]);
  //
  // LStartPoint := TPoint.Create(LÑardCommandBase.Left +
  // LÑardCommandBase.Width, LÑardCommandBase.Top + LÑardCommandBase.Height);
  // LEndPoint := TPoint.Create
  // (TftÑardCommandBase(LÑardCommandBase.ContinueLink.NextÑardCommand).Left,
  // TftÑardCommandBase(LÑardCommandBase.ContinueLink.NextÑardCommand).Top);
  // if LÑardCommandBase.Left < LEndPoint.X then
  // begin
  // FCanvas.MoveTo(LStartPoint.X, LStartPoint.Y - 20);
  // LPolyBezier[1].X := LStartPoint.X +
  // abs(LStartPoint.X - LEndPoint.X) div 2;
  // LPolyBezier[1].Y := LStartPoint.Y - 20;
  // LPolyBezier[2].X := LEndPoint.X -
  // abs(LStartPoint.X - LEndPoint.X) div 2;
  // LPolyBezier[2].Y := LEndPoint.Y;
  // // LÑardCommandBase.FContinueLink.FLinkPosition := ipRight;
  // if LÑardCommandBase.Left < LEndPoint.X then
  // begin
  //
  // end;
  // end
  // else
  // begin
  // FCanvas.MoveTo(LÑardCommandBase.Left, LStartPoint.Y - 20);
  // LPolyBezier[1].X := LÑardCommandBase.Left -
  // abs(LÑardCommandBase.Left - LEndPoint.X) div 2;
  // LPolyBezier[1].Y := LStartPoint.Y - 20;
  // LPolyBezier[2].X := LEndPoint.X -
  // abs(LÑardCommandBase.Left - LEndPoint.X) div 2;
  // LPolyBezier[2].Y := LEndPoint.Y;
  //
  // // LÑardCommandBase.FContinueLink.FLinkPosition := ipLeft;
  // end;
  // LPolyBezier[3].X := LEndPoint.X;
  // LPolyBezier[3].Y := LEndPoint.Y + 20;
  // // if (LÑardCommandBase.Top + LÑardCommandBase.Height < LEndPoint.Y -
  // // LStartPoint.Y) then
  // // begin
  // // FCanvas.MoveTo(LEndPoint.X + LÑardCommandBase.Width div 2, LEndPoint.Y);
  // // FCanvas.LineTo(LEndPoint.X + LÑardCommandBase.Width div 2 - 5,
  // // LEndPoint.Y - 10);
  // // FCanvas.MoveTo(LEndPoint.X + LÑardCommandBase.Width div 2, LEndPoint.Y);
  // // FCanvas.LineTo(LEndPoint.X + LÑardCommandBase.Width div 2 + 5,
  // // LEndPoint.Y - 10);
  // // LPolyBezier[3].X := LEndPoint.X + LÑardCommandBase.Width div 2;
  // // LPolyBezier[3].Y := LEndPoint.Y;
  // // end
  // // else
  // // begin
  // // FCanvas.MoveTo(LPolyBezier[3].X, LPolyBezier[3].Y);
  // // FCanvas.LineTo(LPolyBezier[3].X - 10, LPolyBezier[3].Y - 5);
  // // FCanvas.MoveTo(LPolyBezier[3].X, LPolyBezier[3].Y);
  // // FCanvas.LineTo(LPolyBezier[3].X - 10, LPolyBezier[3].Y + 5);
  // // LPolyBezier[3].X := LEndPoint.X;
  // // LPolyBezier[3].Y := LEndPoint.Y + 20;
  // // end;
  // //
  // // FCanvas.MoveTo(LStartPoint.X, LStartPoint.Y - 20);
  // FCanvas.Pen.Width := 5;
  // FCanvas.Pen.Color := clSkyBlue;
  // FCanvas.PolyBezierTo(LPolyBezier);
  //
  // end;
  // LÑardCommandBase := TftÑardCommandBase
  // (LÑardCommandBase.ContinueLink.NextÑardCommand);
  //
  // end;
  //
  // if (FDragPosition.X > 0) then
  // begin
  // FCanvas.Pen.Width := 1;
  // FCanvas.Pen.Style := psDash;
  // FCanvas.MoveTo(0, 0);
  // FCanvas.LineTo(FDragPosition.X, FDragPosition.Y);
  // end;
  //
  // if (FBitmap.Width <> 0) and (FBitmap.Height <> 0) then
  // begin
  // LClientRect := ClientRect;
  // LDrawHeight := LClientRect.Bottom - LClientRect.Top;
  // LDrawWidth := LClientRect.Right - LClientRect.Left;
  // Lxdl := (HorzScrollBar.Position mod FBitmap.Width);
  // Lxdt := (VertScrollBar.Position mod FBitmap.Height);
  // for LRow := 0 to (LDrawHeight div FBitmap.Height) + 1 do
  // begin
  // for LColumn := 0 to (LDrawWidth div FBitmap.Width) + 1 do
  // begin
  // LBitmapLeft := LColumn * FBitmap.Width + LClientRect.Left - Lxdl;
  // LBitmapTop := LRow * FBitmap.Height + LClientRect.Top - Lxdt;
  // LBitmapWidth := FBitmap.Width;
  // if (LDrawWidth - LBitmapLeft + LClientRect.Left) < LBitmapWidth then
  // LBitmapWidth := (LDrawWidth - LBitmapLeft + LClientRect.Top);
  // LBitmapHeight := FBitmap.Height;
  // if (LDrawHeight - LBitmapTop + LClientRect.Top) < LBitmapHeight then
  // LBitmapHeight := (LDrawHeight - LBitmapTop + LClientRect.Top);
  // FCanvas.CopyRect(Rect(LBitmapLeft, LBitmapTop,
  // LBitmapLeft + LBitmapWidth, LBitmapTop + LBitmapHeight),
  // FBitmap.Canvas, Rect(0, 0, LBitmapWidth, LBitmapHeight));
  // end;
  // end;
  // end;
end;

procedure TftDesignerBotView.PaintWindow(DC: HDC);
begin
  FCanvas.Handle := DC;
  try
    Painting;
  finally
    FCanvas.Handle := 0;
  end;
end;

procedure TftDesignerBotView.SetBitmap(Value: TBitmap);
begin
  FBitmap.Assign(Value);
  Invalidate;
end;

// procedure TftDesignerBotView.WMPaint(var Message: TWMPaint);
// begin
// PaintHandler(Message);
// end;

procedure Register;
begin
  RegisterComponents('fastTelega', [TftDesignerBotView]);
end;

end.
