object fLancaResultadosPaternidade: TfLancaResultadosPaternidade
  Left = 192
  Top = 226
  Width = 657
  Height = 414
  Caption = 'Lan'#231'amento de Resultados - Exames de Paternidade'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 5
    Width = 198
    Height = 16
    Caption = 'Informe o N'#250'mero da Per'#237'cia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 56
    Width = 37
    Height = 16
    Caption = 'Caso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 100
    Width = 62
    Height = 16
    Caption = 'Pessoas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbLancar: TSpeedButton
    Left = 414
    Top = 336
    Width = 113
    Height = 48
    Caption = 'Lan'#231'ar Resultado'
    Enabled = False
    Flat = True
    OnClick = sbLancarClick
  end
  object sbFechar: TSpeedButton
    Left = 528
    Top = 335
    Width = 113
    Height = 49
    Caption = 'Fechar'
    Flat = True
    OnClick = sbFecharClick
  end
  object EdtNumeroPericia: TEdit
    Left = 5
    Top = 24
    Width = 193
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pResultado: TPanel
    Left = 4
    Top = 216
    Width = 637
    Height = 113
    Enabled = False
    TabOrder = 1
    object Label12: TLabel
      Left = 11
      Top = 12
      Width = 94
      Height = 13
      Caption = 'Inclus'#227'o / Exclus'#227'o'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 27
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        'Inclus'#227'o'
        'Exclus'#227'o')
    end
    object CheckBox1: TCheckBox
      Left = 232
      Top = 28
      Width = 97
      Height = 17
      Caption = 'Muta'#231#227'o'
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 6
    Top = 118
    Width = 635
    Height = 79
    DataSource = DS_Pessoas
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PES_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_DTNAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_LCNAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_SEXO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_TDOC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PES_NDOC'
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 6
    Top = 72
    Width = 600
    Height = 21
    DataField = 'CAS_DESC'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 3
  end
  object bConsultar: TBitBtn
    Left = 200
    Top = 25
    Width = 28
    Height = 23
    TabOrder = 4
    OnClick = bConsultarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333333333C3333333333333337F3333333333333C0C3333
      333333333777F33333333333C0F0C3333333333377377F333333333C0FFF0C33
      3333333777F377F3333333CCC0FFF0C333333373377F377F33333CCCCC0FFF0C
      333337333377F377F3334CCCCCC0FFF0C3337F3333377F377F33C4CCCCCC0FFF
      0C3377F333F377F377F33C4CC0CCC0FFF0C3377F3733F77F377333C4CCC0CC0F
      0C333377F337F3777733333C4C00CCC0333333377F773337F3333333C4CCCCCC
      3333333377F333F7333333333C4CCCC333333333377F37733333333333C4C333
      3333333333777333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object qPessoas: TADOQuery
    Connection = DM.p_SGEL
    CursorType = ctStatic
    DataSource = DS_ConsultaExamesPaternidade
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_PESSOAS'
      'where PRO_COD = :PRO_COD'
      'order by PES_COD')
    Left = 576
    Top = 8
    object qPessoasPRO_UNID: TStringField
      FieldName = 'PRO_UNID'
      Size = 3
    end
    object qPessoasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qPessoasPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qPessoasPES_NOME: TStringField
      DisplayLabel = 'Nome da Pessoa'
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qPessoasPES_SIT: TIntegerField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'PES_SIT'
    end
    object qPessoasPES_DTNAS: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'PES_DTNAS'
    end
    object qPessoasPES_LCNAS: TStringField
      DisplayLabel = 'Local Nascimento'
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qPessoasPES_SEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qPessoasPES_TDOC: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qPessoasPES_NDOC: TStringField
      DisplayLabel = 'N'#250'mero do Documento'
      FieldName = 'PES_NDOC'
      Size = 100
    end
  end
  object DS_Pessoas: TDataSource
    DataSet = qPessoas
    Left = 608
    Top = 8
  end
  object qConsultaExamesPaternidade: TADOQuery
    Active = True
    Connection = DM.p_SGEL
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pericia'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_processo, tb_casos'
      
        'where tb_processo.cas_codigo=tb_casos.cas_codigo and PRO_NPERC =' +
        ' :Pericia')
    Left = 488
    Top = 8
    object qConsultaExamesPaternidadePRO_UNID: TStringField
      FieldName = 'PRO_UNID'
      Size = 3
    end
    object qConsultaExamesPaternidadePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaExamesPaternidadePRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qConsultaExamesPaternidadePRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qConsultaExamesPaternidadePRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qConsultaExamesPaternidadeUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qConsultaExamesPaternidadeCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qConsultaExamesPaternidadeCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qConsultaExamesPaternidadeVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qConsultaExamesPaternidadePRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qConsultaExamesPaternidadePRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qConsultaExamesPaternidadePRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qConsultaExamesPaternidadePRO_PAGAM: TStringField
      FieldName = 'PRO_PAGAM'
      Size = 50
    end
    object qConsultaExamesPaternidadeJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qConsultaExamesPaternidadeLAB_COD: TSmallintField
      FieldName = 'LAB_COD'
    end
    object qConsultaExamesPaternidadePRO_EXA: TIntegerField
      FieldName = 'PRO_EXA'
    end
    object qConsultaExamesPaternidadeSBC_CODIGO: TIntegerField
      FieldName = 'SBC_CODIGO'
    end
    object qConsultaExamesPaternidadePRO_FOLHA: TStringField
      FieldName = 'PRO_FOLHA'
      Size = 8
    end
    object qConsultaExamesPaternidadePRO_MUT: TStringField
      FieldName = 'PRO_MUT'
      Size = 3
    end
    object qConsultaExamesPaternidadePRO_PARC: TIntegerField
      FieldName = 'PRO_PARC'
    end
    object qConsultaExamesPaternidadeCAS_CONTR: TIntegerField
      FieldName = 'CAS_CONTR'
    end
    object qConsultaExamesPaternidadeCAS_CODIGO_1: TStringField
      FieldName = 'CAS_CODIGO_1'
      Size = 6
    end
    object qConsultaExamesPaternidadeCAS_DESC: TStringField
      FieldName = 'CAS_DESC'
      Size = 60
    end
    object qConsultaExamesPaternidadeCAS_VLRIM: TBCDField
      FieldName = 'CAS_VLRIM'
      Precision = 18
      Size = 2
    end
    object qConsultaExamesPaternidadeCAS_SIG: TStringField
      FieldName = 'CAS_SIG'
      Size = 5
    end
    object qConsultaExamesPaternidadeCAS_CAM: TStringField
      FieldName = 'CAS_CAM'
      Size = 500
    end
    object qConsultaExamesPaternidadeCAS_VLRWB: TBCDField
      FieldName = 'CAS_VLRWB'
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = qConsultaExamesPaternidade
    Left = 312
    Top = 192
  end
  object DS_ConsultaExamesPaternidade: TDataSource
    DataSet = qConsultaExamesPaternidade
    Left = 520
    Top = 8
  end
end
