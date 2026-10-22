unit fastTelega.ftCardSettingsAdditionalController;

interface

uses
  System.Classes, Vcl.Controls,
  fastTelega.ftControllerBase,
  fastTelega.ftCardSettingsAdditionalModel,
  fastTelega.ftCardSettingsAdditionalView;

type
  TftCardSettingsAdditionalController = class(TftControllerBase)
  private
    FModel: TftCardSettingsAdditionalModel;
    FView: TftCardSettingsAdditionalView;
    FIsRepeatRequest: Boolean;
    FIsAnswerInNumbers: Boolean;
    FIsDeliverWithoutCound: Boolean;
    FIsProtectedContent: Boolean;
    FIsDisableLinkPreview: Boolean;
    FIsSubstituteAChatMessage: Boolean;

    procedure SetIsAnswerInNumbers(const Value: Boolean);
    procedure SetIsDeliverWithoutCound(const Value: Boolean);
    procedure SetIsDisableLinkPreview(const Value: Boolean);
    procedure SetIsProtectedContent(const Value: Boolean);
    procedure SetIsRepeatRequest(const Value: Boolean);
    procedure SetIsSubstituteAChatMessage(const Value: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure UpdateModel; override;
    procedure UpdateView; override;
    procedure LoadData; override;

    procedure NotifyFromModel(Sender: TObject; AEvent: String); override;
  published
    property IsAnswerInNumbers: Boolean read FIsAnswerInNumbers
      write SetIsAnswerInNumbers;
    property IsRepeatRequest: Boolean read FIsRepeatRequest
      write SetIsRepeatRequest;
    property IsDisableLinkPreview: Boolean read FIsDisableLinkPreview
      write SetIsDisableLinkPreview;
    property IsDeliverWithoutCound: Boolean read FIsDeliverWithoutCound
      write SetIsDeliverWithoutCound;
    property IsProtectedContent: Boolean read FIsProtectedContent
      write SetIsProtectedContent;
    property IsSubstituteAChatMessage: Boolean read FIsSubstituteAChatMessage
      write SetIsSubstituteAChatMessage;
  end;

implementation

uses
  System.SysUtils, System.UITypes;

{ TftCardSettingsAdditionalController }

constructor TftCardSettingsAdditionalController.Create(AOwner: TComponent);
begin
  FModel := TftCardSettingsAdditionalModel.Create;
  FModel.OnNotifyModel := NotifyFromModel;

  FView := TftCardSettingsAdditionalView.Create(AOwner);
  FView.Parent := TWinControl(AOwner);
  FView.Align := alTop;
  FView.Height := 140;
 // FView.AutoSize := True;
  FView.Padding.Bottom := 10;
  FView.Padding.Top := 10;

  FView.gbCardSettingsAdditional.Align := alClient;
  FView.gbCardSettingsAdditional.Caption := 'Дополнительно';
  FView.gbCardSettingsAdditional.HeaderFont.Style := [TFontStyle.fsBold];

  FView.cbAnswerInNumbers.Caption := 'AnswerInNumbers';
  FView.cbAnswerInNumbers.Align := alTop;

  FView.cbRepeatRequest.Caption := 'RepeatRequest';
  FView.cbRepeatRequest.Align := alTop;

  FView.cbDisableLinkPreview.Caption := 'DisableLinkPreview';
  FView.cbDisableLinkPreview.Align := alTop;

  FView.cbDeliverWithoutCound.Caption := 'DeliverWithoutCound';
  FView.cbDeliverWithoutCound.Align := alTop;

  FView.cbProtectedContent.Caption := 'ProtectedContent';
  FView.cbProtectedContent.Align := alTop;

  FView.cbSubstituteAChatMessage.Caption := 'SubstituteAChatMessage';
  FView.cbSubstituteAChatMessage.Align := alTop;

  LoadData;
  UpdateView;
end;

destructor TftCardSettingsAdditionalController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FView);
  inherited Destroy;
end;

procedure TftCardSettingsAdditionalController.LoadData;
begin
  FModel.Left := 1;
  FModel.Top := 1;
  FModel.Width := 200;
  FModel.Height := 40;
end;

procedure TftCardSettingsAdditionalController.NotifyFromModel(Sender: TObject;
  AEvent: String);
begin
  // ShowMessage('Notify from > ' + Sender.ClassName + ' of Event = ' + AEvent);
end;

procedure TftCardSettingsAdditionalController.SetIsAnswerInNumbers
  (const Value: Boolean);
begin
  FModel.IsAnswerInNumbers := Value;
  UpdateView;
end;

procedure TftCardSettingsAdditionalController.SetIsDeliverWithoutCound
  (const Value: Boolean);
begin
  FModel.IsDeliverWithoutCound := Value;
  UpdateView;
end;

procedure TftCardSettingsAdditionalController.SetIsDisableLinkPreview
  (const Value: Boolean);
begin
  FModel.IsDisableLinkPreview := Value;
  UpdateView;
end;

procedure TftCardSettingsAdditionalController.SetIsProtectedContent
  (const Value: Boolean);
begin
  FModel.IsProtectedContent := Value;
  UpdateView;
end;

procedure TftCardSettingsAdditionalController.SetIsRepeatRequest
  (const Value: Boolean);
begin
  FModel.IsRepeatRequest := Value;
  UpdateView;
end;

procedure TftCardSettingsAdditionalController.SetIsSubstituteAChatMessage
  (const Value: Boolean);
begin
  FModel.IsSubstituteAChatMessage := Value;
  UpdateView;
end;

procedure TftCardSettingsAdditionalController.UpdateModel;
begin
  FModel.IsAnswerInNumbers := FView.cbAnswerInNumbers.Checked;
  FModel.IsRepeatRequest := FView.cbRepeatRequest.Checked;
  FModel.IsDisableLinkPreview := FView.cbDisableLinkPreview.Checked;
  FModel.IsDeliverWithoutCound := FView.cbDeliverWithoutCound.Checked;
  FModel.IsProtectedContent := FView.cbProtectedContent.Checked;
  FModel.IsSubstituteAChatMessage := FView.cbSubstituteAChatMessage.Checked;
  FModel.BoundsRect := FView.BoundsRect;
end;

procedure TftCardSettingsAdditionalController.UpdateView;
begin
  FView.cbAnswerInNumbers.Checked := FModel.IsAnswerInNumbers;
  FView.cbRepeatRequest.Checked := FModel.IsRepeatRequest;
  FView.cbDisableLinkPreview.Checked := FModel.IsDisableLinkPreview;
  FView.cbDeliverWithoutCound.Checked := FModel.IsDeliverWithoutCound;
  FView.cbProtectedContent.Checked := FModel.IsProtectedContent;
  FView.cbSubstituteAChatMessage.Checked := FModel.IsSubstituteAChatMessage;

  // FView.BoundsRect := FModel.BoundsRect;
end;

end.
