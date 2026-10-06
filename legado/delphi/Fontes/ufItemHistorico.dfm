inherited fItemHist: TfItemHist
  Left = 154
  Top = 128
  Caption = 'Cadastro de Itens do Hist'#243'rico'
  ClientHeight = 224
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 263
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 160
    inherited BCnsultar: TSpeedButton
      OnClick = BCnsultarClick
    end
  end
  inherited PCampos: TPanel
    Height = 97
    ExplicitHeight = 97
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
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 436
      Top = 48
      Width = 33
      Height = 13
      Caption = 'Origem'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'ITE_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 425
      Height = 21
      DataField = 'ITE_DESC'
      DataSource = DSP
      TabOrder = 1
    end
    object DBComboBox1: TDBComboBox
      Left = 435
      Top = 64
      Width = 145
      Height = 21
      Hint = 
        'A - Autoriza'#231#227'o'#13#10'F - Folha de Resultados'#13#10'R - Recibo'#13#10'E - Entreg' +
        'a'#13#10'O - Of'#237'cio'#13#10'L - Laudo'
      DataField = 'ITE_ORG'
      DataSource = DSP
      Items.Strings = (
        'A'
        'F'
        'R'
        'E')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 97
    Height = 63
    ExplicitTop = 97
    ExplicitHeight = 441
    inherited DBGrid1: TDBGrid
      Left = 6
      Top = 3
      Height = 57
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qItem
  end
end
