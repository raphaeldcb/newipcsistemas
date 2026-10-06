object DMR: TDMR
  Height = 579
  Width = 1048
  object dsGeraValorColetarores: TDataSource
    DataSet = qGeraValorColetaroresSemPessoas
    Left = 200
    Top = 16
  end
  object DSConsulta_Coletadores: TDataSource
    DataSet = qConsultaColetadores
    Left = 200
    Top = 208
  end
  object qConsultaColetadores: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_COLETADOR_REL'
      'order by ORDEM')
    Left = 48
    Top = 208
    object qConsultaColetadoresCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qConsultaColetadoresORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object qConsultaColetadoresNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
  end
  object qGeraValorColetaroresSemPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select COUNT(p.pro_cod), p.pro_tipo, p.pro_cod, p.pro_nperc, c.l' +
        'co_nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_auto, v' +
        '.var_desc AS VARA, cm.com_desc AS COMARCA, h.his_data AS DATAITE' +
        'M, i.ite_desc AS DESCRICAOITEM, h.his_doc AS DOCUMENTOITEM, h.hi' +
        's_obs AS OBSERVACAOITEM'
      'from tb_PROCESSO p JOIN tb_LCOLETA c ON (p.lco_cod = c.lco_cod)'
      
        '                left outer JOIN tb_VARAS v  ON (p.uf_sigla = v.u' +
        'f_sigla) and (p.com_cod = v.com_cod) and (p.var_cod = v.var_cod)'
      
        '                left outer JOIN tb_COMARCA cm ON (p.uf_sigla = c' +
        'm.uf_sigla) and (p.com_cod = cm.com_cod)'
      
        '                JOIN tb_CASOS pr ON (p.cas_codigo = pr.cas_codig' +
        'o)'
      '                JOIN tb_HISTORICO h ON (p.pro_cod = h.pro_cod)'
      '                JOIN tb_ITEM i   ON (h.ite_cod = i.ite_cod)'
      ''
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      
        'group by p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_' +
        'desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_desc, h.his_dat' +
        'a, i.ite_desc, h.his_doc, h.his_obs'
      '')
    Left = 56
    Top = 16
    object qGeraValorColetaroresSemPessoasCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qGeraValorColetaroresSemPessoasPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qGeraValorColetaroresSemPessoasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qGeraValorColetaroresSemPessoasPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qGeraValorColetaroresSemPessoasLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qGeraValorColetaroresSemPessoasUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qGeraValorColetaroresSemPessoasDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qGeraValorColetaroresSemPessoasPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qGeraValorColetaroresSemPessoasVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qGeraValorColetaroresSemPessoasCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qGeraValorColetaroresSemPessoasDATAITEM: TDateField
      FieldName = 'DATAITEM'
    end
    object qGeraValorColetaroresSemPessoasDESCRICAOITEM: TStringField
      FieldName = 'DESCRICAOITEM'
      Size = 60
    end
    object qGeraValorColetaroresSemPessoasDOCUMENTOITEM: TStringField
      FieldName = 'DOCUMENTOITEM'
      Size = 10
    end
    object qGeraValorColetaroresSemPessoasOBSERVACAOITEM: TStringField
      FieldName = 'OBSERVACAOITEM'
      Size = 50
    end
  end
  object qGeraValorColetaroresEXTRA: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo = 2)'
      '')
    Left = 360
    Top = 80
    object qGeraValorColetaroresEXTRACOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qGeraValorColetaroresJUDI: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo in (1,3,4,5,6,7,8))'
      '')
    Left = 360
    Top = 16
    object qGeraValorColetaroresJUDICOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qRelConsultaSemPessoas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_de' +
        'sc AS DESCRICAOCASO, p.pro_tipo, p.pro_auto, v.var_desc AS VARA,' +
        ' cm.com_desc AS COMARCA, h.his_data AS DATAITEM, i.ite_desc AS D' +
        'ESCRICAOITEM, h.his_doc AS DOCUMENTOITEM, h.his_obs AS OBSERVACA' +
        'OITEM'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_HISTORICO h, tb_ITEM i'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_cod = pr.cas_codigo) and (p.p' +
        'ro_cod = h.pro_cod) and (h.ite_cod = i.ite_cod) and (p.pro_drec ' +
        '>= :DTINI) and (p.pro_drec <= :DTFIN) and (p.lco_cod = :LOC) and' +
        ' (p.pro_sit = 1)'
      '')
    Left = 520
    Top = 144
    object qRelConsultaSemPessoasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelConsultaSemPessoasPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qRelConsultaSemPessoasLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qRelConsultaSemPessoasUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qRelConsultaSemPessoasDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qRelConsultaSemPessoasPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qRelConsultaSemPessoasPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qRelConsultaSemPessoasVARA: TStringField
      FieldName = 'VARA'
      Size = 40
    end
    object qRelConsultaSemPessoasCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qRelConsultaSemPessoasDATAITEM: TDateField
      FieldName = 'DATAITEM'
    end
    object qRelConsultaSemPessoasDESCRICAOITEM: TStringField
      FieldName = 'DESCRICAOITEM'
      Size = 60
    end
    object qRelConsultaSemPessoasDOCUMENTOITEM: TStringField
      FieldName = 'DOCUMENTOITEM'
      Size = 10
    end
    object qRelConsultaSemPessoasOBSERVACAOITEM: TStringField
      FieldName = 'OBSERVACAOITEM'
      Size = 50
    end
  end
  object qRelFinanceiro: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select pa.par_tppg, p.pro_cod, SUM(pa.par_vlr) as Valor_Total '
      
        'from tb_parcelas pa JOIN tb_processo p on pa.pro_cod = p.pro_cod' +
        ' and pa.par_sit = 1'
      'group by pa.par_tppg, p.pro_cod')
    Left = 120
    Top = 336
    object qRelFinanceiroPAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qRelFinanceiroVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qRelFinanceiroPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
  end
  object qRelLaudosHojeSemPessoa: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTRESULTADOINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTRESULTADOFIM'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select * from tb_PROCESSO p'
      
        'where (p.pro_dresu >= :DTRESULTADOINI) AND (p.pro_dresu <= :DTRE' +
        'SULTADOFIM)'
      'AND p.pro_resul = 4'
      'AND p.pro_sit = 1')
    Left = 386
    Top = 140
    object qRelLaudosHojeSemPessoaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelLaudosHojeSemPessoaPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qRelLaudosHojeSemPessoaPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qRelLaudosHojeSemPessoaPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qRelLaudosHojeSemPessoaPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qRelLaudosHojeSemPessoaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qRelLaudosHojeSemPessoaCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qRelLaudosHojeSemPessoaVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qRelLaudosHojeSemPessoaLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qRelLaudosHojeSemPessoaPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
    object qRelLaudosHojeSemPessoaPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qRelLaudosHojeSemPessoaPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      Size = 5
    end
    object qRelLaudosHojeSemPessoaPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelLaudosHojeSemPessoaPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qRelLaudosHojeSemPessoaPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qRelLaudosHojeSemPessoaPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qRelLaudosHojeSemPessoaPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qRelLaudosHojeSemPessoaPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qRelLaudosHojeSemPessoaPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qRelLaudosHojeSemPessoaCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 10
    end
    object qRelLaudosHojeSemPessoaJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
  end
  object qBuscaDadosPessoasProcesso: TADOQuery
    Connection = DM.ADOC_SCPG
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
    Left = 344
    Top = 248
    object qBuscaDadosPessoasProcessoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qBuscaDadosPessoasProcessoPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qBuscaDadosPessoasProcessoPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qBuscaDadosPessoasProcessoPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
    end
    object qBuscaDadosPessoasProcessoPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qBuscaDadosPessoasProcessoPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qBuscaDadosPessoasProcessoPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qBuscaDadosPessoasProcessoPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 10
    end
    object qBuscaDadosPessoasProcessoPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 15
    end
  end
  object qRelQuantidade: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      
        'select l.lco_nome as COLETADOR, count(*) as Quantidade from tb_P' +
        'ROCESSO p JOIN tb_lcoleta l on p.lco_cod=l.lco_cod'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.p' +
        'ro_sit = 1)'
      'and (p.pro_tipo in (1,2,3,4,5,6,7))'
      'group by l.lco_nome'
      'order by l.lco_nome')
    Left = 216
    Top = 336
    object qRelQuantidadeCOLETADOR: TStringField
      FieldName = 'COLETADOR'
      Size = 60
    end
    object qRelQuantidadeQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object qRelFinanceiroSum: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select SUM(pa.par_vlr) as Valor_Total_Geral'
      
        'from tb_parcelas pa JOIN tb_processo p on pa.pro_cod = p.pro_cod' +
        ' and pa.par_sit = 1')
    Left = 24
    Top = 336
    object qRelFinanceiroSumVALOR_TOTAL_GERAL: TBCDField
      FieldName = 'VALOR_TOTAL_GERAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qSelecionaCasosMapas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Lote'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_mapa_extampli mea'
      'where mea.mpea_lote = :Lote'
      'order by mea.mpea_ord')
    Left = 48
    Top = 272
    object qSelecionaCasosMapasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qSelecionaCasosMapasMPEA_DATA: TDateField
      FieldName = 'MPEA_DATA'
    end
    object qSelecionaCasosMapasMPEA_LOTE: TIntegerField
      FieldName = 'MPEA_LOTE'
    end
    object qSelecionaCasosMapasMPEA_ORD: TIntegerField
      FieldName = 'MPEA_ORD'
    end
    object qSelecionaCasosMapasPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qSelecionaCasosMapasSIT_SIGLA: TStringField
      FieldName = 'SIT_SIGLA'
      Size = 5
    end
  end
  object qRelLaudosEmitidos: TADOQuery
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
      
        'select distinct p.pro_nperc, h.his_data,  h.his_doc, h.his_obs f' +
        'rom tb_processo p JOIN tb_pessoas pe ON p.pro_cod=pe.pro_cod JOI' +
        'N tb_historico h ON p.pro_cod=h.pro_cod'
      
        'where h.ite_cod = 6 and h.his_data >= :DataIni and h.his_data <=' +
        ' :DataFim'
      'order by h.his_data')
    Left = 976
    Top = 352
    object qRelLaudosEmitidosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qRelLaudosEmitidosHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qRelLaudosEmitidosHIS_DOC: TStringField
      FieldName = 'HIS_DOC'
      Size = 10
    end
    object qRelLaudosEmitidosHIS_OBS: TStringField
      FieldName = 'HIS_OBS'
      Size = 50
    end
  end
  object qConsultaLotes: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Lote'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select distinct mp.pro_cod from tb_mapa_extampli mp'
      'where mp.mpea_lote = :Lote and mp.pro_cod <> 99999')
    Left = 56
    Top = 80
    object qConsultaLotesPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
  end
  object DS_ConsultaLotes: TDataSource
    DataSet = qConsultaLotes
    Left = 192
    Top = 80
  end
  object qRelCorrespondencia: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Usuario'
        DataType = ftString
        Precision = 20
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select c.* from tb_correspondencia c '
      'where c.corr_usu = :Usuario')
    Left = 320
    Top = 304
    object qRelCorrespondenciaEND_COD: TIntegerField
      FieldName = 'END_COD'
    end
    object qRelCorrespondenciaLkp_LocalCorrespondencia: TStringField
      DisplayLabel = 'Local'
      FieldKind = fkLookup
      FieldName = 'Lkp_RespCorrespondencia'
      LookupDataSet = DM.qEnderecos
      LookupKeyFields = 'END_COD'
      LookupResultField = 'END_NMR'
      KeyFields = 'END_COD'
      LookupCache = True
      Size = 90
      Lookup = True
    end
    object qRelCorrespondenciaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelCorrespondenciaOBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
    end
    object qRelCorrespondenciaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object qRelCorrespondenciaREGCORREIO: TStringField
      DisplayLabel = 'N.'#186' Correio (Registro)'
      FieldName = 'REGCORREIO'
      Size = 14
    end
    object qRelCorrespondenciaCORR_DATA: TDateField
      FieldName = 'CORR_DATA'
    end
    object qRelCorrespondenciaCORR_USU: TStringField
      FieldName = 'CORR_USU'
    end
  end
  object qFiltroCPGTela: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select COUNT(p.pro_cod), p.pro_tipo, p.pro_cod, p.pro_nperc, c.l' +
        'co_nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_auto, v' +
        '.var_desc AS VARA, cm.com_desc AS COMARCA'
      'from tb_PROCESSO p JOIN tb_LCOLETA c ON (p.lco_cod = c.lco_cod)'
      
        'left outer JOIN tb_VARAS v  ON (p.uf_sigla = v.uf_sigla) and (p.' +
        'com_cod = v.com_cod) and (p.var_cod = v.var_cod)'
      
        'left outer JOIN tb_COMARCA cm ON (p.uf_sigla = cm.uf_sigla) and ' +
        '(p.com_cod = cm.com_cod)'
      'JOIN tb_CASOS pr ON (p.cas_codigo = pr.cas_codigo)'
      
        'group by p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_' +
        'desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_desc')
    Left = 56
    Top = 152
    object qFiltroCPGTelaCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qFiltroCPGTelaPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qFiltroCPGTelaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qFiltroCPGTelaPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qFiltroCPGTelaLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qFiltroCPGTelaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qFiltroCPGTelaDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qFiltroCPGTelaPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qFiltroCPGTelaCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
  end
  object DS_FiltroCPGTela: TDataSource
    DataSet = qFiltroCPGTela
    Left = 192
    Top = 152
  end
  object qGeraValorColetaroresMP: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo = 3)'
      '')
    Left = 512
    Top = 16
    object qGeraValorColetaroresMPCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qGeraValorColetaroresDP: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo in (4,10))'
      '')
    Left = 512
    Top = 80
    object qGeraValorColetaroresDPCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qGeraValorColetaroresCT: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo = 7)'
      '')
    Left = 648
    Top = 15
    object qGeraValorColetaroresCTCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qGeraValorColetaroresJUD: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = Null
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo in (1,5,6,8))'
      '')
    Left = 648
    Top = 80
    object qGeraValorColetaroresJUDCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qGeraValorColetaroresEXT: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'LOC'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO p'
      
        'where (p.pro_drec >= :DTINI) and (p.pro_drec <= :DTFIN) and (p.l' +
        'co_cod = :LOC) and (p.pro_sit = 1)'
      'and (p.pro_tipo = 2)'
      '')
    Left = 792
    Top = 16
    object qGeraValorColetaroresEXTCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qAMEL: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'AMEL'#39)
    Left = 528
    Top = 240
    object qAMELCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD8S1179: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D8S1179'#39)
    Left = 528
    Top = 296
    object qD8S1179CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD21S11: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D21S11'#39)
    Left = 608
    Top = 240
    object qD21S11CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD7S820: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D7S820'#39)
    Left = 608
    Top = 296
    object qD7S820CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qCSF1PO: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'CSF1PO'#39)
    Left = 528
    Top = 360
    object qCSF1POCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qTH01: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'TH01'#39)
    Left = 528
    Top = 416
    object qTH01CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD3S1358: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D3S1358'#39)
    Left = 608
    Top = 360
    object qD3S1358CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD13S317: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D13S317'#39)
    Left = 608
    Top = 416
    object qD13S317CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD16S539: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D16S539'#39)
    Left = 704
    Top = 240
    object qD16S539CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD19S433: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D19S433'#39)
    Left = 704
    Top = 296
    object qD19S433CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD2S1338: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D2S1338'#39)
    Left = 784
    Top = 240
    object qD2S1338CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qVWA: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'vWA'#39)
    Left = 784
    Top = 296
    object qVWACODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qTPOX: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'TPOX'#39)
    Left = 704
    Top = 360
    object qTPOXCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD5S818: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D5S818'#39)
    Left = 704
    Top = 416
    object qD5S818CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qD18S51: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'D18S51'#39)
    Left = 784
    Top = 360
    object qD18S51CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object qFGA: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Valor1'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select distinct al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1 and al.al2_ale = :Valor2 and al.mar_a' +
        'le = '#39'FGA'#39)
    Left = 784
    Top = 416
    object qFGACODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object DS_ConsultaSQLQ_Consulta: TDataSource
    DataSet = SQLQ_Consulta
    Left = 48
    Top = 448
  end
  object SQLQ_Consulta: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Valor1FGA'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2FGA'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D8S1179'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D8S1179'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D21S11'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D21S11'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D7S820'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D7S820'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1CSF1PO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2CSF1PO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D3S1358'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D3S1358'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1TH01'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2TH01'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D13S317'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D13S317'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D16S539'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D16S539'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D2S1338'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D2S1338'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D19S433'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D19S433'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1VWA'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2VWA'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1TPOX'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2TPOX'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D18S51'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D18S51'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1AMEL'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2AMEL'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor1D5S818'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end
      item
        Name = 'Valor2D5S818'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 30
        Size = 30
        Value = ''
      end>
    SQL.Strings = (
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1FGA and al.al2_ale = :Valor2FGA and al' +
        '.mar_ale in ('#39'FGA'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D8S1179 and al.al2_ale = :Valor2D8S117' +
        '9 and al.mar_ale in ('#39'D8S1179'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D21S11 and al.al2_ale = :Valor2D21S11 ' +
        'and al.mar_ale in ('#39'D21S11'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D7S820 and al.al2_ale = :Valor2D7S820 ' +
        'and al.mar_ale in ('#39'D7S820'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1CSF1PO and al.al2_ale = :Valor2CSF1PO ' +
        'and al.mar_ale in ('#39'CSF1PO'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D3S1358 and al.al2_ale = :Valor2D3S135' +
        '8 and al.mar_ale in ('#39'D3S1358'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1TH01 and al.al2_ale = :Valor2TH01 and ' +
        'al.mar_ale in ('#39'TH01'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D13S317 and al.al2_ale = :Valor2D13S31' +
        '7 and al.mar_ale in ('#39'D13S317'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D16S539 and al.al2_ale = :Valor2D16S53' +
        '9 and al.mar_ale in ('#39'D16S539'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D2S1338 and al.al2_ale = :Valor2D2S133' +
        '8 and al.mar_ale in ('#39'D2S1338'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D19S433 and al.al2_ale = :Valor2D19S43' +
        '3 and al.mar_ale in ('#39'D19S433'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1VWA and al.al2_ale = :Valor2VWA and al' +
        '.mar_ale in ('#39'vWA'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1TPOX and al.al2_ale = :Valor2TPOX and ' +
        'al.mar_ale in ('#39'TPOX'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D18S51 and al.al2_ale = :Valor2D18S51 ' +
        'and al.mar_ale in ('#39'D18S51'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1AMEL and al.al2_ale = :Valor2AMEL and ' +
        'al.mar_ale in ('#39'AMEL'#39')'
      'union'
      'select al.nm1_ale as Codigo from tb_alelos al'
      
        'where al.al1_ale = :Valor1D5S818 and al.al2_ale = :Valor2D5S818 ' +
        'and al.mar_ale in ('#39'D5S818'#39')'
      '')
    Left = 48
    Top = 416
    object SQLQ_ConsultaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 100
    end
  end
  object DS_ConsultaAuditoria: TDataSource
    DataSet = qConsultaAuditoria
    Left = 648
    Top = 184
  end
  object qConsultaAuditoria: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_auditoria')
    Left = 648
    Top = 136
    object qConsultaAuditoriaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaAuditoriaHOS_USUA: TStringField
      FieldName = 'HOS_USUA'
      Size = 60
    end
    object qConsultaAuditoriaAUD_DATA: TDateField
      FieldName = 'AUD_DATA'
    end
    object qConsultaAuditoriaAUD_HORA: TStringField
      FieldName = 'AUD_HORA'
      Size = 12
    end
    object qConsultaAuditoriaAUD_AVISO: TStringField
      FieldName = 'AUD_AVISO'
      Size = 200
    end
    object qConsultaAuditoriaAUD_EXECUCAO: TStringField
      FieldName = 'AUD_EXECUCAO'
      Size = 100
    end
    object qConsultaAuditoriaAUD_CONTR: TIntegerField
      FieldName = 'AUD_CONTR'
    end
    object qConsultaAuditoriaAUD_CAM_ORIALT: TStringField
      FieldName = 'AUD_CAM_ORIALT'
      Size = 300
    end
  end
  object qBuscaFezLaudo: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 17
        Size = 17
        Value = '0'
      end>
    SQL.Strings = (
      
        'select distinct a.HOS_USUA from tb_auditoria a JOIN tb_processo ' +
        'p on a.pro_cod = p.pro_cod '
      'where p.pro_nperc = :Codigo'
      'order by a.aud_contr')
    Left = 288
    Top = 304
    object qBuscaFezLaudoHOS_USUA: TStringField
      FieldName = 'HOS_USUA'
    end
  end
  object qRelCorrespondenciaSemJudicial: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Usuario'
        DataType = ftString
        Precision = 20
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'select c.* from tb_correspondencia c join tb_processo p on p.pro' +
        '_cod=c.pro_cod'
      'where c.corr_usu = :Usuario and p.pro_tipo <> 1')
    Left = 344
    Top = 376
    object StringField1: TStringField
      DisplayLabel = 'Local'
      FieldKind = fkLookup
      FieldName = 'Lkp_RespCorrespondencia'
      LookupDataSet = DM.qEnderecos
      LookupKeyFields = 'END_COD'
      LookupResultField = 'END_NMR'
      KeyFields = 'END_COD'
      LookupCache = True
      Size = 90
      Lookup = True
    end
    object qRelCorrespondenciaSemJudicialEND_COD: TIntegerField
      FieldName = 'END_COD'
    end
    object qRelCorrespondenciaSemJudicialPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelCorrespondenciaSemJudicialOBS: TStringField
      FieldName = 'OBS'
    end
    object qRelCorrespondenciaSemJudicialTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object qRelCorrespondenciaSemJudicialREGCORREIO: TStringField
      FieldName = 'REGCORREIO'
      Size = 14
    end
    object qRelCorrespondenciaSemJudicialCORR_USU: TStringField
      FieldName = 'CORR_USU'
    end
    object qRelCorrespondenciaSemJudicialCORR_DATA: TDateField
      FieldName = 'CORR_DATA'
    end
  end
  object qRelCorrespondenciaComJudicial: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Usuario'
        DataType = ftString
        Precision = 20
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'select c.* from tb_correspondencia c join tb_processo p on p.pro' +
        '_cod=c.pro_cod'
      'where c.corr_usu = :Usuario and p.pro_tipo = 1')
    Left = 344
    Top = 416
    object StringField2: TStringField
      DisplayLabel = 'Local'
      FieldKind = fkLookup
      FieldName = 'Lkp_RespCorrespondencia'
      LookupDataSet = DM.qEnderecos
      LookupKeyFields = 'END_COD'
      LookupResultField = 'END_NMR'
      KeyFields = 'END_COD'
      LookupCache = True
      Size = 90
      Lookup = True
    end
    object qRelCorrespondenciaComJudicialPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelCorrespondenciaComJudicialTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object qRelCorrespondenciaComJudicialREGCORREIO: TStringField
      FieldName = 'REGCORREIO'
      Size = 14
    end
    object qRelCorrespondenciaComJudicialCORR_USU: TStringField
      FieldName = 'CORR_USU'
    end
    object qRelCorrespondenciaComJudicialCORR_DATA: TDateField
      FieldName = 'CORR_DATA'
    end
    object qRelCorrespondenciaComJudicialEND_COD: TIntegerField
      FieldName = 'END_COD'
    end
    object qRelCorrespondenciaComJudicialOBS: TStringField
      FieldName = 'OBS'
    end
  end
  object qCorrespodenciaBuscaCidadeUF: TADOQuery
    Connection = DM.ADOC_SCPG
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
      'select e.end_cid, e.uf_sigla from tb_enderecos e'
      'where e.end_cod= :Codigo')
    Left = 432
    Top = 312
    object qCorrespodenciaBuscaCidadeUFEND_CID: TStringField
      FieldName = 'END_CID'
      Size = 40
    end
    object qCorrespodenciaBuscaCidadeUFUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
  end
  object qVisaoPagamento: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      ''
      'select'
      'upper(lc.lco_cod) codigo,'
      'upper(lc.lco_nome) nome,'
      'upper(lc.lco_cid || '#39' - '#39' || lc.uf_sigla) cidade,'
      'cast(sum(x.ct) AS NUMERIC(15,2)) totConselhoTutelar,'
      'cast(sum(x.dp) AS NUMERIC(15,2)) totDefensoriaPublica,'
      'cast(sum(x.mp) AS NUMERIC(15,2)) totMinisterioPublico,'
      'cast(sum(x.jud) AS NUMERIC(15,2)) totJudicial,'
      'cast(sum(x.ext) AS NUMERIC(15,2)) totExtrajudicial,'
      'cast(sum(x.ext+x.jud+x.mp+x.dp+x.ct) AS NUMERIC(15,2)) totGeral'
      'from'
      '('
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', p.pro_drec'
      #9', p.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      
        #9'group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p' +
        '.pro_tipo'
      #9
      #9'UNION '
      #9
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', tca.COA_DATREC pro_drec'
      #9', tca.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      #9'JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD '
      
        #9'group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro' +
        '_sit,p.pro_tipo'
      ') as x join TB_LCOLETA lc on lc.LCO_COD = x.lco_cod'
      'where (x.pro_drec >= :DTINI) and (x.pro_drec <= :DTFIN)'
      
        'group by lc.lco_cod, lc.lco_nome,lc.lco_cid || '#39' - '#39' || lc.uf_si' +
        'gla')
    Left = 784
    Top = 88
    object qVisaoPagamentoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 11
    end
    object qVisaoPagamentoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qVisaoPagamentoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object qVisaoPagamentoTOTCONSELHOTUTELAR: TBCDField
      FieldName = 'TOTCONSELHOTUTELAR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoTOTDEFENSORIAPUBLICA: TBCDField
      FieldName = 'TOTDEFENSORIAPUBLICA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoTOTMINISTERIOPUBLICO: TBCDField
      FieldName = 'TOTMINISTERIOPUBLICO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoTOTJUDICIAL: TBCDField
      FieldName = 'TOTJUDICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoTOTEXTRAJUDICIAL: TBCDField
      FieldName = 'TOTEXTRAJUDICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoTOTGERAL: TBCDField
      FieldName = 'TOTGERAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object DS_VisaoPagamento: TDataSource
    DataSet = qVisaoPagamento
    Left = 768
    Top = 152
  end
  object qVisaoPagamentoAno: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      'upper(lc.lco_cod) codigo,'
      'upper(lc.lco_nome) nome,'
      'upper(lc.lco_cid || '#39' - '#39' || lc.uf_sigla) cidade,'
      'extract (year from p.pro_drec) ano,'
      'count(distinct p.pro_cod) quantidade'
      'from tb_PROCESSO p join TB_LCOLETA lc on lc.LCO_COD = p.lco_cod'
      'where (p.pro_sit = 1) and extract (year from p.pro_drec) >= 2006'
      'group by '
      'upper(lc.lco_cod),'
      'upper(lc.lco_nome),'
      'upper(lc.lco_cid || '#39' - '#39' || lc.uf_sigla),'
      'extract (year from p.pro_drec)'
      'union'
      'select'
      'upper(lc.lco_cod) codigo,'
      'upper(lc.lco_nome) nome,'
      'upper(lc.lco_cid || '#39' - '#39' || lc.uf_sigla) cidade,'
      'extract (year from a.COA_DATREC) ano,'
      'count(distinct a.pro_cod) quantidade'
      
        'from tb_coleta_adicional a join TB_LCOLETA lc on lc.LCO_COD = a.' +
        'lco_cod'
      'group by'
      'upper(lc.lco_cod),'
      'upper(lc.lco_nome),'
      'upper(lc.lco_cid || '#39' - '#39' || lc.uf_sigla),'
      'extract (year from a.COA_DATREC)')
    Left = 792
    Top = 200
    object qVisaoPagamentoAnoCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 11
    end
    object qVisaoPagamentoAnoNOME: TStringField
      DisplayLabel = 'Coletador'
      FieldName = 'NOME'
      Size = 60
    end
    object qVisaoPagamentoAnoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 45
    end
    object qVisaoPagamentoAnoANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
    end
    object qVisaoPagamentoAnoQUANTIDADE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QUANTIDADE'
    end
  end
  object ds_VisaoPagamentoAno: TDataSource
    DataSet = qVisaoPagamentoAno
    Left = 896
    Top = 280
  end
  object qVisaoPagamentoBanco: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select'
      'b.desc_banco banco,'
      'upper(lc.lco_cod) codigo,'
      'upper(lc.lco_nome) nome,'
      
        'CASE WHEN (lc.LCO_PIX IS NULL OR lc.LCO_PIX = '#39#39') THEN upper(lc.' +
        'lco_agencia) ELSE '#39'PAG. PIX'#39' END agencia,'
      
        'CASE WHEN (lc.LCO_PIX IS NULL OR lc.LCO_PIX = '#39#39') THEN upper(lc.' +
        'lco_conta) ELSE '#39'PAG. PIX'#39' END conta,'
      
        'CASE WHEN (lc.LCO_PIX IS NULL OR lc.LCO_PIX = '#39#39') THEN upper(lc.' +
        'lco_cpfcnpj) ELSE lc.LCO_PIX END cpf_cnpj,'
      
        'CASE WHEN (lc.LCO_PIX IS NULL OR lc.LCO_PIX = '#39#39') THEN upper(lc.' +
        'lco_agencia) ELSE '#39'PAG. PIX'#39' END Teste,'
      
        'cast(case when (lc.lco_cod in (629) and (sum(x.jud+x.ct+x.mp+x.d' +
        'p+x.ext)>0)) then sum(x.jud+x.ct+x.mp+x.dp+x.ext+50) else sum(x.' +
        'jud+x.ct+x.mp+x.dp+x.ext) end AS NUMERIC(15,2)) valor'
      'from'
      '('
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', p.pro_drec'
      #9', p.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      
        #9'group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p' +
        '.pro_tipo'
      #9
      #9'UNION '
      #9
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', tca.COA_DATREC pro_drec'
      #9', tca.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      #9'JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD '
      
        #9'group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro' +
        '_sit,p.pro_tipo'
      '                                                                '
      ') as x join TB_LCOLETA lc on lc.LCO_COD = x.lco_cod'
      'join tb_banco b on b.cod_banco = lc.lco_banco'
      'WHERE 0=0'
      'AND (x.pro_drec >= :DTINI) and (x.pro_drec <= :DTFIN)'
      'and lc.lco_banco is not null'
      'group by'
      'b.desc_banco,'
      'lc.lco_cod,'
      'lc.lco_nome,'
      'lc.lco_agencia,'
      'lc.lco_conta,'
      'lc.lco_cpfcnpj,'
      'lc.LCO_PIX')
    Left = 944
    Top = 200
    object qVisaoPagamentoBancoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 50
    end
    object qVisaoPagamentoBancoCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 11
    end
    object qVisaoPagamentoBancoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qVisaoPagamentoBancoAGENCIA: TStringField
      FieldName = 'AGENCIA'
    end
    object qVisaoPagamentoBancoCONTA: TStringField
      FieldName = 'CONTA'
      Size = 30
    end
    object qVisaoPagamentoBancoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
    end
    object qVisaoPagamentoBancoVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qVisaoPagamentoFiltro: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      ''
      'select'
      'upper(lc.lco_cod) codigo,'
      'upper(lc.lco_nome) nome,'
      'upper(lc.lco_cid || '#39' - '#39' || lc.uf_sigla) cidade,'
      'cast(sum(x.ct) AS NUMERIC(15,2)) totConselhoTutelar,'
      'cast(sum(x.dp) AS NUMERIC(15,2)) totDefensoriaPublica,'
      'cast(sum(x.mp) AS NUMERIC(15,2)) totMinisterioPublico,'
      'cast(sum(x.jud) AS NUMERIC(15,2)) totJudicial,'
      'cast(sum(x.ext) AS NUMERIC(15,2)) totExtrajudicial,'
      'cast(sum(x.ext+x.jud+x.mp+x.dp+x.ct) AS NUMERIC(15,2)) totGeral'
      'from'
      '('
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', p.pro_drec'
      #9', p.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      
        #9'group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p' +
        '.pro_tipo'
      #9
      #9'UNION '
      #9
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', tca.COA_DATREC pro_drec'
      #9', tca.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      #9'JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD '
      
        #9'group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro' +
        '_sit,p.pro_tipo'
      ') as x join TB_LCOLETA lc on lc.LCO_COD = x.lco_cod'
      'where (x.pro_drec >= :DTINI) and (x.pro_drec <= :DTFIN)'
      
        'group by lc.lco_cod, lc.lco_nome,lc.lco_cid || '#39' - '#39' || lc.uf_si' +
        'gla')
    Left = 912
    Top = 88
    object qVisaoPagamentoFiltroCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 11
    end
    object qVisaoPagamentoFiltroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qVisaoPagamentoFiltroCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object qVisaoPagamentoFiltroTOTCONSELHOTUTELAR: TBCDField
      FieldName = 'TOTCONSELHOTUTELAR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoFiltroTOTDEFENSORIAPUBLICA: TBCDField
      FieldName = 'TOTDEFENSORIAPUBLICA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoFiltroTOTMINISTERIOPUBLICO: TBCDField
      FieldName = 'TOTMINISTERIOPUBLICO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoFiltroTOTJUDICIAL: TBCDField
      FieldName = 'TOTJUDICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoFiltroTOTEXTRAJUDICIAL: TBCDField
      FieldName = 'TOTEXTRAJUDICIAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoFiltroTOTGERAL: TBCDField
      FieldName = 'TOTGERAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object DS_VisaoPagamentoFiltro: TDataSource
    DataSet = qVisaoPagamentoFiltro
    Left = 912
    Top = 136
  end
  object qQuantMinimoKits: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from VI_QUANTIDADE_KITS k'
      'where k.atual_kit <= k.minimo_kit')
    Left = 904
    Top = 352
    object qQuantMinimoKitsCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qQuantMinimoKitsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qQuantMinimoKitsCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object qQuantMinimoKitsMINIMO_KIT: TIntegerField
      FieldName = 'MINIMO_KIT'
    end
    object qQuantMinimoKitsATUAL_KIT: TIntegerField
      FieldName = 'ATUAL_KIT'
    end
    object qQuantMinimoKitsULTIMA_DATA_ENVIO: TDateField
      FieldName = 'ULTIMA_DATA_ENVIO'
    end
  end
  object ds_QuantMinimoKits: TDataSource
    DataSet = qQuantMinimoKits
    Left = 904
    Top = 400
  end
  object DS_RelLaudosHojeSemPessoa: TDataSource
    DataSet = qRelLaudosHojeSemPessoa
    Left = 368
    Top = 200
  end
  object DS_RelLaudosEmitidos: TDataSource
    DataSet = qRelLaudosEmitidos
    Left = 984
    Top = 424
  end
  object ds_RelQuantidade: TDataSource
    DataSet = qRelQuantidade
    Left = 216
    Top = 400
  end
  object ds_RelFinanceiro: TDataSource
    DataSet = qRelFinanceiro
    Left = 120
    Top = 392
  end
  object ds_RelFinanceiroSum: TDataSource
    DataSet = qRelFinanceiroSum
    Left = 24
    Top = 384
  end
  object DS_VisaoPagamentoBanco: TDataSource
    DataSet = qVisaoPagamentoBanco
    Left = 968
    Top = 256
  end
  object qVisaoPagamentoConferencia: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DTINI'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'DTFIN'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      'select'
      'upper(lc.lco_cod) codigo,'
      'upper(lc.lco_nome) nome,'
      'v.caso,'
      'V.VALORCASO valor_caso,'
      'cast(sum(v.valor) AS NUMERIC(15,2)) valor_pagar'
      'from'
      '('
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', p.pro_drec'
      #9', p.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      
        #9'group by p.pro_drec, p.lco_cod, v.valor, p.pro_cod, p.pro_sit,p' +
        '.pro_tipo'
      #9
      #9'UNION '
      #9
      #9'select '
      #9'  p.pro_cod'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 7)) THEN (count(' +
        '*)*(v.valor)) ELSE 0 END ct'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (4,10))) THEN (' +
        'count(*)*(v.valor)) ELSE 0  END dp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 3)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END mp'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo in (1,5,6,8))) THE' +
        'N (count(*)*(v.valor)) ELSE 0  END jud'
      
        #9', CASE WHEN ((p.pro_sit = 1) and (p.pro_tipo = 2)) THEN (count(' +
        '*)*(v.valor)) ELSE 0  END ext'
      #9', tca.COA_DATREC pro_drec'
      #9', tca.lco_cod'
      
        #9'from tb_PROCESSO p JOIN VI_VALOR_COLETADOR v on v.caso=p.pro_co' +
        'd'
      #9'JOIN TB_COLETA_ADICIONAL tca ON tca.PRO_COD=p.PRO_COD '
      
        #9'group by tca.COA_DATREC, tca.lco_cod, v.valor, p.pro_cod, p.pro' +
        '_sit,p.pro_tipo'
      ') as x join TB_LCOLETA lc on lc.LCO_COD = x.lco_cod'
      'JOIN VI_VALOR_COLETADOR v on v.caso=x.PRO_COD '
      'where (x.pro_drec >= :DTINI) and (x.pro_drec <= :DTFIN)'
      'group by lc.lco_cod, lc.lco_nome,v.caso,v.VALORCASO ')
    Left = 360
    Top = 504
    object qVisaoPagamentoConferenciaCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 11
    end
    object qVisaoPagamentoConferenciaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qVisaoPagamentoConferenciaCASO: TIntegerField
      FieldName = 'CASO'
    end
    object qVisaoPagamentoConferenciaVALOR_CASO: TBCDField
      FieldName = 'VALOR_CASO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qVisaoPagamentoConferenciaVALOR_PAGAR: TBCDField
      FieldName = 'VALOR_PAGAR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object DS_VisaoPagamentoConferencia: TDataSource
    DataSet = qVisaoPagamentoConferencia
    Left = 584
    Top = 504
  end
  object qRelFinanceiroDados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      'P.PRO_COD,'
      'p.PRO_AUTO,'
      'p.PRO_DREC,'
      'v.VAR_DESC,'
      'c.COM_DESC CIDADE,'
      'U.UF_SIGLA ESTADO,'#9
      'l.LCO_LABT,'
      'h.HIS_DATA,'
      'pa.PAR_OBS'
      
        'from tb_processo p join tb_parcelas pa on p.pro_cod = pa.pro_cod' +
        ' AND pa.par_sit = 1'
      '                   join tb_lcoleta l on l.lco_cod = p.lco_cod'
      
        '        LEFT OUTER JOIN tb_comarca c ON c.COM_COD=p.COM_COD AND ' +
        'c.UF_SIGLA=p.UF_SIGLA'
      
        '        LEFT OUTER JOIN tb_varas v ON p.VAR_COD=v.VAR_COD AND v.' +
        'COM_COD=p.COM_COD AND v.UF_SIGLA=p.UF_SIGLA'
      '        LEFT OUTER JOIN tb_uf u ON u.UF_SIGLA=p.UF_SIGLA'
      
        '        LEFT OUTER JOIN tb_historico h ON h.PRO_COD = p.PRO_COD ' +
        'AND h.ITE_COD = 6'
      'WHERE 0=0'
      'AND p.PRO_COD = 1')
    Left = 752
    Top = 490
    object qRelFinanceiroDadosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelFinanceiroDadosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qRelFinanceiroDadosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelFinanceiroDadosVAR_DESC: TStringField
      FieldName = 'VAR_DESC'
      Size = 40
    end
    object qRelFinanceiroDadosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qRelFinanceiroDadosLCO_LABT: TStringField
      FieldName = 'LCO_LABT'
      Size = 60
    end
    object qRelFinanceiroDadosHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qRelFinanceiroDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object qRelFinanceiroDadosPAR_OBS: TStringField
      FieldName = 'PAR_OBS'
      Size = 80
    end
  end
  object ds_RelFinanceiroDados: TDataSource
    DataSet = qRelFinanceiroDados
    Left = 832
    Top = 490
  end
end
