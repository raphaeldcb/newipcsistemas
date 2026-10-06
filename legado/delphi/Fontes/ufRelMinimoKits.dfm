object fRelMinimoKits: TfRelMinimoKits
  Left = 745
  Top = 251
  Caption = 'Relat'#243'rio de M'#237'nimos de Kits'
  ClientHeight = 815
  ClientWidth = 1122
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickRep2: TRLReport
    Left = 6
    Top = 2
    Width = 992
    Height = 1403
    DataSource = DMR.ds_QuantMinimoKits
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand5: TRLBand
      Left = 47
      Top = 47
      Width = 898
      Height = 50
      BandType = btTitle
      object QRLabel12: TRLLabel
        Left = 89
        Top = 27
        Width = 449
        Height = 16
        Caption = 'Listagem de Credenciados com Quantidade de Kits abaixo no m'#237'nimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel14: TRLLabel
        Left = 3
        Top = 27
        Width = 83
        Height = 17
        Caption = 'Nome...........:'
        Transparent = False
      end
      object QRSysData3: TRLSystemInfo
        Left = 662
        Top = 3
        Width = 36
        Height = 17
        Text = ''
        Transparent = False
      end
      object QRLabel16: TRLLabel
        Left = 624
        Top = 2
        Width = 32
        Height = 17
        Caption = 'Data:'
        Transparent = False
      end
      object QRLabel17: TRLLabel
        Left = 624
        Top = 26
        Width = 32
        Height = 17
        Caption = 'Hora:'
        Transparent = False
      end
      object QRSysData4: TRLSystemInfo
        Left = 662
        Top = 26
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
        Transparent = False
      end
    end
    object QRBand6: TRLBand
      Left = 47
      Top = 97
      Width = 898
      Height = 25
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object QRLabel18: TRLLabel
        Left = 5
        Top = 5
        Width = 40
        Height = 16
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel19: TRLLabel
        Left = 384
        Top = 5
        Width = 49
        Height = 16
        Caption = 'M'#237'n. Kits'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel22: TRLLabel
        Left = 480
        Top = 5
        Width = 55
        Height = 16
        Caption = 'Atual Kits'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel2: TRLLabel
        Left = 61
        Top = 5
        Width = 56
        Height = 16
        Caption = 'Coletador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel3: TRLLabel
        Left = 608
        Top = 5
        Width = 67
        Height = 16
        Caption = 'Dt '#218'lt. Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand8: TRLBand
      Left = 47
      Top = 143
      Width = 898
      Height = 24
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object QRLabel1: TRLLabel
        Left = 2
        Top = 3
        Width = 87
        Height = 19
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 93
        Top = 6
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Info = itDetailCount
        Text = ''
      end
    end
    object QRBand7: TRLBand
      Left = 47
      Top = 122
      Width = 898
      Height = 21
      object QRDBText6: TRLDBText
        Left = -7
        Top = 1
        Width = 51
        Height = 15
        Alignment = taRightJustify
        DataField = 'CODIGO'
        DataSource = DMR.ds_QuantMinimoKits
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRDBText7: TRLDBText
        Left = 373
        Top = 1
        Width = 70
        Height = 15
        Alignment = taCenter
        DataField = 'MINIMO_KIT'
        DataSource = DMR.ds_QuantMinimoKits
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
        Left = 593
        Top = 2
        Width = 98
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'ULTIMA_DATA_ENVIO'
        DataSource = DMR.ds_QuantMinimoKits
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRDBText1: TRLDBText
        Left = 61
        Top = 1
        Width = 38
        Height = 15
        DataField = 'NOME'
        DataSource = DMR.ds_QuantMinimoKits
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object QRDBText3: TRLDBText
        Left = 474
        Top = 1
        Width = 66
        Height = 15
        Alignment = taCenter
        DataField = 'ATUAL_KIT'
        DataSource = DMR.ds_QuantMinimoKits
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
  end
end
