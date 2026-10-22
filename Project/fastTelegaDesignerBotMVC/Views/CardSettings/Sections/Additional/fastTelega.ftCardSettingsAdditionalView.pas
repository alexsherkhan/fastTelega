unit fastTelega.ftCardSettingsAdditionalView;

interface

uses
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  TftCardSettingsAdditionalView = class(TftViewBase)
  private
    FgbCardSettingsAdditional: TGroupBox;
    FcbAnswerInNumbers: TCheckBox;
    FcbRepeatRequest: TCheckBox;
    FcbDisableLinkPreview: TCheckBox;
    FcbDeliverWithoutCound: TCheckBox;
    FcbProtectedContent: TCheckBox;
    FcbSubstituteAChatMessage: TCheckBox;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoSize;
    property GbCardSettingsAdditional: TGroupBox read FgbCardSettingsAdditional
      write FgbCardSettingsAdditional;
    property CbAnswerInNumbers: TCheckBox read FcbAnswerInNumbers
      write FcbAnswerInNumbers;
    property CbRepeatRequest: TCheckBox read FcbRepeatRequest
      write FcbRepeatRequest;
    property CbDisableLinkPreview: TCheckBox read FcbDisableLinkPreview
      write FcbDisableLinkPreview;
    property CbDeliverWithoutCound: TCheckBox read FcbDeliverWithoutCound
      write FcbDeliverWithoutCound;
    property CbProtectedContent: TCheckBox read FcbProtectedContent
      write FcbProtectedContent;
    property CbSubstituteAChatMessage: TCheckBox read FcbSubstituteAChatMessage
      write FcbSubstituteAChatMessage;
  end;

implementation

{ TftCardSettingsAdditionalView }

constructor TftCardSettingsAdditionalView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FgbCardSettingsAdditional := TGroupBox.Create(Self);
  FgbCardSettingsAdditional.Parent := Self;

  FcbAnswerInNumbers := TCheckBox.Create(Self);
  FcbAnswerInNumbers.Parent := FgbCardSettingsAdditional;

  FcbRepeatRequest := TCheckBox.Create(Self);
  FcbRepeatRequest.Parent := FgbCardSettingsAdditional;

  FcbDisableLinkPreview := TCheckBox.Create(Self);
  FcbDisableLinkPreview.Parent := FgbCardSettingsAdditional;

  FcbDeliverWithoutCound := TCheckBox.Create(Self);
  FcbDeliverWithoutCound.Parent := FgbCardSettingsAdditional;

  FcbProtectedContent := TCheckBox.Create(Self);
  FcbProtectedContent.Parent := FgbCardSettingsAdditional;

  FcbSubstituteAChatMessage := TCheckBox.Create(Self);
  FcbSubstituteAChatMessage.Parent := FgbCardSettingsAdditional;
end;

destructor TftCardSettingsAdditionalView.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsAdditionalView.Paint;
begin
  inherited;

end;

end.
