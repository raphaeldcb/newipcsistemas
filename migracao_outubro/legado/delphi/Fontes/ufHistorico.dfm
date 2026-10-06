inherited fHistorico: TfHistorico
  Left = 167
  Top = 203
  Caption = 'Incluir ou Alterar o Hist'#243'rico'
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  inherited PBotoes: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited PCampos: TPanel
    Height = 183
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 183
    object Label1: TLabel
      Left = 6
      Top = 2
      Width = 20
      Height = 13
      Caption = 'Item'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 6
      Top = 42
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label4: TLabel
      Left = 6
      Top = 82
      Width = 55
      Height = 13
      Caption = 'Documento'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 6
      Top = 122
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object DBEdit1: TDBEdit
      Left = 6
      Top = 18
      Width = 57
      Height = 21
      DataField = 'ITE_COD'
      DataSource = DSP
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 66
      Top = 18
      Width = 500
      Height = 21
      DataField = 'DescricaodoItem'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 6
      Top = 98
      Width = 259
      Height = 21
      DataField = 'HIS_DOC'
      DataSource = DSP
      TabOrder = 3
    end
    object DBMemoObs: TDBMemo
      Left = 4
      Top = 137
      Width = 686
      Height = 38
      DataField = 'HIS_OBS'
      DataSource = DSP
      TabOrder = 4
    end
    object DBDateEditDtHist: TJvDBDateEdit
      Left = 6
      Top = 58
      Width = 121
      Height = 21
      DataField = 'HIS_DATA'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 183
    Height = 355
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 183
    ExplicitHeight = 355
    inherited DBGrid1: TDBGrid
      Top = 80
      Height = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'CONTROLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CD_PROCESSO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTROLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBSERVACAO'
          Visible = True
        end>
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qHistorico
    Left = 592
  end
  object qConsultaQuantOficios: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Count(*) QuantOficio'
      'FROM TB_HISTORICO h JOIN TB_ITEM i ON h.ITE_COD=i.ITE_COD'
      'JOIN tb_processo p ON p.PRO_COD=h.PRO_COD'
      'WHERE i.ITE_ORG IS NULL'
      'AND p.PRO_COD = :Codigo')
    Left = 367
    Top = 326
    object qConsultaQuantOficiosQUANTOFICIO: TIntegerField
      FieldName = 'QUANTOFICIO'
    end
  end
end
