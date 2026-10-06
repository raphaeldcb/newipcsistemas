object fColaboradorExporta: TfColaboradorExporta
  Left = 305
  Top = 205
  Caption = 'Exporta'#231#227'o arquivo Ponto'
  ClientHeight = 169
  ClientWidth = 439
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object sbExportar: TSpeedButton
    Left = 167
    Top = 111
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
    Left = 296
    Top = 111
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
    Left = 8
    Top = 61
    Width = 86
    Height = 13
    Caption = 'Informe o Destino:'
  end
  object Label2: TLabel
    Left = 9
    Top = 9
    Width = 87
    Height = 13
    Caption = 'Informe o per'#237'odo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 135
    Top = 29
    Width = 6
    Height = 13
    Caption = '&a'
  end
  object DateEditInicial: TJvDateEdit
    Left = 8
    Top = 25
    Width = 121
    Height = 21
    ShowNullDate = False
    TabOrder = 0
  end
  object DateEditFinal: TJvDateEdit
    Left = 147
    Top = 25
    Width = 121
    Height = 21
    ShowNullDate = False
    TabOrder = 1
  end
  object edtDestino: TJvDirectoryEdit
    Left = 8
    Top = 80
    Width = 369
    Height = 21
    TabOrder = 2
    Text = 'K:\CONTROLES GERENCIAIS\RH\ESPELHO'#160'PONTO'
  end
  object qExportaPonto: TADOQuery
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
      'select distinct r.rgp_pis, c.clb_nome'
      
        'from tb_registros_ponto r LEFT OUTER JOIN tb_colaborador c on c.' +
        'clb_pis=r.rgp_pis'
      'where r.rgp_dtreg between :DataIni  and :DataFim'
      'order by r.rgp_pis, r.rgp_dtreg')
    Left = 352
    Top = 40
    object qExportaPontoRGP_PIS: TStringField
      FieldName = 'RGP_PIS'
      Size = 11
    end
    object qExportaPontoCLB_NOME: TStringField
      FieldName = 'CLB_NOME'
      Size = 200
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pis'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 11
        Size = 11
        Value = ''
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
      
        'select r.rgp_seq, r.rgp_pis, r.rgp_dtreg, r.rgp_hrreg, r.rgp_dti' +
        'mp, (select * from SP_DIA_SEMANA(r.rgp_dtreg)) diadasemana'
      'from tb_registros_ponto r'
      'where r.rgp_pis = :Pis'
      'and r.rgp_dtreg between :DataIni  and :DataFim'
      'order by r.rgp_pis, r.rgp_dtreg, r.rgp_dtreg')
    Left = 104
    Top = 128
    object IntegerField1: TIntegerField
      FieldName = 'RGP_SEQ'
    end
    object StringField1: TStringField
      FieldName = 'RGP_PIS'
      Size = 11
    end
    object DateField1: TDateField
      FieldName = 'RGP_DTREG'
    end
    object TimeField1: TTimeField
      FieldName = 'RGP_HRREG'
    end
    object DateField2: TDateField
      FieldName = 'RGP_DTIMP'
    end
    object StringField2: TStringField
      FieldName = 'DIADASEMANA'
      Size = 15
    end
  end
  object qImprimeRegistro: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pis'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 11
        Size = 11
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
      
        'select r.rgp_seq, r.rgp_pis, r.rgp_dtreg, r.rgp_hrreg, r.rgp_dti' +
        'mp, (select * from SP_DIA_SEMANA(r.rgp_dtreg)) diadasemana'
      'from tb_registros_ponto r'
      'where r.rgp_pis = :Pis'
      'and r.rgp_dtreg = :Data'
      'order by r.rgp_pis, r.rgp_dtreg, r.rgp_dtreg')
    Left = 136
    Top = 120
    object qImprimeRegistroRGP_SEQ: TIntegerField
      FieldName = 'RGP_SEQ'
    end
    object qImprimeRegistroRGP_PIS: TStringField
      FieldName = 'RGP_PIS'
      Size = 11
    end
    object qImprimeRegistroRGP_DTREG: TDateField
      FieldName = 'RGP_DTREG'
    end
    object qImprimeRegistroRGP_HRREG: TTimeField
      FieldName = 'RGP_HRREG'
    end
    object qImprimeRegistroRGP_DTIMP: TDateField
      FieldName = 'RGP_DTIMP'
    end
    object qImprimeRegistroDIADASEMANA: TStringField
      FieldName = 'DIADASEMANA'
      Size = 15
    end
  end
  object qValidadeQuantReg: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Pis'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 11
        Size = 11
        Value = ''
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
      'select r.rgp_pis, r.rgp_dtreg, count(*)'
      'from tb_registros_ponto r'
      'where r.rgp_pis = :Pis'
      'and r.rgp_dtreg between :DataIni and :DataFim'
      'group by r.rgp_pis, r.rgp_dtreg')
    Left = 144
    Top = 80
    object qValidadeQuantRegRGP_PIS: TStringField
      FieldName = 'RGP_PIS'
      Size = 11
    end
    object qValidadeQuantRegRGP_DTREG: TDateField
      FieldName = 'RGP_DTREG'
    end
    object qValidadeQuantRegCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
end
