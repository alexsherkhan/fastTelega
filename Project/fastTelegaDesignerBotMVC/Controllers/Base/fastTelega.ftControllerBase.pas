unit fastTelega.ftControllerBase;

interface

uses
  System.Classes,
  Vcl.ImgList,
  Vcl.Controls,
  fastTelega.ftModelBase,
  fastTelega.ftViewBase;

type
  IftController = interface
    ['{7788884D-3504-4BBE-BCBA-C1154DC47E74}']
    procedure UpdateModel;
    procedure UpdateView;
    procedure LoadData;
    procedure NotifyFromModel(Sender: TObject; AEvent: String);
  end;

type
  TftControllerBase = class(TInterfacedObject, IftController)
  private
    FModel: TftModelBase;
    FView: TftViewBase;
    FImages: TCustomImageList;
    procedure SetImages(const Value: TCustomImageList);
  public
    constructor Create(AOwner: TComponent); virtual;
    destructor Destroy; override;
    procedure UpdateModel; virtual;
    procedure UpdateView; virtual;
    procedure LoadData; virtual;
    procedure Update; virtual;
    procedure NotifyFromModel(Sender: TObject; AEvent: String); virtual;
  published
    property Images: TCustomImageList read FImages write SetImages;
  end;

implementation

{ TftControllerBase }

constructor TftControllerBase.Create(AOwner: TComponent);
begin
  FModel := TftModelBase.Create;
  FView := TftViewBase.Create(AOwner);
end;

destructor TftControllerBase.Destroy;
begin

  inherited;
end;

procedure TftControllerBase.LoadData;
begin

end;

procedure TftControllerBase.NotifyFromModel(Sender: TObject; AEvent: String);
begin

end;

procedure TftControllerBase.SetImages(const Value: TCustomImageList);
begin
  FImages := Value;
end;

procedure TftControllerBase.Update;
begin

end;

procedure TftControllerBase.UpdateModel;
begin

end;

procedure TftControllerBase.UpdateView;
begin

end;

end.
