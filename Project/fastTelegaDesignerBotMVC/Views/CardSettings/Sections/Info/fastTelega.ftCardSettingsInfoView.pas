unit fastTelega.ftCardSettingsInfoView;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  TftCardSettingsInfoView = class(TftViewBase)
  private
    FgbCardInfo: TGroupBox;
    FlbName: TLabel;
    FedName: TEdit;
    FlbID: TLabel;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoSize;
    property GbCardInfo: TGroupBox read FgbCardInfo write FgbCardInfo;
    property LbName: TLabel read FlbName write FlbName;
    property EdName: TEdit read FedName write FedName;
    property LbID: TLabel read FlbID write FlbID;
  end;

implementation

{ TftCardSettingsInfoView }

constructor TftCardSettingsInfoView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FgbCardInfo := TGroupBox.Create(Self);
  FgbCardInfo.Parent := Self;

  FlbName := TLabel.Create(FgbCardInfo);
  FlbName.Parent := FgbCardInfo;

  FedName := TEdit.Create(FgbCardInfo);
  FedName.Parent := FgbCardInfo;

  FlbID := TLabel.Create(FgbCardInfo);
  FlbID.Parent := FgbCardInfo;
end;

destructor TftCardSettingsInfoView.Destroy;
begin
//  FreeAndNil(FgbCardInfo);
//  FreeAndNil(FlbName);
//  FreeAndNil(FedName);
//  FreeAndNil(FlbID);
  inherited;
end;

procedure TftCardSettingsInfoView.Paint;
begin
  inherited;

end;

end.
