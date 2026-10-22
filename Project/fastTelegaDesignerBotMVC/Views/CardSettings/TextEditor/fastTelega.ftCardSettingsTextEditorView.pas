unit fastTelega.ftCardSettingsTextEditorView;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls, fastTelega.ftViewBase;

type
  TftCardSettingsTextEditorView = class(TftViewBase)
  private
    FMemoText: TMemo;
    FplFont: TPanel;
    FButtonBold: TButton;
    FButtonItalic: TButton;
    FButtonStrikethrough: TButton;

  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property AutoSize;
    property MemoText: TMemo read FMemoText write FMemoText;
    property PlFont: TPanel read FplFont write FplFont;
    property ButtonBold: TButton read FButtonBold write FButtonBold;
    property ButtonItalic: TButton read FButtonItalic write FButtonItalic;
    property ButtonStrikethrough: TButton read FButtonStrikethrough
      write FButtonStrikethrough;
  end;

implementation

{ TftCardSettingsTextEditorView }

constructor TftCardSettingsTextEditorView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FMemoText := TMemo.Create(Self);
  FMemoText.Parent := Self;

  FplFont := TPanel.Create(Self);
  FplFont.Parent := Self;

  FButtonBold := TButton.Create(FplFont);
  FButtonBold.Parent := FplFont;

  FButtonItalic := TButton.Create(FplFont);
  FButtonItalic.Parent := FplFont;

  FButtonStrikethrough := TButton.Create(FplFont);
  FButtonStrikethrough.Parent := FplFont;
end;

destructor TftCardSettingsTextEditorView.Destroy;
begin

  inherited;
end;

procedure TftCardSettingsTextEditorView.Paint;
begin
  inherited;

end;

end.
