object fRelEtiquetasAdesiva: TfRelEtiquetasAdesiva
  Left = 428
  Top = 343
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Etiquetas - Adesiva'
  ClientHeight = 112
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 16
    Top = 59
    Width = 128
    Height = 41
    Caption = '&Gerar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF033373F3F3F3F3F3733330F0F0F0F0F
      03333F7F737373737FFF0000FFFFFFF0000377773FFFFFF7777F0FF800000008
      FF037F3F77777773FF7F0F9FFFFFFFF000037F7333333337777F0FFFFFFFFFFF
      FF0373FFFFFFFFFFFF7330000000000000333777777777777733333000000000
      3333333777777777F3333330FFFFFFF033333337F3FFFFF7F3333330F00000F0
      33333337F77777F7F3333330F0AAE0F033333337F7F337F7F3333330F0DAD0F0
      33333337F7FFF7F7F3333330F00000F033333337F7777737F3333330FFFFFFF0
      33333337FFFFFFF7F33333300000000033333337777777773333}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object bbtFechar: TSpeedButton
    Left = 144
    Top = 59
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object RLReport1: TRLReport
    Left = 544
    Top = 248
    Width = 110
    Height = 234
    Margins.LeftMargin = 0.000000000000000000
    Margins.TopMargin = 0.000000000000000000
    Margins.RightMargin = 0.000000000000000000
    Margins.BottomMargin = 0.000000000000000000
    DataSource = dsDadosProcessos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.Orientation = poLandscape
    PageSetup.PaperWidth = 62.000000000000000000
    PageSetup.PaperHeight = 29.000000000000000000
    object RLBand1: TRLBand
      Left = 0
      Top = 0
      Width = 110
      Height = 74
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBText1: TRLDBText
        Left = 26
        Top = 51
        Width = 52
        Height = 10
        Alignment = taCenter
        DataField = 'PRO_DCOLE'
        DataSource = dsDadosProcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBBarcode1: TRLDBBarcode
        Left = 10
        Top = 7
        Width = 93
        Height = 39
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Alignment = taCenter
        AutoSize = False
        BarcodeType = bcEAN128C
        DataField = 'CODIGO'
        DataSource = dsDadosProcessos
      end
      object RLDBText4: TRLDBText
        Left = 26
        Top = 63
        Width = 52
        Height = 10
        Alignment = taCenter
        DataField = 'PRO_NPERC'
        DataSource = dsDadosProcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 0
      Top = 74
      Width = 110
      Height = 22
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBText2: TRLDBText
        Left = 4
        Top = 14
        Width = 28
        Height = 6
        DataField = 'PES_NOME'
        DataSource = dsDadosProcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -5
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 5
        Top = 3
        Width = 32
        Height = 10
        DataField = 'SIT_NM'
        DataSource = dsDadosProcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
  end
  object EdtCodigo: TEdit
    Left = 7
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object qDadosProcessos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select'
      'p.pro_cod Codigo,'
      'p.pro_nperc,'
      'p.pro_dcole,'
      'pe.pes_nome,'
      's.sit_nm'
      'from tb_PROCESSO p '
      'JOIN tb_pessoas pe ON (p.pro_cod = pe.pro_cod)'
      'JOIN tb_situacao s ON (s.sit_cod = pe.pes_sit)'
      'where p.pro_cod = :Codigo')
    Left = 100
    Top = 105
    object qDadosProcessosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qDadosProcessosPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qDadosProcessosSIT_NM: TStringField
      FieldName = 'SIT_NM'
    end
    object qDadosProcessosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qDadosProcessosPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
  end
  object dsDadosProcessos: TDataSource
    DataSet = qDadosProcessos
    Left = 96
    Top = 136
  end
end
