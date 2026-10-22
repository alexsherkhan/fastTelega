program FastTelegaSetupGui;

{$mode delphi}{$H+}

uses
  Interfaces, Forms, SetupForm;

var
  FormSetup: TfrmSetup;

begin
  Application.Initialize;
  Application.Title := 'fastTelega Setup';
  Application.CreateForm(TfrmSetup, FormSetup);
  Application.Run;
end.
