unit fastTelega.ftCardSettingsMessageTextModel;

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,
  fastTelega.ftModelBase;

type

  TftCardSettingsMessageTextModel = class(TftModelBase)
  private
    FID: Integer;
    FName: String;
    FLines: TStringList;

    procedure SetID(const Value: Integer);
    procedure SetLines(const Value: TStringList);
    procedure SetName(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ID: Integer read FID write SetID;
    property Name: String read FName write SetName;
    property Lines: TStringList read FLines write SetLines;
  end;

implementation

{ TftCardSettingsMessageTextModel }

constructor TftCardSettingsMessageTextModel.Create;
begin
  FLines := TStringList.Create;
end;

destructor TftCardSettingsMessageTextModel.Destroy;
begin
  FreeAndNil(FLines);
  inherited;
end;

procedure TftCardSettingsMessageTextModel.SetID(const Value: Integer);
begin
  if Value <> FID then
    FID := Value;
end;

procedure TftCardSettingsMessageTextModel.SetLines(const Value: TStringList);
begin
  if Value <> FLines then
    FLines.Assign(Value);
end;

procedure TftCardSettingsMessageTextModel.SetName(const Value: String);
begin
  if Value <> FName then
    FName := Value;
end;

end.
