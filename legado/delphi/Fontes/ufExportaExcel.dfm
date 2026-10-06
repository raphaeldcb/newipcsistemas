object fExportaExcel: TfExportaExcel
  Left = 305
  Top = 205
  Caption = 'Exporta'#231#245'es'
  ClientHeight = 342
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object sbExportar: TSpeedButton
    Left = 415
    Top = 291
    Width = 129
    Height = 41
    Caption = 'Exportar'
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
    OnClick = sbExportarClick
  end
  object sbFechar: TSpeedButton
    Left = 544
    Top = 291
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
  object lbOrigem: TLabel
    Left = 6
    Top = 235
    Width = 86
    Height = 13
    Caption = 'Informe o Destino:'
  end
  object Label2: TLabel
    Left = 7
    Top = 191
    Width = 87
    Height = 13
    Caption = 'Informe o per'#237'odo:'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 139
    Top = 211
    Width = 6
    Height = 13
    Caption = '&a'
    Enabled = False
  end
  object RadioGroup1: TRadioGroup
    Left = 6
    Top = 2
    Width = 667
    Height = 183
    Caption = 'Selecione o Relat'#243'rio para exportar:'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Comarcas'
      'Locais de Coletas'
      'Casos (pedido do Bruno)'
      'Comarcas x Ju'#237'zes'
      'Valores'
      'Valores - Resumido'
      'Quantidade (Estado / Cidade / Tipo)'
      'Fluxo Caixa - 1'
      'Fluxo Caixa - 2 (por Parc. no Financeiro)'
      'Controle Financeiro (Bruno) - Teste')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object DateEditInicial: TJvDateEdit
    Left = 6
    Top = 208
    Width = 121
    Height = 21
    Enabled = False
    ShowNullDate = False
    TabOrder = 1
  end
  object DateEditFinal: TJvDateEdit
    Left = 151
    Top = 208
    Width = 121
    Height = 21
    Enabled = False
    ShowNullDate = False
    TabOrder = 2
  end
  object edtDestino: TJvDirectoryEdit
    Left = 6
    Top = 251
    Width = 377
    Height = 21
    TabOrder = 3
    Text = 'U:\CPG\SCPG\Documentos_Gerados\'
  end
  object qExportaLocais: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_lcoleta l')
    Left = 152
    Top = 16
    object qExportaLocaisLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qExportaLocaisLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qExportaLocaisLCO_SEXO: TIntegerField
      FieldName = 'LCO_SEXO'
    end
    object qExportaLocaisLCO_CRM: TStringField
      FieldName = 'LCO_CRM'
      Size = 15
    end
    object qExportaLocaisLCO_LABT: TStringField
      FieldName = 'LCO_LABT'
      Size = 60
    end
    object qExportaLocaisLCO_FONE: TStringField
      FieldName = 'LCO_FONE'
      Size = 25
    end
    object qExportaLocaisLCO_END: TStringField
      FieldName = 'LCO_END'
      Size = 80
    end
    object qExportaLocaisLCO_CID: TStringField
      FieldName = 'LCO_CID'
      Size = 40
    end
    object qExportaLocaisUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qExportaLocaisLCO_TLIE: TIntegerField
      FieldName = 'LCO_TLIE'
    end
    object qExportaLocaisLCO_CATE: TIntegerField
      FieldName = 'LCO_CATE'
    end
    object qExportaLocaisLCO_TRAT: TIntegerField
      FieldName = 'LCO_TRAT'
    end
    object qExportaLocaisLCO_CEL: TStringField
      FieldName = 'LCO_CEL'
      Size = 15
    end
    object qExportaLocaisLCO_RES: TStringField
      FieldName = 'LCO_RES'
      Size = 15
    end
    object qExportaLocaisLCO_EMAIL: TStringField
      FieldName = 'LCO_EMAIL'
      Size = 50
    end
    object qExportaLocaisLCO_SITE: TStringField
      FieldName = 'LCO_SITE'
      Size = 50
    end
    object qExportaLocaisLCO_CEP: TStringField
      FieldName = 'LCO_CEP'
      Size = 12
    end
    object qExportaLocaisLCO_DTRE: TDateField
      FieldName = 'LCO_DTRE'
    end
    object qExportaLocaisLCO_DCAD: TDateField
      FieldName = 'LCO_DCAD'
    end
    object qExportaLocaisLCO_NUMCARTCORREIO: TIntegerField
      FieldName = 'LCO_NUMCARTCORREIO'
    end
    object qExportaLocaisLCO_SITUACAO: TStringField
      FieldName = 'LCO_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qExportaLocaisLCO_DNASC: TDateField
      FieldName = 'LCO_DNASC'
    end
    object qExportaLocaisLCO_CPFCNPJ: TStringField
      FieldName = 'LCO_CPFCNPJ'
    end
    object qExportaLocaisLCO_BANCO: TStringField
      FieldName = 'LCO_BANCO'
    end
    object qExportaLocaisLCO_AGENCIA: TStringField
      FieldName = 'LCO_AGENCIA'
    end
    object qExportaLocaisLCO_CONTA: TStringField
      FieldName = 'LCO_CONTA'
      Size = 30
    end
    object qExportaLocaisLCO_MINKIT: TIntegerField
      FieldName = 'LCO_MINKIT'
    end
  end
  object qExportaComarcas: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      
        'SELECT c.com_cod, c.com_desc, c.com_sigla, c.uf_sigla, e.uf_desc' +
        ' AS DESCRICAOESTADO'
      'FROM tb_COMARCA c JOIN tb_UF e ON c.uf_sigla = e.uf_sigla'
      'order by UF_SIGLA asc')
    Left = 192
    Top = 16
    object qExportaComarcasCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qExportaComarcasCOM_DESC: TStringField
      FieldName = 'COM_DESC'
      Size = 40
    end
    object qExportaComarcasCOM_SIGLA: TStringField
      FieldName = 'COM_SIGLA'
      Size = 2
    end
    object qExportaComarcasUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qExportaComarcasDESCRICAOESTADO: TStringField
      FieldName = 'DESCRICAOESTADO'
    end
  end
  object qExportaCasos: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      
        'select p.pro_cod, p.cas_codigo,p.pro_dcole, p.pro_resul from tb_' +
        'processo p'
      'where p.pro_dcole BETWEEN :DataIni and :DataFim')
    Left = 232
    Top = 16
    object qExportaCasosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qExportaCasosCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qExportaCasosPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qExportaCasosPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
  end
  object qExportaComarcasJuizes: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    SQL.Strings = (
      
        'select v.uf_sigla, e.uf_desc, c.com_cod, c.com_desc, v.var_cod, ' +
        'v.var_desc, v.var_sigla, v.jui_cod, j.jui_desc'
      
        'from tb_VARAS v JOIN tb_COMARCA c ON v.uf_sigla = c.uf_sigla and' +
        ' v.com_cod = c.com_cod'
      
        'JOIN tb_UF e ON c.uf_sigla = E.uf_sigla JOIN tb_juiz j ON v.jui_' +
        'cod=j.jui_cod')
    Left = 192
    Top = 56
    object qExportaComarcasJuizesUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qExportaComarcasJuizesUF_DESC: TStringField
      FieldName = 'UF_DESC'
    end
    object qExportaComarcasJuizesCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qExportaComarcasJuizesCOM_DESC: TStringField
      FieldName = 'COM_DESC'
      Size = 40
    end
    object qExportaComarcasJuizesVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qExportaComarcasJuizesVAR_DESC: TStringField
      FieldName = 'VAR_DESC'
      Size = 40
    end
    object qExportaComarcasJuizesVAR_SIGLA: TStringField
      FieldName = 'VAR_SIGLA'
      Size = 3
    end
    object qExportaComarcasJuizesJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qExportaComarcasJuizesJUI_DESC: TStringField
      FieldName = 'JUI_DESC'
      Size = 50
    end
  end
  object qExportaValores: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select'
      
        'SUBSTRING(p.pro_nperc FROM 1 FOR 4) Ano,  SUBSTRING(p.pro_nperc ' +
        'FROM 8 FOR 2) Cidade, SUBSTRING(p.pro_nperc FROM 10 FOR 2) Estad' +
        'o,'
      ''
      
        ' p.pro_cod, p.pro_nperc, p.lco_cod, upper(l.lco_nome) Nome, p.pr' +
        'o_drec, pa.par_vlr, pa.par_tppg, pa.par_data'
      'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where p.pro_dcole BETWEEN :DataIni and :DataFim')
    Left = 232
    Top = 56
    object qExportaValoresPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qExportaValoresLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qExportaValoresNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qExportaValoresPAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qExportaValoresPAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qExportaValoresPAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
    object qExportaValoresANO: TStringField
      FieldName = 'ANO'
      Size = 17
    end
    object qExportaValoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 17
    end
    object qExportaValoresESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 17
    end
    object qExportaValoresPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qExportaValoresPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
  end
  object qExportaValoresResumido: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      ''
      'select'
      'p.pro_cod,'
      
        'case when ((char_length(p.pro_nperc)=17) and (SUBSTRING(p.pro_np' +
        'erc FROM 11 FOR 2) = '#39'AM'#39')) then SUBSTRING(p.pro_nperc FROM 9 FO' +
        'R 2) else SUBSTRING(p.pro_nperc FROM 8 FOR 2) end Cidade,'
      
        'case when (char_length(p.pro_nperc)=16) then SUBSTRING(p.pro_npe' +
        'rc FROM 10 FOR 2) else SUBSTRING(p.pro_nperc FROM 11 FOR 2) end ' +
        'Estado,'
      'case p.pro_tipo'
      ' when 1 then '#39'JD'#39
      ' when 2 then '#39'EX'#39
      ' when 3 then '#39'MP'#39
      ' when 4 then '#39'DP'#39
      ' when 5 then '#39'PO'#39
      ' when 6 then '#39'JC'#39
      ' when 7 then '#39'CT'#39
      ' when 8 then '#39'PJ'#39
      ' when 9 then '#39'PR'#39
      ' when 10 then '#39'NPF'#39
      'end Tipo,'
      'pa.par_vlr,'
      'pa.par_tppg,'
      'pa.par_data,'
      ' p.PRO_DREC'
      'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where  p.PRO_DREC BETWEEN :DataIni and :DataFim')
    Left = 272
    Top = 56
    object qExportaValoresResumidoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qExportaValoresResumidoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 17
    end
    object qExportaValoresResumidoESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 17
    end
    object qExportaValoresResumidoPAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qExportaValoresResumidoPAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qExportaValoresResumidoPAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
    object qExportaValoresResumidoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object qExportaValoresResumidoPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
  end
  object qQuantExamesCidade: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      ''
      'select'
      
        'case when ((char_length(p.pro_nperc)=17) and (SUBSTRING(p.pro_np' +
        'erc FROM 11 FOR 2) = '#39'AM'#39')) then SUBSTRING(p.pro_nperc FROM 9 FO' +
        'R 2) else SUBSTRING(p.pro_nperc FROM 8 FOR 2) end Cidade,'
      
        'case when (char_length(p.pro_nperc)=16) then SUBSTRING(p.pro_npe' +
        'rc FROM 10 FOR 2) else SUBSTRING(p.pro_nperc FROM 11 FOR 2) end ' +
        'Estado,'
      'case p.pro_tipo'
      ' when 1 then '#39'JD'#39
      ' when 2 then '#39'EX'#39
      ' when 3 then '#39'MP'#39
      ' when 4 then '#39'DP'#39
      ' when 5 then '#39'PO'#39
      ' when 6 then '#39'JC'#39
      ' when 7 then '#39'CT'#39
      ' when 8 then '#39'PJ'#39
      ' when 9 then '#39'PR'#39
      ' when 10 then '#39'NPF'#39
      'end Tipo,'
      
        'case when (EXTRACT( MONTH FROM p.PRO_DREC )>0 and  EXTRACT( MONT' +
        'H FROM p.PRO_DREC )< 10) then '#39'0'#39' || EXTRACT( MONTH FROM p.PRO_D' +
        'REC ) else EXTRACT( MONTH FROM p.PRO_DREC ) end  || '#39'/'#39' || EXTRA' +
        'CT( year FROM p.PRO_DREC ) ANO_MES,'
      'count(p.pro_cod) Quantidade'
      'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where  p.PRO_DREC BETWEEN :DataIni and :DataFim'
      'group by'
      
        'case when ((char_length(p.pro_nperc)=17) and (SUBSTRING(p.pro_np' +
        'erc FROM 11 FOR 2) = '#39'AM'#39')) then SUBSTRING(p.pro_nperc FROM 9 FO' +
        'R 2) else SUBSTRING(p.pro_nperc FROM 8 FOR 2) end,'
      
        'case when (char_length(p.pro_nperc)=16) then SUBSTRING(p.pro_npe' +
        'rc FROM 10 FOR 2) else SUBSTRING(p.pro_nperc FROM 11 FOR 2) end,'
      'p.pro_tipo,'
      'p.PRO_DREC')
    Left = 312
    Top = 56
    object qQuantExamesCidadeCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 17
    end
    object qQuantExamesCidadeESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 17
    end
    object qQuantExamesCidadeTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object qQuantExamesCidadeANO_MES: TStringField
      FieldName = 'ANO_MES'
      Size = 14
    end
    object qQuantExamesCidadeQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object qExportaFluxo2: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'SELECT'
      'p.pro_tipo,'
      'case pa.par_tppg '
      'WHEN '#39'DINHEIRO'#39' THEN '#39'DINHEIRO'#39' '
      'WHEN '#39'CHEQUE ('#192' VISTA)'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'CHEQUE COM PARCELAMENTO, SENDO 1 '#192' VISTA'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'CHEQUE PR'#201'-DATADO'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'VISA-CR'#201'DITO'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'VISA-D'#201'BITO'#39' THEN '#39'D'#201'BITO'#39
      'WHEN '#39'MASTERCARD-CR'#201'DITO'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'MASTERCARD-D'#201'BITO'#39' THEN '#39'D'#201'BITO'#39
      'WHEN '#39'BOLETO (CR'#201'DITO INTERNO)'#39' THEN '#39'BOLETO'#39
      'WHEN '#39'FINANCEIRA (CR'#201'DITO EXTERNO)'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'HONOR'#193'RIOS EM JU'#205'ZO (NO MS)'#39' THEN '#39'HONOR'#193'RIOS'#39
      'WHEN '#39'HONOR'#193'RIOS EM JU'#205'ZO (FORA MS)'#39' THEN '#39'HONOR'#193'RIOS'#39
      'WHEN '#39'GRATUITO'#39' THEN '#39'GRATUITO'#39
      'WHEN '#39'CALOTE'#39' THEN '#39'CALOTE'#39
      'WHEN '#39'PENDENTE'#39' THEN '#39'PENDENTE'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (CEF)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (BB)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'DINHEIRO - LEVANTAMENTO DE ALVAR'#193#39' THEN '#39'DINHEIRO'#39
      'WHEN '#39'ERRO'#39' THEN '#39'ERRO'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (BRADESCO)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'GRATUITO - CR'#201'DITOS'#39' THEN '#39'GRATUITO'#39
      'WHEN '#39'PIX (INTER)'#39' THEN '#39'PIX (INTER)'#39
      'WHEN '#39'PAGAMENTO PELO ESTADO'#39' THEN '#39'HONOR'#193'RIOS'#39
      'END as par_tppg_new,'
      'p.pro_cod,'
      'pa.PAR_NMFOR,'
      'pa.PAR_DATA,'
      'p.PRO_DREC, pa.par_tppg, sum(pa.par_vlr) AS par_vlr'
      'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where p.PRO_DREC BETWEEN :DataIni and :DataFim'
      
        'GROUP BY p.pro_tipo,pa.PAR_DATA, pa.par_tppg, p.pro_cod,pa.PAR_N' +
        'MFOR,p.PRO_DREC')
    Left = 294
    Top = 182
    object qExportaFluxo2PRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qExportaFluxo2PAR_TPPG_NEW: TStringField
      FieldName = 'PAR_TPPG_NEW'
      FixedChar = True
      Size = 11
    end
    object qExportaFluxo2PRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qExportaFluxo2PAR_NMFOR: TStringField
      FieldName = 'PAR_NMFOR'
      Size = 100
    end
    object qExportaFluxo2PRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qExportaFluxo2PAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qExportaFluxo2PAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      Precision = 18
      Size = 2
    end
    object qExportaFluxo2PAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
  end
  object qExportaFluxo1: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'SELECT'
      'p.pro_tipo,'
      'case pa.par_tppg '
      'WHEN '#39'DINHEIRO'#39' THEN '#39'DINHEIRO'#39' '
      'WHEN '#39'CHEQUE ('#192' VISTA)'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'CHEQUE COM PARCELAMENTO, SENDO 1 '#192' VISTA'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'CHEQUE PR'#201'-DATADO'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'VISA-CR'#201'DITO'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'VISA-D'#201'BITO'#39' THEN '#39'D'#201'BITO'#39
      'WHEN '#39'MASTERCARD-CR'#201'DITO'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'MASTERCARD-D'#201'BITO'#39' THEN '#39'D'#201'BITO'#39
      'WHEN '#39'BOLETO (CR'#201'DITO INTERNO)'#39' THEN '#39'BOLETO'#39
      'WHEN '#39'FINANCEIRA (CR'#201'DITO EXTERNO)'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'HONOR'#193'RIOS EM JU'#205'ZO (NO MS)'#39' THEN '#39'HONOR'#193'RIOS'#39
      'WHEN '#39'HONOR'#193'RIOS EM JU'#205'ZO (FORA MS)'#39' THEN '#39'HONOR'#193'RIOS'#39
      'WHEN '#39'GRATUITO'#39' THEN '#39'GRATUITO'#39
      'WHEN '#39'CALOTE'#39' THEN '#39'CALOTE'#39
      'WHEN '#39'PENDENTE'#39' THEN '#39'PENDENTE'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (CEF)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (BB)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'DINHEIRO - LEVANTAMENTO DE ALVAR'#193#39' THEN '#39'DINHEIRO'#39
      'WHEN '#39'ERRO'#39' THEN '#39'ERRO'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (BRADESCO)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'GRATUITO - CR'#201'DITOS'#39' THEN '#39'GRATUITO'#39
      'WHEN '#39'PIX (INTER)'#39' THEN '#39'PIX (INTER)'#39
      'WHEN '#39'PAGAMENTO PELO ESTADO'#39' THEN '#39'HONOR'#193'RIOS'#39
      'END as par_tppg_new,'
      'p.pro_cod,'
      'pa.PAR_NMFOR,'
      'p.PRO_DREC, pa.par_tppg, sum(pa.par_vlr) AS par_vlr'
      'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      'where p.PRO_DREC BETWEEN :DataIni and :DataFim'
      
        'GROUP BY p.PRO_DREC, pa.par_tppg, p.PRO_COD,p.pro_tipo,pa.PAR_NM' +
        'FOR'
      'ORDER BY p.PRO_COD ')
    Left = 414
    Top = 182
    object qExportaFluxo1PRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qExportaFluxo1PAR_TPPG_NEW: TStringField
      FieldName = 'PAR_TPPG_NEW'
      FixedChar = True
      Size = 11
    end
    object qExportaFluxo1PRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qExportaFluxo1PAR_NMFOR: TStringField
      FieldName = 'PAR_NMFOR'
      Size = 100
    end
    object qExportaFluxo1PRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qExportaFluxo1PAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qExportaFluxo1PAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      Precision = 18
      Size = 2
    end
  end
  object qExportaControleFinanceiro: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataIni'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DataFim'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'SELECT'
      #39'DNA'#39' SETOR,'
      'P.PRO_COD DOCUMENTO,'
      'CASE WHEN (p.pro_tipo = 2) THEN '#39'EX'#39' ELSE '#39'JD'#39' END ORIGEM,'
      'c.COM_SIGLA CIDADE,'
      'U.UF_SIGLA ESTADO,'#9
      'P.PRO_DREC DATA_CADASTRO,'
      'case pa.par_tppg '
      'WHEN '#39'DINHEIRO'#39' THEN '#39'DINHEIRO'#39' '
      'WHEN '#39'CHEQUE ('#192' VISTA)'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'CHEQUE COM PARCELAMENTO, SENDO 1 '#192' VISTA'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'CHEQUE PR'#201'-DATADO'#39' THEN '#39'CHEQUE'#39
      'WHEN '#39'VISA-CR'#201'DITO'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'VISA-D'#201'BITO'#39' THEN '#39'D'#201'BITO'#39
      'WHEN '#39'MASTERCARD-CR'#201'DITO'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'MASTERCARD-D'#201'BITO'#39' THEN '#39'D'#201'BITO'#39
      'WHEN '#39'BOLETO (CR'#201'DITO INTERNO)'#39' THEN '#39'BOLETO'#39
      'WHEN '#39'FINANCEIRA (CR'#201'DITO EXTERNO)'#39' THEN '#39'CR'#201'DITO'#39
      'WHEN '#39'HONOR'#193'RIOS EM JU'#205'ZO (NO MS)'#39' THEN '#39'HONOR'#193'RIOS'#39
      'WHEN '#39'HONOR'#193'RIOS EM JU'#205'ZO (FORA MS)'#39' THEN '#39'HONOR'#193'RIOS'#39
      'WHEN '#39'GRATUITO'#39' THEN '#39'GRATUITO'#39
      'WHEN '#39'CALOTE'#39' THEN '#39'CALOTE'#39
      'WHEN '#39'PENDENTE'#39' THEN '#39'PENDENTE'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (CEF)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (BB)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'DINHEIRO - LEVANTAMENTO DE ALVAR'#193#39' THEN '#39'DINHEIRO'#39
      'WHEN '#39'ERRO'#39' THEN '#39'ERRO'#39
      'WHEN '#39'DEP'#211'S. NA CONTA DO IPCMS (BRADESCO)'#39' THEN '#39'DEP'#211'SITO'#39
      'WHEN '#39'GRATUITO - CR'#201'DITOS'#39' THEN '#39'GRATUITO'#39
      'WHEN '#39'PIX (INTER)'#39' THEN '#39'PIX (INTER)'#39
      'WHEN '#39'PAGAMENTO PELO ESTADO'#39' THEN '#39'HONOR'#193'RIOS'#39
      'END as FORMA_PAG,'
      
        '(SELECT sum(j.PAR_VLR) FROM tb_parcelas j where p.pro_cod = j.pr' +
        'o_cod) VALOR_TOTAL,'
      
        '(SELECT count(*) FROM tb_parcelas x where p.pro_cod = x.pro_cod)' +
        ' PARCELAS,'
      'pa.PAR_DATA DATA_DEP,'
      'pa.par_vlr VALOR_DEP,'
      'pa.PAR_OBS OBSERVACAO'
      'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      
        '        LEFT OUTER JOIN tb_comarca c ON c.COM_COD=p.COM_COD AND ' +
        'c.UF_SIGLA=p.UF_SIGLA'
      '        LEFT OUTER JOIN tb_uf u ON u.UF_SIGLA=p.UF_SIGLA'
      'where p.PRO_DREC BETWEEN :DataIni and :DataFim'
      '')
    Left = 526
    Top = 214
    object qExportaControleFinanceiroSETOR: TStringField
      FieldName = 'SETOR'
      FixedChar = True
      Size = 3
    end
    object qExportaControleFinanceiroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object qExportaControleFinanceiroORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 2
    end
    object qExportaControleFinanceiroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 2
    end
    object qExportaControleFinanceiroESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qExportaControleFinanceiroDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
    end
    object qExportaControleFinanceiroFORMA_PAG: TStringField
      FieldName = 'FORMA_PAG'
      FixedChar = True
      Size = 11
    end
    object qExportaControleFinanceiroVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qExportaControleFinanceiroPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object qExportaControleFinanceiroDATA_DEP: TDateField
      FieldName = 'DATA_DEP'
    end
    object qExportaControleFinanceiroVALOR_DEP: TBCDField
      FieldName = 'VALOR_DEP'
      Precision = 18
      Size = 2
    end
    object qExportaControleFinanceiroOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 80
    end
  end
end
