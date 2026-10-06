object DMI: TDMI
  OnCreate = DataModuleCreate
  Height = 1045
  Width = 1933
  PixelsPerInch = 120
  object p_SCPG: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=sysdba;Data Source=SCPG;Mode=ReadWrite'
    IsolationLevel = ilReadUncommitted
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 30
    Top = 20
  end
  object qLaboratorios: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_LABORATORIOS')
    Left = 50
    Top = 100
    object qLaboratoriosLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qLaboratoriosLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qLaboratoriosLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qLaboratoriosLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qLaboratoriosLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qLaboratoriosLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qLaboratoriosLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qLaboratoriosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
  end
  object dsLaboratorios: TDataSource
    DataSet = qLaboratorios
    Left = 140
    Top = 90
  end
  object qExames: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_EXAMES')
    Left = 30
    Top = 150
    object qExamesEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qExamesEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qExamesEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qExamesEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qExamesEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qExamesEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qExamesEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qExamesEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qExamesEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      currency = True
      Precision = 18
      Size = 2
    end
    object qExamesEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      currency = True
      Precision = 18
      Size = 2
    end
    object qExamesEXA_OBSERV: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'EXA_OBSERV'
      Size = 2000
    end
  end
  object dsExames: TDataSource
    DataSet = qExames
    Left = 140
    Top = 150
  end
  object qUsuario: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_HOSTS')
    Left = 30
    Top = 360
    object qUsuarioHOS_NOME: TStringField
      FieldName = 'HOS_NOME'
      Size = 50
    end
    object qUsuarioHOS_USUA: TStringField
      FieldName = 'HOS_USUA'
    end
    object qUsuarioHOS_SENHA: TStringField
      FieldName = 'HOS_SENHA'
      Size = 10
    end
    object qUsuarioRES_COD: TIntegerField
      FieldName = 'RES_COD'
    end
    object qUsuarioHOS_MAQUI: TStringField
      FieldName = 'HOS_MAQUI'
    end
  end
  object dsUsuario: TDataSource
    DataSet = qUsuario
    Left = 140
    Top = 360
  end
  object qMAX_Procedimentos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Mes'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end
      item
        Name = 'Ano'
        Attributes = [paNullable]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end>
    SQL.Strings = (
      'select count(*) Quantidade'
      'from TB_PROCEDIMENTOS p'
      'where extract(month from p.pro_dcad) = :Mes'
      'and extract(year from p.pro_dcad) = :Ano')
    Left = 460
    Top = 250
    object qMAX_ProcedimentosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object qMedico: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_MEDICOS')
    Left = 30
    Top = 420
    object qMedicoMED_CRM: TStringField
      DisplayLabel = 'CRM'
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qMedicoMED_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'MED_NOME'
      Size = 60
    end
    object qMedicoMED_CID: TStringField
      DisplayLabel = 'Cidade / Estado'
      FieldName = 'MED_CID'
      Size = 40
    end
    object qMedicoMED_COD: TIntegerField
      FieldName = 'MED_COD'
    end
  end
  object dsMedico: TDataSource
    DataSet = qMedico
    Left = 140
    Top = 410
  end
  object dsProcedimentos: TDataSource
    DataSet = qProcedimentos
    Left = 140
    Top = 290
  end
  object qProcedimentos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_PROCEDIMENTOS'
      'order by PRO_PROT')
    Left = 30
    Top = 290
    object qProcedimentosPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object qProcedimentosPRO_DCAD: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'PRO_DCAD'
    end
    object qProcedimentosPES_COD: TIntegerField
      DisplayLabel = 'Paciente'
      FieldName = 'PES_COD'
    end
    object qProcedimentosNomePaciente: TStringField
      DisplayLabel = 'Nome do Paciente'
      FieldKind = fkLookup
      FieldName = 'NomePaciente'
      LookupDataSet = qPacientes
      LookupKeyFields = 'PES_COD'
      LookupResultField = 'PES_NOME'
      KeyFields = 'PES_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qProcedimentosLAB_COD: TIntegerField
      DisplayLabel = 'Laborat'#243'rio'
      FieldName = 'LAB_COD'
    end
    object qProcedimentosNomeLab: TStringField
      DisplayLabel = 'Nome do Laborat'#243'rio'
      FieldKind = fkLookup
      FieldName = 'NomeLab'
      LookupDataSet = qLaboratorios
      LookupKeyFields = 'LAB_COD'
      LookupResultField = 'LAB_LABT'
      KeyFields = 'LAB_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qProcedimentosMED_CRM: TStringField
      DisplayLabel = 'M'#233'dico'
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qProcedimentosNomeMedico: TStringField
      DisplayLabel = 'Nome do M'#233'dico'
      FieldKind = fkLookup
      FieldName = 'NomeMedico'
      LookupDataSet = qMedico
      LookupKeyFields = 'MED_CRM'
      LookupResultField = 'MED_NOME'
      KeyFields = 'MED_CRM'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qProcedimentosEXA_COD: TStringField
      DisplayLabel = 'Exame'
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qProcedimentosDescExame: TStringField
      DisplayLabel = 'Descri'#231#227'o do Exame'
      FieldKind = fkLookup
      FieldName = 'DescExame'
      LookupDataSet = qExames
      LookupKeyFields = 'EXA_COD'
      LookupResultField = 'EXA_DESC'
      KeyFields = 'EXA_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qProcedimentosPRO_DCOL: TDateField
      DisplayLabel = 'Data Coleta'
      FieldName = 'PRO_DCOL'
    end
    object qProcedimentosPRO_DENT: TDateField
      DisplayLabel = 'Data de Entrega'
      FieldName = 'PRO_DENT'
    end
    object qProcedimentosPRO_VLOG: TBCDField
      DisplayLabel = 'Log (Resultado)'
      FieldName = 'PRO_VLOG'
      Precision = 18
      Size = 3
    end
    object qProcedimentosPRO_RESUL: TStringField
      DisplayLabel = 'Resultado'
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qProcedimentosPRO_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qProcedimentosPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qProcedimentosPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qProcedimentosPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qProcedimentosPRO_PROT: TStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qProcedimentosPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qProcedimentosPRO_DREC: TDateField
      DisplayLabel = 'Data de Recep'#231#227'o'
      FieldName = 'PRO_DREC'
    end
    object qProcedimentosPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qProcedimentosPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qProcedimentosPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object qProcedimentosPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qProcedimentosPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
      EditMask = '!90:00;1;_'
    end
    object qProcedimentosPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qProcedimentosPRO_FG_RESUL: TSmallintField
      FieldName = 'PRO_FG_RESUL'
    end
    object qProcedimentosPRO_TIPPAG: TStringField
      FieldName = 'PRO_TIPPAG'
      Size = 30
    end
    object qProcedimentosPRO_IDWEB: TIntegerField
      FieldName = 'PRO_IDWEB'
    end
    object qProcedimentosPRO_HASH: TStringField
      FieldName = 'PRO_HASH'
      Size = 255
    end
  end
  object qPacientes: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_PACIENTES'
      'order by PES_COD')
    Left = 30
    Top = 220
    object qPacientesPES_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PES_COD'
    end
    object qPacientesPES_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qPacientesPES_ESCV: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qPacientesPES_IDA: TIntegerField
      DisplayLabel = 'Idade'
      FieldName = 'PES_IDA'
    end
    object qPacientesPES_SEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qPacientesPES_DNAS: TDateField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'PES_DNAS'
    end
    object qPacientesPES_END: TStringField
      DisplayLabel = 'Logradouro'
      FieldName = 'PES_END'
      Size = 150
    end
    object qPacientesPES_CIES: TStringField
      DisplayLabel = 'Cidade / Estado'
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qPacientesPES_FRES: TStringField
      DisplayLabel = 'Telefone Residencial'
      FieldName = 'PES_FRES'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 16
    end
    object qPacientesPES_FCEL: TStringField
      DisplayLabel = 'Telefone Celular'
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qPacientesPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qPacientesPES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qPacientesPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Size = 100
    end
    object qPacientesPES_COD_INTERNET: TSmallintField
      FieldName = 'PES_COD_INTERNET'
    end
    object qPacientesPES_NUMCAR: TStringField
      FieldName = 'PES_NUMCAR'
      Size = 30
    end
    object qPacientesPES_CLAORI: TStringField
      FieldName = 'PES_CLAORI'
    end
    object qPacientesPES_RACA: TStringField
      FieldName = 'PES_RACA'
      Size = 30
    end
    object qPacientesPES_NUNEND: TStringField
      FieldName = 'PES_NUNEND'
      Size = 10
    end
    object qPacientesPES_CEP: TStringField
      FieldName = 'PES_CEP'
      Size = 10
    end
    object qPacientesPES_BAIRRO: TStringField
      FieldName = 'PES_BAIRRO'
      Size = 50
    end
    object qPacientesPES_SINTOMAS: TStringField
      FieldName = 'PES_SINTOMAS'
      Size = 200
    end
    object qPacientesPES_UF: TStringField
      FieldName = 'PES_UF'
      Size = 2
    end
    object qPacientesPES_SINTOMA1: TSmallintField
      FieldName = 'PES_SINTOMA1'
    end
    object qPacientesPES_SINTOMA2: TSmallintField
      FieldName = 'PES_SINTOMA2'
    end
    object qPacientesPES_SINTOMA3: TSmallintField
      FieldName = 'PES_SINTOMA3'
    end
    object qPacientesPES_SINTOMA4: TSmallintField
      FieldName = 'PES_SINTOMA4'
    end
    object qPacientesPES_SINTOMA5: TSmallintField
      FieldName = 'PES_SINTOMA5'
    end
    object qPacientesPES_SINTOMA6: TSmallintField
      FieldName = 'PES_SINTOMA6'
    end
    object qPacientesPES_SINTOMA7: TSmallintField
      FieldName = 'PES_SINTOMA7'
    end
    object qPacientesPES_SINTOMA8: TSmallintField
      FieldName = 'PES_SINTOMA8'
    end
    object qPacientesPES_SINTOMA9: TSmallintField
      FieldName = 'PES_SINTOMA9'
    end
    object qPacientesPES_SINTOMA10: TSmallintField
      FieldName = 'PES_SINTOMA10'
    end
    object qPacientesPES_PASS: TStringField
      FieldName = 'PES_PASS'
      Size = 30
    end
  end
  object dsPacientes: TDataSource
    DataSet = qPacientes
    Left = 140
    Top = 220
  end
  object qMAX_Pacientes: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(pes_cod) from tb_PACIENTES')
    Left = 460
    Top = 330
    object qMAX_PacientesMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMax_Laboratorio: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(lab_cod) from tb_LABORATORIOS')
    Left = 300
    Top = 410
    object qMax_LaboratorioMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMax_Restricao: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(res_cod) from tb_RESTRICAO')
    Left = 300
    Top = 490
    object qMax_RestricaoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qConsultaProcedimentos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from'
      
        'tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_' +
        'cod'
      'JOIN tb_exames e ON pr.exa_cod = e.exa_cod'
      'JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod'
      'order by PR.PRO_PROT')
    Left = 380
    Top = 30
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
    object qConsultaProcedimentosPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qConsultaProcedimentosPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qConsultaProcedimentosPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qConsultaProcedimentosPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qConsultaProcedimentosPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qConsultaProcedimentosPRO_FG_RESUL: TSmallintField
      FieldName = 'PRO_FG_RESUL'
    end
    object qConsultaProcedimentosPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qConsultaProcedimentosPRO_IDWEB: TSmallintField
      FieldName = 'PRO_IDWEB'
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
    object qConsultaProcedimentosPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qConsultaProcedimentosPES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qConsultaProcedimentosPES_COD_INTERNET: TSmallintField
      FieldName = 'PES_COD_INTERNET'
    end
    object qConsultaProcedimentosPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Size = 100
    end
    object qConsultaProcedimentosPES_NUMCAR: TStringField
      FieldName = 'PES_NUMCAR'
      Size = 30
    end
    object qConsultaProcedimentosPES_CLAORI: TStringField
      FieldName = 'PES_CLAORI'
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
    object qConsultaProcedimentosEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      Precision = 18
      Size = 2
    end
    object qConsultaProcedimentosEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      Precision = 18
      Size = 2
    end
    object qConsultaProcedimentosEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qConsultaProcedimentosEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qConsultaProcedimentosEXA_OBSERV: TStringField
      FieldName = 'EXA_OBSERV'
      Size = 2000
    end
    object qConsultaProcedimentosLAB_COD_1: TIntegerField
      FieldName = 'LAB_COD_1'
    end
    object qConsultaProcedimentosLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qConsultaProcedimentosLAB_SEXO: TStringField
      FieldName = 'LAB_SEXO'
      Size = 10
    end
    object qConsultaProcedimentosLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qConsultaProcedimentosLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qConsultaProcedimentosLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qConsultaProcedimentosLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qConsultaProcedimentosLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qConsultaProcedimentosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qConsultaProcedimentosLAB_INTEXT: TStringField
      FieldName = 'LAB_INTEXT'
      Size = 8
    end
    object qConsultaProcedimentosLAB_FGVLR: TStringField
      FieldName = 'LAB_FGVLR'
      Size = 3
    end
    object qConsultaProcedimentosLAB_FGBOLETO: TStringField
      FieldName = 'LAB_FGBOLETO'
      Size = 3
    end
    object qConsultaProcedimentosCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qConsultaProcedimentosLAB_FG_EXPORTA: TIntegerField
      FieldName = 'LAB_FG_EXPORTA'
    end
    object qConsultaProcedimentosLAB_COD_INTERNET: TSmallintField
      FieldName = 'LAB_COD_INTERNET'
    end
    object qConsultaProcedimentosLAB_RESUL_INTERNET: TSmallintField
      FieldName = 'LAB_RESUL_INTERNET'
    end
  end
  object dsConsultaProcedimentos: TDataSource
    DataSet = qConsultaProcedimentos
    Left = 380
    Top = 60
  end
  object qRelMapa: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODIGO'
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
      'where pr.PRO_COD = :CODIGO')
    Left = 750
    Top = 240
    object qRelMapaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelMapaPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qRelMapaPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qRelMapaLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qRelMapaMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qRelMapaEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qRelMapaPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qRelMapaPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qRelMapaPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qRelMapaPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qRelMapaPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qRelMapaPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qRelMapaPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qRelMapaPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qRelMapaPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qRelMapaPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qRelMapaPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelMapaPES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qRelMapaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qRelMapaPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qRelMapaPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qRelMapaPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qRelMapaPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qRelMapaPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qRelMapaPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qRelMapaPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qRelMapaPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qRelMapaEXA_COD_1: TStringField
      FieldName = 'EXA_COD_1'
      Size = 10
    end
    object qRelMapaEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qRelMapaEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qRelMapaEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qRelMapaEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qRelMapaEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qRelMapaEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qRelMapaEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qRelMapaMED_CRM_1: TStringField
      FieldName = 'MED_CRM_1'
      Size = 15
    end
    object qRelMapaMED_NOME: TStringField
      FieldName = 'MED_NOME'
      Size = 60
    end
    object qRelMapaMED_CID: TStringField
      FieldName = 'MED_CID'
      Size = 40
    end
    object qRelMapaLAB_COD_1: TIntegerField
      FieldName = 'LAB_COD_1'
    end
    object qRelMapaLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qRelMapaLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qRelMapaLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelMapaLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qRelMapaLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qRelMapaLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qRelMapaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qRelMapaPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qRelMapaPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qRelMapaPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qRelMapaPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qRelMapaPES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qRelMapaPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qRelMapaPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qRelMapaPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qRelMapaEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      Precision = 18
      Size = 2
    end
    object qRelMapaEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      Precision = 18
      Size = 2
    end
    object qRelMapaEXA_OBSERV: TStringField
      FieldName = 'EXA_OBSERV'
      Size = 2000
    end
    object qRelMapaMED_COD: TIntegerField
      FieldName = 'MED_COD'
    end
    object qRelMapaLAB_SEXO: TStringField
      FieldName = 'LAB_SEXO'
      Size = 10
    end
    object qRelMapaLAB_INTEXT: TStringField
      FieldName = 'LAB_INTEXT'
      Size = 8
    end
    object qRelMapaLAB_FGVLR: TStringField
      FieldName = 'LAB_FGVLR'
      Size = 3
    end
    object qRelMapaLAB_FGBOLETO: TStringField
      FieldName = 'LAB_FGBOLETO'
      Size = 3
    end
    object qRelMapaCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qRelMapaLAB_FG_EXPORTA: TIntegerField
      FieldName = 'LAB_FG_EXPORTA'
    end
  end
  object DSRelMapa: TDataSource
    DataSet = qRelMapa
    Left = 750
    Top = 300
  end
  object qRelLaudo: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODIGO'
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
      'where pr.PRO_COD = :CODIGO')
    Left = 850
    Top = 240
    object qRelLaudoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelLaudoPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qRelLaudoPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qRelLaudoLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qRelLaudoMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qRelLaudoEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qRelLaudoPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qRelLaudoPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qRelLaudoPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qRelLaudoPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qRelLaudoPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qRelLaudoPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qRelLaudoPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qRelLaudoPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qRelLaudoPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qRelLaudoPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qRelLaudoPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qRelLaudoPES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qRelLaudoPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qRelLaudoPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qRelLaudoPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qRelLaudoPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qRelLaudoPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qRelLaudoPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qRelLaudoPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qRelLaudoPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qRelLaudoPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qRelLaudoEXA_COD_1: TStringField
      FieldName = 'EXA_COD_1'
      Size = 10
    end
    object qRelLaudoEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qRelLaudoEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qRelLaudoEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qRelLaudoEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qRelLaudoEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qRelLaudoEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qRelLaudoEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qRelLaudoMED_CRM_1: TStringField
      FieldName = 'MED_CRM_1'
      Size = 15
    end
    object qRelLaudoMED_NOME: TStringField
      FieldName = 'MED_NOME'
      Size = 60
    end
    object qRelLaudoMED_CID: TStringField
      FieldName = 'MED_CID'
      Size = 40
    end
    object qRelLaudoLAB_COD_1: TIntegerField
      FieldName = 'LAB_COD_1'
    end
    object qRelLaudoLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qRelLaudoLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qRelLaudoLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelLaudoLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qRelLaudoLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qRelLaudoLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qRelLaudoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
  end
  object dsRelLaudo: TDataSource
    DataSet = qRelLaudo
    Left = 850
    Top = 300
  end
  object qConsultaPacientes: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_PACIENTES')
    Left = 600
    Top = 130
    object qConsultaPacientesPES_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PES_COD'
    end
    object qConsultaPacientesPES_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qConsultaPacientesPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qConsultaPacientesPES_IDA: TIntegerField
      DisplayLabel = 'Idade'
      FieldName = 'PES_IDA'
    end
    object qConsultaPacientesPES_SEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qConsultaPacientesPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qConsultaPacientesPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qConsultaPacientesPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qConsultaPacientesPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qConsultaPacientesPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
  end
  object DSConsultaPacientes: TDataSource
    DataSet = qConsultaPacientes
    Left = 740
    Top = 130
  end
  object qComprovante: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODIGO'
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
      'where pr.PRO_COD = :CODIGO')
    Left = 660
    Top = 240
    object qComprovantePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qComprovantePRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qComprovantePES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qComprovanteLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qComprovanteMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qComprovanteEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qComprovantePRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qComprovantePRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qComprovantePRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qComprovantePRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qComprovantePRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qComprovantePRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qComprovantePRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qComprovantePRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qComprovantePRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qComprovantePRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qComprovantePRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qComprovantePES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qComprovantePES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qComprovantePES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qComprovantePES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qComprovantePES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qComprovantePES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qComprovantePES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qComprovantePES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qComprovantePES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qComprovantePES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qComprovanteEXA_COD_1: TStringField
      FieldName = 'EXA_COD_1'
      Size = 10
    end
    object qComprovanteEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qComprovanteEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qComprovanteEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qComprovanteEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qComprovanteEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qComprovanteEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qComprovanteEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qComprovanteMED_CRM_1: TStringField
      FieldName = 'MED_CRM_1'
      Size = 15
    end
    object qComprovanteMED_NOME: TStringField
      FieldName = 'MED_NOME'
      Size = 60
    end
    object qComprovanteMED_CID: TStringField
      FieldName = 'MED_CID'
      Size = 40
    end
    object qComprovanteLAB_COD_1: TIntegerField
      FieldName = 'LAB_COD_1'
    end
    object qComprovanteLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qComprovanteLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qComprovanteLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qComprovanteLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qComprovanteLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qComprovanteLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qComprovanteUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qComprovantePES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qComprovantePES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qComprovantePRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qComprovantePRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qComprovantePRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qComprovantePRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qComprovantePRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qComprovanteEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      Precision = 18
      Size = 2
    end
    object qComprovanteEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      Precision = 18
      Size = 2
    end
    object qComprovanteEXA_OBSERV: TStringField
      FieldName = 'EXA_OBSERV'
      Size = 2000
    end
    object qComprovanteMED_COD: TIntegerField
      FieldName = 'MED_COD'
    end
    object qComprovanteLAB_SEXO: TStringField
      FieldName = 'LAB_SEXO'
      Size = 10
    end
    object qComprovanteLAB_INTEXT: TStringField
      FieldName = 'LAB_INTEXT'
      Size = 8
    end
    object qComprovanteLAB_FGVLR: TStringField
      FieldName = 'LAB_FGVLR'
      Size = 3
    end
    object qComprovanteLAB_FGBOLETO: TStringField
      FieldName = 'LAB_FGBOLETO'
      Size = 3
    end
    object qComprovanteCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qComprovanteLAB_FG_EXPORTA: TIntegerField
      FieldName = 'LAB_FG_EXPORTA'
    end
    object qComprovantePRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
  end
  object DSComprovante: TDataSource
    DataSet = qComprovante
    Left = 660
    Top = 300
  end
  object qRelExamesControle: TADOQuery
    Connection = p_SCPG
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
      
        'where pr.PRO_DCAD >= :DataInicio and pr.PRO_DCAD <= :DataFinal a' +
        'nd pr.LAB_COD = :Laboratorio and pc.par_onde = '#39'Infecciosas'#39' and' +
        ' pc.par_tppg not in (7) '
      '')
    Left = 600
    Top = 420
    object qRelExamesControlePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelExamesControlePRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qRelExamesControlePES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qRelExamesControleLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qRelExamesControleMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qRelExamesControleEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qRelExamesControlePRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qRelExamesControlePRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qRelExamesControlePRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qRelExamesControlePRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qRelExamesControlePRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qRelExamesControlePRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qRelExamesControlePRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qRelExamesControlePRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qRelExamesControlePES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qRelExamesControlePES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qRelExamesControlePES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qRelExamesControlePES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qRelExamesControlePES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qRelExamesControlePES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qRelExamesControlePES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qRelExamesControlePES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qRelExamesControlePES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qRelExamesControlePES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qRelExamesControleEXA_COD_1: TStringField
      FieldName = 'EXA_COD_1'
      Size = 10
    end
    object qRelExamesControleEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 60
    end
    object qRelExamesControleEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qRelExamesControleEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qRelExamesControleEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qRelExamesControleEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qRelExamesControleEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      Precision = 18
      Size = 2
    end
    object qRelExamesControleEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      Precision = 18
      Size = 2
    end
    object qRelExamesControleEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qRelExamesControleEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qRelExamesControleMED_CRM_1: TStringField
      FieldName = 'MED_CRM_1'
      Size = 15
    end
    object qRelExamesControleMED_NOME: TStringField
      FieldName = 'MED_NOME'
      Size = 60
    end
    object qRelExamesControleMED_CID: TStringField
      FieldName = 'MED_CID'
      Size = 40
    end
    object qRelExamesControleLAB_COD_1: TIntegerField
      FieldName = 'LAB_COD_1'
    end
    object qRelExamesControleLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qRelExamesControleLAB_SEXO: TStringField
      FieldName = 'LAB_SEXO'
      Size = 10
    end
    object qRelExamesControleLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qRelExamesControleLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qRelExamesControleLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qRelExamesControleLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qRelExamesControleLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qRelExamesControleUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qRelExamesControlePRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qRelExamesControleLAB_INTEXT: TStringField
      FieldName = 'LAB_INTEXT'
      Size = 8
    end
    object qRelExamesControlePRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qRelExamesControleLAB_FGVLR: TStringField
      FieldName = 'LAB_FGVLR'
      Size = 3
    end
    object qRelExamesControlePRO_COD_1: TIntegerField
      FieldName = 'PRO_COD_1'
    end
    object qRelExamesControlePAR_NPARC: TIntegerField
      FieldName = 'PAR_NPARC'
    end
    object qRelExamesControlePAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      Precision = 18
      Size = 2
    end
    object qRelExamesControlePAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
    object qRelExamesControlePAR_SIT: TIntegerField
      FieldName = 'PAR_SIT'
    end
    object qRelExamesControlePAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qRelExamesControleCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
    end
    object qRelExamesControlePAR_OBS: TStringField
      FieldName = 'PAR_OBS'
      Size = 80
    end
    object qRelExamesControlePAR_DATAPREVISTA: TDateField
      FieldName = 'PAR_DATAPREVISTA'
    end
    object qRelExamesControlePAR_ONDE: TStringField
      FieldName = 'PAR_ONDE'
    end
  end
  object DSRelExamesControle: TDataSource
    DataSet = qRelExamesControle
    Left = 600
    Top = 480
  end
  object qRelExamesControleSUM: TADOQuery
    Connection = p_SCPG
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
      'select SUM(EXA_VPAC) AS VALORTOTAL from'
      
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
        'nd pr.LAB_COD = :Laboratorio and pc.par_onde = '#39'Infecciosas'#39' and' +
        ' pc.par_tppg not in (7) '
      '')
    Left = 600
    Top = 550
    object qRelExamesControleSUMVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qExamesAnteriores: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PACIENTE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'DATAATUAL'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      
        'select p.pro_prot , p.pro_dcad, p.PRO_HCAD, e.exa_desc, p.pro_ge' +
        'no, p.pro_vlog, p.pro_uint, p.pro_resul, p.pro_cmli from tb_PROC' +
        'EDIMENTOS p, tb_EXAMES e'
      
        'where p.exa_cod=e.exa_cod and p.pes_cod = :PACIENTE and p.pro_dc' +
        'ad < :DATAATUAL')
    Left = 450
    Top = 370
    object qExamesAnterioresPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qExamesAnterioresEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qExamesAnterioresPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qExamesAnterioresPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qExamesAnterioresPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qExamesAnterioresPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qExamesAnterioresPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qExamesAnterioresPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qExamesAnterioresPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
  end
  object DSExamesAnteriores: TDataSource
    DataSet = qExamesAnteriores
    Left = 450
    Top = 430
  end
  object qJuiz: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_JUIZ'
      'order by JUI_COD')
    Left = 30
    Top = 560
    object qJuizJUI_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'JUI_COD'
    end
    object qJuizJUI_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'JUI_DESC'
      Size = 50
    end
    object qJuizJUI_SEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'JUI_SEXO'
      FixedChar = True
      Size = 1
    end
    object qJuizJUI_CARGO: TStringField
      FieldName = 'JUI_CARGO'
    end
    object qJuizJUI_TRATA: TStringField
      FieldName = 'JUI_TRATA'
      Size = 50
    end
  end
  object qHistorico: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_HISTORICO'
      'where PRO_COD = :PRO_COD'
      'order by HIS_CONTR')
    Left = 30
    Top = 630
    object qHistoricoHIS_CONTR: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'HIS_CONTR'
    end
    object qHistoricoPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object qHistoricoITE_COD: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITE_COD'
    end
    object qHistoricoHIS_DATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'HIS_DATA'
    end
    object qHistoricoHIS_DOC: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'HIS_DOC'
      Size = 10
    end
    object qHistoricoHIS_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'HIS_OBS'
      Size = 50
    end
    object qHistoricoDescricaodoItem: TStringField
      DisplayLabel = 'Descri'#231#227'o do Item'
      FieldKind = fkLookup
      FieldName = 'DescricaodoItem'
      LookupKeyFields = 'ITE_COD'
      LookupResultField = 'ITE_DESC'
      KeyFields = 'ITE_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
  end
  object qPessoas: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
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
    Left = 30
    Top = 690
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
      Size = 200
    end
    object qPessoasPES_SIGLA: TStringField
      FieldName = 'PES_SIGLA'
    end
    object qPessoasPES_AUTO: TStringField
      FieldName = 'PES_AUTO'
    end
  end
  object qComarca: TADOQuery
    Connection = p_SCPG
    Parameters = <>
    SQL.Strings = (
      
        'SELECT c.com_cod, c.com_desc, c.com_sigla, c.uf_sigla, e.uf_desc' +
        ' AS DESCRICAOESTADO '
      'FROM tb_COMARCA c JOIN tb_UF e ON c.uf_sigla = e.uf_sigla '
      'order by c.com_cod')
    Left = 30
    Top = 750
    object qComarcaCOM_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COM_COD'
    end
    object qComarcaCOM_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'COM_DESC'
      Size = 40
    end
    object qComarcaCOM_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'COM_SIGLA'
      Size = 2
    end
    object qComarcaUF_SIGLA: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qComarcaDESCRICAOESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'DESCRICAOESTADO'
    end
  end
  object qUF: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_UF')
    Left = 30
    Top = 500
    object qUFUF_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qUFUF_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'UF_DESC'
    end
  end
  object qMaxPessoa: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(PES_COD) from tb_PESSOAS')
    Left = 300
    Top = 630
    object qMaxPessoaMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMaxVara: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ESTADO'
        DataType = ftString
        Precision = 2
        Size = 2
        Value = ''
      end
      item
        Name = 'COMARCA'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select MAX(VAR_COD) from tb_VARAS'
      'where UF_SIGLA = :ESTADO AND COM_COD = :COMARCA')
    Left = 300
    Top = 560
    object qMaxVaraMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMaxHistorico: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(HIS_CONTR) from tb_HISTORICO')
    Left = 300
    Top = 700
    object qMaxHistoricoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMaxComarca: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ESTADO'
        DataType = ftString
        Precision = 2
        Size = 2
        Value = ''
      end>
    SQL.Strings = (
      'select max(c.COM_COD) from tb_COMARCA c'
      'where c.UF_SIGLA= :ESTADO')
    Left = 300
    Top = 770
    object qMaxComarcaMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMaxProcesso: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(PRO_COD) from tb_PROCESSO')
    Left = 450
    Top = 770
    object qMaxProcessoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qCasos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_CASOS'
      'ORDER BY CAS_CONTR')
    Left = 420
    Top = 530
    object qCasosCAS_CONTR: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CAS_CONTR'
    end
    object qCasosCAS_CODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CAS_CODIGO'
      Size = 10
    end
    object qCasosCAS_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'CAS_DESC'
      Size = 60
    end
    object qCasosCAS_SIG: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'CAS_SIG'
      Size = 5
    end
    object qCasosCAS_CAM: TStringField
      DisplayLabel = 'Caminho'
      FieldName = 'CAS_CAM'
      Size = 500
    end
    object qCasosCAS_VLRIM: TBCDField
      DisplayLabel = 'Valor (Impresso)'
      FieldName = 'CAS_VLRIM'
      currency = True
      Precision = 18
      Size = 2
    end
    object qCasosCAS_VLRWB: TBCDField
      DisplayLabel = 'Valor (WEB)'
      FieldName = 'CAS_VLRWB'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object qParcelamento: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_PARCELAS'
      'where PRO_COD = :PRO_COD')
    Left = 430
    Top = 680
    object qParcelamentoPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object qParcelamentoPAR_NPARC: TIntegerField
      DisplayLabel = 'Parcela'
      FieldName = 'PAR_NPARC'
    end
    object qParcelamentoPAR_VLR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'PAR_VLR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParcelamentoPAR_DATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'PAR_DATA'
    end
    object qParcelamentoPAR_SIT: TIntegerField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'PAR_SIT'
      OnGetText = qParcelamentoPAR_SITGetText
    end
    object qParcelamentoCONTROLE: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'CONTROLE'
    end
    object qParcelamentoPAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qParcelamentoPAR_DATAPREVISTA: TDateField
      DisplayLabel = 'Data Prevista'
      FieldName = 'PAR_DATAPREVISTA'
    end
    object qParcelamentoPAR_ONDE: TStringField
      FieldName = 'PAR_ONDE'
    end
    object qParcelamentoPAR_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'PAR_OBS'
      Size = 120
    end
  end
  object DS_Juiz: TDataSource
    DataSet = qJuiz
    Left = 140
    Top = 560
  end
  object DS_Historico: TDataSource
    DataSet = qHistorico
    Left = 140
    Top = 630
  end
  object DS_Pessoas: TDataSource
    DataSet = qPessoas
    Left = 140
    Top = 690
  end
  object DS_Comarca: TDataSource
    DataSet = qComarca
    Left = 150
    Top = 760
  end
  object DS_UF: TDataSource
    DataSet = qUF
    Left = 140
    Top = 490
  end
  object qSubCasos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_SUB_CASOS')
    Left = 490
    Top = 530
    object qSubCasosCAS_CONTR: TIntegerField
      DisplayLabel = 'Caso'
      FieldName = 'CAS_CONTR'
    end
    object qSubCasosLkp_DescCaso: TStringField
      FieldKind = fkLookup
      FieldName = 'Lkp_DescCaso'
      LookupDataSet = qCasos
      LookupKeyFields = 'CAS_CONTR'
      LookupResultField = 'CAS_DESC'
      KeyFields = 'CAS_CONTR'
      Size = 60
      Lookup = True
    end
    object qSubCasosSBC_CODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'SBC_CODIGO'
    end
    object qSubCasosSBC_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'SBC_DESC'
      Size = 60
    end
    object qSubCasosSBC_SIG: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SBC_SIG'
      Size = 5
    end
    object qSubCasosSBC_CAM: TStringField
      DisplayLabel = 'Caminho'
      FieldName = 'SBC_CAM'
      Size = 500
    end
  end
  object qu: TDataSource
    DataSet = qCasos
    Left = 420
    Top = 590
  end
  object qGeraCodSub: TADOQuery
    Connection = p_SCPG
    Parameters = <
      item
        Name = 'CAS_CONTR'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select max(SBC_CODIGO)'
      'from tb_SUB_CASOS'
      'where CAS_CONTR = :CAS_CONTR')
    Left = 940
    Top = 300
    object qGeraCodSubMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qVerificaParcelas: TADOQuery
    Connection = p_SCPG
    Parameters = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from  tb_PARCELAS '
      'where PRO_COD = :CODIGO')
    Left = 550
    Top = 230
    object qVerificaParcelasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qVerificaParcelasPAR_NPARC: TIntegerField
      FieldName = 'PAR_NPARC'
    end
    object qVerificaParcelasPAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      Precision = 18
      Size = 2
    end
    object qVerificaParcelasPAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
    object qVerificaParcelasPAR_SIT: TIntegerField
      FieldName = 'PAR_SIT'
    end
  end
  object qOficio: TADOQuery
    Connection = p_SCPG
    Parameters = <>
    SQL.Strings = (
      'select * from tb_OFICIO'
      'ORDER BY OFI_NUM')
    Left = 520
    Top = 30
    object qOficioOFI_NUM: TIntegerField
      FieldName = 'OFI_NUM'
    end
  end
  object qStatusProcessos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_Status_PROCESSOS')
    Left = 690
    Top = 40
    object qStatusProcessosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qStatusProcessosSTP_DATA: TDateField
      FieldName = 'STP_DATA'
    end
    object qStatusProcessosSTP_DESC: TStringField
      FieldName = 'STP_DESC'
      Size = 60
    end
    object qStatusProcessosSTP_STATUS: TIntegerField
      FieldName = 'STP_STATUS'
    end
  end
  object qStatusProcedimentos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_Status_PROCEDIMENTO')
    Left = 820
    Top = 30
    object qStatusProcedimentosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qStatusProcedimentosSTP_DATA: TDateField
      FieldName = 'STP_DATA'
    end
    object qStatusProcedimentosSTP_DESC: TStringField
      FieldName = 'STP_DESC'
      Size = 60
    end
    object qStatusProcedimentosSTP_STATUS: TIntegerField
      FieldName = 'STP_STATUS'
    end
  end
  object qConsultaStatusProcessos: TADOQuery
    Connection = p_SCPG
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
      'select * from tb_Status_PROCESSOS'
      'where PRO_COD = :Codigo'
      'order by stp_Status')
    Left = 910
    Top = 160
    object qConsultaStatusProcessosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaStatusProcessosSTP_DATA: TDateField
      FieldName = 'STP_DATA'
    end
    object qConsultaStatusProcessosSTP_DESC: TStringField
      FieldName = 'STP_DESC'
      Size = 60
    end
    object qConsultaStatusProcessosSTP_STATUS: TIntegerField
      FieldName = 'STP_STATUS'
    end
  end
  object qConsultaStatusProcedimentos: TADOQuery
    Connection = p_SCPG
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
      'select MAX(stp_Status) from tb_Status_PROCEdimento'
      'where PRO_COD = :Codigo')
    Left = 1080
    Top = 150
    object qConsultaStatusProcedimentosMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qSequencial: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_SEQUENCIAL')
    Left = 220
    Top = 40
    object qSequencialSEQUENCIAL: TIntegerField
      FieldName = 'SEQUENCIAL'
    end
  end
  object ds_Parcelamento: TDataSource
    DataSet = qParcelamento
    Left = 520
    Top = 680
  end
  object qConsultaLaboratorios: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_LABORATORIOS'
      'order by LAB_COD')
    Left = 810
    Top = 440
    object qConsultaLaboratoriosLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qConsultaLaboratoriosLAB_NOME: TStringField
      FieldName = 'LAB_NOME'
      Size = 60
    end
    object qConsultaLaboratoriosLAB_CRM: TStringField
      FieldName = 'LAB_CRM'
      Size = 15
    end
    object qConsultaLaboratoriosLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qConsultaLaboratoriosLAB_FONE: TStringField
      FieldName = 'LAB_FONE'
      Size = 25
    end
    object qConsultaLaboratoriosLAB_END: TStringField
      FieldName = 'LAB_END'
      Size = 80
    end
    object qConsultaLaboratoriosLAB_CID: TStringField
      FieldName = 'LAB_CID'
      Size = 40
    end
    object qConsultaLaboratoriosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
  end
  object ds_ConsultaLaboratorios: TDataSource
    DataSet = qConsultaLaboratorios
    Left = 810
    Top = 500
  end
  object qParcelamento_Infe: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    DataSource = dsProcedimentos
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_PARCELAS'
      'where PRO_COD = :PRO_COD')
    Left = 700
    Top = 720
    object qParcelamento_InfePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qParcelamento_InfePAR_NPARC: TIntegerField
      FieldName = 'PAR_NPARC'
    end
    object qParcelamento_InfePAR_VLR: TBCDField
      FieldName = 'PAR_VLR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParcelamento_InfePAR_DATA: TDateField
      FieldName = 'PAR_DATA'
    end
    object qParcelamento_InfePAR_SIT: TIntegerField
      FieldName = 'PAR_SIT'
    end
    object qParcelamento_InfePAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qParcelamento_InfeCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
    end
    object qParcelamento_InfePAR_OBS: TStringField
      FieldName = 'PAR_OBS'
      Size = 80
    end
    object qParcelamento_InfePAR_HORA: TTimeField
      FieldName = 'PAR_HORA'
    end
    object qParcelamento_InfePAR_ONDE: TStringField
      FieldName = 'PAR_ONDE'
    end
    object qParcelamento_InfePAR_DATAPREVISTA: TDateField
      FieldName = 'PAR_DATAPREVISTA'
    end
  end
  object ds_Parcelamento_Infe: TDataSource
    DataSet = qParcelamento_Infe
    Left = 790
    Top = 780
  end
  object qValorAcordo: TADOQuery
    Connection = p_SCPG
    Parameters = <
      item
        Name = 'FONTE'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'CASO'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 6
        Size = 6
        Value = Null
      end>
    SQL.Strings = (
      
        'select case when (a.aco_vlrimp is null) then 0 else a.aco_vlrimp' +
        ' end valor'
      'from tb_acordos a '
      'where a.lab_cod = :FONTE'
      'and a.cas_codigo = :CASO'
      'and a.aco_vigente = 1')
    Left = 1140
    Top = 220
    object qValorAcordoVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
    end
  end
  object qBuscaCodigo: TADOQuery
    Connection = p_SCPG
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
      'select count(*) valor from tb_processo p'
      'where p.pro_cod = :Codigo'
      '')
    Left = 970
    Top = 40
    object qBuscaCodigoVALOR: TIntegerField
      FieldName = 'VALOR'
    end
  end
  object qMAX_Medico: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(med_cod) from tb_MEDICOS'
      '')
    Left = 540
    Top = 320
    object qMAX_MedicoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qProcedimentos_Resultado: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    DataSource = dsProcedimentos
    Parameters = <
      item
        Name = 'PRO_COD'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 150001
      end>
    SQL.Strings = (
      'select * from TB_PROCEDIMENTOS_RESULTADO p'
      'where p.PRO_COD = :PRO_COD')
    Left = 290
    Top = 230
    object qProcedimentos_ResultadoPROR_COD: TIntegerField
      FieldName = 'PROR_COD'
    end
    object qProcedimentos_ResultadoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qProcedimentos_ResultadoPROR_DAT: TDateField
      FieldName = 'PROR_DAT'
    end
    object qProcedimentos_ResultadoPRO_VLOG: TBCDField
      DisplayLabel = 'Log C'#243'pias'
      FieldName = 'PRO_VLOG'
      Precision = 18
      Size = 9
    end
    object qProcedimentos_ResultadoPRO_UINT: TBCDField
      DisplayLabel = 'UI/mL'
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qProcedimentos_ResultadoPRO_CMLI: TBCDField
      DisplayLabel = 'C'#211'PIAS'
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qProcedimentos_ResultadoPRO_RESUL: TStringField
      DisplayLabel = 'Resultado'
      FieldName = 'PRO_RESUL'
      Size = 100
    end
    object qProcedimentos_ResultadoPRO_RESUL2: TStringField
      FieldName = 'PRO_RESUL2'
      Size = 100
    end
    object qProcedimentos_ResultadoPRO_RESUL3: TStringField
      FieldName = 'PRO_RESUL3'
      Size = 100
    end
    object qProcedimentos_ResultadoPRO_RESUL4: TStringField
      FieldName = 'PRO_RESUL4'
      Size = 100
    end
  end
  object DS_Procedimentos_Resultado: TDataSource
    DataSet = qProcedimentos_Resultado
    Left = 290
    Top = 290
  end
  object qVerificaResultado: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    DataSource = dsProcedimentos
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
      'select count(*) quantidade '
      'from TB_PROCEDIMENTOS_RESULTADO p'
      'where p.PRO_COD = :Codigo')
    Left = 300
    Top = 360
    object qVerificaResultadoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object ADOC_MYSQL: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=Exvt%4U4PrFRWqG;Persist Security Inf' +
      'o=True;User ID=rdcbco37_ipcms;Data Source=IPCMS_arquivos;Mode=Re' +
      'adWrite'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 126
    Top = 26
  end
  object qUsuarioWeb: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <>
    Left = 1090
    Top = 570
  end
  object qArquivosWeb: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <>
    Left = 1210
    Top = 570
  end
  object qConsultaUsuarioWeb: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select u.cod from rdcbco37_resultados.tb_usuarios_ipcms u'
      'where u.login = :login')
    Left = 1090
    Top = 640
    object qConsultaUsuarioWebcod: TAutoIncField
      FieldName = 'cod'
      ReadOnly = True
    end
  end
  object qVerificaArquivo: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = -1
        Value = ''
      end
      item
        Name = 'Data'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      'select *  from rdcbco37_resultados.tb_arquivos_ipcms a'
      'WHERE a.nome = :Nome '
      
        ' AND DATE_FORMAT(a.data_add,'#39'%d/%m/%Y'#39') = DATE_FORMAT(:Data,'#39'%d/' +
        '%m/%Y'#39')')
    Left = 1080
    Top = 720
    object qVerificaArquivocod: TAutoIncField
      FieldName = 'cod'
      ReadOnly = True
    end
    object qVerificaArquivonome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object qVerificaArquivoarquivo: TStringField
      FieldName = 'arquivo'
      Size = 100
    end
    object qVerificaArquivousuario: TIntegerField
      FieldName = 'usuario'
    end
    object qVerificaArquivodata_add: TDateTimeField
      FieldName = 'data_add'
    end
  end
  object dsInfecto: TDataSource
    DataSet = qInfecto
    Left = 1240
    Top = 400
  end
  object qInfecto: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 20080001
      end>
    SQL.Strings = (
      'select'
      'p.pro_cod,'
      'p.pro_dcol,'
      'p.pro_hcol,'
      'p.exa_cod,'
      'pa.pes_nome,'
      'P.pro_dent,'
      'p.PRO_PRAZO,'
      'P.pro_prot,'
      'l.lab_labt'
      
        'from tb_procedimentos p join tb_pacientes pa on pa.pes_cod = p.p' +
        'es_cod'
      'join tb_laboratorios l on l.lab_cod=p.lab_cod'
      'where p.pro_cod = :Codigo')
    Left = 1245
    Top = 351
    object qInfectoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qInfectoPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qInfectoPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qInfectoEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qInfectoPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qInfectoPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qInfectoPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qInfectoPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qInfectoLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
  end
  object ds_InfectoEtiquetas: TDataSource
    DataSet = qInfectoEtiquetas
    Left = 1140
    Top = 400
  end
  object qInfectoEtiquetas: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select'
      'p.pro_cod,'
      'p.pro_dcol,'
      'p.pro_hcol,'
      'p.exa_cod,'
      'pa.pes_nome,'
      'P.pro_dent,'
      'p.PRO_PRAZO,'
      'P.pro_prot,'
      'l.lab_labt'
      
        'from tb_procedimentos p join tb_pacientes pa on pa.pes_cod = p.p' +
        'es_cod'
      'join tb_laboratorios l on l.lab_cod=p.lab_cod'
      'where p.PRO_FG_RESUL = 1')
    Left = 1145
    Top = 351
    object qInfectoEtiquetasPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qInfectoEtiquetasPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qInfectoEtiquetasPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qInfectoEtiquetasEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qInfectoEtiquetasPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qInfectoEtiquetasPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qInfectoEtiquetasPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qInfectoEtiquetasPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qInfectoEtiquetasLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
  end
  object qControlaCodigoProc: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(CODIGO_PROCEDIMENTO) Codigo from TB_CONTROLE')
    Left = 790
    Top = 620
    object qControlaCodigoProcCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object qControlaCodigoPac: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(CODIGO_PACIENTE) Codigo from TB_CONTROLE')
    Left = 880
    Top = 690
    object qControlaCodigoPacCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object qConsultaUsuarioWebPASS: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'login'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    SQL.Strings = (
      'select u.cod from rdcbco37_resultados.tb_usuarios_ipcms u'
      'where (u.login = :login) ')
    Left = 1240
    Top = 660
    object qConsultaUsuarioWebPASScod: TAutoIncField
      FieldName = 'cod'
      ReadOnly = True
    end
  end
  object qPedidosWebNew: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Protocolo'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * '
      'FROM  rdcbco37_resultados.tb_pedidos_ipcms i'
      'where i.id = :Protocolo')
    Left = 950
    Top = 630
    object qPedidosWebNewid: TIntegerField
      FieldName = 'id'
    end
    object qPedidosWebNewcpf: TStringField
      FieldName = 'cpf'
      Size = 255
    end
    object qPedidosWebNewrg: TStringField
      FieldName = 'rg'
      Size = 255
    end
    object qPedidosWebNewemail: TStringField
      FieldName = 'email'
      Size = 255
    end
    object qPedidosWebNewnome_completo: TStringField
      FieldName = 'nome_completo'
      Size = 255
    end
    object qPedidosWebNewtelefone: TStringField
      FieldName = 'telefone'
      Size = 255
    end
    object qPedidosWebNewdata_de_nascimento: TDateField
      FieldName = 'data_de_nascimento'
    end
    object qPedidosWebNewnumero_do_passaporte: TStringField
      FieldName = 'numero_do_passaporte'
      Size = 255
    end
    object qPedidosWebNewdata: TDateTimeField
      FieldName = 'data'
    end
    object qPedidosWebNewruadomicilio: TStringField
      FieldName = 'ruadomicilio'
      Size = 255
    end
    object qPedidosWebNewnumerodomicilio: TStringField
      FieldName = 'numerodomicilio'
      Size = 255
    end
    object qPedidosWebNewbairroomicilio: TStringField
      FieldName = 'bairroomicilio'
      Size = 255
    end
    object qPedidosWebNewcidade: TStringField
      FieldName = 'cidade'
      Size = 255
    end
    object qPedidosWebNewuf: TStringField
      FieldName = 'uf'
      Size = 255
    end
    object qPedidosWebNewcartao: TStringField
      FieldName = 'cartao'
      Size = 255
    end
    object qPedidosWebNewraca: TStringField
      FieldName = 'raca'
      Size = 255
    end
    object qPedidosWebNewsexo: TStringField
      FieldName = 'sexo'
      Size = 255
    end
    object qPedidosWebNewestadocivil: TStringField
      FieldName = 'estadocivil'
      Size = 255
    end
    object qPedidosWebNewsintoma1: TStringField
      FieldName = 'sintoma1'
      Size = 1
    end
    object qPedidosWebNewsintoma2: TStringField
      FieldName = 'sintoma2'
      Size = 1
    end
    object qPedidosWebNewsintoma3: TStringField
      FieldName = 'sintoma3'
      Size = 1
    end
    object qPedidosWebNewsintoma4: TStringField
      FieldName = 'sintoma4'
      Size = 1
    end
    object qPedidosWebNewsintoma5: TStringField
      FieldName = 'sintoma5'
      Size = 1
    end
    object qPedidosWebNewsintoma6: TStringField
      FieldName = 'sintoma6'
      Size = 1
    end
    object qPedidosWebNewsintoma7: TStringField
      FieldName = 'sintoma7'
      Size = 1
    end
    object qPedidosWebNewsintoma8: TStringField
      FieldName = 'sintoma8'
      Size = 1
    end
    object qPedidosWebNewsintoma9: TStringField
      FieldName = 'sintoma9'
      Size = 1
    end
    object qPedidosWebNewsintoma10: TStringField
      FieldName = 'sintoma10'
      Size = 1
    end
    object qPedidosWebNewexame: TStringField
      FieldName = 'exame'
      Size = 255
    end
  end
  object qConsultaAcordos: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from VI_ACORDOS')
    Left = 970
    Top = 490
    object qConsultaAcordosCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qConsultaAcordosCAS_DESC: TStringField
      FieldName = 'CAS_DESC'
      Size = 60
    end
    object qConsultaAcordosCAS_VLRIM: TBCDField
      FieldName = 'CAS_VLRIM'
      currency = True
      Precision = 18
    end
    object qConsultaAcordosCAS_VLRWB: TBCDField
      FieldName = 'CAS_VLRWB'
      currency = True
      Precision = 18
    end
    object qConsultaAcordosLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qConsultaAcordosLAB_LABT: TStringField
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qConsultaAcordosVIGENTE: TStringField
      FieldName = 'VIGENTE'
      FixedChar = True
      Size = 3
    end
  end
  object DS_ConsultaAcordos: TDataSource
    DataSet = qConsultaAcordos
    Left = 960
    Top = 560
  end
  object qProcedimentos_Carga: TADOQuery
    Connection = p_SCPG
    CursorType = ctStatic
    DataSource = dsProcedimentos
    Parameters = <
      item
        Name = 'PRO_COD'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 150001
      end>
    SQL.Strings = (
      'select * from TB_PROCEDIMENTOS_CARGA p'
      'where p.PRO_COD = :PRO_COD')
    Left = 290
    Top = 130
    object qProcedimentos_CargaPROC_COD: TIntegerField
      FieldName = 'PROC_COD'
    end
    object qProcedimentos_CargaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qProcedimentos_CargaPROC_DATA: TDateField
      FieldName = 'PROC_DATA'
    end
    object qProcedimentos_CargaPROC_HORA: TTimeField
      FieldName = 'PROC_HORA'
    end
    object qProcedimentos_CargaHOS_USUA: TStringField
      FieldName = 'HOS_USUA'
    end
  end
  object ds_Procedimentos_Carga: TDataSource
    DataSet = qProcedimentos_Carga
    Left = 290
    Top = 190
  end
  object qPedidosWebLista: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * '
      'FROM  rdcbco37_resultados.tb_pedidos_ipcms i'
      
        'where DATE_FORMAT(i.data,'#39'%d/%m/%Y'#39') >= DATE_FORMAT(now(),'#39'%d/%m' +
        '/%Y'#39') ')
    Left = 980
    Top = 780
    object qPedidosWebListaid: TIntegerField
      FieldName = 'id'
    end
    object qPedidosWebListacpf: TStringField
      FieldName = 'cpf'
      Size = 255
    end
    object qPedidosWebListarg: TStringField
      FieldName = 'rg'
      Size = 255
    end
    object qPedidosWebListaemail: TStringField
      FieldName = 'email'
      Size = 255
    end
    object qPedidosWebListanome_completo: TStringField
      FieldName = 'nome_completo'
      Size = 255
    end
    object qPedidosWebListatelefone: TStringField
      FieldName = 'telefone'
      Size = 255
    end
    object qPedidosWebListadata_de_nascimento: TDateField
      FieldName = 'data_de_nascimento'
    end
    object qPedidosWebListanumero_do_passaporte: TStringField
      FieldName = 'numero_do_passaporte'
      Size = 255
    end
    object qPedidosWebListadata: TDateTimeField
      FieldName = 'data'
    end
    object qPedidosWebListaruadomicilio: TStringField
      FieldName = 'ruadomicilio'
      Size = 255
    end
    object qPedidosWebListanumerodomicilio: TStringField
      FieldName = 'numerodomicilio'
      Size = 255
    end
    object qPedidosWebListabairroomicilio: TStringField
      FieldName = 'bairroomicilio'
      Size = 255
    end
    object qPedidosWebListacidade: TStringField
      FieldName = 'cidade'
      Size = 255
    end
    object qPedidosWebListauf: TStringField
      FieldName = 'uf'
      Size = 255
    end
    object qPedidosWebListacartao: TStringField
      FieldName = 'cartao'
      Size = 255
    end
    object qPedidosWebListaraca: TStringField
      FieldName = 'raca'
      Size = 255
    end
    object qPedidosWebListasexo: TStringField
      FieldName = 'sexo'
      Size = 255
    end
    object qPedidosWebListaestadocivil: TStringField
      FieldName = 'estadocivil'
      Size = 255
    end
    object qPedidosWebListasintoma1: TStringField
      FieldName = 'sintoma1'
      Size = 1
    end
    object qPedidosWebListasintoma2: TStringField
      FieldName = 'sintoma2'
      Size = 1
    end
    object qPedidosWebListasintoma3: TStringField
      FieldName = 'sintoma3'
      Size = 1
    end
    object qPedidosWebListasintoma4: TStringField
      FieldName = 'sintoma4'
      Size = 1
    end
    object qPedidosWebListasintoma5: TStringField
      FieldName = 'sintoma5'
      Size = 1
    end
    object qPedidosWebListasintoma6: TStringField
      FieldName = 'sintoma6'
      Size = 1
    end
    object qPedidosWebListasintoma7: TStringField
      FieldName = 'sintoma7'
      Size = 1
    end
    object qPedidosWebListasintoma8: TStringField
      FieldName = 'sintoma8'
      Size = 1
    end
    object qPedidosWebListasintoma9: TStringField
      FieldName = 'sintoma9'
      Size = 1
    end
    object qPedidosWebListasintoma10: TStringField
      FieldName = 'sintoma10'
      Size = 1
    end
    object qPedidosWebListaexame: TStringField
      FieldName = 'exame'
      Size = 255
    end
  end
  object qQuantArquivos: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = -1
        Value = ''
      end
      item
        Name = 'Data'
        DataType = ftDateTime
        Size = -1
        Value = 0d
      end>
    SQL.Strings = (
      
        'select count(*) as quantidade from rdcbco37_resultados.tb_arquiv' +
        'os_ipcms a'
      'WHERE trim(a.nome) = :Nome '
      
        ' AND DATE_FORMAT(a.data_add,'#39'%d/%m/%Y'#39') = DATE_FORMAT(:Data,'#39'%d/' +
        '%m/%Y'#39')')
    Left = 1100
    Top = 900
    object qQuantArquivosquantidade: TLargeintField
      FieldName = 'quantidade'
      ReadOnly = True
    end
  end
  object qBuscaNumeroLabExterno: TADOQuery
    Connection = ADOC_MYSQL
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select distinct codigo from rdcbco37_resultados.tb_processos_ipc' +
        'ms ')
    Left = 732
    Top = 892
    object qBuscaNumeroLabExternocodigo: TIntegerField
      FieldName = 'codigo'
    end
  end
end
