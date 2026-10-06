inherited fCasoPreco: TfCasoPreco
  Left = 156
  Top = 99
  Caption = 'Cadastro de Tipo de Caso/Pre'#231'o'
  ClientHeight = 477
  ClientWidth = 697
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 713
  ExplicitHeight = 516
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 413
    Width = 697
  end
  inherited PCampos: TPanel
    Width = 697
    Height = 311
    ExplicitHeight = 311
    object GroupBox1: TGroupBox
      Left = 6
      Top = 3
      Width = 682
      Height = 150
      Caption = 'Dados Gerais'
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 19
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 8
        Top = 59
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 8
        Top = 99
        Width = 28
        Height = 13
        Caption = 'Pre'#231'o'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 8
        Top = 35
        Width = 134
        Height = 21
        DataField = 'CAS_CODIGO'
        DataSource = DSP
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 9
        Top = 75
        Width = 600
        Height = 21
        DataField = 'CAS_DESC'
        DataSource = DSP
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 8
        Top = 115
        Width = 134
        Height = 21
        DataField = 'CAS_VLR'
        DataSource = DSP
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 160
      Width = 680
      Height = 145
      Caption = 'Configura'#231#245'es'
      TabOrder = 1
      object Label4: TLabel
        Left = 9
        Top = 36
        Width = 15
        Height = 13
        Caption = '1 - '
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 8
        Top = 63
        Width = 15
        Height = 13
        Caption = '2 - '
        FocusControl = DBEdit5
      end
      object Label6: TLabel
        Left = 9
        Top = 92
        Width = 15
        Height = 13
        Caption = '3 - '
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 9
        Top = 118
        Width = 15
        Height = 13
        Caption = '4 - '
        FocusControl = DBEdit7
      end
      object Label8: TLabel
        Left = 240
        Top = 16
        Width = 26
        Height = 13
        Caption = 'Sigla:'
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 30
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = DBEdit8
      end
      object DBEdit4: TDBEdit
        Left = 26
        Top = 32
        Width = 199
        Height = 21
        DataField = 'CAS_NOME1'
        DataSource = DSP
        TabOrder = 0
      end
      object DBEdit5: TDBEdit
        Left = 26
        Top = 60
        Width = 199
        Height = 21
        DataField = 'CAS_NOME2'
        DataSource = DSP
        TabOrder = 2
      end
      object DBEdit6: TDBEdit
        Left = 26
        Top = 88
        Width = 199
        Height = 21
        DataField = 'CAS_NOME3'
        DataSource = DSP
        TabOrder = 4
      end
      object DBEdit7: TDBEdit
        Left = 26
        Top = 114
        Width = 199
        Height = 21
        DataField = 'CAS_NOME4'
        DataSource = DSP
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 231
        Top = 32
        Width = 69
        Height = 21
        DataField = 'CAS_SIG1'
        DataSource = DSP
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 231
        Top = 59
        Width = 69
        Height = 21
        DataField = 'CAS_SIG2'
        DataSource = DSP
        TabOrder = 3
      end
      object DBEdit10: TDBEdit
        Left = 231
        Top = 87
        Width = 69
        Height = 21
        DataField = 'CAS_SIG3'
        DataSource = DSP
        TabOrder = 5
      end
      object DBEdit11: TDBEdit
        Left = 231
        Top = 113
        Width = 69
        Height = 21
        DataField = 'CAS_SIG4'
        DataSource = DSP
        TabOrder = 7
      end
    end
  end
  inherited PGrid: TPanel
    Top = 311
    Width = 697
    Height = 102
    ExplicitTop = 311
    ExplicitHeight = 227
    inherited DBGrid1: TDBGrid
      Width = 682
      Height = 90
    end
  end
  inherited DSP: TDataSource
    DataSet = DM.qCasos
    Left = 608
  end
end
