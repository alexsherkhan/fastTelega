unit fastTelega.ftCardSettingsMenuItemView;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  TftCardSettingsMenuItemView = class(TftViewBase)
  private
    FpnItemMenu: TPanel;
    FlbMove: TLabel;
    FedItemTest: TEdit;
    FbtWrap: TButton;
    FbtBegin: TButton;
    FbtBack: TButton;
    FbtItemSettings: TButton;
    FbtAddSmilies: TButton;
    FbtDel: TButton;
  protected
    procedure Paint; override;
    procedure SetEnabled(Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled write SetEnabled;
    property AutoSize;
    property PnItemMenu: TPanel read FpnItemMenu write FpnItemMenu;
    property LbMove: TLabel read FlbMove write FlbMove;
    property EdItemTest: TEdit read FedItemTest write FedItemTest;
    property BtBack: TButton read FbtBack write FbtBack;
    property BtWrap: TButton read FbtWrap write FbtWrap;
    property BtBegin: TButton read FbtBegin write FbtBegin;
    property BtItemSettings: TButton read FbtItemSettings write FbtItemSettings;
    property BtAddSmilies: TButton read FbtAddSmilies write FbtAddSmilies;
    property BtDel: TButton read FbtDel write FbtDel;
  end;

implementation

{ TftCardSettingsMenuItemView }

constructor TftCardSettingsMenuItemView.Create(AOwner: TComponent);
begin
  inherited;

  FlbMove := TLabel.Create(Self);
  FlbMove.Parent := Self;

  FedItemTest := TEdit.Create(Self);
  FedItemTest.Parent := Self;

  FpnItemMenu := TPanel.Create(Self);
  FpnItemMenu.Parent := Self;

  FbtWrap := TButton.Create(Self);
  FbtWrap.Parent := FpnItemMenu;

  FbtBegin := TButton.Create(Self);
  FbtBegin.Parent := FpnItemMenu;

  FbtBack := TButton.Create(Self);
  FbtBack.Parent := FpnItemMenu;

  FbtItemSettings := TButton.Create(Self);
  FbtItemSettings.Parent := FpnItemMenu;

  FbtAddSmilies := TButton.Create(Self);
  FbtAddSmilies.Parent := FpnItemMenu;

  FbtDel := TButton.Create(Self);
  FbtDel.Parent := FpnItemMenu;
end;

destructor TftCardSettingsMenuItemView.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsMenuItemView.Paint;
begin
  inherited;

end;

procedure TftCardSettingsMenuItemView.SetEnabled(Value: Boolean);
begin
  // inherited;
  Self.FlbMove.Enabled := Value;
  Self.FedItemTest.Enabled := Value;
end;

end.
