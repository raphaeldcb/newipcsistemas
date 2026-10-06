object fConsultaEnderecos: TfConsultaEnderecos
  Left = 88
  Top = 88
  Width = 814
  Height = 534
  Caption = 'Consulta de Endere'#231'os'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 3
    Top = 79
    Width = 790
    Height = 362
    DataSource = DS_ConsultaJuiz
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'END_LOC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_TRATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_NMR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_END'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_BAI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_CID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'END_CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF_SIGLA'
        Visible = True
      end>
  end
  object BLimpar: TBitBtn
    Left = 584
    Top = 459
    Width = 100
    Height = 30
    Caption = '&Limpar'
    TabOrder = 1
    OnClick = BLimparClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
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
  end
  object BSair: TBitBtn
    Left = 684
    Top = 459
    Width = 100
    Height = 30
    Caption = '&Fechar'
    TabOrder = 2
    OnClick = BSairClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
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
  end
  object BDados: TBitBtn
    Left = 484
    Top = 459
    Width = 100
    Height = 30
    Caption = '&Dados'
    TabOrder = 0
    OnClick = BDadosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
      333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
      C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
      F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
      F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
      00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
      3333333373FF7333333333333000333333333333377733333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 3
    Top = 2
    Width = 789
    Height = 73
    Caption = 'Informe o Nome do Juiz'
    TabOrder = 4
    object Edit1: TEdit
      Left = 5
      Top = 24
      Width = 502
      Height = 24
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object bbtSelecionar: TBitBtn
    Left = 383
    Top = 459
    Width = 100
    Height = 30
    Caption = '&Selecionar'
    TabOrder = 5
    OnClick = bbtSelecionarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333333333333333333333333333FF333333333333
      3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
      E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
      E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
      E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
      000033333373FF77777733333330003333333333333777333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object DS_ConsultaJuiz: TDataSource
    DataSet = qConsultaEnderecos
    Left = 448
    Top = 163
  end
  object qConsultaEnderecos: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      'select * from tb_enderecos')
    Left = 478
    Top = 163
    object qConsultaEnderecosEND_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'END_COD'
    end
    object qConsultaEnderecosEND_LOC: TStringField
      DisplayLabel = 'Local (Destinat'#225'rios)'
      FieldName = 'END_LOC'
      Size = 60
    end
    object qConsultaEnderecosEND_NMR: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'END_NMR'
      Size = 80
    end
    object qConsultaEnderecosEND_END: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'END_END'
      Size = 120
    end
    object qConsultaEnderecosEND_BAI: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'END_BAI'
      Size = 30
    end
    object qConsultaEnderecosEND_CID: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CID'
      Size = 40
    end
    object qConsultaEnderecosEND_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'END_CEP'
      Size = 40
    end
    object qConsultaEnderecosUF_SIGLA: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qConsultaEnderecosEND_TRATA: TStringField
      DisplayLabel = 'Tratamento'
      FieldName = 'END_TRATA'
      Size = 30
    end
  end
end
