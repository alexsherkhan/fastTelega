unit fastTelega.ftDesignerBotModel;

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,

  fastTelega.ftModelBase,
  fastTelega.ftCardSettingsInfoModel,
  fastTelega.ftCardSettingsAdditionalModel,
  fastTelega.ftCardSettingsMenuModel,
  fastTelega.ftCardSettingsMessageTextModel;

type

  TftDesignerBotModel = class(TftModelBase)
  private
    FID: Integer;
    FTitle: String;
    FNameCand: String;
    FPreviousCardCommand: TObject;
    FCardSettingsInfoModel: TftCardSettingsInfoModel;

    procedure SetPreviousCardCommand(const Value: TObject);
    procedure SetTitle(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetNameCand(const Value: String);
    procedure SetCardSettingsInfoModel(const Value: TftCardSettingsInfoModel);
  protected

  public
    constructor Create; virtual;
    destructor Destroy; override;
  published
    property ID: Integer read FID write SetID;
    property Title: String read FTitle write SetTitle;
    property NameCand: String read FNameCand write SetNameCand;
    property PreviousCardCommand: TObject read FPreviousCardCommand
      write SetPreviousCardCommand;
    property CardSettingsInfoModel: TftCardSettingsInfoModel
      read FCardSettingsInfoModel write SetCardSettingsInfoModel;
  end;


implementation

{ TftDesignerBotModel }

constructor TftDesignerBotModel.Create;
begin
  FCardSettingsInfoModel := TftCardSettingsInfoModel.Create;
end;

destructor TftDesignerBotModel.Destroy;
begin
  FreeAndNil(FCardSettingsInfoModel);
  inherited;
end;

procedure TftDesignerBotModel.SetCardSettingsInfoModel
  (const Value: TftCardSettingsInfoModel);
begin
  FCardSettingsInfoModel := Value;
end;

procedure TftDesignerBotModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TftDesignerBotModel.SetNameCand(const Value: String);
begin
  FNameCand := Value;
end;

procedure TftDesignerBotModel.SetPreviousCardCommand(const Value: TObject);
begin
  FPreviousCardCommand := Value;
end;

procedure TftDesignerBotModel.SetTitle(const Value: String);
begin
  FTitle := Value;
end;


end.
