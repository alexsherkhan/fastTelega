object FormDesignerBot: TFormDesignerBot
  Left = 0
  Top = 0
  Caption = 'fastTelegaDesignerBotMVC'
  ClientHeight = 562
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 120
    Top = 30
    Height = 510
    ExplicitLeft = 186
    ExplicitTop = 29
    ExplicitHeight = 511
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1028
    Height = 30
    ButtonHeight = 30
    ButtonWidth = 30
    Caption = 'ToolBar1'
    Images = VirtualImageList1
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 13
      ImageName = 'file-plus'
      ParentShowHint = False
      ShowHint = False
    end
    object ToolButton2: TToolButton
      Left = 30
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 12
      ImageName = 'folder-open'
    end
    object ToolButton3: TToolButton
      Left = 60
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 10
      ImageName = 'content-save'
    end
    object ToolButton4: TToolButton
      Left = 90
      Top = 0
      Caption = 'ToolButton4'
      ImageIndex = 11
      ImageName = 'content-save-all'
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 540
    Width = 1028
    Height = 22
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 30
    Width = 120
    Height = 510
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 120
      Height = 25
      Align = alTop
      Caption = #1057#1094#1077#1085#1072#1088#1080#1080
      ImageIndex = 14
      ImageName = 'family-tree'
      Images = VirtualImageList1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 0
      Top = 25
      Width = 120
      Height = 25
      Align = alTop
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103
      ImageIndex = 15
      ImageName = 'message-text'
      Images = VirtualImageList1
      TabOrder = 1
    end
    object Button3: TButton
      Left = 0
      Top = 50
      Width = 120
      Height = 25
      Align = alTop
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 16
      ImageName = 'cog'
      Images = VirtualImageList1
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 0
      Top = 75
      Width = 120
      Height = 25
      Align = alTop
      Caption = #1057#1087#1080#1089#1082#1080
      ImageIndex = 17
      ImageName = 'server'
      Images = VirtualImageList1
      TabOrder = 3
    end
    object Button5: TButton
      Left = 0
      Top = 125
      Width = 120
      Height = 25
      Align = alTop
      Caption = 'Emoji'
      ImageIndex = 22
      ImageName = 'emoticon-cool-outline'
      Images = VirtualImageList1
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 0
      Top = 100
      Width = 120
      Height = 25
      Align = alTop
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      ImageIndex = 18
      ImageName = 'chart-areaspline'
      Images = VirtualImageList1
      TabOrder = 5
    end
    object Memo1: TMemo
      Left = 0
      Top = 150
      Width = 120
      Height = 99
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      TabOrder = 6
    end
    object CheckBox1: TCheckBox
      Left = 0
      Top = 249
      Width = 120
      Height = 17
      Align = alTop
      Caption = 'ColorEmoji'
      TabOrder = 7
      OnClick = CheckBox1Click
    end
  end
  object pnSettingsBot: TPanel
    Left = 123
    Top = 30
    Width = 905
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    object TabControl1: TTabControl
      Left = 0
      Top = 0
      Width = 905
      Height = 510
      Align = alClient
      TabOrder = 0
      Tabs.Strings = (
        #1054#1089#1085#1086#1074#1085#1099#1077
        #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086)
      TabIndex = 0
      OnChange = TabControl1Change
      object Panel3: TPanel
        Left = 4
        Top = 26
        Width = 897
        Height = 480
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 0
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 232
          Height = 478
          Align = alLeft
          Caption = 'Panel2'
          TabOrder = 0
          object Label4: TLabel
            Left = 1
            Top = 1
            Width = 230
            Height = 15
            Align = alTop
            Alignment = taRightJustify
            Caption = 'Label1'
            ExplicitLeft = 197
            ExplicitWidth = 34
          end
        end
        object Panel4: TPanel
          Left = 233
          Top = 1
          Width = 272
          Height = 478
          Align = alLeft
          Caption = 'Panel4'
          TabOrder = 1
          object Edit1: TEdit
            Left = 1
            Top = 1
            Width = 270
            Height = 23
            Align = alTop
            TabOrder = 0
            Text = 'Edit1'
          end
        end
      end
    end
  end
  object pnScript: TPanel
    Left = 123
    Top = 30
    Width = 905
    Height = 510
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
  end
  object MainMenu1: TMainMenu
    Images = VirtualImageList1
    Left = 704
    Top = 8
    object Fi1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
        ImageIndex = 13
        ImageName = 'file-plus'
        ShortCut = 16462
      end
      object Open1: TMenuItem
        Caption = 'Open'
        ImageIndex = 12
        ImageName = 'folder-open'
        ShortCut = 16463
      end
      object Save1: TMenuItem
        Caption = 'Save'
        ImageIndex = 10
        ImageName = 'content-save'
        ShortCut = 16467
      end
      object SaveAs1: TMenuItem
        Caption = 'Save As...'
        ImageIndex = 11
        ImageName = 'content-save-all'
        ShortCut = 12371
      end
      object N1: TMenuItem
        Caption = 'Exit'
      end
    end
    object About1: TMenuItem
      Caption = 'About'
    end
  end
  object ImageCollection1: TImageCollection
    Images = <
      item
        Name = 'message'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000005B494441544889ED94310A00210CC0A2BF133FE56FF5173A09821507
              DBE18E06BA7448E852F81319A8407F9C0A2429A0215F23008425D01FAE970800
              5159BAE1010F78C003679AB4D4FCA4F916284A97880113F90C98C9B1967F9701
              0561432A0D4DB15B0000000049454E44AE426082}
          end>
      end
      item
        Name = 'message-video'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F800000095494441544889DD94CB0D802010441F1EECC1522CC1D087B661699E
              2C456D412F7A22F1830201A2320917B2332FBB1B8094248111583DCF08543A40
              88F03D0400B103AC1EDDEB2400B2C0A1173D0184E1282D4063033BCFD1A67E00
              4A5BBF2BA0070A17BF2B20B7F1BFBA64933A8E2332EA734B56753350DFF9D37E
              C93E9A7497217F526902B4813AD102A2842B40B4706287FF571B01B776B79CF3
              58470000000049454E44AE426082}
          end>
      end
      item
        Name = 'microphone-message'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000E2494441544889E5944D0A824018861F85BC80AD3C418708BA40B4AB
              6819788F6E26B86CEB195A68BBF6812D7A85411C9D7188881E90F9FBE67D07BF
              6F06FE912D5003ADE5AB15339B3171D30480688641EB181701C4330CBCF8AA41
              97CCE0A4D93093595BE627933C467F53C754993E815D88C1100BE021F1BD8BB8
              AFC15AE20757715F830B70F411F73558B908DE2594693C544599C68DEB29CD7B
              50A9DDA8CD25D4A86FAE55CC20D7E96E403AB09E6AAD350CBD8881AB6172E2FD
              4B32F53BF12B014FCC1228B15FA252314124C019280CE1427349A8781F97121D
              E5E3CFF5EFF302127B69DA43C3E0D70000000049454E44AE426082}
          end>
      end
      item
        Name = 'camera-gopro'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000009E494441544889ED94D10D83300C441FCC03937402E6600D18888512
              B6801F232C08D869F86A39C9B2239FEE12C509BCF82B7C80082C4658DC28FD13
              3CE24B823B0183646D728216B0FA5BDD1D38DD9D4EAEC124750F04C9B09FA4D8
              60903AC83AC87AD43AF58DA085560946C9008D678756BFE80EBE99A2918C297A
              F41D5407030F2A9B92267B0DB2B44BA6C8056D303FA89BD4F27E76565C7E762F
              7E142BC52E823457EE03BB0000000049454E44AE426082}
          end>
      end
      item
        Name = 'file-document'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000007C494441544889EDD5C10D80200C85E15FE320CE631CCA513DE21478
              F0245178B4311AE24B7AA41FA507A0C5CC400062A1162BA0345F3D48A9790446
              0FA2007810153023358009A90552E49441116F2E21A53702721E07724FD455F6
              BA7CB65727901799CBE777509CF2DF8109D81CFDA4B313DAAF9656E0F86E1BCB
              0ED80D63050C0C28270000000049454E44AE426082}
          end>
      end
      item
        Name = 'image'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000AE494441544889EDD52B0EC2401845E18F870189222C01C92E089605
              34613DEC01CB065800162C1A593C01643184344DA7614A83A12719F377EE3D53
              312D2D912C9022ABB952CCAB04DF94E7256F3A054116F9C621DEBDDD860A83B4
              825610E48A25EEB1C1B28B732C992D5FFB9340E663C10E3D6C73B37521B3A92B
              3863F49A0F70C01EFD42668853ACE08159E1D904E3406E8A5B8C6055B5294052
              26F8F9C7EED240796547133F9C450387FC279E931A691814F1790A0000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'id-card'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F800000071494441544889636018058309783330303C676060F84F217E0E350B
              0350C370644B30004C925280620E13150CC40B86BE052C58C4A8110F7030203E
              6044E3FFC7218E0BA08400CD7D80EC2AAA863DCCEC411107B800AEB8A16F1C20
              5BF002C905C460061CEA91CD4201342FAE47C1C000009A69523F78E85A340000
              000049454E44AE426082}
          end>
      end
      item
        Name = 'format-bold'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000C4494441544889ED92310AC24010459F6225045BF1009EC0D4D6DA88
              9DDE462FE029F4028260E5093C828D55D28ABDB17023C3E2C4D92582451E2CCC
              32C9FF1FF643C3BF5328E7069C80F1AF0CCAF300E655022D8341C95ACC2360EA
              FECF8181F7AD1999D6E72076434DA01DE3FA21C45D5B76028456624E81899B8F
              40161CCBF1ED912F402F56DC6250009B2A81D81625C082577B0066C0DE9ADA37
              D05A948ADD4E13A8A345005D6D11DBA204588AFB3930D01BCB235F9D61ED0639
              B005FAB1E20D0D369EC1864F1EAA4DFC450000000049454E44AE426082}
          end>
      end
      item
        Name = 'format-italic'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000008E494441544889ED94B10D80300CC00C33E28B1EC319CCDCC3CC171C
              C3170866C210901048D054450CD473E3B46912487C4D66382B21AEDC902088D7
              13582981092DD708144F01D617D4076907CCC6F85B3260406FBF002EA61CA0DA
              E402F4B1E56CD23D41155BEED0B2085A26EFF9F1FDE4E6206D791E3A1305DA92
              82B6686909BE7B6AD06A38F3BF5591485C5901DA3A17FDFD4004B40000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'format-strikethrough-variant'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F800000142494441544889DDD5BF2B45611807F00FB7FC1809AB49EA66106262
              60930C06AB6256CA6AB5F92B0C4A26A50C06933F804416BF8B74910C48378673
              E8783BD7BD4724BEF50CEFD3F7F97E9F9EF739E7E5875195915B833AE470F31D
              0D346006ABB8C54B224EB188FC57C5C7711588A6C533A6B38AF7A35881783286
              B3186C04C5179842175A31829D80B399C5E03E281E48E134A110F0DA43527509
              836270DE4FE114B08C239CE04C860BDF0A3A5B906DA5DF912B91AF4507EEE2C8
              C7718ECBAF18FD5DBCCDF5E5A7F44B6DD1AF6310C73E6EDA7A1A316DF546D129
              FA168A58C36E0AAF39CEB7C4E7EB385776DCF34167739F70D7036E7D3971E809
              8A0E135D26D188C704EFB61271A2B1EDA5984CA00DDD98C441C059AAD4007AF1
              14087C160FB17926F4C59D9713BFC65056F137D4610C2BD816BD704FA2E7720B
              B3A2DFF63FC62BC35283822743F8760000000049454E44AE426082}
          end>
      end
      item
        Name = 'content-save'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F800000093494441544889ED94C10980300C45BFE212762371055DA3BDBA6D67
              D08B1E4CBD9886A44510F4412E9F348F3628F06364001001ECC65AB48292E126
              496AD66296D40A6E928639C0E59280E33ADF2A0715D36572CB33893C7E83EF08
              36000180A30A9499C97DA59EE9F542BF59D033BD4E2378CD0E66269B4A84B92B
              AF38DF3C2DD95366DE41CDEF3A55940463A524D28C1F3D0736AF7BF3B19AC0C1
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'content-save-all'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000AB494441544889E5954D0E832010851FC653E08D4CAFE03960D9E3E2
              15EAA22E1CBAA030CE40D526BE6442320E7CF8F8032ED2034000F056C6530AA8
              195C0589C552A921AD800FC4301DB8EFA5FA54A6130E50AD3E99413A638D4D59
              1DFE07F7032C003C8081C2536E57E9BE2F9D5297E9EB987A35C066009603FCDD
              1A4CC2DC97A416BDB0796E291CE5D46BD0725DC7081C606C84046C8F5611F033
              9DB68B666A6B2DD955ED237F98B562AD6249A703C5CE924D0000000049454E44
              AE426082}
          end>
      end
      item
        Name = 'folder-open'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000AE494441544889ED94BB0AC24010458F9A426BFD14FB808F46FCA87C
              584A5BBBD401BBFC8156AEC5B21264B2BB6146B4C881A902F7702F4B60E29F38
              031DE006AED20A62E126925478CE75F825BE2608923785209A8DEA9D606E1936
              46B004EEE8A67A029B7E68F800B057863BE01A6B70CC689FA28E090E56823EA1
              DA1ABF9F669E07B01A6AB043FF542FF847220ACCF6FF24D46BD1CDE380AD24C8
              F9D9E5DC0D5848829381A4014A297CE277BC00C76AA90BFA31406E0000000049
              454E44AE426082}
          end>
      end
      item
        Name = 'file-plus'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000A2494441544889EDD5BD0D83301086E1373F5D4466489B0DC200542C
              C51CB05CBA30459C2605A033FE38C70DCA279D2C21DF3D96B064D8635AE00584
              44755E4019FECC4152C30370CB4114801C4405DCC816C0856C0596C82C67458C
              1C42CAD109C8F9030118801AB80217B549A91168BCA74AD5DB181EBBC22E6058
              E9FB09F0280D54E25EF72D3AA91B2D6014FAEEDFF5302956BECDA23C99BDD127
              FF036F8A03663EB5BC9DA16A368FF10000000049454E44AE426082}
          end>
      end
      item
        Name = 'family-tree'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000F0494441544889CD95310AC24010459F9236E400DE420B41B0B0B6B0
              4F95DE805EC70BD8072CEDECB4D333482E60BF16FEE0A259DD980DF8E1B393CF
              9F996C76D8C01F2107AE621EBAF80430C04E34D28261ADA203D1002B9FC4C8B3
              C141EBA6460B868CC79B1BC59DA06AE08DBE439F03A555F0B5F0AB5E2AC71B75
              C5BFB1F42D1E5B4971687F025CAC84B3B4507E521967A291F6CD3F16DFFCAE43
              EE0C098F6D36F9444DFC408787EC9A7DD78C37F57F9CFDBA196FEA775E03ADF4
              6A8A32CB103C1EA9E35E34C0D0D20BF1273D02A66AB4D07A93D6D373DA468F80
              A384C2DADEC98AB721F425CF1FFAD23284D2BBC31DEB16943DA9D78DF5000000
              0049454E44AE426082}
          end>
      end
      item
        Name = 'message-text'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F800000073494441544889ED94410AC0200C04C7E2EFFAA9FED6FE422F2D040C
              684942B174C08BC86E7685C097D8810254E32997568787B834012009836A48AF
              91003667D18E3C9AE0016A03AF2670F993BF2293C1A8A2A901D6AF283C4194C1
              A95D7A6E52755DCB47875312D52044FC360813275A7C5D1AF4D449355A880031
              0000000049454E44AE426082}
          end>
      end
      item
        Name = 'cog'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F800000139494441544889E5953F4A434110C67F510981280882B616DA2B2868
              63676595C2D2778DA4F110C12E5D6CBD8106045B453D809014C91D0C24C6C209
              59263BBB63D042FC608B37FBFD99B78F9D07FF057560A256DD235C7206EC476A
              7B3F19B0E3AC6551021E800E700E6C0157C088F9231AC9DEA6703BA22DA5020A
              65F21131D64B730ACB7C1518380C736B0054A7A6CB41C025709678BB1E70033C
              031BC0BAC15B03C6C0BDDEB8008646576DA012702B528B71DFC52B8A43E93414
              74957918D255DC1E7060994FD150A25682DB52DC8626C4EEC124D7410259ED31
              D067F123EA03479679C1F73EF2B5C11D127CE49540B40B9413E127C09D3C9F02
              DB06B72C5E73F8958B16EB34248F1D869A638E0A980DBB5BA0C6D78D6D620FBB
              A6706AA2C90E3B0B4F9180478FD0FB3F7873D6160E7889D45E9DDA3F8E4F8A26
              AA60AFDB22750000000049454E44AE426082}
          end>
      end
      item
        Name = 'server'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000594944415448896360A03338C9C0C0F09F42BC1FD94046340BFE53C9
              A1707399F0286044E393057059403540F7203A4005C3A961C62006FB1928CF07
              27910D1CCD0704C190CC07A7A860C62006A3F900038CE6036C80BEF90000AD76
              3F1E48D41A560000000049454E44AE426082}
          end>
      end
      item
        Name = 'chart-areaspline'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000015C494441544889ED943B4B03411446CF6E2C34C4462B5190A09D0856
              225641B4B0B349E7A31384FC0041AC44ECB5B312C1CA881682B595081606B5B4
              B08945C4462211C4B5D82F385967647CC42A172E33F7BB8FB3DC818596355A08
              E481942D19C97F630B9A71DC0C402770AF19B3CD006CA8FF8C7855DE80103801
              0A409B63F800F0A2FE51D717B800F346EE0A98B0D41C2ABFA378D0179001CAD2
              1F8D9A0320AB9A49694F408FB4235FC0BAB40B200DAC00556935600DB856BCAC
              9E29CB1C2B20AB2111306EE8BDC0AE511F01B7403BF11BDDF8028A8AF714F703
              39233F069CAB66465AC132C70AC8E95E05FAA4ED4B2BF2B1FF10980602A09BC6
              77720252C0A5EEAB0960DD6BC4EF9331FAB712354EC0A2CE3BA08378AFA54473
              DDCBC01C300CBCFA022A3AF3D2971CC34D7FB6684E40049C12EFB50B78F000D8
              DC09780346A46DFE70F897806DC5437CDEEBB7014102F0971680E3B7DAB27FB5
              7789F6B2E27C109A180000000049454E44AE426082}
          end>
      end
      item
        Name = 'content-copy'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000000634944415448896360A023F066606078CEC0C0F09F444C3420C77092
              2C205903318089DA069262013971F21CAA0F2B400F2272E3E439B11690132718
              7A06340E462D18B560A458C082C466A48505433F8806D48217509AD4EAF30503
              9180EA150E4D0000DF8F5B52F1B55FB90000000049454E44AE426082}
          end>
      end
      item
        Name = 'delete'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000005B4944415448896360180554000A0C0C0C0F181818FEA3E1075039BC
              801187F87F321D83611E1399060D1E802B881818480F26AC66D13C88462D18B5
              60D482E16EC10B12CC21452D1C783330303C67C0AC68D0F173A8DA51401E0000
              8EF614455CB856ED0000000049454E44AE426082}
          end>
      end
      item
        Name = 'dots-horizontal'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000003B49444154488963601805A360140C4FE0C3C0C0F0028A7D2810C709
              5E303030FC87E2171488333030303030116323B501CD8368148C825130D40000
              A72F19DD2D336F0C0000000049454E44AE426082}
          end>
      end
      item
        Name = 'emoticon-cool-outline'
        SourceImages = <
          item
            Image.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F8000001A1494441544889DDD54F6A14511006F05F1CCC048681719D952B6184
              20F10242545C04140CF421746192734C367A015DE8155C089E208BC00866C89F
              3B986C9208ED62EAD1CF4ECFF41870930F8A9EA9FAAA5E7555BD6A6E3BBA28F0
              05139C874C425704E746D8C209CA163909EEC2E8602F0B70846DACE35EC87AE8
              8E32DE5EF8B62205FF8D5DDC69496637B825466DC1B78278858D45B2096C844F
              694EB9BA380DD2CE3F044FD851F564B98950686FE8A252A4A0797D5FDD20EB59
              78D9A49CC4E98F703023B3FB214DB683F02D71D874C07918077888E35A80F719
              F743CD761C3E83F87F96884BB5037AE8C7EFBB788107D8C7F78CBB8427781CD9
              7E359DA23E7E857F7F5689864DAFB720866A25CA9BBC1FCF6735A74D7CC36AA6
              5B0DDD668DFBBC16EB2FA4311DABAEFC0A7EAA6A7DAABA2B65D85682DBC10FB5
              31CDD1552DB737997E804FB8C8025FE063D812DE6AB96854ABE2D2F555D1C35A
              48AF667B1A3E255ECF0A9E9096DD6564356F43768293F650EBB24B4E235539C6
              78673A21FD9061E8C6196FD492CC35FCB70F4E8E65D389F86C3ADB672187A12B
              CC69E8EDC01FC697A32C900CEE360000000049454E44AE426082}
          end>
      end>
    Left = 776
    Top = 8
  end
  object VirtualImageList1: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'message'
        Name = 'message'
      end
      item
        CollectionIndex = 1
        CollectionName = 'message-video'
        Name = 'message-video'
      end
      item
        CollectionIndex = 2
        CollectionName = 'microphone-message'
        Name = 'microphone-message'
      end
      item
        CollectionIndex = 3
        CollectionName = 'camera-gopro'
        Name = 'camera-gopro'
      end
      item
        CollectionIndex = 4
        CollectionName = 'file-document'
        Name = 'file-document'
      end
      item
        CollectionIndex = 5
        CollectionName = 'image'
        Name = 'image'
      end
      item
        CollectionIndex = 6
        CollectionName = 'id-card'
        Name = 'id-card'
      end
      item
        CollectionIndex = 7
        CollectionName = 'format-bold'
        Name = 'format-bold'
      end
      item
        CollectionIndex = 8
        CollectionName = 'format-italic'
        Name = 'format-italic'
      end
      item
        CollectionIndex = 9
        CollectionName = 'format-strikethrough-variant'
        Name = 'format-strikethrough-variant'
      end
      item
        CollectionIndex = 10
        CollectionName = 'content-save'
        Name = 'content-save'
      end
      item
        CollectionIndex = 11
        CollectionName = 'content-save-all'
        Name = 'content-save-all'
      end
      item
        CollectionIndex = 12
        CollectionName = 'folder-open'
        Name = 'folder-open'
      end
      item
        CollectionIndex = 13
        CollectionName = 'file-plus'
        Name = 'file-plus'
      end
      item
        CollectionIndex = 14
        CollectionName = 'family-tree'
        Name = 'family-tree'
      end
      item
        CollectionIndex = 15
        CollectionName = 'message-text'
        Name = 'message-text'
      end
      item
        CollectionIndex = 16
        CollectionName = 'cog'
        Name = 'cog'
      end
      item
        CollectionIndex = 17
        CollectionName = 'server'
        Name = 'server'
      end
      item
        CollectionIndex = 18
        CollectionName = 'chart-areaspline'
        Name = 'chart-areaspline'
      end
      item
        CollectionIndex = 19
        CollectionName = 'content-copy'
        Name = 'content-copy'
      end
      item
        CollectionIndex = 20
        CollectionName = 'delete'
        Name = 'delete'
      end
      item
        CollectionIndex = 21
        CollectionName = 'dots-horizontal'
        Name = 'dots-horizontal'
      end
      item
        CollectionIndex = 22
        CollectionName = 'emoticon-cool-outline'
        Name = 'emoticon-cool-outline'
      end>
    ImageCollection = ImageCollection1
    Left = 856
    Top = 8
  end
end
