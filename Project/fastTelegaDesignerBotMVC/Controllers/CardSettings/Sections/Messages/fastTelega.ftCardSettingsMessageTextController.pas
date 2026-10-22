unit fastTelega.ftCardSettingsMessageTextController;

interface

uses
  System.Classes, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsMessageTextModel,
  fastTelega.ftCardSettingsMessageTextView,
  fastTelega.ftCardSettingsTextEditorController;

type
  TftCardSettingsMessageTextController = class(TftControllerBase)
  private
    FModel: TftCardSettingsMessageTextModel;
    FView: TftCardSettingsMessageTextView;
    FTextEditorController: TftCardSettingsTextEditorController;

    function GetLines: TStringList;
    procedure SetLines(const Value: TStringList);
    procedure AddStringPreset(Sender: TObject);
    procedure EdVariableKeyPress(Sender: TObject; var Key: Char);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;

    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published
    property Lines: TStringList read GetLines write SetLines;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ButtonGroup;

{ TftCardSettingsMessageText }

procedure TftCardSettingsMessageTextController.AddStringPreset(Sender: TObject);
begin
  if (Sender as TButton).Name = 'btFullName' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ name }}');
  end
  else if (Sender as TButton).Name = 'btFistName' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ first_name }}');
  end
  else if (Sender as TButton).Name = 'btLastName' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ last_name }}');
  end
  else if (Sender as TButton).Name = 'btPhone' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ phone }}');
  end
  else if (Sender as TButton).Name = 'btEmail' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ email }}');
  end
  else if (Sender as TButton).Name = 'btAddress' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ address }}');
  end
  else if (Sender as TButton).Name = 'btUsername' then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ username }}');
  end;
  UpdateView;
end;

constructor TftCardSettingsMessageTextController.Create(AOwner: TComponent);
var
  Lbtn: TGrpButtonItem;
begin
  FModel := TftCardSettingsMessageTextModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;
  FView := TftCardSettingsMessageTextView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Height := 260;
  // FView.Width := 40;
  FView.Align := alTop;
  FView.AutoSize := True;

  FView.GbCardSettingsMessageText.Align := alTop;
  FView.GbCardSettingsMessageText.Height := 170;
  FView.GbCardSettingsMessageText.Caption := 'Текстовое сообщение';
  // FView.GbCardSettingsMessageText.HeaderFont.Style := [TFontStyle.fsBold];
  FView.PlPresets.Align := alClient;

  FView.plPresetsRow1.Align := alTop;
  FView.plPresetsRow1.Height := 30;
  FView.plPresetsRow1.BevelOuter := bvNone;

  FView.plPresetsRow2.Align := alClient;
  FView.plPresetsRow2.BevelOuter := bvNone;

  FView.plPresetsRow3.Align := alBottom;
  FView.plPresetsRow3.Height := 30;
  FView.plPresetsRow3.BevelOuter := bvNone;

  FView.btPresets1.Align := alLeft;
  FView.btPresets1.Width := 110;
  FView.btPresets1.Name := 'btFullName';
  FView.btPresets1.Caption := 'Полное имя';

  FView.btPresets2.Align := alClient;
  FView.btPresets2.Name := 'btFistName';
  FView.btPresets2.Caption := 'Имя';

  FView.btPresets3.Align := alRight;
  FView.btPresets3.Width := 110;
  FView.btPresets3.Name := 'btLastName';
  FView.btPresets3.Caption := 'Фамилия';

  FView.btPresets4.Align := alLeft;
  FView.btPresets4.Width := 110;
  FView.btPresets4.Name := 'btPhone';
  FView.btPresets4.Caption := 'Телефон';

  FView.btPresets5.Align := alClient;
  FView.btPresets5.Name := 'btEmail';
  FView.btPresets5.Caption := 'Email';

  FView.btPresets6.Align := alRight;
  FView.btPresets6.Width := 110;
  FView.btPresets6.Name := 'btAddress';
  FView.btPresets6.Caption := 'Адрес';

  FView.btPresets7.Align := alLeft;
  FView.btPresets7.Width := 110;
  FView.btPresets7.Name := 'btUsername';
  FView.btPresets7.Caption := 'Username';

  FView.edVariable.Align := alClient;
  FView.edVariable.Text := 'Переменная';

  FView.btPresets1.OnClick := AddStringPreset;
  FView.btPresets2.OnClick := AddStringPreset;
  FView.btPresets3.OnClick := AddStringPreset;
  FView.btPresets4.OnClick := AddStringPreset;
  FView.btPresets5.OnClick := AddStringPreset;
  FView.btPresets6.OnClick := AddStringPreset;
  FView.btPresets7.OnClick := AddStringPreset;

  FView.edVariable.OnKeyPress := EdVariableKeyPress;

  FTextEditorController := TftCardSettingsTextEditorController.Create
    (FView.GbCardSettingsMessageText);

  LoadData;
  UpdateView;
end;

destructor TftCardSettingsMessageTextController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

procedure TftCardSettingsMessageTextController.EdVariableKeyPress
  (Sender: TObject; var Key: Char);
begin
  if Key = ^M then
  begin
    FTextEditorController.AddStringCaretPosLines('{{ $' + (Sender as TEdit)
      .Text + ' }}');
    (Sender as TEdit).Text := 'Переменная';
    Key := #0;
    UpdateView;
  end;
end;

function TftCardSettingsMessageTextController.GetLines: TStringList;
begin
  Result := FModel.Lines;
end;

procedure TftCardSettingsMessageTextController.LoadData;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
  FModel.Lines.Add('Сообщение от бота');
end;

procedure TftCardSettingsMessageTextController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsMessageTextController.SetLines
  (const Value: TStringList);
begin
  if Value <> FModel.Lines then
  begin
    FModel.Lines.Assign(Value);
    UpdateView;
  end;
end;

procedure TftCardSettingsMessageTextController.UpdateModel;
begin
  FModel.Lines.Assign(Lines);
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardSettingsMessageTextController.UpdateView;
begin
   //FView. := FModel.Text;
  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
