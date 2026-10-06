object fParcelamento_Infe: TfParcelamento_Infe
  Left = 300
  Top = 266
  Caption = 'Parcelamento'
  ClientHeight = 243
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object OKBtn: TBitBtn
    Left = 362
    Top = 210
    Width = 77
    Height = 27
    Caption = '&Confirmar'
    Kind = bkOK
    Margin = 2
    NumGlyphs = 2
    Spacing = -1
    TabOrder = 0
    OnClick = OKBtnClick
    IsControl = True
  end
  object CancelBtn: TBitBtn
    Left = 439
    Top = 210
    Width = 77
    Height = 27
    Caption = 'Cancelar'
    Kind = bkCancel
    Margin = 2
    NumGlyphs = 2
    Spacing = -1
    TabOrder = 1
    OnClick = CancelBtnClick
    IsControl = True
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 4
    Width = 509
    Height = 197
    Caption = ' N'#186' da Parcela:      '
    TabOrder = 2
    object Label4: TLabel
      Left = 28
      Top = 52
      Width = 27
      Height = 13
      Caption = '&Valor:'
    end
    object Label26: TLabel
      Left = 29
      Top = 24
      Width = 26
      Height = 13
      Caption = '&Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 80
      Width = 45
      Height = 13
      Caption = '&Situa'#231#227'o:'
    end
    object DBTextnParc: TDBText
      Left = 84
      Top = 0
      Width = 21
      Height = 17
      DataField = 'PAR_NPARC'
      DataSource = fProcedimentos.ds_Parcelamento
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 18
      Top = 112
      Width = 34
      Height = 13
      Caption = '&Objeto:'
    end
    object Label2: TLabel
      Left = 6
      Top = 148
      Width = 61
      Height = 13
      Caption = '&Observa'#231#227'o:'
    end
    object DBEditValor: TDBEdit
      Left = 60
      Top = 48
      Width = 132
      Height = 21
      DataField = 'PAR_VLR'
      DataSource = fProcedimentos.ds_Parcelamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object DBDateEditDtParc: TJvDBDateEdit
      Left = 60
      Top = 20
      Width = 140
      Height = 21
      DataField = 'PAR_DATA'
      DataSource = fProcedimentos.ds_Parcelamento
      ImageKind = ikDropDown
      ShowNullDate = False
      TabOrder = 0
    end
    object RxDBComboBox1: TJvDBComboBox
      Left = 60
      Top = 108
      Width = 428
      Height = 21
      DataField = 'PAR_TPPG'
      DataSource = fProcedimentos.ds_Parcelamento
      Items.Strings = (
        'DINHEIRO'
        'D'#201'BITO'
        'CR'#201'DITO'
        'FATURADO'
        'BB'
        'INTER')
      TabOrder = 3
      Values.Strings = (
        'DINHEIRO'
        'D'#201'BITO'
        'CR'#201'DITO'
        'FATURADO'
        'BB'
        'INTER')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object RxDBComboBoxSituParc: TJvDBComboBox
      Left = 60
      Top = 76
      Width = 284
      Height = 21
      DataField = 'PAR_SIT'
      DataSource = fProcedimentos.ds_Parcelamento
      Items.Strings = (
        'OK'
        'DEVOLVIDO'
        'N'#195'O FORNECIDO')
      TabOrder = 2
      Values.Strings = (
        '1'
        '2'
        '3')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 164
      Width = 492
      Height = 21
      DataField = 'PAR_OBS'
      DataSource = fProcedimentos.ds_Parcelamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
end
