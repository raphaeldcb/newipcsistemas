inherited fPacientes: TfPacientes
  Left = 355
  Top = 238
  Align = alNone
  Caption = 'Cadastro de Pacientes'
  ClientHeight = 496
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 430
    Height = 66
    ExplicitTop = 430
    ExplicitHeight = 66
    inherited BNovo: TSpeedButton
      Width = 61
      ExplicitWidth = 61
    end
    inherited BSalvar: TSpeedButton
      Width = 65
      ExplicitWidth = 65
    end
    inherited BCnsultar: TSpeedButton
      Visible = False
    end
  end
  inherited PCampos: TPanel
    Height = 429
    ExplicitHeight = 429
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 55
      Height = 13
      Caption = 'Estado Civil'
    end
    object Label4: TLabel
      Left = 289
      Top = 88
      Width = 33
      Height = 13
      Caption = 'Idade'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 355
      Top = 88
      Width = 29
      Height = 13
      Caption = 'Sexo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 170
      Top = 88
      Width = 82
      Height = 13
      Caption = 'Data Nascimento'
    end
    object Label7: TLabel
      Left = 8
      Top = 209
      Width = 54
      Height = 13
      Caption = 'Logradouro'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 250
      Top = 247
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = DBEdit8
    end
    object Label10: TLabel
      Left = 8
      Top = 289
      Width = 77
      Height = 13
      Caption = 'Telefone Celular'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 8
      Top = 128
      Width = 20
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEdit3
    end
    object Label12: TLabel
      Left = 208
      Top = 128
      Width = 16
      Height = 13
      Caption = 'RG'
      FocusControl = DBEdit5
    end
    object Label14: TLabel
      Left = 263
      Top = 289
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = DBEdit10
    end
    object Label15: TLabel
      Left = 370
      Top = 128
      Width = 149
      Height = 13
      Caption = 'N'#250'm. Cart'#227'o (Unimed/Interagis)'
      FocusControl = DBEdit11
    end
    object Label16: TLabel
      Left = 557
      Top = 128
      Width = 123
      Height = 13
      Caption = 'Origem (Unimed/Interagis)'
      FocusControl = DBEdit12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 496
      Top = 209
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
      FocusControl = DBEdit13
    end
    object Label13: TLabel
      Left = 8
      Top = 249
      Width = 27
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit14
    end
    object Label18: TLabel
      Left = 493
      Top = 247
      Width = 14
      Height = 13
      Caption = 'UF'
      FocusControl = DBEdit15
    end
    object Label9: TLabel
      Left = 502
      Top = 88
      Width = 56
      Height = 13
      Caption = 'Cor/Ra'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 8
      Top = 168
      Width = 53
      Height = 13
      Caption = 'Passaporte'
      FocusControl = DBEdit9
    end
    object img_whatsapp: TImage
      Left = 222
      Top = 306
      Width = 22
      Height = 20
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000002A0000
        002A08020000004AA15E0C000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000007
        344944415478DADD586B5054551CBFEF85DD85054458DCE5E51A50A26262A099
        8F18056B52344D475406EB8B394DD3D44CF9A5EC4B7D701A9B3EF868F20569A8
        69662266A536F90AC7694409C53762B08CC002EEFBDE7BFADF7B2E77EF2EBBB8
        6B7EEAECCCEE39F7DE3DBFFFFBF73F97440811B10F5114799E170401E6344DB3
        2C4B92E413EC43460F0F783D3D3D8909893A9D6E381808E476BB1DFD8E8C8C0C
        10E869C23F7AF488A119408D725310222E2E2E3E3EFEBFC283794127BD5E1FA3
        51A5D1D5D565369B298A7A42F8BEBEBEC4C4C4206910BFB175C3AFF60681E449
        8AC02E801D9048B0045793BB6E79760D4904FC02779C4EA7C9648A19BEBBBB7B
        D4A894C0D2635F7AA68CA40191A4689240F021A51F090C6144514022423A4277
        74D6398EC29E9236BF7FBF2327272706F89EDE1ED390DE2281E6FE32C5477969
        30A3A41A393CEE900CA37C21042E2B304EFCBAB45E15AFBDBDDD66B345050F7A
        272525E1F980CF517EB2846119528295BC38727E214502B002C1FBF933E57FD3
        A4920576BB3D3333F331F010E490C478DEE9EAA83C5DC6B0B2C509AD4F1F3724
        6B4821E1F7F3672BAEB214A7860264C448F01E8F074FDC82FBA563131986C6A6
        1EB1AA6013879801E16F90E0E26B6D946C39708AC1608808FFF0E1437C1B642F
        3A3496E31859ED272B68B2232413801BA88B95D755CF66676787818709A4389E
        2F3931FFA6F33A4553529CCBE069FACC93AF9E0325CB1B663D70DE8E52025186
        1705F1B3E24DAF642E24E4E268341AC3C04341C58EE1113F69BF8D6569420687
        2B2C197F65D94DC53B82A7E8802D4A78492B510A037041CBB27BD8470E87C362
        B184C20F0E0E622BCF39546AF777D234A5DABC69696B92CEA43AB8A83EDFC50F
        C4E2054845B4A1F8F3376C2B60E9F3F952525282E0814E5C2E17C0C3F2996F2D
        AC9469E45051236EAEFA47BB5D734FF392C68AE8E1B10B7C3EFFADD59D589A84
        840425A2313C589E611898D8DD5D330E4EA1B1EEB8C81064DBAA07213B8EABCD
        5084936B0D4E4A9887CD4E24D701E0E71BAB3AF0037EBF3F35353500DFDBDB8B
        B9A1FAF8CAB3DDA7A0AC922A5520E27675A7763B9FE02BD8934DC43210849C88
        8E2D389967CAC7DAE2221880C7DA8CFD269364058AA6B5C976B5EA563C1D60CF
        82DA5C3FE18D0D1E012308E5D6059BCBB6C21278C86AB506C1E3E72C5B47EBE2
        5835DFF0C837151E5B7402CFCF779E5FF9F3EB3161ABEE3751A97FAD6E067FFA
        7DBEF4F4F430F063B68CE6747295258378FA4A559B81550A56E977C5DDDECE98
        E065EF234E34B4BD758B90233D2D2D2D0C7CC696548E036EA3424A1D4BE8DA6A
        EE0EA922DA765AE1AFB1C04BDE3792C92D6BAE1172E885D7DEBACDCC726430BC
        52D26767CCDD59518B2FB978D7F85A5B6898234444602651C69F943CF570E511
        587ABD5E680989E1A137B3FEC50ECF1DC8BBB0CCFAD5CCAD0B6C9578CE8BFCA4
        BA679DE2A07AB7B9AA2D814BA8BFB677FDB9F7438400DB43E9DDFCF2F68AECF9
        845CF872737303F0403638EF2F749DAF3ABE9802A2A3C2F3CC89857FE425E7A9
        CBBDAD7BD65F780F44DF5F71E40573897A7D77CBAE4F9A3E5484907947E485EB
        D5F7195242017209D2DE230F301C22D1B8DD1685E32330DDAEB2FA99D6D9DA2B
        0EAF23499714F2D83BA7D636B4FFA0A043D9F7F152FD90B7045EC5DA066A7E7F
        7F3FC6CBAFCBA25939F3A41A1CE40475B93077F9173336458A331C2BD3BF2FEE
        763FC0BC0F962F1E35AD6EDE3E4266FDE4E464FC68001EFA5A2C5197BBB3ECA7
        6972F08DC4F30CC99D5EDC64D69B233D60AB354B1B48394708BCD0B2FC2E6E3A
        A0E4A99D67001E72516D758A0E8E93FC409143BA87E967F0459A643E9AFC6975
        7E8DF68693773E7F200FDC2DF5A912BCF85CE2C4FAB93FE2BB706A509BFFA06E
        676060009F8F7CA26FDAD1F1B8ABD56C4BAA3F28780283A574E353260B4868ED
        6DE6919750FA2DC5EBCD4BEEE08C04D5B3B2B2023B6AE1A1CFC47201779534E4
        E34E8B78B231D4EBF1BCF8DBFCA6642E4516978C8B8FD3AA14040FD98F0F6697
        7AFE5C77B19A0AEEACB50E0809C9E1D0B2E2700C163797D615A796A8D6C5C52E
        3CBCEAFB198D85884198F235A61F5A0609A275CB50832B330C10FCF6E9FB0A93
        8AF02D282D98E5C2C30309E2C887BF9736164847F66187435563A557C13B1028
        008C8F192260F3A7E75DD6514A570FAD949A6CE1E1A110E22EFBACFDF7779BDE
        D4E9983826FECB293B269826C3336F5F5AD1327059A9061A83040C20FF8AC0EA
        02AACA5AB336EF03353241B1B0D84470E2F9712C4FDD33E1F0A2468BDE3AFCE9
        6D3736EDBDB70351880AAE8998D06882F9B870E39CF479DAE4B077DB2D632C91
        A2448187988FE66D803A20336F0FB6B5BBEE02378C35E6651A727031D70E1008
        984DDBD54784872E3BE4F88375028F401080414738A30F1FF04708B490201F09
        1E6AB26A4C90BACFD1C7715CC8BB0587A34FAF37B00C1B1E526E7325E2F27A22
        793A3C3C58DEA037808A90F7C604E3635FA5C039011813621B4B0CE282855412
        8B6990F86807C52EFA37474F71C4F062ED7F08FF2F6914FADADE724698000000
        0049454E44AE426082}
      Stretch = True
      OnDblClick = img_whatsappDblClick
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'PES_COD'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 600
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_NOME'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 289
      Top = 104
      Width = 64
      Height = 21
      DataField = 'PES_IDA'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 8
      Top = 225
      Width = 485
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_END'
      DataSource = DSP
      TabOrder = 12
      OnExit = DBEdit7Exit
    end
    object DBEdit8: TDBEdit
      Left = 250
      Top = 263
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_CIES'
      DataSource = DSP
      TabOrder = 15
    end
    object DBEdit10: TDBEdit
      Left = 8
      Top = 305
      Width = 212
      Height = 21
      DataField = 'PES_FCEL'
      DataSource = DSP
      TabOrder = 17
      OnExit = DBEdit10Exit
    end
    object DBComboBoxSexo: TDBComboBox
      Left = 355
      Top = 104
      Width = 145
      Height = 21
      DataField = 'PES_SEXO'
      DataSource = DSP
      Items.Strings = (
        'Masculino'
        'Feminino'
        'Ignorado')
      TabOrder = 5
    end
    object DBComboBoxEstadoCivil: TDBComboBox
      Left = 8
      Top = 104
      Width = 160
      Height = 21
      DataField = 'PES_ESCV'
      DataSource = DSP
      Items.Strings = (
        'Solteiro(a)'
        'Casado(a)'
        'Divorciado(a)'
        'Separado(a) Judicialmente'
        'Convivente')
      TabOrder = 2
    end
    object DBDateEdit1: TJvDBDateEdit
      Left = 168
      Top = 104
      Width = 121
      Height = 21
      DataField = 'PES_DNAS'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 3
      OnEnter = DBDateEdit1Enter
      OnExit = DBDateEdit1Exit
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 144
      Width = 199
      Height = 21
      DataField = 'PES_CPF'
      DataSource = DSP
      TabOrder = 7
      OnExit = DBEdit3Exit
    end
    object DBEdit5: TDBEdit
      Left = 208
      Top = 144
      Width = 160
      Height = 21
      DataField = 'PES_RG'
      DataSource = DSP
      TabOrder = 8
    end
    object DBEdit6: TDBEdit
      Left = 262
      Top = 305
      Width = 269
      Height = 21
      DataField = 'PES_EMAIL'
      DataSource = DSP
      TabOrder = 18
    end
    object DBEdit11: TDBEdit
      Left = 370
      Top = 144
      Width = 185
      Height = 21
      DataField = 'PES_NUMCAR'
      DataSource = DSP
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 557
      Top = 144
      Width = 161
      Height = 21
      DataField = 'PES_CLAORI'
      DataSource = DSP
      TabOrder = 10
    end
    object DBEdit13: TDBEdit
      Left = 496
      Top = 225
      Width = 70
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_NUNEND'
      DataSource = DSP
      TabOrder = 13
    end
    object DBEdit14: TDBEdit
      Left = 7
      Top = 263
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_BAIRRO'
      DataSource = DSP
      TabOrder = 14
    end
    object DBEdit15: TDBEdit
      Left = 493
      Top = 263
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_UF'
      DataSource = DSP
      TabOrder = 16
    end
    object DBComboBox1: TDBComboBox
      Left = 502
      Top = 104
      Width = 145
      Height = 21
      DataField = 'PES_RACA'
      DataSource = DSP
      Items.Strings = (
        'Branca'#9
        'Preta'#9
        'Parda'#9
        'Amarela'#9
        'Indigena'#9
        'Ignorado'#9)
      TabOrder = 6
    end
    object gb_Sintomas: TGroupBox
      Left = 8
      Top = 330
      Width = 705
      Height = 97
      Caption = 'Sintomas'
      TabOrder = 19
      object DBCheckBox1: TDBCheckBox
        Left = 6
        Top = 19
        Width = 97
        Height = 17
        Caption = 'Dor de Garganta'
        DataField = 'PES_SINTOMA1'
        DataSource = DSP
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 7
        Top = 43
        Width = 97
        Height = 17
        Caption = 'Dispneia'
        DataField = 'PES_SINTOMA2'
        DataSource = DSP
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 8
        Top = 67
        Width = 97
        Height = 17
        Caption = 'Febre'
        DataField = 'PES_SINTOMA3'
        DataSource = DSP
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 142
        Top = 19
        Width = 97
        Height = 17
        Caption = 'Tosse'
        DataField = 'PES_SINTOMA4'
        DataSource = DSP
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox5: TDBCheckBox
        Left = 143
        Top = 42
        Width = 97
        Height = 17
        Caption = 'Outros'
        DataField = 'PES_SINTOMA5'
        DataSource = DSP
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox6: TDBCheckBox
        Left = 143
        Top = 66
        Width = 97
        Height = 17
        Caption = 'Dor de Cabe'#231'a'
        DataField = 'PES_SINTOMA6'
        DataSource = DSP
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox7: TDBCheckBox
        Left = 278
        Top = 19
        Width = 123
        Height = 17
        Caption = 'Dist'#250'rbios Gustativos'
        DataField = 'PES_SINTOMA7'
        DataSource = DSP
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox8: TDBCheckBox
        Left = 278
        Top = 42
        Width = 131
        Height = 17
        Caption = 'Dist'#250'rbios Olfativos'
        DataField = 'PES_SINTOMA8'
        DataSource = DSP
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox9: TDBCheckBox
        Left = 278
        Top = 67
        Width = 97
        Height = 17
        Caption = 'Coriza'
        DataField = 'PES_SINTOMA9'
        DataSource = DSP
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox10: TDBCheckBox
        Left = 420
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Assintom'#225'tico'
        DataField = 'PES_SINTOMA10'
        DataSource = DSP
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object DBEdit9: TDBEdit
      Left = 8
      Top = 184
      Width = 199
      Height = 21
      DataField = 'PES_PASS'
      DataSource = DSP
      TabOrder = 11
      OnExit = DBEdit3Exit
    end
  end
  inherited PGrid: TPanel
    Top = 429
    Height = 1
    ExplicitTop = 429
    ExplicitHeight = 1
  end
  inherited DSP: TDataSource
    DataSet = DMI.qPacientes
  end
  object qAtualizaCodigo: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 595
    Top = 244
  end
end
