inherited fUsuarios: TfUsuarios
  Left = 107
  Top = 98
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 423
  ClientWidth = 687
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 703
  ExplicitHeight = 462
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 358
    Width = 687
    Height = 65
    ExplicitTop = 537
    ExplicitWidth = 691
    ExplicitHeight = 65
    inherited BNovo: TSpeedButton
      Left = 173
      ExplicitLeft = 173
    end
    inherited BEditar: TSpeedButton
      Left = 246
      ExplicitLeft = 246
    end
    inherited BExcluir: TSpeedButton
      Left = 319
      ExplicitLeft = 319
    end
    inherited BSalvar: TSpeedButton
      Left = 392
      ExplicitLeft = 392
    end
    inherited BCancelar: TSpeedButton
      Left = 465
      ExplicitLeft = 465
    end
    inherited BSair: TSpeedButton
      Left = 538
      ExplicitLeft = 538
    end
    inherited BCnsultar: TSpeedButton
      Left = 611
      ExplicitLeft = 611
    end
  end
  inherited PCampos: TPanel
    Width = 687
    Height = 275
    ExplicitWidth = 691
    ExplicitHeight = 275
    object Label1: TLabel
      Left = 8
      Top = 48
      Width = 44
      Height = 13
      Caption = 'Usuario'
      FocusControl = DBEdit1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 37
      Height = 13
      Caption = 'Senha'
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 125
      Height = 13
      Caption = 'Data '#218'ltima Altera'#231#227'o'
      Enabled = False
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 64
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HOS_USUA'
      DataSource = DSP
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 104
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HOS_SENHA'
      DataSource = DSP
      PasswordChar = '*'
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 208
      Width = 596
      Height = 60
      Caption = 'Restri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object Label4: TLabel
        Left = 11
        Top = 15
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 82
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object sbb: TSpeedButton
        Left = 400
        Top = 32
        Width = 20
        Height = 17
        Caption = '...'
        OnClick = sbbClick
      end
      object DBEdit4: TDBEdit
        Left = 12
        Top = 31
        Width = 64
        Height = 21
        CharCase = ecUpperCase
        DataField = 'RES_COD'
        DataSource = DSP
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 81
        Top = 31
        Width = 314
        Height = 21
        DataField = 'DescRestricao'
        DataSource = DSP
        TabOrder = 1
      end
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 24
      Width = 505
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HOS_NOME'
      DataSource = DSP
      TabOrder = 2
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 8
      Top = 128
      Width = 217
      Height = 36
      Caption = 'Situa'#231#227'o'
      Columns = 2
      DataField = 'HOS_SITUACAO'
      DataSource = DSP
      Items.Strings = (
        'Ativo'
        'Inativo')
      TabOrder = 3
      Values.Strings = (
        '1'
        '0')
    end
    object DBDateEdit1: TJvDBDateEdit
      Left = 7
      Top = 183
      Width = 121
      Height = 21
      DataField = 'HOS_DTULTALT'
      DataSource = DSP
      Enabled = False
      NumGlyphs = 2
      ShowNullDate = False
      TabOrder = 4
    end
  end
  inherited PGrid: TPanel
    Top = 275
    Width = 687
    Height = 83
    ExplicitTop = 275
    ExplicitWidth = 691
    ExplicitHeight = 262
    inherited DBGrid1: TDBGrid
      Left = 5
      Width = 678
      Height = 73
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      Columns = <
        item
          Expanded = False
          FieldName = 'HOS_NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HOS_USUA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HOS_SENHA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RES_COD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DescRestricao'
          Visible = True
        end>
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qHosts
    Left = 584
  end
end
