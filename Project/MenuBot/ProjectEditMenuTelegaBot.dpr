program ProjectEditMenuTelegaBot;

uses
  Vcl.Forms,
  fastTelega.ftDesignerBot in 'fastTelega.ftDesignerBot.pas' {ftFormDesignerBot},
  fastTelega.ftÑardCommandBase in 'fastTelega.ftÑardCommandBase.pas',
  fastTelega.ftMenuItemÑardCommandLink in 'fastTelega.ftMenuItemÑardCommandLink.pas',
  fastTelega.ftDesignerBotScrollBox in 'fastTelega.ftDesignerBotScrollBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TftFormDesignerBot, ftFormDesignerBot);
  Application.Run;
end.
