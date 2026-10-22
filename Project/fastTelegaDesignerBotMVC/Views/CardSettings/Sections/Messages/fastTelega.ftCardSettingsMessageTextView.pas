unit fastTelega.ftCardSettingsMessageTextView;

interface

uses
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase, Vcl.ButtonGroup;

type
  TftCardSettingsMessageTextView = class(TftViewBase)
  private
    FgbCardSettingsMessageText: TGroupBox;
    FplPresets: TPanel;
    FplPresetsRow1: TPanel;
    FplPresetsRow2: TPanel;
    FplPresetsRow3: TPanel;
    FbtPresets1: TButton;
    FbtPresets2: TButton;
    FbtPresets3: TButton;
    FbtPresets4: TButton;
    FbtPresets5: TButton;
    FbtPresets6: TButton;
    FbtPresets7: TButton;
    FedVariable: TEdit;
    // FbtgpMessagePresets: TButtonGroup;
  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoSize;
    property GbCardSettingsMessageText: TGroupBox
      read FgbCardSettingsMessageText write FgbCardSettingsMessageText;
    property PlPresets: TPanel read FplPresets write FplPresets;
    property PlPresetsRow1: TPanel read FplPresetsRow1 write FplPresetsRow1;
    property PlPresetsRow2: TPanel read FplPresetsRow2 write FplPresetsRow2;
    property PlPresetsRow3: TPanel read FplPresetsRow3 write FplPresetsRow3;
    property BtPresets1: TButton read FbtPresets1 write FbtPresets1;
    property BtPresets2: TButton read FbtPresets2 write FbtPresets2;
    property BtPresets3: TButton read FbtPresets3 write FbtPresets3;
    property BtPresets4: TButton read FbtPresets4 write FbtPresets4;
    property BtPresets5: TButton read FbtPresets5 write FbtPresets5;
    property BtPresets6: TButton read FbtPresets6 write FbtPresets6;
    property BtPresets7: TButton read FbtPresets7 write FbtPresets7;
    property EdVariable: TEdit read FedVariable write FedVariable;
  end;

implementation

{ TftCardSettingsMessageTextView }

constructor TftCardSettingsMessageTextView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FgbCardSettingsMessageText := TGroupBox.Create(Self);
  FgbCardSettingsMessageText.Parent := Self;

  FplPresets := TPanel.Create(Self);
  FplPresets.Parent := Self;

  FplPresetsRow1 := TPanel.Create(FplPresets);
  FplPresetsRow1.Parent := FplPresets;
  FplPresetsRow1.Align := alTop;
  FplPresetsRow1.Height := 30;
  FplPresetsRow1.BevelOuter := bvNone;

  FplPresetsRow2 := TPanel.Create(FplPresets);
  FplPresetsRow2.Parent := FplPresets;
  FplPresetsRow2.Align := alClient;
  FplPresetsRow2.BevelOuter := bvNone;

  FplPresetsRow3 := TPanel.Create(FplPresets);
  FplPresetsRow3.Parent := FplPresets;
  FplPresetsRow3.Align := alBottom;
  FplPresetsRow3.Height := 30;
  FplPresetsRow3.BevelOuter := bvNone;

  FbtPresets1 := TButton.Create(Self);
  FbtPresets1.Parent := FplPresetsRow1;
  FbtPresets1.Align := alLeft;
  FbtPresets1.Width := 110;
  FbtPresets1.Name := 'btFullName';
  FbtPresets1.Caption := 'Полное имя';

  FbtPresets2 := TButton.Create(Self);
  FbtPresets2.Parent := FplPresetsRow1;
  FbtPresets2.Align := alClient;
  FbtPresets2.Name := 'btFistName';
  FbtPresets2.Caption := 'Имя';

  FbtPresets3 := TButton.Create(Self);
  FbtPresets3.Parent := FplPresetsRow1;
  FbtPresets3.Align := alRight;
  FbtPresets3.Width := 110;
  FbtPresets3.Name := 'btLastName';
  FbtPresets3.Caption := 'Фамилия';

  FbtPresets4 := TButton.Create(Self);
  FbtPresets4.Parent := FplPresetsRow2;
  FbtPresets4.Align := alLeft;
  FbtPresets4.Width := 110;
  FbtPresets4.Name := 'btPhone';
  FbtPresets4.Caption := 'Телефон';

  FbtPresets5 := TButton.Create(Self);
  FbtPresets5.Parent := FplPresetsRow2;
  FbtPresets5.Align := alClient;
  FbtPresets5.Name := 'btEmail';
  FbtPresets5.Caption := 'Email';

  FbtPresets6 := TButton.Create(Self);
  FbtPresets6.Parent := FplPresetsRow2;
  FbtPresets6.Align := alRight;
  FbtPresets6.Width := 110;
  FbtPresets6.Name := 'btAddress';
  FbtPresets6.Caption := 'Адрес';

  FbtPresets7 := TButton.Create(Self);
  FbtPresets7.Parent := FplPresetsRow3;
  FbtPresets7.Align := alLeft;
  FbtPresets7.Width := 110;
  FbtPresets7.Name := 'btUsername';
  FbtPresets7.Caption := 'Username';

  FedVariable:= TEdit.Create(Self);
  FedVariable.Parent := FplPresetsRow3;
  FedVariable.Align := alClient;
  FedVariable.Text := 'Переменная';
end;

destructor TftCardSettingsMessageTextView.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsMessageTextView.Paint;
begin
  inherited;

end;

end.
