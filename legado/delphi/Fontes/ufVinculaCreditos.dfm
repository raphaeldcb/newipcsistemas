object fVinculaCreditos: TfVinculaCreditos
  Left = 175
  Top = 0
  Caption = 'Vincula'#231#227'o de Cr'#233'ditos'
  ClientHeight = 692
  ClientWidth = 976
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
  object Label4: TLabel
    Left = 10
    Top = 456
    Width = 3
    Height = 13
  end
  object sbFechar: TSpeedButton
    Left = 836
    Top = 644
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
    OnClick = sbFecharClick
  end
  object bbtConfirma: TSpeedButton
    Left = 707
    Top = 644
    Width = 129
    Height = 41
    Caption = '&Confirma Opera'#231#227'o'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
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
    OnClick = bbtConfirmaClick
  end
  object Label6: TLabel
    Left = 12
    Top = 678
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 966
    Height = 124
    Caption = #193'rea de Consulta'
    TabOrder = 0
    object Label3: TLabel
      Left = 135
      Top = 43
      Width = 15
      Height = 13
      Caption = 'at'#233
    end
    object Label5: TLabel
      Left = 8
      Top = 18
      Width = 127
      Height = 16
      Caption = 'Informe o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtConsultar: TSpeedButton
      Left = 8
      Top = 72
      Width = 129
      Height = 41
      Caption = '&Consultar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
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
      OnClick = bbtConsultarClick
    end
    object DateEditInicial: TJvDateEdit
      Left = 8
      Top = 40
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
    object DateEditFim: TJvDateEdit
      Left = 156
      Top = 40
      Width = 121
      Height = 21
      ShowNullDate = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 963
    Height = 489
    Caption = 'Dados'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 155
      Height = 16
      Caption = 'Dados dos Processos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 776
      Top = 16
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 38
      Width = 949
      Height = 443
      DataSource = DS_VisualizaDados
      PopupMenu = PopupMenu_Excluir
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CRED_QDCRE'
          Title.Caption = 'Cr'#233'dito'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_COD'
          Title.Caption = 'C'#243'd.'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_NPERC'
          ReadOnly = True
          Title.Caption = 'N'#250'mero da Per'#237'cia'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JUI_DESC'
          ReadOnly = True
          Title.Caption = 'Nome do Juiz'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_SIGLA'
          ReadOnly = True
          Title.Caption = 'UF'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMARCA'
          ReadOnly = True
          Title.Caption = 'Comarca'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VARA'
          ReadOnly = True
          Title.Caption = 'Vara'
          Visible = True
        end>
    end
  end
  object DS_BuscaDados: TDataSource
    DataSet = qBuscaDados
    Left = 311
    Top = 25
  end
  object qAtualizaCadastroProcessos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataAtual'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select * from tb_creditos c'
      'where c.cre_data = :DataAtual and c.cred_qdcre is not null')
    Left = 352
    Top = 16
    object qAtualizaCadastroProcessosID_CREDITO: TIntegerField
      FieldName = 'ID_CREDITO'
    end
    object qAtualizaCadastroProcessosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qAtualizaCadastroProcessosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qAtualizaCadastroProcessosCRE_DATA: TDateField
      FieldName = 'CRE_DATA'
    end
    object qAtualizaCadastroProcessosPRO_DTREC: TDateField
      FieldName = 'PRO_DTREC'
    end
    object qAtualizaCadastroProcessosCRED_QDCRE: TStringField
      FieldName = 'CRED_QDCRE'
      Size = 10
    end
  end
  object qExcluir_Temporaria: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      'delete from TB_CREDITOS_TEMPORARIO')
    Left = 712
    Top = 24
  end
  object qContaCreditos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select max(cast(c.cred_qdcre as integer)) UltimoUtilizado from t' +
        'b_creditos c')
    Left = 480
    Top = 16
    object qContaCreditosULTIMOUTILIZADO: TIntegerField
      FieldName = 'ULTIMOUTILIZADO'
    end
  end
  object qBuscaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicial'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFinal'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'Juiz'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select COUNT(p.pro_cod), p.pro_cod, p.pro_nperc, c.lco_nome, p.u' +
        'f_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_drec, p.pro_tipo, p' +
        '.pro_auto, v.var_desc AS VARA, cm.com_desc AS COMARCA, j.jui_cod' +
        ', j.jui_desc'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_juiz j'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo)'
      'and (p.jui_cod=j.jui_cod)'
      
        'and  (p.jui_cod = j.jui_cod) and (p.pro_drec between :DataInicia' +
        'l and :DataFinal) and (p.pro_carregacredito is null)'
      'and p.jui_cod = :Juiz and p.pro_carregacredito is null'
      
        'group by p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_' +
        'desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_desc, j.jui_cod' +
        ', j.jui_desc, p.pro_auto, p.pro_drec'
      '')
    Left = 312
    Top = 16
    object qBuscaDadosCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qBuscaDadosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qBuscaDadosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qBuscaDadosLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qBuscaDadosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qBuscaDadosDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qBuscaDadosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qBuscaDadosPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qBuscaDadosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qBuscaDadosVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qBuscaDadosCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qBuscaDadosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qBuscaDadosJUI_DESC: TStringField
      FieldName = 'JUI_DESC'
      Size = 50
    end
  end
  object qBuscaJuiz: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select j.jui_cod from tb_juiz j where j.jui_credito = '#39'S'#39)
    Left = 552
    Top = 16
    object qBuscaJuizJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
  end
  object DS_VisualizaDados: TDataSource
    DataSet = qVisualizaDados
    Left = 623
    Top = 17
  end
  object qVisualizaDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      
        'select COUNT(p.pro_cod), p.pro_cod, p.pro_nperc, c.lco_nome, p.u' +
        'f_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_drec, p.pro_tipo, p' +
        '.pro_auto, v.var_desc AS VARA, cm.com_desc AS COMARCA, j.jui_cod' +
        ', j.jui_desc, cre.cred_qdcre'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_juiz j, tb_creditos_temporario cre'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo)'
      'and (p.jui_cod=j.jui_cod)'
      'and  (p.jui_cod = j.jui_cod) and (cre.pro_cod=p.pro_cod)'
      'and cre.cre_data = :Data'
      
        'group by p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_' +
        'desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_desc, j.jui_cod' +
        ', j.jui_desc, p.pro_auto, p.pro_drec,  cre.cred_qdcre'
      'order by cre.cred_qdcre')
    Left = 624
    Top = 8
    object qVisualizaDadosCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qVisualizaDadosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qVisualizaDadosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qVisualizaDadosLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qVisualizaDadosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qVisualizaDadosDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qVisualizaDadosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qVisualizaDadosPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qVisualizaDadosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qVisualizaDadosVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qVisualizaDadosCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qVisualizaDadosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qVisualizaDadosJUI_DESC: TStringField
      FieldName = 'JUI_DESC'
      Size = 50
    end
    object qVisualizaDadosCRED_QDCRE: TStringField
      FieldName = 'CRED_QDCRE'
      Size = 10
    end
  end
  object PopupMenu_Excluir: TPopupMenu
    Left = 424
    Top = 272
    object RetiraProcesso1: TMenuItem
      Caption = 'Retira Processo'
      OnClick = RetiraProcesso1Click
    end
  end
  object qContaCreditos_Temporario: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      
        'select max(cast(c.cred_qdcre as integer)) UltimoUtilizado from T' +
        'B_CREDITOS_TEMPORARIO c')
    Left = 480
    Top = 56
    object qContaCreditos_TemporarioULTIMOUTILIZADO: TIntegerField
      FieldName = 'ULTIMOUTILIZADO'
    end
  end
  object qAtualizaProcessos: TADOQuery
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
      'update tb_processo p set p.pro_carregacredito = '#39'S'#39
      'where p.pro_cod = :Codigo')
    Left = 568
    Top = 72
  end
end
