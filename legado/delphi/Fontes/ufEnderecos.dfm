inherited fEnderecos: TfEnderecos
  Left = 143
  Top = 152
  Width = 716
  Height = 457
  Caption = 'Cadastro de Endere'#231'os'
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 355
    Width = 700
    inherited BCnsultar: TSpeedButton
      OnClick = BCnsultarClick
    end
  end
  inherited PCampos: TPanel
    Width = 700
    Height = 257
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 26
      Height = 13
      Caption = 'Local'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 136
      Top = 48
      Width = 62
      Height = 13
      Caption = 'Respons'#225'vel'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 7
      Top = 128
      Width = 27
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 102
      Height = 13
      Caption = 'Logradouro / N'#250'mero'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 8
      Top = 168
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 8
      Top = 208
      Width = 21
      Height = 13
      Caption = 'CEP'
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 219
      Top = 168
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 54
      Height = 13
      Caption = 'Tratamento'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 24
      Width = 650
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_LOC'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 136
      Top = 64
      Width = 465
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_NMR'
      DataSource = DSP
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 7
      Top = 144
      Width = 394
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_BAI'
      DataSource = DSP
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 8
      Top = 104
      Width = 650
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_END'
      DataSource = DSP
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 8
      Top = 184
      Width = 209
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_CID'
      DataSource = DSP
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 8
      Top = 224
      Width = 169
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_CEP'
      DataSource = DSP
      TabOrder = 7
    end
    object DBComboBox1: TDBComboBox
      Left = 220
      Top = 184
      Width = 55
      Height = 21
      CharCase = ecUpperCase
      DataField = 'UF_SIGLA'
      DataSource = DSP
      ItemHeight = 13
      Items.Strings = (
        'AC'
        'AM'
        'MT'
        'MS'
        'PR'
        'PA'
        'TO')
      TabOrder = 6
    end
    object DBComboBox2: TDBComboBox
      Left = 8
      Top = 64
      Width = 126
      Height = 21
      CharCase = ecUpperCase
      DataField = 'END_TRATA'
      DataSource = DSP
      ItemHeight = 13
      Items.Strings = (
        'DOUTOR'
        'DOUTORA'
        'ILUSTR'#205'SSIMO'
        'ILUSTR'#205'SSIMA')
      TabOrder = 1
    end
  end
  inherited PGrid: TPanel
    Top = 257
    Width = 700
    Height = 98
    inherited DBGrid1: TDBGrid
      Left = 5
      Width = 688
      Height = 85
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    end
  end
  inherited DSP: TDataSource
    AutoEdit = False
    DataSet = DM.qEnderecos
    Left = 584
  end
end
