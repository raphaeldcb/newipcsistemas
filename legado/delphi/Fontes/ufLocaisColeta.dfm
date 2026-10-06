inherited fLocaisColeta: TfLocaisColeta
  Left = 376
  Top = 234
  Caption = 'Cadastro de Locais de Coleta'
  ClientHeight = 540
  ClientWidth = 781
  Position = poDesktopCenter
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 797
  ExplicitHeight = 579
  TextHeight = 13
  object Label29: TLabel [0]
    Left = 104
    Top = 32
    Width = 19
    Height = 13
    Caption = 'Ano'
  end
  inherited PBotoes: TPanel
    Top = 469
    Width = 781
    Height = 71
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 469
    ExplicitWidth = 781
    ExplicitHeight = 71
    inherited bbtPrimeiro: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited bbtAnterior: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited bbtProximo: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited bbtUltimo: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BNovo: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BEditar: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BExcluir: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BSalvar: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BCancelar: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BSair: TSpeedButton
      Top = 8
      ExplicitTop = 8
    end
    inherited BCnsultar: TSpeedButton
      Top = 8
      Width = 70
      OnClick = BCnsultarClick
      ExplicitTop = 8
      ExplicitWidth = 70
    end
    object sbVisualizar: TSpeedButton
      Left = 681
      Top = 8
      Width = 70
      Height = 57
      Caption = 'Comprovantes'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337333733373
        3373337F3F7F3F7F3F7F33737373737373733F7F7F7F7F7F7F7F770000000000
        000077777777777777773303333333333333337FF333333F33333709333333C3
        333337773F3FF373F333330393993C3C33333F7F7F77F7F7FFFF77079797977C
        77777777777777777777330339339333C333337FF73373F37F33370C333C3933
        933337773F3737F37FF33303C3C33939C9333F7F7F7FF7F777FF7707C7C77797
        7C97777777777777777733033C3333333C33337F37F33333373F37033C333333
        33C3377F37333333337333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = sbVisualizarClick
    end
  end
  inherited PCampos: TPanel
    Width = 781
    Height = 393
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 781
    ExplicitHeight = 393
    object PageControl1: TPageControl
      Left = 2
      Top = 1
      Width = 783
      Height = 395
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados'
        object GroupBox2: TGroupBox
          Left = 1
          Top = 182
          Width = 774
          Height = 184
          Caption = 'Dados do Laborat'#243'rio'
          TabOrder = 0
          object Label3: TLabel
            Left = 5
            Top = 14
            Width = 53
            Height = 13
            Caption = 'Laborat'#243'rio'
            FocusControl = DBEdit3
          end
          object Label5: TLabel
            Left = 5
            Top = 54
            Width = 91
            Height = 13
            Caption = 'Telefone Comercial'
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 5
            Top = 94
            Width = 46
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = DBEdit6
          end
          object Label7: TLabel
            Left = 5
            Top = 132
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = DBEdit7
          end
          object Label8: TLabel
            Left = 310
            Top = 132
            Width = 33
            Height = 13
            Caption = 'Estado'
          end
          object Label10: TLabel
            Left = 194
            Top = 54
            Width = 77
            Height = 13
            Caption = 'Telefone Celular'
            FocusControl = DBEdit8
          end
          object Label11: TLabel
            Left = 385
            Top = 54
            Width = 100
            Height = 13
            Caption = 'Telefone Residencial'
            FocusControl = DBEdit9
          end
          object Label12: TLabel
            Left = 527
            Top = 133
            Width = 21
            Height = 13
            Caption = 'CEP'
          end
          object bbtChamaColetadoresRelatorios: TSpeedButton
            Left = 744
            Top = 32
            Width = 23
            Height = 22
            Caption = '...'
            Visible = False
            OnClick = bbtChamaColetadoresRelatoriosClick
          end
          object bbtChamaKits: TSpeedButton
            Left = 744
            Top = 64
            Width = 21
            Height = 22
            Caption = '...'
            Visible = False
            OnClick = bbtChamaKitsClick
          end
          object DBEdit3: TDBEdit
            Left = 5
            Top = 30
            Width = 524
            Height = 21
            DataField = 'LCO_LABT'
            DataSource = DSP
            TabOrder = 0
          end
          object DBEdit5: TDBEdit
            Left = 5
            Top = 70
            Width = 185
            Height = 21
            DataField = 'LCO_FONE'
            DataSource = DSP
            TabOrder = 1
          end
          object DBEdit6: TDBEdit
            Left = 5
            Top = 110
            Width = 654
            Height = 21
            DataField = 'LCO_END'
            DataSource = DSP
            TabOrder = 4
          end
          object DBEdit7: TDBEdit
            Left = 5
            Top = 148
            Width = 300
            Height = 21
            DataField = 'LCO_CID'
            DataSource = DSP
            TabOrder = 5
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 309
            Top = 148
            Width = 212
            Height = 21
            DataField = 'DescricaoEstado'
            DataSource = DSP
            TabOrder = 6
          end
          object DBEdit8: TDBEdit
            Left = 382
            Top = 70
            Width = 185
            Height = 21
            DataField = 'LCO_RES'
            DataSource = DSP
            MaxLength = 14
            TabOrder = 3
          end
          object DBEdit9: TDBEdit
            Left = 194
            Top = 70
            Width = 177
            Height = 21
            DataField = 'LCO_CEL'
            DataSource = DSP
            MaxLength = 14
            TabOrder = 2
          end
          object DBEdit10: TDBEdit
            Left = 524
            Top = 148
            Width = 148
            Height = 21
            DataField = 'LCO_CEP'
            DataSource = DSP
            MaxLength = 10
            TabOrder = 7
          end
        end
        object GroupBox1: TGroupBox
          Left = 1
          Top = -2
          Width = 774
          Height = 183
          Caption = 'Dados Pessoais'
          TabOrder = 1
          object Label1: TLabel
            Left = 8
            Top = 17
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
            FocusControl = DBEdit1
          end
          object Label2: TLabel
            Left = 8
            Top = 57
            Width = 28
            Height = 13
            Caption = 'Nome'
            FocusControl = DBEdit2
          end
          object Label4: TLabel
            Left = 234
            Top = 138
            Width = 24
            Height = 13
            Caption = 'CRM'
            FocusControl = DBEdit4
          end
          object Label15: TLabel
            Left = 9
            Top = 98
            Width = 83
            Height = 13
            Caption = 'Data de Cadastro'
            FocusControl = DBEdit4
          end
          object Label16: TLabel
            Left = 133
            Top = 98
            Width = 100
            Height = 13
            Caption = 'Data do Treinamento'
            FocusControl = DBEdit4
          end
          object Label22: TLabel
            Left = 256
            Top = 98
            Width = 97
            Height = 13
            Caption = 'Data do Nascimento'
            FocusControl = DBEdit4
          end
          object DBEdit1: TDBEdit
            Left = 8
            Top = 33
            Width = 134
            Height = 21
            DataField = 'LCO_COD'
            DataSource = DSP
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 8
            Top = 73
            Width = 473
            Height = 21
            DataField = 'LCO_NOME'
            DataSource = DSP
            TabOrder = 1
          end
          object DBEdit4: TDBEdit
            Left = 234
            Top = 154
            Width = 199
            Height = 21
            DataField = 'LCO_CRM'
            DataSource = DSP
            TabOrder = 7
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 7
            Top = 140
            Width = 223
            Height = 38
            Caption = 'Sexo'
            Columns = 2
            DataField = 'LCO_SEXO'
            DataSource = DSP
            Items.Strings = (
              'Masculino'
              'Feminino')
            TabOrder = 5
            TabStop = True
            Values.Strings = (
              '1'
              '2')
          end
          object DBDateEdit1: TJvDBDateEdit
            Left = 8
            Top = 113
            Width = 120
            Height = 21
            DataField = 'LCO_DCAD'
            DataSource = DSP
            NumGlyphs = 2
            ShowNullDate = False
            TabOrder = 2
          end
          object DBDateEdit2: TJvDBDateEdit
            Left = 132
            Top = 113
            Width = 119
            Height = 21
            DataField = 'LCO_DTRE'
            DataSource = DSP
            NumGlyphs = 2
            ShowNullDate = False
            TabOrder = 3
          end
          object GroupBox3: TGroupBox
            Left = 566
            Top = 9
            Width = 185
            Height = 115
            Caption = 'Datas'
            TabOrder = 8
            object Label17: TLabel
              Left = 7
              Top = 20
              Width = 94
              Height = 13
              Caption = #218'ltimo Envio de Kits'
              FocusControl = DBEdit4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 7
              Top = 68
              Width = 132
              Height = 13
              Caption = #218'ltima Recep'#231#227'o de Exame'
              FocusControl = DBEdit4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBDateEdit3: TJvDBDateEdit
              Left = 6
              Top = 37
              Width = 131
              Height = 21
              DataField = 'DATA_ENVIO'
              DataSource = ds_DataKits
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              ShowNullDate = False
              TabOrder = 0
            end
            object DBDateEdit4: TJvDBDateEdit
              Left = 6
              Top = 85
              Width = 131
              Height = 21
              DataField = 'DATA_RECEPCAO'
              DataSource = ds_DataRecepcao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              ShowNullDate = False
              TabOrder = 1
            end
          end
          object DBRadioGroup3: TDBRadioGroup
            Left = 343
            Top = 9
            Width = 223
            Height = 38
            Caption = 'Situa'#231#227'o'
            Columns = 2
            DataField = 'LCO_SITUACAO'
            DataSource = DSP
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 6
            TabStop = True
            Values.Strings = (
              'A'
              'I')
          end
          object DBDateEdit5: TJvDBDateEdit
            Left = 255
            Top = 113
            Width = 118
            Height = 21
            DataField = 'LCO_DNASC'
            DataSource = DSP
            NumGlyphs = 2
            ShowNullDate = False
            TabOrder = 4
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Complemento'
        ImageIndex = 1
        object Label9: TLabel
          Left = 181
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Categoria'
        end
        object Label13: TLabel
          Left = 5
          Top = 58
          Width = 28
          Height = 13
          Caption = 'E-mail'
          FocusControl = DBEdit11
        end
        object Label14: TLabel
          Left = 309
          Top = 58
          Width = 18
          Height = 13
          Caption = 'Site'
          FocusControl = DBEdit12
        end
        object Label21: TLabel
          Left = 5
          Top = 98
          Width = 137
          Height = 13
          Caption = 'N'#250'mero do Cart'#227'o do Correio'
          FocusControl = DBEdit13
        end
        object Label23: TLabel
          Left = 5
          Top = 138
          Width = 31
          Height = 13
          Caption = 'Banco'
        end
        object Label24: TLabel
          Left = 165
          Top = 138
          Width = 39
          Height = 13
          Caption = 'Ag'#234'ncia'
          FocusControl = DBEdit15
        end
        object Label25: TLabel
          Left = 301
          Top = 138
          Width = 28
          Height = 13
          Caption = 'Conta'
          FocusControl = DBEdit16
        end
        object Label26: TLabel
          Left = 5
          Top = 178
          Width = 58
          Height = 13
          Caption = 'CPF / CNPJ'
          FocusControl = DBEdit17
        end
        object Label27: TLabel
          Left = 5
          Top = 218
          Width = 95
          Height = 13
          Caption = 'N'#250'mero M'#237'nimo Kits'
          FocusControl = DBEdit14
        end
        object Label28: TLabel
          Left = 3
          Top = 260
          Width = 48
          Height = 13
          Caption = 'Chave Pix'
          FocusControl = DBEdit18
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 4
          Top = 15
          Width = 170
          Height = 38
          Caption = 'Tipo de Local'
          Columns = 2
          DataField = 'LCO_TLIE'
          DataSource = DSP
          Items.Strings = (
            'Interno'
            'Externo')
          TabOrder = 0
          TabStop = True
          Values.Strings = (
            '1'
            '2')
        end
        object DBEdit11: TDBEdit
          Left = 4
          Top = 73
          Width = 300
          Height = 21
          DataField = 'LCO_EMAIL'
          DataSource = DSP
          TabOrder = 2
        end
        object DBEdit12: TDBEdit
          Left = 306
          Top = 73
          Width = 300
          Height = 21
          DataField = 'LCO_SITE'
          DataSource = DSP
          TabOrder = 3
        end
        object DBEdit13: TDBEdit
          Left = 5
          Top = 114
          Width = 134
          Height = 21
          DataField = 'LCO_NUMCARTCORREIO'
          DataSource = DSP
          MaxLength = 10
          TabOrder = 4
        end
        object DBEdit15: TDBEdit
          Left = 165
          Top = 154
          Width = 134
          Height = 21
          DataField = 'LCO_AGENCIA'
          DataSource = DSP
          MaxLength = 10
          TabOrder = 6
        end
        object DBEdit16: TDBEdit
          Left = 301
          Top = 154
          Width = 134
          Height = 21
          DataField = 'LCO_CONTA'
          DataSource = DSP
          MaxLength = 10
          TabOrder = 7
        end
        object DBEdit17: TDBEdit
          Left = 5
          Top = 194
          Width = 260
          Height = 21
          DataField = 'LCO_CPFCNPJ'
          DataSource = DSP
          TabOrder = 9
        end
        object DBEdit14: TDBEdit
          Left = 5
          Top = 234
          Width = 134
          Height = 21
          DataField = 'LCO_MINKIT'
          DataSource = DSP
          MaxLength = 10
          TabOrder = 8
        end
        object RxDBComboBoxCate: TJvDBComboBox
          Left = 180
          Top = 32
          Width = 426
          Height = 21
          Hint = 'Origem do caso (Judicial ou ExtraJudicial)'
          Color = clWhite
          DataField = 'LCO_CATE'
          DataSource = DSP
          Items.Strings = (
            'GERAL'
            'CONVENIADO ESPECIAL (Lista dos que recebem remunera'#231#227'o)'
            
              'LABORAT'#211'RIOS CONVENIADOS (Pre'#231'os normais e n'#227'o recebem remunera'#231 +
              #227'o)'
            
              'LABORAT'#211'RIOS CONVENIADOS ESPECIAIS (Pre'#231'os especiais e n'#227'o receb' +
              'e remunera'#231#227'o)'
            'OUTROS COLETADORES (Pre'#231'os normais e n'#227'o recebem remunera'#231#227'o)')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
          ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
          ListSettings.OutfilteredValueFont.Color = clRed
          ListSettings.OutfilteredValueFont.Height = -11
          ListSettings.OutfilteredValueFont.Name = 'Tahoma'
          ListSettings.OutfilteredValueFont.Style = []
        end
        object JvDBLookupComboBANCO: TJvDBLookupCombo
          Left = 5
          Top = 154
          Width = 158
          Height = 21
          DataField = 'LCO_BANCO'
          DataSource = DSP
          LookupField = 'COD_BANCO'
          LookupDisplay = 'DESC_BANCO'
          LookupSource = DM.ds_Banco
          TabOrder = 5
        end
        object DBEdit18: TDBEdit
          Left = 3
          Top = 276
          Width = 334
          Height = 21
          DataField = 'LCO_PIX'
          DataSource = DSP
          MaxLength = 100
          TabOrder = 10
        end
      end
    end
  end
  inherited PGrid: TPanel
    Top = 393
    Width = 781
    Height = 76
    Enabled = False
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 393
    ExplicitWidth = 781
    ExplicitHeight = 76
    object Label19: TLabel [0]
      Left = 576
      Top = 57
      Width = 197
      Height = 13
      Caption = 'F11 - Cadastro coletador para Pagamento'
    end
    object Label20: TLabel [1]
      Left = 356
      Top = 57
      Width = 204
      Height = 13
      Caption = 'F10 - Cadastro coletador para envio de Kits'
    end
    inherited DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 775
      Height = 48
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qLocalColeta
    Left = 712
    Top = 24
  end
  object qDataKits: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Coletador'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select max(k.kit_denv) as DATA_ENVIO'
      'from tb_lcoleta lc JOIN tb_coletador c ON lc.lco_cod=c.col_cod'
      '                   JOIN tb_kits k      ON c.col_cod=k.col_cod'
      'where lc.lco_cod = :Coletador'
      'group by lc.lco_nome')
    Left = 474
    Top = 43
    object qDataKitsDATA_ENVIO: TDateField
      FieldName = 'DATA_ENVIO'
    end
  end
  object qDataRecepcao: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Coletador'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select max(p.pro_drec) as DATA_RECEPCAO'
      'from tb_lcoleta lc JOIN tb_processo p ON lc.lco_cod=p.lco_cod'
      'where lc.lco_cod = :Coletador'
      'group by lc.lco_nome')
    Left = 506
    Top = 43
  end
  object ds_DataKits: TDataSource
    DataSet = qDataKits
    Left = 474
    Top = 59
  end
  object ds_DataRecepcao: TDataSource
    DataSet = qDataRecepcao
    Left = 506
    Top = 59
  end
end
