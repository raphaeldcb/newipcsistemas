inherited fMedicos: TfMedicos
  Caption = 'Cadastro de M'#233'dicos'
  ClientHeight = 281
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 320
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 215
    Height = 66
    ExplicitTop = 536
    ExplicitHeight = 66
    inherited BCnsultar: TSpeedButton
      Visible = False
    end
  end
  inherited PCampos: TPanel
    Height = 137
    ExplicitHeight = 137
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 28
      Height = 13
      Caption = 'CRM'
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
      Width = 77
      Height = 13
      Caption = 'Cidade / Estado'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 199
      Height = 21
      DataField = 'MED_CRM'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 600
      Height = 21
      CharCase = ecUpperCase
      DataField = 'MED_NOME'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 104
      Width = 524
      Height = 21
      CharCase = ecUpperCase
      DataField = 'MED_CID'
      DataSource = DSP
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 137
    Height = 78
    ExplicitTop = 137
    ExplicitHeight = 399
  end
  inherited DSP: TDataSource
    DataSet = DMI.qMedico
    Left = 600
  end
end
