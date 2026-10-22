unit fastTelega.ftCardSettingsMenuItemModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type

  TftCardSettingsMenuItemType = (miText = 0);

  TftCardSettingsMenuItemModel = class(TftModelBase)
  private
    FItemIndex: Integer;
    FItemType: Integer;
    FText: String;
    FIsStartNumberingFromScratch: Boolean;
    FEnabled: Boolean;
    procedure SetIsStartNumberingFromScratch(const Value: Boolean);
    procedure SetItemIndex(const Value: Integer);
    procedure SetItemType(const Value: Integer);
    procedure SetText(const Value: String);
    procedure SetEnabled(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property ItemType: Integer read FItemType write SetItemType;
    property Text: String read FText write SetText;
    property IsStartNumberingFromScratch: Boolean
      read FIsStartNumberingFromScratch write SetIsStartNumberingFromScratch;
    property Enabled: Boolean read FEnabled write SetEnabled;
  end;

implementation

{ TftCardSettingsMenuItemModel }

constructor TftCardSettingsMenuItemModel.Create;
begin

end;

destructor TftCardSettingsMenuItemModel.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsMenuItemModel.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TftCardSettingsMenuItemModel.SetIsStartNumberingFromScratch
  (const Value: Boolean);
begin
  FIsStartNumberingFromScratch := Value;
end;

procedure TftCardSettingsMenuItemModel.SetItemIndex(const Value: Integer);
begin
  FItemIndex := Value;
end;

procedure TftCardSettingsMenuItemModel.SetItemType(const Value: Integer);
begin
  FItemType := Value;
end;

procedure TftCardSettingsMenuItemModel.SetText(const Value: String);
begin
  FText := Value;
end;

end.
