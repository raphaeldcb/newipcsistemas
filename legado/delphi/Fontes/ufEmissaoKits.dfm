object fEmissaoKits: TfEmissaoKits
  Left = 200
  Top = 142
  Caption = 'Emiss'#227'o de Kits'
  ClientHeight = 340
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 56
    Width = 69
    Height = 13
    Caption = #218'ltimo N'#250'mero'
  end
  object Label2: TLabel
    Left = 11
    Top = 152
    Width = 53
    Height = 13
    Caption = 'Data Envio'
  end
  object Label3: TLabel
    Left = 8
    Top = 200
    Width = 122
    Height = 13
    Caption = 'Quantidade a ser enviada'
  end
  object Label4: TLabel
    Left = 8
    Top = 104
    Width = 92
    Height = 13
    Caption = 'Informe o Coletador'
  end
  object BSair: TSpeedButton
    Left = 505
    Top = 268
    Width = 73
    Height = 57
    Caption = 'Sair'
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
    Layout = blGlyphTop
    NumGlyphs = 2
    OnClick = BSairClick
  end
  object BProcessar: TSpeedButton
    Left = 359
    Top = 268
    Width = 73
    Height = 57
    Caption = 'Processar'
    Enabled = False
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      92060000424D92060000000000001A0000000C0000001700170001001800FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFC
      FCFCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFBFBFBF5F5
      F5ECECECDBDADACECDCACCCAC8EEEEEEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFEFEFEFAFAFAF4F4F4EDEDECE0DFDE
      CFCDCAC0BAB7AFA6A0A3938C978575907F6C9E9189BAB7B3E9E9E9FEFEFEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000EBEBEAD3D1CEC2BEB9B1
      A6A0A8968EA38C80A286779F7C6C966C5A8B5D4C927A558F8964A79A91B3A8A2
      BFBAB7EAEAE9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000D1CA
      C69B7E71956F609D7867A781709A73628D6959896657886152956958A47761A5
      8471B7AAA3C0B6B1C0B8B3C1BDB9E8E8E8FCFCFCFDFDFDFFFFFFFFFFFFFFFFFF
      FFFFFF000000BBAFA9926D5F8C66558260518663558A6658926D5E987364A581
      71AE8D7FB1998EB3A49CBBB3AEB5AAA4B1A69FA89D969D9893BEBDBAD9D8D7E3
      E3E2EEEEEDF6F6F6FDFDFD000000BCAFA89D7869A78170A78778AA8F83B5A094
      BAAAA1BAAFA9B9B2AFB9B3B1B9B4B2B6B1AFB9B4B2A79C96968A81887A6F877A
      70A19C97DBDBDAEEEEEDF1F1F1F5F5F5FCFCFC000000CDC6C4C1B5B0C3BBB5C1
      BAB7BDB7B5BDB9B8BFBBBAC5C1BFCECBC9D1CECCD0CDCBCECAC8C0BCBBB5B0AD
      90847C7263586F61567A6D61AEAAA6E6E6E5FDFDFDFFFFFFFFFFFF000000EDEC
      EBD5D2D0CAC6C4D1CECCD8D5D4DAD7D5D7D4D3D6D3D2DCD9D7E0DDDCDEDCDBDC
      D9D7C4C0BF8B87829B95927F756C766A60766B6182776DA4A09CDAD9D9EDEDEC
      FCFCFC000000FEFEFEF8F7F7E6E4E3DDDAD8DCD9D7D7D4D3C6C2C1C7C3C2C9C5
      C4CBC7C6CCC8C7CDC9C87C787236332E6B6762736F6A77716B9D9795948E8B69
      645F625F5B949390F2F2F2000000FFFFFFFFFFFFFDFDFDEFEEEDE4E3E1D6D3D2
      C1BDBDC7C3C2C7C3C2C7C3C2C7C3C2C8C4C357544E1B1A18716E686A66607A76
      71CBC7C7B8B4B454514C2725225F5E5DE5E5E4000000FFFFFFFFFFFFFFFFFFFE
      FEFEF9F8F8E8E7E6D6D3D2D1CECCD2CFCDD2CFCDD2CFCDD2CFCD514E47161513
      6B67617A767093908BE3E0DFD3D0CE534F491D1C1A5C5A55E5E4E2000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBF2F1F0E4E2E1DCD9D7DDDAD8DCD9D7DC
      D9D7524E4824221F3C3A333C3A333D3B3448453E47443D2E2C271D1C1A59554E
      E6E4E2000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF9F9F9EFEE
      EDE1DEDDDAD7D5D8D5D454504A6A6660A09C999C989596928F918E898E8A868A
      86814E4B4456504AE2DFDD000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF9F8F7E2DFDDD0CDCBCDC9C854504A7E7A74B7B4B2B6B3B1B5B2
      B0B4B1AFB3AFAEB2AEAD64615B635F5AE6E5E3000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F4F3DBD8D7CAC7C55956509C9895
      DCD9D7DBD8D6DAD7D5D7D4D3D6D3D2D4D1CF6E6A6472716DEDECEC000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCE3
      E2E1696761B1AEACEFEDECEFEDECEFEDECEFEDECEEEDECEEEDEC78746E7E7C78
      EFEFEF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFDDDCDB7F7C77C2BFBEF2F1F0F3F2F1F1F0EFF2F0EFF0EEEDF0
      EEED807D778A8884F2F2F2000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E8B0ADAAE1DFDEF9F8F8F9F9F9F9F8
      F8F8F7F7FAF9F9F4F3F2A7A4A1B7B6B3FAFAFA000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFAEEEEEDF1F0F0FFFFFF000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
    Layout = blGlyphTop
    ParentFont = False
    OnClick = BProcessarClick
  end
  object BLimpar: TSpeedButton
    Left = 432
    Top = 268
    Width = 73
    Height = 57
    Caption = 'Limpar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    Layout = blGlyphTop
    NumGlyphs = 2
    OnClick = BLimparClick
  end
  object Label8: TLabel
    Left = 8
    Top = 56
    Width = 21
    Height = 13
    Caption = 'Tipo'
  end
  object EdtUltimoNumero: TEdit
    Left = 56
    Top = 72
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 425
    Height = 41
    Caption = 'Tipo'
    Columns = 2
    Items.Strings = (
      'B'#225'sico'
      'Reconstru'#231#227'o')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object EdtQuantidade: TEdit
    Left = 7
    Top = 217
    Width = 186
    Height = 21
    TabOrder = 4
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 120
    Width = 449
    Height = 21
    KeyField = 'COL_COD'
    ListField = 'COL_NOME'
    ListSource = DM.DS_Coletador
    TabOrder = 3
    OnClick = DBLookupComboBox1Click
    OnExit = DBLookupComboBox1Exit
  end
  object Edit1: TEdit
    Left = 8
    Top = 120
    Width = 95
    Height = 21
    TabOrder = 2
    OnExit = Edit1Exit
  end
  object Panel1: TPanel
    Left = 6
    Top = 247
    Width = 337
    Height = 85
    Enabled = False
    TabOrder = 6
    object Label5: TLabel
      Left = 9
      Top = 31
      Width = 54
      Height = 13
      Caption = 'B'#225'sico = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 58
      Width = 95
      Height = 13
      Caption = 'Reconstru'#231#227'o = '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 4
      Top = 5
      Width = 293
      Height = 13
      Caption = 'Esse COLETADOR possui as seguintes quantidades de KITS:'
    end
    object DBEdit1: TDBEdit
      Left = 104
      Top = 26
      Width = 75
      Height = 24
      DataField = 'BASICO'
      DataSource = DataSource1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 104
      Top = 53
      Width = 75
      Height = 24
      DataField = 'RECONSTRUCAO'
      DataSource = DataSource2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object EdtTipo: TEdit
    Left = 8
    Top = 72
    Width = 43
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object DateEdit1: TJvDateEdit
    Left = 11
    Top = 168
    Width = 121
    Height = 21
    ShowNullDate = False
    TabOrder = 7
  end
  object qUltimoCartao: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Tipo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select MAX(KIT_NUM) from tb_KITS'
      'where KIT_TIP = :Tipo')
    Left = 464
    Top = 16
    object qUltimoCartaoMAX: TIntegerField
      FieldName = 'MAX'
    end
  end
  object qSomaBasico: TADOQuery
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
      'select count(*) AS Basico from tb_KITS'
      'where KIT_TIP = 3 and COL_COD = :Codigo and KIT_STATUS = '#39'A'#39
      '')
    Left = 464
    Top = 56
    object qSomaBasicoBASICO: TIntegerField
      FieldName = 'BASICO'
    end
  end
  object qSomaReconstrucao: TADOQuery
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
      'select count(*) AS Reconstrucao from tb_KITS'
      'where KIT_TIP = 6 and COL_COD = :Codigo and KIT_STATUS = '#39'A'#39
      '')
    Left = 504
    Top = 56
    object qSomaReconstrucaoRECONSTRUCAO: TIntegerField
      FieldName = 'RECONSTRUCAO'
    end
  end
  object DataSource1: TDataSource
    DataSet = qSomaBasico
    Left = 288
    Top = 168
  end
  object DataSource2: TDataSource
    DataSet = qSomaReconstrucao
    Left = 296
    Top = 176
  end
  object qPegaNumeroCartao: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Tipo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select max(k.kit_num) NumeroSemTipo from tb_kits k'
      'where KIT_TIP = :Tipo'
      'group by k.kit_num'
      'order by k.kit_num')
    Left = 408
    Top = 72
    object qPegaNumeroCartaoNUMEROSEMTIPO: TIntegerField
      FieldName = 'NUMEROSEMTIPO'
    end
  end
end
