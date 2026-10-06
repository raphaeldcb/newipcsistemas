object fParcelamento: TfParcelamento
  Left = 745
  Top = 316
  Caption = 'Parcelamento'
  ClientHeight = 278
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 13
  object OKBtn: TBitBtn
    Left = 362
    Top = 243
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
    Top = 243
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
    Height = 233
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
      DataSource = fProcessos.ds_Parcelamento
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
    object Label5: TLabel
      Left = 14
      Top = 187
      Width = 61
      Height = 13
      Caption = '&Observa'#231#227'o:'
    end
    object Label6: TLabel
      Left = 13
      Top = 144
      Width = 39
      Height = 13
      Caption = '&Fornec.:'
    end
    object DBEditValor: TDBEdit
      Left = 60
      Top = 48
      Width = 133
      Height = 21
      DataField = 'PAR_VLR'
      DataSource = fProcessos.ds_Parcelamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object DBDateEditDtParc: TJvDBDateEdit
      Left = 60
      Top = 20
      Width = 141
      Height = 21
      DataField = 'PAR_DATA'
      DataSource = fProcessos.ds_Parcelamento
      ImageKind = ikDropDown
      ShowNullDate = False
      TabOrder = 0
    end
    object RxDBComboBox1: TJvDBComboBox
      Left = 60
      Top = 108
      Width = 424
      Height = 21
      DataField = 'PAR_TPPG'
      DataSource = fProcessos.ds_Parcelamento
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
        'PIX (INTER)'
        'PAGAMENTO PELO ESTADO')
      TabOrder = 3
      Values.Strings = (
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
        'PIX (INTER)'
        'PAGAMENTO PELO ESTADO')
      ListSettings.OutfilteredValueFont.Charset = DEFAULT_CHARSET
      ListSettings.OutfilteredValueFont.Color = clRed
      ListSettings.OutfilteredValueFont.Height = -11
      ListSettings.OutfilteredValueFont.Name = 'Tahoma'
      ListSettings.OutfilteredValueFont.Style = []
    end
    object RxDBComboBoxSituParc: TJvDBComboBox
      Left = 60
      Top = 76
      Width = 285
      Height = 21
      DataField = 'PAR_SIT'
      DataSource = fProcessos.ds_Parcelamento
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
      Left = 60
      Top = 140
      Width = 437
      Height = 21
      DataField = 'PAR_NMFOR'
      DataSource = fProcessos.ds_Parcelamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 12
      Top = 203
      Width = 493
      Height = 21
      DataField = 'PAR_OBS'
      DataSource = fProcessos.ds_Parcelamento
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
  end
  object qControlaAuditoria: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <>
    Left = 255
    Top = 32
  end
end
