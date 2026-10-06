inherited fParametros: TfParametros
  Left = 319
  Top = 176
  Caption = 'Cadastro de Par'#226'metros do Sistema'
  ClientHeight = 466
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 505
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 402
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 353
  end
  inherited PCampos: TPanel
    Height = 303
    Align = alCustom
    StyleElements = [seFont, seClient, seBorder]
    ExplicitHeight = 303
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 159
      Height = 13
      Caption = 'Diret'#243'rio Padr'#227'o dos Documentos'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 93
      Height = 13
      Caption = 'Diret'#243'rio de Destino'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 404
      Top = 88
      Width = 40
      Height = 13
      Caption = 'Unidade'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 127
      Width = 424
      Height = 13
      Caption = 
        'Diret'#243'rio do Documento Excel que demonstra os valores para pagam' +
        'ento dos Coletadores'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 182
      Height = 13
      Caption = 'Diret'#243'rio Padr'#227'o (Excel do Laborat'#243'rio)'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 8
      Top = 208
      Width = 62
      Height = 13
      Caption = 'Valor Judicial'
    end
    object Label8: TLabel
      Left = 110
      Top = 208
      Width = 71
      Height = 13
      Caption = 'Valor Particular'
    end
    object Label9: TLabel
      Left = 210
      Top = 208
      Width = 43
      Height = 13
      Caption = 'Valor MP'
    end
    object Label11: TLabel
      Left = 310
      Top = 208
      Width = 42
      Height = 13
      Caption = 'Valor DP'
    end
    object Label12: TLabel
      Left = 410
      Top = 208
      Width = 41
      Height = 13
      Caption = 'Valor CT'
    end
    object Label10: TLabel
      Left = 8
      Top = 248
      Width = 118
      Height = 13
      Caption = 'Diret'#243'rio Integra'#231#227'o '
      FocusControl = DBEdit12
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 134
      Height = 21
      DataField = 'PAM_COD'
      DataSource = DSP
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 64
      Width = 394
      Height = 21
      DataField = 'PAM_DPADR'
      DataSource = DSP
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 104
      Width = 394
      Height = 21
      DataField = 'PAM_DDEST'
      DataSource = DSP
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 404
      Top = 104
      Width = 43
      Height = 21
      DataField = 'PAM_UNID'
      DataSource = DSP
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 143
      Width = 625
      Height = 21
      DataField = 'PAM_DRCOL'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 184
      Width = 625
      Height = 21
      DataField = 'PAM_DREXCEL'
      DataSource = DSP
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 8
      Top = 224
      Width = 97
      Height = 21
      DataField = 'PAM_VLRJUD'
      DataSource = DSP
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 108
      Top = 224
      Width = 97
      Height = 21
      DataField = 'PAM_VLREXTRA'
      DataSource = DSP
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 208
      Top = 224
      Width = 97
      Height = 21
      DataField = 'PAM_VLRMP'
      DataSource = DSP
      TabOrder = 8
    end
    object DBEdit11: TDBEdit
      Left = 408
      Top = 224
      Width = 97
      Height = 21
      DataField = 'PAM_VLRCT'
      DataSource = DSP
      TabOrder = 10
    end
    object DBEdit10: TDBEdit
      Left = 308
      Top = 224
      Width = 97
      Height = 21
      DataField = 'PAM_VLRDP'
      DataSource = DSP
      TabOrder = 9
    end
    object DBEdit12: TDBEdit
      Left = 8
      Top = 264
      Width = 625
      Height = 21
      DataField = 'PAM_DIRINTEGRADOC'
      DataSource = DSP
      TabOrder = 11
    end
  end
  inherited PGrid: TPanel
    Top = 304
    Height = 109
    Align = alCustom
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 304
    ExplicitHeight = 109
    inherited DBGrid1: TDBGrid
      Left = 9
      Top = 13
      Width = 674
      Height = 83
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qParametros
    Left = 592
  end
end
