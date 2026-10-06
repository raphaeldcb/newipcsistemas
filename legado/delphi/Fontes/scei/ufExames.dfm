inherited fExames: TfExames
  Left = 244
  Top = 116
  Caption = 'Cadastro de Exames'
  ClientHeight = 569
  ClientWidth = 764
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitWidth = 780
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 503
    Width = 764
    Height = 66
    ExplicitTop = 536
    ExplicitHeight = 66
    inherited BCnsultar: TSpeedButton
      Visible = False
    end
  end
  inherited PCampos: TPanel
    Width = 764
    Height = 425
    ExplicitHeight = 425
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
      Width = 58
      Height = 13
      Caption = 'Descri'#231#227'o'
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
      Width = 54
      Height = 13
      Caption = 'Unidades'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 144
      Top = 88
      Width = 57
      Height = 13
      Caption = 'Sinon'#237'mia'
      FocusControl = DBEdit4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 70
      Height = 13
      Caption = 'Metodologia'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 8
      Top = 168
      Width = 81
      Height = 13
      Caption = 'Recomenda'#231#245'es'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 8
      Top = 208
      Width = 115
      Height = 13
      Caption = 'Material para Coleta'
      FocusControl = DBEdit10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 383
      Width = 74
      Height = 13
      Caption = 'Valor do Exame'
      FocusControl = DBEdit7
    end
    object Label6: TLabel
      Left = 9
      Top = 247
      Width = 69
      Height = 13
      Caption = 'Observa'#231#227'o'
      FocusControl = DBEdit10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'EXA_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 650
      Height = 21
      DataField = 'EXA_DESC'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 104
      Width = 134
      Height = 21
      DataField = 'EXA_UNM'
      DataSource = DSP
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 144
      Top = 104
      Width = 609
      Height = 21
      DataField = 'EXA_SIN'
      DataSource = DSP
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 144
      Width = 721
      Height = 21
      DataField = 'EXA_MET'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit9: TDBEdit
      Left = 8
      Top = 184
      Width = 750
      Height = 21
      DataField = 'EXA_RECM'
      DataSource = DSP
      TabOrder = 5
    end
    object DBEdit10: TDBEdit
      Left = 8
      Top = 224
      Width = 750
      Height = 21
      DataField = 'EXA_MATE'
      DataSource = DSP
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 8
      Top = 399
      Width = 169
      Height = 21
      DataField = 'EXA_VPAC'
      DataSource = DSP
      TabOrder = 8
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 264
      Width = 749
      Height = 114
      DataField = 'EXA_OBSERV'
      DataSource = DSP
      TabOrder = 7
    end
  end
  inherited PGrid: TPanel
    Top = 425
    Width = 764
    Height = 78
    ExplicitTop = 425
    ExplicitHeight = 111
    inherited DBGrid1: TDBGrid
      Width = 750
    end
  end
  inherited DSP: TDataSource
    DataSet = DMI.qExames
  end
end
