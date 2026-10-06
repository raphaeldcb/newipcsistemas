object fRelCreditosporJuiz: TfRelCreditosporJuiz
  Left = 206
  Top = 244
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Cr'#233'ditos por Juiz'
  ClientHeight = 356
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 280
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 11
    Top = 15
    Width = 28
    Height = 13
    Caption = 'Datas'
  end
  object Label2: TLabel
    Left = 131
    Top = 15
    Width = 153
    Height = 13
    Caption = 'Dados para Emiss'#227'o de Cr'#233'ditos'
  end
  object bbtFechar: TSpeedButton
    Left = 544
    Top = 303
    Width = 129
    Height = 41
    Caption = '&Fechar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
    OnClick = bbtFecharClick
  end
  object bbtImprimir: TSpeedButton
    Left = 415
    Top = 303
    Width = 129
    Height = 41
    Caption = '&Imprimir'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    OnClick = bbtImprimirClick
  end
  object DBGrid1: TDBGrid
    Left = 128
    Top = 31
    Width = 545
    Height = 265
    DataSource = DS_BuscaDados
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'JUI_COD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUI_DESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CRED_QDCRE'
        Visible = True
      end>
  end
  object QuickRep2: TRLReport
    Left = 192
    Top = 458
    Width = 794
    Height = 1123
    DataSource = DS_BuscaDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand7: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 52
      BandType = btTitle
      object QRLabel37: TRLLabel
        Left = 3
        Top = 7
        Width = 235
        Height = 20
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel38: TRLLabel
        Left = 4
        Top = 29
        Width = 241
        Height = 20
        Caption = 'Rela'#231#227'o de Cr'#233'ditos aos Ju'#237'zes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel4: TRLLabel
        Left = 508
        Top = 6
        Width = 53
        Height = 17
        Caption = 'Per'#237'odo: '
        Transparent = False
      end
      object DataIni: TRLLabel
        Left = 563
        Top = 6
        Width = 65
        Height = 17
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel6: TRLLabel
        Left = 635
        Top = 6
        Width = 8
        Height = 17
        Caption = #224
        Transparent = False
      end
      object DataFim: TRLLabel
        Left = 650
        Top = 6
        Width = 65
        Height = 17
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 630
        Top = 30
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object QRLabel40: TRLLabel
        Left = 595
        Top = 30
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
    end
    object QRGroup2: TRLGroup
      Left = 38
      Top = 90
      Width = 718
      Height = 25
      object QRLabel28: TRLLabel
        Left = 4
        Top = 5
        Width = 33
        Height = 16
        Caption = 'Juiz:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText1: TRLDBText
        Left = 40
        Top = 6
        Width = 62
        Height = 15
        DataField = 'JUI_DESC'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
    object QRBand1: TRLBand
      Left = 38
      Top = 115
      Width = 718
      Height = 67
      object QRLabel21: TRLLabel
        Left = 3
        Top = 4
        Width = 109
        Height = 16
        Caption = 'N'#250'mero da Per'#237'cia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText18: TRLDBText
        Left = 115
        Top = 4
        Width = 63
        Height = 15
        DataField = 'PRO_COD'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel30: TRLLabel
        Left = 171
        Top = 4
        Width = 43
        Height = 16
        Caption = 'Autos:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText28: TRLDBText
        Left = 216
        Top = 4
        Width = 68
        Height = 15
        DataField = 'PRO_AUTO'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel22: TRLLabel
        Left = 365
        Top = 4
        Width = 62
        Height = 16
        Caption = 'Processo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText19: TRLDBText
        Left = 431
        Top = 4
        Width = 79
        Height = 15
        DataField = 'PRO_NPERC'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel3: TRLLabel
        Left = 451
        Top = 48
        Width = 110
        Height = 16
        Caption = 'N'#250'mero do Cr'#233'dito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText3: TRLDBText
        Left = 564
        Top = 48
        Width = 62
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'CRED_QDCRE'
        DataSource = DS_BuscaDados
        Text = ''
        Transparent = False
      end
      object QRDBText27: TRLDBText
        Left = 335
        Top = 26
        Width = 33
        Height = 15
        DataField = 'VARA'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel31: TRLLabel
        Left = 297
        Top = 26
        Width = 37
        Height = 16
        Caption = 'Vara:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText26: TRLDBText
        Left = 160
        Top = 26
        Width = 62
        Height = 15
        DataField = 'COMARCA'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRDBText2: TRLDBText
        Left = 165
        Top = 48
        Width = 71
        Height = 15
        DataField = 'PRO_DREC'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel2: TRLLabel
        Left = 3
        Top = 48
        Width = 159
        Height = 16
        Caption = 'Recebimento dos Materiais:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel29: TRLLabel
        Left = 97
        Top = 26
        Width = 62
        Height = 16
        Caption = 'Comarca:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText20: TRLDBText
        Left = 50
        Top = 26
        Width = 60
        Height = 15
        DataField = 'UF_SIGLA'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel23: TRLLabel
        Left = 3
        Top = 26
        Width = 46
        Height = 16
        Caption = 'Estado: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand11: TRLBand
      Left = 38
      Top = 182
      Width = 718
      Height = 22
      object QRLabel39: TRLLabel
        Left = 3
        Top = 4
        Width = 54
        Height = 15
        Caption = 'Emitido em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object QRSysData3: TRLSystemInfo
        Left = 59
        Top = 4
        Width = 31
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel1: TRLLabel
        Left = 496
        Top = 2
        Width = 113
        Height = 17
        Alignment = taRightJustify
        Caption = 'Total de Cr'#233'ditos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 615
        Top = 3
        Width = 100
        Height = 16
        DataField = 'COUNT'
        DataSource = DS_BuscaDados
        Text = ''
      end
    end
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 31
    Width = 113
    Height = 265
    DataSource = ds_BuscaDatas
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid2CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CRE_DATA'
        Visible = True
      end>
  end
  object QuickRep1: TRLReport
    Left = 185
    Top = 591
    Width = 794
    Height = 1123
    DataSource = DS_BuscaDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 52
      BandType = btTitle
      object QRLabel5: TRLLabel
        Left = 3
        Top = 7
        Width = 235
        Height = 20
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel7: TRLLabel
        Left = 4
        Top = 29
        Width = 241
        Height = 20
        Caption = 'Rela'#231#227'o de Cr'#233'ditos aos Ju'#237'zes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel8: TRLLabel
        Left = 514
        Top = 6
        Width = 53
        Height = 17
        Caption = 'Per'#237'odo: '
        Transparent = False
      end
      object QRLabel9: TRLLabel
        Left = 569
        Top = 6
        Width = 65
        Height = 17
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel10: TRLLabel
        Left = 638
        Top = 6
        Width = 8
        Height = 17
        Caption = #224
        Transparent = False
      end
      object QRLabel11: TRLLabel
        Left = 650
        Top = 6
        Width = 65
        Height = 17
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 631
        Top = 30
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 603
        Top = 29
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
    end
    object QRGroup1: TRLGroup
      Left = 38
      Top = 90
      Width = 718
      Height = 25
      object QRLabel13: TRLLabel
        Left = 4
        Top = 5
        Width = 33
        Height = 16
        Caption = 'Juiz:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText4: TRLDBText
        Left = 40
        Top = 6
        Width = 62
        Height = 15
        DataField = 'JUI_DESC'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
    object QRBand3: TRLBand
      Left = 38
      Top = 115
      Width = 718
      Height = 67
      object QRLabel14: TRLLabel
        Left = 3
        Top = 4
        Width = 109
        Height = 16
        Caption = 'N'#250'mero da Per'#237'cia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText5: TRLDBText
        Left = 115
        Top = 4
        Width = 63
        Height = 15
        DataField = 'PRO_COD'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel15: TRLLabel
        Left = 171
        Top = 4
        Width = 43
        Height = 16
        Caption = 'Autos:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText6: TRLDBText
        Left = 216
        Top = 4
        Width = 68
        Height = 15
        DataField = 'PRO_AUTO'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel16: TRLLabel
        Left = 365
        Top = 4
        Width = 62
        Height = 16
        Caption = 'Processo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText7: TRLDBText
        Left = 431
        Top = 4
        Width = 79
        Height = 15
        DataField = 'PRO_NPERC'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel17: TRLLabel
        Left = 451
        Top = 48
        Width = 110
        Height = 16
        Caption = 'N'#250'mero do Cr'#233'dito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText8: TRLDBText
        Left = 564
        Top = 48
        Width = 62
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'CRED_QDCRE'
        Text = ''
        Transparent = False
      end
      object QRDBText9: TRLDBText
        Left = 335
        Top = 26
        Width = 33
        Height = 15
        DataField = 'VARA'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel18: TRLLabel
        Left = 297
        Top = 26
        Width = 37
        Height = 16
        Caption = 'Vara:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText10: TRLDBText
        Left = 160
        Top = 26
        Width = 62
        Height = 15
        DataField = 'COMARCA'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRDBText11: TRLDBText
        Left = 165
        Top = 48
        Width = 71
        Height = 15
        DataField = 'PRO_DREC'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel19: TRLLabel
        Left = 3
        Top = 48
        Width = 159
        Height = 16
        Caption = 'Recebimento dos Materiais:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel20: TRLLabel
        Left = 97
        Top = 26
        Width = 62
        Height = 16
        Caption = 'Comarca:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText12: TRLDBText
        Left = 50
        Top = 26
        Width = 60
        Height = 15
        DataField = 'UF_SIGLA'
        DataSource = DS_BuscaDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel24: TRLLabel
        Left = 3
        Top = 26
        Width = 46
        Height = 16
        Caption = 'Estado: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand4: TRLBand
      Left = 38
      Top = 182
      Width = 718
      Height = 22
      object QRLabel25: TRLLabel
        Left = 3
        Top = 4
        Width = 54
        Height = 15
        Caption = 'Emitido em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object QRSysData2: TRLSystemInfo
        Left = 60
        Top = 4
        Width = 31
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel26: TRLLabel
        Left = 467
        Top = 2
        Width = 113
        Height = 17
        Alignment = taRightJustify
        Caption = 'Total de Cr'#233'ditos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBResult2: TRLDBResult
        Left = 614
        Top = 3
        Width = 100
        Height = 16
        DataField = 'COUNT'
        DataSource = DS_BuscaDados
        Text = ''
      end
    end
  end
  object qBuscaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      ''
      
        'select cre.cred_qdcre, COUNT(p.pro_cod), p.pro_cod, p.pro_nperc,' +
        ' c.lco_nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_dre' +
        'c, p.pro_tipo, p.pro_auto, v.var_desc AS VARA, cm.com_desc AS CO' +
        'MARCA, j.jui_cod, j.jui_desc'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_juiz j, tb_creditos cre'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo)'
      'and (p.jui_cod=j.jui_cod) and (p.pro_cod=cre.pro_cod)'
      'and  cre.cre_data = :Data'
      
        'group by j.jui_desc,  p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_s' +
        'igla, pr.cas_desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_de' +
        'sc, j.jui_cod, p.pro_auto, p.pro_drec, cre.cred_qdcre')
    Left = 512
    Top = 8
    object qBuscaDadosCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qBuscaDadosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qBuscaDadosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qBuscaDadosLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qBuscaDadosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qBuscaDadosDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qBuscaDadosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qBuscaDadosPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qBuscaDadosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qBuscaDadosVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qBuscaDadosCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qBuscaDadosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qBuscaDadosJUI_DESC: TStringField
      FieldName = 'JUI_DESC'
      Size = 50
    end
    object qBuscaDadosCRED_QDCRE: TStringField
      FieldName = 'CRED_QDCRE'
      Size = 10
    end
  end
  object DS_BuscaDados: TDataSource
    DataSet = qBuscaDados
    Left = 543
    Top = 9
  end
  object qBuscaDatas: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      'select distinct c.cre_data from tb_creditos c')
    Left = 512
    Top = 48
    object qBuscaDatasCRE_DATA: TDateField
      FieldName = 'CRE_DATA'
    end
  end
  object ds_BuscaDatas: TDataSource
    DataSet = qBuscaDatas
    Left = 551
    Top = 48
  end
  object qBuscaMaiorData: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select max(p.pro_drec) as MaiorData'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_juiz j, tb_creditos cre'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo)'
      'and (p.jui_cod=j.jui_cod) and (p.pro_cod=cre.pro_cod)'
      'and  cre.cre_data = :Data')
    Left = 512
    Top = 96
    object qBuscaMaiorDataMAIORDATA: TDateField
      FieldName = 'MAIORDATA'
    end
  end
  object qBuscaMenorData: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select min(p.pro_drec) as MenorData'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_juiz j, tb_creditos cre'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo)'
      'and (p.jui_cod=j.jui_cod) and (p.pro_cod=cre.pro_cod)'
      'and  cre.cre_data = :Data')
    Left = 512
    Top = 136
    object qBuscaMenorDataMENORDATA: TDateField
      FieldName = 'MENORDATA'
    end
  end
  object qContador: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Informacao'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select distinct j.jui_cod'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_juiz j, tb_creditos cre'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo)'
      'and (p.jui_cod=j.jui_cod) and (p.pro_cod=cre.pro_cod)'
      'and  cre.cre_data = :Informacao'
      
        'group by j.jui_desc,  p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_s' +
        'igla, pr.cas_desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_de' +
        'sc, j.jui_cod, p.pro_auto, p.pro_drec, cre.cred_qdcre')
    Left = 464
    Top = 8
    object qContadorJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
  end
end
