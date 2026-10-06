object fEmissaoLaudosAgrupadoNew: TfEmissaoLaudosAgrupadoNew
  Left = 37
  Top = 117
  BorderStyle = bsDialog
  Caption = 'Administrador Exames Covid-19 - IPCMS'
  ClientHeight = 672
  ClientWidth = 1439
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
    Left = 1108
    Top = 12
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
  object BFechar: TSpeedButton
    Left = 1108
    Top = 44
    Width = 100
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
  object sbTodos: TSpeedButton
    Left = 1225
    Top = 218
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
  object sbInverter: TSpeedButton
    Left = 1225
    Top = 242
    Width = 23
    Height = 21
    Hint = 'Inverte a sele'#231#227'o'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF33339993707399933333773337F3777FF3399933000339
      9933377333777F3377F3399333707333993337733337333337FF993333333333
      399377F33333F333377F993333303333399377F33337FF333373993333707333
      333377F333777F333333993333101333333377F333777F3FFFFF993333000399
      999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
      99933773FF777F3F777F339993707399999333773F373F77777F333999999999
      3393333777333777337333333999993333333333377777333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbInverterClick
  end
  object sbSelProtocolos: TSpeedButton
    Left = 1225
    Top = 266
    Width = 23
    Height = 21
    Hint = 'Selecionar os listados com Protocolo'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
      88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
      F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
      F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
      0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
      00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
      0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
      05555575FF777777755555500055555555555557775555555555}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbSelProtocolosClick
  end
  object sbAtualizaQuant: TSpeedButton
    Left = 1225
    Top = 290
    Width = 23
    Height = 22
    Hint = 'Verifica se tem laudos Liberados no Site.'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF3344444444444443337777777777777F334CCCCCCCCCC
      C43337777777777777F33444881B188444333777F3737337773333308881FF70
      33333337F3373337F3333330888BF770333333373F33F337333333330881F703
      3333333373F73F7333333333308B703333333333373F77333333333333080333
      3333333333777FF333333333301F103333333333377777FF3333333301B1F103
      333333337737777FF3333330881BFB7033333337F3737F77F333333088881F70
      333333F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
      C43337777777777777F334444444444444333777777777777733}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbAtualizaQuantClick
  end
  object sbNaoSite: TSpeedButton
    Left = 1225
    Top = 315
    Width = 23
    Height = 22
    Hint = 'Marca casos com Resultado que n'#227'o est'#227'o no Site.'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbNaoSiteClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 961
    Height = 197
    Caption = 'Par'#226'metros de busca'
    TabOrder = 0
    object Label25: TLabel
      Left = 9
      Top = 54
      Width = 74
      Height = 13
      Caption = 'Local de Coleta'
    end
    object Label2: TLabel
      Left = 9
      Top = 136
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
      Left = 136
      Top = 158
      Width = 6
      Height = 13
      Caption = '&a'
    end
    object sbCLocal: TSpeedButton
      Left = 362
      Top = 67
      Width = 25
      Height = 21
      Caption = '...'
      OnClick = sbCLocalClick
    end
    object Label3: TLabel
      Left = 276
      Top = 139
      Width = 27
      Height = 13
      Caption = 'Prazo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 17
      Width = 42
      Height = 13
      Caption = 'Paciente'
    end
    object Label5: TLabel
      Left = 426
      Top = 139
      Width = 48
      Height = 13
      Caption = 'Resultado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbEtiqueta: TSpeedButton
      Left = 427
      Top = 30
      Width = 23
      Height = 22
      Hint = 'Clique aqui para Gerar a etiqueta.'
      Glyph.Data = {
        76080000424DB608000000000000B60000002800000020000000100000000100
        2000000000000008000000000000000000001000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00008080000080
        8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000FF000000FF000000FF0000000000FFFFFF00008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F00FFFFFF0000808000008080007F7F7F00FFFFFF00008080000080
        800000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000FF000000FF000000FF0000000000FFFFFF00008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F00FFFFFF0000808000008080007F7F7F00FFFFFF00008080000080
        80000080800000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000FF000000FF000000FF0000000000FFFFFF00008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFFFF00008080000080
        8000008080000080800000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000000000000000000000000000000000000FFFFFF00008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        80007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000808000008080000080
        800000808000008080000080800000808000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000080800000808000008080000080
        8000008080000080800000808000FFFFFF000080800000808000000000000000
        00000000000000000000000000000080800000808000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F00FFFFFF000080800000808000008080000080
        800000808000008080007F7F7F00FFFFFF00FFFFFF000080800000000000FFFF
        0000FFFF0000FFFF000000000000008080000080800000808000FFFFFF00FFFF
        FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF007F7F7F00FFFF
        FF0000808000008080007F7F7F00FFFFFF00FFFFFF00FFFFFF00008080000080
        8000008080007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000FFFF
        0000FFFF0000FFFF00000000000000000000000000000080800000808000FFFF
        FF000000000000000000000000000000000000000000FFFFFF007F7F7F00FFFF
        FF0000808000008080007F7F7F007F7F7F007F7F7F00FFFFFF00008080007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
        0000FFFF0000FFFF000000000000FFFF00000000000000808000008080000000
        00000000000000000000000000000000000000000000000000007F7F7F00FFFF
        FF00FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFFFF007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00000000000000
        0000000000000000000000000000FFFF00000000000000000000000000000080
        800000808000000000000000000000000000FFFFFF00FFFFFF007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F00008080007F7F7F007F7F7F007F7F7F00FFFF
        FF00008080007F7F7F007F7F7F007F7F7F00FFFFFF0000808000008080000080
        800000000000FFFF0000FFFF0000FFFF000000000000FFFF0000000000000080
        800000808000000000000000000000000000FFFFFF00FFFFFF00008080000080
        80007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F7F00FFFFFF007F7F7F00FFFF
        FF00008080007F7F7F007F7F7F007F7F7F00FFFFFF0000808000008080000080
        80000000000000000000000000000000000000000000FFFF0000000000000080
        800000808000000000000000000000000000FFFFFF00FFFFFF00008080000080
        80007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00008080007F7F7F00FFFF
        FF00008080007F7F7F007F7F7F007F7F7F000080800000808000008080000080
        8000008080000080800000000000FFFF0000FFFF0000FFFF0000000000000080
        800000000000000000000000000000808000FFFFFF00FFFFFF00008080000080
        800000808000008080007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F00008080000080800000808000008080000080
        8000008080000080800000000000000000000000000000000000000000000080
        80000080800000808000008080000080800000808000FFFFFF00008080000080
        800000808000008080007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000080
        8000008080000080800000808000008080000080800000808000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbEtiquetaClick
    end
    object Label16: TLabel
      Left = 9
      Top = 94
      Width = 32
      Height = 13
      Caption = 'Exame'
    end
    object RxDBLookupComboColeta: TJvDBLookupCombo
      Left = 7
      Top = 69
      Width = 352
      Height = 20
      Hint = 'Laborat'#243'rio'
      ListStyle = lsDelimited
      LookupField = 'LAB_COD'
      LookupDisplay = 'LAB_LABT'
      LookupSource = DMI.dsLaboratorios
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
    end
    object CB_Prazo: TComboBox
      Left = 275
      Top = 155
      Width = 145
      Height = 21
      TabOrder = 3
      Items.Strings = (
        'MESMO DIA'
        '6 HORAS'
        '24 HORAS'
        '48 HORAS'
        '72 HORAS'
        'URGENTE (3H)'
        'S'#193'BADO (3H)'
        'FINAL SEMANA (3H)')
    end
    object RxDBLookupComboPaciente: TJvDBLookupCombo
      Left = 7
      Top = 32
      Width = 416
      Height = 20
      Hint = 'Paciente'
      ListStyle = lsDelimited
      LookupField = 'PES_COD'
      LookupDisplay = 'PES_NOME'
      LookupSource = ds_ConsultaPaciente
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
    end
    object cb_ConsultaResultado: TComboBox
      Left = 425
      Top = 155
      Width = 145
      Height = 21
      TabOrder = 4
      Items.Strings = (
        'SEM RESULTADO'
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object RxDBLookupComboExame: TJvDBLookupCombo
      Left = 7
      Top = 109
      Width = 506
      Height = 20
      Hint = 'Exames'
      ListStyle = lsDelimited
      LookupField = 'EXA_COD'
      LookupDisplay = 'EXA_COD'
      LookupSource = DMI.dsExames
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
    end
    object DateEditInicial: TJvDateEdit
      Left = 9
      Top = 155
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 5
    end
    object DateEditFinal: TJvDateEdit
      Left = 148
      Top = 155
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 6
    end
  end
  object gb_Covid: TGroupBox
    Left = 9
    Top = 569
    Width = 954
    Height = 97
    Caption = 'Resultados'
    TabOrder = 1
    Visible = False
    object Label10: TLabel
      Left = 8
      Top = 18
      Width = 84
      Height = 13
      Caption = 'Resultado (Covid)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbProcessarCovid: TSpeedButton
      Left = 89
      Top = 61
      Width = 100
      Height = 30
      Caption = 'Processar'
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
      OnClick = sbProcessarCovidClick
    end
    object cb_ResultadoCovid: TComboBox
      Left = 7
      Top = 37
      Width = 186
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
  end
  object GroupBox3: TGroupBox
    Left = 1256
    Top = 8
    Width = 177
    Height = 657
    Caption = 'Op'#231#245'es'
    TabOrder = 2
    object sbGeraLaudos: TSpeedButton
      Left = 7
      Top = 174
      Width = 160
      Height = 50
      Caption = 'Gerar Laudos Pasta / Site'
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
      OnClick = sbGeraLaudosClick
    end
    object sbGeraEtiquetas: TSpeedButton
      Left = 7
      Top = 24
      Width = 160
      Height = 50
      Caption = 'Gerar Etiquetas'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      OnClick = sbGeraEtiquetasClick
    end
    object sbGerarProtocolo: TSpeedButton
      Left = 7
      Top = 74
      Width = 160
      Height = 50
      Caption = 'Gerar Procoloto'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0000377777777777777703030303030303037F7F7F7F7F7F7F7F000000000000
        00007777777777777777933393303933337073F37F37F73F3377393393303393
        379037FF7F37F37FF777379793303379793037777337F3777737339933303339
        93303377F3F7F3F77F3733993930393993303377F737F7377FF7399993303399
        999037777337F377777793993330333393307377FF37F3337FF7333993303333
        993033377F37F33377F7333993303333993033377337F3337737333333303333
        33303FFFFFF7FFFFFFF700000000000000007777777777777777030303030303
        03037F7F7F7F7F7F7F7F00000000000000007777777777777777}
      NumGlyphs = 2
      OnClick = sbGerarProtocoloClick
    end
    object sbGeraPlaca: TSpeedButton
      Left = 7
      Top = 124
      Width = 160
      Height = 50
      Caption = 'Gerar Placa'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      OnClick = sbGeraPlacaClick
    end
  end
  object gb_Influenza: TGroupBox
    Left = 8
    Top = 569
    Width = 954
    Height = 97
    Caption = 'Resultados'
    TabOrder = 3
    Visible = False
    object Label6: TLabel
      Left = 8
      Top = 18
      Width = 104
      Height = 13
      Caption = 'Resultado Influenza A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbProcessarInfluenza: TSpeedButton
      Left = 278
      Top = 61
      Width = 100
      Height = 30
      Caption = 'Processar'
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
      OnClick = sbProcessarInfluenzaClick
    end
    object Label7: TLabel
      Left = 195
      Top = 17
      Width = 104
      Height = 13
      Caption = 'Resultado Influenza B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cb_ResultadoInfluenzaA: TComboBox
      Left = 7
      Top = 37
      Width = 186
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object cb_ResultadoInfluenzaB: TComboBox
      Left = 194
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 1
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
  end
  object gb_CI: TGroupBox
    Left = 8
    Top = 567
    Width = 954
    Height = 97
    Caption = 'Resultados'
    TabOrder = 5
    Visible = False
    object Label8: TLabel
      Left = 194
      Top = 17
      Width = 104
      Height = 13
      Caption = 'Resultado Influenza A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbProcessarCovidInfluenza: TSpeedButton
      Left = 463
      Top = 61
      Width = 100
      Height = 30
      Caption = 'Processar'
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
      OnClick = sbProcessarCovidInfluenzaClick
    end
    object Label9: TLabel
      Left = 381
      Top = 17
      Width = 104
      Height = 13
      Caption = 'Resultado Influenza B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 18
      Width = 84
      Height = 13
      Caption = 'Resultado (Covid)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cb_ResultadoCI_InfluenzaA: TComboBox
      Left = 193
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object cb_ResultadoCI_InfluenzaB: TComboBox
      Left = 380
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 1
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object cb_ResultadoCI_Covid: TComboBox
      Left = 7
      Top = 37
      Width = 186
      Height = 21
      TabOrder = 2
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
  end
  object gb_Painel: TGroupBox
    Left = 8
    Top = 569
    Width = 954
    Height = 97
    Caption = 'Resultados'
    TabOrder = 4
    Visible = False
    object Label12: TLabel
      Left = 194
      Top = 17
      Width = 104
      Height = 13
      Caption = 'Resultado Influenza A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object sbProcessarPainel: TSpeedButton
      Left = 651
      Top = 61
      Width = 100
      Height = 30
      Caption = 'Processar'
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
      OnClick = sbProcessarPainelClick
    end
    object Label13: TLabel
      Left = 381
      Top = 17
      Width = 104
      Height = 13
      Caption = 'Resultado Influenza B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 18
      Width = 84
      Height = 13
      Caption = 'Resultado (Covid)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 568
      Top = 16
      Width = 118
      Height = 13
      Caption = 'Resultado V'#237'rus Sincicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object cb_ResultadoPainel_InfluenzaA: TComboBox
      Left = 193
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object cb_ResultadoPainel_InfluenzaB: TComboBox
      Left = 380
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 1
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object cb_ResultadoPainel_Covid: TComboBox
      Left = 7
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 2
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
    object cb_ResultadoPainel_VRS: TComboBox
      Left = 567
      Top = 36
      Width = 186
      Height = 21
      TabOrder = 3
      Items.Strings = (
        'N'#195'O DETECTADO'
        'DETECTADO')
    end
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 202
    Width = 1249
    Height = 361
    Color = clWhite
    DataSource = ds_ListaProcedimentos
    DrawingStyle = gdsClassic
    GradientEndColor = clBtnFace
    GradientStartColor = clBtnFace
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridCellClick
    OnDrawColumnCell = DBGridDrawColumnCell
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'SEQUENCIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_FG_SITE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_PROT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAB_LABT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DCOL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXA_COD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_PRAZO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESULTADO_COVID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESULTADO_INFLUA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESULTADO_INFLUB'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESULTADO_VRS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_FG_RESUL'
        Visible = True
      end>
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 'FortesReport v3.23 \251 Copyright '#169' 1999-2004 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 1064
    Top = 112
  end
  object qLimpaXMarcados: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 576
    Top = 72
  end
  object qListaProcedimentos: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select NEXT VALUE FOR GRID_LINHAS as sequencial,'
      'pr.pro_cod,'
      'pr.pro_hash,'
      'pr.pro_prot,'
      'pr.pro_dcol,'
      'pr.PRO_FG_SITE,'
      'pr.pes_cod,'
      
        '(select PA.pes_nome from tb_PACIENTES pa WHERE pr.pes_cod = pa.p' +
        'es_cod) pes_nome,'
      
        '(select l.lab_labt from  tb_laboratorios l where pr.lab_cod = l.' +
        'lab_cod)  lab_labt,'
      
        '(select e.exa_cod from  tb_exames e where pr.exa_cod = e.exa_cod' +
        ') exa_cod,'
      'pr.pro_fg_resul,'
      'pr.pro_prazo,'
      
        ' (select r.pro_resul from tb_procedimentos_resultado R where r.p' +
        'ro_cod = pr.pro_cod) resultado_covid,'
      
        ' (select r.pro_resul2 from tb_procedimentos_resultado R where r.' +
        'pro_cod = pr.pro_cod) resultado_influa,'
      
        ' (select r.pro_resul3 from tb_procedimentos_resultado R where r.' +
        'pro_cod = pr.pro_cod) resultado_influb,'
      
        ' (select r.pro_resul4 from tb_procedimentos_resultado R where r.' +
        'pro_cod = pr.pro_cod) resultado_vrs   '
      ''
      'from'
      'tb_PROCEDIMENTOS pr'
      'where pr.pro_cod = 20120001')
    Left = 576
    Top = 8
    object qListaProcedimentosSEQUENCIAL: TLargeintField
      DisplayLabel = 'Seq.'
      DisplayWidth = 4
      FieldName = 'SEQUENCIAL'
    end
    object qListaProcedimentosPRO_FG_SITE: TSmallintField
      DisplayLabel = 'Site'
      DisplayWidth = 5
      FieldName = 'PRO_FG_SITE'
    end
    object qListaProcedimentosPRO_PROT: TStringField
      DisplayLabel = 'Protocolo'
      DisplayWidth = 12
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qListaProcedimentosLAB_LABT: TStringField
      DisplayLabel = 'Laborat'#243'rio'
      DisplayWidth = 28
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qListaProcedimentosPES_NOME: TStringField
      DisplayLabel = 'Paciente'
      DisplayWidth = 40
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qListaProcedimentosPRO_DCOL: TDateField
      DisplayLabel = 'Data Coleta'
      DisplayWidth = 12
      FieldName = 'PRO_DCOL'
    end
    object qListaProcedimentosEXA_COD: TStringField
      DisplayLabel = 'Exame'
      DisplayWidth = 10
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qListaProcedimentosPRO_PRAZO: TStringField
      DisplayLabel = 'Prazo'
      DisplayWidth = 10
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qListaProcedimentosRESULTADO_COVID: TStringField
      DisplayLabel = 'R. (Covid)'
      DisplayWidth = 15
      FieldName = 'RESULTADO_COVID'
      Size = 100
    end
    object qListaProcedimentosRESULTADO_INFLUA: TStringField
      DisplayLabel = 'R. (Influenza A)'
      DisplayWidth = 15
      FieldName = 'RESULTADO_INFLUA'
      Size = 100
    end
    object qListaProcedimentosRESULTADO_INFLUB: TStringField
      DisplayLabel = 'R. (Influenza B)'
      DisplayWidth = 15
      FieldName = 'RESULTADO_INFLUB'
      Size = 100
    end
    object qListaProcedimentosRESULTADO_VRS: TStringField
      DisplayLabel = 'R. (V'#237'rus Sincicial)'
      DisplayWidth = 15
      FieldName = 'RESULTADO_VRS'
      Size = 100
    end
    object qListaProcedimentosPRO_FG_RESUL: TSmallintField
      DisplayLabel = 'Sel.'
      DisplayWidth = 4
      FieldName = 'PRO_FG_RESUL'
    end
    object qListaProcedimentosPES_COD: TIntegerField
      DisplayWidth = 10
      FieldName = 'PES_COD'
      Visible = False
    end
    object qListaProcedimentosPRO_HASH: TStringField
      DisplayWidth = 255
      FieldName = 'PRO_HASH'
      Visible = False
      Size = 255
    end
    object qListaProcedimentosPRO_COD: TIntegerField
      DisplayWidth = 10
      FieldName = 'PRO_COD'
      Visible = False
    end
  end
  object ds_ListaProcedimentos: TDataSource
    DataSet = qListaProcedimentos
    Left = 608
    Top = 8
  end
  object qLancaResultado: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_PROCEDIMENTOS pr ')
    Left = 592
    Top = 120
    object qLancaResultadoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qLancaResultadoPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qLancaResultadoPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qLancaResultadoLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qLancaResultadoMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qLancaResultadoEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qLancaResultadoPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qLancaResultadoPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qLancaResultadoPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qLancaResultadoPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qLancaResultadoPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qLancaResultadoPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qLancaResultadoPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qLancaResultadoPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qLancaResultadoPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qLancaResultadoPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qLancaResultadoPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qLancaResultadoPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qLancaResultadoPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qLancaResultadoPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qLancaResultadoPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qLancaResultadoPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qLancaResultadoPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qLancaResultadoPRO_FG_RESUL: TSmallintField
      FieldName = 'PRO_FG_RESUL'
    end
  end
  object qAjustaDatas: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 632
    Top = 112
  end
  object qAtualizaResultado: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 936
    Top = 64
  end
  object qAtualizaPacientes: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 936
    Top = 32
  end
  object qAtualizaLibera: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 934
    Top = 2
  end
  object qAjustaSequencial: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 912
    Top = 16
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
    Left = 664
    Top = 112
  end
  object TcpClient: TIdTCPClient
    ConnectTimeout = 0
    Port = 0
    ReadTimeout = -1
    Left = 575
    Top = 75
  end
  object pm_Funcoes: TPopupMenu
    Left = 984
    Top = 112
    object GerarEtiqueta1: TMenuItem
      Caption = 'Gerar Etiqueta'
      OnClick = GerarEtiqueta1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object GerarProtocolo1: TMenuItem
      Caption = 'Gerar Protocolo (Individual)'
      OnClick = GerarProtocolo1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PcientesConsulta1: TMenuItem
      Caption = 'Pacientes (Consulta)'
      OnClick = PcientesConsulta1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object CasoConsulta1: TMenuItem
      Caption = 'Caso (Consulta)'
      OnClick = CasoConsulta1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Laudo1: TMenuItem
      Caption = 'Laudo'
      OnClick = Laudo1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object EnviarLaudoSiteArquivo1: TMenuItem
      Caption = 'Enviar Laudo Site (Arquivo)'
      OnClick = EnviarLaudoSiteArquivo1Click
    end
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
  object qAtualizaCPF: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 768
    Top = 112
  end
  object qConsultaPaciente: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select p.pes_cod, p.pes_nome from TB_PACIENTES p'
      'order by p.pes_nome')
    Left = 656
    Top = 48
    object qConsultaPacientePES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qConsultaPacientePES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
  end
  object ds_ConsultaPaciente: TDataSource
    DataSet = qConsultaPaciente
    Left = 656
    Top = 80
  end
  object qDeletaArquivo: TADOQuery
    Connection = DMI.ADOC_MYSQL
    Parameters = <>
    Left = 808
    Top = 112
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
    Left = 744
    Top = 64
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
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 880
    Top = 128
  end
end
