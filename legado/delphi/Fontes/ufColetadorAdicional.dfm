inherited fColetadorAdicional: TfColetadorAdicional
  Caption = 'Coletador Adicional'
  ClientHeight = 357
  StyleElements = [seFont, seClient, seBorder]
  OnShow = FormShow
  ExplicitHeight = 396
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 293
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 279
  end
  inherited PCampos: TPanel
    Height = 217
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 217
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
      Top = 50
      Width = 26
      Height = 13
      Caption = 'Data '
    end
    object Label4: TLabel
      Left = 131
      Top = 50
      Width = 23
      Height = 13
      Caption = 'Hora'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 166
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 8
      Top = 126
      Width = 45
      Height = 13
      Caption = 'Coletador'
      FocusControl = DBLookupComboBoxColetador
    end
    object Label2: TLabel
      Left = 9
      Top = 88
      Width = 76
      Height = 13
      Caption = 'Data Recep'#231#227'o'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'COA_ID'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 131
      Top = 64
      Width = 69
      Height = 21
      DataField = 'COA_HORA'
      DataSource = DSP
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 182
      Width = 654
      Height = 21
      DataField = 'COA_OBS'
      DataSource = DSP
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 141
      Width = 58
      Height = 21
      DataField = 'LCO_COD'
      DataSource = DSP
      TabOrder = 3
    end
    object DBLookupComboBoxColetador: TDBLookupComboBox
      Left = 69
      Top = 141
      Width = 500
      Height = 21
      DataField = 'Lkp_Coletador'
      DataSource = DSP
      TabOrder = 5
    end
    object DBDateEditCOA: TJvDBDateEdit
      Left = 5
      Top = 61
      Width = 120
      Height = 21
      DataField = 'COA_DATA'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 1
    end
    object DBDateEditCOAREC: TJvDBDateEdit
      Left = 9
      Top = 102
      Width = 120
      Height = 21
      DataField = 'COA_DATREC'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 4
    end
  end
  inherited PGrid: TPanel
    Top = 217
    Height = 76
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 201
    ExplicitHeight = 78
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'COA_DATA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COA_HORA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Lkp_Coletador'
          Title.Caption = 'Coletador'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COA_OBS'
          Width = 260
          Visible = True
        end>
    end
  end
  inherited DSP: TDataSource
    DataSet = fProcessos.qColetadorAdicional
  end
end
