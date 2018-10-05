object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 
    #1050#1086#1085#1074#1077#1088#1090#1086#1088' '#1080#1079' '#1091#1087#1072#1082#1086#1074#1072#1085#1085#1086#1075#1086' '#1092#1086#1088#1084#1072#1090#1072' "S" '#1074' '#1085#1077#1091#1087#1072#1082#1086#1074#1072#1085#1085#1099#1081' '#1092#1086#1088#1084#1072#1090' "sd' +
    'i"'
  ClientHeight = 347
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 49
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 13
      Width = 125
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 192
      Top = 13
      Width = 137
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 49
    Width = 557
    Height = 298
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
    ExplicitTop = 44
  end
  object OpenDialog1: TOpenDialog
    Filter = #1059#1087#1072#1082#1086#1074#1072#1085#1085#1099#1081' SDI (*.s)|*.s|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 376
    Top = 12
  end
end
