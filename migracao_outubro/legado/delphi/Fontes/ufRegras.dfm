inherited fRegras: TfRegras
  Left = 118
  Top = 110
  Caption = 'Cadastro de Regras'
  ClientHeight = 343
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 279
  end
  inherited PCampos: TPanel
    Height = 217
    ExplicitHeight = 217
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Modelo'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 20
      Height = 13
      Caption = 'Item'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 66
      Top = 88
      Width = 86
      Height = 13
      Caption = 'Descri'#231#227'o do Item'
      FocusControl = DBLookupComboBox1
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 64
      Height = 13
      Caption = 'Pasta Padr'#227'o'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 275
      Top = 48
      Width = 179
      Height = 13
      Caption = 'Componente do Nome do Documento'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'REG_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 264
      Height = 21
      DataField = 'REG_MOD'
      DataSource = DSP
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 104
      Width = 57
      Height = 21
      DataField = 'ITE_COD'
      DataSource = DSP
      TabOrder = 3
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 66
      Top = 104
      Width = 500
      Height = 21
      DataField = 'DescricaoItem'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 184
      Width = 264
      Height = 21
      DataField = 'REG_PASTA'
      DataSource = DSP
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 275
      Top = 64
      Width = 264
      Height = 21
      DataField = 'REG_CPNOM'
      DataSource = DSP
      TabOrder = 2
    end
    object JvDBComboBoxTipo: TJvDBComboBox
      Left = 8
      Top = 143
      Width = 237
      Height = 21
      DataField = 'REG_TIPO'
      DataSource = DSP
      Items.Strings = (
        'Judicial'
        'ExtraJudicial')
      TabOrder = 5
      Values.Strings = (
        '1'
        '2')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
  end
  inherited PGrid: TPanel
    Top = 217
    Height = 62
    ExplicitTop = 217
    ExplicitHeight = 321
    inherited DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 718
      Height = 50
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qRegras
    Left = 608
  end
end
