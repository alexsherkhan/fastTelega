unit fastTelega.ftCardSettingsInfoModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type

  TftCardSettingsInfoModel = class(TftModelBase)
  private
    FID: Integer;
    FName: String;
    procedure SetID(const Value: Integer);
    procedure SetName(const Value: String);

  public
    constructor Create;
    destructor Destroy; override;
  published
    property ID: Integer read FID write SetID;
    property Name: String read FName write SetName;
  end;

implementation

{ TftCardSettingsInfoModel }

constructor TftCardSettingsInfoModel.Create;
begin

end;

destructor TftCardSettingsInfoModel.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsInfoModel.SetID(const Value: Integer);
begin
  if Value <> FID then
    FID := Value;
end;

procedure TftCardSettingsInfoModel.SetName(const Value: String);
begin
  if Value <> FName then
    FName := Value;
end;

end.
