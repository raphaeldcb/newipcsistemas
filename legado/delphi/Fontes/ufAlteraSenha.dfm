object fAlteraSenha: TfAlteraSenha
  Left = 425
  Top = 217
  BorderStyle = bsNone
  Caption = 'Altera'#231#227'o de Senha'
  ClientHeight = 169
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 39
    Height = 13
    Caption = 'Usu'#225'rio:'
  end
  object L_Usuario: TLabel
    Left = 52
    Top = 5
    Width = 6
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 63
    Height = 13
    Caption = 'Nova Senha:'
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 107
    Height = 13
    Caption = 'Confirma Nova Senha:'
  end
  object bbtAlterar: TBitBtn
    Left = 143
    Top = 128
    Width = 93
    Height = 30
    Caption = 'Alterar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = bbtAlterarClick
  end
  object bbFechar: TBitBtn
    Left = 236
    Top = 128
    Width = 93
    Height = 30
    Caption = 'Fechar'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00377777777788
      F8F878F7777777777333333F00004444400777FFF444447777777777F333FF7F
      000033334D5008FFF4333377777777773337777F0000333345D50FFFF4333333
      337F777F3337F33F000033334D5D0FFFF43333333377877F3337F33F00003333
      45D50FEFE4333333337F787F3337F33F000033334D5D0FFFF43333333377877F
      3337F33F0000333345D50FEFE4333333337F787F3337F33F000033334D5D0FFF
      F43333333377877F3337F33F0000333345D50FEFE4333333337F787F3337F33F
      000033334D5D0EFEF43333333377877F3337F33F0000333345D50FEFE4333333
      337F787F3337F33F000033334D5D0EFEF43333333377877F3337F33F00003333
      4444444444333333337F7F7FFFF7F33F00003333333333333333333333777777
      7777333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333777777F3333F00003333330000003333333333337FFFF7F3333F
      0000}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = bbFecharClick
  end
  object EdtSenha: TEdit
    Left = 8
    Top = 56
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = EdtSenhaKeyPress
  end
  object EdtConfirmaSenha: TEdit
    Left = 8
    Top = 96
    Width = 193
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = EdtSenhaKeyPress
  end
  object qControlaAuditoria: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 271
    Top = 16
  end
  object TcpClient: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    Port = 0
    ReadTimeout = -1
    Left = 239
    Top = 19
  end
  object qAlteraSenha: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 271
    Top = 48
  end
end
