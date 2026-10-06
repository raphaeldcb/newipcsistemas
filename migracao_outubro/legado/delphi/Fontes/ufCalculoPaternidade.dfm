object fCalculaPaternidade: TfCalculaPaternidade
  Left = 65
  Top = 235
  BorderStyle = bsDialog
  Caption = 'Calcula Paternidade (Valida'#231#227'o)'
  ClientHeight = 630
  ClientWidth = 1453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 1496
    Top = 176
    Width = 14
    Height = 13
    Caption = 'SP'
  end
  object Label2: TLabel
    Left = 1496
    Top = 224
    Width = 36
    Height = 13
    Caption = 'Crian'#231'a'
  end
  object Label3: TLabel
    Left = 1496
    Top = 272
    Width = 21
    Height = 13
    Caption = 'M'#227'e'
  end
  object sbDescobreOrigemAlelos: TSpeedButton
    Left = 1496
    Top = 320
    Width = 169
    Height = 49
    Caption = 'Descobre Alelos'
    OnClick = sbDescobreOrigemAlelosClick
  end
  object Label4: TLabel
    Left = 1496
    Top = 376
    Width = 63
    Height = 13
    Caption = 'Marcador Pai'
  end
  object Label5: TLabel
    Left = 1620
    Top = 376
    Width = 69
    Height = 13
    Caption = 'Marcador M'#227'e'
  end
  object sbBuscaFrequencia: TSpeedButton
    Left = 1496
    Top = 424
    Width = 169
    Height = 49
    Caption = 'Busca Frequencia'
    OnClick = sbBuscaFrequenciaClick
  end
  object Label6: TLabel
    Left = 1496
    Top = 488
    Width = 63
    Height = 13
    Caption = 'Marcador Pai'
  end
  object Label7: TLabel
    Left = 1497
    Top = 528
    Width = 69
    Height = 13
    Caption = 'Marcador M'#227'e'
  end
  object Label8: TLabel
    Left = 1624
    Top = 488
    Width = 71
    Height = 13
    Caption = 'FREQ Calc Pai'
  end
  object Label9: TLabel
    Left = 1625
    Top = 528
    Width = 77
    Height = 13
    Caption = 'FREQ Calc M'#227'e'
  end
  object Label10: TLabel
    Left = 1480
    Top = 584
    Width = 13
    Height = 13
    Caption = 'PI '
  end
  object Label13: TLabel
    Left = 1608
    Top = 584
    Width = 38
    Height = 13
    Caption = 'Prob Pa'
  end
  object Label11: TLabel
    Left = 8
    Top = 8
    Width = 74
    Height = 13
    Caption = 'Informe o Caso:'
  end
  object sbFechar: TSpeedButton
    Left = 102
    Top = 50
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
  object bProcessar: TSpeedButton
    Left = 7
    Top = 49
    Width = 94
    Height = 35
    Hint = 'Informa somente o N'#250'mero (Ex: 61952)'
    Caption = 'Processar'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
      FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
      990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
      990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
      FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
      00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
      00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
      00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
      03FF33337FFF77777333333300000333333F3333777773333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = bProcessarClick
  end
  object EdtPai1: TEdit
    Left = 1496
    Top = 192
    Width = 57
    Height = 21
    TabOrder = 0
  end
  object EdtPai2: TEdit
    Left = 1560
    Top = 193
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object EdtCrianca1: TEdit
    Left = 1496
    Top = 240
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object EdtCrianca2: TEdit
    Left = 1560
    Top = 240
    Width = 57
    Height = 21
    TabOrder = 3
  end
  object EdtMae1: TEdit
    Left = 1496
    Top = 288
    Width = 57
    Height = 21
    TabOrder = 4
  end
  object EdtMae2: TEdit
    Left = 1560
    Top = 288
    Width = 57
    Height = 21
    TabOrder = 5
  end
  object EdtMarcadorPai: TEdit
    Left = 1496
    Top = 392
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object EdtMarcadorMae: TEdit
    Left = 1620
    Top = 392
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object EdtFreqPai: TEdit
    Left = 1496
    Top = 504
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object EdtFreqMae: TEdit
    Left = 1497
    Top = 544
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object EdtFreqCalcPai: TEdit
    Left = 1624
    Top = 504
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object EdtFreqCalcPMae: TEdit
    Left = 1625
    Top = 544
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object EdtPI: TEdit
    Left = 1480
    Top = 600
    Width = 121
    Height = 21
    TabOrder = 12
  end
  object EdtProbalidade: TEdit
    Left = 1608
    Top = 600
    Width = 121
    Height = 21
    TabOrder = 13
  end
  object EdtCaso: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 14
  end
  object DBGrid2: TDBGrid
    Left = 9
    Top = 96
    Width = 553
    Height = 521
    DataSource = ds_AlelosConferencia
    ReadOnly = True
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NM1_ALE'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM2_ALE'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM3_ALE'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MAR_ALE'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL1_ALE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AL2_ALE'
        Width = 80
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 563
    Top = 96
    Width = 881
    Height = 522
    DataSource = ds_Resultados
    ReadOnly = True
    TabOrder = 16
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ARE_MARCADOR'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_AL1_MAE'
        Title.Caption = 'Valor 1 - MAE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_AL2_MAE'
        Title.Caption = 'Valor 2 - MAE'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_AL1_CRI'
        Title.Caption = 'Valor 1 - CRI'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_AL2_CRI'
        Title.Caption = 'Valor 2 - CRI'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_AL1_SPA'
        Title.Caption = 'Valor 1 - SUPAI'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_AL2_SPA'
        Title.Caption = 'Valor 2 - SUPAI'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_FREQUENCIA'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_PI'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARE_PROBA'
        Width = 90
        Visible = True
      end>
  end
  object ds_Resultados: TDataSource
    DataSet = DMD.qConsultaResultados
    Left = 624
    Top = 88
  end
  object ds_AlelosConferencia: TDataSource
    DataSet = DMD.qConsultaAlelosConferencia
    Left = 24
    Top = 128
  end
end
