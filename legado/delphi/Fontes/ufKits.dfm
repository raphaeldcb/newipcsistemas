inherited fKits: TfKits
  Left = 115
  Top = 156
  Caption = 'Controle de Kits'
  ClientHeight = 369
  OnShow = FormShow
  ExplicitHeight = 408
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 305
    inherited BNovo: TSpeedButton
      Enabled = False
    end
    inherited BExcluir: TSpeedButton
      Enabled = False
    end
    inherited BCnsultar: TSpeedButton
      Caption = 'Relat'#243'rios'
      OnClick = BCnsultarClick
    end
  end
  inherited PCampos: TPanel
    Height = 233
    ExplicitHeight = 233
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 8
      Top = 94
      Width = 86
      Height = 13
      Caption = 'N'#250'mero do Cart'#227'o'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 134
      Width = 45
      Height = 13
      Caption = 'Coletador'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 8
      Top = 176
      Width = 68
      Height = 13
      Caption = 'Data de Envio'
    end
    object Label7: TLabel
      Left = 132
      Top = 176
      Width = 79
      Height = 13
      Caption = 'Data de Retorno'
    end
    object Label8: TLabel
      Left = 256
      Top = 176
      Width = 83
      Height = 13
      Caption = 'C'#243'digo do Exame'
      FocusControl = DBEdit7
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'KIT_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 110
      Width = 134
      Height = 21
      DataField = 'KIT_NUM'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 150
      Width = 65
      Height = 21
      DataField = 'COL_COD'
      DataSource = DSP
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 74
      Top = 150
      Width = 400
      Height = 21
      DataField = 'LkpColetador'
      DataSource = DSP
      TabOrder = 3
    end
    object DBEdit7: TDBEdit
      Left = 256
      Top = 192
      Width = 134
      Height = 21
      DataField = 'KIT_CEXA'
      DataSource = DSP
      MaxLength = 6
      TabOrder = 4
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 48
      Width = 257
      Height = 41
      Caption = 'Tipo'
      Columns = 2
      DataField = 'KIT_TIP'
      DataSource = DSP
      Items.Strings = (
        'B'#225'sico'
        'Reconstru'#231#227'o')
      TabOrder = 5
      Values.Strings = (
        '3'
        '6')
    end
    object DBDateEdit1: TJvDBDateEdit
      Left = 8
      Top = 192
      Width = 121
      Height = 21
      DataField = 'KIT_DENV'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 6
    end
    object DBDateEdit2: TJvDBDateEdit
      Left = 132
      Top = 192
      Width = 121
      Height = 21
      DataField = 'KIT_DRET'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 7
    end
  end
  inherited PGrid: TPanel
    Top = 233
    Height = 72
    ExplicitTop = 233
    ExplicitHeight = 305
    inherited DBGrid1: TDBGrid
      Left = 5
      Height = 61
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qKits
  end
  object qSomaBasico: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) AS Basico from tb_KITS'
      'where KIT_TIP = 3 and COL_COD = :Codigo and KIT_STATUS = '#39'A'#39
      '')
    Left = 616
    Top = 88
    object qSomaBasicoBASICO: TIntegerField
      FieldName = 'BASICO'
    end
  end
  object qSomaReconstrucao: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) AS Reconstrucao from tb_KITS'
      'where KIT_TIP = 6 and COL_COD = :Codigo and KIT_STATUS = '#39'A'#39
      '')
    Left = 640
    Top = 8
    object qSomaReconstrucaoRECONSTRUCAO: TIntegerField
      FieldName = 'RECONSTRUCAO'
    end
  end
  object pm_relatorio: TPopupMenu
    Left = 400
    Top = 24
    object QuantidadeMnimadeKits1: TMenuItem
      Caption = 'Quantidade M'#237'nima de Kits'
      OnClick = QuantidadeMnimadeKits1Click
    end
  end
end
