object fImportaFacil: TfImportaFacil
  Left = 350
  Top = 137
  Caption = 'Importador Exames Covid-19'
  ClientHeight = 602
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label21: TLabel
    Left = 9
    Top = 96
    Width = 173
    Height = 13
    Caption = 'Informe o caminho do arquivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 795
    Top = 556
    Width = 73
    Height = 41
    Cursor = crHandPoint
    Hint = 'Fechar o formul'#225'rio'
    Caption = '&Fechar (Esc)'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = [fsBold]
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
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton1Click
  end
  object sbConsultar: TSpeedButton
    Left = 7
    Top = 254
    Width = 100
    Height = 30
    Caption = 'Importar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    OnClick = sbConsultarClick
  end
  object SpeedButton2: TSpeedButton
    Left = 636
    Top = 556
    Width = 153
    Height = 41
    Caption = 'Gerar Cadastros'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555550
      00555555555FFF57775F55555500050BBB0555FFF57775777775500050EEE000
      777057775777777775F709990777777770F0777775FFFFFFF7F7099990000000
      F0F07F5557777777F7F70FFFFFFFFFF0F0F07F5555555557F7F70FFFFFFFFFF0
      F0F07F5555555557F7F70FFFFFFFFFF0F0F07F5FF5FF5F57F7F70F77F77F7FF0
      F0F07F7757757557F7F70FFFFFFFFFF0F0F07F5FF5FFF557F7F70F77F777FFF0
      F0F07F7757775557F7F70FFFFFFFFFF0F0F07FF5F5F5F5F7F7F700F0F0F0F0F0
      F00577F7F7F7F7F7F77F0070707070700005777777777777777F707070707070
      55055757575757575F7555050505050500555575757575757755}
    Layout = blGlyphTop
    NumGlyphs = 2
    OnClick = SpeedButton2Click
  end
  object Label25: TLabel
    Left = 9
    Top = 137
    Width = 171
    Height = 13
    Caption = 'Informe a Origem dos exames:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object sbCLocal: TSpeedButton
    Left = 362
    Top = 151
    Width = 25
    Height = 21
    Caption = '...'
    OnClick = sbCLocalClick
  end
  object sbCaminho: TSpeedButton
    Left = 362
    Top = 112
    Width = 25
    Height = 21
    Caption = '...'
    OnClick = sbCaminhoClick
  end
  object Label1: TLabel
    Left = 9
    Top = 213
    Width = 37
    Height = 13
    Caption = 'Prazo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 9
    Top = 51
    Width = 196
    Height = 13
    Caption = 'Informe N'#250'mero do Cadastro Web:'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 9
    Top = 176
    Width = 245
    Height = 13
    Caption = 'Informe a Tipo do Caso para o(s) exame(s):'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 576
    Width = 325
    Height = 17
    TabOrder = 0
  end
  object RxDBLookupComboColeta: TJvDBLookupCombo
    Left = 7
    Top = 152
    Width = 352
    Height = 20
    Hint = 'Laborat'#243'rio'
    ListStyle = lsDelimited
    LookupField = 'LAB_COD'
    LookupDisplay = 'LAB_LABT'
    LookupSource = DMI.dsLaboratorios
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = False
  end
  object cb_Prazo: TComboBox
    Left = 9
    Top = 228
    Width = 145
    Height = 21
    TabOrder = 2
    Items.Strings = (
      'MESMO DIA'
      '6 HORAS'
      '24 HORAS'
      '48 HORAS'
      '72 HORAS'
      'URGENTE (3H)'
      'S'#193'BADO (3H)'
      'FINAL SEMANA (3H)')
  end
  object rg_Tipo: TRadioGroup
    Left = 8
    Top = 3
    Width = 372
    Height = 42
    Caption = 'Tipo de Importa'#231#227'o'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Simples'
      'Concentrada'
      'Web')
    TabOrder = 5
    OnClick = rg_TipoClick
  end
  object EdtProcotolo: TEdit
    Left = 8
    Top = 72
    Width = 241
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object RxDBLookupComboExame: TJvDBLookupCombo
    Left = 7
    Top = 191
    Width = 352
    Height = 20
    Hint = 'Exames'
    ListStyle = lsDelimited
    LookupField = 'EXA_COD'
    LookupDisplay = 'EXA_DESC'
    LookupSource = ds_SelExames
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TabStop = False
  end
  object edtOrigem: TJvDirectoryEdit
    Left = 9
    Top = 112
    Width = 347
    Height = 21
    TabOrder = 6
    Text = ''
  end
  object DBGrid: TDBGrid
    Left = 6
    Top = 288
    Width = 861
    Height = 262
    Color = clBtnFace
    DataSource = ds_ConsultaPedidosWeb
    DrawingStyle = gdsClassic
    GradientEndColor = clBtnFace
    GradientStartColor = clBtnFace
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridDrawColumnCell
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PWB_DCAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_DNAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAB_LABT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_FG_RESUL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_NUNCAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_RACA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_NUNEND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_BAIRRO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_SINTOMAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_UF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_END'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PWB_CIES'
        Visible = True
      end>
  end
  object qConsultaPacientes: TADOQuery
    Connection = DMI.p_SCPG
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
    Left = 800
    Top = 48
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
  object qConsultaPedidos: TADOQuery
    Connection = DMI.p_SCPG
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
    Left = 784
    Top = 294
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
  object qPedidosWeb: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_PEDIDOS_WEB pw')
    Left = 680
    Top = 120
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
    object qPedidosWebPWB_EXAME: TSmallintField
      FieldName = 'PWB_EXAME'
    end
  end
  object qPedidosWebMax: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select max(pw.PWB_COD) ULTIMO from TB_PEDIDOS_WEB pw')
    Left = 560
    Top = 198
    object qPedidosWebMaxULTIMO: TIntegerField
      FieldName = 'ULTIMO'
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
    Left = 744
    Top = 128
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
    Left = 744
    Top = 182
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
    Left = 656
    Top = 230
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
    object qPedidosWebGeraPWB_AUTOMA: TIntegerField
      FieldName = 'PWB_AUTOMA'
    end
    object qPedidosWebGeraPWB_EXAME: TSmallintField
      FieldName = 'PWB_EXAME'
    end
  end
  object qValidaPedidosWeb: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Data'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 10
        Size = 6
        Value = 0d
      end
      item
        Name = 'Pedido'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 50
        Size = 50
        Value = ''
      end
      item
        Name = 'Nome'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 100
        Size = 100
        Value = ''
      end>
    SQL.Strings = (
      'select count(*) Quantidade from TB_PEDIDOS_WEB pw'
      
        'where pw.PWB_DCAD = :Data  and pw.pwb_idpd = :Pedido and pw.pwb_' +
        'nome = :Nome')
    Left = 432
    Top = 64
    object qValidaPedidosWebQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
  object qConsultaLaboratorios: TADOQuery
    Connection = DMI.p_SCPG
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
      'select l.lab_cod from tb_laboratorios l'
      'where l.lab_cod_internet = :Codigo')
    Left = 640
    Top = 16
    object qConsultaLaboratoriosLAB_COD: TIntegerField
      FieldName = 'LAB_COD'
    end
  end
  object qAtualizaCPF: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    Left = 688
    Top = 48
  end
  object qLimpaXMarcados: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 576
    Top = 72
  end
  object qCadastraCasosLote: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TB_PEDIDOS_WEB')
    Left = 768
    Top = 246
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
  object opndlgOrigem: TOpenDialog
    DefaultExt = '*.xls'
    Filter = 'Arquivos Excel (*.xls)|*.xls|Arquivos Excel (*.xlsx)|*.xlsx'
    InitialDir = 'C:\'
    Left = 472
    Top = 40
  end
  object qDeletaPedidos: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 640
    Top = 80
  end
  object qAtualizaCodigo: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 739
    Top = 266
  end
  object qValorAcordo: TADOQuery
    Connection = DMI.p_SCPG
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
    Left = 472
    Top = 222
    object qValorAcordoVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
    end
  end
  object qSelExames: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_EXAMES'
      
        'where exa_cod in ('#39'COVID-19'#39','#39'INFLUENZA'#39','#39'COVIDINFLU'#39','#39'PNLVIRAL'#39 +
        ')')
    Left = 328
    Top = 184
    object qSelExamesEXA_COD: TStringField
      FieldName = 'EXA_COD'
      Size = 10
    end
    object qSelExamesEXA_DESC: TStringField
      FieldName = 'EXA_DESC'
      Size = 100
    end
    object qSelExamesEXA_UNM: TIntegerField
      FieldName = 'EXA_UNM'
    end
    object qSelExamesEXA_SIN: TStringField
      FieldName = 'EXA_SIN'
      Size = 50
    end
    object qSelExamesEXA_MET: TStringField
      FieldName = 'EXA_MET'
      Size = 200
    end
    object qSelExamesEXA_VRE: TStringField
      FieldName = 'EXA_VRE'
      Size = 30
    end
    object qSelExamesEXA_RECM: TStringField
      FieldName = 'EXA_RECM'
      Size = 500
    end
    object qSelExamesEXA_MATE: TStringField
      FieldName = 'EXA_MATE'
      Size = 200
    end
    object qSelExamesEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      currency = True
      Precision = 18
      Size = 2
    end
    object qSelExamesEXA_VLAB: TBCDField
      FieldName = 'EXA_VLAB'
      currency = True
      Precision = 18
      Size = 2
    end
    object qSelExamesEXA_OBSERV: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'EXA_OBSERV'
      Size = 2000
    end
  end
  object ds_SelExames: TDataSource
    DataSet = qSelExames
    Left = 352
    Top = 182
  end
  object qContadorExames: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Labo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
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
      'select count(*) Quantidade'
      'from tb_procedimentos a'
      'where a.lab_cod = :Labo'
      'and a.pro_dcad between :DataIni and :DataFim')
    Left = 512
    Top = 238
    object qContadorExamesQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
  end
end
