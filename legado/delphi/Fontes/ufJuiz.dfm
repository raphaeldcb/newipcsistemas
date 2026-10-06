inherited fJuiz: TfJuiz
  Left = 148
  Top = 111
  Caption = 'Cadastro de Juiz'
  ClientHeight = 285
  OldCreateOrder = True
  ExplicitHeight = 324
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 221
  end
  inherited PCampos: TPanel
    Height = 144
    ExplicitHeight = 144
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
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'JUI_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 654
      Height = 21
      CharCase = ecUpperCase
      DataField = 'JUI_DESC'
      DataSource = DSP
      TabOrder = 1
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 90
      Width = 249
      Height = 43
      Caption = 'Sexo'
      Columns = 2
      DataField = 'JUI_SEXO'
      DataSource = DSP
      Items.Strings = (
        'Masculino'
        'Feminino')
      TabOrder = 2
      Values.Strings = (
        '1'
        '2')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 264
      Top = 90
      Width = 249
      Height = 43
      Caption = 'Receber Cr'#233'ditos?'
      Columns = 2
      DataField = 'JUI_CREDITO'
      DataSource = DSP
      Items.Strings = (
        'Sim'
        'N'#227'o')
      TabOrder = 3
      Values.Strings = (
        'S'
        'N')
    end
  end
  inherited PGrid: TPanel
    Top = 144
    ExplicitTop = 144
    ExplicitHeight = 394
    inherited DBGrid1: TDBGrid
      Width = 715
      Height = 63
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qJuiz
  end
end
