unit fastTelega.ftCardSettingsController;

interface

uses
  System.Classes, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsModel,
  fastTelega.ftCardSettingsView,
  fastTelega.ftCardSettingsMessageTextController,
  fastTelega.ftCardSettingsInfoController,
  fastTelega.ftCardSettingsAdditionalController,
  fastTelega.ftCardSettingsMenuController;

type
  TftCardSettingsControllerBase = class(TftControllerBase)
  private
    FModel: TftCardSettingsModel;
    FView: TftCardSettingsView;
    FCardController: TftControllerBase;

    FCardSettingsInfoController: TftCardSettingsInfoController;

    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
    function GetID: Integer;
    function GetName: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;

    procedure ButtonCloseClick(Sender: TObject);
    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
    procedure Update; override;
  published
    property Visible: Boolean read GetVisible write SetVisible;
    property CardController: TftControllerBase read FCardController
      write FCardController;
    property ID: Integer read GetID;
    property Name: String read GetName;
  end;

  TftStartCardSettingsController = class(TftCardSettingsControllerBase)
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
  published
    property Visible;
  end;

  TftSimpleMessageCardSettingsController = class(TftCardSettingsControllerBase)
  private
    FModel: TftCardSettingsModel;

    FCardSettingsAdditionalController: TftCardSettingsAdditionalController;
    FCardSettingsMenuController: TftCardSettingsMenuController;
    FCardSettingsMessageTextController: TftCardSettingsMessageTextController;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;
    procedure Update; override;
  published
    property Visible;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TftCardSettingsControllerBase }

procedure TftCardSettingsControllerBase.ButtonCloseClick(Sender: TObject);
begin
  Visible := False;
  UpdateView;
end;

constructor TftCardSettingsControllerBase.Create(AOwner: TComponent);
begin

  FModel := TftCardSettingsModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;
  FView := TftCardSettingsView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Visible := False;
  FView.Width := 350;
  FView.Align := alRight;
  FView.ParentBackground := False;
  FView.BevelOuter := bvNone;
  FView.Padding.Left := 10;
  FView.Padding.Right := 10;
  FView.Padding.Bottom := 10;
  FView.Padding.Top := 10;

  FView.ButtonClose.OnClick := ButtonCloseClick;
  FView.ButtonClose.Caption := 'Закрыть';
  FView.ButtonClose.Top := 0;
  FView.ButtonClose.Align := alTop;

  FView.lbTitle.Caption := 'Простое сообщение';
  FView.lbTitle.Top := 1;
  FView.lbTitle.Align := alTop;

  FCardSettingsInfoController := TftCardSettingsInfoController.Create(FView);
  FCardSettingsInfoController.ParentSettingsController := Self;

  LoadData;
  UpdateView;
end;

destructor TftCardSettingsControllerBase.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

function TftCardSettingsControllerBase.GetID: Integer;
begin
  Result := FCardSettingsInfoController.ID;
end;

function TftCardSettingsControllerBase.GetName: String;
begin
  Result := FCardSettingsInfoController.Name;
end;

function TftCardSettingsControllerBase.GetVisible: Boolean;
begin
  Result := FModel.Visible;
end;

procedure TftCardSettingsControllerBase.LoadData;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
end;

procedure TftCardSettingsControllerBase.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsControllerBase.SetVisible(const Value: Boolean);
begin
  FModel.Visible := Value;
  UpdateView;
end;

procedure TftCardSettingsControllerBase.Update;
begin
  inherited;
  if Assigned(FCardController) then
    FCardController.Update;
end;

procedure TftCardSettingsControllerBase.UpdateModel;
begin
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardSettingsControllerBase.UpdateView;
begin
  FView.Visible := FModel.Visible;
  // FView.BoundsRect := FModel.BoundsRect;
end;

{ TftStartCardSettingsController }

constructor TftStartCardSettingsController.Create(AOwner: TComponent);
begin

  inherited;

end;

destructor TftStartCardSettingsController.Destroy;
begin

  inherited;
end;

procedure TftStartCardSettingsController.LoadData;
begin
  inherited;

end;

procedure TftStartCardSettingsController.UpdateModel;
begin
  inherited;

end;

procedure TftStartCardSettingsController.UpdateView;
begin
  inherited;

end;

{ TftSimpleMessageCardSettingsController }

constructor TftSimpleMessageCardSettingsController.Create(AOwner: TComponent);
begin
  inherited;
  FCardSettingsMenuController := TftCardSettingsMenuController.Create(FView);
  FCardSettingsAdditionalController :=
    TftCardSettingsAdditionalController.Create(FView);
  FCardSettingsMessageTextController :=
    TftCardSettingsMessageTextController.Create(FView);
end;

destructor TftSimpleMessageCardSettingsController.Destroy;
begin

  inherited;
end;

procedure TftSimpleMessageCardSettingsController.LoadData;
begin
  inherited;

end;

procedure TftSimpleMessageCardSettingsController.Update;
begin
  inherited;
  if Assigned(FCardController) then
    FCardController.Update;
end;

procedure TftSimpleMessageCardSettingsController.UpdateModel;
begin
  inherited;

end;

procedure TftSimpleMessageCardSettingsController.UpdateView;
begin
  inherited;

end;

end.
