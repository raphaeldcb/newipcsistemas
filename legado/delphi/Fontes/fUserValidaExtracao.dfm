object fValidaExtracao: TfValidaExtracao
  Left = 317
  Top = 234
  Caption = 'Confirma'#231#227'o Usu'#225'rio Extra'#231#227'o'
  ClientHeight = 137
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 105
    Top = 31
    Width = 45
    Height = 14
    Caption = 'Usu'#225'rio:'
    FocusControl = Edit2
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 107
    Top = 61
    Width = 37
    Height = 14
    Caption = 'Senha:'
    FocusControl = Edit3
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 2
    Top = 0
    Width = 435
    Height = 1
  end
  object Shape2: TShape
    Left = 51
    Top = 0
    Width = 1
    Height = 136
  end
  object Edit2: TEdit
    Left = 157
    Top = 28
    Width = 154
    Height = 23
    Hint = 'Usu'#225'rio necess'#225'rio para acessar o sistema'
    CharCase = ecUpperCase
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Edit3: TEdit
    Left = 157
    Top = 58
    Width = 154
    Height = 23
    Hint = 'Senha necess'#225'ria para acessar o sistema'
    CharCase = ecUpperCase
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Arial Black'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
  end
  object BOk: TBitBtn
    Left = 182
    Top = 98
    Width = 93
    Height = 30
    Caption = 'OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 2
    OnClick = BOkClick
  end
  object BSair: TBitBtn
    Left = 279
    Top = 98
    Width = 93
    Height = 30
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
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
    ParentFont = False
    TabOrder = 3
    OnClick = BSairClick
  end
  object qExcluiAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 280
    Top = 16
  end
  object qControlaAuditoria: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 311
    Top = 16
  end
end
