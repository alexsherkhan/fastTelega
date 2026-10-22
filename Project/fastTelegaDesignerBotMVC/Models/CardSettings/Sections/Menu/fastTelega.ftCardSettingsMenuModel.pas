unit fastTelega.ftCardSettingsMenuModel;

interface

uses
  System.Classes, System.Types, System.SysUtils, fastTelega.ftModelBase;

type
  TftCardSettingsMenuModel = class(TftModelBase)
  private
    FTitle: String;
    FMenuList: TList;
    FIsStartNumberingFromScratch: Boolean;
    FEnabled: Boolean;
    procedure SetTitle(const Value: String);
    procedure SetMenuList(const Value: TList);
    procedure SetIsStartNumberingFromScratch(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Title: String read FTitle write SetTitle;
    property MenuList: TList read FMenuList write SetMenuList;
    property IsStartNumberingFromScratch: Boolean
      read FIsStartNumberingFromScratch write SetIsStartNumberingFromScratch;
  end;

implementation

{ TftCardSettingsMenuModel }

constructor TftCardSettingsMenuModel.Create;
begin
  FMenuList := TList.Create;
end;

destructor TftCardSettingsMenuModel.Destroy;
begin
  FreeAndNil(FMenuList);
  inherited;
end;

procedure TftCardSettingsMenuModel.SetIsStartNumberingFromScratch
  (const Value: Boolean);
begin
  FIsStartNumberingFromScratch := Value;
end;

procedure TftCardSettingsMenuModel.SetMenuList(const Value: TList);
begin
  FMenuList := Value;
end;

procedure TftCardSettingsMenuModel.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

end.
