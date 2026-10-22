unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fastTelega.EventHandler,
  fastTelega.EventBroadcaster, fastTelega.Vcl;

type
  TForm1 = class(TForm)
    ftTelegramBot1: TftTelegramBot;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
