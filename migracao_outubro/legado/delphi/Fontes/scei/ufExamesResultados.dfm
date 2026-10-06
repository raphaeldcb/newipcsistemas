inherited fProcedimentosResultados: TfProcedimentosResultados
  Left = 334
  Top = 225
  Height = 373
  Caption = 'Resultados - Exames de Infecciosas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 270
    inherited BCnsultar: TSpeedButton
      Visible = False
    end
  end
  inherited PCampos: TPanel
    Height = 169
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Resultado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 8
      Top = 127
      Width = 30
      Height = 13
      Caption = 'UI/mL'
      Enabled = False
      FocusControl = DBEdit9
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 6
      Top = 49
      Width = 53
      Height = 13
      Caption = 'Log C'#243'pias'
      Enabled = False
      FocusControl = DBEdit11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 6
      Top = 89
      Width = 39
      Height = 13
      Caption = 'C'#211'PIAS'
      Enabled = False
      FocusControl = DBEdit7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DBCB_Resultado: TDBComboBox
      Left = 6
      Top = 24
      Width = 296
      Height = 21
      DataField = 'PRO_RESUL'
      DataSource = DSP
      ItemHeight = 13
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 1'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 1a'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 1b'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 2'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 3'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 4'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 5'
        'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 6')
      TabOrder = 0
      OnEnter = DBCB_ResultadoExit
      OnExit = DBCB_ResultadoExit
    end
    object DBEdit9: TDBEdit
      Left = 6
      Top = 143
      Width = 251
      Height = 21
      DataField = 'PRO_UINT'
      DataSource = DSP
      Enabled = False
      TabOrder = 3
    end
    object DBEdit11: TDBEdit
      Left = 6
      Top = 65
      Width = 251
      Height = 21
      DataField = 'PRO_VLOG'
      DataSource = DSP
      Enabled = False
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Left = 6
      Top = 105
      Width = 251
      Height = 21
      DataField = 'PRO_CMLI'
      DataSource = DSP
      Enabled = False
      TabOrder = 2
    end
  end
  inherited PGrid: TPanel
    Top = 169
    Height = 101
    inherited DBGrid1: TDBGrid
      Height = 87
      Columns = <
        item
          Expanded = False
          FieldName = 'PROR_COD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRO_COD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROR_DAT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRO_VLOG'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRO_UINT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRO_CMLI'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PRO_RESUL'
          Visible = True
        end>
    end
  end
  inherited DSP: TDataSource
    DataSet = DMI.qProcedimentos_Resultado
  end
end
