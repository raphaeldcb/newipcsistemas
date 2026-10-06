object fRelFinanceiro: TfRelFinanceiro
  Left = 305
  Top = 219
  Caption = 'Relat'#243'rio do Financeiro'
  ClientHeight = 676
  ClientWidth = 1269
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrp_Geral: TRLReport
    Left = 0
    Top = 8
    Width = 992
    Height = 1403
    DataSource = DMR.ds_RelFinanceiro
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand8: TRLBand
      Left = 47
      Top = 47
      Width = 898
      Height = 91
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object QRLabel37: TRLLabel
        Left = 8
        Top = 8
        Width = 181
        Height = 17
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Transparent = False
      end
      object QRSysData3: TRLSystemInfo
        Left = 602
        Top = 3
        Width = 36
        Height = 17
        Text = ''
        Transparent = False
      end
      object QRLabel38: TRLLabel
        Left = 8
        Top = 28
        Width = 292
        Height = 17
        Caption = 'Relat'#243'rio das Movimenta'#231#245'es Financeiras do CPG'
        Transparent = False
      end
      object QRLabel39: TRLLabel
        Left = 560
        Top = 3
        Width = 36
        Height = 17
        Caption = 'Data :'
        Transparent = False
      end
      object QRLabel40: TRLLabel
        Left = 560
        Top = 32
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
      object QRLabel10: TRLLabel
        Left = 479
        Top = 70
        Width = 83
        Height = 17
        Caption = 'Valor Total..:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object QRDBText4: TRLDBText
        Left = 567
        Top = 70
        Width = 150
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR_TOTAL_GERAL'
        DataSource = DMR.ds_RelFinanceiroSum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 615
        Top = 32
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 47
      Top = 138
      Width = 898
      Height = 104
      DataFields = 'PAR_TPPG'
      object RLBand1: TRLBand
        Left = 0
        Top = 0
        Width = 898
        Height = 42
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clYellow
        ParentColor = False
        Transparent = False
        object QRLabel21: TRLLabel
          Left = 5
          Top = 6
          Width = 142
          Height = 17
          Caption = 'Tipo de Pagamento...:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object QRDBText18: TRLDBText
          Left = 149
          Top = 5
          Width = 74
          Height = 16
          Color = clWhite
          DataField = 'PAR_TPPG'
          DataSource = DMR.ds_RelFinanceiro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Text = ''
        end
        object QRLabel3: TRLLabel
          Left = 6
          Top = 22
          Width = 64
          Height = 17
          Caption = 'Processos'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object QRLabel2: TRLLabel
          Left = 678
          Top = 21
          Width = 35
          Height = 17
          Caption = 'Valor'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object QRBand1: TRLBand
        Left = 0
        Top = 42
        Width = 898
        Height = 21
        object QRDBText1: TRLDBText
          Left = 620
          Top = 1
          Width = 95
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = DMR.ds_RelFinanceiro
          Text = ''
          Transparent = False
        end
        object QRDBText2: TRLDBText
          Left = 5
          Top = 2
          Width = 67
          Height = 16
          DataField = 'PRO_COD'
          DataSource = DMR.ds_RelFinanceiro
          Text = ''
          Transparent = False
        end
      end
      object QRBand2: TRLBand
        Left = 0
        Top = 63
        Width = 898
        Height = 23
        BandType = btSummary
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clMaroon
        ParentColor = False
        object QRLabel1: TRLLabel
          Left = 409
          Top = 4
          Width = 153
          Height = 16
          Caption = 'Valor Total do Grupo...:'
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLDBResult1: TRLDBResult
          Left = 575
          Top = 3
          Width = 140
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = DMR.ds_RelFinanceiro
          DisplayMask = 'R$ 0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
    end
  end
  object QuickRep2: TRLReport
    Left = 486
    Top = 355
    Width = 992
    Height = 1403
    DataSource = DMR.ds_RelQuantidade
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object QRBand3: TRLBand
      Left = 47
      Top = 47
      Width = 898
      Height = 53
      BandType = btTitle
      object QRLabel4: TRLLabel
        Left = 8
        Top = 8
        Width = 181
        Height = 17
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Transparent = False
      end
      object QRLabel5: TRLLabel
        Left = 8
        Top = 28
        Width = 478
        Height = 17
        Caption = 
          'Relat'#243'rio das Quantidade de Exames Enviados por Coletador no per' +
          #237'odo Informado'
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 568
        Top = 30
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 623
        Top = 31
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 610
        Top = 5
        Width = 36
        Height = 17
        Text = ''
        Transparent = False
      end
      object RLLabel2: TRLLabel
        Left = 568
        Top = 5
        Width = 36
        Height = 17
        Caption = 'Data :'
        Transparent = False
      end
    end
    object RLGroup2: TRLGroup
      Left = 47
      Top = 100
      Width = 898
      Height = 54
      DataFields = 'COLETADOR'
      object QRBand5: TRLBand
        Left = 0
        Top = 0
        Width = 898
        Height = 23
        Color = clYellow
        ParentColor = False
        Transparent = False
        object QRLabel8: TRLLabel
          Left = 4
          Top = 3
          Width = 75
          Height = 17
          Caption = 'Coletador..:'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object QRDBText5: TRLDBText
          Left = 82
          Top = 3
          Width = 84
          Height = 16
          Color = clWhite
          DataField = 'COLETADOR'
          DataSource = DMR.ds_RelQuantidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Text = ''
        end
        object QRLabel9: TRLLabel
          Left = 566
          Top = 3
          Width = 149
          Height = 17
          Caption = 'Quantidade de Exames'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
      object QRBand4: TRLBand
        Left = 0
        Top = 23
        Width = 898
        Height = 21
        object QRDBText3: TRLDBText
          Left = 628
          Top = 1
          Width = 87
          Height = 16
          Alignment = taRightJustify
          DataField = 'QUANTIDADE'
          DataSource = DMR.ds_RelQuantidade
          Text = ''
          Transparent = False
        end
      end
    end
  end
  object qrp_Dados: TRLReport
    Left = -39
    Top = 182
    Width = 1403
    Height = 992
    DataSource = DMR.ds_RelFinanceiroDados
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.Orientation = poLandscape
    object RLBand2: TRLBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 53
      BandType = btTitle
      object RLLabel3: TRLLabel
        Left = 8
        Top = 8
        Width = 181
        Height = 17
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Transparent = False
      end
      object RLL_Titulo: TRLLabel
        Left = 8
        Top = 28
        Width = 315
        Height = 16
        Caption = 'Relat'#243'rio dos Processos com informa'#231#245'es financeiras'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 901
        Top = 30
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 956
        Top = 31
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo5: TRLSystemInfo
        Left = 943
        Top = 5
        Width = 36
        Height = 17
        Text = ''
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 901
        Top = 5
        Width = 36
        Height = 17
        Caption = 'Data :'
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 47
      Top = 100
      Width = 1309
      Height = 45
      Color = clYellow
      ParentColor = False
      Transparent = False
      object RLLabel7: TRLLabel
        Left = 3
        Top = 3
        Width = 49
        Height = 16
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 365
        Top = 3
        Width = 39
        Height = 16
        Caption = 'Local'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 168
        Top = 3
        Width = 39
        Height = 16
        Caption = 'Autos'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 394
        Top = 23
        Width = 40
        Height = 18
        Caption = 'Varas'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 4
        Top = 25
        Width = 61
        Height = 16
        Caption = 'Comarca'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 694
        Top = 3
        Width = 100
        Height = 16
        Caption = 'Data Recep'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 943
        Top = 3
        Width = 77
        Height = 16
        Caption = 'Data Laudo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 956
        Top = 25
        Width = 85
        Height = 16
        Caption = 'Observa'#231#245'es'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
    object RLBand4: TRLBand
      Left = 47
      Top = 145
      Width = 1309
      Height = 44
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBText2: TRLDBText
        Left = 704
        Top = 4
        Width = 76
        Height = 16
        Alignment = taCenter
        DataField = 'PRO_DREC'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText1: TRLDBText
        Left = -15
        Top = 4
        Width = 67
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_COD'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText3: TRLDBText
        Left = 152
        Top = 4
        Width = 74
        Height = 16
        Alignment = taCenter
        DataField = 'PRO_AUTO'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText4: TRLDBText
        Left = 365
        Top = 4
        Width = 69
        Height = 16
        DataField = 'LCO_LABT'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText5: TRLDBText
        Left = 955
        Top = 4
        Width = 66
        Height = 16
        Alignment = taCenter
        DataField = 'HIS_DATA'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText6: TRLDBText
        Left = 4
        Top = 26
        Width = 52
        Height = 16
        DataField = 'CIDADE'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText7: TRLDBText
        Left = 302
        Top = 25
        Width = 74
        Height = 16
        DataField = 'VAR_DESC'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
      object RLDBText8: TRLDBText
        Left = 975
        Top = 25
        Width = 66
        Height = 16
        Alignment = taRightJustify
        DataField = 'PAR_OBS'
        DataSource = DMR.ds_RelFinanceiroDados
        Text = ''
        Transparent = False
      end
    end
  end
end
