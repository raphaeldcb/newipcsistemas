inherited fExtracao: TfExtracao
  Left = 244
  Top = 136
  Caption = 'An'#225'lise das Extra'#231#245'es'
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 536
    Height = 66
    ExplicitTop = 536
    ExplicitHeight = 66
    inherited BCnsultar: TSpeedButton
      Visible = False
    end
  end
  inherited PCampos: TPanel
    Top = 8
    Height = 423
    Align = alCustom
    ExplicitTop = 8
    ExplicitHeight = 423
    object Label20: TLabel
      Left = 6
      Top = 46
      Width = 68
      Height = 13
      Caption = 'Data Extra'#231#227'o'
    end
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 21
      Height = 13
      Caption = 'Lote'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 144
      Top = 6
      Width = 62
      Height = 13
      Caption = 'Respons'#225'vel'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 325
      Top = 6
      Width = 50
      Height = 13
      Caption = 'Supervisor'
      FocusControl = DBEdit3
    end
    object Label23: TLabel
      Left = 520
      Top = 48
      Width = 185
      Height = 29
      Caption = 'DADOS CASOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 548
      Top = 16
      Width = 122
      Height = 29
      Caption = 'F4 - ABRE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBDateEdit5: TJvDBDateEdit
      Left = 6
      Top = 61
      Width = 121
      Height = 21
      DataField = 'EXT_DATA'
      DataSource = DSP
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 6
      Top = 22
      Width = 134
      Height = 21
      DataField = 'MPEA_LOTE'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 144
      Top = 22
      Width = 177
      Height = 21
      DataField = 'EXT_RESP'
      DataSource = DSP
      TabOrder = 1
      OnEnter = DBEdit2Enter
    end
    object DBEdit3: TDBEdit
      Left = 325
      Top = 22
      Width = 176
      Height = 21
      DataField = 'EXT_SUPER'
      DataSource = DSP
      TabOrder = 2
      OnEnter = DBEdit3Enter
    end
    object GroupBox1: TGroupBox
      Left = 7
      Top = 83
      Width = 714
      Height = 126
      Caption = 'Equipamentos'
      TabOrder = 4
      object Label4: TLabel
        Left = 4
        Top = 79
        Width = 31
        Height = 13
        Caption = 'Outros'
        FocusControl = DBEdit4
      end
      object DBCheckBox1: TDBCheckBox
        Left = 5
        Top = 19
        Width = 156
        Height = 17
        Caption = 'Bloco T'#233'rmico n'#186' 19'
        DataField = 'EQU_BLCTER19'
        DataSource = DSP
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 5
        Top = 39
        Width = 156
        Height = 17
        Caption = 'Bloco T'#233'rmico n'#186' 20'
        DataField = 'EQU_BLCTER20'
        DataSource = DSP
        TabOrder = 1
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 5
        Top = 59
        Width = 156
        Height = 17
        Caption = 'Vortex n'#186' 18'
        DataField = 'EQU_VORTEX18'
        DataSource = DSP
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 216
        Top = 18
        Width = 156
        Height = 17
        Caption = 'Agitador Magn'#233'tico n'#186' 25'
        DataField = 'EQU_AGIMAG25'
        DataSource = DSP
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox5: TDBCheckBox
        Left = 216
        Top = 39
        Width = 156
        Height = 17
        Caption = 'Bomba a V'#225'cuo n'#186' 30'
        DataField = 'EQU_BOMBVA30'
        DataSource = DSP
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox6: TDBCheckBox
        Left = 216
        Top = 61
        Width = 156
        Height = 17
        Caption = 'Centr'#237'fuga n'#186' 31'
        DataField = 'EQU_CENTR31'
        DataSource = DSP
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox7: TDBCheckBox
        Left = 472
        Top = 19
        Width = 97
        Height = 17
        Caption = 'Pipeta 10 uL n'#186' '
        DataField = 'EQU_PIP10UL'
        DataSource = DSP
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox8: TDBCheckBox
        Left = 472
        Top = 41
        Width = 105
        Height = 17
        Caption = 'Pipeta 200 uL n'#186' '
        DataField = 'EQU_PIP200UL'
        DataSource = DSP
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox9: TDBCheckBox
        Left = 472
        Top = 63
        Width = 113
        Height = 17
        Caption = 'Pipeta 1000 uL n'#186' '
        DataField = 'EQU_PIP1000UL'
        DataSource = DSP
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit4: TDBEdit
        Left = 4
        Top = 95
        Width = 264
        Height = 21
        DataField = 'EQU_OUTROS'
        DataSource = DSP
        TabOrder = 12
      end
      object DBEdit5: TDBEdit
        Left = 568
        Top = 18
        Width = 33
        Height = 21
        DataField = 'EQU_PIP10ULNUM'
        DataSource = DSP
        TabOrder = 7
      end
      object DBEdit6: TDBEdit
        Left = 576
        Top = 39
        Width = 33
        Height = 21
        DataField = 'EQU_PIP200ULNUM'
        DataSource = DSP
        TabOrder = 9
      end
      object DBEdit7: TDBEdit
        Left = 579
        Top = 61
        Width = 33
        Height = 21
        DataField = 'EQU_PIP1000ULNUM'
        DataSource = DSP
        TabOrder = 11
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 208
      Width = 378
      Height = 65
      Caption = 'Reagentes'
      TabOrder = 5
      object Label5: TLabel
        Left = 5
        Top = 18
        Width = 46
        Height = 13
        Caption = 'FTA - lote'
        FocusControl = DBEdit8
      end
      object Label6: TLabel
        Left = 127
        Top = 18
        Width = 68
        Height = 13
        Caption = 'CHELEX - lote'
        FocusControl = DBEdit9
      end
      object Label7: TLabel
        Left = 249
        Top = 18
        Width = 56
        Height = 13
        Caption = #193'GUA - lote'
        FocusControl = DBEdit10
      end
      object DBEdit8: TDBEdit
        Left = 4
        Top = 34
        Width = 117
        Height = 21
        DataField = 'REA_FTALOTE'
        DataSource = DSP
        TabOrder = 0
      end
      object DBEdit9: TDBEdit
        Left = 126
        Top = 34
        Width = 117
        Height = 21
        DataField = 'REA_CHELEXLOTE'
        DataSource = DSP
        TabOrder = 1
      end
      object DBEdit10: TDBEdit
        Left = 248
        Top = 34
        Width = 117
        Height = 21
        DataField = 'REA_AGUALOTE'
        DataSource = DSP
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 272
      Width = 378
      Height = 144
      Caption = 'Amplifica'#231#227'o'
      TabOrder = 6
      object Label8: TLabel
        Left = 5
        Top = 18
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label9: TLabel
        Left = 7
        Top = 58
        Width = 43
        Height = 13
        Caption = 'KIT - lote'
        FocusControl = DBEdit12
      end
      object Label10: TLabel
        Left = 128
        Top = 18
        Width = 62
        Height = 13
        Caption = 'Respons'#225'vel'
        FocusControl = DBEdit11
      end
      object Label11: TLabel
        Left = 244
        Top = 18
        Width = 50
        Height = 13
        Caption = 'Supervisor'
        FocusControl = DBEdit13
      end
      object Label12: TLabel
        Left = 185
        Top = 58
        Width = 81
        Height = 13
        Caption = 'Termociclador'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 6
        Top = 104
        Width = 37
        Height = 13
        Caption = 'Pipeta'
        FocusControl = DBEdit13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit12: TDBEdit
        Left = 6
        Top = 74
        Width = 117
        Height = 21
        DataField = 'AMPL_KITLOTE'
        DataSource = DSP
        TabOrder = 3
      end
      object DBDateEdit1: TJvDBDateEdit
        Left = 4
        Top = 34
        Width = 121
        Height = 21
        DataField = 'AMPL_DATA'
        DataSource = DSP
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 0
      end
      object DBEdit11: TDBEdit
        Left = 128
        Top = 34
        Width = 113
        Height = 21
        DataField = 'AMPL_RESP'
        DataSource = DSP
        TabOrder = 1
        OnEnter = DBEdit11Enter
      end
      object DBEdit13: TDBEdit
        Left = 244
        Top = 34
        Width = 125
        Height = 21
        DataField = 'AMPL_SUPER'
        DataSource = DSP
        TabOrder = 2
        OnEnter = DBEdit13Enter
      end
      object DBCheckBox10: TDBCheckBox
        Left = 184
        Top = 75
        Width = 57
        Height = 17
        Caption = '9700'
        DataField = 'AMPL_TERM9700'
        DataSource = DSP
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox11: TDBCheckBox
        Left = 240
        Top = 75
        Width = 65
        Height = 17
        Caption = '2720'
        DataField = 'AMPL_TERM2720'
        DataSource = DSP
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox12: TDBCheckBox
        Left = 8
        Top = 123
        Width = 97
        Height = 17
        Caption = 'Pipeta 10 uL n'#186' '
        DataField = 'AMPL_PIP10UL'
        DataSource = DSP
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox13: TDBCheckBox
        Left = 120
        Top = 121
        Width = 105
        Height = 17
        Caption = 'Pipeta 200 uL n'#186' '
        DataField = 'AMPL_PIP200UL'
        DataSource = DSP
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox14: TDBCheckBox
        Left = 240
        Top = 121
        Width = 113
        Height = 17
        Caption = 'Pipeta 1000 uL n'#186' '
        DataField = 'AMPL_PIP1000UL'
        DataSource = DSP
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object GroupBox4: TGroupBox
      Left = 386
      Top = 208
      Width = 337
      Height = 208
      Caption = 'Sequenciamento'
      TabOrder = 7
      object Label14: TLabel
        Left = 5
        Top = 13
        Width = 59
        Height = 13
        Caption = 'Data Corrida'
      end
      object Label15: TLabel
        Left = 7
        Top = 93
        Width = 77
        Height = 13
        Caption = 'Formamida - lote'
        FocusControl = DBEdit14
      end
      object Label16: TLabel
        Left = 5
        Top = 53
        Width = 62
        Height = 13
        Caption = 'Respons'#225'vel'
        FocusControl = DBEdit15
      end
      object Label17: TLabel
        Left = 121
        Top = 53
        Width = 50
        Height = 13
        Caption = 'Supervisor'
        FocusControl = DBEdit16
      end
      object Label19: TLabel
        Left = 6
        Top = 170
        Width = 37
        Height = 13
        Caption = 'Pipeta'
        FocusControl = DBEdit16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 127
        Top = 93
        Width = 42
        Height = 13
        Caption = 'ILS - lote'
        FocusControl = DBEdit17
      end
      object Label22: TLabel
        Left = 7
        Top = 132
        Width = 70
        Height = 13
        Caption = 'LADDER - lote'
        FocusControl = DBEdit19
      end
      object DBEdit14: TDBEdit
        Left = 6
        Top = 109
        Width = 117
        Height = 21
        DataField = 'SEQ_FORLOTE'
        DataSource = DSP
        TabOrder = 3
      end
      object DBDateEdit2: TJvDBDateEdit
        Left = 4
        Top = 29
        Width = 121
        Height = 21
        DataField = 'SEQ_DTCORR'
        DataSource = DSP
        NumGlyphs = 2
        ShowNullDate = False
        TabOrder = 0
      end
      object DBEdit15: TDBEdit
        Left = 5
        Top = 69
        Width = 113
        Height = 21
        DataField = 'SEQ_RESP'
        DataSource = DSP
        TabOrder = 1
        OnEnter = DBEdit15Enter
      end
      object DBEdit16: TDBEdit
        Left = 121
        Top = 69
        Width = 125
        Height = 21
        DataField = 'SEQ_SUPER'
        DataSource = DSP
        TabOrder = 2
        OnEnter = DBEdit16Enter
      end
      object DBCheckBox17: TDBCheckBox
        Left = 8
        Top = 187
        Width = 97
        Height = 17
        Caption = 'Pipeta 10 uL n'#186' '
        DataField = 'SEQ_PIP10UL'
        DataSource = DSP
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox18: TDBCheckBox
        Left = 113
        Top = 185
        Width = 105
        Height = 17
        Caption = 'Pipeta 200 uL n'#186' '
        DataField = 'SEQ_PIP200UL'
        DataSource = DSP
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox19: TDBCheckBox
        Left = 224
        Top = 184
        Width = 110
        Height = 17
        Caption = 'Pipeta 1000 uL n'#186' '
        DataField = 'SEQ_PIP1000UL'
        DataSource = DSP
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBEdit17: TDBEdit
        Left = 126
        Top = 109
        Width = 117
        Height = 21
        DataField = 'SEQ_ILSLOTE'
        DataSource = DSP
        TabOrder = 4
      end
      object DBEdit19: TDBEdit
        Left = 6
        Top = 148
        Width = 117
        Height = 21
        DataField = 'SEQ_LADLOTE'
        DataSource = DSP
        TabOrder = 5
      end
    end
    object bbtCasos: TBitBtn
      Left = 640
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Casos'
      TabOrder = 8
      Visible = False
      OnClick = bbtCasosClick
    end
  end
  inherited PGrid: TPanel
    Top = 427
    Height = 106
    Align = alCustom
    ExplicitTop = 427
    ExplicitHeight = 106
    inherited DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Height = 95
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qExtracao
  end
end
