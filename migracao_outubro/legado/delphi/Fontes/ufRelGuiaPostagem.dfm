object fRelGuiaPostagem: TfRelGuiaPostagem
  Left = 326
  Top = 183
  Width = 329
  Height = 104
  Caption = 'Relat'#243'rio de Guia de Postagem'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 297
    Height = 49
    Caption = 'Selecione uma op'#231#227'o:'
    Columns = 2
    Items.Strings = (
      'Sedex'
      'Registrada')
    TabOrder = 0
    OnClick = RadioGroup1Click
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
      'select * from tb_pessoas p'
      'where p.pro_cod = :PROCESSO')
    Left = 168
    Top = 32
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
    object qBuscaDadosPessoasPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 60
    end
    object qBuscaDadosPessoasPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
  end
  object qBuscaDadosHistorico: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select h.his_doc from tb_historico h'
      'where h.pro_cod = :Codigo and h.ite_cod = 6')
    Left = 128
    Top = 33
    object qBuscaDadosHistoricoHIS_DOC: TStringField
      FieldName = 'HIS_DOC'
      Size = 10
    end
  end
  object waWord: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 212
    Top = 34
  end
  object wdDoc: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 244
    Top = 34
  end
  object qDadosRelatorio: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      'select * from tb_correspondencia c')
    Left = 80
    Top = 32
    object qDadosRelatorioEND_COD: TIntegerField
      FieldName = 'END_COD'
    end
    object qDadosRelatorioPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qDadosRelatorioOBS: TStringField
      FieldName = 'OBS'
    end
    object qDadosRelatorioTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object qDadosRelatorioREGCORREIO: TStringField
      FieldName = 'REGCORREIO'
      Size = 14
    end
  end
end
