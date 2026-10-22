program fastTelegaDesignerBotMVC;

uses
  Vcl.Forms,
  Main in 'GUI\Main.pas' {FormDesignerBot},
  fastTelega.ftModelBase in 'Models\Base\fastTelega.ftModelBase.pas',
  fastTelega.ftViewBase in 'Views\Base\fastTelega.ftViewBase.pas',
  fastTelega.ftControllerBase in 'Controllers\Base\fastTelega.ftControllerBase.pas',
  fastTelega.ftCardSettingsTextEditorModel in 'Models\CardSettings\TextEditor\fastTelega.ftCardSettingsTextEditorModel.pas',
  fastTelega.ftCardSettingsController in 'Controllers\CardSettings\fastTelega.ftCardSettingsController.pas',
  fastTelega.ftCardSettingsTextEditorView in 'Views\CardSettings\TextEditor\fastTelega.ftCardSettingsTextEditorView.pas',
  fastTelega.ftCardSettingsTextEditorController in 'Controllers\CardSettings\TextEditor\fastTelega.ftCardSettingsTextEditorController.pas',
  fastTelega.ftCardView in 'Views\Card\fastTelega.ftCardView.pas',
  fastTelega.ftLineLinkView in 'Views\LineLink\fastTelega.ftLineLinkView.pas',
  fastTelega.ftMenuItemLinkView in 'Views\MenuItemLink\fastTelega.ftMenuItemLinkView.pas',
  fastTelega.ftCardController in 'Controllers\Card\fastTelega.ftCardController.pas',
  fastTelega.ftMenuItemLinkController in 'Controllers\MenuItemLink\fastTelega.ftMenuItemLinkController.pas',
  fastTelega.ftMenuItemLinkModel in 'Models\MenuItemLink\fastTelega.ftMenuItemLinkModel.pas',
  fastTelega.ftCardModel in 'Models\Card\fastTelega.ftCardModel.pas',
  fastTelega.ftCardSettingsModel in 'Models\CardSettings\fastTelega.ftCardSettingsModel.pas',
  fastTelega.ftCardSettingsInfoController in 'Controllers\CardSettings\Sections\Info\fastTelega.ftCardSettingsInfoController.pas',
  fastTelega.ftCardSettingsAdditionalView in 'Views\CardSettings\Sections\Additional\fastTelega.ftCardSettingsAdditionalView.pas',
  fastTelega.ftCardSettingsInfoView in 'Views\CardSettings\Sections\Info\fastTelega.ftCardSettingsInfoView.pas',
  fastTelega.ftCardSettingsView in 'Views\CardSettings\fastTelega.ftCardSettingsView.pas',
  fastTelega.ftCardSettingsAdditionalController in 'Controllers\CardSettings\Sections\Additional\fastTelega.ftCardSettingsAdditionalController.pas',
  fastTelega.ftCardSettingsMenuController in 'Controllers\CardSettings\Sections\Menu\fastTelega.ftCardSettingsMenuController.pas',
  fastTelega.ftCardSettingsMenuItemController in 'Controllers\CardSettings\Sections\Menu\fastTelega.ftCardSettingsMenuItemController.pas',
  fastTelega.ftCardSettingsMenuItemView in 'Views\CardSettings\Sections\Menu\fastTelega.ftCardSettingsMenuItemView.pas',
  fastTelega.ftCardSettingsMenuView in 'Views\CardSettings\Sections\Menu\fastTelega.ftCardSettingsMenuView.pas',
  fastTelega.ftCardSettingsMessageTextController in 'Controllers\CardSettings\Sections\Messages\fastTelega.ftCardSettingsMessageTextController.pas',
  fastTelega.ftCardSettingsMessageTextView in 'Views\CardSettings\Sections\Messages\fastTelega.ftCardSettingsMessageTextView.pas',
  fastTelega.ftPlotGrid in 'ftControls\fastTelega.ftPlotGrid.pas',
  fastTelega.ftMessageChainCardModel in 'Models\Card\fastTelega.ftMessageChainCardModel.pas',
  fastTelega.ftSimpleMessageCardModel in 'Models\Card\fastTelega.ftSimpleMessageCardModel.pas',
  fastTelega.ftStartCardModel in 'Models\Card\fastTelega.ftStartCardModel.pas',
  fastTelega.ftCardSettingsAdditionalModel in 'Models\CardSettings\Sections\Additional\fastTelega.ftCardSettingsAdditionalModel.pas',
  fastTelega.ftCardSettingsInfoModel in 'Models\CardSettings\Sections\Info\fastTelega.ftCardSettingsInfoModel.pas',
  fastTelega.ftCardSettingsMenuItemModel in 'Models\CardSettings\Sections\Menu\fastTelega.ftCardSettingsMenuItemModel.pas',
  fastTelega.ftCardSettingsMenuModel in 'Models\CardSettings\Sections\Menu\fastTelega.ftCardSettingsMenuModel.pas',
  fastTelega.ftCardSettingsMessageTextModel in 'Models\CardSettings\Sections\Messages\fastTelega.ftCardSettingsMessageTextModel.pas',
  fastTelega.ftSerializeController in 'Controllers\fastTelega.ftSerializeController.pas',
  fastTelega.ftDesignerBotController in 'Controllers\DesignerBot\fastTelega.ftDesignerBotController.pas',
  fastTelega.ftDesignerBotModel in 'Models\DesignerBot\fastTelega.ftDesignerBotModel.pas',
  fastTelega.ftDesignerBotView in 'Views\DesignerBot\fastTelega.ftDesignerBotView.pas',
  fastTelega.ftLineLinkModel in 'Models\LineLink\fastTelega.ftLineLinkModel.pas',
  fastTelega.ftLineLinkController in 'Controllers\LineLink\fastTelega.ftLineLinkController.pas',
  fastTelega.ftPluginManager in 'PluginAPI\Core\fastTelega.ftPluginManager.pas',
  fastTelega.ftPluginAPI in 'PluginAPI\Headers\fastTelega.ftPluginAPI.pas',
  fastTelega.ftKeybordEmoji in 'ftControls\fastTelega.ftKeybordEmoji.pas',
  FMX.fastTelega.ftKeybordEmoji in 'ftControls\FMX.fastTelega.ftKeybordEmoji.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDesignerBot, FormDesignerBot);
  Application.Run;
end.
