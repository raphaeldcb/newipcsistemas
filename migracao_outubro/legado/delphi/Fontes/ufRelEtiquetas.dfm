object fRelEtiquetas: TfRelEtiquetas
  Left = 420
  Top = 231
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Etiquetas - Adesivo'
  ClientHeight = 67
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 11
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
    Left = 136
    Top = 11
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
  end
  object QuickRep1: TRLReport
    Tag = 1
    Left = -8
    Top = 280
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRCabecaColuna: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 20
    end
    object Detail: TRLBand
      Left = 38
      Top = 58
      Width = 718
      Height = 1013
      object QRCodProcesso: TRLDBText
        Left = 6
        Top = 26
        Width = 41
        Height = 17
        DataField = 'Codigo'
        Text = ''
        Transparent = False
      end
      object QRNome: TRLDBText
        Left = 6
        Top = 7
        Width = 35
        Height = 17
        DataField = 'Nome'
        Text = ''
        Transparent = False
      end
      object QRImage1: TRLImage
        Left = 48
        Top = 104
        Width = 105
        Height = 105
      end
    end
  end
  object RLReport1: TRLReport
    Left = 320
    Top = 112
    Width = 813
    Height = 1058
    Margins.LeftMargin = 15.000000000000000000
    Margins.TopMargin = 11.000000000000000000
    Margins.RightMargin = 15.000000000000000000
    Margins.BottomMargin = 11.000000000000000000
    DataSource = dsCodigoProcesso
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 215.000000000000000000
    PageSetup.PaperHeight = 280.000000000000000000
    object RLBand1: TRLBand
      Left = 57
      Top = 42
      Width = 699
      Height = 48
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      BeforePrint = RLBand1BeforePrint
      object RLBarcode1: TRLBarcode
        Left = 46
        Top = 6
        Width = 104
        Height = 29
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Alignment = taCenter
        BarcodeType = bcEAN13
        ShowText = boCode
      end
      object RLBarcode2: TRLBarcode
        Left = 222
        Top = 6
        Width = 104
        Height = 29
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Alignment = taCenter
        BarcodeType = bcEAN13
        ShowText = boCode
      end
      object RLBarcode3: TRLBarcode
        Left = 400
        Top = 6
        Width = 104
        Height = 29
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Alignment = taCenter
        BarcodeType = bcEAN13
        ShowText = boCode
      end
      object RLBarcode5: TRLBarcode
        Left = 584
        Top = 6
        Width = 104
        Height = 29
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        Alignment = taCenter
        BarcodeType = bcEAN13
        ShowText = boCode
      end
    end
  end
  object DataSourceCodProcesso: TDataSource
    Left = 52
    Top = 8
  end
  object qCodigoProcesso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT FIRST 100 c.pro_cod from tb_codigo c')
    Left = 92
    Top = 97
    object qCodigoProcessoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
  end
  object dsCodigoProcesso: TDataSource
    DataSet = qCodigoProcesso
    Left = 96
    Top = 136
  end
  object MemoryTableCodProcesso: TJvMemoryData
    FieldDefs = <>
    Left = 85
    Top = 8
  end
end
