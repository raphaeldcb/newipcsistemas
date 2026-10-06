object fEnvioCasosExternos: TfEnvioCasosExternos
  Left = 37
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Envio de Casos para Prestador Externo'
  ClientHeight = 593
  ClientWidth = 960
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object sbConsultar: TSpeedButton
    Left = 626
    Top = 16
    Width = 100
    Height = 30
    Caption = '&Consulta'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    OnClick = sbConsultarClick
  end
  object sbTodos: TSpeedButton
    Left = 741
    Top = 161
    Width = 23
    Height = 21
    Hint = 'Seleciona todos os listados'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
      000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
      FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
      FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
      0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
      05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
      55557F7777777555555500000005555555557777777555555555}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbTodosClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 609
    Height = 75
    Caption = 'Par'#226'metros de busca'
    TabOrder = 0
    object Label2: TLabel
      Left = 15
      Top = 18
      Width = 83
      Height = 13
      Caption = 'Data de Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 146
      Top = 40
      Width = 6
      Height = 13
      Caption = '&a'
    end
    object DateEditInicial: TJvDateEdit
      Left = 15
      Top = 37
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
    object DateEditFinal: TJvDateEdit
      Left = 158
      Top = 37
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 770
    Top = 8
    Width = 177
    Height = 580
    Caption = 'Op'#231#245'es'
    TabOrder = 1
    object sbEnviarCasos: TSpeedButton
      Left = 11
      Top = 18
      Width = 160
      Height = 50
      Caption = 'Enviar Casos'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
        555555777777777FF5555500000000805555557777777777FF555550BBBBB008
        05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
        005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
        055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
        055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
        05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
        05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
        005555555775FFFF77F555555570000000555555555777777755}
      NumGlyphs = 2
      OnClick = sbEnviarCasosClick
    end
    object BFechar: TSpeedButton
      Left = 11
      Top = 539
      Width = 160
      Height = 30
      Caption = 'Fechar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      OnClick = BFecharClick
    end
    object sbRelatorio: TSpeedButton
      Left = 11
      Top = 74
      Width = 160
      Height = 50
      Caption = 'Relat'#243'rio'
      Enabled = False
      Flat = True
      Glyph.Data = {
        92060000424D92060000000000001A0000000C0000001700170001001800FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF5F5F5E0DFDF98969492908E9B9A98B1AFAEEEEDEDFAF9
        F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFCFBFBD3D2D19F9D9B8785838583817D7B79787673
        7B7977888683C9C8C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F48C8A8789878483817F87
        85837F7C78787674767472817F7CBCBBB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAAA88886
        83807E7A7F7D7A83817E84817F7C7A7786848184827FC0BEBDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA19F9D8B888686838184817F827F7D83807D817E7C8A8886A7A5A3E1E0
        DFF6F6F6FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB4B2B18E8C8A8A87848C8A87908E8C908E8C898684
        A4A29FB3B1ADC7C4C2D3D0D0DCDAD9E3E2E1F3F3F2FDFDFDFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F9C0BEBDB8B7B58C8A88AE
        ADABB3B2B0999792A39D99C0BBB5D7D2CCE5E1DCF0EEECF1EFEEDFDDDCE4E3E1
        FBFBFB000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD9D8D8D4D3D2A4A19DAEA79DDAD0BFECE2D2F2EADCF6EFE3F7F2EAF3
        F0EBCFCBC9C1BEBCE7E6E5000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDC9C8C6B2AB9FECE0CAF1E6D3F3E9D9F4EC
        DEF6F0E4FAF4EDFCF9F5E3E1DE94928EC5C4C2000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCCECBC6E2D5BEF0E4D0
        F1E7D4F3E9D9F4ECDEF6F0E4FAF4EDFCF9F5EBE9E78E8D8CB3B2AF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DDDCDCB3
        ADA5E0D1B9EFE5D2F1E8D8F2EADBF4ECDFF6F0E4F9F4ECF9F6F0C8C5C192908C
        989591000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F3D0CF
        CF9B9A9973716B85817ACEC3B1E9E0CFEDE6D9F0EAE1F2EDE5F2EDE5EDE9E1D8
        D4CFBDBAB78C8984B3B1AD000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5
        D3D2D2999897696762625D54615C569A9792C7C2BEDDD6CBE8E2D8EEE9E2EEEB
        E5ECE9E5E7E4E0CFCBC89997918F8C87E6E5E4000000FFFFFFFFFFFFFDFDFDEE
        EEEECCCCCC888786605D595C584F59534C5D5A54A4A5A5E3E4E3F9F9F9E3E1DF
        D6D2CDD3CFC8D1CCC6C7C2BEADA9A49B9794B3B0ADDFDEDDFEFEFD000000FDFD
        FDEEEEEEC1C1C184838166635C534D445651496B6863A4A4A4DCDDDEFEFEFEFF
        FFFFFFFFFFFEFEFEF6F5F5E7E5E5DCDAD9D6D4D2D3D2D0DCDBD9FBFBFBFFFFFF
        FFFFFF000000DFDFDE838382635E585D564E4D473F666562A6A6A6E0E1E1FAFA
        FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000C2C2C359595655514A72716DB0B1B1F1F1F1
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E9EAEA929497B2B3B4E9
        EAEAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFF8F8F9FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      PopupMenu = pm_Relatorio
      OnClick = sbRelatorioClick
    end
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 161
    Width = 727
    Height = 427
    Color = clWhite
    DataSource = ds_ListaProcessos
    DrawingStyle = gdsClassic
    GradientEndColor = clBtnFace
    GradientStartColor = clBtnFace
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'SEQUENCIAL'
        Width = 30
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRO_COD'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRO_NPERC'
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CAS_CODIGO'
        Width = 73
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIPO'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRO_DREC'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_FG_EXTERNO'
        Title.Caption = 'Situa'#231#227'o'
        Width = 60
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRO_DATA_EXTERNO'
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PRO_FG_RESUL'
        Width = 22
        Visible = True
      end>
  end
  object qrp_Dados: TRLReport
    Left = 115
    Top = 682
    Width = 794
    Height = 1123
    DataSource = ds_RelProcessos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand2: TRLBand
      Left = 38
      Top = 38
      Width = 718
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
        Width = 491
        Height = 16
        Caption = 
          'Relat'#243'rio dos Processos enviados para Laborat'#243'rio Externo - DATA' +
          ' DE RECEP'#199#195'O'
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 519
        Top = 29
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
      object RLSystemInfo4: TRLSystemInfo
        Left = 574
        Top = 30
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo5: TRLSystemInfo
        Left = 561
        Top = 4
        Width = 36
        Height = 17
        Text = ''
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 519
        Top = 4
        Width = 36
        Height = 17
        Caption = 'Data :'
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 91
      Width = 718
      Height = 24
      BandType = btTitle
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
        Left = 602
        Top = 3
        Width = 60
        Height = 16
        Caption = 'Situa'#231#227'o'
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
        Left = 128
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
      object RLLabel11: TRLLabel
        Left = 433
        Top = 3
        Width = 72
        Height = 16
        Caption = 'Data Envio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 304
        Top = 3
        Width = 32
        Height = 16
        Caption = 'Tipo'
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
      Left = 38
      Top = 115
      Width = 718
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBText1: TRLDBText
        Left = 8
        Top = 4
        Width = 44
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_COD'
        DataSource = ds_RelProcessos
        Text = ''
        Transparent = False
      end
      object RLDBText3: TRLDBText
        Left = 128
        Top = 1
        Width = 94
        Height = 16
        Alignment = taCenter
        DataField = 'PRO_DREC'
        DataSource = ds_RelProcessos
        Text = ''
        Transparent = False
      end
      object RLDBText6: TRLDBText
        Left = 539
        Top = 4
        Width = 124
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_FG_EXTERNO'
        DataSource = ds_RelProcessos
        Text = ''
        Transparent = False
      end
      object RLDBText7: TRLDBText
        Left = 435
        Top = 2
        Width = 66
        Height = 16
        DataField = 'PRO_DATA_EXTERNO'
        DataSource = ds_RelProcessos
        Text = ''
        Transparent = False
      end
      object RLDBText2: TRLDBText
        Left = 308
        Top = 1
        Width = 28
        Height = 16
        Alignment = taCenter
        DataField = 'TIPO'
        DataSource = ds_RelProcessos
        Text = ''
        Transparent = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 21
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBResult1: TRLDBResult
        Left = 53
        Top = 3
        Width = 49
        Height = 16
        DataField = 'PRO_COD'
        DataSource = ds_RelProcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riCount
        ParentFont = False
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 11
        Top = 3
        Width = 40
        Height = 16
        Caption = 'Total:'
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
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 86
    Width = 609
    Height = 70
    Caption = 'Data Envio'
    TabOrder = 4
    object Label3: TLabel
      Left = 15
      Top = 18
      Width = 70
      Height = 13
      Caption = 'Informe a Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object JvDtEdt_Envio: TJvDateEdit
      Left = 15
      Top = 37
      Width = 121
      Height = 21
      DefaultToday = True
      ShowNullDate = False
      TabOrder = 0
    end
  end
  object qrp_DadosExt: TRLReport
    Left = 246
    Top = 675
    Width = 794
    Height = 1123
    DataSource = ds_RelProcessosExt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand5: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 53
      BandType = btTitle
      object RLLabel4: TRLLabel
        Left = 8
        Top = 8
        Width = 181
        Height = 17
        Caption = 'Controle de Per'#237'cias Gen'#233'ticas'
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 8
        Top = 28
        Width = 458
        Height = 16
        Caption = 
          'Relat'#243'rio dos Processos enviados para Laborat'#243'rio Externo - DATA' +
          ' DE ENVIO'
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 519
        Top = 29
        Width = 49
        Height = 17
        Caption = 'P'#225'gina :'
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 574
        Top = 30
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
        Transparent = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 561
        Top = 4
        Width = 36
        Height = 17
        Text = ''
        Transparent = False
      end
      object RLLabel13: TRLLabel
        Left = 519
        Top = 4
        Width = 36
        Height = 17
        Caption = 'Data :'
        Transparent = False
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 91
      Width = 718
      Height = 24
      BandType = btTitle
      Color = clYellow
      ParentColor = False
      Transparent = False
      object RLLabel14: TRLLabel
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
      object RLLabel15: TRLLabel
        Left = 602
        Top = 3
        Width = 60
        Height = 16
        Caption = 'Situa'#231#227'o'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 128
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
      object RLLabel17: TRLLabel
        Left = 433
        Top = 3
        Width = 72
        Height = 16
        Caption = 'Data Envio'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 304
        Top = 3
        Width = 32
        Height = 16
        Caption = 'Tipo'
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
    object RLBand7: TRLBand
      Left = 38
      Top = 115
      Width = 718
      Height = 21
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBText4: TRLDBText
        Left = -15
        Top = 4
        Width = 67
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_COD'
        DataSource = ds_RelProcessosExt
        Text = ''
        Transparent = False
      end
      object RLDBText5: TRLDBText
        Left = 137
        Top = 1
        Width = 76
        Height = 16
        Alignment = taCenter
        DataField = 'PRO_DREC'
        DataSource = ds_RelProcessosExt
        Text = ''
        Transparent = False
      end
      object RLDBText8: TRLDBText
        Left = 539
        Top = 4
        Width = 124
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRO_FG_EXTERNO'
        DataSource = ds_RelProcessosExt
        Text = ''
        Transparent = False
      end
      object RLDBText9: TRLDBText
        Left = 435
        Top = 2
        Width = 140
        Height = 16
        DataField = 'PRO_DATA_EXTERNO'
        DataSource = ds_RelProcessosExt
        Text = ''
        Transparent = False
      end
      object RLDBText10: TRLDBText
        Left = 305
        Top = 1
        Width = 34
        Height = 16
        Alignment = taCenter
        DataField = 'TIPO'
        DataSource = ds_RelProcessosExt
        Text = ''
        Transparent = False
      end
    end
    object RLBand8: TRLBand
      Left = 38
      Top = 136
      Width = 718
      Height = 21
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLDBResult2: TRLDBResult
        Left = 53
        Top = 3
        Width = 49
        Height = 16
        DataField = 'PRO_COD'
        DataSource = ds_RelProcessos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riCount
        ParentFont = False
        Text = ''
      end
      object RLLabel19: TRLLabel
        Left = 11
        Top = 3
        Width = 40
        Height = 16
        Caption = 'Total:'
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
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v3.23 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 928
    Top = 440
  end
  object qLimpaXMarcados: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 536
    Top = 216
  end
  object qListaProcessos: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DATAINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DATAFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select NEXT VALUE FOR GRID_LINHAS as sequencial,'
      'p.pro_cod,'
      'p.pro_nperc,'
      'p.CAS_CODIGO,'
      'case p.pro_tipo'
      ' when 1 then '#39'JD'#39
      ' when 2 then '#39'EX'#39
      ' when 3 then '#39'MP'#39
      ' when 4 then '#39'DP'#39
      ' when 5 then '#39'PO'#39
      ' when 6 then '#39'JC'#39
      ' when 7 then '#39'CT'#39
      ' when 8 then '#39'PJ'#39
      ' when 9 then '#39'PR'#39
      ' when 10 then '#39'NPF'#39
      'end Tipo,'
      'p.PRO_DREC,'
      'p.PRO_FG_RESUL,'
      'CASE WHEN (PRO_FG_EXTERNO=1) THEN '#39'ENVIADO'#39' END PRO_FG_EXTERNO,'
      'p.PRO_DATA_EXTERNO'
      'from tb_processo p join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where p.PRO_DREC >= :DATAINI AND p.PRO_DREC <= :DATAFIN'
      'order by 2 desc')
    Left = 200
    Top = 176
    object qListaProcessosSEQUENCIAL: TLargeintField
      DisplayLabel = 'Seq.'
      FieldName = 'SEQUENCIAL'
    end
    object qListaProcessosPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object qListaProcessosPRO_NPERC: TStringField
      DisplayLabel = 'Per'#237'cia'
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qListaProcessosCAS_CODIGO: TStringField
      DisplayLabel = 'Caso'
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qListaProcessosTIPO: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object qListaProcessosPRO_DREC: TDateField
      DisplayLabel = 'Data Recep'#231#227'o'
      FieldName = 'PRO_DREC'
    end
    object qListaProcessosPRO_FG_RESUL: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'PRO_FG_RESUL'
    end
    object qListaProcessosPRO_FG_EXTERNO: TStringField
      FieldName = 'PRO_FG_EXTERNO'
      FixedChar = True
      Size = 7
    end
    object qListaProcessosPRO_DATA_EXTERNO: TDateField
      DisplayLabel = 'Data Envio'
      FieldName = 'PRO_DATA_EXTERNO'
    end
  end
  object ds_ListaProcessos: TDataSource
    DataSet = qListaProcessos
    Left = 72
    Top = 192
  end
  object qAgrupaProcessos: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_PROCESSO p')
    Left = 384
    Top = 352
    object qAgrupaProcessosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qAgrupaProcessosPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qAgrupaProcessosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qAgrupaProcessosPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qAgrupaProcessosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qAgrupaProcessosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qAgrupaProcessosCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qAgrupaProcessosCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qAgrupaProcessosVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qAgrupaProcessosLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qAgrupaProcessosPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
    object qAgrupaProcessosPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qAgrupaProcessosPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      Size = 5
    end
    object qAgrupaProcessosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qAgrupaProcessosPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qAgrupaProcessosPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qAgrupaProcessosPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qAgrupaProcessosPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qAgrupaProcessosPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qAgrupaProcessosPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qAgrupaProcessosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qAgrupaProcessosFG_PROP: TStringField
      FieldName = 'FG_PROP'
      Size = 1
    end
    object qAgrupaProcessosPRO_USUCAD: TStringField
      FieldName = 'PRO_USUCAD'
    end
    object qAgrupaProcessosPRO_NUMLAUDO: TStringField
      FieldName = 'PRO_NUMLAUDO'
    end
    object qAgrupaProcessosPRO_RASTREAR: TStringField
      FieldName = 'PRO_RASTREAR'
    end
    object qAgrupaProcessosPRO_CARREGACREDITO: TStringField
      FieldName = 'PRO_CARREGACREDITO'
      FixedChar = True
      Size = 1
    end
    object qAgrupaProcessosPRO_CREDITODNA: TStringField
      FieldName = 'PRO_CREDITODNA'
    end
    object qAgrupaProcessosPRO_HTREC: TStringField
      FieldName = 'PRO_HTREC'
      Size = 5
    end
    object qAgrupaProcessosPRO_LACRE: TStringField
      FieldName = 'PRO_LACRE'
    end
    object qAgrupaProcessosPRO_FG_RESUL: TIntegerField
      FieldName = 'PRO_FG_RESUL'
    end
  end
  object qAjustaDatas: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 704
    Top = 168
  end
  object qRelLaudo: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select'
      'REPLACE(REPLACE(pa.pes_nome, '#39#160#39', '#39' '#39'), '#39' '#160#39', '#39' '#39') pes_nome,'
      'pr.pro_hash,'
      'pr.pro_prazo,'
      'pr.pro_cod,'
      'pa.PES_DNAS,'
      'pa.pes_pass,'
      'case pr.exa_cod'
      '   when '#39'COVID-19'#39' then '#39'COV-2-'#39' || pr.pro_prot'
      '   when '#39'INFLUENZA'#39' then '#39'FLU-2-'#39' || pr.pro_prot'
      '   when '#39'COVIDINFLU'#39' then '#39'COVFLU-2-'#39' || pr.pro_prot'
      '   when '#39'PNLVIRAL'#39' then '#39'PVIRAL-2-'#39' || pr.pro_prot'
      'end as pro_prot,'
      'l.lab_labt,'
      'pre.pro_resul,'
      'case pre.pro_resul'
      '   when '#39'DETECTADO'#39' then '#39'DETECTED'#39
      '   when '#39'N'#195'O DETECTADO'#39' then '#39'UNDETECTED'#39
      'end as pro_resul_i,'
      '  trim(case extract(month from pr.pro_dcol)'
      '   when 1 then '#39'January'#39
      '   when 2 then '#39'February'#39
      '   when 3 then '#39'March'#39
      '   when 4 then '#39'April'#39
      '   when 5 then '#39'May'#39
      '   when 6 then '#39'June'#39
      '   when 7 then '#39'July'#39
      '   when 8 then '#39'August'#39
      '   when 9 then '#39'September'#39
      '   when 10 then '#39'October'#39
      '   when 11 then '#39'November'#39
      '   when 12 then '#39'December'#39
      
        'end) || '#39' '#39' || trim(extract(day from pr.pro_dcol)) || '#39', '#39' || ex' +
        'tract(year from pr.pro_dcol) as pro_dcol_i,'
      'pr.pro_dcol,'
      'LAB_COD_INTERNET,'
      'LAB_RESUL_INTERNET,'
      'pa.PES_CPF,'
      'pa.PES_COD,'
      'pr.pro_hcol,'
      
        'case when (extract(hour from pr.pro_hcol) > 12) then (extract(ho' +
        'ur from pr.pro_hcol)-12) || '#39':'#39' || case when (extract(minute fro' +
        'm pr.pro_hcol))=0 then extract(minute from pr.pro_hcol) || '#39'0'#39' e' +
        'lse extract(minute from pr.pro_hcol) end || '#39' PM'#39' else (extract(' +
        'hour from pr.pro_hcol)) || '#39':'#39' || case when (extract(minute from' +
        ' pr.pro_hcol))=0 then extract(minute from pr.pro_hcol) || '#39'0'#39' el' +
        'se extract(minute from pr.pro_hcol) end || '#39' AM'#39' end pro_hcol_i,'
      ''
      'pre.pro_resul2,'
      'case pre.pro_resul2'
      '   when '#39'DETECTADO'#39' then '#39'DETECTED'#39
      '   when '#39'N'#195'O DETECTADO'#39' then '#39'UNDETECTED'#39
      'end as pro_resul_i2,'
      'pre.pro_resul3,'
      'case pre.pro_resul3'
      '   when '#39'DETECTADO'#39' then '#39'DETECTED'#39
      '   when '#39'N'#195'O DETECTADO'#39' then '#39'UNDETECTED'#39
      'end as pro_resul_i3,'
      'pre.pro_resul4,'
      'case pre.pro_resul4'
      '   when '#39'DETECTADO'#39' then '#39'DETECTED'#39
      '   when '#39'N'#195'O DETECTADO'#39' then '#39'UNDETECTED'#39
      'end as pro_resul_i4,'
      'pr.exa_cod,'
      'pr.PRO_FG_SITE'
      'from'
      
        'tb_PROCEDIMENTOS pr JOIN tb_procedimentos_resultado pre ON pr.pr' +
        'o_cod = pre.pro_cod'
      
        '                    JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_' +
        'cod'
      
        '                    JOIN tb_exames    e  ON pr.exa_cod = e.exa_c' +
        'od'
      
        '                    JOIN tb_medicos   m  ON pr.med_crm = m.med_c' +
        'rm'
      
        '                    JOIN tb_laboratorios l ON pr.lab_cod = l.lab' +
        '_cod'
      'where pr.PRO_COD = :CODIGO'
      'order by pre.pro_resul'
      ''
      ''
      '')
    Left = 544
    Top = 120
    object qRelLaudoPRO_HASH: TStringField
      FieldName = 'PRO_HASH'
      Size = 255
    end
    object qRelLaudoPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qRelLaudoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelLaudoPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qRelLaudoPES_PASS: TStringField
      FieldName = 'PES_PASS'
      Size = 30
    end
    object qRelLaudoLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelLaudoPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 100
    end
    object qRelLaudoPRO_RESUL_I: TStringField
      FieldName = 'PRO_RESUL_I'
      FixedChar = True
      Size = 10
    end
    object qRelLaudoPRO_DCOL_I: TStringField
      FieldName = 'PRO_DCOL_I'
      Size = 24
    end
    object qRelLaudoPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qRelLaudoLAB_COD_INTERNET: TSmallintField
      FieldName = 'LAB_COD_INTERNET'
    end
    object qRelLaudoLAB_RESUL_INTERNET: TSmallintField
      FieldName = 'LAB_RESUL_INTERNET'
    end
    object qRelLaudoPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qRelLaudoPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qRelLaudoPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qRelLaudoPRO_HCOL_I: TStringField
      FieldName = 'PRO_HCOL_I'
      Size = 32
    end
    object qRelLaudoPRO_RESUL2: TStringField
      FieldName = 'PRO_RESUL2'
      Size = 100
    end
    object qRelLaudoPRO_RESUL_I2: TStringField
      FieldName = 'PRO_RESUL_I2'
      FixedChar = True
      Size = 10
    end
    object qRelLaudoPRO_RESUL3: TStringField
      FieldName = 'PRO_RESUL3'
      Size = 100
    end
    object qRelLaudoPRO_RESUL_I3: TStringField
      FieldName = 'PRO_RESUL_I3'
      FixedChar = True
      Size = 10
    end
    object qRelLaudoPRO_RESUL4: TStringField
      FieldName = 'PRO_RESUL4'
      Size = 100
    end
    object qRelLaudoPRO_RESUL_I4: TStringField
      FieldName = 'PRO_RESUL_I4'
      FixedChar = True
      Size = 10
    end
    object qRelLaudoEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qRelLaudoPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 21
    end
    object qRelLaudoPRO_FG_SITE: TIntegerField
      FieldName = 'PRO_FG_SITE'
    end
    object qRelLaudoPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
  end
  object dsRelLaudo: TDataSource
    DataSet = qRelLaudo
    Left = 680
    Top = 232
  end
  object TcpClient: TIdTCPClient
    ConnectTimeout = 0
    Port = 0
    ReadTimeout = -1
    Left = 415
    Top = 75
  end
  object qIncluiProtocolo: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 296
    Top = 72
  end
  object qSelecionaCasosMapas: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select * from tb_PROCEDIMENTOS pr'
      ' where pr.PRO_FG_RESUL = 1  and pr.pro_prot is not null'
      'order by PRO_PROT')
    Left = 1152
    Top = 96
    object qSelecionaCasosMapasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qSelecionaCasosMapasPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qSelecionaCasosMapasPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qSelecionaCasosMapasLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qSelecionaCasosMapasMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qSelecionaCasosMapasEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qSelecionaCasosMapasPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qSelecionaCasosMapasPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qSelecionaCasosMapasPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qSelecionaCasosMapasPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qSelecionaCasosMapasPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qSelecionaCasosMapasPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qSelecionaCasosMapasPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qSelecionaCasosMapasPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qSelecionaCasosMapasPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qSelecionaCasosMapasPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qSelecionaCasosMapasPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qSelecionaCasosMapasPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qSelecionaCasosMapasPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qSelecionaCasosMapasPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qSelecionaCasosMapasPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qSelecionaCasosMapasPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qSelecionaCasosMapasPRO_FG_RESUL: TSmallintField
      FieldName = 'PRO_FG_RESUL'
    end
    object qSelecionaCasosMapasPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qSelecionaCasosMapasPRO_IDWEB: TSmallintField
      FieldName = 'PRO_IDWEB'
    end
  end
  object qDeletaProcesso: TADOQuery
    Connection = DMI.ADOC_MYSQL
    Parameters = <>
    Left = 376
    Top = 432
  end
  object qConsultaHash: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Valor'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 255
        Size = 255
        Value = ''
      end>
    SQL.Strings = (
      'select * from tb_procedimentos p'
      'where p.pro_hash = :Valor')
    Left = 857
    Top = 24
    object qConsultaHashPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaHashPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qConsultaHashPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qConsultaHashLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qConsultaHashMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qConsultaHashEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qConsultaHashPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qConsultaHashPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qConsultaHashPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qConsultaHashPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qConsultaHashPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qConsultaHashPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qConsultaHashPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qConsultaHashPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qConsultaHashPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qConsultaHashPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qConsultaHashPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qConsultaHashPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qConsultaHashPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qConsultaHashPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qConsultaHashPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qConsultaHashPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qConsultaHashPRO_FG_RESUL: TSmallintField
      FieldName = 'PRO_FG_RESUL'
    end
    object qConsultaHashPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qConsultaHashPRO_IDWEB: TSmallintField
      FieldName = 'PRO_IDWEB'
    end
    object qConsultaHashPRO_TIPPAG: TStringField
      FieldName = 'PRO_TIPPAG'
      Size = 30
    end
    object qConsultaHashPRO_HASH: TStringField
      FieldName = 'PRO_HASH'
      Size = 255
    end
  end
  object qManutencao: TADOQuery
    Parameters = <>
    Left = 896
    Top = 384
  end
  object qProcesso: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Processo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select * from tb_PROCESSO p JOIN tb_pessoas pa ON p.PRO_COD=pa.P' +
        'RO_COD'
      'where p.PRO_COD = :Processo')
    Left = 151
    Top = 337
    object qProcessoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qProcessoPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qProcessoPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qProcessoPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qProcessoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qProcessoCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qProcessoVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qProcessoLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qProcessoPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object qProcessoPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qProcessoPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object qProcessoPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qProcessoPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qProcessoPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qProcessoPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qProcessoPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qProcessoPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qProcessoPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qProcessoCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 10
    end
    object qProcessoJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qProcessoPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qProcessoFG_PROP: TStringField
      FieldName = 'FG_PROP'
      Size = 1
    end
    object qProcessoPRO_USUCAD: TStringField
      FieldName = 'PRO_USUCAD'
    end
    object qProcessoPRO_NUMLAUDO: TStringField
      DisplayLabel = 'N'#250'mero do Laudo'
      FieldName = 'PRO_NUMLAUDO'
    end
    object qProcessoPRO_RASTREAR: TStringField
      FieldName = 'PRO_RASTREAR'
    end
    object qProcessoPRO_CARREGACREDITO: TStringField
      FieldName = 'PRO_CARREGACREDITO'
      FixedChar = True
      Size = 1
    end
    object qProcessoPRO_CREDITODNA: TStringField
      DisplayLabel = 'Cr'#233'dito - DNA'
      FieldName = 'PRO_CREDITODNA'
    end
    object qProcessoPRO_HTREC: TStringField
      FieldName = 'PRO_HTREC'
      Size = 5
    end
    object qProcessoPRO_LACRE: TStringField
      FieldName = 'PRO_LACRE'
    end
    object qProcessoPRO_FG_RESUL: TIntegerField
      FieldName = 'PRO_FG_RESUL'
    end
    object qProcessoPRO_COD_1: TIntegerField
      FieldName = 'PRO_COD_1'
    end
    object qProcessoPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qProcessoPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qProcessoPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qProcessoPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
    end
    object qProcessoPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qProcessoPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qProcessoPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qProcessoPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qProcessoPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 200
    end
  end
  object DS_Processo: TDataSource
    DataSet = qProcesso
    Left = 248
    Top = 345
  end
  object qAjustaSequencial: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 214
    Top = 242
  end
  object qGravaProcesso: TADOQuery
    Connection = DMI.ADOC_MYSQL
    Parameters = <>
    Left = 496
    Top = 432
  end
  object AjustaFGExterno: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 520
    Top = 328
  end
  object ds_RelProcessos: TDataSource
    DataSet = qRelProcessos
    Left = 280
    Top = 184
  end
  object qRelProcessos: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DATAINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DATAFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select NEXT VALUE FOR GRID_LINHAS as sequencial,'
      'p.pro_cod,'
      'p.pro_nperc,'
      'p.CAS_CODIGO,'
      'case p.pro_tipo'
      ' when 1 then '#39'JD'#39
      ' when 2 then '#39'EX'#39
      ' when 3 then '#39'MP'#39
      ' when 4 then '#39'DP'#39
      ' when 5 then '#39'PO'#39
      ' when 6 then '#39'JC'#39
      ' when 7 then '#39'CT'#39
      ' when 8 then '#39'PJ'#39
      ' when 9 then '#39'PR'#39
      ' when 10 then '#39'NPF'#39
      'end Tipo,'
      'p.PRO_DREC,'
      'p.PRO_FG_RESUL,'
      'CASE WHEN (PRO_FG_EXTERNO=1) THEN '#39'ENVIADO'#39' END PRO_FG_EXTERNO,'
      'p.PRO_DATA_EXTERNO'
      'from tb_processo p join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where p.PRO_DREC >= :DATAINI AND p.PRO_DREC <= :DATAFIN'
      'and p.PRO_FG_EXTERNO=1'
      'order by 1')
    Left = 400
    Top = 184
    object qRelProcessosSEQUENCIAL: TLargeintField
      FieldName = 'SEQUENCIAL'
    end
    object qRelProcessosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelProcessosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qRelProcessosCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qRelProcessosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object qRelProcessosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelProcessosPRO_FG_RESUL: TIntegerField
      FieldName = 'PRO_FG_RESUL'
    end
    object qRelProcessosPRO_FG_EXTERNO: TStringField
      FieldName = 'PRO_FG_EXTERNO'
      FixedChar = True
      Size = 7
    end
    object qRelProcessosPRO_DATA_EXTERNO: TDateField
      FieldName = 'PRO_DATA_EXTERNO'
    end
  end
  object qRelProcessosExt: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DATAINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DATAFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select NEXT VALUE FOR GRID_LINHAS as sequencial,'
      'p.pro_cod,'
      'p.pro_nperc,'
      'p.CAS_CODIGO,'
      'case p.pro_tipo'
      ' when 1 then '#39'JD'#39
      ' when 2 then '#39'EX'#39
      ' when 3 then '#39'MP'#39
      ' when 4 then '#39'DP'#39
      ' when 5 then '#39'PO'#39
      ' when 6 then '#39'JC'#39
      ' when 7 then '#39'CT'#39
      ' when 8 then '#39'PJ'#39
      ' when 9 then '#39'PR'#39
      ' when 10 then '#39'NPF'#39
      'end Tipo,'
      'p.PRO_DREC,'
      'p.PRO_FG_RESUL,'
      'CASE WHEN (PRO_FG_EXTERNO=1) THEN '#39'ENVIADO'#39' END PRO_FG_EXTERNO,'
      'p.PRO_DATA_EXTERNO'
      'from tb_processo p join tb_lcoleta l on l.lco_cod = p.lco_cod'
      
        'where p.PRO_DATA_EXTERNO >= :DATAINI AND p.PRO_DATA_EXTERNO <= :' +
        'DATAFIN'
      'and p.PRO_FG_EXTERNO=1'
      'order by 1')
    Left = 408
    Top = 248
    object qRelProcessosExtSEQUENCIAL: TLargeintField
      FieldName = 'SEQUENCIAL'
    end
    object qRelProcessosExtPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelProcessosExtPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qRelProcessosExtCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qRelProcessosExtTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object qRelProcessosExtPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelProcessosExtPRO_FG_RESUL: TIntegerField
      FieldName = 'PRO_FG_RESUL'
    end
    object qRelProcessosExtPRO_FG_EXTERNO: TStringField
      FieldName = 'PRO_FG_EXTERNO'
      FixedChar = True
      Size = 7
    end
    object qRelProcessosExtPRO_DATA_EXTERNO: TDateField
      FieldName = 'PRO_DATA_EXTERNO'
    end
  end
  object ds_RelProcessosExt: TDataSource
    DataSet = qRelProcessosExt
    Left = 296
    Top = 256
  end
  object pm_Relatorio: TPopupMenu
    Left = 818
    Top = 232
    object DatadeRecepeo1: TMenuItem
      Caption = 'Data de Recep'#231#227'o'
      OnClick = DatadeRecepeo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object DatadeEnvio1: TMenuItem
      Caption = 'Data de Envio'
      OnClick = DatadeEnvio1Click
    end
  end
end
