inherited fComarca: TfComarca
  Left = 217
  Top = 124
  Caption = 'Cadastro de Comarcas'
  ClientHeight = 345
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitHeight = 384
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 281
    inherited BCnsultar: TSpeedButton
      OnClick = BitBtn1Click
    end
  end
  inherited PCampos: TPanel
    Height = 202
    ExplicitHeight = 202
    object Label4: TLabel
      Left = 8
      Top = 2
      Width = 33
      Height = 13
      Caption = 'Estado'
      FocusControl = DBEdit4
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 46
      Width = 692
      Height = 145
      Caption = 'Comarca'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 96
        Width = 23
        Height = 13
        Caption = 'Sigla'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 32
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COM_COD'
        DataSource = DSP
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 8
        Top = 72
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COM_DESC'
        DataSource = DSP
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 112
        Width = 30
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COM_SIGLA'
        DataSource = DSP
        TabOrder = 2
      end
    end
    object DBEdit4: TDBEdit
      Left = 9
      Top = 18
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      DataField = 'UF_SIGLA'
      DataSource = DSP
      TabOrder = 0
      OnExit = DBEdit4Exit
    end
    object RxDBLookupComboTipoCaso: TJvDBLookupCombo
      Left = 67
      Top = 18
      Width = 454
      Height = 21
      Hint = 'Clique para escolher o tipo de per'#237'cia'
      DataField = 'UF_SIGLA'
      DataSource = DSP
      ListStyle = lsDelimited
      LookupField = 'UF_SIGLA'
      LookupDisplay = 'UF_DESC'
      LookupSource = DM.DS_UF
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnExit = RxDBLookupComboTipoCasoExit
    end
  end
  inherited PGrid: TPanel
    Top = 202
    Height = 79
    ExplicitTop = 202
    ExplicitHeight = 336
    inherited DBGrid1: TDBGrid
      Left = 8
      Width = 691
      ReadOnly = False
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qComarca
  end
end
