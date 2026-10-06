object fConsultaGeralInf: TfConsultaGeralInf
  Left = 440
  Top = 200
  Width = 718
  Height = 408
  Caption = 'Consulta de Exames de Infecciosas'
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
  object Label1: TLabel
    Left = 7
    Top = 5
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 113
    Top = 5
    Width = 88
    Height = 13
    Caption = 'Nome do Paciente'
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 47
    Width = 696
    Height = 266
    DataSource = DMI.dsConsultaProcedimentos
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'EXA_COD'
        Title.Caption = 'Exame'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Title.Caption = 'Paciente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_PROT'
        Title.Caption = 'Protocolo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRO_DCAD'
        Title.Caption = 'Dt. Cadastro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAB_LABT'
        Title.Caption = 'Laborat'#243'rio'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 112
    Top = 20
    Width = 585
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
  object Edit2: TEdit
    Left = 4
    Top = 20
    Width = 101
    Height = 24
    AutoSize = False
    TabOrder = 1
    OnChange = Edit2Change
  end
  object BSair: TBitBtn
    Left = 593
    Top = 328
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
  object BCadastro: TBitBtn
    Left = 491
    Top = 328
    Width = 100
    Height = 30
    Caption = '&Cadastro'
    TabOrder = 4
    OnClick = DBGrid1DblClick
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
  object qIncluiProtocolo: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 248
    Top = 112
  end
end
