inherited fColetadoresRelatorios: TfColetadoresRelatorios
  Left = 172
  Top = 179
  Caption = 'Coletadores para Relat'#243'rio valores a serem pagos'
  ClientHeight = 289
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 328
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 225
  end
  inherited PCampos: TPanel
    Height = 145
    ExplicitHeight = 145
    object Label1: TLabel
      Left = 8
      Top = 50
      Width = 80
      Height = 13
      Caption = 'C'#243'digo do SCPG'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Ordem'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 89
      Width = 91
      Height = 13
      Caption = 'Nome do Coletador'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 66
      Width = 134
      Height = 21
      DataField = 'CODIGO'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'ORDEM'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 105
      Width = 650
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = DSP
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 145
    Height = 80
    ExplicitTop = 145
    ExplicitHeight = 393
  end
  inherited DSP: TDataSource
    DataSet = DM.qColetadoresRelatorios
  end
end
