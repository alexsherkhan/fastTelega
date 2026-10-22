unit SetupForm;

{$mode delphi}{$H+}

interface

uses
  Classes, SysUtils, Graphics, Forms, Controls, StdCtrls, ExtCtrls, Dialogs,
  ComCtrls, LCLIntf,
  Setup.Core;

type
  TfrmSetup = class(TForm)
  private
    FSidePanel: TPanel;
    FPages: TPageControl;
    FStepLabels: array[0..4] of TLabel;
    FBackButton: TButton;
    FNextButton: TButton;
    FCancelButton: TButton;
    FSourceEdit: TEdit;
    FDestEdit: TEdit;
    FDocsCheck: TCheckBox;
    FExamplesCheck: TCheckBox;
    FPackagesCheck: TCheckBox;
    FLazarusCheck: TCheckBox;
    FLazarusInfo: TLabel;
    FInstallLog: TMemo;
    FProgress: TProgressBar;
    FSummary: TLabel;
    FFinishPath: TLabel;
    FFinishInfo: TLabel;
    FUninstallButton: TButton;
    FCurrentStep: Integer;
    procedure BuildUI;
    function CreatePage(const ACaption: String): TTabSheet;
    procedure BuildWelcomePage(APage: TTabSheet);
    procedure BuildDestinationPage(APage: TTabSheet);
    procedure BuildComponentsPage(APage: TTabSheet);
    procedure BuildInstallPage(APage: TTabSheet);
    procedure BuildFinishPage(APage: TTabSheet);
    procedure ShowStep(AStep: Integer);
    procedure UpdateStepLabels;
    procedure BrowseSource(Sender: TObject);
    procedure BrowseDest(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure UninstallClick(Sender: TObject);
    procedure OpenFolderClick(Sender: TObject);
    procedure InstallNow;
    procedure SetBusy(ABusy: Boolean);
    function Options: TSetupOptions;
    function ValidateDestination: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

constructor TfrmSetup.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption := 'fastTelega Setup';
  Position := poScreenCenter;
  BorderStyle := bsDialog;
  ClientWidth := 780;
  ClientHeight := 540;
  BuildUI;
  FSourceEdit.Text := FindSourceRoot;
  FDestEdit.Text := DefaultInstallDir;
  if FindLazbuild = '' then
  begin
    FLazarusCheck.Checked := False;
    FLazarusInfo.Caption := 'lazbuild not found; package registration disabled.';
  end
  else
    FLazarusInfo.Caption := 'Detected: ' + FindLazbuild;
  FCurrentStep := 0;
  ShowStep(0);
end;

function TfrmSetup.CreatePage(const ACaption: String): TTabSheet;
begin
  Result := TTabSheet.Create(FPages);
  Result.PageControl := FPages;
  Result.Caption := ACaption;
  Result.BorderWidth := 12;
end;

procedure TfrmSetup.BuildUI;
var
  LTitle: TLabel;
  LSubtitle: TLabel;
  LBottom: TPanel;
  LImage: TImage;
  LAsset: String;
  I: Integer;
  LStepNames: array[0..4] of String;
begin
  FSidePanel := TPanel.Create(Self);
  FSidePanel.Parent := Self;
  FSidePanel.Align := alLeft;
  FSidePanel.Width := 200;
  FSidePanel.Color := $00303030;
  FSidePanel.ParentBackground := False;
  FSidePanel.BorderStyle := bsNone;

  LTitle := TLabel.Create(Self);
  LTitle.Parent := FSidePanel;
  LTitle.Left := 18;
  LTitle.Top := 22;
  LTitle.Font.Size := 15;
  LTitle.Font.Style := [fsBold];
  LTitle.Font.Color := clWhite;
  LTitle.Caption := 'fastTelega';

  LSubtitle := TLabel.Create(Self);
  LSubtitle.Parent := FSidePanel;
  LSubtitle.Left := 18;
  LSubtitle.Top := 46;
  LSubtitle.Width := 170;
  LSubtitle.AutoSize := False;
  LSubtitle.WordWrap := True;
  LSubtitle.Height := 60;
  LSubtitle.Font.Color := $00D0D0D0;
  LSubtitle.Caption := 'Telegram Bot API library for Delphi and Free Pascal';

  LStepNames[0] := '1.  Welcome';
  LStepNames[1] := '2.  Destination';
  LStepNames[2] := '3.  Components';
  LStepNames[3] := '4.  Install';
  LStepNames[4] := '5.  Finish';

  for I := 0 to 4 do
  begin
    FStepLabels[I] := TLabel.Create(Self);
    FStepLabels[I].Parent := FSidePanel;
    FStepLabels[I].Left := 18;
    FStepLabels[I].Top := 120 + I * 34;
    FStepLabels[I].Width := 170;
    FStepLabels[I].AutoSize := False;
    FStepLabels[I].Font.Size := 10;
    FStepLabels[I].Font.Color := $00B0B0B0;
    FStepLabels[I].Caption := LStepNames[I];
  end;

  FPages := TPageControl.Create(Self);
  FPages.Parent := Self;
  FPages.Align := alClient;
  FPages.ShowTabs := False;

  BuildWelcomePage(CreatePage('Welcome'));
  BuildDestinationPage(CreatePage('Destination'));
  BuildComponentsPage(CreatePage('Components'));
  BuildInstallPage(CreatePage('Install'));
  BuildFinishPage(CreatePage('Finish'));

  LBottom := TPanel.Create(Self);
  LBottom.Parent := Self;
  LBottom.Align := alBottom;
  LBottom.Height := 54;
  LBottom.BevelOuter := bvNone;

  FBackButton := TButton.Create(Self);
  FBackButton.Parent := LBottom;
  FBackButton.Left := 500;
  FBackButton.Top := 14;
  FBackButton.Width := 80;
  FBackButton.Caption := '< Back';
  FBackButton.OnClick := BackClick;

  FNextButton := TButton.Create(Self);
  FNextButton.Parent := LBottom;
  FNextButton.Left := 586;
  FNextButton.Top := 14;
  FNextButton.Width := 90;
  FNextButton.Caption := 'Next >';
  FNextButton.Default := True;
  FNextButton.OnClick := NextClick;

  FCancelButton := TButton.Create(Self);
  FCancelButton.Parent := LBottom;
  FCancelButton.Left := 682;
  FCancelButton.Top := 14;
  FCancelButton.Width := 80;
  FCancelButton.Caption := 'Cancel';
  FCancelButton.Cancel := True;
  FCancelButton.OnClick := CancelClick;

  LImage := TImage.Create(Self);
  LImage.Parent := FSidePanel;
  LImage.Left := 18;
  LImage.Top := 306;
  LImage.Width := 164;
  LImage.Height := 210;
  LImage.Stretch := True;
  LImage.Proportional := True;
  LImage.Center := True;
  LAsset := PathJoin(FindSourceRoot, PathJoin('Assets', PathJoin('Setup', 'image.bmp')));
  if FileExists(LAsset) then
    LImage.Picture.LoadFromFile(LAsset);
end;

procedure TfrmSetup.BuildWelcomePage(APage: TTabSheet);
var
  LTitle, LText: TLabel;
begin
  LTitle := TLabel.Create(Self);
  LTitle.Parent := APage;
  LTitle.Left := 10;
  LTitle.Top := 14;
  LTitle.Font.Size := 16;
  LTitle.Font.Style := [fsBold];
  LTitle.Caption := 'Welcome to fastTelega';

  LText := TLabel.Create(Self);
  LText.Parent := APage;
  LText.Left := 10;
  LText.Top := 58;
  LText.Width := 520;
  LText.AutoSize := False;
  LText.WordWrap := True;
  LText.Height := 220;
  LText.Caption :=
    'This wizard installs the fastTelega source tree, the Lazarus package, ' +
    'documentation, examples and optional Delphi packages.' + #13#10#13#10 +
    'You can choose the destination and components on the next pages. ' +
    'The installer does not modify your Lazarus configuration; after ' +
    'installation open the package in Lazarus and add it to your project.' +
    #13#10#13#10 +
    'Click Next to continue.';
end;

procedure TfrmSetup.BuildDestinationPage(APage: TTabSheet);
var
  LTitle, LSourceLabel, LDestLabel, LHint: TLabel;
  LSourceBrowse, LDestBrowse: TButton;
begin
  LTitle := TLabel.Create(Self);
  LTitle.Parent := APage;
  LTitle.Left := 10;
  LTitle.Top := 14;
  LTitle.Font.Size := 16;
  LTitle.Font.Style := [fsBold];
  LTitle.Caption := 'Destination';

  LSourceLabel := TLabel.Create(Self);
  LSourceLabel.Parent := APage;
  LSourceLabel.Left := 10;
  LSourceLabel.Top := 62;
  LSourceLabel.Caption := 'fastTelega source tree:';

  FSourceEdit := TEdit.Create(Self);
  FSourceEdit.Parent := APage;
  FSourceEdit.Left := 10;
  FSourceEdit.Top := 82;
  FSourceEdit.Width := 510;

  LSourceBrowse := TButton.Create(Self);
  LSourceBrowse.Parent := APage;
  LSourceBrowse.Left := 530;
  LSourceBrowse.Top := 80;
  LSourceBrowse.Width := 80;
  LSourceBrowse.Caption := 'Browse...';
  LSourceBrowse.OnClick := BrowseSource;

  LDestLabel := TLabel.Create(Self);
  LDestLabel.Parent := APage;
  LDestLabel.Left := 10;
  LDestLabel.Top := 126;
  LDestLabel.Caption := 'Install fastTelega to:';

  FDestEdit := TEdit.Create(Self);
  FDestEdit.Parent := APage;
  FDestEdit.Left := 10;
  FDestEdit.Top := 146;
  FDestEdit.Width := 510;

  LDestBrowse := TButton.Create(Self);
  LDestBrowse.Parent := APage;
  LDestBrowse.Left := 530;
  LDestBrowse.Top := 144;
  LDestBrowse.Width := 80;
  LDestBrowse.Caption := 'Browse...';
  LDestBrowse.OnClick := BrowseDest;

  LHint := TLabel.Create(Self);
  LHint.Parent := APage;
  LHint.Left := 10;
  LHint.Top := 190;
  LHint.Width := 520;
  LHint.AutoSize := False;
  LHint.WordWrap := True;
  LHint.Height := 80;
  LHint.Font.Color := clGray;
  LHint.Caption :=
    'The source tree must contain Source\fastTelega.Bot.pas and ' +
    'Lazarus\fasttelega.lpk. The destination may be a new empty folder.' +
    #13#10#13#10 + 'Default: ' + DefaultInstallDir;

  FUninstallButton := TButton.Create(Self);
  FUninstallButton.Parent := APage;
  FUninstallButton.Left := 10;
  FUninstallButton.Top := 300;
  FUninstallButton.Width := 130;
  FUninstallButton.Caption := 'Uninstall existing...';
  FUninstallButton.OnClick := UninstallClick;
end;

procedure TfrmSetup.BuildComponentsPage(APage: TTabSheet);
var
  LTitle, LText: TLabel;
begin
  LTitle := TLabel.Create(Self);
  LTitle.Parent := APage;
  LTitle.Left := 10;
  LTitle.Top := 14;
  LTitle.Font.Size := 16;
  LTitle.Font.Style := [fsBold];
  LTitle.Caption := 'Components';

  LText := TLabel.Create(Self);
  LText.Parent := APage;
  LText.Left := 10;
  LText.Top := 58;
  LText.Width := 520;
  LText.AutoSize := False;
  LText.WordWrap := True;
  LText.Height := 40;
  LText.Caption := 'Select the optional parts to copy:';

  FDocsCheck := TCheckBox.Create(Self);
  FDocsCheck.Parent := APage;
  FDocsCheck.Left := 10;
  FDocsCheck.Top := 106;
  FDocsCheck.Width := 300;
  FDocsCheck.Caption := 'Documentation (Docs/)';
  FDocsCheck.Checked := True;

  FExamplesCheck := TCheckBox.Create(Self);
  FExamplesCheck.Parent := APage;
  FExamplesCheck.Left := 10;
  FExamplesCheck.Top := 136;
  FExamplesCheck.Width := 300;
  FExamplesCheck.Caption := 'Examples (Examples/)';
  FExamplesCheck.Checked := True;

  FPackagesCheck := TCheckBox.Create(Self);
  FPackagesCheck.Parent := APage;
  FPackagesCheck.Left := 10;
  FPackagesCheck.Top := 166;
  FPackagesCheck.Width := 300;
  FPackagesCheck.Caption := 'Delphi packages (Packages/)';
  FPackagesCheck.Checked := True;

  FLazarusCheck := TCheckBox.Create(Self);
  FLazarusCheck.Parent := APage;
  FLazarusCheck.Left := 10;
  FLazarusCheck.Top := 196;
  FLazarusCheck.Width := 420;
  FLazarusCheck.Caption := 'Register the package in Lazarus';
  FLazarusCheck.Checked := True;

  FLazarusInfo := TLabel.Create(Self);
  FLazarusInfo.Parent := APage;
  FLazarusInfo.Left := 28;
  FLazarusInfo.Top := 220;
  FLazarusInfo.Width := 500;
  FLazarusInfo.AutoSize := False;
  FLazarusInfo.WordWrap := True;
  FLazarusInfo.Height := 40;
  FLazarusInfo.Font.Color := clGray;

  LText := TLabel.Create(Self);
  LText.Parent := APage;
  LText.Left := 10;
  LText.Top := 268;
  LText.Width := 520;
  LText.AutoSize := False;
  LText.WordWrap := True;
  LText.Height := 60;
  LText.Font.Color := clGray;
  LText.Caption :=
    'The library sources, Lazarus package and license files are always installed.';
end;

procedure TfrmSetup.BuildInstallPage(APage: TTabSheet);
var
  LTitle: TLabel;
begin
  LTitle := TLabel.Create(Self);
  LTitle.Parent := APage;
  LTitle.Left := 10;
  LTitle.Top := 14;
  LTitle.Font.Size := 16;
  LTitle.Font.Style := [fsBold];
  LTitle.Caption := 'Ready to install';

  FSummary := TLabel.Create(Self);
  FSummary.Parent := APage;
  FSummary.Left := 10;
  FSummary.Top := 58;
  FSummary.Width := 520;
  FSummary.AutoSize := False;
  FSummary.WordWrap := True;
  FSummary.Height := 90;

  FProgress := TProgressBar.Create(Self);
  FProgress.Parent := APage;
  FProgress.Left := 10;
  FProgress.Top := 160;
  FProgress.Width := 520;
  FProgress.Height := 18;
  FProgress.Style := pbstMarquee;

  FInstallLog := TMemo.Create(Self);
  FInstallLog.Parent := APage;
  FInstallLog.Left := 10;
  FInstallLog.Top := 190;
  FInstallLog.Width := 520;
  FInstallLog.Height := 160;
  FInstallLog.ReadOnly := True;
  FInstallLog.ScrollBars := ssAutoVertical;
  FInstallLog.Lines.Add('Click Install to start.');
end;

procedure TfrmSetup.BuildFinishPage(APage: TTabSheet);
var
  LTitle, LText: TLabel;
  LOpen: TButton;
begin
  LTitle := TLabel.Create(Self);
  LTitle.Parent := APage;
  LTitle.Left := 10;
  LTitle.Top := 14;
  LTitle.Font.Size := 16;
  LTitle.Font.Style := [fsBold];
  LTitle.Caption := 'Installation complete';

  LText := TLabel.Create(Self);
  LText.Parent := APage;
  LText.Left := 10;
  LText.Top := 58;
  LText.Width := 520;
  LText.AutoSize := False;
  LText.WordWrap := True;
  LText.Height := 50;
  LText.Caption :=
    'fastTelega was installed. Open the Lazarus package, build it and add it ' +
    'to your project:';

  FFinishPath := TLabel.Create(Self);
  FFinishPath.Parent := APage;
  FFinishPath.Left := 10;
  FFinishPath.Top := 116;
  FFinishPath.Width := 520;
  FFinishPath.AutoSize := False;
  FFinishPath.WordWrap := True;
  FFinishPath.Height := 60;
  FFinishPath.Font.Style := [fsBold];

  FFinishInfo := TLabel.Create(Self);
  FFinishInfo.Parent := APage;
  FFinishInfo.Left := 10;
  FFinishInfo.Top := 150;
  FFinishInfo.Width := 520;
  FFinishInfo.AutoSize := False;
  FFinishInfo.WordWrap := True;
  FFinishInfo.Height := 40;
  FFinishInfo.Font.Color := clGray;

  LOpen := TButton.Create(Self);
  LOpen.Parent := APage;
  LOpen.Left := 10;
  LOpen.Top := 210;
  LOpen.Width := 130;
  LOpen.Caption := 'Open folder';
  LOpen.OnClick := OpenFolderClick;
end;

procedure TfrmSetup.ShowStep(AStep: Integer);
begin
  if AStep < 0 then
    AStep := 0;
  if AStep > 4 then
    AStep := 4;
  FCurrentStep := AStep;
  FPages.ActivePageIndex := AStep;
  UpdateStepLabels;

  FBackButton.Enabled := (AStep > 0) and (AStep < 4);
  case AStep of
    0: FNextButton.Caption := 'Next >';
    1, 2: FNextButton.Caption := 'Next >';
    3:
      begin
        FNextButton.Caption := 'Install';
        FSummary.Caption :=
          'Source: ' + Trim(FSourceEdit.Text) + #13#10 +
          'Destination: ' + Trim(FDestEdit.Text) + #13#10 +
          'Documentation: ' + BoolToStr(FDocsCheck.Checked, True) + #13#10 +
          'Examples: ' + BoolToStr(FExamplesCheck.Checked, True) + #13#10 +
          'Delphi packages: ' + BoolToStr(FPackagesCheck.Checked, True) + #13#10 +
          'Register in Lazarus: ' + BoolToStr(FLazarusCheck.Checked, True);
      end;
    4:
      begin
        FNextButton.Caption := 'Finish';
        FFinishPath.Caption := PackagePath(Trim(FDestEdit.Text));
      end;
  end;
end;

procedure TfrmSetup.UpdateStepLabels;
var
  I: Integer;
begin
  for I := 0 to 4 do
  begin
    if I = FCurrentStep then
    begin
      FStepLabels[I].Font.Style := [fsBold];
      FStepLabels[I].Font.Color := clWhite;
    end
    else if I < FCurrentStep then
    begin
      FStepLabels[I].Font.Style := [];
      FStepLabels[I].Font.Color := $0080C080;
    end
    else
    begin
      FStepLabels[I].Font.Style := [];
      FStepLabels[I].Font.Color := $00B0B0B0;
    end;
  end;
end;

function TfrmSetup.Options: TSetupOptions;
begin
  Result.SourceRoot := Trim(FSourceEdit.Text);
  Result.InstallDir := Trim(FDestEdit.Text);
  Result.Docs := FDocsCheck.Checked;
  Result.Examples := FExamplesCheck.Checked;
  Result.Packages := FPackagesCheck.Checked;
  Result.InstallLazarus := FLazarusCheck.Checked;
end;

function TfrmSetup.ValidateDestination: Boolean;
var
  LOptions: TSetupOptions;
begin
  LOptions := Options;
  Result := False;
  if not IsSourceRoot(LOptions.SourceRoot) then
  begin
    MessageDlg('Source tree not found. Select the fastTelega repository root.',
      mtError, [mbOK], 0);
    Exit;
  end;
  if LOptions.InstallDir = '' then
  begin
    MessageDlg('Choose an installation directory.', mtError, [mbOK], 0);
    Exit;
  end;
  Result := True;
end;

procedure TfrmSetup.SetBusy(ABusy: Boolean);
begin
  FNextButton.Enabled := not ABusy;
  FCancelButton.Enabled := not ABusy;
  FUninstallButton.Enabled := not ABusy;
  if ABusy then
    FBackButton.Enabled := False
  else
    ShowStep(FCurrentStep);
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
end;

procedure TfrmSetup.BrowseSource(Sender: TObject);
var
  LDialog: TSelectDirectoryDialog;
begin
  LDialog := TSelectDirectoryDialog.Create(Self);
  try
    if DirectoryExists(FSourceEdit.Text) then
      LDialog.InitialDir := FSourceEdit.Text;
    if LDialog.Execute then
      FSourceEdit.Text := LDialog.FileName;
  finally
    LDialog.Free;
  end;
end;

procedure TfrmSetup.BrowseDest(Sender: TObject);
var
  LDialog: TSelectDirectoryDialog;
begin
  LDialog := TSelectDirectoryDialog.Create(Self);
  try
    if DirectoryExists(FDestEdit.Text) then
      LDialog.InitialDir := FDestEdit.Text;
    if LDialog.Execute then
      FDestEdit.Text := LDialog.FileName;
  finally
    LDialog.Free;
  end;
end;

procedure TfrmSetup.InstallNow;
var
  LError, LOut: String;
begin
  SetBusy(True);
  try
    FInstallLog.Lines.Add('Installing to ' + Trim(FDestEdit.Text) + ' ...');
    FProgress.Style := pbstMarquee;
    if Install(Options, LError) then
    begin
      FInstallLog.Lines.Add('Files installed.');
      if FLazarusCheck.Checked then
      begin
        if RegisterLazarusPackage(PackagePath(Trim(FDestEdit.Text)),
          LOut, LError) then
        begin
          FInstallLog.Lines.Add('Lazarus package registered.');
          FFinishInfo.Caption := 'The package was registered in Lazarus.';
        end
        else
        begin
          FInstallLog.Lines.Add('Lazarus registration warning: ' + LError);
          FFinishInfo.Caption := 'Package copied but not registered: ' + LError;
        end;
      end
      else
        FFinishInfo.Caption := 'Lazarus registration was skipped.';
      FInstallLog.Lines.Add('Package: ' + PackagePath(Trim(FDestEdit.Text)));
      ShowStep(4);
    end
    else
    begin
      FInstallLog.Lines.Add('Error: ' + LError);
      MessageDlg('Installation failed: ' + LError, mtError, [mbOK], 0);
    end;
  finally
    SetBusy(False);
  end;
end;

procedure TfrmSetup.BackClick(Sender: TObject);
begin
  if FCurrentStep > 0 then
    ShowStep(FCurrentStep - 1);
end;

procedure TfrmSetup.NextClick(Sender: TObject);
begin
  case FCurrentStep of
    0: ShowStep(1);
    1:
      if ValidateDestination then
        ShowStep(2);
    2: ShowStep(3);
    3: InstallNow;
    4: Close;
  end;
end;

procedure TfrmSetup.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.UninstallClick(Sender: TObject);
var
  LError, LDir: String;
begin
  LDir := Trim(FDestEdit.Text);
  if not DirectoryExists(LDir) then
  begin
    MessageDlg('Directory does not exist.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if MessageDlg('Remove ' + LDir + '?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  SetBusy(True);
  try
    if Uninstall(LDir, LError) then
      MessageDlg('fastTelega removed.', mtInformation, [mbOK], 0)
    else
      MessageDlg('Uninstall failed: ' + LError, mtError, [mbOK], 0);
  finally
    SetBusy(False);
  end;
end;

procedure TfrmSetup.OpenFolderClick(Sender: TObject);
begin
  OpenDocument(ExtractFileDir(PackagePath(Trim(FDestEdit.Text))));
end;

end.
