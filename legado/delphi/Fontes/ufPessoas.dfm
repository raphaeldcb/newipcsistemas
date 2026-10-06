inherited fPessoas: TfPessoas
  Left = 226
  Top = 261
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 370
  ClientWidth = 739
  Scaled = False
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitWidth = 755
  ExplicitHeight = 409
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 302
    Width = 739
    Height = 68
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 302
    ExplicitWidth = 739
    ExplicitHeight = 68
    inherited bbtPrimeiro: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited bbtAnterior: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited bbtProximo: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited bbtUltimo: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BNovo: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BEditar: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BExcluir: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BSalvar: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BCancelar: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BSair: TSpeedButton
      Top = 6
      ExplicitTop = 6
    end
    inherited BCnsultar: TSpeedButton
      Top = 6
      Enabled = False
      ExplicitTop = 6
    end
  end
  inherited PCampos: TPanel
    Width = 739
    Height = 144
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 739
    ExplicitHeight = 144
    object Label7: TLabel
      Left = 5
      Top = 10
      Width = 42
      Height = 13
      Caption = 'Situa'#231#227'o'
    end
    object Label6: TLabel
      Left = 136
      Top = 10
      Width = 81
      Height = 13
      Caption = 'Nome da Pessoa'
      FocusControl = DBEdit4
    end
    object Label26: TLabel
      Left = 4
      Top = 56
      Width = 85
      Height = 13
      Caption = 'Local Nascimento'
      FocusControl = DBEdit10
    end
    object Label8: TLabel
      Left = 348
      Top = 56
      Width = 82
      Height = 13
      Caption = 'Data Nascimento'
    end
    object Label27: TLabel
      Left = 4
      Top = 100
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label28: TLabel
      Left = 115
      Top = 100
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
    end
    object Label30: TLabel
      Left = 302
      Top = 100
      Width = 110
      Height = 13
      Caption = 'N'#250'mero do Documento'
      FocusControl = DBEdit21
    end
    object Label1: TLabel
      Left = 563
      Top = 10
      Width = 32
      Height = 13
      Caption = 'Iniciais'
      FocusControl = DBEdit1
    end
    object DBEdit4: TDBEdit
      Left = 136
      Top = 25
      Width = 423
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_NOME'
      DataSource = DM.DS_Pessoas
      TabOrder = 1
      OnEnter = DBEdit4Enter
      OnExit = DBEdit4Exit
    end
    object DBEdit10: TDBEdit
      Left = 4
      Top = 72
      Width = 341
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PES_LCNAS'
      DataSource = DM.DS_Pessoas
      TabOrder = 3
      OnEnter = DBEdit10Enter
    end
    object DBDateEdit4: TJvDBDateEdit
      Left = 348
      Top = 72
      Width = 140
      Height = 21
      DataField = 'PES_DTNAS'
      DataSource = DM.DS_Pessoas
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 4
      OnEnter = DBDateEdit4Enter
    end
    object RxDBComboBox6: TJvDBComboBox
      Left = 3
      Top = 116
      Width = 111
      Height = 21
      DataField = 'PES_SEXO'
      DataSource = DM.DS_Pessoas
      Items.Strings = (
        'Masculino'
        'Feminino'
        'Ignorado')
      TabOrder = 5
      Values.Strings = (
        '1'
        '2'
        '3')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      OnEnter = RxDBComboBox6Enter
    end
    object RxDBComboBox7: TJvDBComboBox
      Left = 116
      Top = 116
      Width = 184
      Height = 21
      DataField = 'PES_TDOC'
      DataSource = DM.DS_Pessoas
      Items.Strings = (
        'RG'
        'CPF'
        'OAB'
        'CREA'
        'CARTEIRA DE TRABALHO'
        'CERTID'#195'O DE NASCIMENTO'
        'CERID'#195'O DE CASAMENTO'
        'CNH'
        'TITULO ELEITORAL'
        'DECLARA'#199#195'O DE NASCIDO VIVO')
      TabOrder = 6
      Values.Strings = (
        'RG'
        'CPF'
        'OAB'
        'CREA'
        'CARTEIRA DE TRABALHO'
        'CERTID'#195'O DE NASCIMENTO'
        'CERID'#195'O DE CASAMENTO'
        'CNH'
        'TITULO ELEITORAL'
        'DECLARA'#199#195'O DE NASCIDO VIVO')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
      OnEnter = RxDBComboBox7Enter
    end
    object DBEdit21: TDBEdit
      Left = 302
      Top = 116
      Width = 251
      Height = 21
      DataField = 'PES_NDOC'
      DataSource = DM.DS_Pessoas
      TabOrder = 7
      OnEnter = DBEdit21Enter
    end
    object RxDBLookupCombo1: TJvDBLookupCombo
      Left = 5
      Top = 25
      Width = 128
      Height = 21
      DataField = 'PES_SIT'
      DataSource = DSP
      LookupField = 'SIT_COD'
      LookupDisplay = 'SIT_NM'
      LookupSource = ds_SituacaoPessoas
      TabOrder = 0
      OnEnter = RxDBLookupCombo1Enter
    end
    object DBEdit1: TDBEdit
      Left = 561
      Top = 25
      Width = 100
      Height = 21
      DataField = 'PES_INICIAIS'
      DataSource = DM.DS_Pessoas
      Enabled = False
      TabOrder = 2
      OnEnter = DBEdit1Enter
    end
    object bbtEnderecos: TBitBtn
      Left = 600
      Top = 128
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 8
      Visible = False
      OnClick = bbtEnderecosClick
    end
  end
  inherited PGrid: TPanel
    Top = 144
    Width = 739
    Height = 158
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 144
    ExplicitWidth = 739
    ExplicitHeight = 158
    object Label2: TLabel [0]
      Left = 512
      Top = 117
      Width = 218
      Height = 13
      Caption = 'F7 - Cadastra Endere'#231'os c/ Dados da Pessoa'
    end
    inherited DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 726
      Height = 105
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OnKeyDown = DBGrid1KeyDown
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 138
      Width = 737
      Height = 19
      Panels = <
        item
          Text = 'Mensagem (Campo):'
          Width = 120
        end
        item
          Width = 550
        end>
    end
  end
  object pn_Pessoas: TPanel [3]
    Left = 92
    Top = 220
    Width = 617
    Height = 185
    Color = clMaroon
    TabOrder = 3
    Visible = False
    object DBGrid2: TDBGrid
      Left = 8
      Top = 8
      Width = 585
      Height = 120
      DataSource = DS_ConsultaNomeDuplicados
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PES_NOME'
          Title.Caption = 'Nome da Pessoa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_COD'
          Title.Caption = 'C'#243'd. Per'#237'cia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAS_CODIGO'
          Title.Caption = 'Caso'
          Visible = True
        end>
    end
    object bbtImprimir: TBitBtn
      Left = 377
      Top = 139
      Width = 113
      Height = 33
      Caption = '_&Imprimir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = bbtImprimirClick
    end
    object bbtFechar: TBitBtn
      Left = 490
      Top = 139
      Width = 113
      Height = 33
      Caption = '_&Fechar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = bbtFecharClick
    end
    object QuickRep1: TRLReport
      Left = 80
      Top = 198
      Width = 794
      Height = 1123
      DataSource = DS_ConsultaNomeDuplicados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      object QRBand6: TRLBand
        Left = 38
        Top = 132
        Width = 718
        Height = 20
      end
      object QRBand8: TRLBand
        Left = 38
        Top = 38
        Width = 718
        Height = 51
        object QRSysData3: TRLSystemInfo
          Left = 627
          Top = 2
          Width = 36
          Height = 17
          Text = ''
          Transparent = False
        end
        object RLLabel1: TRLLabel
          Left = 6
          Top = 6
          Width = 184
          Height = 16
          Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        end
        object RLLabel2: TRLLabel
          Left = 7
          Top = 26
          Width = 190
          Height = 16
          Caption = 'Nomes Duplicados Encontrados'
        end
        object RLLabel3: TRLLabel
          Left = 204
          Top = 26
          Width = 111
          Height = 16
          Caption = 'Caso (Analisado): '
        end
        object CASO: TRLLabel
          Left = 321
          Top = 26
          Width = 41
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 589
          Top = 3
          Width = 35
          Height = 16
          Caption = 'Data:'
        end
        object RLLabel5: TRLLabel
          Left = 576
          Top = 22
          Width = 48
          Height = 16
          Caption = 'P'#225'gina:'
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 626
          Top = 21
          Width = 87
          Height = 16
          Info = itPageNumber
          Text = ''
          Transparent = False
        end
      end
      object QRBand1: TRLBand
        Left = 38
        Top = 113
        Width = 718
        Height = 19
        object QRDBText1: TRLDBText
          Left = 1
          Top = 2
          Width = 67
          Height = 16
          DataField = 'PES_NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object QRDBText3: TRLDBText
          Left = 356
          Top = 1
          Width = 61
          Height = 16
          DataField = 'PRO_COD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
        object QRDBText4: TRLDBText
          Left = 524
          Top = 2
          Width = 80
          Height = 16
          DataField = 'CAS_CODIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object QRBand2: TRLBand
        Left = 38
        Top = 89
        Width = 718
        Height = 24
        object RLLabel6: TRLLabel
          Left = 4
          Top = 5
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 356
          Top = 3
          Width = 82
          Height = 16
          Caption = 'C'#243'd. Per'#237'cia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 524
          Top = 3
          Width = 35
          Height = 16
          Caption = 'Caso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qPessoas
    Left = 704
    Top = 24
  end
  object qSituacaoPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_SITUACAO')
    Left = 808
    Top = 24
    object qSituacaoPessoasSIT_COD: TIntegerField
      FieldName = 'SIT_COD'
    end
    object qSituacaoPessoasSIT_NM: TStringField
      FieldName = 'SIT_NM'
    end
    object qSituacaoPessoasSIT_SIGLA: TStringField
      FieldName = 'SIT_SIGLA'
      Size = 5
    end
    object qSituacaoPessoasSIT_ORDEM: TIntegerField
      FieldName = 'SIT_ORDEM'
    end
  end
  object ds_SituacaoPessoas: TDataSource
    DataSet = qSituacaoPessoas
    Left = 760
    Top = 24
  end
  object qControlaAuditoria: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 815
    Top = 72
  end
  object ds_Pessoas: TDataSource
    DataSet = qSelecionaPessoas
    Left = 696
    Top = 64
  end
  object qSelecionaPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from  tb_pessoas'
      'where PRO_COD = :Codigo')
    Left = 728
    Top = 64
    object qSelecionaPessoasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qSelecionaPessoasPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qSelecionaPessoasPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qSelecionaPessoasPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
    end
    object qSelecionaPessoasPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qSelecionaPessoasPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qSelecionaPessoasPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qSelecionaPessoasPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qSelecionaPessoasPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 200
    end
  end
  object DS_ConsultaNomeDuplicados: TDataSource
    DataSet = qConsultaNomeDuplicados
    Left = 192
    Top = 136
  end
  object qConsultaNomeDuplicados: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      'select * from tb_pessoas pa, tb_processo p'
      'where pa.pro_cod=p.pro_cod')
    Left = 224
    Top = 136
    object qConsultaNomeDuplicadosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaNomeDuplicadosPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qConsultaNomeDuplicadosPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qConsultaNomeDuplicadosPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qConsultaNomeDuplicadosPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
    end
    object qConsultaNomeDuplicadosPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qConsultaNomeDuplicadosPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qConsultaNomeDuplicadosPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qConsultaNomeDuplicadosPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qConsultaNomeDuplicadosPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 200
    end
    object qConsultaNomeDuplicadosPRO_COD_1: TIntegerField
      FieldName = 'PRO_COD_1'
    end
    object qConsultaNomeDuplicadosPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qConsultaNomeDuplicadosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qConsultaNomeDuplicadosPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qConsultaNomeDuplicadosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qConsultaNomeDuplicadosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qConsultaNomeDuplicadosCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qConsultaNomeDuplicadosCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qConsultaNomeDuplicadosVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qConsultaNomeDuplicadosLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qConsultaNomeDuplicadosPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
    object qConsultaNomeDuplicadosPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qConsultaNomeDuplicadosPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      Size = 5
    end
    object qConsultaNomeDuplicadosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qConsultaNomeDuplicadosPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qConsultaNomeDuplicadosPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qConsultaNomeDuplicadosPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qConsultaNomeDuplicadosPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qConsultaNomeDuplicadosPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qConsultaNomeDuplicadosPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qConsultaNomeDuplicadosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qConsultaNomeDuplicadosFG_PROP: TStringField
      FieldName = 'FG_PROP'
      Size = 1
    end
    object qConsultaNomeDuplicadosPRO_USUCAD: TStringField
      FieldName = 'PRO_USUCAD'
    end
    object qConsultaNomeDuplicadosPRO_NUMLAUDO: TStringField
      FieldName = 'PRO_NUMLAUDO'
    end
    object qConsultaNomeDuplicadosPRO_RASTREAR: TStringField
      FieldName = 'PRO_RASTREAR'
    end
    object qConsultaNomeDuplicadosPRO_CARREGACREDITO: TStringField
      FieldName = 'PRO_CARREGACREDITO'
      FixedChar = True
      Size = 1
    end
  end
end
