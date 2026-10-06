object fAlelos: TfAlelos
  Left = 410
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gera'#231#227'o das Planilhas do Laborat'#243'rio'
  ClientHeight = 470
  ClientWidth = 455
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
    Left = 191
    Top = 416
    Width = 129
    Height = 41
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
    OnClick = sbProcessamentoClick
  end
  object sbFechar: TSpeedButton
    Left = 320
    Top = 416
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
    Top = 41
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
    Left = 8
    Top = 235
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
        FieldName = 'COD_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM1_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM2_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM3_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM4_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAR_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL1_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL2_ALE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORD_ALE'
        Visible = True
      end>
  end
  object RG_TipoCasaIdentifiler: TRadioGroup
    Left = 6
    Top = 111
    Width = 441
    Height = 122
    Caption = 'Tipo de Caso'
    Items.Strings = (
      'Caso Tipo 1 (PD0101)'
      'Caso Tipo 2 (PD0201)'
      'Caso Tipo 3 (PD0301)'
      'Importa'#231#227'o')
    TabOrder = 2
  end
  object RG_Tipo: TRadioGroup
    Left = 7
    Top = 3
    Width = 440
    Height = 35
    Caption = 'Tipo do Arquivo'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Identifiler'
      'Fusion')
    ParentFont = False
    TabOrder = 3
    OnClick = RG_TipoClick
  end
  object CheckBox2: TCheckBox
    Left = 333
    Top = 143
    Width = 112
    Height = 17
    Caption = 'Manaus Center'
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 333
    Top = 121
    Width = 97
    Height = 17
    Caption = 'Dr. Rui'
    TabOrder = 5
  end
  object RG_TipoCasaFusion: TRadioGroup
    Left = 6
    Top = 111
    Width = 441
    Height = 122
    Caption = 'Tipo de Caso'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Items.Strings = (
      'Caso Tipo 1 (PD0101)'
      'Caso Tipo 2 (PD0201)'
      'Caso Tipo 3 (RD0301)')
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object CB_BH: TCheckBox
    Left = 328
    Top = 123
    Width = 112
    Height = 17
    Caption = 'BH'
    TabOrder = 7
  end
  object opndlgOrigem: TOpenDialog
    DefaultExt = '*.csv'
    Filter = 
      'Arquivos CSV (*.csv)|*.csv|Arquivos Texto (*.txt)|*.txt|Arquivos' +
      ' Excel (*.xls)|*.xls'
    InitialDir = 'U:\Laboratorio\Casos_Analisados'
    Left = 168
    Top = 55
  end
  object qInsereDados: TADOQuery
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
    DataSet = qInsereDados
    Left = 232
    Top = 79
  end
  object qVerificaDados: TADOQuery
    Parameters = <>
    Left = 272
    Top = 47
  end
  object qGeraDados: TADOQuery
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
    Parameters = <>
    Left = 696
    Top = 248
  end
  object sp_BuscaAlelos: TADOStoredProc
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
  object qGuardaAlelos: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    Left = 360
    Top = 135
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
end
