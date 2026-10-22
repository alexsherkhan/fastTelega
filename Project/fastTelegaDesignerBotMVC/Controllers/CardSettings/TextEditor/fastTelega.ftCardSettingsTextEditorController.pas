unit fastTelega.ftCardSettingsTextEditorController;

interface

uses
  System.Classes, System.Types, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsTextEditorModel,
  fastTelega.ftCardSettingsTextEditorView;

type
  TftCardSettingsTextEditorController = class(TftControllerBase)
  private
    FModel: TftCardSettingsTextEditorModel;
    FView: TftCardSettingsTextEditorView;

    function GetLines: TStringList;
    procedure SetLines(const Value: TStringList);
    procedure SetCaretPos(const Value: TPoint);
    function GetCaretPos: TPoint;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;

    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
    procedure AddStringCaretPosLines(AString: String);
    procedure FontStyleClick(Sender: TObject);
  published
    property Lines: TStringList read GetLines write SetLines;
    property CaretPos: TPoint read GetCaretPos write SetCaretPos;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, Vcl.StdCtrls;

{ TftCardSettingsTextEditorController }

procedure TftCardSettingsTextEditorController.AddStringCaretPosLines
  (AString: String);
begin;
  FView.MemoText.SelText := AString;
  UpdateModel;
end;

constructor TftCardSettingsTextEditorController.Create(AOwner: TComponent);
begin
  FModel := TftCardSettingsTextEditorModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;
  FView := TftCardSettingsTextEditorView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Height := 50;
  // FView.Width := 40;
  FView.Align := alTop;
  FView.AutoSize := True;

  FView.MemoText.Align := alTop;
  FView.MemoText.Height := 120;

  FView.plFont.Align := alTop;
  FView.plFont.Height := 30;
  FView.plFont.BevelOuter := bvNone;

  FView.ButtonBold.Align := alLeft;
  FView.ButtonBold.Width := 30;
  FView.ButtonBold.Caption := 'B';
  FView.ButtonBold.Name := 'btBold';
  FView.ButtonBold.OnClick := FontStyleClick;

  FView.ButtonItalic.Align := alLeft;
  FView.ButtonItalic.Width := 30;
  FView.ButtonItalic.Caption := 'I';
  FView.ButtonItalic.Name := 'btItalic';
  FView.ButtonItalic.OnClick := FontStyleClick;

  FView.ButtonStrikethrough.Align := alLeft;
  FView.ButtonStrikethrough.Width := 30;
  FView.ButtonStrikethrough.Caption := 'S';
  FView.ButtonStrikethrough.Name := 'btStrikethrough';
  FView.ButtonStrikethrough.OnClick := FontStyleClick;

  LoadData;
  UpdateView;
end;

destructor TftCardSettingsTextEditorController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

procedure TftCardSettingsTextEditorController.FontStyleClick(Sender: TObject);
begin
  if (Sender as TButton).Name = 'btBold' then
  begin
    FView.MemoText.SelText := '*' + FView.MemoText.SelText + '*';
  end
  else if (Sender as TButton).Name = 'btItalic' then
  begin
    FView.MemoText.SelText := '_' + FView.MemoText.SelText + '_';
  end
  else if (Sender as TButton).Name = 'btStrikethrough' then
  begin
    FView.MemoText.SelText := '~' + FView.MemoText.SelText + '~';
  end;
  UpdateModel;
end;

function TftCardSettingsTextEditorController.GetCaretPos: TPoint;
begin
  Result := FView.MemoText.CaretPos;
end;

function TftCardSettingsTextEditorController.GetLines: TStringList;
begin
  Result := FModel.Lines;
end;

procedure TftCardSettingsTextEditorController.LoadData;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
  FModel.Lines.Add('Сообщение от бота');
end;

procedure TftCardSettingsTextEditorController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsTextEditorController.SetCaretPos(const Value: TPoint);
begin
  FView.MemoText.CaretPos := Value;
end;

procedure TftCardSettingsTextEditorController.SetLines
  (const Value: TStringList);
begin
  if Value <> FModel.Lines then
  begin
    FModel.Lines.Assign(Value);
    UpdateView;
  end;
end;

procedure TftCardSettingsTextEditorController.UpdateModel;
begin
  FModel.Lines.Assign(FView.MemoText.Lines);
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardSettingsTextEditorController.UpdateView;
begin
  //FView.MemoText.Lines.Assign(FModel.Lines);
  // := FModel.Text;
  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
