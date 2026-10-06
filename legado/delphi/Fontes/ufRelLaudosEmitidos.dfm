object fRelLaudosEmitidos: TfRelLaudosEmitidos
  Left = 455
  Top = 112
  Caption = 'Relat'#243'rio de Laudos Emitidos pelo SCPG'
  ClientHeight = 664
  ClientWidth = 1045
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
  object QuickRep2: TRLReport
    Left = 8
    Top = 2
    Width = 794
    Height = 1123
    DataSource = DMR.DS_RelLaudosEmitidos
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
      object QRLabel12: TRLLabel
        Left = 94
        Top = 8
        Width = 242
        Height = 17
        Caption = 'Listagem de Laudos Emitidos pelo SCPG'
        Transparent = False
      end
      object QRLabel13: TRLLabel
        Left = 93
        Top = 30
        Width = 175
        Height = 17
        Caption = 'Listagem - Ordenado por Data'
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
      object QRLabel16: TRLLabel
        Left = 624
        Top = 6
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
        Left = 676
        Top = 27
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Info = itHour
        Text = ''
        Transparent = False
      end
      object QRSysData3: TRLSystemInfo
        Left = 679
        Top = 6
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
      Height = 38
      BandType = btTitle
      object QRLabel18: TRLLabel
        Left = 80
        Top = 0
        Width = 73
        Height = 16
        Caption = 'N'#186' da Per'#237'cia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel19: TRLLabel
        Left = 224
        Top = 0
        Width = 96
        Height = 16
        Caption = 'Data da Emiss'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel21: TRLLabel
        Left = 3
        Top = 20
        Width = 77
        Height = 16
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel22: TRLLabel
        Left = 408
        Top = 0
        Width = 36
        Height = 16
        Caption = 'Laudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object QRLabel2: TRLLabel
        Left = 523
        Top = 20
        Width = 43
        Height = 16
        Caption = 'Criador'
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
      Left = 38
      Top = 162
      Width = 718
      Height = 24
      BandType = btSummary
      object RLSystemInfo1: TRLSystemInfo
        Left = 636
        Top = 5
        Width = 79
        Height = 16
        Alignment = taRightJustify
        Info = itDetailCount
        Text = ''
      end
      object QRLabel1: TRLLabel
        Left = 364
        Top = 3
        Width = 266
        Height = 19
        Caption = 'Total de Laudos Emitidos no Per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object QRBand7: TRLBand
      Left = 38
      Top = 126
      Width = 718
      Height = 36
      BeforePrint = QRBand7BeforePrint
      object QRDBText6: TRLDBText
        Left = 73
        Top = 1
        Width = 79
        Height = 15
        Alignment = taRightJustify
        DataField = 'PRO_NPERC'
        DataSource = DMR.DS_RelLaudosEmitidos
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
        Left = 232
        Top = 1
        Width = 60
        Height = 15
        Alignment = taCenter
        DataField = 'HIS_DATA'
        DataSource = DMR.DS_RelLaudosEmitidos
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
        Left = 3
        Top = 17
        Width = 510
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'HIS_OBS'
        DataSource = DMR.DS_RelLaudosEmitidos
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
        Left = 385
        Top = 1
        Width = 98
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'HIS_DOC'
        DataSource = DMR.DS_RelLaudosEmitidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object Criador: TRLLabel
        Left = 525
        Top = 16
        Width = 42
        Height = 16
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
end
