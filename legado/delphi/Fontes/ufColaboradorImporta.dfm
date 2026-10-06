object fColaboradorPonto: TfColaboradorPonto
  Left = 651
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Importa'#231#227'o arquivo Ponto'
  ClientHeight = 326
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object sbProcessamento: TSpeedButton
    Left = 191
    Top = 272
    Width = 129
    Height = 41
    Caption = '&Realizar leitura'
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
  object sbFechar: TSpeedButton
    Left = 320
    Top = 272
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
  object gbxImport: TGroupBox
    Left = 5
    Top = 9
    Width = 441
    Height = 69
    Caption = 'Informe o caminho do arquivo TXT'
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
      Left = 383
      Top = 34
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnOrigemClick
    end
    object edtOrigem: TEdit
      Left = 8
      Top = 35
      Width = 369
      Height = 22
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 83
    Width = 441
    Height = 177
    DataSource = DS_InsereDados
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RGP_SEQ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RGP_PIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RGP_DTREG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RGP_HRREG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RGP_DTIMP'
        Visible = True
      end>
  end
  object opndlgOrigem: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos Texto (*.txt)|*.txt'
    InitialDir = 'U:\ControlePonto'
    Left = 168
    Top = 55
  end
  object qInsereDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_REGISTROS_PONTO P')
    Left = 232
    Top = 47
    object qInsereDadosRGP_SEQ: TIntegerField
      FieldName = 'RGP_SEQ'
    end
    object qInsereDadosRGP_PIS: TStringField
      FieldName = 'RGP_PIS'
      Size = 11
    end
    object qInsereDadosRGP_DTREG: TDateField
      FieldName = 'RGP_DTREG'
    end
    object qInsereDadosRGP_HRREG: TTimeField
      FieldName = 'RGP_HRREG'
    end
    object qInsereDadosRGP_DTIMP: TDateField
      FieldName = 'RGP_DTIMP'
    end
  end
  object DS_InsereDados: TDataSource
    DataSet = qInsereDados
    Left = 232
    Top = 79
  end
  object qTipoPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * FROM TB_COLABORADOR')
    Left = 280
    Top = 47
    object qTipoPessoasCLB_COD: TIntegerField
      FieldName = 'CLB_COD'
    end
    object qTipoPessoasCLB_PIS: TStringField
      FieldName = 'CLB_PIS'
      Size = 11
    end
    object qTipoPessoasCLB_NOME: TStringField
      FieldName = 'CLB_NOME'
      Size = 200
    end
  end
  object qSelecionaSituacaoPessoa: TADOQuery
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
    Left = 520
    Top = 184
    object qSelecionaSituacaoPessoaNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
  end
  object DS_SelecionaSituacaoPessoa: TDataSource
    DataSet = qSelecionaSituacaoPessoa
    Left = 552
    Top = 184
  end
  object qSelecionaPessoa: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pessoa'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = Null
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
      'select * from TB_ALELOS al'
      'where (al.NM2_ALE = :Pessoa) and (al.NM1_ALE = :Numero)'
      'order by ord_ale')
    Left = 576
    Top = 248
    object qSelecionaPessoaCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qSelecionaPessoaNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qSelecionaPessoaNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qSelecionaPessoaNM3_ALE: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qSelecionaPessoaNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qSelecionaPessoaMAR_ALE: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qSelecionaPessoaAL1_ALE: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qSelecionaPessoaAL2_ALE: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qSelecionaPessoaORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qContador: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CodigoCaso'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select *  from vi_alelosencontrados ae'
      'where ae.codigo <> :CodigoCaso'
      'order by ae.contador')
    Left = 632
    Top = 248
    object qContadorCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
    end
    object qContadorCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object ds_Contador: TDataSource
    DataSet = qContador
    Left = 632
    Top = 280
  end
  object qLimpaContadorAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 696
    Top = 248
  end
  object sp_BuscaAlelos: TADOStoredProc
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    CommandTimeout = 300
    ProcedureName = 'BU_ALELOS'
    Parameters = <
      item
        Name = 'VALORMARCADOR1'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end
      item
        Name = 'VALORMARCADOR2'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = ''
      end
      item
        Name = 'MARCADOR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 30
        Value = ''
      end>
    Left = 552
    Top = 320
    object sp_BuscaAlelosMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 30
    end
  end
  object qBuscaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_REGISTROS_PONTO P'
      'order by RGP_SEQ')
    Left = 96
    Top = 279
    object qBuscaDadosRGP_SEQ: TIntegerField
      FieldName = 'RGP_SEQ'
    end
    object qBuscaDadosRGP_PIS: TStringField
      FieldName = 'RGP_PIS'
      Size = 11
    end
    object qBuscaDadosRGP_DTREG: TDateField
      FieldName = 'RGP_DTREG'
    end
    object qBuscaDadosRGP_HRREG: TTimeField
      FieldName = 'RGP_HRREG'
    end
    object qBuscaDadosRGP_DTIMP: TDateField
      FieldName = 'RGP_DTIMP'
    end
  end
end
