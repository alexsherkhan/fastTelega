unit fastTelega.ftDesignerBot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ButtonGroup,
  fastTelega.ftÑardCommandBase, Vcl.Menus, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection,fastTelega.ftDesignerBotScrollBox;

type
  TftFormDesignerBot = class(TForm)
    btClose: TButton;
    Panel3: TPanel;
    Memo1: TMemo;
    lbTitle: TLabel;
    Panel4: TPanel;
    ButtonGroup1: TButtonGroup;
    gbMenu: TGroupBox;
    Button11: TButton;
    gbAdditional: TGroupBox;
    sbCardSettings: TScrollBox;
    gbCard: TGroupBox;
    Label2: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    gbAddItem: TGroupBox;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Label4: TLabel;
    Edit3: TEdit;
    GroupBox3: TGroupBox;
    ButtonGroup2: TButtonGroup;
    Edit4: TEdit;
    btBack: TButton;
    Button5: TButton;
    btBegin: TButton;
    MainMenu1: TMainMenu;
    f1: TMenuItem;
    New1: TMenuItem;
    New2: TMenuItem;
    Save1: TMenuItem;
    Save2: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    sbDesktop: TScrollBox;
    Button10: TButton;
    ImageListIcons: TImageList;
    SpeedButton1: TSpeedButton;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure btCloseClick(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    StartÑardCommand: TftStartÑardCommand;
  public
    { Public declarations }
  end;

var
  ftFormDesignerBot: TftFormDesignerBot;

implementation

{$R *.dfm}

procedure TftFormDesignerBot.Button10Click(Sender: TObject);
var
  SimpleMessageÑardCommand: TftSimpleMessageÑardCommand;
begin
  SimpleMessageÑardCommand := TftSimpleMessageÑardCommand.Create(Self);
  SimpleMessageÑardCommand.Parent := Self;
end;

procedure TftFormDesignerBot.Button3Click(Sender: TObject);
begin

  // Memo1.Lines[Memo1.CaretPos.Y+1]
end;

procedure TftFormDesignerBot.Button5Click(Sender: TObject);
begin
  if (Sender as TButton).Caption = '<' then
  begin
    (Sender as TButton).Caption := '>';
    btBegin.Visible := True;
    btBack.Visible := True;
  end
  else
  begin
    (Sender as TButton).Caption := '<';
    btBegin.Visible := False;
    btBack.Visible := False;
  end;

end;

procedure TftFormDesignerBot.btCloseClick(Sender: TObject);
begin
  sbCardSettings.Visible := False;
end;

procedure TftFormDesignerBot.FormCreate(Sender: TObject);
var
  Desktop: TftDesignerBotScrollBox;
begin
  Desktop := TftDesignerBotScrollBox.Create(Self);
  Desktop.Parent := Self;
  Desktop.Align := alClient;
  Desktop.NewCardButton.Images := VirtualImageList1;
  Desktop.NewCardButton.ImageIndex := 6;
  StartÑardCommand := TftStartÑardCommand.Create(Desktop);
  StartÑardCommand.Parent := Desktop;
  StartÑardCommand.Left := 50;
  StartÑardCommand.Top := 50;
 // StartÑardCommand.Name := 'StartÑard';
  StartÑardCommand.OnClick := Panel5Click;
end;

procedure TftFormDesignerBot.Panel5Click(Sender: TObject);
begin
  sbCardSettings.Visible := True;
end;

end.
