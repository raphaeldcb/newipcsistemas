object DMD: TDMD
  OldCreateOrder = False
  Left = 457
  Top = 275
  Height = 644
  Width = 1184
  object qFrequencias: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from  tb_alelos_frequencia')
    Left = 40
    Top = 33
    object qFrequenciasFRE_MARCADOR: TStringField
      FieldName = 'FRE_MARCADOR'
      Size = 10
    end
    object qFrequenciasFRE_ALELO: TBCDField
      FieldName = 'FRE_ALELO'
      Precision = 18
      Size = 1
    end
    object qFrequenciasFRE_FREQUENCIA: TBCDField
      FieldName = 'FRE_FREQUENCIA'
      Precision = 18
      Size = 6
    end
  end
  object qResultadosPaternidade: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_ALELOS_RESULTADOS')
    Left = 200
    Top = 33
    object qResultadosPaternidadeARE_MARCADOR: TStringField
      FieldName = 'ARE_MARCADOR'
      Size = 10
    end
    object qResultadosPaternidadeARE_AL1_MAE: TBCDField
      FieldName = 'ARE_AL1_MAE'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_AL2_MAE: TBCDField
      FieldName = 'ARE_AL2_MAE'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_AL1_CRI: TBCDField
      FieldName = 'ARE_AL1_CRI'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_AL2_CRI: TBCDField
      FieldName = 'ARE_AL2_CRI'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_AL1_SPA: TBCDField
      FieldName = 'ARE_AL1_SPA'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_AL2_SPA: TBCDField
      FieldName = 'ARE_AL2_SPA'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_FREQUENCIA: TBCDField
      FieldName = 'ARE_FREQUENCIA'
      Precision = 18
      Size = 2
    end
    object qResultadosPaternidadeARE_PI: TBCDField
      FieldName = 'ARE_PI'
      Precision = 18
      Size = 6
    end
    object qResultadosPaternidadeARE_PROBA: TBCDField
      FieldName = 'ARE_PROBA'
      Precision = 18
      Size = 6
    end
    object qResultadosPaternidadePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
  end
  object qConsultaAlelos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = '0'
      end
      item
        Name = 'Pessoa'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end
      item
        Name = 'Marcador'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 200
        Size = 200
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_ALELOS a'
      'where a.NM1_ALE = :Codigo'
      'and  a.NM2_ALE = :Pessoa'
      'and a.mar_ale = :Marcador'
      'and a.mar_ale <> '#39'AMEL'#39)
    Left = 48
    Top = 113
    object qConsultaAlelosCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qConsultaAlelosNM1_ALE: TStringField
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qConsultaAlelosNM2_ALE: TStringField
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qConsultaAlelosNM3_ALE: TStringField
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qConsultaAlelosNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qConsultaAlelosMAR_ALE: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qConsultaAlelosAL1_ALE: TStringField
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qConsultaAlelosAL2_ALE: TStringField
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qConsultaAlelosORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qConsultaCaso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from TB_PROCESSO p'
      'where p.PRO_COD = :Codigo')
    Left = 160
    Top = 113
    object qConsultaCasoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaCasoPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qConsultaCasoPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qConsultaCasoPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qConsultaCasoPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qConsultaCasoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qConsultaCasoCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qConsultaCasoCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qConsultaCasoVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qConsultaCasoLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qConsultaCasoPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
    object qConsultaCasoPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qConsultaCasoPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      Size = 5
    end
    object qConsultaCasoPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qConsultaCasoPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qConsultaCasoPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qConsultaCasoPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qConsultaCasoPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qConsultaCasoPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qConsultaCasoPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qConsultaCasoJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qConsultaCasoFG_PROP: TStringField
      FieldName = 'FG_PROP'
      Size = 1
    end
    object qConsultaCasoPRO_USUCAD: TStringField
      FieldName = 'PRO_USUCAD'
    end
    object qConsultaCasoPRO_NUMLAUDO: TStringField
      FieldName = 'PRO_NUMLAUDO'
    end
    object qConsultaCasoPRO_RASTREAR: TStringField
      FieldName = 'PRO_RASTREAR'
    end
    object qConsultaCasoPRO_CARREGACREDITO: TStringField
      FieldName = 'PRO_CARREGACREDITO'
      FixedChar = True
      Size = 1
    end
    object qConsultaCasoPRO_CREDITODNA: TStringField
      FieldName = 'PRO_CREDITODNA'
    end
    object qConsultaCasoPRO_HTREC: TStringField
      FieldName = 'PRO_HTREC'
      Size = 5
    end
    object qConsultaCasoPRO_LACRE: TStringField
      FieldName = 'PRO_LACRE'
    end
  end
  object qConsultaMarcadores: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = '0'
      end>
    SQL.Strings = (
      'select distinct a.mar_ale from tb_alelos A'
      'where a.NM1_ALE = :Codigo'
      'and a.mar_ale <> '#39'AMEL'#39)
    Left = 48
    Top = 193
    object qConsultaMarcadoresMAR_ALE: TStringField
      FieldName = 'MAR_ALE'
      Size = 200
    end
  end
  object qBuscaFrequencia: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Marcador'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = 10
        Value = ''
      end
      item
        Name = 'Alelo'
        Attributes = [paNullable]
        DataType = ftBCD
        NumericScale = 1
        Precision = 18
        Size = 19
        Value = 0c
      end>
    SQL.Strings = (
      ''
      
        'select FRE_FREQUENCIA, FRE_FREQUENCIA *100 FRE_FREQUENCIA_PERCEN' +
        'TUAL  from tb_alelos_frequencia where FRE_MARCADOR = :Marcador a' +
        'nd FRE_ALELO = :Alelo')
    Left = 272
    Top = 104
    object qBuscaFrequenciaFRE_FREQUENCIA: TBCDField
      FieldName = 'FRE_FREQUENCIA'
      Precision = 18
      Size = 6
    end
    object qBuscaFrequenciaFRE_FREQUENCIA_PERCENTUAL: TBCDField
      FieldName = 'FRE_FREQUENCIA_PERCENTUAL'
      Precision = 18
      Size = 6
    end
  end
  object qConsultaLimites: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Marcador'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = 10
        Value = ''
      end>
    SQL.Strings = (
      ''
      
        'select distinct t.val_marcador_min, t.val_marcador_max from vi_a' +
        'lelo_limites t'
      'where t.val_marcador = :Marcador')
    Left = 192
    Top = 193
    object qConsultaLimitesVAL_MARCADOR_MIN: TBCDField
      FieldName = 'VAL_MARCADOR_MIN'
      Precision = 18
      Size = 1
    end
    object qConsultaLimitesVAL_MARCADOR_MAX: TBCDField
      FieldName = 'VAL_MARCADOR_MAX'
      Precision = 18
      Size = 1
    end
  end
  object qConsultaResultados: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      ''
      'select * from TB_ALELOS_RESULTADOS r'
      'where r.pro_cod = :Codigo')
    Left = 240
    Top = 345
    object qConsultaResultadosARE_MARCADOR: TStringField
      DisplayLabel = 'Marcador'
      FieldName = 'ARE_MARCADOR'
      Size = 10
    end
    object qConsultaResultadosARE_AL1_MAE: TBCDField
      DisplayLabel = 'Valor 1 - MA'
      FieldName = 'ARE_AL1_MAE'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_AL2_MAE: TBCDField
      DisplayLabel = 'Valor 2 - MA'
      FieldName = 'ARE_AL2_MAE'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_AL1_CRI: TBCDField
      DisplayLabel = 'Valor 1 - CR'
      FieldName = 'ARE_AL1_CRI'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_AL2_CRI: TBCDField
      DisplayLabel = 'Valor 2 - CR'
      FieldName = 'ARE_AL2_CRI'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_AL1_SPA: TBCDField
      DisplayLabel = 'Valor 1 - SU'
      FieldName = 'ARE_AL1_SPA'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_AL2_SPA: TBCDField
      DisplayLabel = 'Valor 2 - CR'
      FieldName = 'ARE_AL2_SPA'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_FREQUENCIA: TBCDField
      DisplayLabel = 'Frequ'#234'ncia'
      FieldName = 'ARE_FREQUENCIA'
      Precision = 18
      Size = 2
    end
    object qConsultaResultadosARE_PI: TBCDField
      DisplayLabel = 'PI'
      FieldName = 'ARE_PI'
      Precision = 18
      Size = 6
    end
    object qConsultaResultadosARE_PROBA: TBCDField
      DisplayLabel = 'Probabilidade'
      FieldName = 'ARE_PROBA'
      Precision = 18
      Size = 6
    end
    object qConsultaResultadosPRO_COD: TIntegerField
      DisplayLabel = 'Caso'
      FieldName = 'PRO_COD'
    end
  end
  object qConsultaAlelosConferencia: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = '0'
      end>
    SQL.Strings = (
      'select * from TB_ALELOS a'
      'where a.NM1_ALE = :Codigo'
      'order by 6,7')
    Left = 88
    Top = 345
    object qConsultaAlelosConferenciaCOD_ALE: TIntegerField
      FieldName = 'COD_ALE'
    end
    object qConsultaAlelosConferenciaNM1_ALE: TStringField
      DisplayLabel = 'Caso'
      FieldName = 'NM1_ALE'
      Size = 100
    end
    object qConsultaAlelosConferenciaNM2_ALE: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'NM2_ALE'
      Size = 100
    end
    object qConsultaAlelosConferenciaNM3_ALE: TStringField
      DisplayLabel = 'Iniciais'
      FieldName = 'NM3_ALE'
      Size = 100
    end
    object qConsultaAlelosConferenciaNM4_ALE: TStringField
      FieldName = 'NM4_ALE'
      Size = 100
    end
    object qConsultaAlelosConferenciaMAR_ALE: TStringField
      DisplayLabel = 'Marcador'
      FieldName = 'MAR_ALE'
      Size = 200
    end
    object qConsultaAlelosConferenciaAL1_ALE: TStringField
      DisplayLabel = 'Valor 1'
      FieldName = 'AL1_ALE'
      Size = 30
    end
    object qConsultaAlelosConferenciaAL2_ALE: TStringField
      DisplayLabel = 'Valor 2'
      FieldName = 'AL2_ALE'
      Size = 30
    end
    object qConsultaAlelosConferenciaORD_ALE: TIntegerField
      FieldName = 'ORD_ALE'
    end
  end
  object qExcluirCaso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'delete from TB_ALELOS_RESULTADOS'
      'where PRO_COD = :Codigo')
    Left = 216
    Top = 263
  end
end
