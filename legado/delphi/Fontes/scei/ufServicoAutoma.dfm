object fServicoAutoma: TfServicoAutoma
  Left = 70
  Top = 148
  Caption = 'Servi'#231'o Automa'
  ClientHeight = 163
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtAutormatico: TSpeedButton
    Left = 16
    Top = 16
    Width = 145
    Height = 22
    Caption = 'Ativar'
    Enabled = False
    OnClick = bbtAutormaticoClick
  end
  object qPedidosWebMax: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(pw.PWB_COD) ULTIMO from TB_PEDIDOS_WEB pw')
    Left = 32
    Top = 72
    object qPedidosWebMaxULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object qPedidosWebGera: TADOQuery
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
      'select * from TB_PEDIDOS_WEB pw'
      'where pw.PWB_COD = :Codigo')
    Left = 64
    Top = 72
    object qPedidosWebGeraPWB_COD: TIntegerField
      FieldName = 'PWB_COD'
    end
    object qPedidosWebGeraPWB_DCAD: TDateField
      FieldName = 'PWB_DCAD'
    end
    object qPedidosWebGeraPWB_PROT: TStringField
      FieldName = 'PWB_PROT'
      Size = 30
    end
    object qPedidosWebGeraPWB_IDPD: TStringField
      FieldName = 'PWB_IDPD'
      Size = 50
    end
    object qPedidosWebGeraPWB_NOME: TStringField
      FieldName = 'PWB_NOME'
      Size = 100
    end
    object qPedidosWebGeraPWB_DNAS: TDateField
      FieldName = 'PWB_DNAS'
    end
    object qPedidosWebGeraPWB_EMAIL: TStringField
      FieldName = 'PWB_EMAIL'
      Size = 70
    end
    object qPedidosWebGeraPWB_PASS: TStringField
      FieldName = 'PWB_PASS'
      Size = 30
    end
    object qPedidosWebGeraPWB_CPF: TStringField
      FieldName = 'PWB_CPF'
      Size = 30
    end
    object qPedidosWebGeraPWB_CVN: TIntegerField
      FieldName = 'PWB_CVN'
    end
    object qPedidosWebGeraPWB_TELE: TStringField
      FieldName = 'PWB_TELE'
      Size = 30
    end
    object qPedidosWebGeraPWB_SEXO: TStringField
      FieldName = 'PWB_SEXO'
      Size = 30
    end
    object qPedidosWebGeraPWB_DCOLE: TDateField
      FieldName = 'PWB_DCOLE'
    end
    object qPedidosWebGeraPWB_HCOLE: TTimeField
      FieldName = 'PWB_HCOLE'
    end
    object qPedidosWebGeraPWB_FG_RESUL: TSmallintField
      FieldName = 'PWB_FG_RESUL'
    end
    object qPedidosWebGeraPWB_RG: TStringField
      FieldName = 'PWB_RG'
      Size = 30
    end
    object qPedidosWebGeraPWB_ORD: TSmallintField
      FieldName = 'PWB_ORD'
    end
    object qPedidosWebGeraPWB_CONVENIO: TStringField
      FieldName = 'PWB_CONVENIO'
      Size = 40
    end
    object qPedidosWebGeraPWB_PRAZO: TStringField
      FieldName = 'PWB_PRAZO'
      Size = 30
    end
    object qPedidosWebGeraPWB_CLAORI: TStringField
      FieldName = 'PWB_CLAORI'
      Size = 30
    end
    object qPedidosWebGeraPWB_NUNCAR: TStringField
      FieldName = 'PWB_NUNCAR'
    end
    object qPedidosWebGeraPWB_RESULTADO: TStringField
      FieldName = 'PWB_RESULTADO'
      Size = 30
    end
    object qPedidosWebGeraPWB_RACA: TStringField
      FieldName = 'PWB_RACA'
      Size = 30
    end
    object qPedidosWebGeraPWB_NUNEND: TStringField
      FieldName = 'PWB_NUNEND'
      Size = 10
    end
    object qPedidosWebGeraPWB_CEP: TStringField
      FieldName = 'PWB_CEP'
      Size = 10
    end
    object qPedidosWebGeraPWB_BAIRRO: TStringField
      FieldName = 'PWB_BAIRRO'
      Size = 50
    end
    object qPedidosWebGeraPWB_SINTOMAS: TStringField
      FieldName = 'PWB_SINTOMAS'
      Size = 200
    end
    object qPedidosWebGeraPWB_UF: TStringField
      FieldName = 'PWB_UF'
      Size = 2
    end
    object qPedidosWebGeraPWB_END: TStringField
      FieldName = 'PWB_END'
      Size = 150
    end
    object qPedidosWebGeraPWB_CIES: TStringField
      FieldName = 'PWB_CIES'
      Size = 50
    end
    object qPedidosWebGeraPWB_ESCV: TStringField
      FieldName = 'PWB_ESCV'
    end
    object qPedidosWebGeraPWB_SINTOMA1: TSmallintField
      FieldName = 'PWB_SINTOMA1'
    end
    object qPedidosWebGeraPWB_SINTOMA2: TSmallintField
      FieldName = 'PWB_SINTOMA2'
    end
    object qPedidosWebGeraPWB_SINTOMA3: TSmallintField
      FieldName = 'PWB_SINTOMA3'
    end
    object qPedidosWebGeraPWB_SINTOMA4: TSmallintField
      FieldName = 'PWB_SINTOMA4'
    end
    object qPedidosWebGeraPWB_SINTOMA5: TSmallintField
      FieldName = 'PWB_SINTOMA5'
    end
    object qPedidosWebGeraPWB_SINTOMA6: TSmallintField
      FieldName = 'PWB_SINTOMA6'
    end
    object qPedidosWebGeraPWB_SINTOMA7: TSmallintField
      FieldName = 'PWB_SINTOMA7'
    end
    object qPedidosWebGeraPWB_SINTOMA8: TSmallintField
      FieldName = 'PWB_SINTOMA8'
    end
    object qPedidosWebGeraPWB_SINTOMA9: TSmallintField
      FieldName = 'PWB_SINTOMA9'
    end
    object qPedidosWebGeraPWB_SINTOMA10: TSmallintField
      FieldName = 'PWB_SINTOMA10'
    end
  end
  object qPedidosWeb: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_PEDIDOS_WEB pw')
    Left = 96
    Top = 72
    object qPedidosWebPWB_COD: TIntegerField
      FieldName = 'PWB_COD'
    end
    object qPedidosWebPWB_DCAD: TDateField
      FieldName = 'PWB_DCAD'
    end
    object qPedidosWebPWB_PROT: TStringField
      FieldName = 'PWB_PROT'
      Size = 30
    end
    object qPedidosWebPWB_IDPD: TStringField
      FieldName = 'PWB_IDPD'
      Size = 50
    end
    object qPedidosWebPWB_NOME: TStringField
      FieldName = 'PWB_NOME'
      Size = 100
    end
    object qPedidosWebPWB_DNAS: TDateField
      FieldName = 'PWB_DNAS'
    end
    object qPedidosWebPWB_EMAIL: TStringField
      FieldName = 'PWB_EMAIL'
      Size = 70
    end
    object qPedidosWebPWB_PASS: TStringField
      FieldName = 'PWB_PASS'
      Size = 30
    end
    object qPedidosWebPWB_CPF: TStringField
      FieldName = 'PWB_CPF'
      Size = 30
    end
    object qPedidosWebPWB_CVN: TIntegerField
      FieldName = 'PWB_CVN'
    end
    object qPedidosWebPWB_TELE: TStringField
      FieldName = 'PWB_TELE'
      Size = 30
    end
    object qPedidosWebPWB_SEXO: TStringField
      FieldName = 'PWB_SEXO'
      Size = 30
    end
    object qPedidosWebPWB_DCOLE: TDateField
      FieldName = 'PWB_DCOLE'
    end
    object qPedidosWebPWB_HCOLE: TTimeField
      FieldName = 'PWB_HCOLE'
    end
    object qPedidosWebPWB_FG_RESUL: TSmallintField
      FieldName = 'PWB_FG_RESUL'
    end
    object qPedidosWebPWB_RG: TStringField
      FieldName = 'PWB_RG'
      Size = 30
    end
    object qPedidosWebPWB_ORD: TSmallintField
      FieldName = 'PWB_ORD'
    end
    object qPedidosWebPWB_CONVENIO: TStringField
      FieldName = 'PWB_CONVENIO'
      Size = 40
    end
    object qPedidosWebPWB_PRAZO: TStringField
      FieldName = 'PWB_PRAZO'
      Size = 30
    end
    object qPedidosWebPWB_CLAORI: TStringField
      FieldName = 'PWB_CLAORI'
      Size = 30
    end
    object qPedidosWebPWB_NUNCAR: TStringField
      FieldName = 'PWB_NUNCAR'
    end
    object qPedidosWebPWB_RESULTADO: TStringField
      FieldName = 'PWB_RESULTADO'
      Size = 30
    end
    object qPedidosWebPWB_RACA: TStringField
      FieldName = 'PWB_RACA'
      Size = 30
    end
    object qPedidosWebPWB_NUNEND: TStringField
      FieldName = 'PWB_NUNEND'
      Size = 10
    end
    object qPedidosWebPWB_CEP: TStringField
      FieldName = 'PWB_CEP'
      Size = 10
    end
    object qPedidosWebPWB_BAIRRO: TStringField
      FieldName = 'PWB_BAIRRO'
      Size = 50
    end
    object qPedidosWebPWB_SINTOMAS: TStringField
      FieldName = 'PWB_SINTOMAS'
      Size = 200
    end
    object qPedidosWebPWB_UF: TStringField
      FieldName = 'PWB_UF'
      Size = 2
    end
    object qPedidosWebPWB_END: TStringField
      FieldName = 'PWB_END'
      Size = 150
    end
    object qPedidosWebPWB_CIES: TStringField
      FieldName = 'PWB_CIES'
      Size = 50
    end
    object qPedidosWebPWB_ESCV: TStringField
      FieldName = 'PWB_ESCV'
    end
    object qPedidosWebPWB_SINTOMA1: TSmallintField
      FieldName = 'PWB_SINTOMA1'
    end
    object qPedidosWebPWB_SINTOMA2: TSmallintField
      FieldName = 'PWB_SINTOMA2'
    end
    object qPedidosWebPWB_SINTOMA3: TSmallintField
      FieldName = 'PWB_SINTOMA3'
    end
    object qPedidosWebPWB_SINTOMA4: TSmallintField
      FieldName = 'PWB_SINTOMA4'
    end
    object qPedidosWebPWB_SINTOMA5: TSmallintField
      FieldName = 'PWB_SINTOMA5'
    end
    object qPedidosWebPWB_SINTOMA6: TSmallintField
      FieldName = 'PWB_SINTOMA6'
    end
    object qPedidosWebPWB_SINTOMA7: TSmallintField
      FieldName = 'PWB_SINTOMA7'
    end
    object qPedidosWebPWB_SINTOMA8: TSmallintField
      FieldName = 'PWB_SINTOMA8'
    end
    object qPedidosWebPWB_SINTOMA9: TSmallintField
      FieldName = 'PWB_SINTOMA9'
    end
    object qPedidosWebPWB_SINTOMA10: TSmallintField
      FieldName = 'PWB_SINTOMA10'
    end
    object qPedidosWebPWB_AUTOMA: TIntegerField
      FieldName = 'PWB_AUTOMA'
    end
  end
  object qCadastraCasosLote: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_PEDIDOS_WEB')
    Left = 128
    Top = 72
    object qCadastraCasosLotePWB_COD: TIntegerField
      FieldName = 'PWB_COD'
    end
    object qCadastraCasosLotePWB_DCAD: TDateField
      FieldName = 'PWB_DCAD'
    end
    object qCadastraCasosLotePWB_PROT: TStringField
      FieldName = 'PWB_PROT'
      Size = 30
    end
    object qCadastraCasosLotePWB_IDPD: TStringField
      FieldName = 'PWB_IDPD'
      Size = 50
    end
    object qCadastraCasosLotePWB_NOME: TStringField
      FieldName = 'PWB_NOME'
      Size = 100
    end
    object qCadastraCasosLotePWB_DNAS: TDateField
      FieldName = 'PWB_DNAS'
    end
    object qCadastraCasosLotePWB_EMAIL: TStringField
      FieldName = 'PWB_EMAIL'
      Size = 70
    end
    object qCadastraCasosLotePWB_PASS: TStringField
      FieldName = 'PWB_PASS'
      Size = 30
    end
    object qCadastraCasosLotePWB_CPF: TStringField
      FieldName = 'PWB_CPF'
      Size = 30
    end
    object qCadastraCasosLotePWB_CVN: TIntegerField
      FieldName = 'PWB_CVN'
    end
    object qCadastraCasosLotePWB_TELE: TStringField
      FieldName = 'PWB_TELE'
      Size = 30
    end
    object qCadastraCasosLotePWB_SEXO: TStringField
      FieldName = 'PWB_SEXO'
      Size = 30
    end
    object qCadastraCasosLotePWB_DCOLE: TDateField
      FieldName = 'PWB_DCOLE'
    end
    object qCadastraCasosLotePWB_HCOLE: TTimeField
      FieldName = 'PWB_HCOLE'
    end
    object qCadastraCasosLotePWB_FG_RESUL: TSmallintField
      FieldName = 'PWB_FG_RESUL'
    end
  end
  object qConsultaPedidosWeb: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select pw.*,'
      
        '(select l.lab_labt from tb_laboratorios l where l.lab_cod = pw.p' +
        'wb_cvn) lab_labt'
      'from TB_PEDIDOS_WEB pw'
      'order by pw.PWB_COD')
    Left = 160
    Top = 72
    object qConsultaPedidosWebPWB_DCAD: TDateField
      DisplayLabel = 'Data Coleta'
      DisplayWidth = 10
      FieldName = 'PWB_DCAD'
    end
    object qConsultaPedidosWebPWB_NOME: TStringField
      DisplayLabel = 'Paciente'
      DisplayWidth = 60
      FieldName = 'PWB_NOME'
      Size = 100
    end
    object qConsultaPedidosWebPWB_DNAS: TDateField
      DisplayLabel = 'Dt. Nascimento'
      DisplayWidth = 10
      FieldName = 'PWB_DNAS'
    end
    object qConsultaPedidosWebPWB_CPF: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 20
      FieldName = 'PWB_CPF'
      Size = 30
    end
    object qConsultaPedidosWebLAB_LABT: TStringField
      DisplayLabel = 'Conv'#234'nio'
      DisplayWidth = 28
      FieldName = 'LAB_LABT'
      Size = 60
    end
    object qConsultaPedidosWebPWB_FG_RESUL: TSmallintField
      DisplayLabel = 'Sel.'
      DisplayWidth = 2
      FieldName = 'PWB_FG_RESUL'
    end
    object qConsultaPedidosWebPWB_NUNCAR: TStringField
      DisplayWidth = 20
      FieldName = 'PWB_NUNCAR'
    end
    object qConsultaPedidosWebPWB_RACA: TStringField
      DisplayWidth = 30
      FieldName = 'PWB_RACA'
      Size = 30
    end
    object qConsultaPedidosWebPWB_NUNEND: TStringField
      DisplayWidth = 10
      FieldName = 'PWB_NUNEND'
      Size = 10
    end
    object qConsultaPedidosWebPWB_CEP: TStringField
      DisplayWidth = 10
      FieldName = 'PWB_CEP'
      Size = 10
    end
    object qConsultaPedidosWebPWB_BAIRRO: TStringField
      DisplayWidth = 50
      FieldName = 'PWB_BAIRRO'
      Size = 50
    end
    object qConsultaPedidosWebPWB_SINTOMAS: TStringField
      DisplayWidth = 200
      FieldName = 'PWB_SINTOMAS'
      Size = 200
    end
    object qConsultaPedidosWebPWB_UF: TStringField
      DisplayWidth = 2
      FieldName = 'PWB_UF'
      Size = 2
    end
    object qConsultaPedidosWebPWB_END: TStringField
      DisplayWidth = 150
      FieldName = 'PWB_END'
      Size = 150
    end
    object qConsultaPedidosWebPWB_CIES: TStringField
      DisplayWidth = 50
      FieldName = 'PWB_CIES'
      Size = 50
    end
    object qConsultaPedidosWebPWB_COD: TIntegerField
      DisplayWidth = 10
      FieldName = 'PWB_COD'
      Visible = False
    end
    object qConsultaPedidosWebPWB_PROT: TStringField
      DisplayWidth = 30
      FieldName = 'PWB_PROT'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_IDPD: TStringField
      DisplayWidth = 50
      FieldName = 'PWB_IDPD'
      Visible = False
      Size = 50
    end
    object qConsultaPedidosWebPWB_EMAIL: TStringField
      DisplayWidth = 70
      FieldName = 'PWB_EMAIL'
      Visible = False
      Size = 70
    end
    object qConsultaPedidosWebPWB_PASS: TStringField
      DisplayWidth = 30
      FieldName = 'PWB_PASS'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_CVN: TIntegerField
      DisplayWidth = 10
      FieldName = 'PWB_CVN'
      Visible = False
    end
    object qConsultaPedidosWebPWB_TELE: TStringField
      DisplayWidth = 30
      FieldName = 'PWB_TELE'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_SEXO: TStringField
      DisplayWidth = 30
      FieldName = 'PWB_SEXO'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_DCOLE: TDateField
      DisplayWidth = 10
      FieldName = 'PWB_DCOLE'
      Visible = False
    end
    object qConsultaPedidosWebPWB_HCOLE: TTimeField
      DisplayWidth = 10
      FieldName = 'PWB_HCOLE'
      Visible = False
    end
    object qConsultaPedidosWebPWB_RG: TStringField
      DisplayWidth = 30
      FieldName = 'PWB_RG'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_ORD: TSmallintField
      DisplayWidth = 10
      FieldName = 'PWB_ORD'
      Visible = False
    end
    object qConsultaPedidosWebPWB_CONVENIO: TStringField
      FieldName = 'PWB_CONVENIO'
      Visible = False
      Size = 40
    end
    object qConsultaPedidosWebPWB_PRAZO: TStringField
      FieldName = 'PWB_PRAZO'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_CLAORI: TStringField
      FieldName = 'PWB_CLAORI'
      Visible = False
      Size = 30
    end
    object qConsultaPedidosWebPWB_RESULTADO: TStringField
      FieldName = 'PWB_RESULTADO'
      Visible = False
      Size = 30
    end
  end
  object ds_ConsultaPedidosWeb: TDataSource
    DataSet = qConsultaPedidosWeb
    Left = 160
    Top = 104
  end
  object qConsultaPedidos: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 50
        Size = 50
        Value = '0'
      end
      item
        Name = 'Nome'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 60
        Size = 60
        Value = ''
      end
      item
        Name = 'Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end>
    SQL.Strings = (
      
        'select * from TB_PROCEDIMENTOS pro join tb_pacientes p on p.pes_' +
        'cod=pro.pes_cod'
      
        'where ((pro.PRO_IDWEB = :Id) or (upper(p.pes_nome) = upper(:Nome' +
        ')))'
      ' and pro.pro_drec = :Data')
    Left = 192
    Top = 72
    object qConsultaPedidosPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qConsultaPedidosPRO_DCAD: TDateField
      FieldName = 'PRO_DCAD'
    end
    object qConsultaPedidosPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qConsultaPedidosLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
    object qConsultaPedidosMED_CRM: TStringField
      FieldName = 'MED_CRM'
      Size = 15
    end
    object qConsultaPedidosEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qConsultaPedidosPRO_DCOL: TDateField
      FieldName = 'PRO_DCOL'
    end
    object qConsultaPedidosPRO_DENT: TDateField
      FieldName = 'PRO_DENT'
    end
    object qConsultaPedidosPRO_GENO: TStringField
      FieldName = 'PRO_GENO'
      Size = 50
    end
    object qConsultaPedidosPRO_VLOG: TBCDField
      FieldName = 'PRO_VLOG'
      Precision = 18
    end
    object qConsultaPedidosPRO_RESUL: TStringField
      FieldName = 'PRO_RESUL'
      Size = 30
    end
    object qConsultaPedidosPRO_OBS: TStringField
      FieldName = 'PRO_OBS'
      Size = 100
    end
    object qConsultaPedidosPRO_UINT: TBCDField
      FieldName = 'PRO_UINT'
      Precision = 18
    end
    object qConsultaPedidosPRO_CMLI: TBCDField
      FieldName = 'PRO_CMLI'
      Precision = 18
    end
    object qConsultaPedidosPRO_PROT: TStringField
      FieldName = 'PRO_PROT'
      Size = 12
    end
    object qConsultaPedidosPRO_APA: TStringField
      FieldName = 'PRO_APA'
      Size = 3
    end
    object qConsultaPedidosPRO_DREC: TDateField
      FieldName = 'PRO_DREC'
    end
    object qConsultaPedidosPRO_ATEND: TStringField
      FieldName = 'PRO_ATEND'
      Size = 40
    end
    object qConsultaPedidosPRO_TIPR: TStringField
      FieldName = 'PRO_TIPR'
      Size = 10
    end
    object qConsultaPedidosPRO_HCAD: TStringField
      FieldName = 'PRO_HCAD'
      Size = 5
    end
    object qConsultaPedidosPRO_VALOR: TBCDField
      FieldName = 'PRO_VALOR'
      Precision = 18
      Size = 2
    end
    object qConsultaPedidosPRO_HCOL: TTimeField
      FieldName = 'PRO_HCOL'
    end
    object qConsultaPedidosPRO_FG_RESUL: TSmallintField
      FieldName = 'PRO_FG_RESUL'
    end
    object qConsultaPedidosPRO_PRAZO: TStringField
      FieldName = 'PRO_PRAZO'
      Size = 30
    end
    object qConsultaPedidosPRO_IDWEB: TSmallintField
      FieldName = 'PRO_IDWEB'
    end
    object qConsultaPedidosPES_COD_1: TIntegerField
      FieldName = 'PES_COD_1'
    end
    object qConsultaPedidosPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qConsultaPedidosPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qConsultaPedidosPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qConsultaPedidosPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qConsultaPedidosPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qConsultaPedidosPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qConsultaPedidosPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qConsultaPedidosPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qConsultaPedidosPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qConsultaPedidosPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qConsultaPedidosPES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qConsultaPedidosPES_COD_INTERNET: TSmallintField
      FieldName = 'PES_COD_INTERNET'
    end
    object qConsultaPedidosPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Size = 100
    end
    object qConsultaPedidosPES_NUMCAR: TStringField
      FieldName = 'PES_NUMCAR'
      Size = 30
    end
    object qConsultaPedidosPES_CLAORI: TStringField
      FieldName = 'PES_CLAORI'
    end
  end
  object qValorAcordo: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Labo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select case when (a.aco_vlrimp is null) then 0 else a.aco_vlrimp' +
        ' end valor'
      'from tb_acordos a '
      'where a.lab_cod = :Labo'
      'and a.aco_vigente = 1'
      'and a.aco_covid = '#39'Sim'#39)
    Left = 224
    Top = 72
    object qValorAcordoVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
    end
  end
  object qConsultaPacientes: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CPF'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 15
        Size = 15
        Value = ''
      end>
    SQL.Strings = (
      'select * from TB_PACIENTES p'
      'where p.PES_CPF = :CPF')
    Left = 256
    Top = 72
    object qConsultaPacientesPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qConsultaPacientesPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qConsultaPacientesPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qConsultaPacientesPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qConsultaPacientesPES_SEXO: TStringField
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
    object qConsultaPacientesPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qConsultaPacientesPES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qConsultaPacientesPES_COD_INTERNET: TSmallintField
      FieldName = 'PES_COD_INTERNET'
    end
    object qConsultaPacientesPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Size = 100
    end
  end
  object qLimpaXMarcados: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 288
    Top = 72
  end
  object qAtualizaCodigo: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 320
    Top = 72
  end
  object Timer3: TTimer
    Interval = 10000
    OnTimer = Timer3Timer
    Left = 16
    Top = 112
  end
end
