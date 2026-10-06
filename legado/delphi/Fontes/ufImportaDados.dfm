object fImportaDados: TfImportaDados
  Left = 100
  Top = 196
  Width = 880
  Height = 180
  Caption = 'Importa'#231#227'o dos Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sbFechar: TSpeedButton
    Left = 704
    Top = 96
    Width = 150
    Height = 40
    Caption = 'Fechar'
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
  object BitBtn1: TBitBtn
    Left = 544
    Top = 96
    Width = 150
    Height = 40
    Caption = 'Importa Dados'
    TabOrder = 0
    OnClick = BitBtn1Click
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
  end
  object gbxImport: TGroupBox
    Left = 0
    Top = 5
    Width = 857
    Height = 76
    Caption = 'Selecione o arquivo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lbOrigem: TLabel
      Left = 8
      Top = 21
      Width = 37
      Height = 14
      Caption = 'Origem:'
    end
    object btnOrigem: TSpeedButton
      Left = 823
      Top = 34
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnOrigemClick
    end
    object edtOrigem: TEdit
      Left = 8
      Top = 35
      Width = 809
      Height = 22
      TabOrder = 0
    end
  end
  object qDados: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_dados')
    Left = 48
    Top = 96
    object qDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object qDadosDATA: TDateField
      FieldName = 'DATA'
    end
    object qDadosVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 6
    end
    object qDadosCARGO: TStringField
      FieldName = 'CARGO'
      Size = 50
    end
  end
  object qIndices: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_indices')
    Left = 88
    Top = 96
    object qIndicesNOME: TStringField
      FieldName = 'NOME'
    end
    object qIndicesDATA: TDateField
      FieldName = 'DATA'
    end
    object qIndicesINDICE: TBCDField
      FieldName = 'INDICE'
      Precision = 18
      Size = 6
    end
  end
  object qDados2: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_dados_2')
    Left = 128
    Top = 96
    object qDados2NOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object qDados2DATA: TDateField
      FieldName = 'DATA'
    end
    object qDados2VALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 6
    end
    object qDados2CARGO: TStringField
      FieldName = 'CARGO'
      Size = 50
    end
  end
  object opndlgOrigem: TOpenDialog
    DefaultExt = '*.xls'
    Filter = 
      'Arquivos Excel (*.xls)|*.xls|Arquivos Texto (*.txt)|*.txt|Arquiv' +
      'os CSV (*.csv)|*.csv'
    InitialDir = 'C:\ProjetoAbono'
    Left = 664
    Top = 16
  end
end
