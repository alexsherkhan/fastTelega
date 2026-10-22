unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ButtonGroup, Vcl.Buttons,
  JSON, DBXJSON, DBXJSONReflect, System.Generics.Collections,
  fastTelega.ftCardController, fastTelega.ftCardModel,
  fastTelega.ftDesignerBotController,
  Vcl.Menus, Vcl.ComCtrls, Vcl.ToolWin, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  fastTelega.ftKeybordEmoji;

const
  с_FileNameSave = 'C:\Users\Alexander\Desktop\GitHub\test.ftbc';

type
  TFormDesignerBot = class(TForm)
    MainMenu1: TMainMenu;
    Fi1: TMenuItem;
    About1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N1: TMenuItem;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Splitter1: TSplitter;
    pnScript: TPanel;
    ToolButton1: TToolButton;
    ImageCollection1: TImageCollection;
    VirtualImageList1: TVirtualImageList;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    pnSettingsBot: TPanel;
    TabControl1: TTabControl;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Edit1: TEdit;
    Button6: TButton;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    KeybordEmoji: TftKeybordEmoji;
  public
    { Public declarations }
  end;

  TmsShapeContainer = class
  private
    fList: TList<TftCardCommandBaseModel>;
  public
    constructor Create;
    destructor Destroy;
  end;

var
  FormDesignerBot: TFormDesignerBot;

implementation

uses
//  System.Threading,
  fastTelega.ftPlotGrid,
  fastTelega.ftCardSettingsMessageTextController,
  fastTelega.ftCardSettingsInfoController,
  fastTelega.ftCardSettingsAdditionalController,
  fastTelega.ftCardSettingsMenuController,
  fastTelega.ftCardSettingsController,
  fastTelega.ftLineLinkController;

{$R *.dfm}

procedure TFormDesignerBot.Button1Click(Sender: TObject);
begin
  pnScript.BringToFront;
end;

procedure TFormDesignerBot.Button2Click(Sender: TObject);
// var
// l_Marshal: TJSONMarshal;
// l_Json: TJSONObject;
//
/// /  l_Shape1, l_Shape2: TmsShape;
// l_msShapeContainer: TmsShapeContainer;
// l_StringList: TStringList;
begin
  // try
  // l_Shape1 := TmsShape.Create(1, 'First');
  /// /    l_Shape2 := TmsShape.Create(2, 'Second');
  //
  // l_msShapeContainer := TmsShapeContainer.Create;
  // l_msShapeContainer.fList.Add(l_Shape1);
  // l_msShapeContainer.fList.Add(l_Shape2);
  //
  // l_Marshal := TJSONMarshal.Create;
  // l_StringList := TStringList.Create;
  //
  // l_Marshal.RegisterConverter(TmsShapeContainer, 'fList',
  // function(Data: TObject; Field: string): TListOfObjects
  // var l_Shape : TmsShape;
  // l_Index: integer;
  // begin
  // SetLength(Result, (Data As TmsShapeContainer).fList.Count);
  // l_Index := 0;
  // for l_Shape in (Data As TmsShapeContainer).fList do
  // begin
  // Result[l_Index] := l_Shape;
  // Inc(l_Index);
  // end;
  // end
  // );
  //
  // l_Json := l_Marshal.Marshal(l_msShapeContainer) as TJSONObject;
  // Memo1.Lines.Text := l_Json.tostring;
  //
  // l_StringList.Add(l_Json.tostring);
  // l_StringList.SaveToFile(с_FileNameSave);
  // finally
  // FreeAndNil(l_Marshal);
  // FreeAndNil(l_StringList);
  // FreeAndNil(l_Json);
  // FreeAndNil(l_Shape1);
  // FreeAndNil(l_Shape2);
  // FreeAndNil(l_msShapeContainer);
  // end;

end;

procedure TFormDesignerBot.Button3Click(Sender: TObject);
begin
  pnSettingsBot.BringToFront;
end;

procedure TFormDesignerBot.Button5Click(Sender: TObject);
begin
  KeybordEmoji.Visible := not KeybordEmoji.Visible;
end;

procedure TFormDesignerBot.CheckBox1Click(Sender: TObject);
begin
 KeybordEmoji.ColorEmoji := CheckBox1.Checked;
end;

procedure TFormDesignerBot.FormCreate(Sender: TObject);
var
  Controller: TftDesignerBotController;

  // PlotGrid: TftPlotGrid;
  // l_Marshal: TJSONMarshal;
  // l_Json: TJSONObject;
  //
  // l_Shape1, l_Shape2: TftCardCommandBaseModel;
  // l_msShapeContainer: TmsShapeContainer;
  // l_StringList: TStringList;
begin
  Controller := TftDesignerBotController.Create(pnScript);
  Controller.Images := VirtualImageList1;

  KeybordEmoji := TftKeybordEmoji.Create(Self);
  KeybordEmoji.Parent := Panel1;
  KeybordEmoji.Align := alBottom;
  KeybordEmoji.Height := 200;
  KeybordEmoji.Visible := False;
  KeybordEmoji.Memo := Memo1;


  // PlotGrid := TftPlotGrid.Create(Self);
  // PlotGrid.Parent := Self;
  // PlotGrid.Align := alClient;
  // PlotGrid.Frequency := 10;
  // PlotGrid.Marks := 5;

  // TftCardSettingsControllerBase.Create(Self);
  // TftStartCardController.Create(PlotGrid);

  // try
  // l_Shape1 := TftCardCommandBaseModel.Create;
  // l_Shape2 := TftCardCommandBaseModel.Create;
  //
  // l_msShapeContainer := TmsShapeContainer.Create;
  // l_msShapeContainer.fList.Add(l_Shape1);
  // l_msShapeContainer.fList.Add(l_Shape2);
  //
  // l_Marshal := TJSONMarshal.Create;
  // l_StringList := TStringList.Create;
  //
  // l_Marshal.RegisterConverter(TmsShapeContainer, 'fList',
  // function(Data: TObject; Field: string): TListOfObjects
  // var l_Shape : TftCardCommandBaseModel;
  // l_Index: integer;
  // begin
  // SetLength(Result, (Data As TmsShapeContainer).fList.Count);
  // l_Index := 0;
  // for l_Shape in (Data As TmsShapeContainer).fList do
  // begin
  // Result[l_Index] := l_Shape;
  // Inc(l_Index);
  // end;
  // end
  // );
  //
  // l_Json := l_Marshal.Marshal(l_msShapeContainer) as TJSONObject;
  // Memo1.Lines.Text := l_Json.tostring;
  //
  // l_StringList.Add(l_Json.tostring);
  // l_StringList.SaveToFile(с_FileNameSave);
  // finally
  // FreeAndNil(l_Marshal);
  // FreeAndNil(l_StringList);
  // FreeAndNil(l_Json);
  // FreeAndNil(l_Shape1);
  // FreeAndNil(l_Shape2);
  // FreeAndNil(l_msShapeContainer);
  // end;

end;

procedure TFormDesignerBot.TabControl1Change(Sender: TObject);
begin

end;

{ TmsShapeContainer }

constructor TmsShapeContainer.Create;
begin
  fList := TList<TftCardCommandBaseModel>.Create;
end;

destructor TmsShapeContainer.Destroy;
begin
  FreeAndNil(fList);
  inherited;
end;

end.
