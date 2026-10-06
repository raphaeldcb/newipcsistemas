object fCreditoHabilitacao: TfCreditoHabilitacao
  Left = 451
  Top = 139
  Caption = 'Habilitar Ju'#237'zes para Cr'#233'ditos'
  ClientHeight = 547
  ClientWidth = 764
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtFechar: TSpeedButton
    Left = 625
    Top = 503
    Width = 129
    Height = 41
    Caption = '&Fechar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
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
    OnClick = bbtFecharClick
  end
  object DBGrid: TDBGrid
    Left = 3
    Top = 3
    Width = 751
    Height = 494
    Color = clBtnFace
    DataSource = DM.DS_Juiz
    DrawingStyle = gdsClassic
    GradientEndColor = clBtnFace
    GradientStartColor = clBtnFace
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'JUI_CREDITO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUI_COD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'JUI_DESC'
        Visible = True
      end>
  end
end
