inherited fVara: TfVara
  Left = 247
  Top = 105
  Caption = 'Cadastro de Varas'
  ClientHeight = 496
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 431
    Height = 65
    ExplicitTop = 537
    ExplicitHeight = 65
    inherited BCnsultar: TSpeedButton
      OnClick = BCnsultarClick
    end
  end
  inherited PCampos: TPanel
    Height = 345
    ExplicitHeight = 345
    object Label1: TLabel
      Left = 5
      Top = 3
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object Label3: TLabel
      Left = 3
      Top = 41
      Width = 42
      Height = 13
      Caption = 'Comarca'
      FocusControl = DBEdit2
    end
    object DBEdit2: TDBEdit
      Left = 3
      Top = 57
      Width = 68
      Height = 21
      DataField = 'COM_COD'
      DataSource = DSP
      TabOrder = 2
      OnExit = DBEdit2Exit
    end
    object GroupBox1: TGroupBox
      Left = 3
      Top = 81
      Width = 723
      Height = 257
      Caption = 'Vara'
      TabOrder = 4
      object Label5: TLabel
        Left = 8
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit3
      end
      object Label6: TLabel
        Left = 67
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit4
      end
      object Label7: TLabel
        Left = 593
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Sigla'
        FocusControl = DBEdit5
      end
      object Label4: TLabel
        Left = 8
        Top = 213
        Width = 18
        Height = 13
        Caption = 'Juiz'
        FocusControl = DBEdit6
      end
      object Label2: TLabel
        Left = 8
        Top = 54
        Width = 46
        Height = 14
        Caption = 'Endere'#231'o'
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 8
        Top = 94
        Width = 27
        Height = 13
        Caption = 'Bairro'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 8
        Top = 134
        Width = 33
        Height = 13
        Caption = 'Cidade'
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 8
        Top = 174
        Width = 21
        Height = 13
        Caption = 'CEP'
        FocusControl = DBEdit10
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 32
        Width = 57
        Height = 21
        DataField = 'VAR_COD'
        DataSource = DSP
        TabOrder = 0
      end
      object DBEdit4: TDBEdit
        Left = 67
        Top = 32
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VAR_DESC'
        DataSource = DSP
        TabOrder = 1
      end
      object DBEdit5: TDBEdit
        Left = 593
        Top = 32
        Width = 30
        Height = 21
        CharCase = ecUpperCase
        DataField = 'VAR_SIGLA'
        DataSource = DSP
        TabOrder = 2
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 55
        Top = 229
        Width = 500
        Height = 21
        BevelInner = bvNone
        DataField = 'JUI_COD'
        DataSource = DSP
        KeyField = 'JUI_COD'
        ListField = 'JUI_DESC'
        ListSource = DS_SelJuiz
        TabOrder = 8
      end
      object BitBtn1: TBitBtn
        Left = 559
        Top = 229
        Width = 25
        Height = 21
        Caption = '...'
        TabOrder = 9
        OnClick = BitBtn1Click
      end
      object DBEdit6: TDBEdit
        Left = 8
        Top = 229
        Width = 45
        Height = 21
        CharCase = ecUpperCase
        DataField = 'JUI_COD'
        DataSource = DSP
        TabOrder = 7
      end
      object DBEdit7: TDBEdit
        Left = 8
        Top = 71
        Width = 700
        Height = 22
        DataField = 'ENDE_VARA'
        DataSource = DSP
        TabOrder = 3
      end
      object DBEdit8: TDBEdit
        Left = 8
        Top = 110
        Width = 524
        Height = 21
        DataField = 'BAIRRO_VARA'
        DataSource = DSP
        TabOrder = 4
      end
      object DBEdit9: TDBEdit
        Left = 8
        Top = 150
        Width = 400
        Height = 21
        DataField = 'CIDADE_VARA'
        DataSource = DSP
        TabOrder = 5
      end
      object DBEdit10: TDBEdit
        Left = 8
        Top = 190
        Width = 150
        Height = 21
        DataField = 'CEP_VARA'
        DataSource = DSP
        TabOrder = 6
      end
    end
    object RxDBLookupComboVara: TDBLookupComboBox
      Left = 73
      Top = 57
      Width = 500
      Height = 21
      Hint = 'Clique para escolher a COMARCA'
      DataField = 'COM_COD'
      DataSource = DSP
      KeyField = 'COM_COD'
      ListField = 'COM_DESC'
      ListSource = DS_SelComarca
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnExit = RxDBLookupComboVaraExit
    end
    object RxDBLookupComboEstado: TDBLookupComboBox
      Left = 74
      Top = 19
      Width = 500
      Height = 21
      Hint = 'Clique para escolher o ESTADO'
      DataField = 'UF_SIGLA'
      DataSource = DSP
      KeyField = 'UF_SIGLA'
      ListField = 'UF_DESC'
      ListSource = DS_SelEstado
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = RxDBLookupComboEstadoExit
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 19
      Width = 68
      Height = 21
      DataField = 'UF_SIGLA'
      DataSource = DSP
      TabOrder = 0
    end
  end
  inherited PGrid: TPanel
    Top = 345
    Height = 86
    ExplicitTop = 345
    ExplicitHeight = 192
    inherited DBGrid1: TDBGrid
      Left = 3
      Top = 2
      Width = 720
      Height = 80
      Columns = <
        item
          Expanded = False
          FieldName = 'UF_SIGLA'
          Title.Caption = 'Estado'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAOESTADO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAR_COD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAR_DESC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JUI_COD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VAR_SIGLA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JUI_DESC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COM_COD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMECOMARCA'
          Visible = True
        end>
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qVara
    Left = 592
    Top = 16
  end
  object qSelComarca: TADOQuery
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'UF_SIGLA'
        DataType = ftString
        Precision = 2
        Size = 2
        Value = Null
      end>
    SQL.Strings = (
      'select * from tb_COMARCA'
      'where UF_SIGLA = :UF_SIGLA')
    Left = 639
    Top = 55
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
  object DS_SelComarca: TDataSource
    DataSet = qSelComarca
    Left = 631
    Top = 47
  end
  object qSelEstado: TADOQuery
    Active = True
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_UF')
    Left = 683
    Top = 56
    object qSelEstadoUF_SIGLA: TStringField
      FieldName = 'UF_SIGLA'
      Size = 2
    end
    object qSelEstadoUF_DESC: TStringField
      FieldName = 'UF_DESC'
    end
  end
  object DS_SelEstado: TDataSource
    DataSet = qSelEstado
    Left = 672
    Top = 48
  end
  object qSelJuiz: TADOQuery
    Active = True
    Connection = DM.ADOC_SCPG
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select j.jui_cod, j.jui_desc from tb_JUIZ j')
    Left = 647
    Top = 118
  end
  object DS_SelJuiz: TDataSource
    DataSet = qSelJuiz
    Left = 687
    Top = 97
  end
  object qManutencaoEdicao: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 680
    Top = 82
  end
end
