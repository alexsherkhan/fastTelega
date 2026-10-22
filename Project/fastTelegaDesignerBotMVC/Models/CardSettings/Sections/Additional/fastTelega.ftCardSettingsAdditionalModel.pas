unit fastTelega.ftCardSettingsAdditionalModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type

  TftCardSettingsAdditionalModel = class(TftModelBase)
  private
    FIsAnswerInNumbers: Boolean;
    FIsRepeatRequest: Boolean;
    FIsDisableLinkPreview: Boolean;
    FIsDeliverWithoutCound: Boolean;
    FIsProtectedContent: Boolean;
    FIsSubstituteAChatMessage: Boolean;
    procedure SetIsAnswerInNumbers(const Value: Boolean);
    procedure SetIsDeliverWithoutCound(const Value: Boolean);
    procedure SetIsDisableLinkPreview(const Value: Boolean);
    procedure SetIsProtectedContent(const Value: Boolean);
    procedure SetIsRepeatRequest(const Value: Boolean);
    procedure SetIsSubstituteAChatMessage(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
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

{ TftCardSettingsAdditionalModel }

constructor TftCardSettingsAdditionalModel.Create;
begin

end;

destructor TftCardSettingsAdditionalModel.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsAdditionalModel.SetIsAnswerInNumbers(
  const Value: Boolean);
begin

end;

procedure TftCardSettingsAdditionalModel.SetIsDeliverWithoutCound(
  const Value: Boolean);
begin

end;

procedure TftCardSettingsAdditionalModel.SetIsDisableLinkPreview(
  const Value: Boolean);
begin

end;

procedure TftCardSettingsAdditionalModel.SetIsProtectedContent(
  const Value: Boolean);
begin

end;

procedure TftCardSettingsAdditionalModel.SetIsRepeatRequest(
  const Value: Boolean);
begin

end;

procedure TftCardSettingsAdditionalModel.SetIsSubstituteAChatMessage(
  const Value: Boolean);
begin

end;

end.
