object ftFormDesignerBot: TftFormDesignerBot
  Left = 0
  Top = 0
  Caption = 'ftFormDesignerBot'
  ClientHeight = 633
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object sbCardSettings: TScrollBox
    Left = 448
    Top = 0
    Width = 366
    Height = 633
    Align = alRight
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    object lbTitle: TLabel
      Left = 0
      Top = 44
      Width = 345
      Height = 21
      Align = alTop
      Caption = #1062#1077#1087#1086#1095#1082#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 165
    end
    object gbMenu: TGroupBox
      Left = 0
      Top = 529
      Width = 345
      Height = 88
      Align = alTop
      Caption = #1052#1077#1085#1102
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 0
      object Button11: TButton
        Left = 2
        Top = 61
        Width = 341
        Height = 25
        Align = alBottom
        Caption = '+ '#1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1074#1077#1090
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 2
        Top = 17
        Width = 341
        Height = 24
        Align = alTop
        TabOrder = 1
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 15
          Height = 22
          Align = alLeft
          Caption = '---'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object Edit3: TEdit
          Left = 16
          Top = 1
          Width = 188
          Height = 22
          Align = alClient
          Enabled = False
          TabOrder = 0
          Text = #1051#1102#1073#1072#1103' '#1076#1088#1091#1075#1072#1103' '#1092#1088#1072#1079#1072
          ExplicitHeight = 23
        end
        object btBack: TButton
          Left = 288
          Top = 1
          Width = 52
          Height = 22
          Align = alRight
          Caption = #1053#1072#1079#1072#1076
          TabOrder = 1
          Visible = False
        end
        object Button5: TButton
          Left = 204
          Top = 1
          Width = 28
          Height = 22
          Align = alRight
          Caption = '<'
          TabOrder = 2
          OnClick = Button5Click
        end
        object btBegin: TButton
          Left = 232
          Top = 1
          Width = 56
          Height = 22
          Align = alRight
          Caption = #1053#1072#1095#1072#1083#1086
          TabOrder = 3
          Visible = False
        end
      end
    end
    object gbAdditional: TGroupBox
      Left = 0
      Top = 617
      Width = 345
      Height = 78
      Align = alTop
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 1
      object CheckBox1: TCheckBox
        Left = 2
        Top = 51
        Width = 341
        Height = 17
        Align = alTop
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1081' '#1079#1072#1087#1088#1086#1089
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Left = 2
        Top = 34
        Width = 341
        Height = 17
        Align = alTop
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1086#1090#1074#1077#1090' '#1074' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1091#1102' '#1087#1077#1088#1077#1084#1077#1085#1085#1091#1102
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 2
        Top = 17
        Width = 341
        Height = 17
        Align = alTop
        Caption = #1054#1090#1074#1077#1090' '#1094#1080#1092#1088#1072#1084#1080
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 65
      Width = 345
      Height = 317
      Align = alTop
      TabOrder = 2
      object Memo1: TMemo
        Left = 1
        Top = 1
        Width = 343
        Height = 96
        Align = alTop
        Lines.Strings = (
          #1055#1088#1080#1074#1077#1090'!')
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 1
        Top = 97
        Width = 343
        Height = 41
        Align = alTop
        TabOrder = 1
        object SpeedButton1: TSpeedButton
          Left = 81
          Top = 1
          Width = 40
          Height = 39
          Align = alLeft
          ImageIndex = 9
          ImageName = 'format-strikethrough-variant'
          Images = VirtualImageList1
          ExplicitLeft = 121
        end
        object SpeedButton2: TSpeedButton
          Left = 41
          Top = 1
          Width = 40
          Height = 39
          Align = alLeft
          ImageIndex = 8
          ImageName = 'format-italic'
          Images = VirtualImageList1
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object SpeedButton3: TSpeedButton
          Left = 1
          Top = 1
          Width = 40
          Height = 39
          Align = alLeft
          ImageIndex = 7
          ImageName = 'format-bold'
          Images = VirtualImageList1
        end
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 138
        Width = 343
        Height = 178
        Align = alClient
        TabOrder = 2
        object ButtonGroup2: TButtonGroup
          Left = 2
          Top = 17
          Width = 339
          Height = 110
          Align = alTop
          BorderStyle = bsNone
          ButtonHeight = 35
          ButtonWidth = 110
          Images = VirtualImageList1
          Items = <
            item
              Caption = #1055#1086#1083#1085#1086#1077' '#1080#1084#1103
            end
            item
              Caption = #1048#1084#1103
            end
            item
              Caption = #1060#1072#1084#1080#1083#1080#1103
            end
            item
              Caption = #1058#1077#1083#1077#1092#1086#1085
            end
            item
              Caption = 'Email'
            end
            item
              Caption = #1040#1076#1088#1077#1089
            end
            item
              Caption = 'Username'
            end>
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 2
          Top = 127
          Width = 327
          Height = 49
          Align = alLeft
          TabOrder = 1
          Text = #1055#1077#1088#1084#1077#1085#1085#1072#1103
        end
      end
    end
    object gbCard: TGroupBox
      Left = 0
      Top = 695
      Width = 345
      Height = 106
      Align = alBottom
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 3
      object Label2: TLabel
        Left = 2
        Top = 17
        Width = 341
        Height = 15
        Align = alTop
        Caption = #1048#1084#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
        Layout = tlCenter
        ExplicitWidth = 78
      end
      object Label3: TLabel
        Left = 2
        Top = 89
        Width = 341
        Height = 15
        Align = alBottom
        Alignment = taCenter
        Caption = 'ID 12345'
        Layout = tlCenter
        ExplicitWidth = 44
      end
      object Edit1: TEdit
        Left = 2
        Top = 32
        Width = 341
        Height = 23
        Align = alTop
        TabOrder = 0
        Text = #1048#1084#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
      end
    end
    object btClose: TButton
      Left = 0
      Top = 0
      Width = 345
      Height = 44
      Align = alTop
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Style = bsCommandLink
      TabOrder = 4
      OnClick = btCloseClick
    end
    object gbAddItem: TGroupBox
      Left = 0
      Top = 382
      Width = 345
      Height = 94
      Align = alTop
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' +'
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 5
      object ButtonGroup1: TButtonGroup
        Left = 2
        Top = 17
        Width = 341
        Height = 75
        Align = alClient
        BorderStyle = bsNone
        ButtonHeight = 35
        ButtonWidth = 110
        Images = VirtualImageList1
        Items = <
          item
            Caption = #1058#1077#1082#1089#1090
            Hint = #1058#1077#1082#1089#1090
            ImageIndex = 0
            ImageName = 'message'
          end
          item
            Caption = #1060#1086#1090#1086
            ImageIndex = 1
            ImageName = 'message-video'
          end
          item
            Caption = #1042#1080#1076#1077#1086
            ImageIndex = 3
            ImageName = 'camera-gopro'
          end
          item
            Caption = #1042#1080#1076#1077#1086#1089#1086#1086#1073#1097#1077#1085#1080#1077
            ImageIndex = 3
            ImageName = 'camera-gopro'
          end
          item
            Caption = #1040#1091#1076#1080#1086
            ImageIndex = 2
            ImageName = 'microphone-message'
          end
          item
            Caption = #1060#1072#1081#1083
            ImageIndex = 4
            ImageName = 'file-document'
          end>
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 476
      Width = 345
      Height = 53
      Align = alTop
      Caption = #1042#1072#1083#1080#1076#1072#1094#1080#1103
      DefaultHeaderFont = False
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -12
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = [fsBold]
      TabOrder = 6
      object ComboBox1: TComboBox
        Left = 2
        Top = 17
        Width = 341
        Height = 23
        Align = alTop
        TabOrder = 0
        Text = #1053#1077#1090
      end
    end
  end
  object sbDesktop: TScrollBox
    Left = 0
    Top = 0
    Width = 448
    Height = 633
    Align = alClient
    BorderStyle = bsNone
    Color = clSkyBlue
    ParentColor = False
    TabOrder = 1
    Visible = False
    object Button10: TButton
      Left = 3
      Top = 3
      Width = 75
      Height = 25
      Caption = 'New Card'
      TabOrder = 0
      OnClick = Button10Click
    end
    object Panel2: TPanel
      Left = 104
      Top = 232
      Width = 185
      Height = 52
      AutoSize = True
      Caption = 'Panel2'
      TabOrder = 1
      object Button1: TButton
        Left = 1
        Top = 26
        Width = 183
        Height = 25
        Align = alTop
        Caption = 'Button1'
        TabOrder = 0
      end
      object Button2: TButton
        Left = 1
        Top = 1
        Width = 183
        Height = 25
        Align = alTop
        Caption = 'Button1'
        TabOrder = 1
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 32
    object f1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
      end
      object New2: TMenuItem
        Caption = 'Open'
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
      object Save2: TMenuItem
        Caption = 'Save As'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
      end
    end
  end
  object ImageListIcons: TImageList
    Left = 72
    Top = 32
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
      end>
    Left = 8
    Top = 120
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
      end>
    ImageCollection = ImageCollection1
    Left = 88
    Top = 120
  end
end
