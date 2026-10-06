object fConsultaCPG: TfConsultaCPG
  Left = 294
  Top = 226
  Caption = 'Consulta de Per'#237'cias'
  ClientHeight = 630
  ClientWidth = 952
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object sbConsultar: TSpeedButton
    Left = 659
    Top = 223
    Width = 94
    Height = 34
    Caption = '&Consultar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33033333333333333F7F3333333333333000333333333333F777333333333333
      000333333333333F777333333333333000333333333333F77733333333333300
      033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
      33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
      3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
      33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
      333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
      333333773FF77333333333370007333333333333777333333333}
    NumGlyphs = 2
    OnClick = sbConsultarClick
  end
  object sbFechar: TSpeedButton
    Left = 853
    Top = 223
    Width = 94
    Height = 34
    Caption = '&Fechar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
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
  object sbImprimir: TSpeedButton
    Left = 756
    Top = 223
    Width = 94
    Height = 34
    Caption = '&Imprimir'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
    OnClick = sbImprimirClick
  end
  object gb_DadosGerais: TGroupBox
    Left = 1
    Top = 62
    Width = 473
    Height = 143
    Caption = ' Dados Gerais '
    TabOrder = 0
    object Label21: TLabel
      Left = 11
      Top = 116
      Width = 83
      Height = 13
      Caption = 'Suposto Pai (SP):'
    end
    object Label20: TLabel
      Left = 38
      Top = 92
      Width = 55
      Height = 13
      Caption = 'Crian'#231'a (C):'
    end
    object Label10: TLabel
      Left = 51
      Top = 68
      Width = 42
      Height = 13
      Caption = 'M'#227'e (M):'
    end
    object Label9: TLabel
      Left = 26
      Top = 44
      Width = 66
      Height = 13
      Caption = 'Tipo de Caso:'
    end
    object Label18: TLabel
      Left = 70
      Top = 20
      Width = 22
      Height = 13
      Caption = 'Ano:'
    end
    object Label6: TLabel
      Left = 190
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object RxDBLookupComboEstado: TJvDBLookupCombo
      Left = 261
      Top = 16
      Width = 177
      Height = 20
      ListStyle = lsDelimited
      LookupField = 'UF_SIGLA'
      LookupDisplay = 'UF_DESC'
      LookupSource = DS_SelEstado
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TabStop = False
      OnChange = RxDBLookupComboEstadoChange
    end
    object EditEstado: TEdit
      Left = 227
      Top = 16
      Width = 32
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnExit = EditEstadoExit
    end
    object EditTipoCaso: TEdit
      Left = 97
      Top = 40
      Width = 74
      Height = 21
      TabOrder = 3
      OnExit = EditTipoCasoExit
    end
    object EditAno: TEdit
      Left = 97
      Top = 16
      Width = 43
      Height = 21
      TabOrder = 0
    end
    object EditMae: TEdit
      Left = 97
      Top = 64
      Width = 339
      Height = 21
      CharCase = ecUpperCase
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnKeyPress = EditMaeKeyPress
    end
    object EditCrianca: TEdit
      Left = 97
      Top = 88
      Width = 339
      Height = 21
      CharCase = ecUpperCase
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnKeyPress = EditCriancaKeyPress
    end
    object EditSupai: TEdit
      Left = 97
      Top = 112
      Width = 339
      Height = 21
      CharCase = ecUpperCase
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnKeyPress = EditSupaiKeyPress
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 173
      Top = 40
      Width = 284
      Height = 21
      KeyField = 'CAS_CODIGO'
      ListField = 'CAS_DESC'
      ListSource = DS_SelCaso
      TabOrder = 4
      OnExit = DBLookupComboBox1Exit
    end
  end
  object gb_Origem: TGroupBox
    Left = 475
    Top = 2
    Width = 472
    Height = 97
    Caption = ' Origem '
    TabOrder = 1
    object Label24: TLabel
      Left = 283
      Top = 20
      Width = 30
      Height = 13
      Caption = 'Autos:'
    end
    object Label5: TLabel
      Left = 30
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Origem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 24
      Top = 44
      Width = 45
      Height = 13
      Caption = 'Comarca:'
    end
    object Label23: TLabel
      Left = 44
      Top = 68
      Width = 25
      Height = 13
      Caption = 'Vara:'
    end
    object RxDBLookupComboComarca: TJvDBLookupCombo
      Left = 111
      Top = 40
      Width = 277
      Height = 21
      ListStyle = lsDelimited
      LookupField = 'COM_COD'
      LookupDisplay = 'COM_DESC'
      LookupSource = DS_SelComarca
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
      OnChange = RxDBLookupComboComarcaChange
    end
    object EditComarca: TEdit
      Left = 73
      Top = 40
      Width = 36
      Height = 21
      TabOrder = 2
      OnExit = EditComarcaExit
    end
    object EditVara: TEdit
      Left = 73
      Top = 64
      Width = 36
      Height = 21
      TabOrder = 4
      OnExit = EditVaraExit
    end
    object EditAutos: TEdit
      Left = 315
      Top = 16
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object RxDBComboBoxTipo: TComboBox
      Left = 73
      Top = 16
      Width = 169
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'Judicial'
        'ExtraJudicial'
        'Minist'#233'rio P'#250'blico'
        'Defensoria P'#250'blica'
        'Delegacia de Pol'#237'cia'
        'Justi'#231'a Comunit'#225'ria'
        'Conselho Tutelar'
        'Promotoria de Justi'#231'a'
        'Paternidade Respons'#225'vel'
        'N'#250'cleo de Pr'#225'tica Forense')
    end
    object RxDBLookupComboVara: TJvDBLookupCombo
      Left = 111
      Top = 64
      Width = 278
      Height = 21
      Hint = 'Local de Coleta'
      ListStyle = lsDelimited
      LookupField = 'VAR_COD'
      LookupDisplay = 'VAR_DESC'
      LookupSource = DS_SelVaras
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      TabStop = False
      OnChange = RxDBLookupComboVaraChange
    end
  end
  object gb_DadosColeta: TGroupBox
    Left = 475
    Top = 99
    Width = 473
    Height = 120
    Caption = ' Dados da Coleta '
    TabOrder = 3
    object Label1: TLabel
      Left = 184
      Top = 47
      Width = 6
      Height = 13
      Caption = '&a'
    end
    object Label2: TLabel
      Left = 41
      Top = 49
      Width = 26
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 38
      Top = 20
      Width = 29
      Height = 13
      Caption = 'Local:'
    end
    object Label28: TLabel
      Left = 326
      Top = 48
      Width = 45
      Height = 13
      Caption = 'Situa'#231#227'o:'
    end
    object Label3: TLabel
      Left = 41
      Top = 88
      Width = 108
      Height = 13
      Caption = 'Data de Recep'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 156
      Top = 88
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object Label7: TLabel
      Left = 301
      Top = 88
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object RxDBLookupComboColeta: TJvDBLookupCombo
      Left = 111
      Top = 16
      Width = 280
      Height = 20
      Hint = 'Local de Coleta'
      ListStyle = lsDelimited
      LookupField = 'LCO_COD'
      LookupDisplay = 'LCO_NOME'
      LookupSource = DS_SelColeta
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnChange = RxDBLookupComboColetaChange
    end
    object EditLocal: TEdit
      Left = 73
      Top = 16
      Width = 36
      Height = 21
      TabOrder = 0
      OnExit = EditLocalExit
    end
    object RxDBComboBoxSituacao: TComboBox
      Left = 375
      Top = 45
      Width = 94
      Height = 21
      TabOrder = 2
      Items.Strings = (
        'Realizada'
        'N'#227'o realizada')
    end
    object DateEditFinal: TJvDateEdit
      Left = 196
      Top = 43
      Width = 108
      Height = 21
      ShowNullDate = False
      TabOrder = 3
    end
    object DateInicio: TJvDateEdit
      Left = 188
      Top = 83
      Width = 109
      Height = 21
      ShowNullDate = False
      TabOrder = 4
    end
    object DateFim: TJvDateEdit
      Left = 313
      Top = 83
      Width = 108
      Height = 21
      ShowNullDate = False
      TabOrder = 5
    end
  end
  object gb_DadosResultados: TGroupBox
    Left = 1
    Top = 206
    Width = 473
    Height = 48
    Caption = ' Dados do Resultado '
    TabOrder = 2
    object Label30: TLabel
      Left = 14
      Top = 20
      Width = 51
      Height = 13
      Caption = 'Resultado:'
    end
    object Label33: TLabel
      Left = 198
      Top = 20
      Width = 57
      Height = 13
      Caption = 'Pagamento:'
    end
    object RxDBComboBoxResultado: TComboBox
      Left = 67
      Top = 16
      Width = 127
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'Positivo'
        'Negativo'
        'Cancelado'
        'Andamento')
    end
    object RxDBComboBoxPagamento: TComboBox
      Left = 259
      Top = 16
      Width = 182
      Height = 21
      TabOrder = 1
      Items.Strings = (
        'DINHEIRO'
        'CHEQUE ('#192' VISTA)'
        'CHEQUE COM PARCELAMENTO, SENDO 1 '#192' VISTA'
        'CHEQUE PR'#201'-DATADO'
        'VISA-CR'#201'DITO'
        'VISA-D'#201'BITO'
        'MASTERCARD-CR'#201'DITO'
        'MASTERCARD-D'#201'BITO'
        'BOLETO (CR'#201'DITO INTERNO)'
        'FINANCEIRA (CR'#201'DITO EXTERNO)'
        'HONOR'#193'RIOS EM JU'#205'ZO (NO MS)'
        'HONOR'#193'RIOS EM JU'#205'ZO (FORA MS)'
        'GRATUITO'
        'CALOTE'
        'PENDENTE'
        'DEP'#211'S. NA CONTA DO IPCMS (CEF)'
        'DEP'#211'S. NA CONTA DO IPCMS (BB)'
        'DINHEIRO - LEVANTAMENTO DE ALVAR'#193
        'ERRO'
        'DEP'#211'S. NA CONTA DO IPCMS (BRADESCO)'
        'GRATUITO - CR'#201'DITOS'
        '')
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 606
    Width = 952
    Height = 24
    Panels = <
      item
        Text = 'Quantidade de Per'#237'cias....:'
        Width = 150
      end
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Alignment = taCenter
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'de '
        Width = 35
      end
      item
        Alignment = taCenter
        Width = 60
      end
      item
        Alignment = taCenter
        Bevel = pbRaised
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
  end
  object GroupBox6: TGroupBox
    Left = 2
    Top = 257
    Width = 943
    Height = 348
    Caption = 'Resultado da Consulta'
    TabOrder = 4
    object DBGridCPG: TDBGrid
      Left = 14
      Top = 15
      Width = 915
      Height = 140
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridCPGDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PRO_NPERC'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LCO_NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UF_SIGLA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAOCASO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRO_AUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VARA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMARCA'
          Visible = True
        end>
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 246
      Width = 929
      Height = 98
      Caption = ' Dados do Hist'#243'rico '
      TabOrder = 1
      object DBGridHistorico: TDBGrid
        Left = 6
        Top = 15
        Width = 915
        Height = 78
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'HIS_DATA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITE_DESC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HIS_DOC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HIS_OBS'
            Visible = True
          end>
      end
    end
    object GroupBox7: TGroupBox
      Left = 8
      Top = 158
      Width = 929
      Height = 87
      Caption = 'Pessoas'
      TabOrder = 2
      object DBGridPessoas: TDBGrid
        Left = 6
        Top = 15
        Width = 915
        Height = 66
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'PES_NOME'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PES_SIT'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PES_DTNAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PES_LCNAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PES_SEXO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PES_TDOC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PES_NDOC'
            Visible = True
          end>
      end
    end
  end
  object gb_Union: TGroupBox
    Left = 3
    Top = 18
    Width = 471
    Height = 39
    Caption = 'Nomes (Geral)'
    Enabled = False
    TabOrder = 6
    object Label8: TLabel
      Left = 7
      Top = 17
      Width = 70
      Height = 13
      Caption = 'Digite o Nome:'
    end
    object Label15: TLabel
      Left = 190
      Top = 20
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object EdtUnion: TEdit
      Left = 93
      Top = 13
      Width = 339
      Height = 21
      CharCase = ecUpperCase
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = EdtUnionKeyPress
    end
  end
  object CheckBox1: TCheckBox
    Left = 3
    Top = 0
    Width = 97
    Height = 17
    Caption = 'S'#243' pelos Nomes'
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object DateEditInicial: TJvDateEdit
    Left = 548
    Top = 142
    Width = 109
    Height = 21
    ShowNullDate = False
    TabOrder = 8
  end
  object DS_SelEstado: TDataSource
    DataSet = qSelEstado
    Left = 144
    Top = 56
  end
  object DS_SelComarca: TDataSource
    DataSet = qSelComarca
    Left = 199
    Top = 57
  end
  object DS_SelVaras: TDataSource
    DataSet = qSelVaras
    Left = 255
    Top = 57
  end
  object DS_SelColeta: TDataSource
    DataSet = qSelColeta
    Left = 311
    Top = 57
  end
  object DS_SelCaso: TDataSource
    DataSet = qSelCaso
    Left = 375
    Top = 57
  end
  object qFiltroCPG: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select COUNT(p.pro_cod), p.pro_cod, p.pro_nperc, c.lco_nome, p.u' +
        'f_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_tipo, p.pro_auto, v' +
        '.var_desc AS VARA, cm.com_desc AS COMARCA, h.his_data AS DATAITE' +
        'M, i.ite_desc AS DESCRICAOITEM, h.his_doc AS DOCUMENTOITEM, h.hi' +
        's_obs AS OBSERVACAOITEM'
      
        'from tb_PROCESSO p, tb_LCOLETA c, tb_VARAS v, tb_COMARCA cm, tb_' +
        'CASOS pr, tb_HISTORICO h, tb_ITEM i'
      
        'where (p.lco_cod = c.lco_cod) and (p.uf_sigla = v.uf_sigla) and ' +
        '(p.com_cod = v.com_cod)'
      
        'and (p.var_cod = v.var_cod) and (p.uf_sigla = cm.uf_sigla) and (' +
        'p.com_cod = cm.com_cod) and (p.cas_codigo = pr.cas_codigo) and (' +
        'p.pro_cod = h.pro_cod) and (h.ite_cod = i.ite_cod)'
      
        'group by p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_sigla, pr.cas_' +
        'desc, p.pro_tipo, p.pro_auto, v.var_desc, cm.com_desc, h.his_dat' +
        'a, i.ite_desc, h.his_doc, h.his_obs')
    Left = 392
    Top = 136
    object qFiltroCPGCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qFiltroCPGPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qFiltroCPGPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 16
    end
    object qFiltroCPGLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qFiltroCPGUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qFiltroCPGDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qFiltroCPGPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qFiltroCPGPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qFiltroCPGCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qFiltroCPGDATAITEM: TDateField
      FieldName = 'DATAITEM'
    end
    object qFiltroCPGDESCRICAOITEM: TStringField
      FieldName = 'DESCRICAOITEM'
      Size = 60
    end
    object qFiltroCPGDOCUMENTOITEM: TStringField
      FieldName = 'DOCUMENTOITEM'
      Size = 10
    end
    object qFiltroCPGOBSERVACAOITEM: TStringField
      FieldName = 'OBSERVACAOITEM'
      Size = 50
    end
  end
  object DS_FiltroCPG: TDataSource
    DataSet = qFiltroCPG
    Left = 424
    Top = 136
  end
  object qHistoricoFiltro: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    DataSource = DMR.DS_FiltroCPGTela
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT T1.pro_cod, T1.his_data, T1.ite_cod, i.ite_desc, T1.his_d' +
        'oc, T1.his_obs'
      '    FROM tb_HISTORICO T1, tb_item i'
      '    WHERE t1.ite_cod=i.ite_cod and  T1.pro_cod = :PRO_COD')
    Left = 432
    Top = 384
    object qHistoricoFiltroPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qHistoricoFiltroHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qHistoricoFiltroITE_COD: TIntegerField
      FieldName = 'ITE_COD'
    end
    object qHistoricoFiltroHIS_DOC: TStringField
      FieldName = 'HIS_DOC'
      Size = 10
    end
    object qHistoricoFiltroHIS_OBS: TStringField
      FieldName = 'HIS_OBS'
      Size = 50
    end
    object qHistoricoFiltroITE_DESC: TStringField
      FieldName = 'ITE_DESC'
      Size = 60
    end
  end
  object DS_HistoricoFiltro: TDataSource
    DataSet = qHistoricoFiltro
    Left = 400
    Top = 384
  end
  object qContadorPericias: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select count(*) from tb_PROCESSO')
    Left = 288
    Top = 168
    object qContadorPericiasCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
  object qSelEstado: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_UF')
    Left = 155
    Top = 64
    object qSelEstadoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qSelEstadoUF_DESC: TStringField
      FieldName = 'UF_DESC'
    end
  end
  object qSelComarca: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    DataSource = DS_SelEstado
    Parameters = <
      item
        Name = 'UF_SIGLA'
        DataType = ftString
        Precision = 2
        Size = 2
        Value = 'AC'
      end>
    SQL.Strings = (
      'select * from tb_COMARCA'
      'where UF_SIGLA = :UF_SIGLA')
    Left = 215
    Top = 63
    object qSelComarcaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qSelComarcaCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qSelComarcaCOM_DESC: TStringField
      FieldName = 'COM_DESC'
      Size = 40
    end
    object qSelComarcaCOM_SIGLA: TStringField
      FieldName = 'COM_SIGLA'
      Size = 2
    end
  end
  object qSelVaras: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    DataSource = DS_SelComarca
    Parameters = <
      item
        Name = 'UF_SIGLA'
        DataType = ftString
        Precision = 2
        Size = 2
        Value = 'AC'
      end
      item
        Name = 'COM_COD'
        DataType = ftInteger
        Precision = 10
        Value = 1
      end>
    SQL.Strings = (
      'select * from tb_VARAS'
      'where UF_SIGLA = :UF_SIGLA and COM_COD = :COM_COD')
    Left = 272
    Top = 64
    object qSelVarasUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qSelVarasCOM_COD: TIntegerField
      FieldName = 'COM_COD'
    end
    object qSelVarasVAR_COD: TIntegerField
      FieldName = 'VAR_COD'
    end
    object qSelVarasVAR_DESC: TStringField
      FieldName = 'VAR_DESC'
      Size = 40
    end
    object qSelVarasVAR_SIGLA: TStringField
      FieldName = 'VAR_SIGLA'
      Size = 2
    end
    object qSelVarasJUI_COD: TIntegerField
      FieldName = 'JUI_COD'
    end
  end
  object qSelColeta: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_LCOLETA'
      'ORDER BY LCO_NOME')
    Left = 327
    Top = 65
    object qSelColetaLCO_COD: TIntegerField
      FieldName = 'LCO_COD'
    end
    object qSelColetaLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qSelColetaLCO_SEXO: TIntegerField
      FieldName = 'LCO_SEXO'
    end
    object qSelColetaLCO_CRM: TStringField
      FieldName = 'LCO_CRM'
      Size = 15
    end
    object qSelColetaLCO_LABT: TStringField
      FieldName = 'LCO_LABT'
      Size = 60
    end
    object qSelColetaLCO_FONE: TStringField
      FieldName = 'LCO_FONE'
      Size = 25
    end
    object qSelColetaLCO_END: TStringField
      FieldName = 'LCO_END'
      Size = 80
    end
    object qSelColetaLCO_CID: TStringField
      FieldName = 'LCO_CID'
      Size = 40
    end
    object qSelColetaUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qSelColetaLCO_TLIE: TIntegerField
      FieldName = 'LCO_TLIE'
    end
    object qSelColetaLCO_CATE: TIntegerField
      FieldName = 'LCO_CATE'
    end
    object qSelColetaLCO_TRAT: TIntegerField
      FieldName = 'LCO_TRAT'
    end
  end
  object qSelCaso: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_CASOS')
    Left = 391
    Top = 65
    object qSelCasoCAS_CONTR: TIntegerField
      FieldName = 'CAS_CONTR'
    end
    object qSelCasoCAS_CODIGO: TStringField
      FieldName = 'CAS_CODIGO'
      Size = 10
    end
    object qSelCasoCAS_DESC: TStringField
      FieldName = 'CAS_DESC'
      Size = 60
    end
    object qSelCasoCAS_VLR: TBCDField
      FieldName = 'CAS_VLR'
      Precision = 18
      Size = 2
    end
    object qSelCasoCAS_NOME0: TStringField
      FieldName = 'CAS_NOME0'
      Size = 3
    end
    object qSelCasoCAS_NOME1: TStringField
      FieldName = 'CAS_NOME1'
      Size = 15
    end
    object qSelCasoCAS_NOME2: TStringField
      FieldName = 'CAS_NOME2'
      Size = 15
    end
    object qSelCasoCAS_NOME3: TStringField
      FieldName = 'CAS_NOME3'
      Size = 15
    end
    object qSelCasoCAS_NOME4: TStringField
      FieldName = 'CAS_NOME4'
      Size = 15
    end
    object qSelCasoCAS_SIG1: TStringField
      FieldName = 'CAS_SIG1'
      Size = 5
    end
    object qSelCasoCAS_SIG2: TStringField
      FieldName = 'CAS_SIG2'
      Size = 5
    end
    object qSelCasoCAS_SIG3: TStringField
      FieldName = 'CAS_SIG3'
      Size = 5
    end
    object qSelCasoCAS_SIG4: TStringField
      FieldName = 'CAS_SIG4'
      Size = 5
    end
  end
  object qPessoasFiltro: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    DataSource = DMR.DS_FiltroCPGTela
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT * '
      '    FROM tb_PESSOAS T1'
      '    WHERE T1.pro_cod = :PRO_COD')
    Left = 432
    Top = 432
    object qPessoasFiltroPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qPessoasFiltroPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qPessoasFiltroPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qPessoasFiltroPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
      OnGetText = qPessoasFiltroPES_SITGetText
    end
    object qPessoasFiltroPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qPessoasFiltroPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qPessoasFiltroPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qPessoasFiltroPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 10
    end
    object qPessoasFiltroPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 15
    end
  end
  object DS_PessoaFiltro: TDataSource
    DataSet = qPessoasFiltro
    Left = 400
    Top = 432
  end
  object qFiltroCPG_Union: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NOME'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 60
        Size = 60
        Value = ''
      end>
    SQL.Strings = (
      
        'select distinct COUNT(p.pro_cod), p.pro_cod, p.pro_nperc, c.lco_' +
        'nome, p.uf_sigla, pr.cas_desc AS DESCRICAOCASO, p.pro_tipo, p.pr' +
        'o_auto, cm.com_desc AS COMARCA, h.his_data AS DATAITEM, i.ite_de' +
        'sc AS DESCRICAOITEM, '
      'h.his_doc AS DOCUMENTOITEM, h.his_obs AS OBSERVACAOITEM'
      
        'From tb_PROCESSO p left outer join tb_LCOLETA c ON (p.lco_cod = ' +
        'c.lco_cod)'
      
        'left outer JOIN tb_VARAS v  ON (v.uf_sigla = p.uf_sigla) and (v.' +
        'com_cod = p.com_cod) and (v.var_cod = p.var_cod) '
      'left outer join tb_parcelas pa on p.pro_cod = pa.pro_cod '
      
        'JOIN tb_COMARCA cm ON (cm.uf_sigla = p.uf_sigla) and (cm.com_cod' +
        ' = p.com_cod)'
      'left outer join tb_CASOS pr ON (p.cas_codigo = pr.cas_codigo) '
      'JOIN tb_HISTORICO h ON (p.pro_cod = h.pro_cod) '
      
        'JOIN tb_ITEM i ON (h.ite_cod = i.ite_cod) JOIN TB_PESSOAS ps ON ' +
        '(p.pro_cod = ps. pro_cod) '
      'WHERE PES_NOME LIKE :NOME'
      
        'group by p.PRO_DCOLE, p.pro_cod, p.pro_nperc, c.lco_nome, p.uf_s' +
        'igla, pr.cas_desc, p.pro_tipo, p.pro_auto, cm.com_desc, h.his_da' +
        'ta, i.ite_desc, h.his_doc, h.his_obs'
      'order by p.PRO_DCOLE')
    Left = 392
    Top = 216
    object qFiltroCPG_UnionCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
    object qFiltroCPG_UnionPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qFiltroCPG_UnionPRO_NPERC: TStringField
      FieldName = 'PRO_NPERC'
      Size = 17
    end
    object qFiltroCPG_UnionLCO_NOME: TStringField
      FieldName = 'LCO_NOME'
      Size = 60
    end
    object qFiltroCPG_UnionUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qFiltroCPG_UnionDESCRICAOCASO: TStringField
      FieldName = 'DESCRICAOCASO'
      Size = 60
    end
    object qFiltroCPG_UnionPRO_TIPO: TIntegerField
      FieldName = 'PRO_TIPO'
    end
    object qFiltroCPG_UnionPRO_AUTO: TStringField
      FieldName = 'PRO_AUTO'
      Size = 30
    end
    object qFiltroCPG_UnionCOMARCA: TStringField
      FieldName = 'COMARCA'
      Size = 40
    end
    object qFiltroCPG_UnionDATAITEM: TDateField
      FieldName = 'DATAITEM'
    end
    object qFiltroCPG_UnionDESCRICAOITEM: TStringField
      FieldName = 'DESCRICAOITEM'
      Size = 60
    end
    object qFiltroCPG_UnionDOCUMENTOITEM: TStringField
      FieldName = 'DOCUMENTOITEM'
      Size = 50
    end
    object qFiltroCPG_UnionOBSERVACAOITEM: TStringField
      FieldName = 'OBSERVACAOITEM'
      Size = 50
    end
  end
  object DS_FiltroCPG_Union: TDataSource
    DataSet = qFiltroCPG_Union
    Left = 424
    Top = 216
  end
  object DS_HistoricoFiltro_Union: TDataSource
    DataSet = qHistoricoFiltro_Union
    Left = 512
    Top = 384
  end
  object qHistoricoFiltro_Union: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    DataSource = DS_FiltroCPG_Union
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT T1.pro_cod, T1.his_data, T1.ite_cod, i.ite_desc, T1.his_d' +
        'oc, T1.his_obs'
      '    FROM tb_HISTORICO T1, tb_item i'
      '    WHERE t1.ite_cod=i.ite_cod and  T1.pro_cod = :PRO_COD')
    Left = 544
    Top = 384
    object qHistoricoFiltro_UnionPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qHistoricoFiltro_UnionHIS_DATA: TDateField
      FieldName = 'HIS_DATA'
    end
    object qHistoricoFiltro_UnionITE_COD: TIntegerField
      FieldName = 'ITE_COD'
    end
    object qHistoricoFiltro_UnionITE_DESC: TStringField
      FieldName = 'ITE_DESC'
      Size = 60
    end
    object qHistoricoFiltro_UnionHIS_DOC: TStringField
      FieldName = 'HIS_DOC'
      Size = 10
    end
    object qHistoricoFiltro_UnionHIS_OBS: TStringField
      FieldName = 'HIS_OBS'
      Size = 50
    end
  end
  object qPessoasFiltro_Union: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    DataSource = DS_FiltroCPG_Union
    Parameters = <
      item
        Name = 'PRO_COD'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * '
      '    FROM tb_PESSOAS T1'
      '    WHERE T1.pro_cod = :PRO_COD')
    Left = 544
    Top = 432
    object qPessoasFiltro_UnionPRO_COD: TIntegerField
      FieldName = 'PRO_COD'
    end
    object qPessoasFiltro_UnionPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qPessoasFiltro_UnionPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qPessoasFiltro_UnionPES_SIT: TIntegerField
      FieldName = 'PES_SIT'
      OnGetText = qPessoasFiltro_UnionPES_SITGetText
    end
    object qPessoasFiltro_UnionPES_DTNAS: TDateField
      FieldName = 'PES_DTNAS'
    end
    object qPessoasFiltro_UnionPES_LCNAS: TStringField
      FieldName = 'PES_LCNAS'
      Size = 50
    end
    object qPessoasFiltro_UnionPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      FixedChar = True
      Size = 1
    end
    object qPessoasFiltro_UnionPES_TDOC: TStringField
      FieldName = 'PES_TDOC'
      Size = 30
    end
    object qPessoasFiltro_UnionPES_NDOC: TStringField
      FieldName = 'PES_NDOC'
      Size = 200
    end
  end
  object DS_PessoaFiltro_Union: TDataSource
    DataSet = qPessoasFiltro_Union
    Left = 512
    Top = 432
  end
end
