inherited fColaborador: TfColaborador
  Caption = 'Cadastro de Colaboradores'
  ClientHeight = 346
  OnShow = FormShow
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 282
  end
  inherited PCampos: TPanel
    Height = 161
    ExplicitHeight = 161
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 45
      Height = 13
      Caption = 'N'#250'm. PIS'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 96
      Width = 28
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 32
      Width = 134
      Height = 21
      DataField = 'CLB_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 72
      Width = 147
      Height = 21
      DataField = 'CLB_PIS'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 112
      Width = 500
      Height = 21
      DataField = 'CLB_NOME'
      DataSource = DSP
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 161
    Height = 121
    ExplicitTop = 161
    ExplicitHeight = 377
    inherited DBGrid1: TDBGrid
      Height = 106
      Columns = <
        item
          Expanded = False
          FieldName = 'CLB_COD'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLB_PIS'
          Title.Caption = 'PIS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLB_NOME'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qColaborador
  end
end
