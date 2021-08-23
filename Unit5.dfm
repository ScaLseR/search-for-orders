object Form5: TForm5
  Left = 440
  Top = 331
  Width = 380
  Height = 344
  Caption = #1042#1099#1073#1086#1088' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 8
    Top = 0
    Width = 153
    Height = 273
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = Button1Click
    OnEnter = Button1Click
  end
  object ListBox2: TListBox
    Left = 208
    Top = 0
    Width = 153
    Height = 273
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = Button2Click
    OnEnter = Button2Click
  end
  object Button1: TButton
    Left = 168
    Top = 64
    Width = 33
    Height = 25
    Caption = '-->'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 152
    Width = 33
    Height = 25
    Caption = '<--'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 48
    Top = 280
    Width = 75
    Height = 25
    Caption = #1042#1089#1077'-->'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 248
    Top = 280
    Width = 75
    Height = 25
    Caption = '<--Bce'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 144
    Top = 280
    Width = 83
    Height = 25
    Caption = 'Ok'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 328
    Top = 280
    Width = 33
    Height = 25
    Caption = 'Del'
    TabOrder = 7
    OnClick = Button6Click
  end
end
