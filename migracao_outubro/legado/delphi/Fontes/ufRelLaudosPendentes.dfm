object fRelLaudosPendentes: TfRelLaudosPendentes
  Left = 311
  Top = 216
  Caption = 'Relat'#243'rio de Laudos Pendentes'
  ClientHeight = 601
  ClientWidth = 1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TRLReport
    Left = 16
    Top = 8
    Width = 794
    Height = 1123
    DataSource = fProcessos.ds_VencidosSemPessoa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 50
      BandType = btTitle
      object QRLabel1: TRLLabel
        Left = 94
        Top = 8
        Width = 186
        Height = 17
        Caption = 'Listagem de Laudos em Aberto.'
        Transparent = False
      end
      object QRLabel2: TRLLabel
        Left = 93
        Top = 30
        Width = 194
        Height = 17
        Caption = 'Por ordem de Data de Resultado.'
        Transparent = False
      end
      object QRLabel3: TRLLabel
        Left = 8
        Top = 8
        Width = 83
        Height = 17
        Caption = 'Nome...........:'
        Transparent = False
      end
      object QRLabel4: TRLLabel
        Left = 8
        Top = 30
        Width = 82
        Height = 17
        Caption = 'Classifica'#231#227'o:'
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 624
        Top = 6
        Width = 32
        Height = 17
        Caption = 'Data:'
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 624
        Top = 26
        Width = 32
        Height = 17
        Caption = 'Hora:'
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 676
        Top = 27
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 679
        Top = 6
        Width = 36
        Height = 17
        Alignment = taRightJustify
        Text = ''
        Transparent = False
      end
    end
    object QRBand2: TRLBand
      Left = 38
      Top = 88
      Width = 718
      Height = 19
      BandType = btTitle
      object QRLabel7: TRLLabel
        Left = 2
        Top = 1
        Width = 46
        Height = 17
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel8: TRLLabel
        Left = 58
        Top = 1
        Width = 77
        Height = 17
        Caption = 'Data Result.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel9: TRLLabel
        Left = 141
        Top = 1
        Width = 29
        Height = 17
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel10: TRLLabel
        Left = 234
        Top = 1
        Width = 64
        Height = 17
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel11: TRLLabel
        Left = 338
        Top = 1
        Width = 50
        Height = 17
        Caption = 'Crian'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel23: TRLLabel
        Left = 602
        Top = 1
        Width = 49
        Height = 17
        Caption = 'Emitido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel24: TRLLabel
        Left = 664
        Top = 1
        Width = 48
        Height = 17
        Caption = 'Correio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand3: TRLBand
      Left = 38
      Top = 107
      Width = 718
      Height = 21
      BeforePrint = QRBand3BeforePrint
      object QRDBText1: TRLDBText
        Left = 2
        Top = 1
        Width = 63
        Height = 15
        DataField = 'PRO_COD'
        DataSource = fProcessos.ds_VencidosSemPessoa
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
        Left = 56
        Top = 1
        Width = 80
        Height = 15
        Alignment = taCenter
        DataField = 'PRO_DRESU'
        DataSource = fProcessos.ds_VencidosSemPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object LabelTipo: TRLLabel
        Left = 141
        Top = 1
        Width = 88
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object LabelResultado: TRLLabel
        Left = 233
        Top = 1
        Width = 102
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object LabelCrianca: TRLLabel
        Left = 339
        Top = 2
        Width = 254
        Height = 16
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object QRDBText6: TRLDBText
        Left = 667
        Top = 1
        Width = 48
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'SIT'
        DataSource = DS_BuscaCorreio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object SitE_1: TRLLabel
        Left = 603
        Top = 2
        Width = 48
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'SitE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand4: TRLBand
      Left = 38
      Top = 128
      Width = 718
      Height = 40
      BandType = btSummary
    end
  end
  object QuickRep2: TRLReport
    Left = 96
    Top = 378
    Width = 794
    Height = 1123
    DataSource = DMR.DS_RelLaudosHojeSemPessoa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 50
      BandType = btTitle
      object QRLabel13: TRLLabel
        Left = 93
        Top = 30
        Width = 194
        Height = 17
        Caption = 'Por ordem de Data de Resultado.'
        Transparent = False
      end
      object QRLabel14: TRLLabel
        Left = 8
        Top = 8
        Width = 83
        Height = 17
        Caption = 'Nome...........:'
        Transparent = False
      end
      object QRLabel15: TRLLabel
        Left = 8
        Top = 30
        Width = 82
        Height = 17
        Caption = 'Classifica'#231#227'o:'
        Transparent = False
      end
      object QRLabel12: TRLLabel
        Left = 94
        Top = 8
        Width = 243
        Height = 17
        Caption = 'Listagem de Laudos Vencedo por Per'#237'odo'
        Transparent = False
      end
      object RLLabel3: TRLLabel
        Left = 629
        Top = 7
        Width = 32
        Height = 17
        Caption = 'Data:'
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 629
        Top = 26
        Width = 32
        Height = 17
        Caption = 'Hora:'
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 676
        Top = 27
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
        Transparent = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 679
        Top = 7
        Width = 36
        Height = 17
        Alignment = taRightJustify
        Text = ''
        Transparent = False
      end
    end
    object QRBand6: TRLBand
      Left = 38
      Top = 88
      Width = 718
      Height = 19
      BandType = btTitle
      object QRLabel18: TRLLabel
        Left = 2
        Top = 1
        Width = 46
        Height = 17
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel19: TRLLabel
        Left = 58
        Top = 1
        Width = 77
        Height = 17
        Caption = 'Data Result.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel20: TRLLabel
        Left = 140
        Top = 1
        Width = 29
        Height = 17
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel21: TRLLabel
        Left = 231
        Top = 1
        Width = 64
        Height = 17
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel22: TRLLabel
        Left = 338
        Top = 1
        Width = 50
        Height = 17
        Caption = 'Crian'#231'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel25: TRLLabel
        Left = 602
        Top = 1
        Width = 49
        Height = 17
        Caption = 'Emitido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel26: TRLLabel
        Left = 664
        Top = 1
        Width = 48
        Height = 17
        Caption = 'Correio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand8: TRLBand
      Left = 38
      Top = 128
      Width = 718
      Height = 35
      BandType = btSummary
    end
    object QRBand9: TRLBand
      Left = 38
      Top = 107
      Width = 718
      Height = 21
      object QRDBText3: TRLDBText
        Left = 2
        Top = 2
        Width = 63
        Height = 15
        DataField = 'PRO_COD'
        DataSource = DMR.DS_RelLaudosHojeSemPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRDBText4: TRLDBText
        Left = 57
        Top = 2
        Width = 80
        Height = 15
        Alignment = taCenter
        DataField = 'PRO_DRESU'
        DataSource = DMR.DS_RelLaudosHojeSemPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object LabelTipo_1: TRLLabel
        Left = 140
        Top = 2
        Width = 85
        Height = 17
        AutoSize = False
        Caption = 'LabelTipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object LabelResultado_1: TRLLabel
        Left = 229
        Top = 2
        Width = 105
        Height = 17
        AutoSize = False
        Caption = 'LabelResultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object LabelCrianca_1: TRLLabel
        Left = 339
        Top = 2
        Width = 247
        Height = 17
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
      object QRDBText8: TRLDBText
        Left = 667
        Top = 1
        Width = 48
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'SIT'
        DataSource = DS_BuscaCorreio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object SitE_2: TRLLabel
        Left = 603
        Top = 2
        Width = 48
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'SitE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
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
    Left = 832
    Top = 440
    object qBuscaCriancaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
  end
  object qBuscaCorreio: TADOQuery
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
      
        'select case when p.pro_rastrear = '#39#39' then '#39'N'#227'o'#39' else '#39'Sim'#39' end a' +
        's Sit from tb_processo p'
      'where PRO_COD = :PRO_COD')
    Left = 904
    Top = 368
    object qBuscaCorreioSIT: TStringField
      FieldName = 'SIT'
      FixedChar = True
      Size = 3
    end
  end
  object qBuscaEmitido: TADOQuery
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
      'select count(*) as SitE'
      'from tb_processo p join tb_historico h on p.pro_cod=h.pro_cod'
      'where p.PRO_COD = :PRO_COD and h.ite_cod = 6')
    Left = 928
    Top = 440
    object qBuscaEmitidoSITE: TIntegerField
      FieldName = 'SITE'
    end
  end
  object DS_BuscaCorreio: TDataSource
    DataSet = qBuscaCorreio
    Left = 920
    Top = 216
  end
end
