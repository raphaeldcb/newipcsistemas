object fRelConsulta: TfRelConsulta
  Left = 211
  Top = 85
  Caption = 'fRelConsulta'
  ClientHeight = 559
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickRep1: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    Borders.Width = 2
    DataSource = DMR.DS_FiltroCPGTela
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand8: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 68
      BandType = btTitle
      object QRLabel37: TRLLabel
        Left = 8
        Top = 8
        Width = 181
        Height = 17
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Transparent = False
      end
      object QRSysData4: TRLSystemInfo
        Left = 612
        Top = 27
        Width = 105
        Height = 16
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Info = itPageNumber
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRLabel38: TRLLabel
        Left = 8
        Top = 28
        Width = 299
        Height = 16
        Caption = 'Rela'#231#227'o de Per'#237'cias Gen'#233'ticas (Origem Consultas)'
        Transparent = False
      end
      object QRLabel40: TRLLabel
        Left = 653
        Top = 27
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
      object RLL_USUEMISSAO: TRLLabel
        Left = 665
        Top = 5
        Width = 48
        Height = 16
        Alignment = taRightJustify
        Caption = 'Usu'#225'rio'
        Transparent = False
      end
      object QRSysData3: TRLSystemInfo
        Left = 656
        Top = 50
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Info = itFullDate
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 106
      Width = 718
      Height = 166
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = RLBand1BeforePrint
      object QRLabel21: TRLLabel
        Left = 4
        Top = 1
        Width = 124
        Height = 17
        Caption = 'N'#250'mero da Per'#237'cia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText18: TRLDBText
        Left = 132
        Top = 1
        Width = 67
        Height = 16
        DataField = 'PRO_COD'
        DataSource = DMR.DS_FiltroCPGTela
        Text = ''
        Transparent = False
      end
      object QRLabel22: TRLLabel
        Left = 348
        Top = 1
        Width = 66
        Height = 17
        Caption = 'Processo: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText19: TRLDBText
        Left = 415
        Top = 1
        Width = 84
        Height = 16
        DataField = 'PRO_NPERC'
        DataSource = DMR.DS_FiltroCPGTela
        Text = ''
        Transparent = False
      end
      object QRLabel23: TRLLabel
        Left = 564
        Top = 1
        Width = 51
        Height = 17
        Caption = 'Estado: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText20: TRLDBText
        Left = 615
        Top = 1
        Width = 66
        Height = 16
        DataField = 'UF_SIGLA'
        DataSource = DMR.DS_FiltroCPGTela
        Text = ''
        Transparent = False
      end
      object QRLabel24: TRLLabel
        Left = 3
        Top = 29
        Width = 92
        Height = 17
        Caption = 'Tipo de Caso: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText21: TRLDBText
        Left = 101
        Top = 30
        Width = 117
        Height = 16
        DataField = 'DESCRICAOCASO'
        DataSource = DMR.DS_FiltroCPGTela
        Text = ''
        Transparent = False
      end
      object QRLabel25: TRLLabel
        Left = 4
        Top = 50
        Width = 36
        Height = 17
        Caption = 'M'#227'e: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel26: TRLLabel
        Left = 4
        Top = 69
        Width = 62
        Height = 17
        Caption = 'Crian'#231'a:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel27: TRLLabel
        Left = 4
        Top = 87
        Width = 89
        Height = 17
        Caption = 'Suposto Pai:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel28: TRLLabel
        Left = 8
        Top = 115
        Width = 60
        Height = 17
        Caption = 'Origem:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel29: TRLLabel
        Left = 8
        Top = 139
        Width = 70
        Height = 17
        Caption = 'Comarca:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRDBText26: TRLDBText
        Left = 83
        Top = 140
        Width = 70
        Height = 16
        DataField = 'COMARCA'
        DataSource = DMR.DS_FiltroCPGTela
        Text = ''
        Transparent = False
      end
      object QRDBText25: TRLDBText
        Left = 73
        Top = 115
        Width = 68
        Height = 16
        DataField = 'PRO_TIPO'
        DataSource = DMR.DS_FiltroCPGTela
        Text = ''
        Transparent = False
      end
      object QRLabel33: TRLLabel
        Left = 101
        Top = 123
        Width = 74
        Height = 12
        Caption = '2 - ExtraJudicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel32: TRLLabel
        Left = 101
        Top = 107
        Width = 51
        Height = 12
        Caption = '1 - Judicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLL_MAE: TRLLabel
        Left = 42
        Top = 50
        Width = 63
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLL_CRIANCA: TRLLabel
        Left = 68
        Top = 70
        Width = 91
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object RLL_SUPAI: TRLLabel
        Left = 95
        Top = 88
        Width = 73
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 272
      Width = 718
      Height = 24
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.Width = 2
      object RLLabel3: TRLLabel
        Left = 565
        Top = 4
        Width = 137
        Height = 16
        Caption = 'Quantidade de Casos: '
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 688
        Top = 4
        Width = 25
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_COD'
        DataSource = DMR.DS_FiltroCPGTela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riCount
        ParentFont = False
        Text = ''
      end
    end
  end
  object qBuscaCrianca: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select PES_NOME from tb_PESSOAS'
      'where PRO_COD = :PRO_COD and PES_SIT='#39'2'#39
      'order by PES_COD')
    Left = 136
    Top = 344
    object qBuscaCriancaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
  end
  object qBuscaPai: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select PES_NOME from tb_PESSOAS'
      'where PRO_COD = :PRO_COD and PES_SIT='#39'0'#39
      'order by PES_COD')
    Left = 168
    Top = 344
    object qBuscaPaiPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
  end
  object qBuscaMae: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select PES_NOME from tb_PESSOAS'
      'where PRO_COD = :PRO_COD and PES_SIT='#39'1'#39
      'order by PES_COD')
    Left = 208
    Top = 344
    object qBuscaMaePES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
  end
end
