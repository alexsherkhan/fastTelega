unit fastTelega.ftCardSettingsMenuView;

interface

uses
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  TftCardSettingsMenuView = class(TftViewBase)
  private
    FgbCardSettingsMenu: TGroupBox;
    FpnItems: TPanel;
    FbtAddItem: TButton;
    FcbIsStartNumberingFromScratch: TCheckBox;
    FbtSettingsKeybord: TButton;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoSize;
    property GbCardSettingsMenu: TGroupBox read FgbCardSettingsMenu
      write FgbCardSettingsMenu;
    property PnItems : TPanel  read FpnItems
      write FpnItems;
    property BtAddItem: TButton read FbtAddItem write FbtAddItem;
    property CbIsStartNumberingFromScratch: TCheckBox
      read FcbIsStartNumberingFromScratch write FcbIsStartNumberingFromScratch;
    property BtSettingsKeybord: TButton read FbtSettingsKeybord
      write FbtSettingsKeybord;
  end;

implementation

{ TftCardSettingsMenuView }

constructor TftCardSettingsMenuView.Create(AOwner: TComponent);
begin
  inherited;
  FgbCardSettingsMenu := TGroupBox.Create(Self);
  FgbCardSettingsMenu.Parent := Self;

  FpnItems := TPanel.Create(Self);
  FpnItems.Parent := FgbCardSettingsMenu;

  FbtAddItem := TButton.Create(Self);
  FbtAddItem.Parent := FgbCardSettingsMenu;

  FcbIsStartNumberingFromScratch := TCheckBox.Create(Self);
  FcbIsStartNumberingFromScratch.Parent := FgbCardSettingsMenu;

  FbtSettingsKeybord := TButton.Create(Self);
  FbtSettingsKeybord.Parent := FgbCardSettingsMenu;

end;

destructor TftCardSettingsMenuView.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsMenuView.Paint;
begin
  inherited;

end;

end.
