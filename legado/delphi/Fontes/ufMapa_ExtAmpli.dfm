object fMapa_ExtAmpli: TfMapa_ExtAmpli
  Left = 203
  Top = 158
  Caption = 'Gerador do Mapa de Extra'#231#227'o / Amplifica'#231#227'o'
  ClientHeight = 332
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object sbFechar: TSpeedButton
    Left = 448
    Top = 285
    Width = 113
    Height = 41
    Caption = 'Fechar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
      BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
      BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
      BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
      BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
      EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
      EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
      EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
      EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbFecharClick
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 5
    Width = 555
    Height = 132
    Caption = 
      'Informe o intervalo de C'#243'digo do SCPG para gerar o Lotes e emiti' +
      'r o MAPA DE EXTRA'#199#195'O'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 28
      Width = 17
      Height = 13
      Caption = 'De'
    end
    object Label10: TLabel
      Left = 149
      Top = 28
      Width = 8
      Height = 13
      Caption = #224
    end
    object sbMapaExtracao: TSpeedButton
      Left = 380
      Top = 60
      Width = 165
      Height = 43
      Caption = 'Mapa de Extra'#231#227'o'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF999903333
        333333377777FFF33333FF9FFFF9993333333F7F3FF7773FF333009F00F03399
        3333777F7737FF773F33FF9FFFF9933393333F73FFF7733373F300F999903333
        393377377777F33337F3FFFFFFF0333339333FF33337F333373300FFFFF03333
        93337733FFF7F3337333FFF00000333333333F377777FF33FF330FF0FF999339
        93337337F3777FF77F33FFF0F993993993333337F77377F77F33FFF003339939
        93333337733F77377FFFFFF03399933999933FF733777337777F000339933339
        93997773377F3FF77F7733333993993993993333377F77377F77333333999339
        9993333333777337777333333333333333333333333333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbMapaExtracaoClick
    end
    object sbCriaLotes: TSpeedButton
      Left = 177
      Top = 60
      Width = 201
      Height = 43
      Caption = 'Criar os Lotes'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbCriaLotesClick
    end
    object EdtCdIni: TEdit
      Left = 23
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdtCdFim: TEdit
      Left = 162
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 6
    Top = 144
    Width = 555
    Height = 131
    Caption = 'Informe o intervalo de Lotes para gerar o MAPA DE AMPLIFICA'#199#195'O'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 5
      Top = 36
      Width = 17
      Height = 13
      Caption = 'De'
    end
    object Label4: TLabel
      Left = 150
      Top = 36
      Width = 8
      Height = 13
      Caption = #224
    end
    object sbMapaExcel: TSpeedButton
      Left = 348
      Top = 71
      Width = 201
      Height = 45
      Caption = 'Mapa de Amplifica'#231#227'o'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      ParentFont = False
      OnClick = sbMapaExcelClick
    end
    object EdtLtIni: TEdit
      Left = 24
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdtLtFim: TEdit
      Left = 162
      Top = 28
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object CKB_Segunda: TCheckBox
      Left = 440
      Top = 16
      Width = 105
      Height = 17
      Caption = 'Segunda An'#225'lise'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      
        'select * from tb_pessoas p join tb_situacao s ON p.pes_sit=s.sit' +
        '_cod'
      'where p.pro_cod = :PROCESSO'
      'order by s.sit_ordem')
    Left = 528
    Top = 8
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
    object qBuscaDadosPessoasPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qBuscaDadosPessoasSIT_COD: TIntegerField
      FieldName = 'SIT_COD'
    end
    object qBuscaDadosPessoasSIT_NM: TStringField
      FieldName = 'SIT_NM'
      Size = 10
    end
    object qBuscaDadosPessoasSIT_SIGLA: TStringField
      FieldName = 'SIT_SIGLA'
      Size = 5
    end
    object qBuscaDadosPessoasSIT_ORDEM: TIntegerField
      FieldName = 'SIT_ORDEM'
    end
  end
  object waWord: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 460
    Top = 7
  end
  object wdDoc: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 492
    Top = 7
  end
  object qMaxOrdem: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Lote'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select max(mea.mpea_ord) AS NumeroOrdem from tb_mapa_extampli me' +
        'a'
      'where mea.mpea_lote = :Lote')
    Left = 528
    Top = 40
    object qMaxOrdemNUMEROORDEM: TIntegerField
      FieldName = 'NUMEROORDEM'
    end
  end
  object qMaxLote: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(mea.mpea_lote) AS MaiorLote from tb_mapa_extampli mea')
    Left = 528
    Top = 72
    object qMaxLoteMAIORLOTE: TIntegerField
      FieldName = 'MAIORLOTE'
    end
  end
  object qMaxLotes: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Lote1'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'Lote2'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) as Qtde from tb_mapa_extampli mea'
      'where mea.mpea_lote >= :Lote1 and mea.mpea_lote <= :Lote2')
    Left = 528
    Top = 104
    object qMaxLotesQTDE: TIntegerField
      FieldName = 'QTDE'
    end
  end
end
