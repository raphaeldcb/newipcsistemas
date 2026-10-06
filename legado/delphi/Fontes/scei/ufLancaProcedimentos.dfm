object fLancaProcedimentos: TfLancaProcedimentos
  Left = 219
  Top = 150
  Width = 686
  Height = 450
  Caption = 'Lan'#231'amento de Resultados - Exames de Infecciosas'
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
    Width = 119
    Height = 16
    Caption = 'Informe o C'#243'digo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 52
    Width = 47
    Height = 16
    Caption = 'Dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbFechar: TSpeedButton
    Left = 528
    Top = 359
    Width = 113
    Height = 49
    Caption = 'Fechar'
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
    OnClick = sbFecharClick
  end
  object sbLancar: TSpeedButton
    Left = 414
    Top = 360
    Width = 113
    Height = 48
    Caption = 'Lan'#231'ar Resultado'
    Enabled = False
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
    OnClick = sbLancarClick
  end
  object EdtCodigo: TEdit
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
  object DBGrid1: TDBGrid
    Left = 6
    Top = 70
    Width = 635
    Height = 79
    DataSource = DS_ConsultaProcedimentos
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'EXA_DESC'
        Visible = True
      end>
  end
  object bConsultar: TBitBtn
    Left = 200
    Top = 25
    Width = 28
    Height = 23
    TabOrder = 2
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
  object gbResultado: TGroupBox
    Left = 6
    Top = 162
    Width = 635
    Height = 191
    Caption = 'Resultados'
    Color = clBtnFace
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object pn_Primeiro: TPanel
      Left = 10
      Top = 18
      Width = 600
      Height = 150
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 5
        Width = 48
        Height = 13
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBComboBox1: TDBComboBox
        Left = 7
        Top = 21
        Width = 222
        Height = 21
        DataField = 'PRO_RESUL'
        DataSource = DS_ConsultaProcedimentos
        ItemHeight = 13
        Items.Strings = (
          'N'#195'O DETECTADO'
          'DETECTADO')
        TabOrder = 0
      end
    end
    object pn_Segundo: TPanel
      Left = 10
      Top = 18
      Width = 600
      Height = 150
      BevelOuter = bvLowered
      TabOrder = 1
      object Label4: TLabel
        Left = 7
        Top = 5
        Width = 48
        Height = 13
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 7
        Top = 45
        Width = 150
        Height = 13
        Caption = 'Valor (N.'#186' de C'#243'pias por Mililitro)'
        FocusControl = DBEdit1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 7
        Top = 85
        Width = 75
        Height = 13
        Caption = 'Log (Resultado)'
        FocusControl = DBEdit2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBComboBox2: TDBComboBox
        Left = 7
        Top = 21
        Width = 222
        Height = 21
        DataField = 'PRO_RESUL'
        DataSource = DS_ConsultaProcedimentos
        ItemHeight = 13
        Items.Strings = (
          'N'#195'O DETECTADO'
          'DETECTADO')
        TabOrder = 0
      end
      object DBEdit1: TDBEdit
        Left = 7
        Top = 61
        Width = 251
        Height = 21
        DataField = 'PRO_CMLI'
        DataSource = DS_ConsultaProcedimentos
        TabOrder = 1
        OnExit = DBEditMILTExit
      end
      object DBEdit2: TDBEdit
        Left = 7
        Top = 101
        Width = 251
        Height = 21
        DataField = 'PRO_VLOG'
        DataSource = DS_ConsultaProcedimentos
        TabOrder = 2
      end
    end
    object pn_Quarto: TPanel
      Left = 10
      Top = 17
      Width = 600
      Height = 150
      BevelOuter = bvLowered
      TabOrder = 2
      object LBGENO: TLabel
        Left = 9
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Gen'#243'tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBComboBoxGenotipo: TDBComboBox
        Left = 6
        Top = 24
        Width = 475
        Height = 21
        DataField = 'PRO_GENO'
        DataSource = DS_ConsultaProcedimentos
        ItemHeight = 13
        Items.Strings = (
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 1'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 1a'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 1b'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 2'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 3'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 4'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 5'
          'Padr'#227'o Compat'#237'vel com GEN'#211'TIPO 6')
        TabOrder = 0
      end
    end
    object pn_Terceiro: TPanel
      Left = 10
      Top = 17
      Width = 600
      Height = 150
      BevelOuter = bvLowered
      TabOrder = 3
      object Label7: TLabel
        Left = 6
        Top = 5
        Width = 48
        Height = 13
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 47
        Width = 214
        Height = 13
        Caption = 'Valor (Unidade Internacionais (UI) por Mililitro)'
        FocusControl = DBEdit3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 6
        Top = 89
        Width = 75
        Height = 13
        Caption = 'Log (Resultado)'
        FocusControl = DBEdit4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBComboBox3: TDBComboBox
        Left = 6
        Top = 21
        Width = 222
        Height = 21
        DataField = 'PRO_RESUL'
        DataSource = DS_ConsultaProcedimentos
        ItemHeight = 13
        Items.Strings = (
          'N'#195'O DETECTADO'
          'DETECTADO')
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 6
        Top = 63
        Width = 251
        Height = 21
        DataField = 'PRO_UINT'
        DataSource = DS_ConsultaProcedimentos
        TabOrder = 1
        OnExit = DBEditUNIExit
      end
      object DBEdit4: TDBEdit
        Left = 6
        Top = 105
        Width = 251
        Height = 21
        DataField = 'PRO_VLOG'
        DataSource = DS_ConsultaProcedimentos
        TabOrder = 2
      end
    end
  end
  object qConsultaProcedimentos: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_procedimentos p, tb_exames e, tb_pacientes pe'
      
        'where p.exa_cod = e.exa_cod and p.pes_cod = pe.pes_cod and p.pro' +
        '_cod = :Codigo')
    Left = 488
    Top = 8
    object qConsultaProcedimentosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaProcedimentosPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qConsultaProcedimentosPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qConsultaProcedimentosLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qConsultaProcedimentosMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qConsultaProcedimentosEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qConsultaProcedimentosPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qConsultaProcedimentosPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qConsultaProcedimentosPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qConsultaProcedimentosPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qConsultaProcedimentosPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qConsultaProcedimentosPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qConsultaProcedimentosPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qConsultaProcedimentosPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qConsultaProcedimentosPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qConsultaProcedimentosPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qConsultaProcedimentosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qConsultaProcedimentosEXA_COD_1: TStringField
      FieldName = 'EXA_COD_1'
      Size = 10
    end
    object qConsultaProcedimentosEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qConsultaProcedimentosEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qConsultaProcedimentosEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qConsultaProcedimentosEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qConsultaProcedimentosEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qConsultaProcedimentosEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qConsultaProcedimentosEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qConsultaProcedimentosPES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qConsultaProcedimentosPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qConsultaProcedimentosPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qConsultaProcedimentosPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qConsultaProcedimentosPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qConsultaProcedimentosPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qConsultaProcedimentosPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qConsultaProcedimentosPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qConsultaProcedimentosPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qConsultaProcedimentosPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
  end
  object DS_ConsultaProcedimentos: TDataSource
    DataSet = qConsultaProcedimentos
    Left = 520
    Top = 8
  end
end
