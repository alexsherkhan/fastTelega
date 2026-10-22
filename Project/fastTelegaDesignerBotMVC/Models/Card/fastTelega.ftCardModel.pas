unit fastTelega.ftCardModel;

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

  TftCardCommandBaseModel = class(TftModelBase)
  private
    FID: Integer;
    FTitle: String;
    FNameCand: String;

    FMenuLinkList: TList;
    FHighlightingDrop: Boolean;
    FHoldMouseDown: Boolean;
    FMousePoint: TPoint;

    FPreviousCardCommand: TObject;
    FCardSettingsInfoModel: TftCardSettingsInfoModel;

    procedure SetPreviousCardCommand(const Value: TObject);
    procedure SetTitle(const Value: String);
    procedure SetID(const Value: Integer);
    procedure SetNameCand(const Value: String);
    procedure SetCardSettingsInfoModel(const Value: TftCardSettingsInfoModel);
    procedure SetHighlightingDrop(const Value: Boolean);
    procedure SetMenuLinkList(const Value: TList);
    procedure SetHoldMouseDown(const Value: Boolean);
    procedure SetMousePoint(const Value: TPoint);
  protected

  public
    constructor Create; virtual;
    destructor Destroy; override;
  published
    property ID: Integer read FID write SetID;
    property Title: String read FTitle write SetTitle;
    property NameCand: String read FNameCand write SetNameCand;

    property MenuLinkList: TList read FMenuLinkList write SetMenuLinkList;
    property HighlightingDrop: Boolean read FHighlightingDrop
      write SetHighlightingDrop;
    property HoldMouseDown: Boolean read FHoldMouseDown write SetHoldMouseDown;
    property MousePoint: TPoint read FMousePoint write SetMousePoint;

    property Origin;
    property PreviousCardCommand: TObject read FPreviousCardCommand
      write SetPreviousCardCommand;
    property CardSettingsInfoModel: TftCardSettingsInfoModel
      read FCardSettingsInfoModel write SetCardSettingsInfoModel;
  end;

  TftStartCardCommandModel = class(TftCardCommandBaseModel)
  private

  protected

  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ID;
    property Title;
    property PreviousCardCommand;
    property CardSettingsInfoModel;
  end;

  TftSimpleMessageCardCommandModel = class(TftCardCommandBaseModel)
  private
    FCardSettingsAdditionalModel: TftCardSettingsAdditionalModel;
    FCardSettingsMenuModel: TftCardSettingsMenuModel;
    FCardSettingsMessageTextModel: TftCardSettingsMessageTextModel;
    procedure SetCardSettingsAdditionalModel(const Value
      : TftCardSettingsAdditionalModel);
    procedure SetCardSettingsMenuModel(const Value: TftCardSettingsMenuModel);
    procedure SetCardSettingsMessageTextModel(const Value
      : TftCardSettingsMessageTextModel);
  protected

  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ID;
    property Title;
    property NameCand;
    property PreviousCardCommand;
    property CardSettingsInfoModel;
    property CardSettingsAdditionalModel: TftCardSettingsAdditionalModel
      read FCardSettingsAdditionalModel write SetCardSettingsAdditionalModel;
    property CardSettingsMenuModel: TftCardSettingsMenuModel
      read FCardSettingsMenuModel write SetCardSettingsMenuModel;
    property CardSettingsMessageTextModel: TftCardSettingsMessageTextModel
      read FCardSettingsMessageTextModel write SetCardSettingsMessageTextModel;
  end;

  TftMessageChainCardCommandModel = class(TftCardCommandBaseModel)
  private

  protected

  public

  published
    property ID;
    property Title;
    property NameCand;
    property PreviousCardCommand;
    property CardSettingsInfoModel;
  end;

implementation

{ TftCardCommandBaseModel }

constructor TftCardCommandBaseModel.Create;
begin
  FCardSettingsInfoModel := TftCardSettingsInfoModel.Create;
  FMenuLinkList := TList.Create;
end;

destructor TftCardCommandBaseModel.Destroy;
begin
  FreeAndNil(FCardSettingsInfoModel);
  FreeAndNil(FMenuLinkList);
  inherited;
end;

procedure TftCardCommandBaseModel.SetCardSettingsInfoModel
  (const Value: TftCardSettingsInfoModel);
begin
  FCardSettingsInfoModel := Value;
end;

procedure TftCardCommandBaseModel.SetHighlightingDrop(const Value: Boolean);
begin
  FHighlightingDrop := Value;
end;

procedure TftCardCommandBaseModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TftCardCommandBaseModel.SetMenuLinkList(const Value: TList);
begin
  FMenuLinkList.Assign(Value);
end;

procedure TftCardCommandBaseModel.SetHoldMouseDown(const Value: Boolean);
begin
  FHoldMouseDown := Value;
end;

procedure TftCardCommandBaseModel.SetMousePoint(const Value: TPoint);
begin
  FMousePoint := Value;
end;

procedure TftCardCommandBaseModel.SetNameCand(const Value: String);
begin
  FNameCand := Value;
end;

procedure TftCardCommandBaseModel.SetPreviousCardCommand(const Value: TObject);
begin
  FPreviousCardCommand := Value;
end;

procedure TftCardCommandBaseModel.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

{ TftStartCardCommandModel }

constructor TftStartCardCommandModel.Create;
begin
  inherited;
end;

destructor TftStartCardCommandModel.Destroy;
begin

  inherited;
end;

{ TftSimpleMessageCardCommandModel }

constructor TftSimpleMessageCardCommandModel.Create;
begin
  inherited;
  FCardSettingsAdditionalModel := TftCardSettingsAdditionalModel.Create;
  FCardSettingsMenuModel := TftCardSettingsMenuModel.Create;
  FCardSettingsMessageTextModel := TftCardSettingsMessageTextModel.Create;
end;

destructor TftSimpleMessageCardCommandModel.Destroy;
begin
  FreeAndNil(FCardSettingsAdditionalModel);
  FreeAndNil(FCardSettingsMenuModel);
  FreeAndNil(FCardSettingsMessageTextModel);
  inherited;
end;

procedure TftSimpleMessageCardCommandModel.SetCardSettingsAdditionalModel
  (const Value: TftCardSettingsAdditionalModel);
begin
  FCardSettingsAdditionalModel := Value;
end;

procedure TftSimpleMessageCardCommandModel.SetCardSettingsMenuModel
  (const Value: TftCardSettingsMenuModel);
begin
  FCardSettingsMenuModel := Value;
end;

procedure TftSimpleMessageCardCommandModel.SetCardSettingsMessageTextModel
  (const Value: TftCardSettingsMessageTextModel);
begin
  FCardSettingsMessageTextModel := Value;
end;

end.
