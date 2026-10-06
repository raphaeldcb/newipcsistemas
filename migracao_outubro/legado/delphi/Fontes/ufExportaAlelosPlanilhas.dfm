object fExportacaoAlelos: TfExportacaoAlelos
  Left = 438
  Top = 154
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exporta'#231#227'o de Alelos para Planilhas do Laborat'#243'rio - C'#225'lculo'
  ClientHeight = 633
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  TextHeight = 14
  object sbExportar: TSpeedButton
    Left = 135
    Top = 595
    Width = 129
    Height = 36
    Caption = '&Exportar'
    Enabled = False
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbExportarClick
  end
  object sbFechar: TSpeedButton
    Left = 392
    Top = 593
    Width = 129
    Height = 41
    Caption = '&Fechar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
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
    OnClick = sbFecharClick
  end
  object Label2: TLabel
    Left = 1016
    Top = 58
    Width = 156
    Height = 13
    Caption = 'Informe o C'#243'digo do SCPG:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 339
    Top = 303
    Width = 50
    Height = 14
    Caption = 'Posi'#231#227'o 1:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 339
    Top = 346
    Width = 50
    Height = 14
    Caption = 'Posi'#231#227'o 2:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 340
    Top = 390
    Width = 50
    Height = 14
    Caption = 'Posi'#231#227'o 3:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object sbLimpar: TSpeedButton
    Left = 263
    Top = 593
    Width = 129
    Height = 41
    Caption = '&Limpar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbLimparClick
  end
  object sbNaoDisponivel1: TSpeedButton
    Left = 237
    Top = 320
    Width = 23
    Height = 24
    Hint = 'Marcar o tericera posi'#231#227'o como n'#227'o dispon'#237'vel'
    Caption = 'ND'
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = sbNaoDisponivel1Click
  end
  object sbNaoDisponivel4: TSpeedButton
    Left = 238
    Top = 446
    Width = 23
    Height = 24
    Hint = 'Marcar o terceira posi'#231#227'o como n'#227'o dispon'#237'vel'
    Caption = 'ND'
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = sbNaoDisponivel4Click
  end
  object Label6: TLabel
    Left = 340
    Top = 430
    Width = 50
    Height = 14
    Caption = 'Posi'#231#227'o 4:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object L_Tipo: TLabel
    Left = 10
    Top = 110
    Width = 46
    Height = 22
    Caption = 'TIPO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbConsultar: TSpeedButton
    Left = 558
    Top = 232
    Width = 137
    Height = 33
    Caption = 'Consultar'
    Visible = False
    OnClick = sbConsultarClick
  end
  object sbProcessamento: TSpeedButton
    Left = 383
    Top = 105
    Width = 129
    Height = 34
    Caption = '&Processamento'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbProcessamentoClick
  end
  object sbGerarPDF: TSpeedButton
    Left = 0
    Top = 598
    Width = 129
    Height = 36
    Caption = '&Gerar PDF'
    Enabled = False
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
      5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
      335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
      C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
      CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
      C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
      CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
      5555555775FFFF77555555555C4CCC5555555555577777555555}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbGerarPDFClick
  end
  object sbNaoDisponivel5: TSpeedButton
    Left = 238
    Top = 487
    Width = 23
    Height = 24
    Hint = 'Marcar o terceira posi'#231#227'o como n'#227'o dispon'#237'vel'
    Caption = 'ND'
    Flat = True
    ParentShowHint = False
    ShowHint = True
    OnClick = sbNaoDisponivel5Click
  end
  object Label7: TLabel
    Left = 340
    Top = 471
    Width = 50
    Height = 14
    Caption = 'Posi'#231#227'o 5:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 576
    Top = 58
    Width = 119
    Height = 117
    Stretch = True
  end
  object Label8: TLabel
    Left = 163
    Top = 82
    Width = 101
    Height = 14
    Caption = 'N'#250'mero Caso IPCMS:'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 518
    Width = 513
    Height = 75
    Caption = 'Informe o caminho do arquivo de destino XLS/XLSX/XLSXM'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    object Label1: TLabel
      Left = 9
      Top = 30
      Width = 39
      Height = 14
      Caption = 'Destino:'
    end
    object btnDestino: TSpeedButton
      Left = 453
      Top = 45
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnDestinoClick
    end
    object edtDestino: TEdit
      Left = 6
      Top = 46
      Width = 441
      Height = 22
      TabOrder = 0
    end
    object cb_NovoModelo: TCheckBox
      Left = 399
      Top = 10
      Width = 85
      Height = 17
      Caption = 'Novo Modelo'
      TabOrder = 1
      OnClick = cb_NovoModeloClick
    end
  end
  object EdtCodigo: TEdit
    Left = 1016
    Top = 74
    Width = 177
    Height = 22
    TabOrder = 1
    Visible = False
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 141
    Width = 509
    Height = 153
    Caption = 'Pessoas envolvidos na Investiga'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object DBGrid2: TDBGrid
      Left = 8
      Top = 20
      Width = 465
      Height = 117
      DataSource = ds_ConsultaPessoas
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PES_NOME'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PES_SEXO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PES_INICIAIS'
          Width = 70
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 296
    Width = 223
    Height = 214
    Caption = 'Selecione o envolvido para posi'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 8
      Top = 20
      Width = 208
      Height = 181
      DataSource = DS_PessoasParaExportar
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NM2_ALE'
          Visible = True
        end>
    end
  end
  object EdtPosicao1: TEdit
    Left = 336
    Top = 320
    Width = 94
    Height = 22
    Enabled = False
    TabOrder = 4
  end
  object EdtPosicao2: TEdit
    Left = 336
    Top = 363
    Width = 94
    Height = 22
    Enabled = False
    TabOrder = 6
  end
  object EdtPosicao3: TEdit
    Left = 337
    Top = 407
    Width = 94
    Height = 22
    Enabled = False
    TabOrder = 8
  end
  object bbtP1: TBitBtn
    Left = 263
    Top = 319
    Width = 55
    Height = 25
    Hint = 'Selecionar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = bbtP1Click
  end
  object bbtP2: TBitBtn
    Left = 264
    Top = 362
    Width = 55
    Height = 25
    Hint = 'Selecionar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = bbtP2Click
  end
  object bbtP3: TBitBtn
    Left = 265
    Top = 405
    Width = 55
    Height = 25
    Hint = 'Selecionar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = bbtP3Click
  end
  object bbtP4: TBitBtn
    Left = 265
    Top = 445
    Width = 55
    Height = 25
    Hint = 'Selecionar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = bbtP4Click
  end
  object EdtPosicao4: TEdit
    Left = 337
    Top = 447
    Width = 94
    Height = 22
    Enabled = False
    TabOrder = 12
  end
  object gbxImport: TGroupBox
    Left = 8
    Top = 2
    Width = 509
    Height = 69
    Caption = 'Informe o caminho do arquivo TXT/CSV'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbOrigem: TLabel
      Left = 8
      Top = 21
      Width = 37
      Height = 14
      Caption = 'Origem:'
    end
    object btnOrigem: TSpeedButton
      Left = 453
      Top = 36
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnOrigemClick
    end
    object edtOrigem: TEdit
      Left = 8
      Top = 36
      Width = 439
      Height = 22
      TabOrder = 0
    end
  end
  object bbtP5: TBitBtn
    Left = 265
    Top = 486
    Width = 55
    Height = 25
    Hint = 'Selecionar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    OnClick = bbtP5Click
  end
  object EdtPosicao5: TEdit
    Left = 336
    Top = 487
    Width = 94
    Height = 22
    Enabled = False
    TabOrder = 14
  end
  object cb_LabExterno: TCheckBox
    Left = 8
    Top = 80
    Width = 121
    Height = 17
    Caption = 'Laborat'#243'rio Externo'
    TabOrder = 15
    OnClick = cb_LabExternoClick
  end
  object EditNumCasoExterno: TEdit
    Left = 277
    Top = 77
    Width = 121
    Height = 22
    Enabled = False
    TabOrder = 16
  end
  object cb_UNA_Posicao2: TCheckBox
    Left = 434
    Top = 366
    Width = 94
    Height = 17
    Caption = 'Usa nome arq.'
    TabOrder = 17
    OnClick = cb_UNA_Posicao2Click
  end
  object cb_UNA_Posicao3: TCheckBox
    Left = 434
    Top = 410
    Width = 94
    Height = 17
    Caption = 'Usa nome arq.'
    TabOrder = 18
    OnClick = cb_UNA_Posicao3Click
  end
  object opndlgDestino: TOpenDialog
    DefaultExt = '*.xlsx'
    Filter = 
      'Arquivos Excel (*.xls)|*.xls|Arquivos Excel (*.xlsx)|*.xlsx|Arqu' +
      'ivos Excel (*.xlsm)|*.xlsm'
    InitialDir = 'C:\SCPG\Modelos\Planilhas'
    Left = 416
    Top = 563
  end
  object qGeraDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pessoa'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = '0'
      end
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
      end
      item
        Name = 'Marcador'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 200
        Size = 200
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_ALELOS'
      
        'where (NM2_ALE = :Pessoa) and (NM1_ALE = :Numero) and (mar_ale =' +
        ' :Marcador)')
    Left = 24
    Top = 394
    object qGeraDadosCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qGeraDadosNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qGeraDadosNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qGeraDadosNM3_ALE: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qGeraDadosNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qGeraDadosMAR_ALE: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qGeraDadosAL1_ALE: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qGeraDadosAL2_ALE: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qGeraDadosORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qPessoasParaExportar: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'select distinct al.nm2_ale from TB_ALELOS al'
      'where al.nm1_ale = :Codigo')
    Left = 304
    Top = 179
    object qPessoasParaExportarNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
  end
  object DS_PessoasParaExportar: TDataSource
    DataSet = qPessoasParaExportar
    Left = 416
    Top = 203
  end
  object qConsultaPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select p.pes_nome,'
      'CASE p.pes_sexo'
      '   WHEN 1 THEN '#39'Masculino'#39
      '   WHEN 1 THEN '#39'Feminino'#39
      '   ELSE '#39'N'#227'o informado'#39
      'END pes_sexo'
      ', p.pes_iniciais, po.pro_cod, po.cas_codigo'
      'from tb_pessoas p join tb_processo po on po.pro_cod = p.pro_cod'
      'where p.pro_cod= :Codigo')
    Left = 312
    Top = 235
    object qConsultaPessoasPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qConsultaPessoasPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 13
    end
    object qConsultaPessoasPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qConsultaPessoasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaPessoasCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
  end
  object ds_ConsultaPessoas: TDataSource
    DataSet = qConsultaPessoas
    Left = 416
    Top = 235
  end
  object opndlgOrigem: TOpenDialog
    DefaultExt = '*.csv'
    Filter = 
      'Arquivos CSV (*.csv)|*.csv|Arquivos Texto (*.txt)|*.txt|Arquivos' +
      ' Excel (*.xls)|*.xls'
    InitialDir = 'U:\Laboratorio\Casos_Analisados'
    Left = 1080
    Top = 247
  end
  object qInsereDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_ALELOS'
      'where COD_ALE = 1')
    Left = 1016
    Top = 271
    object qInsereDadosCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qInsereDadosNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qInsereDadosNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qInsereDadosNM3_ALE: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qInsereDadosNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qInsereDadosMAR_ALE: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qInsereDadosAL1_ALE: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qInsereDadosAL2_ALE: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qInsereDadosORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object DS_InsereDados: TDataSource
    DataSet = qMostraResultado
    Left = 1064
    Top = 311
  end
  object qVerificaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 1120
    Top = 263
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pessoa'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = '0'
      end
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'select * from TB_ALELOS'
      'where (NM2_ALE = :Pessoa) and (NM1_ALE = :Numero)'
      'order by ord_ale')
    Left = 1184
    Top = 215
    object IntegerField1: TIntegerField
      FieldName = 'COD_ALE'
    end
    object StringField1: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object StringField3: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object StringField4: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object StringField5: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object StringField6: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object IntegerField2: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qVerificaDadosCodigo: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'select distinct NM1_ALE from TB_ALELOS              '
      'where NM1_ALE = :Numero')
    Left = 1088
    Top = 375
    object qVerificaDadosCodigoNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
  end
  object qExcluirCaso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'delete from TB_ALELOS'
      'where (NM1_ALE = :Numero)')
    Left = 1200
    Top = 303
    object IntegerField3: TIntegerField
      FieldName = 'COD_ALE'
    end
    object StringField8: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object StringField9: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object StringField10: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object StringField11: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object StringField12: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object StringField13: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object StringField14: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object IntegerField4: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qGuardaAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 1256
    Top = 303
    object IntegerField5: TIntegerField
      FieldName = 'COD_ALE'
    end
    object StringField15: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object StringField16: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object StringField17: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object StringField18: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object StringField19: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object StringField20: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object StringField21: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object IntegerField6: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qInsereDadosTemporarios: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_ALELOS_TMP')
    Left = 1256
    Top = 191
    object qInsereDadosTemporariosCOD_TALE: TIntegerField
      FieldName = 'COD_TALE'
    end
    object qInsereDadosTemporariosCASO_TALE: TStringField
      FieldName = 'CASO_TALE'
      Size = 100
    end
    object qInsereDadosTemporariosPESSOA_TALE: TStringField
      FieldName = 'PESSOA_TALE'
      Size = 100
    end
    object qInsereDadosTemporariosINICIAIS_TALE: TStringField
      FieldName = 'INICIAIS_TALE'
      Size = 100
    end
    object qInsereDadosTemporariosTIPO_TALE: TStringField
      FieldName = 'TIPO_TALE'
      Size = 100
    end
    object qInsereDadosTemporariosALELO_TALE: TStringField
      FieldName = 'ALELO_TALE'
      Size = 200
    end
    object qInsereDadosTemporariosVALOR1_TALE: TStringField
      FieldName = 'VALOR1_TALE'
      Size = 30
    end
    object qInsereDadosTemporariosVALOR2_TALE: TStringField
      FieldName = 'VALOR2_TALE'
      Size = 30
    end
  end
  object qBuscaTemporarios: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Caso'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_ALELOS_TMP'
      'where CASO_TALE = :Caso')
    Left = 1280
    Top = 247
    object qBuscaTemporariosCOD_TALE: TIntegerField
      FieldName = 'COD_TALE'
    end
    object qBuscaTemporariosCASO_TALE: TStringField
      FieldName = 'CASO_TALE'
      Size = 100
    end
    object qBuscaTemporariosPESSOA_TALE: TStringField
      FieldName = 'PESSOA_TALE'
      Size = 100
    end
    object qBuscaTemporariosINICIAIS_TALE: TStringField
      FieldName = 'INICIAIS_TALE'
      Size = 100
    end
    object qBuscaTemporariosTIPO_TALE: TStringField
      FieldName = 'TIPO_TALE'
      Size = 100
    end
    object qBuscaTemporariosALELO_TALE: TStringField
      FieldName = 'ALELO_TALE'
      Size = 200
    end
    object qBuscaTemporariosVALOR1_TALE: TStringField
      FieldName = 'VALOR1_TALE'
      Size = 30
    end
    object qBuscaTemporariosVALOR2_TALE: TStringField
      FieldName = 'VALOR2_TALE'
      Size = 30
    end
  end
  object qBuscaTipo: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Tipo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Alelo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 60
        Size = 60
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_ALELOS_TIPOS'
      'where ATP_TIPO = :Tipo and ATP_NOME = :Alelo')
    Left = 944
    Top = 175
    object qBuscaTipoATP_COD: TIntegerField
      FieldName = 'ATP_COD'
    end
    object qBuscaTipoATP_NOME: TStringField
      FieldName = 'ATP_NOME'
      Size = 60
    end
    object qBuscaTipoATP_ORDEM: TIntegerField
      FieldName = 'ATP_ORDEM'
    end
    object qBuscaTipoATP_TIPO: TStringField
      FieldName = 'ATP_TIPO'
      Size = 30
    end
  end
  object qMostraResultado: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Caso'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      
        'SELECT p.pes_nome, p.pes_iniciais, a.mar_ale, a.al1_ale, a.al2_a' +
        'le, A.nm1_ale'
      
        'FROM TB_ALELOS A join tb_pessoas p on p.pro_cod = a.nm1_ale and ' +
        'a.nm3_ale = p.pes_iniciais'
      'WHERE A.nm1_ale = :Caso')
    Left = 1080
    Top = 151
    object qMostraResultadoPES_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qMostraResultadoPES_INICIAIS: TStringField
      DisplayLabel = 'Inciais'
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qMostraResultadoMAR_ALE: TStringField
      DisplayLabel = 'Marcador'
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qMostraResultadoAL1_ALE: TStringField
      DisplayLabel = 'Valor 1'
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qMostraResultadoAL2_ALE: TStringField
      DisplayLabel = 'Valor 2'
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qMostraResultadoNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
  end
  object qExcluiCasoTEMP: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'delete from TB_ALELOS_TMP'
      'where (CASO_TALE = :Numero)')
    Left = 1312
    Top = 303
  end
  object qVerificaCasoIncluso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_ALELOS'
      'where (NM1_ALE = :Numero)')
    Left = 1208
    Top = 463
    object IntegerField7: TIntegerField
      FieldName = 'COD_ALE'
    end
    object StringField22: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object StringField23: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object StringField24: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object StringField25: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object StringField26: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object StringField27: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object StringField28: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object IntegerField8: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qDadosRepeticaoAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pessoa'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = '0'
      end
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'select * from TB_ALELOS'
      'where (NM2_ALE = :Pessoa) and (NM1_ALE = :Numero)'
      'order by ord_ale')
    Left = 952
    Top = 463
    object qDadosRepeticaoAlelosCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qDadosRepeticaoAlelosNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qDadosRepeticaoAlelosNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qDadosRepeticaoAlelosNM3_ALE: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qDadosRepeticaoAlelosNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qDadosRepeticaoAlelosMAR_ALE: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qDadosRepeticaoAlelosAL1_ALE: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qDadosRepeticaoAlelosAL2_ALE: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qDadosRepeticaoAlelosORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qTipoPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
      end>
    SQL.Strings = (
      'select distinct NM2_ALE from TB_ALELOS'
      'where (NM1_ALE = :Numero)')
    Left = 1056
    Top = 463
    object qTipoPessoasNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
  end
  object qDadosProcesso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PROCESSO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select p.*,'
      'upper(cast((case p.pro_tipo'
      ' when 1 then '#39'Judicial'#39
      ' when 2 then '#39'ExtraJudicial'#39
      ' when 3 then '#39'Minist'#233'rio P'#250'blico'#39
      ' when 4 then '#39'Defensoria P'#250'blica'#39
      ' when 5 then '#39'Delegacia de Pol'#237'cia'#39
      ' when 6 then '#39'Justi'#231'a Comunit'#225'ria'#39
      ' when 7 then '#39'Conselho Tutelar'#39
      ' when 8 then '#39'Promotoria de Justi'#231'a'#39
      ' when 9 then '#39'Paternidade Respons'#225'vel'#39
      ' when 10 then '#39'N'#250'cleo de Pr'#225'tica Forense'#39
      ' when 11 then '#39'Dire'#231#227'o do Foro'#39
      ' when 12 then '#39'Autoridade Solicitante'#39
      
        'end) as varchar(200) character set ISO8859_1) COLLATE PT_BR) pro' +
        '_tipo_xlsx,'
      'upper(case p.pro_resul'
      ' when 1 then '#39'Positivo'#39
      ' when 2 then '#39'Negativo'#39
      ' when 3 then '#39'Cancelado'#39
      ' when 4 then '#39'Andamento'#39
      ' when 5 then '#39'Proposta'#39
      ' when 6 then '#39'Inconclusivo'#39
      'end) pro_resul_xlsx'
      'from TB_PROCESSO p'
      'where p.PRO_COD = :PROCESSO')
    Left = 960
    Top = 312
    object qDadosProcessoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qDadosProcessoPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qDadosProcessoPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qDadosProcessoPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qDadosProcessoPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qDadosProcessoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qDadosProcessoCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qDadosProcessoCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qDadosProcessoVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qDadosProcessoLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qDadosProcessoPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
    object qDadosProcessoPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qDadosProcessoPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      Size = 5
    end
    object qDadosProcessoPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qDadosProcessoPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qDadosProcessoPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qDadosProcessoPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qDadosProcessoPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qDadosProcessoPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qDadosProcessoPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qDadosProcessoJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qDadosProcessoFG_PROP: TStringField
      FieldName = 'FG_PROP'
      Size = 1
    end
    object qDadosProcessoPRO_USUCAD: TStringField
      FieldName = 'PRO_USUCAD'
    end
    object qDadosProcessoPRO_NUMLAUDO: TStringField
      FieldName = 'PRO_NUMLAUDO'
    end
    object qDadosProcessoPRO_RASTREAR: TStringField
      FieldName = 'PRO_RASTREAR'
    end
    object qDadosProcessoPRO_CARREGACREDITO: TStringField
      FieldName = 'PRO_CARREGACREDITO'
      FixedChar = True
      Size = 1
    end
    object qDadosProcessoPRO_CREDITODNA: TStringField
      FieldName = 'PRO_CREDITODNA'
    end
    object qDadosProcessoPRO_HTREC: TStringField
      FieldName = 'PRO_HTREC'
      Size = 5
    end
    object qDadosProcessoPRO_RESUL_XLSX: TStringField
      FieldName = 'PRO_RESUL_XLSX'
      FixedChar = True
      Size = 12
    end
    object qDadosProcessoPRO_LACRE: TStringField
      FieldName = 'PRO_LACRE'
    end
    object qDadosProcessoPRO_TIPO_XLSX: TStringField
      FieldName = 'PRO_TIPO_XLSX'
      FixedChar = True
      Size = 25
    end
  end
  object qBuscaNumeroLaudo: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PROCESSO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_HISTORICO'
      'where PRO_COD = :PROCESSO'
      'and ITE_COD in (6,66)'
      'order by HIS_DATA')
    Left = 920
    Top = 384
    object qBuscaNumeroLaudoHIS_CONTR: TIntegerField
      FieldName = 'HIS_CONTR'
    end
    object qBuscaNumeroLaudoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qBuscaNumeroLaudoITE_COD: TIntegerField
      FieldName = 'ITE_COD'
    end
    object qBuscaNumeroLaudoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qBuscaNumeroLaudoHIS_DOC: TStringField
      FieldName = 'HIS_DOC'
      Size = 10
    end
    object qBuscaNumeroLaudoHIS_OBS: TStringField
      FieldName = 'HIS_OBS'
      Size = 50
    end
  end
  object qBuscaCidade: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PROCESSO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select j.JUI_SEXO, j.jui_desc as Juiz, v.var_desc as Vara, c.com' +
        '_desc as Comarca, u.uf_sigla as Estado'
      
        ', VAR_END Ende_Vara, VAR_BAIRRO Bairro_Vara, VAR_CID Cidade_Vara' +
        ', VAR_CEP CEP_Vara'
      
        'from tb_processo p left outer join tb_VARAS v on v.com_cod = p.c' +
        'om_cod and v.var_cod = p.com_cod and v.uf_sigla = p.uf_sigla'
      
        'left outer join tb_COMARCA c on (p.uf_sigla = c.uf_sigla) and (p' +
        '.com_cod = c.com_cod)'
      
        'left outer join tb_UF u      on (p.uf_sigla = u.uf_sigla) left o' +
        'uter join tb_JUIZ j on (p.jui_cod=j.jui_cod)'
      'where p.pro_cod = :PROCESSO')
    Left = 1040
    Top = 424
    object qBuscaCidadeJUIZ: TStringField
      FieldName = 'JUIZ'
      Size = 50
    end
    object qBuscaCidadeVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qBuscaCidadeCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qBuscaCidadeESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qBuscaCidadeENDE_VARA: TStringField
      FieldName = 'ENDE_VARA'
      Size = 80
    end
    object qBuscaCidadeBAIRRO_VARA: TStringField
      FieldName = 'BAIRRO_VARA'
      Size = 40
    end
    object qBuscaCidadeCIDADE_VARA: TStringField
      FieldName = 'CIDADE_VARA'
      Size = 40
    end
    object qBuscaCidadeCEP_VARA: TStringField
      FieldName = 'CEP_VARA'
      Size = 12
    end
    object qBuscaCidadeJUI_SEXO: TStringField
      FieldName = 'JUI_SEXO'
      FixedChar = True
      Size = 1
    end
  end
  object qBuscaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ESTADO'
        DataType = ftString
        Precision = 2
        Size = 2
        Value = ''
      end
      item
        Name = 'COMARCA'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'VARA'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select j.jui_desc as Juiz, v.var_desc as Vara, c.com_desc as Com' +
        'arca, u.uf_sigla as Estado'
      
        ', VAR_END Ende_Vara, VAR_BAIRRO Bairro_Vara, VAR_CID Cidade_Vara' +
        ', VAR_CEP CEP_Vara'
      
        'from tb_VARAS v join tb_COMARCA c on (v.uf_sigla = c.uf_sigla) a' +
        'nd (v.com_cod = c.com_cod)'
      
        '                join tb_UF u      on (v.uf_sigla = u.uf_sigla) l' +
        'eft outer join tb_JUIZ j on (v.jui_cod=j.jui_cod)'
      
        'where (v.uf_sigla = :ESTADO) and (v.com_cod = :COMARCA) and (v.v' +
        'ar_cod = :VARA)')
    Left = 224
    Top = 640
    object qBuscaDadosJUIZ: TStringField
      FieldName = 'JUIZ'
      Size = 50
    end
    object qBuscaDadosVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qBuscaDadosCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qBuscaDadosESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object qBuscaDadosENDE_VARA: TStringField
      FieldName = 'ENDE_VARA'
      Size = 80
    end
    object qBuscaDadosBAIRRO_VARA: TStringField
      FieldName = 'BAIRRO_VARA'
      Size = 40
    end
    object qBuscaDadosCIDADE_VARA: TStringField
      FieldName = 'CIDADE_VARA'
      Size = 40
    end
    object qBuscaDadosCEP_VARA: TStringField
      FieldName = 'CEP_VARA'
      Size = 12
    end
  end
  object qBuscaLaudo: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PROCESSO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_HISTORICO'
      'where PRO_COD = :PROCESSO'
      'order by HIS_DATA')
    Left = 256
    Top = 640
    object qBuscaLaudoHIS_CONTR: TIntegerField
      FieldName = 'HIS_CONTR'
    end
    object qBuscaLaudoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qBuscaLaudoITE_COD: TIntegerField
      FieldName = 'ITE_COD'
    end
    object qBuscaLaudoHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qBuscaLaudoHIS_DOC: TStringField
      FieldName = 'HIS_DOC'
      Size = 10
    end
    object qBuscaLaudoHIS_OBS: TStringField
      FieldName = 'HIS_OBS'
      Size = 50
    end
  end
  object qBuscaDadosPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PROCESSO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select  pe.*, pe.pes_nome, s.sit_nm, p.pro_dcole, p.pro_hcole fr' +
        'om tb_processo p, tb_pessoas pe, tb_situacao s'
      
        'where pe.pro_cod = p.pro_cod and pe.pes_sit = s.sit_cod and p.pr' +
        'o_cod =  :PROCESSO'
      '')
    Left = 288
    Top = 640
    object qBuscaDadosPessoasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qBuscaDadosPessoasPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qBuscaDadosPessoasPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qBuscaDadosPessoasPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qBuscaDadosPessoasPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
    end
    object qBuscaDadosPessoasPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qBuscaDadosPessoasPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qBuscaDadosPessoasPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qBuscaDadosPessoasPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qBuscaDadosPessoasPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 200
    end
    object qBuscaDadosPessoasPES_NOME_1: TStringField
      FieldName = 'PES_NOME_1'
      Size = 60
    end
    object qBuscaDadosPessoasSIT_NM: TStringField
      FieldName = 'SIT_NM'
    end
    object qBuscaDadosPessoasPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qBuscaDadosPessoasPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
  end
  object qBuscaDadosColetador: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_lcoleta'
      'where LCO_COD = :Codigo')
    Left = 320
    Top = 640
    object qBuscaDadosColetadorLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qBuscaDadosColetadorLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qBuscaDadosColetadorLCO_SEXO: TIntegerField
      FieldName = 'LCO_SEXO'
    end
    object qBuscaDadosColetadorLCO_CRM: TStringField
      FieldName = 'LCO_CRM'
      Size = 15
    end
    object qBuscaDadosColetadorLCO_LABT: TStringField
      FieldName = 'LCO_LABT'
      Size = 60
    end
    object qBuscaDadosColetadorLCO_FONE: TStringField
      FieldName = 'LCO_FONE'
      Size = 25
    end
    object qBuscaDadosColetadorLCO_END: TStringField
      FieldName = 'LCO_END'
      Size = 80
    end
    object qBuscaDadosColetadorLCO_CID: TStringField
      FieldName = 'LCO_CID'
      Size = 40
    end
    object qBuscaDadosColetadorUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qBuscaDadosColetadorLCO_TLIE: TIntegerField
      FieldName = 'LCO_TLIE'
    end
    object qBuscaDadosColetadorLCO_CATE: TIntegerField
      FieldName = 'LCO_CATE'
    end
    object qBuscaDadosColetadorLCO_TRAT: TIntegerField
      FieldName = 'LCO_TRAT'
    end
    object qBuscaDadosColetadorLCO_CEL: TStringField
      FieldName = 'LCO_CEL'
      Size = 15
    end
    object qBuscaDadosColetadorLCO_RES: TStringField
      FieldName = 'LCO_RES'
      Size = 15
    end
    object qBuscaDadosColetadorLCO_EMAIL: TStringField
      FieldName = 'LCO_EMAIL'
      Size = 50
    end
    object qBuscaDadosColetadorLCO_SITE: TStringField
      FieldName = 'LCO_SITE'
      Size = 50
    end
    object qBuscaDadosColetadorLCO_CEP: TStringField
      FieldName = 'LCO_CEP'
      Size = 12
    end
    object qBuscaDadosColetadorLCO_DTRE: TDateField
      FieldName = 'LCO_DTRE'
    end
    object qBuscaDadosColetadorLCO_DCAD: TDateField
      FieldName = 'LCO_DCAD'
    end
    object qBuscaDadosColetadorLCO_NUMCARTCORREIO: TIntegerField
      FieldName = 'LCO_NUMCARTCORREIO'
    end
  end
  object qResultado: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 1024
    Top = 520
  end
  object qQuantPartesProcesso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT DISTINCT p.PRO_COD, pa.PES_NOME, pa.PES_INICIAIS, s.SIT_N' +
        'M'
      'FROM TB_PROCESSO p JOIN tb_pessoas pa ON p.PRO_COD=pa.PRO_COD '
      'JOIN TB_SITUACAO s ON s.SIT_COD=pa.PES_SIT'
      'WHERE p.PRO_COD = :Codigo')
    Left = 656
    Top = 375
    object qQuantPartesProcessoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qQuantPartesProcessoPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qQuantPartesProcessoPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qQuantPartesProcessoSIT_NM: TStringField
      FieldName = 'SIT_NM'
    end
  end
  object qQuantPartesCSV: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Numero'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      ''
      
        'SELECT DISTINCT a.NM1_ALE, a.NM2_ALE from TB_ALELOS a           ' +
        '  '
      'where a.NM1_ALE = :Numero')
    Left = 656
    Top = 447
    object qQuantPartesCSVNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qQuantPartesCSVNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
  end
  object qControlaAuditoria: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 255
    Top = 104
  end
end
