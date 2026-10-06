object fAlelosTipos: TfAlelosTipos
  Left = 231
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gera'#231#227'o das Planilhas do Laborat'#243'rio - por Tipos'
  ClientHeight = 463
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 13
  object sbProcessamento: TSpeedButton
    Left = 6
    Top = 74
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
  end
  object sbFechar: TSpeedButton
    Left = 670
    Top = 410
    Width = 129
    Height = 34
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
  object L_Tipo: TLabel
    Left = 8
    Top = 117
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
  object sbPlanilha: TSpeedButton
    Left = 541
    Top = 410
    Width = 129
    Height = 34
    Caption = 'Planilha'
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
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
      0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
      F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
      005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
      0555557575757575755555505050505055555557575757575555}
    NumGlyphs = 2
    ParentFont = False
    OnClick = sbPlanilhaClick
  end
  object gbxImport: TGroupBox
    Left = 5
    Top = 3
    Width = 441
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
    Left = 5
    Top = 151
    Width = 798
    Height = 242
    DataSource = DS_InsereDados
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_INICIAIS'
        Title.Caption = 'Iniciais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAR_ALE'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL1_ALE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL2_ALE'
        Width = 80
        Visible = True
      end>
  end
  object opndlgOrigem: TOpenDialog
    DefaultExt = '*.csv'
    Filter = 
      'Arquivos CSV (*.csv)|*.csv|Arquivos Texto (*.txt)|*.txt|Arquivos' +
      ' Excel (*.xls)|*.xls'
    InitialDir = 'U:\Laboratorio\Casos_Analisados'
    Left = 232
    Top = 31
  end
  object qInsereDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_ALELOS'
      'where COD_ALE = 1')
    Left = 232
    Top = 47
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
    Left = 232
    Top = 79
  end
  object qVerificaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 272
    Top = 47
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
      end>
    SQL.Strings = (
      'select * from TB_ALELOS'
      'where (NM2_ALE = :Pessoa) and (NM1_ALE = :Numero)'
      'order by ord_ale')
    Left = 320
    Top = 47
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
    Left = 272
    Top = 79
    object qVerificaDadosCodigoNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
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
    Left = 128
    Top = 415
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
    Left = 352
    Top = 87
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
    Left = 48
    Top = 415
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
    Left = 88
    Top = 415
    object qTipoPessoasNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
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
    Left = 812
    Top = 184
    object qSelecionaSituacaoPessoaNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
  end
  object DS_SelecionaSituacaoPessoa: TDataSource
    DataSet = qSelecionaSituacaoPessoa
    Left = 844
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
    Left = 868
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
    Left = 924
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
    Left = 924
    Top = 280
  end
  object qLimpaContadorAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 988
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
    Left = 844
    Top = 320
    object sp_BuscaAlelosMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 30
    end
  end
  object qGuardaAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 408
    Top = 87
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
    Left = 496
    Top = 15
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
    Left = 536
    Top = 15
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
    Left = 568
    Top = 15
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
    Left = 600
    Top = 15
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
    Left = 464
    Top = 87
  end
end
