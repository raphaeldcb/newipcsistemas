inherited fExtracaoCasos: TfExtracaoCasos
  Left = 399
  Top = 246
  Caption = 'An'#225'lise de Extra'#231#227'o - CASOS'
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 537
    Height = 65
    ExplicitTop = 549
    ExplicitWidth = 721
    ExplicitHeight = 65
  end
  inherited PCampos: TPanel
    Height = 544
    ExplicitWidth = 721
    ExplicitHeight = 544
    object GroupBox3: TGroupBox
      Left = 3
      Top = 4
      Width = 718
      Height = 263
      Caption = 'An'#225'lise'
      TabOrder = 0
      object Label8: TLabel
        Left = 5
        Top = 18
        Width = 58
        Height = 13
        Caption = 'Data Leitura'
      end
      object Label9: TLabel
        Left = 486
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Caso'
        FocusControl = DBEdit12
      end
      object Label10: TLabel
        Left = 248
        Top = 18
        Width = 182
        Height = 13
        Caption = 'Resp. Confer'#234'ncia FORM15xFORM16'
        FocusControl = DBEdit11
      end
      object Label7: TLabel
        Left = 130
        Top = 18
        Width = 21
        Height = 13
        Caption = 'Lote'
        FocusControl = DBEdit5
      end
      object DBEdit12: TDBEdit
        Left = 485
        Top = 34
        Width = 117
        Height = 21
        DataField = 'PRO_COD'
        DataSource = DSP
        TabOrder = 3
        OnExit = DBEdit12Exit
      end
      object DBDateEdit1: TJvDBDateEdit
        Left = 4
        Top = 34
        Width = 121
        Height = 21
        DataField = 'ANA_DTLEIT'
        DataSource = DSP
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 0
      end
      object DBEdit11: TDBEdit
        Left = 248
        Top = 34
        Width = 233
        Height = 21
        DataField = 'ANA_RESCONF'
        DataSource = DSP
        TabOrder = 2
        OnEnter = DBEdit11Enter
      end
      object DBGrid2: TDBGrid
        Left = 4
        Top = 58
        Width = 709
        Height = 120
        DataSource = ds_Alelos
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NM2_ALE'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAR_ALE'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AL1_ALE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AL2_ALE'
            Width = 100
            Visible = True
          end>
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 6
        Top = 179
        Width = 233
        Height = 38
        Caption = 'Iniciais'
        Columns = 2
        DataField = 'ANA_INICONFNCONF'
        DataSource = DSP
        Items.Strings = (
          'Conforme'
          'N'#227'o Conforme')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 6
        Top = 219
        Width = 233
        Height = 38
        Caption = 'Inclus'#227'o entre M'#227'e e Crian'#231'a'
        Columns = 2
        DataField = 'ANA_INCLMACRI'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 8
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 243
        Top = 179
        Width = 233
        Height = 38
        Caption = 'Similaridade de Gen'#243'tipos entre as amostras'
        Columns = 2
        DataField = 'ANA_SIMGEAMO'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 6
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup4: TDBRadioGroup
        Left = 243
        Top = 219
        Width = 233
        Height = 38
        Caption = 'Inclus'#227'o entre M'#227'e e Suposto Pai'
        Columns = 2
        DataField = 'ANA_INCLMASUP'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 9
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup5: TDBRadioGroup
        Left = 480
        Top = 179
        Width = 233
        Height = 38
        Caption = 'O Ladder comporta todos os seus alelos'
        Columns = 2
        DataField = 'ANA_LADCOMPALE'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 7
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup6: TDBRadioGroup
        Left = 480
        Top = 219
        Width = 233
        Height = 38
        Caption = 'Controle DNA'
        Columns = 2
        DataField = 'ANA_CONTRDNA'
        DataSource = DSP
        Items.Strings = (
          'Conforme'
          'N'#227'o Conforme')
        TabOrder = 10
        Values.Strings = (
          '0'
          '1')
      end
      object DBEdit5: TDBEdit
        Left = 129
        Top = 34
        Width = 114
        Height = 21
        DataField = 'MPEA_LOTE'
        DataSource = DSP
        TabOrder = 1
        OnExit = DBEdit12Exit
      end
    end
    object GroupBox2: TGroupBox
      Left = 451
      Top = 266
      Width = 268
      Height = 147
      Caption = 'Outras an'#225'lises'
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 42
        Width = 65
        Height = 13
        Caption = 'Resp. An'#225'lise'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 10
        Top = 82
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object DBCheckBox6: TDBCheckBox
        Left = 8
        Top = 22
        Width = 73
        Height = 20
        Caption = 'DP18'
        DataField = 'ANA_OUANADP18'
        DataSource = DSP
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox7: TDBCheckBox
        Left = 88
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Cromossomo Y'
        DataField = 'ANA_OUANACROY'
        DataSource = DSP
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 58
        Width = 161
        Height = 21
        DataField = 'ANA_OUANARESP'
        DataSource = DSP
        TabOrder = 2
        OnEnter = DBEdit2Enter
      end
      object DBDateEdit2: TJvDBDateEdit
        Left = 8
        Top = 98
        Width = 121
        Height = 21
        DataField = 'ANA_OUANADATA'
        DataSource = DSP
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 3
      end
      object DBCheckBox8: TDBCheckBox
        Left = 10
        Top = 124
        Width = 113
        Height = 17
        Caption = 'Inconclusivo'
        DataField = 'ANA_INCLUSIVO'
        DataSource = DSP
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 266
      Width = 448
      Height = 147
      Caption = 'Resultado'
      TabOrder = 2
      object Label1: TLabel
        Left = 325
        Top = 7
        Width = 45
        Height = 13
        Caption = 'Marcador'
        FocusControl = DBEdit1
      end
      object DBCheckBox1: TDBCheckBox
        Left = 8
        Top = 22
        Width = 73
        Height = 20
        Caption = 'Inclus'#227'o'
        DataField = 'ANA_INCLUSAO'
        DataSource = DSP
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 8
        Top = 72
        Width = 71
        Height = 17
        Caption = 'Exclus'#227'o'
        DataField = 'ANA_EXCLUSAO'
        DataSource = DSP
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBRadioGroup7: TDBRadioGroup
        Left = 83
        Top = 7
        Width = 236
        Height = 38
        Caption = 'Muta'#231#227'o'
        Columns = 2
        DataField = 'ANA_MUTACAO'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object DBEdit1: TDBEdit
        Left = 324
        Top = 23
        Width = 117
        Height = 21
        DataField = 'ANA_MARCADOR'
        DataSource = DSP
        TabOrder = 2
      end
      object DBRadioGroup8: TDBRadioGroup
        Left = 83
        Top = 47
        Width = 236
        Height = 30
        Caption = 'Contraprova'
        Columns = 2
        DataField = 'ANA_CONTRAPROVA'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 4
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup9: TDBRadioGroup
        Left = 83
        Top = 78
        Width = 236
        Height = 30
        Caption = 'Conforme'
        Columns = 2
        DataField = 'ANA_CONFORME'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup10: TDBRadioGroup
        Left = 6
        Top = 107
        Width = 139
        Height = 30
        Caption = 'Repeti'#231#227'o'
        Columns = 2
        DataField = 'ANA_REPETICAO'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 6
        Values.Strings = (
          '0'
          '1')
      end
      object DBCheckBox3: TDBCheckBox
        Left = 155
        Top = 115
        Width = 46
        Height = 17
        Caption = 'M'
        DataField = 'ANA_REPETICAOM'
        DataSource = DSP
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 211
        Top = 115
        Width = 38
        Height = 17
        Caption = 'C'
        DataField = 'ANA_REPETICAOC'
        DataSource = DSP
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox5: TDBCheckBox
        Left = 259
        Top = 115
        Width = 65
        Height = 17
        Caption = 'SP'
        DataField = 'ANA_REPETICAOSP'
        DataSource = DSP
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object GroupBox4: TGroupBox
      Left = 3
      Top = 413
      Width = 716
      Height = 131
      Caption = 'Supervis'#227'o'
      TabOrder = 3
      object Label4: TLabel
        Left = 4
        Top = 52
        Width = 90
        Height = 13
        Caption = 'Supervis'#227'o An'#225'lise'
        FocusControl = DBEdit3
      end
      object Label5: TLabel
        Left = 169
        Top = 52
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label6: TLabel
        Left = 265
        Top = 90
        Width = 83
        Height = 13
        Caption = 'Se pessoal,  Para'
        FocusControl = DBEdit4
      end
      object DBRadioGroup14: TDBRadioGroup
        Left = 5
        Top = 91
        Width = 256
        Height = 37
        Caption = 'Meio de Remessa (Resultado)'
        Columns = 3
        DataField = 'SUP_MEIOREM'
        DataSource = DSP
        Items.Strings = (
          'E-mail'
          'Fax'
          'Pessoal')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object DBRadioGroup11: TDBRadioGroup
        Left = 4
        Top = 14
        Width = 233
        Height = 38
        Caption = 'Similaridade de Gen'#243'tipos entre as amostras'
        Columns = 2
        DataField = 'SUP_SIMGEAMO'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup12: TDBRadioGroup
        Left = 241
        Top = 14
        Width = 233
        Height = 38
        Caption = 'Inclus'#227'o entre M'#227'e e Crian'#231'a'
        Columns = 2
        DataField = 'SUP_INCLMACRI'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object DBRadioGroup15: TDBRadioGroup
        Left = 479
        Top = 14
        Width = 233
        Height = 38
        Caption = 'Inclus'#227'o entre M'#227'e e Suposto Pai'
        Columns = 2
        DataField = 'SUP_INCLMASUP'
        DataSource = DSP
        Items.Strings = (
          'Sim'
          'N'#227'o')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
      object DBEdit3: TDBEdit
        Left = 4
        Top = 68
        Width = 161
        Height = 21
        DataField = 'SUP_SUPER'
        DataSource = DSP
        TabOrder = 3
        OnEnter = DBEdit3Enter
      end
      object DBDateEdit3: TJvDBDateEdit
        Left = 168
        Top = 68
        Width = 121
        Height = 21
        DataField = 'SUP_DATA'
        DataSource = DSP
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 4
      end
      object DBEdit4: TDBEdit
        Left = 265
        Top = 106
        Width = 161
        Height = 21
        DataField = 'SUP_PESPARA'
        DataSource = DSP
        TabOrder = 6
      end
    end
  end
  inherited PGrid: TPanel
    Top = 544
    Height = 5
    ExplicitTop = 544
    ExplicitWidth = 721
    ExplicitHeight = 5
  end
  inherited DSP: TDataSource
    DataSet = DM.qExtracaoCasos
  end
  object qConsultaAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_ALELOS              '
      'where NM1_ALE = :Numero')
    Left = 272
    Top = 79
    object qConsultaAlelosCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qConsultaAlelosNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qConsultaAlelosNM2_ALE: TStringField
      DisplayLabel = 'Pessoa'
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qConsultaAlelosNM3_ALE: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qConsultaAlelosNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qConsultaAlelosMAR_ALE: TStringField
      DisplayLabel = 'Marcador'
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qConsultaAlelosAL1_ALE: TStringField
      DisplayLabel = 'Alelo 1'
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qConsultaAlelosAL2_ALE: TStringField
      DisplayLabel = 'Alelo 2'
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qConsultaAlelosORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object ds_Alelos: TDataSource
    DataSet = qConsultaAlelos
    Left = 243
    Top = 80
  end
end
