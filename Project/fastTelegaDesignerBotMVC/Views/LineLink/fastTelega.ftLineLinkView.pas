unit fastTelega.ftLineLinkView;

interface

uses
  {System}
  System.Types,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,

  fastTelega.ftViewBase;

type

  TftLineLinkView = class(TftGraphicViewBase)
  private
    { Private declarations }
    FUpDown: Boolean;
    FPen: TPen;
    FStartPoint: TPoint;
    FEndPoint: TPoint;
    procedure SetPen(Value: TPen);
    procedure SetEndPoint(const Value: TPoint);
    procedure SetStartPoint(const Value: TPoint);
    function GetColor: TColor;
    procedure SetColor(const Value: TColor);
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property UpDown: Boolean read FUpDown write FUpDown;
    property Pen: TPen read FPen write SetPen;
    property Height default 33;
    property Width default 33;
    property StartPoint: TPoint read FStartPoint write SetStartPoint;
    property EndPoint: TPoint read FEndPoint write SetEndPoint;
    procedure StyleChanged(Sender: TObject);
    property Color: TColor read GetColor write SetColor;
  end;

implementation

{ TftLineLinkView }

constructor TftLineLinkView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Hint := 'LineLink';

  FPen := TPen.Create;
  FPen.OnChange := StyleChanged;
  if csOpaque in ControlStyle then
    ControlStyle := ControlStyle - [csOpaque];
  FPen.Width := 6;

  Height := Abs(FEndPoint.Y - FStartPoint.Y) + FPen.Width;
  Width := Abs(FEndPoint.X - FStartPoint.X) + FPen.Width;
end;

destructor TftLineLinkView.Destroy;
begin
  FPen.Free;
  inherited Destroy;
end;

function TftLineLinkView.GetColor: TColor;
begin
  Result := FPen.Color;
end;

procedure TftLineLinkView.Paint;
var
  LPolyBezier: array [1 .. 3] of TPoint;
begin

    Canvas.Pen := FPen;
    Self.Width := Abs(FEndPoint.X - FStartPoint.X) + Canvas.Pen.Width;
    Self.Height := Abs(FEndPoint.Y - FStartPoint.Y) + Canvas.Pen.Width;

    if FStartPoint.X < FEndPoint.X then
    begin
      LPolyBezier[3].X := Self.Width;

      if FStartPoint.Y < FEndPoint.Y then
      begin
        Self.Left := FStartPoint.X;
        Self.Top := FStartPoint.Y;
        Canvas.MoveTo(0, Canvas.Pen.Width div 2);
        LPolyBezier[1].X := Self.Width div 2;
        LPolyBezier[1].Y := Canvas.Pen.Width div 2;

        if FUpDown then
        begin
          LPolyBezier[2].X := Self.Width;
          LPolyBezier[2].Y := Canvas.Pen.Width div 2;
          LPolyBezier[3].X := LPolyBezier[3].X - Canvas.Pen.Width;
          LPolyBezier[3].Y := Self.Height;
        end
        else
        begin
          LPolyBezier[2].X := Self.Width - Self.Width div 2;
          LPolyBezier[2].Y := Self.Height - Canvas.Pen.Width div 2;
          LPolyBezier[3].Y := Self.Height - Canvas.Pen.Width;
        end;
      end
      else
      begin
        Self.Left := FStartPoint.X;
        Self.Top := FEndPoint.Y;
        Canvas.MoveTo(0, Self.Height - Canvas.Pen.Width);
        LPolyBezier[1].X := Self.Width div 2;
        LPolyBezier[1].Y := Self.Height;

        if FUpDown then
        begin
          LPolyBezier[2].X := Self.Width;
          LPolyBezier[2].Y := Self.Height div 2;
          LPolyBezier[3].X := LPolyBezier[3].X - Canvas.Pen.Width;
          LPolyBezier[3].Y := 0;
        end
        else
        begin
          LPolyBezier[2].X := Self.Width - Self.Width div 2;
          LPolyBezier[2].Y := Canvas.Pen.Width div 2;
          LPolyBezier[3].Y := Canvas.Pen.Width;
        end;
      end;
    end
    else
    begin
      LPolyBezier[3].X := 0;

      if FStartPoint.Y < FEndPoint.Y then
      begin
        Self.Left := FEndPoint.X;
        Self.Top := FStartPoint.Y;
        Canvas.MoveTo(Self.Width, Canvas.Pen.Width);
        LPolyBezier[1].X := Self.Width - Self.Width div 2;
        LPolyBezier[1].Y := Canvas.Pen.Width div 2;

        if FUpDown then
        begin
          LPolyBezier[2].X := 0;
          LPolyBezier[2].Y := Canvas.Pen.Width div 2;
          LPolyBezier[3].X := LPolyBezier[3].X + Canvas.Pen.Width;
          LPolyBezier[3].Y := Self.Height;
        end
        else
        begin
          LPolyBezier[2].X := Self.Width div 2;
          LPolyBezier[2].Y := Self.Height - Canvas.Pen.Width div 2;
          LPolyBezier[3].Y := Self.Height - Canvas.Pen.Width;
        end;
      end
      else
      begin
        Self.Left := FEndPoint.X;
        Self.Top := FEndPoint.Y;
        Canvas.MoveTo(Self.Width, Self.Height - Canvas.Pen.Width);
        LPolyBezier[1].X := Self.Width - Self.Width div 2;
        LPolyBezier[1].Y := Self.Height - Canvas.Pen.Width div 2;

        if FUpDown then
        begin
          LPolyBezier[2].X := 0;
          LPolyBezier[2].Y := Self.Height div 2;
          LPolyBezier[3].X := LPolyBezier[3].X + Canvas.Pen.Width;
          LPolyBezier[3].Y := 0;
        end
        else
        begin
          LPolyBezier[2].X := Self.Width div 2;
          LPolyBezier[2].Y := Canvas.Pen.Width div 2;
          LPolyBezier[3].Y := Canvas.Pen.Width;
        end;

      end;
    end;

    if (Self.Width = Canvas.Pen.Width) then
    begin
      Canvas.MoveTo(Canvas.Pen.Width div 2, 0);
      Canvas.LineTo(Canvas.Pen.Width div 2, Self.Height);
    end
    else if (Self.Height = Canvas.Pen.Width) then
    begin
      Canvas.MoveTo(0, Canvas.Pen.Width div 2);
      Canvas.LineTo(Self.Width, Canvas.Pen.Width div 2);
    end
    else
      Canvas.PolyBezierTo(LPolyBezier);
end;

procedure TftLineLinkView.SetColor(const Value: TColor);
begin
  FPen.Color := Value;
end;

procedure TftLineLinkView.SetEndPoint(const Value: TPoint);
begin
  if FEndPoint <> Value then
  begin
    FEndPoint := Value;
    Invalidate;
  end;
end;

procedure TftLineLinkView.SetPen(Value: TPen);
begin
  FPen.Assign(Value);
end;

procedure TftLineLinkView.SetStartPoint(const Value: TPoint);
begin
  if FStartPoint <> Value then
  begin
    FStartPoint := Value;
    Invalidate;
  end;
end;

procedure TftLineLinkView.StyleChanged(Sender: TObject);
begin
  Invalidate;
end;

end.
