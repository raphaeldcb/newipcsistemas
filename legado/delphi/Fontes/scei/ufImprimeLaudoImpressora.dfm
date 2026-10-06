object fImprimeLaudoImpressora: TfImprimeLaudoImpressora
  Left = 665
  Top = 86
  Caption = 'Laudo'
  ClientHeight = 616
  ClientWidth = 816
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport_Primeiro: TRLReport
    Left = -56
    Top = -152
    Width = 794
    Height = 1123
    Margins.LeftMargin = 30.200000000000000000
    Margins.TopMargin = 70.200000000000000000
    Margins.RightMargin = 10.200000000000000000
    Margins.BottomMargin = 8.000000000000000000
    DataSource = DMI.dsRelLaudo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand4: TRLBand
      Left = 114
      Top = 265
      Width = 641
      Height = 703
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBText17: TRLDBText
        Left = 23
        Top = 421
        Width = 87
        Height = 16
        DataField = 'PRO_RESUL'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText19: TRLDBText
        Left = 317
        Top = 420
        Width = 70
        Height = 16
        DataField = 'EXA_VRE'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel27: TRLLabel
        Left = 151
        Top = 420
        Width = 162
        Height = 16
        Caption = 'c'#243'pias do v'#237'rus do(a) '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel79: TRLLabel
        Left = 10
        Top = 56
        Width = 154
        Height = 16
        Caption = 'DADOS CADASTRAIS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel80: TRLLabel
        Left = 10
        Top = 85
        Width = 128
        Height = 14
        Caption = 'Nome do Paciente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText47: TRLDBText
        Left = 142
        Top = 85
        Width = 73
        Height = 14
        DataField = 'PES_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText49: TRLDBText
        Left = 86
        Top = 108
        Width = 71
        Height = 14
        DataField = 'PRO_PROT'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel81: TRLLabel
        Left = 10
        Top = 109
        Width = 72
        Height = 14
        Caption = 'Protocolo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel82: TRLLabel
        Left = 10
        Top = 134
        Width = 59
        Height = 14
        Caption = 'Coleta..:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText53: TRLDBText
        Left = 74
        Top = 134
        Width = 73
        Height = 14
        DataField = 'PRO_DCOL'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel83: TRLLabel
        Left = 70
        Top = 159
        Width = 26
        Height = 14
        Caption = 'Dr. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText54: TRLDBText
        Left = 98
        Top = 159
        Width = 76
        Height = 14
        DataField = 'MED_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel84: TRLLabel
        Left = 10
        Top = 159
        Width = 55
        Height = 14
        Caption = 'M'#233'dico:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel85: TRLLabel
        Left = 9
        Top = 208
        Width = 156
        Height = 16
        Caption = 'AN'#193'LISE REALIZADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText55: TRLDBText
        Left = 11
        Top = 232
        Width = 70
        Height = 14
        DataField = 'EXA_DESC'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel86: TRLLabel
        Left = 10
        Top = 252
        Width = 74
        Height = 14
        Caption = 'Sinon'#237'mia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText56: TRLDBText
        Left = 88
        Top = 252
        Width = 58
        Height = 14
        DataField = 'EXA_SIN'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel87: TRLLabel
        Left = 10
        Top = 293
        Width = 192
        Height = 16
        Caption = 'METODOLOGIA APLICADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText57: TRLDBText
        Left = 12
        Top = 316
        Width = 61
        Height = 14
        DataField = 'EXA_MET'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel88: TRLLabel
        Left = 13
        Top = 337
        Width = 364
        Height = 14
        Caption = 'Equipamento ABI7000 Detector de Seq'#252#234'ncias Gen'#233'ticas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel89: TRLLabel
        Left = 13
        Top = 359
        Width = 155
        Height = 14
        Caption = 'Sensibilidade m'#237'nima de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText58: TRLDBText
        Left = 171
        Top = 359
        Width = 23
        Height = 16
        AutoSize = False
        DataField = 'EXA_UNM'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel90: TRLLabel
        Left = 197
        Top = 360
        Width = 232
        Height = 14
        Caption = 'Unidade Internacionais por mililitro ('
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText59: TRLDBText
        Left = 428
        Top = 360
        Width = 23
        Height = 16
        AutoSize = False
        DataField = 'EXA_UNM'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel91: TRLLabel
        Left = 455
        Top = 361
        Width = 40
        Height = 14
        Caption = 'Ul/ml)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel92: TRLLabel
        Left = 11
        Top = 397
        Width = 93
        Height = 16
        Caption = 'RESULTADO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDataHoje_Primeiro: TRLLabel
        Left = 154
        Top = 526
        Width = 57
        Height = 13
        Caption = 'DataHoje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel43: TRLLabel
        Left = 19
        Top = 449
        Width = 327
        Height = 13
        Caption = 'Obs.: N'#227'o foram detectadas c'#243'pias do v'#237'rus do(a)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText23: TRLDBText
        Left = 349
        Top = 449
        Width = 61
        Height = 13
        DataField = 'EXA_VRE'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel53: TRLLabel
        Left = 479
        Top = 449
        Width = 163
        Height = 13
        Caption = 'na amostra testada ou o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel55: TRLLabel
        Left = 19
        Top = 469
        Width = 421
        Height = 13
        Caption = 'n'#250'mero de c'#243'pias est'#225' abaixo do limite de detec'#231#227'o do m'#233'todo.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel78: TRLLabel
        Left = 70
        Top = 20
        Width = 287
        Height = 18
        Caption = ' RESULTADO DE LABORAT'#211'RIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel68: TRLLabel
        Left = 36
        Top = 616
        Width = 42
        Height = 13
        Caption = 'ICPMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel75: TRLLabel
        Left = 24
        Top = 526
        Width = 124
        Height = 13
        Caption = 'Campo Grande, MS, '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLReport_Segundo: TRLReport
    Left = 512
    Top = -189
    Width = 794
    Height = 1123
    Margins.LeftMargin = 30.200000000000000000
    Margins.TopMargin = 70.200000000000000000
    Margins.RightMargin = 10.200000000000000000
    Margins.BottomMargin = 8.000000000000000000
    DataSource = DMI.dsRelLaudo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand2: TRLBand
      Left = 114
      Top = 265
      Width = 641
      Height = 701
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBText6: TRLDBText
        Left = 20
        Top = 421
        Width = 87
        Height = 16
        DataField = 'PRO_RESUL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 317
        Top = 421
        Width = 70
        Height = 16
        DataField = 'EXA_VRE'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel10: TRLLabel
        Left = 152
        Top = 421
        Width = 162
        Height = 16
        Caption = 'c'#243'pias do v'#237'rus do(a) '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText25: TRLDBText
        Left = 226
        Top = 422
        Width = 78
        Height = 16
        DataField = 'PRO_CMLI'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel36: TRLLabel
        Left = 20
        Top = 422
        Width = 196
        Height = 16
        Caption = 'N.'#186' de C'#243'pias por Mililitro :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel37: TRLLabel
        Left = 20
        Top = 440
        Width = 39
        Height = 16
        Caption = 'Log :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText26: TRLDBText
        Left = 62
        Top = 440
        Width = 81
        Height = 16
        DataField = 'PRO_VLOG'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 10
        Top = 56
        Width = 154
        Height = 16
        Caption = 'DADOS CADASTRAIS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 10
        Top = 85
        Width = 128
        Height = 14
        Caption = 'Nome do Paciente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 142
        Top = 85
        Width = 73
        Height = 14
        DataField = 'PES_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 86
        Top = 108
        Width = 71
        Height = 14
        DataField = 'PRO_PROT'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 10
        Top = 109
        Width = 72
        Height = 14
        Caption = 'Protocolo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 10
        Top = 134
        Width = 59
        Height = 14
        Caption = 'Coleta..:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 74
        Top = 134
        Width = 73
        Height = 14
        DataField = 'PRO_DCOL'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 98
        Top = 159
        Width = 76
        Height = 14
        DataField = 'MED_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel6: TRLLabel
        Left = 70
        Top = 159
        Width = 26
        Height = 14
        Caption = 'Dr. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 10
        Top = 159
        Width = 55
        Height = 14
        Caption = 'M'#233'dico:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 9
        Top = 207
        Width = 156
        Height = 16
        Caption = 'AN'#193'LISE REALIZADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 11
        Top = 232
        Width = 70
        Height = 14
        DataField = 'EXA_DESC'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel9: TRLLabel
        Left = 10
        Top = 252
        Width = 74
        Height = 14
        Caption = 'Sinon'#237'mia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 88
        Top = 252
        Width = 58
        Height = 14
        DataField = 'EXA_SIN'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel11: TRLLabel
        Left = 10
        Top = 294
        Width = 203
        Height = 16
        Caption = 'MEOTODOLOGIA APLICADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText9: TRLDBText
        Left = 12
        Top = 316
        Width = 61
        Height = 14
        DataField = 'EXA_MET'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 13
        Top = 337
        Width = 364
        Height = 14
        Caption = 'Equipamento ABI7000 Detector de Seq'#252#234'ncias Gen'#233'ticas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 13
        Top = 359
        Width = 155
        Height = 14
        Caption = 'Sensibilidade m'#237'nima de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText10: TRLDBText
        Left = 171
        Top = 359
        Width = 23
        Height = 16
        AutoSize = False
        DataField = 'EXA_UNM'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel14: TRLLabel
        Left = 197
        Top = 360
        Width = 232
        Height = 14
        Caption = 'Unidade Internacionais por mililitro ('
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText11: TRLDBText
        Left = 428
        Top = 360
        Width = 23
        Height = 16
        AutoSize = False
        DataField = 'EXA_UNM'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel15: TRLLabel
        Left = 455
        Top = 361
        Width = 40
        Height = 14
        Caption = 'Ul/ml)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 11
        Top = 400
        Width = 93
        Height = 16
        Caption = 'RESULTADO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDataHoje_Segundo: TRLLabel
        Left = 152
        Top = 526
        Width = 57
        Height = 13
        Caption = 'DataHoje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 70
        Top = 20
        Width = 287
        Height = 18
        Caption = ' RESULTADO DE LABORAT'#211'RIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 36
        Top = 616
        Width = 42
        Height = 13
        Caption = 'ICPMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel21: TRLLabel
        Left = 24
        Top = 526
        Width = 124
        Height = 13
        Caption = 'Campo Grande, MS, '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLReport_Terceiro: TRLReport
    Left = 808
    Top = 1142
    Width = 794
    Height = 1123
    Margins.LeftMargin = 30.200000000000000000
    Margins.TopMargin = 70.200000000000000000
    Margins.RightMargin = 10.200000000000000000
    Margins.BottomMargin = 8.000000000000000000
    DataSource = DMI.dsRelLaudo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand6: TRLBand
      Left = 114
      Top = 265
      Width = 641
      Height = 701
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBText31: TRLDBText
        Left = 18
        Top = 421
        Width = 87
        Height = 16
        DataField = 'PRO_RESUL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText33: TRLDBText
        Left = 313
        Top = 421
        Width = 70
        Height = 16
        DataField = 'EXA_VRE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel47: TRLLabel
        Left = 150
        Top = 421
        Width = 162
        Height = 16
        Caption = 'c'#243'pias do v'#237'rus do(a) '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText39: TRLDBText
        Left = 17
        Top = 421
        Width = 76
        Height = 16
        DataField = 'PRO_UINT'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel56: TRLLabel
        Left = 98
        Top = 421
        Width = 299
        Height = 16
        Caption = 'Unidades Internacionais (UI) por Mililitro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel57: TRLLabel
        Left = 17
        Top = 441
        Width = 39
        Height = 16
        Caption = 'Log :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText40: TRLDBText
        Left = 59
        Top = 441
        Width = 81
        Height = 16
        DataField = 'PRO_VLOG'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel26: TRLLabel
        Left = 10
        Top = 56
        Width = 154
        Height = 16
        Caption = 'DADOS CADASTRAIS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel28: TRLLabel
        Left = 10
        Top = 85
        Width = 128
        Height = 14
        Caption = 'Nome do Paciente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText12: TRLDBText
        Left = 142
        Top = 85
        Width = 73
        Height = 14
        DataField = 'PES_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText13: TRLDBText
        Left = 86
        Top = 108
        Width = 71
        Height = 14
        DataField = 'PRO_PROT'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel29: TRLLabel
        Left = 10
        Top = 109
        Width = 72
        Height = 14
        Caption = 'Protocolo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel30: TRLLabel
        Left = 10
        Top = 134
        Width = 59
        Height = 14
        Caption = 'Coleta..:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText14: TRLDBText
        Left = 74
        Top = 134
        Width = 73
        Height = 14
        DataField = 'PRO_DCOL'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText15: TRLDBText
        Left = 98
        Top = 159
        Width = 76
        Height = 14
        DataField = 'MED_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel31: TRLLabel
        Left = 70
        Top = 159
        Width = 26
        Height = 14
        Caption = 'Dr. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Left = 10
        Top = 159
        Width = 55
        Height = 14
        Caption = 'M'#233'dico:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel33: TRLLabel
        Left = 9
        Top = 208
        Width = 156
        Height = 16
        Caption = 'AN'#193'LISE REALIZADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText16: TRLDBText
        Left = 11
        Top = 232
        Width = 70
        Height = 14
        DataField = 'EXA_DESC'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel34: TRLLabel
        Left = 10
        Top = 252
        Width = 74
        Height = 14
        Caption = 'Sinon'#237'mia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText18: TRLDBText
        Left = 88
        Top = 252
        Width = 58
        Height = 14
        DataField = 'EXA_SIN'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel35: TRLLabel
        Left = 10
        Top = 294
        Width = 192
        Height = 16
        Caption = 'METODOLOGIA APLICADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText20: TRLDBText
        Left = 12
        Top = 316
        Width = 61
        Height = 14
        DataField = 'EXA_MET'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel38: TRLLabel
        Left = 13
        Top = 337
        Width = 364
        Height = 14
        Caption = 'Equipamento ABI7000 Detector de Seq'#252#234'ncias Gen'#233'ticas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel39: TRLLabel
        Left = 13
        Top = 359
        Width = 155
        Height = 14
        Caption = 'Sensibilidade m'#237'nima de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText21: TRLDBText
        Left = 171
        Top = 359
        Width = 23
        Height = 16
        AutoSize = False
        DataField = 'EXA_UNM'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel40: TRLLabel
        Left = 197
        Top = 360
        Width = 232
        Height = 14
        Caption = 'Unidade Internacionais por mililitro ('
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText22: TRLDBText
        Left = 428
        Top = 360
        Width = 23
        Height = 16
        AutoSize = False
        DataField = 'EXA_UNM'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel41: TRLLabel
        Left = 455
        Top = 361
        Width = 40
        Height = 14
        Caption = 'Ul/ml)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel42: TRLLabel
        Left = 13
        Top = 399
        Width = 93
        Height = 16
        Caption = 'RESULTADO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDataHoje_Terceiro: TRLLabel
        Left = 152
        Top = 526
        Width = 57
        Height = 13
        Caption = 'DataHoje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 190
        Top = 20
        Width = 282
        Height = 18
        Caption = 'RESULTADO DE LABORAT'#211'RIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 24
        Top = 526
        Width = 124
        Height = 13
        Caption = 'Campo Grande, MS, '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel22: TRLLabel
        Left = 36
        Top = 616
        Width = 42
        Height = 13
        Caption = 'ICPMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLReport_Quarto: TRLReport
    Left = 6
    Top = 1141
    Width = 794
    Height = 1123
    Margins.LeftMargin = 30.200000000000000000
    Margins.TopMargin = 70.200000000000000000
    Margins.RightMargin = 10.200000000000000000
    Margins.BottomMargin = 8.000000000000000000
    DataSource = DMI.dsRelLaudo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand8: TRLBand
      Left = 114
      Top = 265
      Width = 641
      Height = 702
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLLabel58: TRLLabel
        Left = 10
        Top = 85
        Width = 128
        Height = 14
        Caption = 'Nome do Paciente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel59: TRLLabel
        Left = 10
        Top = 159
        Width = 55
        Height = 14
        Caption = 'M'#233'dico:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel60: TRLLabel
        Left = 10
        Top = 109
        Width = 72
        Height = 14
        Caption = 'Protocolo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel63: TRLLabel
        Left = 10
        Top = 134
        Width = 59
        Height = 14
        Caption = 'Coleta..:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText41: TRLDBText
        Left = 142
        Top = 85
        Width = 73
        Height = 14
        DataField = 'PES_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText42: TRLDBText
        Left = 98
        Top = 159
        Width = 76
        Height = 14
        DataField = 'MED_NOME'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText43: TRLDBText
        Left = 86
        Top = 108
        Width = 71
        Height = 14
        DataField = 'PRO_PROT'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText44: TRLDBText
        Left = 88
        Top = 252
        Width = 58
        Height = 14
        DataField = 'EXA_SIN'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText46: TRLDBText
        Left = 74
        Top = 134
        Width = 73
        Height = 14
        DataField = 'PRO_DCOL'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel64: TRLLabel
        Left = 10
        Top = 252
        Width = 74
        Height = 14
        Caption = 'Sinon'#237'mia:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText48: TRLDBText
        Left = 11
        Top = 232
        Width = 70
        Height = 14
        DataField = 'EXA_DESC'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel54: TRLLabel
        Left = 10
        Top = 56
        Width = 154
        Height = 16
        Caption = 'DADOS CADASTRAIS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel67: TRLLabel
        Left = 70
        Top = 159
        Width = 26
        Height = 14
        Caption = 'Dr. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel72: TRLLabel
        Left = 9
        Top = 208
        Width = 156
        Height = 16
        Caption = 'AN'#193'LISE REALIZADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel66: TRLLabel
        Left = 10
        Top = 294
        Width = 192
        Height = 16
        Caption = 'METODOLOGIA APLICADA:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLLabel62: TRLLabel
        Left = 8
        Top = 369
        Width = 93
        Height = 16
        Caption = 'RESULTADO:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object RLDBText45: TRLDBText
        Left = 7
        Top = 391
        Width = 82
        Height = 16
        DataField = 'PRO_GENO'
        DataSource = DMI.dsRelLaudo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDataHoje_Quarto: TRLLabel
        Left = 136
        Top = 478
        Width = 57
        Height = 13
        Caption = 'DataHoje'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 166
        Top = 20
        Width = 282
        Height = 18
        Caption = 'RESULTADO DE LABORAT'#211'RIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel61: TRLLabel
        Left = 12
        Top = 318
        Width = 458
        Height = 14
        Caption = 
          'Amplifica'#231#227'o seguida da digest'#227'o com enzimas de restri'#231#227'o - Simm' +
          'onds.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel23: TRLLabel
        Left = 8
        Top = 478
        Width = 124
        Height = 13
        Caption = 'Campo Grande, MS, '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel24: TRLLabel
        Left = 20
        Top = 568
        Width = 42
        Height = 13
        Caption = 'ICPMS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
