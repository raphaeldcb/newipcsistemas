object DM: TDM
  OnCreate = DataModuleCreate
  Height = 667
  Width = 1120
  object ADOC_SCPG: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=sysdba;Data Source=SCPG;Mode=ReadWrite'
    IsolationLevel = ilReadUncommitted
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 24
    Top = 17
  end
  object qRestricao: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_RESTRICAO')
    Left = 488
    Top = 153
    object qRestricaoRES_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'RES_COD'
    end
    object qRestricaoRES_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'RES_DESC'
      Size = 200
    end
  end
  object qHosts: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Usuario'
        DataType = ftString
        Precision = 20
        Size = 20
        Value = ''
      end
      item
        Name = 'Senha'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = 10
        Value = ''
      end>
    SQL.Strings = (
      'select * from tb_HOSTS'
      'where HOS_USUA = :Usuario and HOS_SENHA = :Senha'
      'and HOS_SITUACAO = 1')
    Left = 416
    Top = 153
    object qHostsHOS_NOME: TStringField
      FieldName = 'HOS_NOME'
      Size = 50
    end
    object qHostsHOS_USUA: TStringField
      FieldName = 'HOS_USUA'
    end
    object qHostsHOS_SENHA: TStringField
      FieldName = 'HOS_SENHA'
      Size = 10
    end
    object qHostsRES_COD: TIntegerField
      FieldName = 'RES_COD'
    end
    object qHostsDescRestricao: TStringField
      FieldKind = fkLookup
      FieldName = 'DescRestricao'
      LookupDataSet = qRestricao
      LookupKeyFields = 'RES_COD'
      LookupResultField = 'RES_DESC'
      KeyFields = 'RES_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qHostsHOS_MAQUI: TStringField
      FieldName = 'HOS_MAQUI'
    end
    object qHostsHOS_SITUACAO: TIntegerField
      FieldName = 'HOS_SITUACAO'
    end
    object qHostsHOS_DTULTALT: TDateField
      FieldName = 'HOS_DTULTALT'
    end
  end
  object qLocalColeta: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_LCOLETA'
      'order by LCO_COD')
    Left = 192
    Top = 161
    object qLocalColetaLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qLocalColetaLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qLocalColetaLCO_SEXO: TIntegerField
      FieldName = 'LCO_SEXO'
    end
    object qLocalColetaLCO_CRM: TStringField
      FieldName = 'LCO_CRM'
      Size = 15
    end
    object qLocalColetaLCO_LABT: TStringField
      FieldName = 'LCO_LABT'
      Size = 60
    end
    object qLocalColetaLCO_FONE: TStringField
      FieldName = 'LCO_FONE'
      Size = 25
    end
    object qLocalColetaLCO_END: TStringField
      FieldName = 'LCO_END'
      Size = 80
    end
    object qLocalColetaLCO_CID: TStringField
      FieldName = 'LCO_CID'
      Size = 40
    end
    object qLocalColetaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qLocalColetaDescricaoEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'DescricaoEstado'
      LookupDataSet = qUF
      LookupKeyFields = 'UF_SIGLA'
      LookupResultField = 'UF_DESC'
      KeyFields = 'UF_SIGLA'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qLocalColetaLCO_TLIE: TIntegerField
      FieldName = 'LCO_TLIE'
    end
    object qLocalColetaLCO_CATE: TIntegerField
      FieldName = 'LCO_CATE'
    end
    object qLocalColetaLCO_TRAT: TIntegerField
      FieldName = 'LCO_TRAT'
    end
    object qLocalColetaLCO_CEL: TStringField
      FieldName = 'LCO_CEL'
      Size = 15
    end
    object qLocalColetaLCO_RES: TStringField
      FieldName = 'LCO_RES'
      Size = 15
    end
    object qLocalColetaLCO_EMAIL: TStringField
      FieldName = 'LCO_EMAIL'
      Size = 50
    end
    object qLocalColetaLCO_SITE: TStringField
      FieldName = 'LCO_SITE'
      Size = 50
    end
    object qLocalColetaLCO_CEP: TStringField
      FieldName = 'LCO_CEP'
      Size = 12
    end
    object qLocalColetaLCO_DTRE: TDateField
      FieldName = 'LCO_DTRE'
    end
    object qLocalColetaLCO_DCAD: TDateField
      FieldName = 'LCO_DCAD'
    end
    object qLocalColetaLCO_NUMCARTCORREIO: TIntegerField
      DisplayLabel = 'N'#250'mero do Cart'#227'o do Correio'
      FieldName = 'LCO_NUMCARTCORREIO'
    end
    object qLocalColetaLCO_SITUACAO: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'LCO_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qLocalColetaLCO_DNASC: TDateField
      FieldName = 'LCO_DNASC'
    end
    object qLocalColetaLCO_BANCO: TStringField
      FieldName = 'LCO_BANCO'
    end
    object qLocalColetaLCO_AGENCIA: TStringField
      FieldName = 'LCO_AGENCIA'
    end
    object qLocalColetaLCO_CONTA: TStringField
      FieldName = 'LCO_CONTA'
      Size = 30
    end
    object qLocalColetaLCO_CPFCNPJ: TStringField
      FieldName = 'LCO_CPFCNPJ'
    end
    object qLocalColetaLCO_MINKIT: TIntegerField
      FieldName = 'LCO_MINKIT'
    end
    object qLocalColetaLCO_PIX: TStringField
      FieldName = 'LCO_PIX'
      Size = 100
    end
  end
  object qCasos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_CASOS')
    Left = 352
    Top = 153
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
    object qCasosCAS_VLR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'CAS_VLR'
      currency = True
      Precision = 18
      Size = 2
    end
    object qCasosCAS_NOME0: TStringField
      DisplayLabel = 'Nome 0'
      FieldName = 'CAS_NOME0'
      Size = 3
    end
    object qCasosCAS_NOME1: TStringField
      DisplayLabel = 'Nome 1'
      FieldName = 'CAS_NOME1'
      Size = 15
    end
    object qCasosCAS_NOME2: TStringField
      DisplayLabel = 'Nome 2'
      FieldName = 'CAS_NOME2'
      Size = 15
    end
    object qCasosCAS_NOME3: TStringField
      DisplayLabel = 'Nome 3'
      FieldName = 'CAS_NOME3'
      Size = 15
    end
    object qCasosCAS_NOME4: TStringField
      DisplayLabel = 'Nome 4'
      FieldName = 'CAS_NOME4'
      Size = 15
    end
    object qCasosCAS_SIG1: TStringField
      DisplayLabel = 'Sigla 1'
      FieldName = 'CAS_SIG1'
      Size = 5
    end
    object qCasosCAS_SIG2: TStringField
      DisplayLabel = 'Sigla 2'
      FieldName = 'CAS_SIG2'
      Size = 5
    end
    object qCasosCAS_SIG3: TStringField
      DisplayLabel = 'Sigla 3'
      FieldName = 'CAS_SIG3'
      Size = 5
    end
    object qCasosCAS_SIG4: TStringField
      DisplayLabel = 'Sigla 4'
      FieldName = 'CAS_SIG4'
      Size = 5
    end
  end
  object qVara: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select v.uf_sigla, v.var_sigla, v.var_cod, v.var_desc, v.jui_cod' +
        ', j.jui_desc,'
      
        'c.com_cod AS COM_COD, c.com_desc AS NomeComarca, e.uf_desc as De' +
        'scricaoEstado'
      
        ', VAR_END Ende_Vara, VAR_BAIRRO Bairro_Vara, VAR_CID Cidade_Vara' +
        ', VAR_CEP CEP_Vara'
      'from tb_VARAS v'
      '     JOIN tb_COMARCA c'
      '     ON v.uf_sigla = c.uf_sigla and v.com_cod = c.com_cod'
      ''
      '     JOIN tb_UF e'
      '     ON c.uf_sigla = e.uf_sigla'
      ''
      '     JOIN tb_juiz j'
      '     ON v.jui_cod=j.jui_cod')
    Left = 272
    Top = 225
    object qVaraVAR_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'VAR_SIGLA'
      Size = 3
    end
    object qVaraVAR_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'VAR_COD'
    end
    object qVaraVAR_DESC: TStringField
      DisplayLabel = 'Vara'
      FieldName = 'VAR_DESC'
      Size = 40
    end
    object qVaraJUI_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'JUI_COD'
    end
    object qVaraJUI_DESC: TStringField
      DisplayLabel = 'Juiz'
      FieldName = 'JUI_DESC'
      Size = 50
    end
    object qVaraCOM_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COM_COD'
    end
    object qVaraNOMECOMARCA: TStringField
      DisplayLabel = 'Comarca'
      FieldName = 'NOMECOMARCA'
      Size = 40
    end
    object qVaraDESCRICAOESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'DESCRICAOESTADO'
    end
    object qVaraUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qVaraENDE_VARA: TStringField
      FieldName = 'ENDE_VARA'
      Size = 80
    end
    object qVaraBAIRRO_VARA: TStringField
      FieldName = 'BAIRRO_VARA'
      Size = 40
    end
    object qVaraCIDADE_VARA: TStringField
      FieldName = 'CIDADE_VARA'
      Size = 40
    end
    object qVaraCEP_VARA: TStringField
      FieldName = 'CEP_VARA'
      EditMask = '99.999-999;1;_'
      Size = 12
    end
  end
  object qItem: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_ITEM')
    Left = 264
    Top = 289
    object qItemITE_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ITE_COD'
    end
    object qItemITE_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ITE_DESC'
      Size = 60
    end
    object qItemITE_ORG: TStringField
      DisplayLabel = 'Origem'
      FieldName = 'ITE_ORG'
      FixedChar = True
      Size = 1
    end
  end
  object qUF: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_UF')
    Left = 24
    Top = 353
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
  object qParametros: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_PARAMETRO')
    Left = 416
    Top = 217
    object qParametrosPAM_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PAM_COD'
    end
    object qParametrosPAM_DPADR: TStringField
      DisplayLabel = 'Diret'#243'rio Padr'#227'o'
      FieldName = 'PAM_DPADR'
      Size = 200
    end
    object qParametrosPAM_DDEST: TStringField
      DisplayLabel = 'Diret'#243'rio de Destino'
      FieldName = 'PAM_DDEST'
      Size = 200
    end
    object qParametrosPAM_UNID: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'PAM_UNID'
      Size = 3
    end
    object qParametrosPAM_DRCOL: TStringField
      DisplayLabel = 'Diret'#243'rio (Relat'#243'rio Coletadores)'
      FieldName = 'PAM_DRCOL'
      Size = 600
    end
    object qParametrosPAM_DPADRDG: TStringField
      DisplayLabel = 'Diret'#243'rio Padr'#227'o (Documentos Gerados)'
      FieldName = 'PAM_DPADRDG'
      Size = 200
    end
    object qParametrosPAM_DREXCEL: TStringField
      DisplayLabel = 'Diret'#243'rio Padr'#227'o (Excel do Laborat'#243'rio)'
      FieldName = 'PAM_DREXCEL'
      Size = 300
    end
    object qParametrosPAM_DIRMPEXTRACAO: TStringField
      FieldName = 'PAM_DIRMPEXTRACAO'
      Size = 300
    end
    object qParametrosPAM_DIRMPEXTRACAOXLS: TStringField
      FieldName = 'PAM_DIRMPEXTRACAOXLS'
      Size = 300
    end
    object qParametrosPAM_VLRJUD: TBCDField
      FieldName = 'PAM_VLRJUD'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParametrosPAM_VLREXTRA: TBCDField
      FieldName = 'PAM_VLREXTRA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParametrosPAM_VLRMP: TBCDField
      FieldName = 'PAM_VLRMP'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParametrosPAM_VLRDP: TBCDField
      FieldName = 'PAM_VLRDP'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParametrosPAM_VLRCT: TBCDField
      FieldName = 'PAM_VLRCT'
      currency = True
      Precision = 18
      Size = 2
    end
    object qParametrosPAM_DRPDF: TStringField
      FieldName = 'PAM_DRPDF'
      Size = 300
    end
    object qParametrosPAM_IMPETQ: TIntegerField
      FieldName = 'PAM_IMPETQ'
    end
    object qParametrosPAM_DIRDOC: TStringField
      FieldName = 'PAM_DIRDOC'
      Size = 300
    end
    object qParametrosPAM_DIRINTEGRADOC: TStringField
      FieldName = 'PAM_DIRINTEGRADOC'
      Size = 300
    end
    object qParametrosPAM_DIRINTEGRAOF: TStringField
      FieldName = 'PAM_DIRINTEGRAOF'
      Size = 300
    end
    object qParametrosPAM_ULTCRED: TIntegerField
      FieldName = 'PAM_ULTCRED'
    end
  end
  object qMaxProcesso: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(PRO_COD) from tb_PROCESSO')
    Left = 424
    Top = 247
    object qMaxProcessoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qHistorico: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_HISTORICO'
      'where PRO_COD = :PRO_COD'
      'order by HIS_CONTR')
    Left = 24
    Top = 177
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
      Size = 50
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
      LookupDataSet = qItem
      LookupKeyFields = 'ITE_COD'
      LookupResultField = 'ITE_DESC'
      KeyFields = 'ITE_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
  end
  object DS_Historico: TDataSource
    DataSet = qHistorico
    Left = 96
    Top = 177
  end
  object qRegras: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_REGRA')
    Left = 488
    Top = 217
    object qRegrasREG_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'REG_COD'
    end
    object qRegrasREG_MOD: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'REG_MOD'
    end
    object qRegrasITE_COD: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITE_COD'
    end
    object qRegrasREG_TIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'REG_TIPO'
    end
    object qRegrasREG_PASTA: TStringField
      DisplayLabel = 'Pasta'
      FieldName = 'REG_PASTA'
    end
    object qRegrasREG_CPNOM: TStringField
      DisplayLabel = 'Componente do Nome'
      FieldName = 'REG_CPNOM'
      Size = 5
    end
    object qRegrasDescricaoItem: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'DescricaoItem'
      LookupDataSet = qItem
      LookupKeyFields = 'ITE_COD'
      LookupResultField = 'ITE_DESC'
      KeyFields = 'ITE_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
  end
  object qParcelamento: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_PARCELAS'
      'where PRO_COD = :PRO_COD')
    Left = 344
    Top = 217
    object qParcelamentoPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object qParcelamentoPAR_NPARC: TIntegerField
      DisplayLabel = 'N'#250'mero da Parcela'
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
    object qParcelamentoPAR_TPPG: TStringField
      FieldName = 'PAR_TPPG'
      Size = 30
    end
    object qParcelamentoCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
    end
    object qParcelamentoPAR_OBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'PAR_OBS'
      Size = 80
    end
    object qParcelamentoPAR_HORA: TTimeField
      FieldName = 'PAR_HORA'
    end
    object qParcelamentoPAR_ONDE: TStringField
      FieldName = 'PAR_ONDE'
    end
    object qParcelamentoPAR_DATAPREVISTA: TDateField
      FieldName = 'PAR_DATAPREVISTA'
    end
    object qParcelamentoPAR_NMFOR: TStringField
      FieldName = 'PAR_NMFOR'
      Size = 100
    end
  end
  object qMaxComarca: TADOQuery
    Connection = ADOC_SCPG
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
    Left = 336
    Top = 247
    object qMaxComarcaMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qJuiz: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_JUIZ'
      'order by JUI_desc')
    Left = 24
    Top = 121
    object qJuizJUI_CREDITO: TStringField
      DisplayLabel = 'Marque X'
      DisplayWidth = 1
      FieldName = 'JUI_CREDITO'
      FixedChar = True
      Size = 1
    end
    object qJuizJUI_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'JUI_COD'
    end
    object qJuizJUI_DESC: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'JUI_DESC'
      Size = 50
    end
    object qJuizJUI_SEXO: TStringField
      DisplayLabel = 'Sexo'
      DisplayWidth = 1
      FieldName = 'JUI_SEXO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object qPessoas: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_PESSOAS'
      'where PRO_COD = :PRO_COD'
      'order by PES_COD')
    Left = 24
    Top = 233
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
    object qPessoasPES_NDOC: TStringField
      DisplayLabel = 'N'#250'mero do Documento'
      FieldName = 'PES_NDOC'
      Size = 200
    end
    object qPessoasPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qPessoasPES_INICIAIS: TStringField
      DisplayLabel = 'Iniciais'
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
  end
  object DS_Pessoas: TDataSource
    DataSet = qPessoas
    Left = 96
    Top = 225
  end
  object qMaxPessoa: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(PES_COD) from tb_PESSOAS')
    Left = 256
    Top = 247
    object qMaxPessoaMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qMaxHistorico: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <>
    SQL.Strings = (
      'select MAX(HIS_CONTR) from tb_HISTORICO')
    Left = 288
    Top = 199
    object qMaxHistoricoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object DS_Juiz: TDataSource
    DataSet = qJuiz
    Left = 96
    Top = 121
  end
  object qMaxVara: TADOQuery
    Connection = ADOC_SCPG
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
    Left = 256
    Top = 191
    object qMaxVaraMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object DS_UF: TDataSource
    DataSet = qUF
    Left = 96
    Top = 353
  end
  object qComarca: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT c.com_cod, c.com_desc, c.com_sigla, c.uf_sigla, e.uf_desc' +
        ' AS DESCRICAOESTADO '
      'FROM tb_COMARCA c JOIN tb_UF e ON c.uf_sigla = e.uf_sigla '
      'order by c.com_cod')
    Left = 24
    Top = 289
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
  object DS_Comarca: TDataSource
    DataSet = qComarca
    Left = 96
    Top = 289
  end
  object qDadosProcesso: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_DADOSPROCESSO'
      'where PRO_COD = :PRO_COD')
    Left = 192
    Top = 17
    object qDadosProcessoDPR_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'DPR_COD'
    end
    object qDadosProcessoDPR_TIA: TStringField
      DisplayLabel = 'Tipo de A'#231#227'o'
      FieldName = 'DPR_TIA'
      Size = 50
    end
    object qDadosProcessoREQTE: TStringField
      DisplayLabel = 'Requerente'
      FieldName = 'REQTE'
      Size = 100
    end
    object qDadosProcessoREQDO: TStringField
      DisplayLabel = 'Requerido'
      FieldName = 'REQDO'
      Size = 100
    end
    object qDadosProcessoPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
  end
  object DS_DadosProcesso: TDataSource
    DataSet = qDadosProcesso
    Left = 256
    Top = 17
  end
  object qMaxDadosProcesso: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select MAX(DPR_COD) from tb_DADOSPROCESSO')
    Left = 424
    Top = 191
    object qMaxDadosProcessoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qKits: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_KITS')
    Left = 202
    Top = 311
    object qKitsKIT_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'KIT_COD'
    end
    object qKitsKIT_TIP: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'KIT_TIP'
    end
    object qKitsKIT_NUM: TIntegerField
      DisplayLabel = 'N'#250'mero do Cart'#227'o'
      FieldName = 'KIT_NUM'
    end
    object qKitsCOL_COD: TIntegerField
      DisplayLabel = 'Coletador'
      FieldName = 'COL_COD'
    end
    object qKitsLkpColetador: TStringField
      FieldKind = fkLookup
      FieldName = 'LkpColetador'
      LookupDataSet = qColetador
      LookupKeyFields = 'COL_COD'
      LookupResultField = 'COL_NOME'
      KeyFields = 'COL_COD'
      LookupCache = True
      Size = 60
      Lookup = True
    end
    object qKitsKIT_DENV: TDateField
      DisplayLabel = 'Data de Envio'
      FieldName = 'KIT_DENV'
    end
    object qKitsKIT_DRET: TDateField
      DisplayLabel = 'Data de Retorno'
      FieldName = 'KIT_DRET'
    end
    object qKitsKIT_CEXA: TIntegerField
      DisplayLabel = 'C'#243'digo do Exame'
      FieldName = 'KIT_CEXA'
    end
    object qKitsKIT_STATUS: TStringField
      FieldName = 'KIT_STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object DS_Kits: TDataSource
    DataSet = qKits
    Left = 114
    Top = 215
  end
  object qColetador: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_COLETADOR'
      'order by COL_ORDEM')
    Left = 80
    Top = 391
    object qColetadorCOL_COD: TIntegerField
      FieldName = 'COL_COD'
    end
    object qColetadorCOL_ORDEM: TIntegerField
      FieldName = 'COL_ORDEM'
    end
    object qColetadorCOL_NOME: TStringField
      FieldName = 'COL_NOME'
      Size = 200
    end
  end
  object DS_Coletador: TDataSource
    DataSet = qColetador
    Left = 160
    Top = 335
  end
  object qPesquisa: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <>
    SQL.Strings = (
      'select * from tb_Pesquisa')
    Left = 192
    Top = 81
    object qPesquisaPEQ_COD: TIntegerField
      FieldName = 'PEQ_COD'
    end
    object qPesquisaPEQ_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'PEQ_NOME'
      Size = 80
    end
    object qPesquisaPEQ_NDOC: TStringField
      DisplayLabel = 'RG / Org'#227'o Emissor'
      FieldName = 'PEQ_NDOC'
      Size = 80
    end
    object qPesquisaPEQ_ESTC: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'PEQ_ESTC'
      Size = 80
    end
    object qPesquisaPEQ_DTNAS: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'PEQ_DTNAS'
    end
    object qPesquisaPEQ_LCNAS: TStringField
      DisplayLabel = 'Local de Nascimento'
      FieldName = 'PEQ_LCNAS'
      Size = 100
    end
    object qPesquisaPEQ_LCRE: TStringField
      DisplayLabel = 'Local de Residencia (Completo)'
      FieldName = 'PEQ_LCRE'
      Size = 100
    end
    object qPesquisaPEQ_FONE: TStringField
      DisplayLabel = 'Fone'
      FieldName = 'PEQ_FONE'
    end
  end
  object ds_Pesquisa: TDataSource
    DataSet = qPesquisa
    Left = 256
    Top = 81
  end
  object qMaxLocalColeta: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(LCO_COD) from tb_LCOLETA')
    Left = 504
    Top = 191
    object qMaxLocalColetaMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qEnderecos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_enderecos')
    Left = 48
    Top = 287
    object qEnderecosEND_COD: TIntegerField
      FieldName = 'END_COD'
    end
    object qEnderecosEND_LOC: TStringField
      DisplayLabel = 'Local'
      FieldName = 'END_LOC'
      Size = 60
    end
    object qEnderecosEND_NMR: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'END_NMR'
      Size = 80
    end
    object qEnderecosEND_BAI: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'END_BAI'
      Size = 30
    end
    object qEnderecosEND_END: TStringField
      DisplayLabel = 'Logradouro / N'#250'mero'
      FieldName = 'END_END'
      Size = 120
    end
    object qEnderecosEND_CID: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CID'
      Size = 40
    end
    object qEnderecosEND_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'END_CEP'
      EditMask = '00.000-000;1;_'
      Size = 40
    end
    object qEnderecosUF_SIGLA: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qEnderecosEND_TRATA: TStringField
      DisplayLabel = 'Tratamento'
      FieldName = 'END_TRATA'
      Size = 30
    end
  end
  object DS_Enderecos: TDataSource
    DataSet = qEnderecos
    Left = 88
    Top = 271
  end
  object qCorrespondencia: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_correspondencia')
    Left = 344
    Top = 289
    object qCorrespondenciaEND_COD: TIntegerField
      FieldName = 'END_COD'
    end
    object qCorrespondenciaLkp_LocalCorrespondencia: TStringField
      DisplayLabel = 'Local'
      FieldKind = fkLookup
      FieldName = 'Lkp_RespCorrespondencia'
      LookupDataSet = qEnderecos
      LookupKeyFields = 'END_COD'
      LookupResultField = 'END_NMR'
      KeyFields = 'END_COD'
      LookupCache = True
      Size = 90
      Lookup = True
    end
    object qCorrespondenciaPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qCorrespondenciaOBS: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBS'
    end
    object qCorrespondenciaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 10
    end
    object qCorrespondenciaREGCORREIO: TStringField
      DisplayLabel = 'N.'#186' Correio (Registro)'
      FieldName = 'REGCORREIO'
      Size = 14
    end
    object qCorrespondenciaCORR_DATA: TDateField
      FieldName = 'CORR_DATA'
    end
    object qCorrespondenciaCORR_USU: TStringField
      FieldName = 'CORR_USU'
    end
  end
  object qMapa_ExtAmpli: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_MAPA_EXTAMPLI')
    Left = 352
    Top = 17
    object qMapa_ExtAmpliPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qMapa_ExtAmpliMPEA_DATA: TDateField
      FieldName = 'MPEA_DATA'
    end
    object qMapa_ExtAmpliMPEA_LOTE: TIntegerField
      FieldName = 'MPEA_LOTE'
    end
    object qMapa_ExtAmpliMPEA_ORD: TIntegerField
      FieldName = 'MPEA_ORD'
    end
    object qMapa_ExtAmpliPES_INICIAIS: TStringField
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qMapa_ExtAmpliSIT_SIGLA: TStringField
      FieldName = 'SIT_SIGLA'
      Size = 5
    end
  end
  object qExtracao: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_extracao')
    Left = 352
    Top = 73
    object qExtracaoMPEA_LOTE: TIntegerField
      FieldName = 'MPEA_LOTE'
    end
    object qExtracaoEXT_COD: TIntegerField
      FieldName = 'EXT_COD'
    end
    object qExtracaoEXT_DATA: TDateField
      FieldName = 'EXT_DATA'
    end
    object qExtracaoEXT_RESP: TStringField
      FieldName = 'EXT_RESP'
    end
    object qExtracaoEXT_SUPER: TStringField
      FieldName = 'EXT_SUPER'
    end
    object qExtracaoSEQ_DTCORR: TDateField
      FieldName = 'SEQ_DTCORR'
    end
    object qExtracaoSEQ_RESP: TStringField
      FieldName = 'SEQ_RESP'
    end
    object qExtracaoSEQ_SUPER: TStringField
      FieldName = 'SEQ_SUPER'
    end
    object qExtracaoSEQ_FORLOTE: TStringField
      FieldName = 'SEQ_FORLOTE'
    end
    object qExtracaoSEQ_ILSLOTE: TStringField
      FieldName = 'SEQ_ILSLOTE'
    end
    object qExtracaoSEQ_LADLOTE: TStringField
      FieldName = 'SEQ_LADLOTE'
    end
    object qExtracaoSEQ_PIP10UL: TIntegerField
      FieldName = 'SEQ_PIP10UL'
    end
    object qExtracaoSEQ_PIP200UL: TIntegerField
      FieldName = 'SEQ_PIP200UL'
    end
    object qExtracaoSEQ_PIP1000UL: TIntegerField
      FieldName = 'SEQ_PIP1000UL'
    end
    object qExtracaoREA_FTALOTE: TStringField
      FieldName = 'REA_FTALOTE'
    end
    object qExtracaoREA_CHELEXLOTE: TStringField
      FieldName = 'REA_CHELEXLOTE'
    end
    object qExtracaoREA_AGUALOTE: TStringField
      FieldName = 'REA_AGUALOTE'
    end
    object qExtracaoAMPL_RESP: TStringField
      FieldName = 'AMPL_RESP'
    end
    object qExtracaoAMPL_SUPER: TStringField
      FieldName = 'AMPL_SUPER'
    end
    object qExtracaoAMPL_DATA: TDateField
      FieldName = 'AMPL_DATA'
    end
    object qExtracaoAMPL_KITLOTE: TStringField
      FieldName = 'AMPL_KITLOTE'
    end
    object qExtracaoAMPL_TERM9700: TIntegerField
      FieldName = 'AMPL_TERM9700'
    end
    object qExtracaoAMPL_TERM2720: TIntegerField
      FieldName = 'AMPL_TERM2720'
    end
    object qExtracaoAMPL_PIP10UL: TIntegerField
      FieldName = 'AMPL_PIP10UL'
    end
    object qExtracaoAMPL_PIP200UL: TIntegerField
      FieldName = 'AMPL_PIP200UL'
    end
    object qExtracaoAMPL_PIP1000UL: TIntegerField
      FieldName = 'AMPL_PIP1000UL'
    end
    object qExtracaoEQU_OUTROS: TStringField
      FieldName = 'EQU_OUTROS'
    end
    object qExtracaoEQU_BLCTER19: TIntegerField
      FieldName = 'EQU_BLCTER19'
    end
    object qExtracaoEQU_BLCTER20: TIntegerField
      FieldName = 'EQU_BLCTER20'
    end
    object qExtracaoEQU_VORTEX18: TIntegerField
      FieldName = 'EQU_VORTEX18'
    end
    object qExtracaoEQU_AGIMAG25: TIntegerField
      FieldName = 'EQU_AGIMAG25'
    end
    object qExtracaoEQU_BOMBVA30: TIntegerField
      FieldName = 'EQU_BOMBVA30'
    end
    object qExtracaoEQU_CENTR31: TIntegerField
      FieldName = 'EQU_CENTR31'
    end
    object qExtracaoEQU_PIP10UL: TIntegerField
      FieldName = 'EQU_PIP10UL'
    end
    object qExtracaoEQU_PIP200UL: TIntegerField
      FieldName = 'EQU_PIP200UL'
    end
    object qExtracaoEQU_PIP1000UL: TIntegerField
      FieldName = 'EQU_PIP1000UL'
    end
    object qExtracaoEQU_PIP10ULNUM: TIntegerField
      FieldName = 'EQU_PIP10ULNUM'
    end
    object qExtracaoEQU_PIP200ULNUM: TIntegerField
      FieldName = 'EQU_PIP200ULNUM'
    end
    object qExtracaoEQU_PIP1000ULNUM: TIntegerField
      FieldName = 'EQU_PIP1000ULNUM'
    end
  end
  object DS_Extracao: TDataSource
    DataSet = qExtracao
    Left = 456
    Top = 73
  end
  object DS_Mapa_ExtAmpli: TDataSource
    DataSet = qMapa_ExtAmpli
    Left = 456
    Top = 17
  end
  object qImpressoes: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_Impressoes')
    Left = 8
    Top = 375
    object qImpressoesPRO_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'PRO_COD'
    end
    object qImpressoesITE_COD: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITE_COD'
    end
    object qImpressoesIMP_TIPO: TStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'IMP_TIPO'
    end
    object qImpressoesIMP_QDFL: TIntegerField
      DisplayLabel = 'Quantidade de Folhas'
      FieldName = 'IMP_QDFL'
    end
    object qImpressoesIMP_QDIM: TIntegerField
      DisplayLabel = 'Quantidade Impressa'
      FieldName = 'IMP_QDIM'
    end
    object qImpressoesIMP_IMPR: TStringField
      DisplayLabel = 'Impressora'
      FieldName = 'IMP_IMPR'
      Size = 50
    end
    object qImpressoesIMP_DATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'IMP_DATA'
    end
    object qImpressoesIMP_CONTR: TIntegerField
      DisplayLabel = 'Controle'
      FieldName = 'IMP_CONTR'
    end
  end
  object DS_Impressoes: TDataSource
    DataSet = qImpressoes
    Left = 96
    Top = 431
  end
  object DS_LocalColeta: TDataSource
    DataSet = qLocalColeta
    Left = 272
    Top = 153
  end
  object qPessoasGrid: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select * from tb_PESSOAS p JOIN tb_SITUACAO s ON p.pes_sit=s.sit' +
        '_cod'
      'where p.pro_cod = :PRO_COD'
      'order by PES_COD')
    Left = 616
    Top = 257
    object qPessoasGridPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qPessoasGridPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qPessoasGridPES_NOME: TStringField
      DisplayLabel = 'Nome da Pessoa'
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qPessoasGridPES_INICIAIS: TStringField
      DisplayLabel = 'Iniciais'
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qPessoasGridPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
    end
    object qPessoasGridPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qPessoasGridPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qPessoasGridPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qPessoasGridPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qPessoasGridPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 200
    end
    object qPessoasGridSIT_COD: TIntegerField
      FieldName = 'SIT_COD'
    end
    object qPessoasGridSIT_NM: TStringField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SIT_NM'
    end
    object qPessoasGridSIT_SIGLA: TStringField
      FieldName = 'SIT_SIGLA'
      Size = 5
    end
    object qPessoasGridSIT_ORDEM: TIntegerField
      FieldName = 'SIT_ORDEM'
    end
  end
  object DS_PessoasGrid: TDataSource
    DataSet = qPessoasGrid
    Left = 688
    Top = 249
  end
  object qContaAlelo: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_CONTAALELO')
    Left = 272
    Top = 351
    object qContaAleloQTD_CODIGO: TIntegerField
      FieldName = 'QTD_CODIGO'
    end
  end
  object qColetadoresRelatorios: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_COLETADOR_REL'
      'order by ordem')
    Left = 568
    Top = 73
    object qColetadoresRelatoriosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qColetadoresRelatoriosORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object qColetadoresRelatoriosNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
  end
  object DSColetadoresRelatorios: TDataSource
    DataSet = qColetadoresRelatorios
    Left = 672
    Top = 73
  end
  object qColetadoresKits: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_COLETADOR'
      'order by COL_COD')
    Left = 576
    Top = 129
    object qColetadoresKitsCOL_COD: TIntegerField
      FieldName = 'COL_COD'
    end
    object qColetadoresKitsCOL_ORDEM: TIntegerField
      FieldName = 'COL_ORDEM'
    end
    object qColetadoresKitsCOL_NOME: TStringField
      FieldName = 'COL_NOME'
      Size = 200
    end
  end
  object DSColetadoresKits: TDataSource
    DataSet = qColetadoresKits
    Left = 680
    Top = 129
  end
  object qCreditos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_CREDITOS')
    Left = 456
    Top = 305
    object qCreditosID_CREDITO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_CREDITO'
    end
    object qCreditosJUI_COD: TIntegerField
      DisplayLabel = 'Juiz'
      FieldName = 'JUI_COD'
    end
    object qCreditosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qCreditosCRE_DATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'CRE_DATA'
    end
    object qCreditosPRO_DTREC: TDateField
      FieldName = 'PRO_DTREC'
    end
    object qCreditosCRED_QDCRE: TStringField
      FieldName = 'CRED_QDCRE'
      Size = 10
    end
    object qCreditosCRED_INICIAL: TIntegerField
      DisplayLabel = 'N'#250'm. Inicial'
      FieldName = 'CRED_INICIAL'
    end
    object qCreditosCRED_FINAL: TIntegerField
      DisplayLabel = 'N'#250'm. Final'
      FieldName = 'CRED_FINAL'
    end
  end
  object DS_Creditos: TDataSource
    DataSet = qCreditos
    Left = 528
    Top = 305
  end
  object qCreditos_Temporario: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_CREDITOS_TEMPORARIO')
    Left = 392
    Top = 345
    object qCreditos_TemporarioID_CREDITO: TIntegerField
      FieldName = 'ID_CREDITO'
    end
    object qCreditos_TemporarioJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qCreditos_TemporarioPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qCreditos_TemporarioCRED_QDCRE: TStringField
      FieldName = 'CRED_QDCRE'
      Size = 10
    end
    object qCreditos_TemporarioCRE_DATA: TDateField
      FieldName = 'CRE_DATA'
    end
    object qCreditos_TemporarioPRO_DTREC: TDateField
      FieldName = 'PRO_DTREC'
    end
  end
  object ds_Creditos_Temporario: TDataSource
    DataSet = qCreditos_Temporario
    Left = 528
    Top = 353
  end
  object qCompraKits: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_COMPRA_KIT'
      'order by 1')
    Left = 168
    Top = 375
    object qCompraKitsNUMERO_KIT: TIntegerField
      DisplayLabel = 'N'#250'mero Kit'
      FieldName = 'NUMERO_KIT'
    end
    object qCompraKitsNOME_SUPAI: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_SUPAI'
      Size = 60
    end
    object qCompraKitsCPF_SUPAI: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_SUPAI'
      EditMask = '000.000.000-00;1;_'
      Size = 14
    end
    object qCompraKitsENDE_SUPAI: TStringField
      DisplayLabel = 'Endere'#231'o completo'
      FieldName = 'ENDE_SUPAI'
      Size = 200
    end
    object qCompraKitsDATA_CADASTRO: TDateField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_CADASTRO'
    end
  end
  object qCasoEndereco: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = fProcessos.dsp
    Parameters = <
      item
        Name = 'PRO_COD'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_Caso_endereco'
      'where PRO_COD = :PRO_COD')
    Left = 352
    Top = 327
    object qCasoEnderecoCOR_COD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COR_COD'
    end
    object qCasoEnderecoCOR_DESTINO: TStringField
      DisplayLabel = 'Destino'
      FieldName = 'COR_DESTINO'
      Size = 60
    end
    object qCasoEnderecoCOR_END: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'COR_END'
      Size = 80
    end
    object qCasoEnderecoCOR_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'COR_BAIRRO'
      Size = 40
    end
    object qCasoEnderecoCOR_CID: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'COR_CID'
      Size = 40
    end
    object qCasoEnderecoCOR_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'COR_CEP'
      EditMask = '99.999-999;1;_'
      Size = 40
    end
    object qCasoEnderecoUF_SIGLA: TStringField
      DisplayLabel = 'UF'
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qCasoEnderecoPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
  end
  object qMaxCasoEndereco: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(COR_COD) Ultimo from tb_Caso_endereco')
    Left = 432
    Top = 327
    object qMaxCasoEnderecoULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object DS_ExtracaoCasos: TDataSource
    DataSet = qExtracaoCasos
    Left = 456
    Top = 113
  end
  object qExtracaoCasos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = DS_Extracao
    Parameters = <
      item
        Name = 'MPEA_LOTE'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_extracao_casos C'
      'WHERE C.MPEA_LOTE = :MPEA_LOTE')
    Left = 352
    Top = 113
    object qExtracaoCasosEXTC_COD: TIntegerField
      FieldName = 'EXTC_COD'
    end
    object qExtracaoCasosSUP_DATA: TDateField
      FieldName = 'SUP_DATA'
    end
    object qExtracaoCasosSUP_SUPER: TStringField
      FieldName = 'SUP_SUPER'
    end
    object qExtracaoCasosSUP_MEIOREM: TIntegerField
      FieldName = 'SUP_MEIOREM'
    end
    object qExtracaoCasosSUP_PESPARA: TStringField
      FieldName = 'SUP_PESPARA'
    end
    object qExtracaoCasosSUP_SIMGEAMO: TIntegerField
      FieldName = 'SUP_SIMGEAMO'
    end
    object qExtracaoCasosSUP_INCLMACRI: TIntegerField
      FieldName = 'SUP_INCLMACRI'
    end
    object qExtracaoCasosSUP_INCLMASUP: TIntegerField
      FieldName = 'SUP_INCLMASUP'
    end
    object qExtracaoCasosANA_DTLEIT: TDateField
      FieldName = 'ANA_DTLEIT'
    end
    object qExtracaoCasosANA_RESCONF: TStringField
      FieldName = 'ANA_RESCONF'
    end
    object qExtracaoCasosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qExtracaoCasosANA_INICONFNCONF: TIntegerField
      FieldName = 'ANA_INICONFNCONF'
    end
    object qExtracaoCasosANA_SIMGEAMO: TIntegerField
      FieldName = 'ANA_SIMGEAMO'
    end
    object qExtracaoCasosANA_INCLMACRI: TIntegerField
      FieldName = 'ANA_INCLMACRI'
    end
    object qExtracaoCasosANA_INCLMASUP: TIntegerField
      FieldName = 'ANA_INCLMASUP'
    end
    object qExtracaoCasosANA_INCLUSAO: TIntegerField
      FieldName = 'ANA_INCLUSAO'
    end
    object qExtracaoCasosANA_MUTACAO: TIntegerField
      FieldName = 'ANA_MUTACAO'
    end
    object qExtracaoCasosANA_MARCADOR: TStringField
      FieldName = 'ANA_MARCADOR'
    end
    object qExtracaoCasosANA_EXCLUSAO: TIntegerField
      FieldName = 'ANA_EXCLUSAO'
    end
    object qExtracaoCasosANA_CONTRAPROVA: TIntegerField
      FieldName = 'ANA_CONTRAPROVA'
    end
    object qExtracaoCasosANA_CONFORME: TIntegerField
      FieldName = 'ANA_CONFORME'
    end
    object qExtracaoCasosANA_REPETICAO: TIntegerField
      FieldName = 'ANA_REPETICAO'
    end
    object qExtracaoCasosANA_REPETICAOM: TIntegerField
      FieldName = 'ANA_REPETICAOM'
    end
    object qExtracaoCasosANA_REPETICAOC: TIntegerField
      FieldName = 'ANA_REPETICAOC'
    end
    object qExtracaoCasosANA_REPETICAOSP: TIntegerField
      FieldName = 'ANA_REPETICAOSP'
    end
    object qExtracaoCasosANA_OUANADP18: TIntegerField
      FieldName = 'ANA_OUANADP18'
    end
    object qExtracaoCasosANA_OUANACROY: TIntegerField
      FieldName = 'ANA_OUANACROY'
    end
    object qExtracaoCasosANA_OUANARESP: TStringField
      FieldName = 'ANA_OUANARESP'
    end
    object qExtracaoCasosANA_INCLUSIVO: TIntegerField
      FieldName = 'ANA_INCLUSIVO'
    end
    object qExtracaoCasosANA_OUANADATA: TDateField
      FieldName = 'ANA_OUANADATA'
    end
    object qExtracaoCasosANA_LADCOMPALE: TIntegerField
      FieldName = 'ANA_LADCOMPALE'
    end
    object qExtracaoCasosANA_CONTRDNA: TIntegerField
      FieldName = 'ANA_CONTRDNA'
    end
    object qExtracaoCasosMPEA_LOTE: TIntegerField
      FieldName = 'MPEA_LOTE'
    end
  end
  object qConsultaLocaisColeta: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_LCOLETA'
      'order by LCO_COD')
    Left = 200
    Top = 217
    object qConsultaLocaisColetaLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qConsultaLocaisColetaLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qConsultaLocaisColetaLCO_SEXO: TIntegerField
      FieldName = 'LCO_SEXO'
    end
    object qConsultaLocaisColetaLCO_CRM: TStringField
      FieldName = 'LCO_CRM'
      Size = 15
    end
    object qConsultaLocaisColetaLCO_LABT: TStringField
      FieldName = 'LCO_LABT'
      Size = 60
    end
    object qConsultaLocaisColetaLCO_FONE: TStringField
      FieldName = 'LCO_FONE'
      Size = 25
    end
    object qConsultaLocaisColetaLCO_END: TStringField
      FieldName = 'LCO_END'
      Size = 80
    end
    object qConsultaLocaisColetaLCO_CID: TStringField
      FieldName = 'LCO_CID'
      Size = 40
    end
    object qConsultaLocaisColetaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qConsultaLocaisColetaLCO_TLIE: TIntegerField
      FieldName = 'LCO_TLIE'
    end
    object qConsultaLocaisColetaLCO_CATE: TIntegerField
      FieldName = 'LCO_CATE'
    end
    object qConsultaLocaisColetaLCO_TRAT: TIntegerField
      FieldName = 'LCO_TRAT'
    end
    object qConsultaLocaisColetaLCO_CEL: TStringField
      FieldName = 'LCO_CEL'
      Size = 15
    end
    object qConsultaLocaisColetaLCO_RES: TStringField
      FieldName = 'LCO_RES'
      Size = 15
    end
    object qConsultaLocaisColetaLCO_EMAIL: TStringField
      FieldName = 'LCO_EMAIL'
      Size = 50
    end
    object qConsultaLocaisColetaLCO_SITE: TStringField
      FieldName = 'LCO_SITE'
      Size = 50
    end
    object qConsultaLocaisColetaLCO_CEP: TStringField
      FieldName = 'LCO_CEP'
      Size = 12
    end
    object qConsultaLocaisColetaLCO_DTRE: TDateField
      FieldName = 'LCO_DTRE'
    end
    object qConsultaLocaisColetaLCO_DCAD: TDateField
      FieldName = 'LCO_DCAD'
    end
    object qConsultaLocaisColetaLCO_NUMCARTCORREIO: TIntegerField
      FieldName = 'LCO_NUMCARTCORREIO'
    end
    object qConsultaLocaisColetaLCO_SITUACAO: TStringField
      FieldName = 'LCO_SITUACAO'
      FixedChar = True
      Size = 1
    end
    object qConsultaLocaisColetaLCO_DNASC: TDateField
      FieldName = 'LCO_DNASC'
    end
    object qConsultaLocaisColetaLCO_CPFCNPJ: TStringField
      FieldName = 'LCO_CPFCNPJ'
    end
    object qConsultaLocaisColetaLCO_BANCO: TStringField
      FieldName = 'LCO_BANCO'
    end
    object qConsultaLocaisColetaLCO_AGENCIA: TStringField
      FieldName = 'LCO_AGENCIA'
    end
    object qConsultaLocaisColetaLCO_CONTA: TStringField
      FieldName = 'LCO_CONTA'
      Size = 30
    end
  end
  object qMapa_ExtAmpli_Casos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    DataSource = DS_Mapa_ExtAmpli
    Parameters = <
      item
        Name = 'MPEA_LOTE'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_MAPA_EXTAMPLI_CASOS'
      'where MPEA_LOTE = :MPEA_LOTE')
    Left = 552
    Top = 17
    object qMapa_ExtAmpli_CasosMPEA_LOTE: TIntegerField
      FieldName = 'MPEA_LOTE'
    end
    object qMapa_ExtAmpli_CasosPRO_COD: TIntegerField
      DisplayLabel = 'Caso'
      FieldName = 'PRO_COD'
    end
    object qMapa_ExtAmpli_CasosMPEA_ORD: TIntegerField
      FieldName = 'MPEA_ORD'
    end
    object qMapa_ExtAmpli_CasosPES_INICIAIS: TStringField
      DisplayLabel = 'Iniciais'
      FieldName = 'PES_INICIAIS'
      Size = 10
    end
    object qMapa_ExtAmpli_CasosSIT_SIGLA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'SIT_SIGLA'
      Size = 5
    end
  end
  object DS_Mapa_ExtAmpli_Casos: TDataSource
    DataSet = qMapa_ExtAmpli_Casos
    Left = 656
    Top = 17
  end
  object qColaborador: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_COLABORADOR'
      'order by CLB_COD')
    Left = 584
    Top = 177
    object qColaboradorCLB_COD: TIntegerField
      FieldName = 'CLB_COD'
    end
    object qColaboradorCLB_PIS: TStringField
      FieldName = 'CLB_PIS'
      Size = 11
    end
    object qColaboradorCLB_NOME: TStringField
      FieldName = 'CLB_NOME'
      Size = 200
    end
  end
  object dsColaborador: TDataSource
    DataSet = qColaborador
    Left = 688
    Top = 177
  end
  object qMaxCreditos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(ID_CREDITO) ultimo from TB_CREDITOS')
    Left = 536
    Top = 273
    object qMaxCreditosULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object qRelCreditos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Credito'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from TB_CREDITOS'
      'where ID_CREDITO = :Credito')
    Left = 648
    Top = 361
    object qRelCreditosID_CREDITO: TIntegerField
      FieldName = 'ID_CREDITO'
    end
    object qRelCreditosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qRelCreditosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qRelCreditosCRED_QDCRE: TStringField
      FieldName = 'CRED_QDCRE'
      Size = 10
    end
    object qRelCreditosCRE_DATA: TDateField
      FieldName = 'CRE_DATA'
    end
    object qRelCreditosPRO_DTREC: TDateField
      FieldName = 'PRO_DTREC'
    end
    object qRelCreditosCRED_INICIAL: TIntegerField
      FieldName = 'CRED_INICIAL'
    end
    object qRelCreditosCRED_FINAL: TIntegerField
      FieldName = 'CRED_FINAL'
    end
  end
  object ds_RelCreditos: TDataSource
    DataSet = qRelCreditos
    Left = 744
    Top = 263
  end
  object qMaxJuiz: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(JUI_COD) ultimo from tb_JUIZ'
      '')
    Left = 64
    Top = 89
    object qMaxJuizULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object qBanco: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_banco')
    Left = 32
    Top = 441
    object qBancoCOD_BANCO: TStringField
      FieldName = 'COD_BANCO'
      Size = 3
    end
    object qBancoDESC_BANCO: TStringField
      FieldName = 'DESC_BANCO'
      Size = 50
    end
  end
  object ds_Banco: TDataSource
    DataSet = qBanco
    Left = 104
    Top = 441
  end
  object qCalcCred_BuscaProcessos: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_PROCESSO p'
      'WHERE p.FG_CALCCRED = 0 AND p.PRO_DCOLE >= ('#39'2026-04-01'#39')'
      'and p.pro_tipo = 1')
    Left = 646
    Top = 514
    object qCalcCred_BuscaProcessosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qCalcCred_BuscaProcessosPRO_ANO: TIntegerField
      FieldName = 'PRO_ANO'
    end
    object qCalcCred_BuscaProcessosPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qCalcCred_BuscaProcessosPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qCalcCred_BuscaProcessosPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qCalcCred_BuscaProcessosUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qCalcCred_BuscaProcessosCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 6
    end
    object qCalcCred_BuscaProcessosCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qCalcCred_BuscaProcessosVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qCalcCred_BuscaProcessosLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qCalcCred_BuscaProcessosPRO_HCOLE: TStringField
      FieldName = 'PRO_HCOLE'
      Size = 5
    end
    object qCalcCred_BuscaProcessosPRO_DCOLE: TDateField
      FieldName = 'PRO_DCOLE'
    end
    object qCalcCred_BuscaProcessosPRO_HREC: TStringField
      FieldName = 'PRO_HREC'
      Size = 5
    end
    object qCalcCred_BuscaProcessosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qCalcCred_BuscaProcessosPRO_DRESU: TDateField
      FieldName = 'PRO_DRESU'
    end
    object qCalcCred_BuscaProcessosPRO_SIT: TIntegerField
      FieldName = 'PRO_SIT'
    end
    object qCalcCred_BuscaProcessosPRO_NCOMP: TIntegerField
      FieldName = 'PRO_NCOMP'
    end
    object qCalcCred_BuscaProcessosPRO_RESUL: TIntegerField
      FieldName = 'PRO_RESUL'
    end
    object qCalcCred_BuscaProcessosPRO_PROB: TStringField
      FieldName = 'PRO_PROB'
      Size = 15
    end
    object qCalcCred_BuscaProcessosPRO_ARETI: TStringField
      FieldName = 'PRO_ARETI'
      Size = 100
    end
    object qCalcCred_BuscaProcessosJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
    object qCalcCred_BuscaProcessosFG_PROP: TStringField
      FieldName = 'FG_PROP'
      Size = 1
    end
    object qCalcCred_BuscaProcessosPRO_USUCAD: TStringField
      FieldName = 'PRO_USUCAD'
    end
    object qCalcCred_BuscaProcessosPRO_NUMLAUDO: TStringField
      FieldName = 'PRO_NUMLAUDO'
    end
    object qCalcCred_BuscaProcessosPRO_RASTREAR: TStringField
      FieldName = 'PRO_RASTREAR'
    end
    object qCalcCred_BuscaProcessosPRO_CARREGACREDITO: TStringField
      FieldName = 'PRO_CARREGACREDITO'
      FixedChar = True
      Size = 1
    end
    object qCalcCred_BuscaProcessosPRO_CREDITODNA: TStringField
      FieldName = 'PRO_CREDITODNA'
    end
    object qCalcCred_BuscaProcessosPRO_HTREC: TStringField
      FieldName = 'PRO_HTREC'
      Size = 5
    end
    object qCalcCred_BuscaProcessosPRO_LACRE: TStringField
      FieldName = 'PRO_LACRE'
    end
    object qCalcCred_BuscaProcessosPRO_FG_EXTERNO: TIntegerField
      FieldName = 'PRO_FG_EXTERNO'
    end
    object qCalcCred_BuscaProcessosPRO_FG_RESUL: TIntegerField
      FieldName = 'PRO_FG_RESUL'
    end
    object qCalcCred_BuscaProcessosPRO_DATA_EXTERNO: TDateField
      FieldName = 'PRO_DATA_EXTERNO'
    end
    object qCalcCred_BuscaProcessosFG_CALCCRED: TIntegerField
      FieldName = 'FG_CALCCRED'
    end
  end
  object qCalcCred_Insere: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM TB_PROCESSO_CREDITO')
    Left = 840
    Top = 480
    object qCalcCred_InserePRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qCalcCred_InsereUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qCalcCred_InsereCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qCalcCred_InsereVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qCalcCred_InsereNUM_CREDITO: TIntegerField
      FieldName = 'NUM_CREDITO'
    end
    object qCalcCred_InsereDAT_CREDITO: TDateField
      FieldName = 'DAT_CREDITO'
    end
  end
  object qCalcCred_GeraCredito: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      'SELECT'
      'UF_SIGLA'
      ', COM_COD'
      ', VAR_COD'
      ', count(*)'
      'FROM TB_PROCESSO_CREDITO'
      'WHERE NUM_CREDITO IS NULL'
      'GROUP BY '
      'UF_SIGLA'
      ', COM_COD'
      ', VAR_COD'
      'HAVING'
      'count(*) >= 10')
    Left = 565
    Top = 437
    object qCalcCred_GeraCreditoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qCalcCred_GeraCreditoCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qCalcCred_GeraCreditoVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qCalcCred_GeraCreditoCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qCalcCred_AjustaProcesso: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 443
    Top = 462
  end
  object qCalcCred_AtualizaCred: TADOQuery
    Connection = ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Sigla'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 2
        Size = 2
        Value = ''
      end
      item
        Name = 'Comarca'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'Vara'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      ''
      ''
      'SELECT FIRST 10 '
      'PRO_COD'
      'FROM TB_PROCESSO_CREDITO'
      'WHERE'
      'UF_SIGLA  = :Sigla'
      'AND COM_COD  = :Comarca'
      'AND VAR_COD  = :Vara')
    Left = 725
    Top = 443
    object qCalcCred_AtualizaCredPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
  end
end
