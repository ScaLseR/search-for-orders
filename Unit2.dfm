object Form2: TForm2
  Left = 985
  Top = 147
  Width = 256
  Height = 638
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 8
    Width = 40
    Height = 16
    Caption = #1055#1086#1080#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 209
    Height = 513
    DataSource = Form1.DataSource1
    Options = [dgTitles, dgColumnResize, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnEnter = Button1Click
    OnKeyPress = DBGrid1KeyPress
  end
  object Button1: TButton
    Left = 80
    Top = 568
    Width = 81
    Height = 25
    Caption = 'ok'
    TabOrder = 1
    OnClick = Button1Click
    OnEnter = Button1Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 8
    Width = 161
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
end
