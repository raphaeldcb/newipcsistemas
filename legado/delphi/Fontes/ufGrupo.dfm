inherited fRestricao: TfRestricao
  Left = 136
  Top = 160
  Caption = 'Cadastro de Tipos de Restri'#231#227'o'
  ClientHeight = 212
  ClientWidth = 688
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 704
  ExplicitHeight = 251
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 148
    Width = 688
    ExplicitTop = 149
    ExplicitWidth = 692
  end
  inherited PCampos: TPanel
    Width = 688
    Height = 97
    ExplicitWidth = 692
    ExplicitHeight = 97
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
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 64
      Height = 21
      DataField = 'RES_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      DataField = 'RES_DESC'
      DataSource = DSP
      TabOrder = 1
    end
  end
  inherited PGrid: TPanel
    Top = 97
    Width = 688
    Height = 51
    ExplicitTop = 97
    ExplicitWidth = 692
    ExplicitHeight = 441
    inherited DBGrid1: TDBGrid
      Left = 5
      Top = 5
      Width = 682
      Height = 39
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qRestricao
    Left = 480
  end
end
