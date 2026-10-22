unit fastTelega.ftCardSettingsInfoController;

interface

uses
  System.Classes, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsInfoModel,
  fastTelega.ftCardSettingsInfoView;

type
  TftCardSettingsInfoController = class(TftControllerBase)
  private
    FModel: TftCardSettingsInfoModel;
    FView: TftCardSettingsInfoView;
    FParentSettingsController: TftControllerBase;

    function GetID: Integer;
    function GetName: String;
    procedure SetID(const Value: Integer);
    procedure SetName(const Value: String);
    procedure EdNameOnChange(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;

    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published
    property ID: Integer read GetID write SetID;
    property Name: String read GetName write SetName;
    property ParentSettingsController: TftControllerBase
      read FParentSettingsController write FParentSettingsController;
  end;

implementation

uses
  System.SysUtils, System.UITypes;

{ TftCardSettingsInfoController }

constructor TftCardSettingsInfoController.Create(AOwner: TComponent);
begin
  FModel := TftCardSettingsInfoModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FView := TftCardSettingsInfoView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Align := alTop;
  FView.Height := 80;
  FView.AutoSize := True;

  FView.gbCardInfo.Align := alClient;
  FView.gbCardInfo.Caption := 'Карточка';
  FView.gbCardInfo.HeaderFont.Style := [TFontStyle.fsBold];
  FView.lbName.Align := alTop;
  FView.lbName.AutoSize := True;
  FView.lbName.Caption := 'Имя карточки';

  FView.edName.Align := alTop;
  FView.edName.AutoSize := True;
  FView.edName.OnChange := EdNameOnChange;

  FView.lbID.Align := alBottom;
  FView.lbID.Alignment := taCenter;
  FView.lbID.AutoSize := True;
  FView.lbID.Caption := 'ID 00';

  LoadData;
  UpdateView;
end;

destructor TftCardSettingsInfoController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

procedure TftCardSettingsInfoController.EdNameOnChange(Sender: TObject);
begin
  UpdateModel;
end;

function TftCardSettingsInfoController.GetID: Integer;
begin
  Result := FModel.ID;
end;

function TftCardSettingsInfoController.GetName: String;
begin
  Result := FModel.Name;
end;

procedure TftCardSettingsInfoController.LoadData;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
  FModel.ID := 11;
  FModel.Name := 'Имя карточки';
end;

procedure TftCardSettingsInfoController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsInfoController.SetID(const Value: Integer);
begin
  FModel.ID := Value;
  UpdateView;
end;

procedure TftCardSettingsInfoController.SetName(const Value: String);
begin
  FModel.Name := Value;
  UpdateView;
end;

procedure TftCardSettingsInfoController.UpdateModel;
begin
  FModel.Name := FView.edName.Text;
  FModel.BoundsRect := FView.BoundsRect;
  if Assigned(FParentSettingsController) then
    FParentSettingsController.Update;
end;

procedure TftCardSettingsInfoController.UpdateView;
begin

  FView.lbID.Caption := 'ID ' + IntToStr(FModel.ID);
  FView.edName.Text := FModel.Name;

  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
