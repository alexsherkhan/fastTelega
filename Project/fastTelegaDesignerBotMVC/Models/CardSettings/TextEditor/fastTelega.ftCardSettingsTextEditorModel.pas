unit fastTelega.ftCardSettingsTextEditorModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type

  TftCardSettingsTextEditorModel = class(TftModelBase)
  private
    FID: Integer;
    FLines: TStringList;
    procedure SetID(const Value: Integer);
    procedure SetLines(const Value: TStringList);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ID: Integer read FID write SetID;
    property Lines: TStringList read FLines write SetLines;
  end;

implementation

{ TftCardSettingsTextEditorModel }

constructor TftCardSettingsTextEditorModel.Create;
begin
  FLines := TStringList.Create;
end;

destructor TftCardSettingsTextEditorModel.Destroy;
begin
  FreeAndNil(FLines);
  inherited;
end;

procedure TftCardSettingsTextEditorModel.SetID(const Value: Integer);
begin
  if Value <> FID then
    FID := Value;
end;

procedure TftCardSettingsTextEditorModel.SetLines(const Value: TStringList);
begin
  if Value <> FLines then
    FLines.Assign(Value);
end;

end.
