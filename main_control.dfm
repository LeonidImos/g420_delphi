object ControlForm: TControlForm
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1043'-420'
  ClientHeight = 460
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 13
      Top = 14
      Width = 14
      Height = 13
      Caption = 'IP:'
    end
    object ConnectEdit: TEdit
      Left = 33
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '192.168.111.213'
    end
    object ConnectButton: TButton
      Left = 160
      Top = 10
      Width = 145
      Height = 21
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
      TabOrder = 1
      OnClick = ConnectButtonClick
    end
    object ConnectStatusPanel: TPanel
      Left = 311
      Top = 10
      Width = 253
      Height = 21
      BevelOuter = bvLowered
      ParentBackground = False
      TabOrder = 2
    end
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 37
    Width = 575
    Height = 423
    Align = alClient
    TabOrder = 1
    OnChange = TabControl1Change
    object Panel2: TPanel
      Left = 4
      Top = 6
      Width = 567
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 9
        Top = 10
        Width = 125
        Height = 21
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1089#1080#1075#1085#1072#1083
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
          70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
          70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
          70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object g420_bitrateOutEdit: TEdit
        Left = 291
        Top = 10
        Width = 81
        Height = 21
        Enabled = False
        TabOrder = 0
        Text = '2049952'
      end
      object CheckBox1: TCheckBox
        Left = 154
        Top = 12
        Width = 137
        Height = 17
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1073#1080#1090#1088#1077#1081#1090' '#1085#1072':'
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object t2miSetButton: TButton
        Left = 392
        Top = 10
        Width = 125
        Height = 21
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' T2-MI...'
        TabOrder = 2
        OnClick = t2miSetButtonClick
      end
    end
    object ListBox1: TListBox
      Left = 4
      Top = 47
      Width = 567
      Height = 372
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = ListBox1Click
    end
  end
end
