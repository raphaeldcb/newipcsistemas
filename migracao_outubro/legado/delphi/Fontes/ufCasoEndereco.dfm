inherited fCasoEndereco: TfCasoEndereco
  Left = 261
  Top = 116
  Caption = 'Endere'#231'o do Destino do Laudo'
  ClientHeight = 440
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 376
  end
  inherited PCampos: TPanel
    Height = 297
    ExplicitHeight = 297
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      Enabled = False
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 128
      Width = 27
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 168
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 8
      Top = 208
      Width = 21
      Height = 13
      Caption = 'CEP'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 8
      Top = 248
      Width = 14
      Height = 13
      Caption = 'UF'
      FocusControl = DBEdit7
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'COR_COD'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 104
      Width = 700
      Height = 21
      DataField = 'COR_END'
      DataSource = DSP
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 144
      Width = 524
      Height = 21
      DataField = 'COR_BAIRRO'
      DataSource = DSP
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 184
      Width = 400
      Height = 21
      DataField = 'COR_CID'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 224
      Width = 150
      Height = 21
      DataField = 'COR_CEP'
      DataSource = DSP
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 8
      Top = 264
      Width = 25
      Height = 21
      DataField = 'UF_SIGLA'
      DataSource = DSP
      TabOrder = 6
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 48
      Width = 601
      Height = 33
      Caption = 'Destino'
      Columns = 4
      DataField = 'COR_DESTINO'
      DataSource = DSP
      Items.Strings = (
        'F'#211'RUM'
        'DEFENSORIA'
        'PROMOTORIA'
        'CONSELHO TUTELAR')
      TabOrder = 1
      Values.Strings = (
        'F'#211'RUM'
        'DEFENSORIA'
        'PROMOTORIA'
        'CONSELHO TUTELAR')
    end
  end
  inherited PGrid: TPanel
    Top = 297
    Height = 79
    ExplicitTop = 297
    ExplicitHeight = 241
  end
  inherited DSP: TDataSource
    DataSet = DM.qCasoEndereco
  end
end
