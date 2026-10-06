inherited fEstado: TfEstado
  Width = 715
  Height = 260
  Caption = 'Cadastro de Estados'
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 158
    Width = 699
  end
  inherited PCampos: TPanel
    Width = 699
    Height = 97
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Sigla'
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
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 30
      Height = 21
      DataField = 'UF_SIGLA'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 264
      Height = 21
      DataField = 'UF_SIGLA'
      DataSource = DSP
      TabOrder = 1
    end
  end
  inherited PGrid: TPanel
    Top = 97
    Width = 699
    Height = 61
    inherited DBGrid1: TDBGrid
      Top = 6
      Width = 684
      Height = 49
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qUF
  end
end
