unit fastTelega.ftCardSettingsModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type

  TftCardSettingsModel = class(TftModelBase)
  private
    FID: Integer;
    FName: String;
    FVisible : Boolean;
    procedure SetID(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetVisible(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ID: Integer read FID write SetID;
    property Name: String read FName write SetName;
    property Visible: Boolean read FVisible write SetVisible;
  end;

implementation


{ TftCardSettingsModel }

constructor TftCardSettingsModel.Create;
begin

end;

destructor TftCardSettingsModel.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TftCardSettingsModel.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TftCardSettingsModel.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

end.
