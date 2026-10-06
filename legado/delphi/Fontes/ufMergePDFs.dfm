object Form1: TForm1
  Left = 193
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 424
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Merge'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 16
    Width = 769
    Height = 249
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object ProgressBar1: TProgressBar
    Left = 408
    Top = 320
    Width = 150
    Height = 17
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Ler Diret'#243'rio'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
