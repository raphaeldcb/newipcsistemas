inherited fLaboratorios: TfLaboratorios
  Left = 315
  Top = 202
  Caption = 'Cadastro de Laborat'#243'rios'
  ClientHeight = 443
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 482
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 377
    Height = 66
    ExplicitTop = 536
    ExplicitHeight = 66
    inherited BNovo: TSpeedButton
      Width = 69
      ExplicitWidth = 69
    end
    inherited BCnsultar: TSpeedButton
      Visible = False
    end
  end
  inherited PCampos: TPanel
    Height = 297
    ExplicitHeight = 297
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
      Width = 62
      Height = 13
      Caption = 'Respons'#225'vel'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 8
      Top = 85
      Width = 24
      Height = 13
      Caption = 'CRM'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 128
      Width = 65
      Height = 13
      Caption = 'Laborat'#243'rio'
      FocusControl = DBEdit5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 24
      Height = 13
      Caption = 'Fone'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 8
      Top = 208
      Width = 54
      Height = 13
      Caption = 'Logradouro'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 8
      Top = 248
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 342
      Top = 248
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'LAB_COD'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 592
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LAB_NOME'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 101
      Width = 133
      Height = 21
      DataField = 'LAB_CRM'
      DataSource = DSP
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 144
      Width = 692
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LAB_LABT'
      DataSource = DSP
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 184
      Width = 329
      Height = 21
      DataField = 'LAB_FONE'
      DataSource = DSP
      MaxLength = 13
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 8
      Top = 224
      Width = 692
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LAB_END'
      DataSource = DSP
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 8
      Top = 264
      Width = 329
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LAB_CID'
      DataSource = DSP
      TabOrder = 6
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 340
      Top = 264
      Width = 46
      Height = 21
      DataField = 'UF_SIGLA'
      DataSource = DSP
      KeyField = 'UF_SIGLA'
      ListField = 'UF_SIGLA'
      ListSource = DMI.DS_UF
      TabOrder = 7
    end
  end
  inherited PGrid: TPanel
    Top = 297
    Height = 80
    ExplicitTop = 297
    ExplicitHeight = 239
  end
  inherited DSP: TDataSource
    DataSet = DMI.qLaboratorios
  end
end
