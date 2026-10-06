inherited fImpressoes: TfImpressoes
  Left = 106
  Top = 157
  Caption = 'Impress'#245'es dessa A'#231#227'o'
  ClientHeight = 330
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 369
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 266
    inherited BNovo: TSpeedButton
      Width = 72
      ExplicitWidth = 72
    end
  end
  inherited PCampos: TPanel
    Height = 185
    ExplicitHeight = 185
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 144
      Top = 8
      Width = 20
      Height = 13
      Caption = 'Item'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 51
      Width = 79
      Height = 13
      Caption = 'Tipo Documento'
    end
    object Label4: TLabel
      Left = 8
      Top = 93
      Width = 104
      Height = 13
      Caption = 'Quantidade de Folhas'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 144
      Top = 93
      Width = 100
      Height = 13
      Caption = 'Quantidade Impressa'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 8
      Top = 136
      Width = 51
      Height = 13
      Caption = 'Impressora'
    end
    object Label7: TLabel
      Left = 280
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'PRO_COD'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 144
      Top = 24
      Width = 134
      Height = 21
      DataField = 'ITE_COD'
      DataSource = DSP
      Enabled = False
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 109
      Width = 134
      Height = 21
      DataField = 'IMP_QDFL'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 144
      Top = 109
      Width = 134
      Height = 21
      DataField = 'IMP_QDIM'
      DataSource = DSP
      TabOrder = 5
    end
    object DBComboBox1: TDBComboBox
      Left = 9
      Top = 67
      Width = 248
      Height = 21
      DataField = 'IMP_TIPO'
      DataSource = DSP
      Items.Strings = (
        'Laudo'
        'Of'#237'cios'
        'Folha de Resultados'
        'Outros')
      TabOrder = 3
    end
    object DBComboBox2: TDBComboBox
      Left = 9
      Top = 152
      Width = 376
      Height = 21
      DataField = 'IMP_IMPR'
      DataSource = DSP
      Items.Strings = (
        'HP 2600 (Sala Montagem)'
        'HP 2600 ('#193'rea Tecnica - Escada)'
        'HP 2600 (Sala Dr. Helder)'
        'HP 2600 (Laborat'#243'rio)'
        'HP 1300 ('#193'rea Tecnica - Escada)'
        'HP 1010 (Triagem)'
        'HP 1010 (Sala Adriana)'
        'HP 1020 (Sala Luiza)'
        ''
        '')
      TabOrder = 6
    end
    object DBDateEdit1: TJvDBDateEdit
      Left = 280
      Top = 24
      Width = 121
      Height = 21
      DataField = 'IMP_DATA'
      DataSource = DSP
      Enabled = False
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 185
    Height = 81
    ExplicitTop = 185
    ExplicitHeight = 353
    inherited DBGrid1: TDBGrid
      Width = 711
      Height = 66
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qImpressoes
  end
end
