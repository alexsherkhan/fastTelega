unit fastTelega.ftPlotGrid;

interface

uses
  {System}
  System.SysUtils,
  System.Classes,

  {Vcl}
  Vcl.Graphics,
  Vcl.Controls,

  {fastTelega}
  fastTelega.ftViewBase;

type

  { TPlotGrid }

  TftPlotGrid = class(TCustomControl)
  private
    FMarks: Single;
    FFrequency: Single;
    FLineFill: TPen;
    procedure SetFrequency(const Value: Single);
    procedure SetMarks(const Value: Single);
    procedure SetLineFill(const Value: TPen);
    procedure LineFillChanged(Sender: TObject);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Frequency: Single read FFrequency write SetFrequency;
    property LineFill: TPen read FLineFill write SetLineFill;
    property Marks: Single read FMarks write SetMarks;

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
  end;

implementation

uses
  Winapi.Windows;

{ TftPlotGrid }

constructor TftPlotGrid.Create(AOwner: TComponent);
begin
  inherited;
  FLineFill := TPen.Create;
  FLineFill.Color := clBlack;
  FLineFill.Style := psSolid;
  // FLineFill.OnChanged := LineFillChanged;
  FMarks := 25;
  FFrequency := 5;
  // SetAcceptsControls(False);
end;

destructor TftPlotGrid.Destroy;
begin
  FreeAndNil(FLineFill);
  inherited;
end;

procedure TftPlotGrid.LineFillChanged(Sender: TObject);
begin
  Repaint;
end;

procedure TftPlotGrid.Paint;
  procedure DrawLine(ACanvas: TCanvas; const APt1, APt2: TPoint);
  begin
    ACanvas.MoveTo(APt1.X, APt1.Y);
    ACanvas.LineTo(APt2.X, APt2.Y);
  end;
  function LighterColor(AColor: TColor; APercent: Byte): TColor;
  var
    R, G, B: Byte;
  begin
    AColor := ColorToRGB(AColor);
    R := GetRValue(AColor);
    G := GetGValue(AColor);
    B := GetBValue(AColor);
    R := R + muldiv(255 - R, APercent, 100);
    G := G + muldiv(255 - G, APercent, 100);
    B := B + muldiv(255 - B, APercent, 100);
    Result := RGB(R, G, B);
  end;

var
  X, Y, DivWidth, DivHeight: Integer;
begin
  inherited;
  X := 0;
  Y := 0;
  Canvas.Pen.Assign(FLineFill);
  DivWidth := Width div 2;
  while X < DivWidth do
  begin
    if (X = 0) then
    begin
      Canvas.Pen.Width := 2;
      Canvas.Pen.Color := FLineFill.Color
    end
    else
    begin
      if (frac(X) = 0) and (frac(X / Frequency / Marks) = 0) then
        Canvas.Pen.Color := FLineFill.Color
      else
        Canvas.Pen.Color := LighterColor(FLineFill.Color, 40);
      Canvas.Pen.Width := 1;
    end;

    DrawLine(Canvas, Point(round(Width div 2) + X + (Canvas.Pen.Width div 2),
      0), Point(round(Width div 2) + X + (Canvas.Pen.Width div 2), Height));
    if not(X = 0) then
      DrawLine(Canvas, Point(round(Width div 2) - X + (Canvas.Pen.Width div 2),
        0), Point(round(Width div 2) - X + (Canvas.Pen.Width div 2), Height));
    X := round(X + FFrequency);
  end;
  DivHeight := Height div 2;
  while Y < DivHeight do
  begin
    if (Y = 0) then
    begin
      Canvas.Pen.Width := 2;
      Canvas.Pen.Color := FLineFill.Color
    end
    else
    begin
      if (frac(Y) = 0) and (frac(Y / Frequency / Marks) = 0) then
        Canvas.Pen.Color := FLineFill.Color
      else
        Canvas.Pen.Color := LighterColor(FLineFill.Color, 40);
      Canvas.Pen.Width := 1;
    end;

    DrawLine(Canvas, Point(0, round(Height div 2) + Y + (Canvas.Pen.Width div 2)
      ), Point(Width, round(Height div 2) + Y + (Canvas.Pen.Width div 2)));
    if not(Y = 0) then
      DrawLine(Canvas, Point(0, round(Height div 2) - Y +
        (Canvas.Pen.Width div 2)),
        Point(Width, round(Height div 2) - Y + (Canvas.Pen.Width div 2)));
    Y := round(Y + FFrequency);
  end;
end;

procedure TftPlotGrid.SetFrequency(const Value: Single);
begin
  if FFrequency <> Value then
  begin
    FFrequency := Value;
    if FFrequency < 0.05 then
      FFrequency := 0.05;
    Repaint;
  end;
end;

procedure TftPlotGrid.SetLineFill(const Value: TPen);
begin
  FLineFill.Assign(Value);
end;

procedure TftPlotGrid.SetMarks(const Value: Single);
begin
  if FMarks <> Value then
  begin
    FMarks := Value;
    if FMarks < FFrequency then
      FMarks := FFrequency;
    if FMarks < 0.05 then
      FMarks := 0.05;
    Repaint;
  end;
end;

procedure Register;
begin
  RegisterComponents('fastTelega Controls', [TftPlotGrid]);
end;

end.
