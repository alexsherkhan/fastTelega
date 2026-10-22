unit fastTelega.ftDesignerBotController;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Types,
  Vcl.ImgList,
  Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftDesignerBotModel,
  fastTelega.ftDesignerBotView,
  fastTelega.ftCardController;

type
  // TftCardList = class(TList<ImsShape>)
  // public
  // function ShapeByPt(const aPoint: TPointF): ImsShape;
  // end; // TmsShapeList

  TftDesignerBotController = class(TftControllerBase)
  private
    [JSONMarshalled(True)]
    FModel: TftDesignerBotModel;
    [JSONMarshalled(False)]
    FView: TftDesignerBotView;
    [JSONMarshalled(True)]
    FStartCardController: TftStartCardController;
    FImages: TCustomImageList;
    procedure SetImages(const Value: TCustomImageList);

    // [JSONMarshalled(True)]
    // FShapeList: TmsShapeList;
    // [JSONMarshalled(False)]
    // FCurrentClass: RmsShape;
    // [JSONMarshalled(False)]
    // FCurrentAddedShape: ImsShape;
    // [JSONMarshalled(False)]
    // FMovingShape: TmsShape;
    // [JSONMarshalled(False)]
    // FCanvas: TCanvas;
    // [JSONMarshalled(False)]
    // FOrigin: TPointF;
    // FName: String;
    // procedure ClickSettings(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure ClickAddMenuItem(Sender: TObject);
    procedure ClickNew—ardCommand(Sender: TObject);
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;

  published
    property Images: TCustomImageList read FImages write SetImages;
  end;

implementation

{ TftDesignerBotController }

procedure TftDesignerBotController.ClickAddMenuItem(Sender: TObject);
begin

end;

procedure TftDesignerBotController.ClickNew—ardCommand(Sender: TObject);
begin

end;

constructor TftDesignerBotController.Create(AOwner: TComponent);
begin
  inherited;
  FModel := TftDesignerBotModel.Create;
  FView := TftDesignerBotView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
//  FView.DoubleBuffered := true;
  FStartCardController := TftStartCardController.Create(FView);

end;

destructor TftDesignerBotController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FStartCardController);
  FreeAndNil(FView);
  inherited;
end;

procedure TftDesignerBotController.LoadData;
begin
  inherited;

end;

procedure TftDesignerBotController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  inherited;

end;

procedure TftDesignerBotController.SetImages(const Value: TCustomImageList);
begin
  FImages := Value;
  FStartCardController.Images := Self.Images;
  FView.NewCardButton.Images := Self.Images;
  FView.NewCardButton.ImageName := 'id-card';
end;

procedure TftDesignerBotController.UpdateModel;
begin
  inherited;

end;

procedure TftDesignerBotController.UpdateView;
begin
  inherited;

end;

end.
