inherited fProcedimentos: TfProcedimentos
  Left = 415
  Top = 135
  Align = alNone
  Caption = 'Exames de Infecciosas'
  ClientHeight = 531
  ClientWidth = 881
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 897
  ExplicitHeight = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited PBotoes: TPanel
    Top = 464
    Width = 884
    Height = 67
    Align = alNone
    ExplicitTop = 464
    ExplicitWidth = 884
    ExplicitHeight = 67
    object sbLaudo: TSpeedButton [6]
      Left = 901
      Top = 12
      Width = 67
      Height = 57
      Cursor = crHandPoint
      Hint = 'Emitir MAPA'
      Caption = 'Laudo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbLaudoClick
    end
    object sbComprovante: TSpeedButton [7]
      Left = 894
      Top = 36
      Width = 73
      Height = 57
      Cursor = crHandPoint
      Hint = 'Emitir MAPA'
      Caption = 'Documentos'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = sbComprovanteClick
    end
    inherited BCnsultar: TSpeedButton
      Left = 634
      Top = 85
      Visible = False
      ExplicitLeft = 634
      ExplicitTop = 85
    end
    object sbFinanceiro: TSpeedButton
      Left = 610
      Top = 3
      Width = 73
      Height = 58
      Cursor = crHandPoint
      Hint = 'Abre Financeiro'
      Caption = 'Financeiro'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888870007888888700070FBB08888880FBB0700070
        7888870007880888088888888888033308880000000008880008022888880333
        0208028888000FBB020808888088000088080888808880888808028888000888
        8208022888888888220800000000000000088888888888888888}
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = sbFinanceiroClick
    end
    object DBN1: TDBNavigator
      Left = 13
      Top = 4
      Width = 164
      Height = 57
      Cursor = crHandPoint
      Hint = 'Navega'#231#227'o Registros'
      DataSource = DSP
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      DragCursor = crHandPoint
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo'
        'Insert record'
        'Delete record'
        'Edit record'
        'Post edit'
        'Cancel edit'
        'Refresh data')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  inherited PCampos: TPanel
    Width = 884
    Align = alNone
    ExplicitWidth = 884
    object PageControl1: TPageControl
      Left = 1
      Top = 0
      Width = 883
      Height = 462
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Recep'#231#227'o'
        object Label1: TLabel
          Left = 2
          Top = 4
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 138
          Top = 4
          Width = 82
          Height = 13
          Caption = 'Data Cadastro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 54
          Width = 51
          Height = 13
          Caption = 'Paciente'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 2
          Top = 147
          Width = 65
          Height = 13
          Caption = 'Laborat'#243'rio'
          FocusControl = DBEdit4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 354
          Top = 147
          Width = 38
          Height = 13
          Caption = 'Exame'
          FocusControl = DBEdit6
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 3
          Top = 189
          Width = 68
          Height = 13
          Caption = 'Data Coleta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 252
          Top = 188
          Width = 33
          Height = 13
          Caption = 'Prazo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 350
          Top = 4
          Width = 45
          Height = 13
          Caption = 'Protocolo'
          FocusControl = DBEdit2
        end
        object Label18: TLabel
          Left = 259
          Top = 4
          Width = 23
          Height = 13
          Caption = 'Hora'
          FocusControl = DBEdit12
        end
        object Label31: TLabel
          Left = 126
          Top = 189
          Width = 68
          Height = 13
          Caption = 'Hora Coleta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 3
          Top = 95
          Width = 24
          Height = 13
          Caption = 'CPF'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 419
          Top = 95
          Width = 33
          Height = 13
          Caption = 'Idade'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 507
          Top = 95
          Width = 29
          Height = 13
          Caption = 'Sexo'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 291
          Top = 95
          Width = 116
          Height = 13
          Caption = 'Data de Nascimento'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 491
          Top = 53
          Width = 149
          Height = 13
          Caption = 'Origem (Unimed/Interagis)'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 396
          Top = 188
          Width = 30
          Height = 13
          Caption = 'Valor'
          FocusControl = DBEdit5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 501
          Top = 188
          Width = 94
          Height = 13
          Caption = 'Forma de Pagto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 163
          Top = 95
          Width = 64
          Height = 13
          Caption = 'Passaporte'
          FocusControl = DBEdit3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 185
          Top = 414
          Width = 320
          Height = 20
          Caption = 'F5 - PACIENTE (Detalhe/Complemento)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGreen
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 523
          Top = 415
          Width = 126
          Height = 20
          Caption = 'F3 - ETIQUETA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 663
          Top = 414
          Width = 212
          Height = 20
          Caption = 'F4 - ABRE RESULTADOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit1: TDBEdit
          Left = 2
          Top = 20
          Width = 134
          Height = 21
          DataField = 'PRO_COD'
          DataSource = DSP
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEdit3: TDBEdit
          Left = 3
          Top = 70
          Width = 78
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          TabOrder = 3
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 83
          Top = 70
          Width = 374
          Height = 21
          DataField = 'NomePaciente'
          DataSource = DSP
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 2
          Top = 163
          Width = 79
          Height = 21
          DataField = 'LAB_COD'
          DataSource = DSP
          TabOrder = 5
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 83
          Top = 163
          Width = 240
          Height = 21
          DataField = 'LAB_COD'
          DataSource = DSP
          KeyField = 'LAB_COD'
          ListField = 'LAB_LABT'
          ListSource = DMI.dsLaboratorios
          TabOrder = 6
          OnEnter = DBLookupComboBox2Enter
        end
        object DBEdit6: TDBEdit
          Left = 354
          Top = 163
          Width = 79
          Height = 21
          DataField = 'EXA_COD'
          DataSource = DSP
          TabOrder = 7
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 435
          Top = 163
          Width = 278
          Height = 21
          DataField = 'DescExame'
          DataSource = DSP
          TabOrder = 8
        end
        object bbtConsultaPacientes: TBitBtn
          Left = 459
          Top = 69
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 19
          OnClick = bbtConsultaPacientesClick
        end
        object DBEdit2: TDBEdit
          Left = 350
          Top = 20
          Width = 134
          Height = 21
          DataField = 'PRO_PROT'
          DataSource = DSP
          TabOrder = 11
        end
        object sbConsultarLab: TBitBtn
          Left = 323
          Top = 163
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 16
          OnClick = sbConsultarLabClick
        end
        object gbResultado: TGroupBox
          Left = 3
          Top = 234
          Width = 870
          Height = 69
          Caption = 'Resultado'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 28
          object DBGrid_Resultados: TDBGrid
            Left = 5
            Top = 17
            Width = 852
            Height = 48
            DataSource = DMI.DS_Procedimentos_Resultado
            Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = DBGrid_ResultadosDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'PRO_RESUL'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRO_VLOG'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PRO_UINT'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'PRO_CMLI'
                Visible = False
              end>
          end
        end
        object bbtConsultaLaboratorios: TBitBtn
          Left = 811
          Top = 126
          Width = 24
          Height = 20
          Caption = '...'
          TabOrder = 15
          Visible = False
          OnClick = bbtConsultaLaboratoriosClick
        end
        object DBDateEdit1: TJvDBDateEdit
          Left = 3
          Top = 204
          Width = 121
          Height = 21
          DataField = 'PRO_DCOL'
          DataSource = DSP
          NumGlyphs = 2
          ShowNullDate = False
          TabOrder = 9
        end
        object DBDateEdit6: TJvDBDateEdit
          Left = 137
          Top = 20
          Width = 121
          Height = 21
          DataField = 'PRO_DCAD'
          DataSource = DSP
          NumGlyphs = 2
          ShowNullDate = False
          TabOrder = 1
        end
        object DBEdit12: TDBEdit
          Left = 259
          Top = 20
          Width = 87
          Height = 21
          DataField = 'PRO_HCAD'
          DataSource = DSP
          TabOrder = 2
        end
        object bbtResultados: TBitBtn
          Left = 808
          Top = 8
          Width = 41
          Height = 25
          Caption = '...'
          TabOrder = 17
          Visible = False
          OnClick = bbtResultadosClick
        end
        object DBEdit16: TDBEdit
          Left = 126
          Top = 204
          Width = 123
          Height = 21
          DataField = 'PRO_HCOL'
          DataSource = DSP
          TabOrder = 10
        end
        object bbtEtiqueta: TBitBtn
          Left = 809
          Top = 40
          Width = 41
          Height = 25
          Caption = '...'
          TabOrder = 18
          Visible = False
          OnClick = bbtEtiquetaClick
        end
        object cb_Prazo: TDBComboBox
          Left = 250
          Top = 204
          Width = 145
          Height = 21
          DataField = 'PRO_PRAZO'
          DataSource = DSP
          Items.Strings = (
            'MESMO DIA'
            '6 HORAS'
            '24 HORAS'
            '48 HORAS'
            '72 HORAS')
          TabOrder = 12
          OnExit = cb_PrazoExit
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 3
          Top = 111
          Width = 158
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          KeyField = 'PES_COD'
          ListField = 'PES_CPF'
          ListSource = DMI.dsPacientes
          ReadOnly = True
          TabOrder = 20
        end
        object DBLookupComboBox5: TDBLookupComboBox
          Left = 419
          Top = 111
          Width = 86
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          KeyField = 'PES_COD'
          ListField = 'PES_IDA'
          ListSource = DMI.dsPacientes
          ReadOnly = True
          TabOrder = 21
        end
        object DBLookupComboBox6: TDBLookupComboBox
          Left = 507
          Top = 111
          Width = 158
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          KeyField = 'PES_COD'
          ListField = 'PES_SEXO'
          ListSource = DMI.dsPacientes
          ReadOnly = True
          TabOrder = 22
        end
        object DBLookupComboBox7: TDBLookupComboBox
          Left = 291
          Top = 111
          Width = 126
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          KeyField = 'PES_COD'
          ListField = 'PES_DNAS'
          ListSource = DMI.dsPacientes
          ReadOnly = True
          TabOrder = 23
        end
        object DBLookupComboBox8: TDBLookupComboBox
          Left = 491
          Top = 69
          Width = 198
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          KeyField = 'PES_COD'
          ListField = 'PES_CLAORI'
          ListSource = DMI.dsPacientes
          ReadOnly = True
          TabOrder = 24
        end
        object DBEdit5: TDBEdit
          Left = 396
          Top = 204
          Width = 101
          Height = 21
          DataField = 'PRO_VALOR'
          DataSource = DSP
          TabOrder = 13
        end
        object DBComboBox2: TDBComboBox
          Left = 499
          Top = 204
          Width = 174
          Height = 21
          DataField = 'PRO_TIPPAG'
          DataSource = DSP
          Items.Strings = (
            'DINHEIRO'
            'D'#201'BITO'
            'CR'#201'DITO'
            '2x'
            '3x'
            '4x'
            '5x'
            '6x'
            '7x'
            '8x'
            '9x'
            '10x'
            'FATURADO'
            'BB'
            'INTER')
          TabOrder = 14
        end
        object DBLookupComboBox9: TDBLookupComboBox
          Left = 163
          Top = 111
          Width = 126
          Height = 21
          DataField = 'PES_COD'
          DataSource = DSP
          KeyField = 'PES_COD'
          ListField = 'PES_PASS'
          ListSource = DMI.dsPacientes
          ReadOnly = True
          TabOrder = 25
        end
        object bbtPaciente: TBitBtn
          Left = 809
          Top = 70
          Width = 41
          Height = 25
          Caption = '...'
          TabOrder = 26
          Visible = False
          OnClick = bbtPacienteClick
        end
        object GroupBox1: TGroupBox
          Left = 3
          Top = 304
          Width = 870
          Height = 108
          Caption = 'Carga'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 27
          object DBGrid2: TDBGrid
            Left = 5
            Top = 17
            Width = 852
            Height = 85
            DataSource = DMI.ds_Procedimentos_Carga
            Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = DBGrid_ResultadosDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'PROC_DATA'
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROC_HORA'
                Title.Caption = 'Hora'
                Width = 64
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HOS_USUA'
                Title.Caption = 'Usu'#225'rio'
                Width = 64
                Visible = True
              end>
          end
        end
      end
      object tbHonorarios: TTabSheet
        Caption = 'Valores'
        TabVisible = False
        object Panel1: TPanel
          Left = 3
          Top = 0
          Width = 806
          Height = 47
          Color = clActiveBorder
          TabOrder = 0
          object bbtNovo: TBitBtn
            Left = 12
            Top = 10
            Width = 113
            Height = 31
            Hint = 'Clique aqui para INSERIR um valor de Pagamento.'
            Caption = 'Novo Pagto.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
              000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
              FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
              00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
              00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
              FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
              0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
              05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
              55557F7777777555555500000005555555557777777555555555}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = bbtNovoClick
          end
          object bbtExcluir: TBitBtn
            Left = 125
            Top = 10
            Width = 113
            Height = 31
            Hint = 'Clique aqui para EXCLUIR um valor de Pagamento.'
            Caption = 'Excluir Pagto.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333333333333333333FFF33FF333FFF339993370733
              999333777FF37FF377733339993000399933333777F777F77733333399970799
              93333333777F7377733333333999399933333333377737773333333333990993
              3333333333737F73333333333331013333333333333777FF3333333333910193
              333333333337773FF3333333399000993333333337377737FF33333399900099
              93333333773777377FF333399930003999333337773777F777FF339993370733
              9993337773337333777333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333333333}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtExcluirClick
          end
          object bbtSalvar: TBitBtn
            Left = 238
            Top = 10
            Width = 113
            Height = 31
            Hint = 'Clique aqui para SALVAR um valor de Pagamento.'
            Caption = 'Salvar Pagto.'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
              7700333333337777777733333333008088003333333377F73377333333330088
              88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
              000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
              FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
              99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
              99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
              99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
              93337FFFF7737777733300000033333333337777773333333333}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = bbtSalvarClick
          end
          object bbtCancelar: TBitBtn
            Left = 351
            Top = 10
            Width = 113
            Height = 31
            Hint = 'Clique aqui para CANCELAR a inclus'#227'o de um Pagamento.'
            Caption = 'Cancelar Pagto.'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
              33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
              993337777F777F3377F3393999707333993337F77737333337FF993399933333
              399377F3777FF333377F993339903333399377F33737FF33377F993333707333
              399377F333377FF3377F993333101933399377F333777FFF377F993333000993
              399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
              99333773FF777F777733339993707339933333773FF7FFF77333333999999999
              3333333777333777333333333999993333333333377777333333}
            NumGlyphs = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtCancelarClick
          end
          object BitBtn1: TBitBtn
            Left = 464
            Top = 10
            Width = 113
            Height = 31
            Hint = 'Clique aqui para voltar ao Cadastro do SCPG.'
            Caption = 'Fechar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
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
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = BitBtn1Click
          end
        end
        object GroupBox8: TGroupBox
          Left = 3
          Top = 50
          Width = 806
          Height = 135
          Caption = ' Forma de Pagamento '
          TabOrder = 1
          object Label36: TLabel
            Left = 132
            Top = 53
            Width = 44
            Height = 13
            Caption = '&Parcelas:'
          end
          object Label37: TLabel
            Left = 11
            Top = 53
            Width = 54
            Height = 13
            Caption = '&Honor'#225'rios:'
          end
          object Label22: TLabel
            Left = 10
            Top = 13
            Width = 54
            Height = 13
            Caption = 'Pagamento'
          end
          object Label41: TLabel
            Left = 10
            Top = 95
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
          end
          object ComboBoxParcelas: TComboBox
            Left = 132
            Top = 69
            Width = 85
            Height = 21
            TabOrder = 2
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
          end
          object ComboBoxTipoPagamento: TComboBox
            Left = 9
            Top = 30
            Width = 581
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            Items.Strings = (
              'DINHEIRO'
              'D'#201'BITO'
              'CR'#201'DITO'
              'FATURADO'
              'BB'
              'INTER')
          end
          object EdtObservacao: TEdit
            Left = 9
            Top = 109
            Width = 666
            Height = 21
            MaxLength = 80
            TabOrder = 1
          end
          object RxCalcEditValor: TJvCalcEdit
            Left = 9
            Top = 68
            Width = 113
            Height = 21
            DisplayFormat = ',0##'
            TabOrder = 3
            DecimalPlacesAlwaysShown = False
          end
        end
        object GroupBox9: TGroupBox
          Left = 4
          Top = 189
          Width = 805
          Height = 225
          Caption = ' Parcelamento '
          TabOrder = 2
          object DBGridPag: TDBGrid
            Left = 8
            Top = 16
            Width = 728
            Height = 198
            DataSource = ds_Parcelamento
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGridPagDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'PAR_DATA'
                Title.Caption = 'Data'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAR_NPARC'
                Title.Caption = 'N'#250'm. Parcela'
                Width = 102
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAR_VLR'
                Title.Caption = 'Valor'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAR_SIT'
                Title.Caption = 'Situa'#231#227'o'
                Width = 160
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAR_TPPG'
                Title.Caption = 'Tipo do Pagamento'
                Width = 64
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited PGrid: TPanel
    Left = 392
    Top = 541
    Width = 89
    Height = 72
    Align = alNone
    Visible = False
    ExplicitLeft = 392
    ExplicitTop = 541
    ExplicitWidth = 89
    ExplicitHeight = 72
  end
  inherited DSP: TDataSource
    DataSet = DMI.qProcedimentos
    Left = 648
    Top = 33
  end
  object ds_Parcelamento: TDataSource
    DataSet = DMI.qParcelamento_Infe
    Left = 816
    Top = 123
  end
  object qManutencaoParcelamento: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 675
    Top = 172
  end
  object PM_Documentos: TPopupMenu
    Left = 670
    Top = 358
    object Comprovante1: TMenuItem
      Caption = 'Comprovante'
      OnClick = Comprovante1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object EtiquetaTubo1: TMenuItem
      Caption = 'Etiqueta (Tubo)'
      Visible = False
      OnClick = EtiquetaTubo1Click
    end
    object N5: TMenuItem
      Caption = '-'
      Visible = False
    end
    object Mapa1: TMenuItem
      Caption = 'Mapa'
      OnClick = Mapa1Click
    end
    object N7: TMenuItem
      Caption = '-'
      Visible = False
    end
    object SenhasdeAtendimento1: TMenuItem
      Caption = 'Senhas de Atendimento'
      Visible = False
      OnClick = SenhasdeAtendimento1Click
    end
  end
  object qValorExames: TADOQuery
    Connection = DM.ADOC_SCPG
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftString
        Precision = 10
        Size = 16
        Value = '0'
      end>
    SQL.Strings = (
      'select e.exa_vpac from tb_exames e'
      'where e.exa_cod = :Codigo')
    Left = 675
    Top = 204
    object qValorExamesEXA_VPAC: TBCDField
      FieldName = 'EXA_VPAC'
      Precision = 18
      Size = 2
    end
  end
  object MainMenu1: TMainMenu
    Left = 744
    Top = 32
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Mdciso1: TMenuItem
        Caption = '_&M'#233'dicos'
        OnClick = Mdciso1Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Pacientes1: TMenuItem
        Caption = '_&Pacientes'
        OnClick = Pacientes1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Exames1: TMenuItem
        Caption = '_&Exames'
        OnClick = Exames1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object LaboratriosConveniados1: TMenuItem
        Caption = '_&Laborat'#243'rios'
        OnClick = LaboratriosConveniados1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Sair2: TMenuItem
        Caption = '&Sair'
        ImageIndex = 0
        OnClick = Sair2Click
      end
    end
    object Procedimentos1: TMenuItem
      Caption = '&Andamentos'
      object Procedimentos2: TMenuItem
        Caption = '_&Administra'#231#227'o'
        ImageIndex = 4
        OnClick = Procedimentos2Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Infecciosas1: TMenuItem
        Caption = '_&Consulta'
        OnClick = Infecciosas1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object ImportaFcil1: TMenuItem
        Caption = '_&Importa F'#225'cil'
        OnClick = ImportaFcil1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Geral1: TMenuItem
        Caption = 'Geral'
        OnClick = Geral1Click
      end
    end
    object Carga1: TMenuItem
      Caption = 'Carga'
      OnClick = Carga1Click
    end
    object Utilitrios1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object ZerarProtocolo1: TMenuItem
        Caption = 'Zerar Protocolo'
        OnClick = ZerarProtocolo1Click
      end
    end
  end
  object qBuscaPessoa: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Codigo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from tb_pacientes p'
      'where p.pes_cod = :Codigo')
    Left = 819
    Top = 244
    object qBuscaPessoaPES_COD: TIntegerField
      FieldName = 'PES_COD'
    end
    object qBuscaPessoaPES_NOME: TStringField
      FieldName = 'PES_NOME'
      Size = 60
    end
    object qBuscaPessoaPES_ESCV: TStringField
      FieldName = 'PES_ESCV'
      Size = 12
    end
    object qBuscaPessoaPES_IDA: TIntegerField
      FieldName = 'PES_IDA'
    end
    object qBuscaPessoaPES_SEXO: TStringField
      FieldName = 'PES_SEXO'
      Size = 10
    end
    object qBuscaPessoaPES_DNAS: TDateField
      FieldName = 'PES_DNAS'
    end
    object qBuscaPessoaPES_END: TStringField
      FieldName = 'PES_END'
      Size = 150
    end
    object qBuscaPessoaPES_CIES: TStringField
      FieldName = 'PES_CIES'
      Size = 50
    end
    object qBuscaPessoaPES_FRES: TStringField
      FieldName = 'PES_FRES'
      Size = 16
    end
    object qBuscaPessoaPES_FCEL: TStringField
      FieldName = 'PES_FCEL'
      Size = 16
    end
    object qBuscaPessoaPES_CPF: TStringField
      FieldName = 'PES_CPF'
      Size = 15
    end
    object qBuscaPessoaPES_RG: TStringField
      FieldName = 'PES_RG'
      Size = 30
    end
    object qBuscaPessoaPES_COD_INTERNET: TSmallintField
      FieldName = 'PES_COD_INTERNET'
    end
    object qBuscaPessoaPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Size = 100
    end
    object qBuscaPessoaPES_NUMCAR: TStringField
      FieldName = 'PES_NUMCAR'
      Size = 30
    end
    object qBuscaPessoaPES_CLAORI: TStringField
      FieldName = 'PES_CLAORI'
    end
  end
  object qAtualizaPessoa: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 787
    Top = 244
  end
  object qAtualizaCodigo: TADOQuery
    Connection = DMI.p_SCPG
    Parameters = <>
    Left = 755
    Top = 244
  end
  object qValorAcordo: TADOQuery
    Connection = DMI.p_SCPG
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'Labo'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select case when (a.aco_vlrimp is null) then 0 else a.aco_vlrimp' +
        ' end valor'
      'from tb_acordos a '
      'where a.lab_cod = :Labo'
      'and a.aco_vigente = 1'
      'and a.aco_covid = '#39'Sim'#39)
    Left = 128
    Top = 384
    object qValorAcordoVALOR: TBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
    end
  end
end
