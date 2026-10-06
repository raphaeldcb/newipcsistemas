object DMRI: TDMRI
  OldCreateOrder = False
  Left = 217
  Top = 331
  Height = 312
  Width = 883
  object ds_qRelExamesPaternidadeFatura: TDataSource
    DataSet = qRelExamesPaternidadeFatura
    Left = 112
    Top = 88
  end
  object qRelExamesPaternidadeFatura: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicio'
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
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select p.pro_dcole, p.pro_nperc, c.cas_desc, l.lab_labt,'
      
        'case when (select a.aco_vlrimp from tb_acordos a where a.lab_cod' +
        '=p.fontepgado and a.cas_codigo=c.cas_codigo and a.aco_vigente = ' +
        '1) is null'
      
        '  then c.cas_vlrim else (select a.aco_vlrimp from tb_acordos a w' +
        'here a.lab_cod=p.fontepgado and a.cas_codigo=c.cas_codigo and a.' +
        'aco_vigente = 1) end cas_vlrim'
      
        'from tb_processo p JOIN tb_casos c  ON p.cas_codigo = c.cas_codi' +
        'go'
      
        '                   JOIN tb_laboratorios l ON p.fontepgado=l.lab_' +
        'cod'
      '                   JOIN tb_parcelas pa ON pa.pro_cod = p.pro_cod'
      '                   JOIN tb_pessoas ps ON ps.pro_cod=p.pro_cod'
      
        'where ps.pes_sit = 2 and p.pro_drec >= :DataInicio and p.pro_dre' +
        'c <= :DataFinal'
      
        'and p.FONTEPGADO = :Laboratorio and pa.par_tppg in (1,7) and pa.' +
        'par_onde = '#39'Paternidade'#39)
    Left = 112
    Top = 40
    object qRelExamesPaternidadeFaturaPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qRelExamesPaternidadeFaturaPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qRelExamesPaternidadeFaturaCAS_DESC: TStringField
      FieldName = 'CAS_DESC'
      Size = 60
    end
    object qRelExamesPaternidadeFaturaLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelExamesPaternidadeFaturaCAS_VLRIM: TBCDField
      FieldName = 'CAS_VLRIM'
      currency = True
      Precision = 18
    end
  end
  object DS_RelExamesPaternidadeGeral: TDataSource
    DataSet = qRelExamesPaternidadeGeral
    Left = 320
    Top = 80
  end
  object qRelExamesPaternidadeGeral: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicio'
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
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select p.pro_dcole, p.pro_nperc, c.cas_desc, p.pro_resul, p.pro_' +
        'dresu, l.lab_nome, sum(pa.par_vlr) valor from'
      'tb_processo p JOIN tb_casos c  ON p.cas_codigo = c.cas_codigo'
      '              JOIN tb_laboratorios l ON p.lab_cod=l.lab_cod'
      '              JOIN tb_parcelas pa on pa.pro_cod = p.pro_cod'
      
        'where (pa.par_tppg <> 1) and  p.pro_drec >= :DataInicio and p.pr' +
        'o_drec <= :DataFinal and p.FONTEPGADO = :Laboratorio '
      
        'group by p.pro_dcole, p.pro_nperc, c.cas_desc, p.pro_resul, p.pr' +
        'o_dresu, l.lab_nome')
    Left = 320
    Top = 32
    object qRelExamesPaternidadeGeralPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qRelExamesPaternidadeGeralPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qRelExamesPaternidadeGeralCAS_DESC: TStringField
      FieldName = 'CAS_DESC'
      Size = 60
    end
    object qRelExamesPaternidadeGeralPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qRelExamesPaternidadeGeralPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qRelExamesPaternidadeGeralLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qRelExamesPaternidadeGeralVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qRelExamesPaternidadeGeralSUM: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicio'
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
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select SUM(pa.par_vlr) as VALOR from'
      'tb_processo p JOIN tb_casos c  ON p.cas_codigo = c.cas_codigo'
      '              JOIN tb_laboratorios l ON p.lab_cod=l.lab_cod'
      '              JOIN tb_parcelas pa on pa.pro_cod = p.pro_cod'
      
        'where (pa.par_tppg <> 1) and p.pro_drec >= :DataInicio and p.pro' +
        '_drec <= :DataFinal and p.FONTEPGADO = :Laboratorio')
    Left = 321
    Top = 133
    object qRelExamesPaternidadeGeralSUMVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qRelExamesFatura: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicio'
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
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from'
      
        'tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_' +
        'cod'
      
        '                    JOIN tb_exames    e  ON pr.exa_cod = e.exa_c' +
        'od'
      
        '                    JOIN tb_medicos   m  ON pr.med_crm = m.med_c' +
        'rm'
      
        '                    JOIN tb_laboratorios l ON pr.lab_cod = l.lab' +
        '_cod'
      '                  JOIN tb_parcelas pc ON pc.pro_cod = pr.pro_cod'
      'where pr.PRO_DCAD >= :DataInicio and pr.PRO_DCAD <= :DataFinal'
      
        'and pr.lab_cod = :Laboratorio and pc.par_tppg in (1,7) and pc.pa' +
        'r_onde = '#39'Infecciosas'#39)
    Left = 496
    Top = 32
    object qRelExamesFaturaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelExamesFaturaPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qRelExamesFaturaPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qRelExamesFaturaLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qRelExamesFaturaMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qRelExamesFaturaEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qRelExamesFaturaPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qRelExamesFaturaPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qRelExamesFaturaPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qRelExamesFaturaPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qRelExamesFaturaPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qRelExamesFaturaPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qRelExamesFaturaPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qRelExamesFaturaPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qRelExamesFaturaPES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qRelExamesFaturaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qRelExamesFaturaPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qRelExamesFaturaPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qRelExamesFaturaPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qRelExamesFaturaPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qRelExamesFaturaPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qRelExamesFaturaPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qRelExamesFaturaPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qRelExamesFaturaPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qRelExamesFaturaEXA_COD_1: TStringField
      FieldName = 'EXA_COD_1'
      Size = 10
    end
    object qRelExamesFaturaEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 60
    end
    object qRelExamesFaturaEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qRelExamesFaturaEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qRelExamesFaturaEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qRelExamesFaturaEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qRelExamesFaturaEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      Precision = 18
      Size = 2
    end
    object qRelExamesFaturaEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      Precision = 18
      Size = 2
    end
    object qRelExamesFaturaEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qRelExamesFaturaEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qRelExamesFaturaMED_CRM_1: TStringField
      FieldName = 'MED_CRM_1'
      Size = 15
    end
    object qRelExamesFaturaMED_NOME: TStringField
      FieldName = 'MED_NOME'
      Size = 60
    end
    object qRelExamesFaturaMED_CID: TStringField
      FieldName = 'MED_CID'
      Size = 40
    end
    object qRelExamesFaturaLAB_COD_1: TIntegerField
      FieldName = 'LAB_COD_1'
    end
    object qRelExamesFaturaLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qRelExamesFaturaLAB_SEXO: TStringField
      FieldName = 'LAB_SEXO'
      Size = 10
    end
    object qRelExamesFaturaLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qRelExamesFaturaLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelExamesFaturaLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qRelExamesFaturaLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qRelExamesFaturaLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qRelExamesFaturaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qRelExamesFaturaPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qRelExamesFaturaLAB_INTEXT: TStringField
      FieldName = 'LAB_INTEXT'
      Size = 8
    end
    object qRelExamesFaturaPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qRelExamesFaturaLAB_FGVLR: TStringField
      FieldName = 'LAB_FGVLR'
      Size = 3
    end
    object qRelExamesFaturaPRO_COD_1: TIntegerField
      FieldName = 'PRO_COD_1'
    end
    object qRelExamesFaturaPAR_NPARC: TIntegerField
      FieldName = 'PAR_NPARC'
    end
    object qRelExamesFaturaPAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      Precision = 18
      Size = 2
    end
    object qRelExamesFaturaPAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
    object qRelExamesFaturaPAR_SIT: TIntegerField
      FieldName = 'PAR_SIT'
    end
    object qRelExamesFaturaPAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qRelExamesFaturaCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
    end
    object qRelExamesFaturaPAR_OBS: TStringField
      FieldName = 'PAR_OBS'
      Size = 80
    end
    object qRelExamesFaturaPAR_DATAPREVISTA: TDateField
      FieldName = 'PAR_DATAPREVISTA'
    end
    object qRelExamesFaturaPAR_ONDE: TStringField
      FieldName = 'PAR_ONDE'
    end
    object qRelExamesFaturaPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelExamesFaturaLAB_FGBOLETO: TStringField
      FieldName = 'LAB_FGBOLETO'
      Size = 3
    end
    object qRelExamesFaturaCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
  end
  object DSRelExamesFatura: TDataSource
    DataSet = qRelExamesFatura
    Left = 496
    Top = 80
  end
  object qRelExamesFaturaSUM: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicio'
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
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select SUM(EXA_VLAB) AS VALORTOTAL from'
      
        'tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_' +
        'cod'
      
        '                    JOIN tb_exames    e  ON pr.exa_cod = e.exa_c' +
        'od'
      
        '                    JOIN tb_medicos   m  ON pr.med_crm = m.med_c' +
        'rm'
      
        '                    JOIN tb_laboratorios l ON pr.lab_cod = l.lab' +
        '_cod'
      '                  JOIN tb_parcelas pc ON pc.pro_cod = pr.pro_cod'
      
        'where pr.PRO_DCAD >= :DataInicio and pr.PRO_DCAD <= :DataFinal a' +
        'nd pr.lab_cod = :Laboratorio and pc.par_tppg in (1,7) and pc.par' +
        '_onde = '#39'Infecciosas'#39
      ''
      '')
    Left = 504
    Top = 136
    object qRelExamesFaturaSUMVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qRelFinanceiroMesAno: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Ano'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Mes'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select l.lab_labt, cm.com_desc, v.var_desc,  count(pr.pro_cod) a' +
        's Quantidade_Atendimentos, Sum(p.par_vlr) as Soma_Valor'
      'from tb_parcelas p join tb_processo pr on p.pro_cod=pr.pro_cod'
      
        '                   join tb_laboratorios l on pr.fontepgado = l.l' +
        'ab_cod'
      
        '                   left outer JOIN tb_VARAS v  ON (pr.uf_sigla =' +
        ' v.uf_sigla) and (pr.com_cod = v.com_cod) and (pr.var_cod = v.va' +
        'r_cod)'
      
        '                   left outer JOIN tb_COMARCA cm ON (pr.uf_sigla' +
        ' = cm.uf_sigla) and (pr.com_cod = cm.com_cod)'
      
        'where (p.par_tppg <> 1) and  (extract(year from p.par_data) = :A' +
        'no) and (extract(month from p.par_data) = :Mes )  and pr.lab_cod' +
        ' = :Laboratorio'
      'group by l.lab_labt, cm.com_desc, v.var_desc')
    Left = 160
    Top = 208
    object qRelFinanceiroMesAnoLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelFinanceiroMesAnoCOM_DESC: TStringField
      FieldName = 'COM_DESC'
      Size = 40
    end
    object qRelFinanceiroMesAnoVAR_DESC: TStringField
      FieldName = 'VAR_DESC'
      Size = 40
    end
    object qRelFinanceiroMesAnoQUANTIDADE_ATENDIMENTOS: TIntegerField
      FieldName = 'QUANTIDADE_ATENDIMENTOS'
    end
    object qRelFinanceiroMesAnoSOMA_VALOR: TBCDField
      FieldName = 'SOMA_VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qRelFinanceiroMesAnoProcedimentos: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Ano'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Mes'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Ano'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'Mes'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select l.lab_labt, count(po.pro_cod) as Quantidade_Atendimentos,' +
        ' Sum(e.exa_vlab) as Soma_Valor'
      
        'from tb_exames e join tb_procedimentos po on e.exa_cod=po.exa_co' +
        'd'
      
        '                   join tb_laboratorios l on po.lab_cod = l.lab_' +
        'cod'
      
        'where (extract(year from po.pro_dcad) = :Ano) and (extract(month' +
        ' from po.pro_dcad) = :Mes ) and (po.lab_cod not in (0,6))'
      'group by l.lab_labt'
      'union'
      
        'select l.lab_labt, count(po.pro_cod) as Quantidade_Atendimentos,' +
        ' Sum(e.exa_vpac) as Soma_Valor'
      
        'from tb_exames e join tb_procedimentos po on e.exa_cod=po.exa_co' +
        'd'
      
        '                   join tb_laboratorios l on po.lab_cod = l.lab_' +
        'cod'
      
        'where (extract(year from po.pro_dcad) = :Ano) and (extract(month' +
        ' from po.pro_dcad) = :Mes ) and (po.lab_cod in (0,6)) '
      'group by l.lab_labt')
    Left = 472
    Top = 208
    object qRelFinanceiroMesAnoProcedimentosLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelFinanceiroMesAnoProcedimentosQUANTIDADE_ATENDIMENTOS: TIntegerField
      FieldName = 'QUANTIDADE_ATENDIMENTOS'
    end
    object qRelFinanceiroMesAnoProcedimentosSOMA_VALOR: TBCDField
      FieldName = 'SOMA_VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qRelExamesPaternidadeFaturaSUM: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataInicio'
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
        Name = 'Laboratorio'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select SUM('
      
        'case when (select a.aco_vlrimp from tb_acordos a where a.lab_cod' +
        '=p.fontepgado and a.cas_codigo=c.cas_codigo and a.aco_vigente = ' +
        '1) is null'
      
        '  then c.cas_vlrim else (select a.aco_vlrimp from tb_acordos a w' +
        'here a.lab_cod=p.fontepgado and a.cas_codigo=c.cas_codigo and a.' +
        'aco_vigente = 1) end) as VALOR'
      
        'from tb_processo p JOIN tb_casos c  ON p.cas_codigo = c.cas_codi' +
        'go'
      
        '                   JOIN tb_laboratorios l ON p.fontepgado=l.lab_' +
        'cod'
      '                   JOIN tb_parcelas pa ON pa.pro_cod = p.pro_cod'
      '                   JOIN tb_pessoas ps ON ps.pro_cod=p.pro_cod'
      
        'where ps.pes_sit = 2 and p.pro_drec >= :DataInicio and p.pro_dre' +
        'c <= :DataFinal'
      
        'and p.FONTEPGADO = :Laboratorio and pa.par_tppg in (1,7) and pa.' +
        'par_onde = '#39'Paternidade'#39)
    Left = 113
    Top = 141
    object qRelExamesPaternidadeFaturaSUMVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
    end
  end
  object qRelCasosMesAno: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'AnoColeta'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end
      item
        Name = 'MesColeta'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      
        'select l.lab_labt, cm.com_desc, v.var_desc,  count(distinct pr.p' +
        'ro_cod) as Quantidade_Atendimentos, Sum(p.par_vlr) as Soma_Valor'
      'from tb_parcelas p join tb_processo pr on p.pro_cod=pr.pro_cod'
      
        '                   join tb_laboratorios l on pr.fontepgado = l.l' +
        'ab_cod'
      
        '                   left outer JOIN tb_VARAS v  ON (pr.uf_sigla =' +
        ' v.uf_sigla) and (pr.com_cod = v.com_cod) and (pr.var_cod = v.va' +
        'r_cod)'
      
        '                   left outer JOIN tb_COMARCA cm ON (pr.uf_sigla' +
        ' = cm.uf_sigla) and (pr.com_cod = cm.com_cod)'
      
        'where (extract(year from pr.PRO_DREC) = :AnoColeta) and (extract' +
        '(month from pr.PRO_DREC) = :MesColeta )'
      'group by l.lab_labt, cm.com_desc, v.var_desc')
    Left = 304
    Top = 208
    object qRelCasosMesAnoLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelCasosMesAnoCOM_DESC: TStringField
      FieldName = 'COM_DESC'
      Size = 40
    end
    object qRelCasosMesAnoVAR_DESC: TStringField
      FieldName = 'VAR_DESC'
      Size = 40
    end
    object qRelCasosMesAnoQUANTIDADE_ATENDIMENTOS: TIntegerField
      FieldName = 'QUANTIDADE_ATENDIMENTOS'
    end
    object qRelCasosMesAnoSOMA_VALOR: TBCDField
      FieldName = 'SOMA_VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qRelInfecciosas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select p.pro_cod, p.pro_dcad, c.pes_nome,'
      'p.exa_cod,  p.PRO_VALOR'
      'from tb_procedimentos p'
      'join tb_medicos m on m.med_crm = p.med_crm'
      'join tb_laboratorios l on l.lab_cod = p.pro_cod'
      'join tb_pacientes c on c.pes_cod = p.pes_cod'
      'join tb_exames e on e.exa_cod = p.exa_cod')
    Left = 616
    Top = 32
    object qRelInfecciosasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelInfecciosasPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qRelInfecciosasPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qRelInfecciosasEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qRelInfecciosasPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
end
