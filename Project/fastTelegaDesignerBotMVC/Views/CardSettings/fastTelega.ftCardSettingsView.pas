unit fastTelega.ftCardSettingsView;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  TftCardSettingsView = class(TftViewScrollBoxBase)
  private
    FlbTitle: TLabel;
    FButtonClose: TButton;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ButtonClose: TButton read FButtonClose write FButtonClose;
    property LbTitle: TLabel read FlbTitle write FlbTitle;
  end;

implementation

{ TftCardSettingsView }

constructor TftCardSettingsView.Create(AOwner: TComponent);
begin
  inherited;
  Self.Color := clBtnFace;

  FButtonClose := TButton.Create(Self);
  FButtonClose.Parent := Self;
  FButtonClose.Style := bsCommandLink;


  FlbTitle := TLabel.Create(Self);
  FlbTitle.Parent := Self;
end;

destructor TftCardSettingsView.Destroy;
begin

  inherited;
end;

end.
