object Form4: TForm4
  Left = 442
  Top = 329
  Width = 379
  Height = 346
  Caption = #1042#1099#1073#1086#1088' '#1072#1074#1090#1086#1088#1072
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
    Top = 144
    Width = 33
    Height = 25
    Caption = '<--'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 40
    Top = 280
    Width = 81
    Height = 25
    Caption = #1042#1089#1077' -->'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 248
    Top = 280
    Width = 81
    Height = 25
    Caption = '<-- '#1042#1089#1077
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 144
    Top = 280
    Width = 81
    Height = 25
    Caption = #1054#1050
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 336
    Top = 280
    Width = 33
    Height = 25
    Caption = 'Del'
    TabOrder = 7
    OnClick = Button6Click
  end
end
