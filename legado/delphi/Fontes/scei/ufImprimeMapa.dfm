object fImprimeMapa: TfImprimeMapa
  Left = 213
  Top = 106
  Caption = 'Mapa'
  ClientHeight = 590
  ClientWidth = 813
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
  object RLReport1: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 416
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    DataSource = DMI.DSExamesAnteriores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 210.000000000000000000
    PageSetup.PaperHeight = 110.000000000000000000
    object RLBand1: TRLBand
      Left = 30
      Top = 19
      Width = 726
      Height = 62
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 8
        Top = 8
        Width = 45
        Height = 16
        Caption = 'IPCMS'
      end
      object RLLabel2: TRLLabel
        Left = 9
        Top = 31
        Width = 137
        Height = 16
        Caption = 'MAPA DE TRABALHO'
      end
      object RLDBBarcode1: TRLDBBarcode
        Left = 561
        Top = 12
        Width = 59
        Height = 34
        Margins.LeftMargin = 1.000000000000000000
        Margins.RightMargin = 1.000000000000000000
        DataField = 'PRO_COD'
        DataSource = DMI.DSRelMapa
      end
      object RLDBText1: TRLDBText
        Left = 616
        Top = -51
        Width = 67
        Height = 16
        DataField = 'PRO_COD'
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 30
      Top = 81
      Width = 726
      Height = 155
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel7: TRLLabel
        Left = 5
        Top = 5
        Width = 78
        Height = 16
        Caption = 'Nome.........:'
      end
      object RLLabel9: TRLLabel
        Left = 5
        Top = 23
        Width = 75
        Height = 16
        Caption = 'M'#233'dico: Dr. '
      end
      object RLLabel10: TRLLabel
        Left = 5
        Top = 42
        Width = 76
        Height = 16
        Caption = 'Conv'#234'nio....:'
      end
      object RLLabel11: TRLLabel
        Left = 5
        Top = 61
        Width = 76
        Height = 16
        Caption = 'Obs...........:'
      end
      object RLLabel12: TRLLabel
        Left = 506
        Top = 21
        Width = 55
        Height = 16
        Caption = 'Idade....:'
      end
      object RLLabel13: TRLLabel
        Left = 506
        Top = 40
        Width = 53
        Height = 16
        Caption = 'Coleta..:'
      end
      object RLLabel14: TRLLabel
        Left = 506
        Top = 59
        Width = 53
        Height = 16
        Caption = 'Entrega:'
      end
      object RLDBText4: TRLDBText
        Left = 87
        Top = 5
        Width = 77
        Height = 16
        DataField = 'PES_NOME'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 87
        Top = 25
        Width = 79
        Height = 16
        DataField = 'MED_NOME'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 87
        Top = 43
        Width = 68
        Height = 16
        DataField = 'LAB_LABT'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 87
        Top = 60
        Width = 67
        Height = 16
        DataField = 'PRO_OBS'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText9: TRLDBText
        Left = 567
        Top = 20
        Width = 59
        Height = 16
        DataField = 'PES_IDA'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText10: TRLDBText
        Left = 565
        Top = 40
        Width = 74
        Height = 16
        DataField = 'PRO_DCOL'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText12: TRLDBText
        Left = 564
        Top = 60
        Width = 83
        Height = 16
        DataField = 'PRO_PRAZO'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 5
        Top = 81
        Width = 77
        Height = 16
        Caption = 'Exame.......:'
      end
      object RLDBText2: TRLDBText
        Left = 87
        Top = 80
        Width = 64
        Height = 16
        DataField = 'EXA_COD'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDraw1: TRLDraw
        Left = 309
        Top = 125
        Width = 295
        Height = 1
      end
      object RLDBText15: TRLDBText
        Left = 2
        Top = 111
        Width = 310
        Height = 16
        AutoSize = False
        DataField = 'EXA_DESC'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = -2
        Top = 100
        Width = 730
        Height = 1
      end
      object RLLabel5: TRLLabel
        Left = 4
        Top = 136
        Width = 111
        Height = 14
        Caption = 'Resultados Anteriores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 505
        Top = 3
        Width = 63
        Height = 16
        Caption = 'Protocolo:'
      end
      object RLDBText11: TRLDBText
        Left = 566
        Top = 2
        Width = 74
        Height = 16
        DataField = 'PRO_PROT'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLDBText20: TRLDBText
        Left = 649
        Top = 40
        Width = 75
        Height = 16
        DataField = 'PRO_HCAD'
        DataSource = DMI.DSRelMapa
        Text = ''
      end
      object RLLabel22: TRLLabel
        Left = 638
        Top = 40
        Width = 8
        Height = 16
        Caption = '/'
      end
    end
    object RLBand4: TRLBand
      Left = 30
      Top = 236
      Width = 726
      Height = 36
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDBText3: TRLDBText
        Left = 51
        Top = 3
        Width = 57
        Height = 14
        DataField = 'EXA_DESC'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 607
        Top = 3
        Width = 63
        Height = 14
        DataField = 'PRO_RESUL'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText13: TRLDBText
        Left = 481
        Top = 3
        Width = 59
        Height = 14
        DataField = 'PRO_DCAD'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText14: TRLDBText
        Left = 133
        Top = 19
        Width = 53
        Height = 14
        DataField = 'PRO_CMLI'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText16: TRLDBText
        Left = 370
        Top = 20
        Width = 52
        Height = 14
        DataField = 'PRO_UINT'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText17: TRLDBText
        Left = 462
        Top = 20
        Width = 60
        Height = 14
        DataField = 'PRO_VLOG'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText18: TRLDBText
        Left = 590
        Top = 20
        Width = 59
        Height = 14
        DataField = 'PRO_GENO'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel6: TRLLabel
        Left = 4
        Top = 2
        Width = 42
        Height = 14
        Caption = 'Exame:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 449
        Top = 3
        Width = 29
        Height = 14
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 543
        Top = 3
        Width = 61
        Height = 14
        Caption = 'Resultado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 3
        Top = 19
        Width = 127
        Height = 14
        Caption = 'N.'#186' C'#243'pias por Mililitro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 187
        Top = 20
        Width = 180
        Height = 14
        Caption = 'Unid. Internacionais por Mililitro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 432
        Top = 20
        Width = 27
        Height = 14
        Caption = 'Log:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 531
        Top = 20
        Width = 56
        Height = 14
        Caption = 'Gen'#243'tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText19: TRLDBText
        Left = 376
        Top = 3
        Width = 57
        Height = 14
        DataField = 'PRO_PROT'
        DataSource = DMI.DSExamesAnteriores
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLLabel21: TRLLabel
        Left = 342
        Top = 3
        Width = 32
        Height = 14
        Caption = 'Prot.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 30
      Top = 272
      Width = 726
      Height = 21
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 684
        Top = 2
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 628
        Top = 2
        Width = 56
        Height = 16
        Caption = 'P'#225'gina..:'
      end
    end
  end
end
