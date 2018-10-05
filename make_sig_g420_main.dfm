object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1086#1087#1080#1089#1072#1090#1077#1083#1077#1081' '#1089#1080#1075#1085#1072#1083#1086#1074' '#1076#1083#1103'  '#1043'-420'
  ClientHeight = 647
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 13
    Top = 355
    Width = 88
    Height = 13
    Caption = #1046#1091#1088#1085#1072#1083' '#1086#1096#1080#1073#1086#1082': '
  end
  object Label2: TLabel
    Left = 434
    Top = 143
    Width = 59
    Height = 13
    Caption = 'delta_pts = '
  end
  object Label1: TLabel
    Left = 13
    Top = 50
    Width = 95
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1080#1075#1085#1072#1083#1072':'
  end
  object Label5: TLabel
    Left = 12
    Top = 20
    Width = 65
    Height = 13
    Caption = #1090#1080#1087' '#1089#1080#1075#1085#1072#1083#1072':'
  end
  object Label4: TLabel
    Left = 180
    Top = 20
    Width = 15
    Height = 13
    Caption = 'ID:'
  end
  object AddFileButton: TButton
    Left = 335
    Top = 15
    Width = 119
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' ...'
    TabOrder = 0
    OnClick = AddFileButtonClick
  end
  object StatusPanel: TPanel
    Left = 13
    Top = 580
    Width = 575
    Height = 25
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 5
    Top = 376
    Width = 581
    Height = 189
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object ClearLogButton: TButton
    Left = 117
    Top = 350
    Width = 113
    Height = 20
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083
    TabOrder = 3
    OnClick = ClearLogButtonClick
  end
  object ListBox2: TListBox
    Left = 443
    Top = 220
    Width = 145
    Height = 125
    ItemHeight = 13
    TabOrder = 4
  end
  object ChangeDeltaPtsButton: TButton
    Left = 434
    Top = 162
    Width = 145
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' delta_pts'
    Enabled = False
    TabOrder = 5
    OnClick = ChangeDeltaPtsButtonClick
  end
  object Edit2: TEdit
    Left = 502
    Top = 140
    Width = 77
    Height = 21
    TabOrder = 6
  end
  object ListBox1: TListBox
    Left = 7
    Top = 142
    Width = 421
    Height = 203
    ItemHeight = 13
    TabOrder = 7
    OnClick = ListBox1Click
  end
  object Edit1: TEdit
    Left = 120
    Top = 47
    Width = 201
    Height = 21
    TabOrder = 8
    OnChange = Edit1Change
  end
  object DelFileButton: TButton
    Left = 460
    Top = 15
    Width = 123
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083
    Enabled = False
    TabOrder = 9
    OnClick = DelFileButtonClick
  end
  object ComboBox2: TComboBox
    Left = 83
    Top = 17
    Width = 78
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 10
    Text = 'MPEG-1'
    OnChange = ComboBox2Change
    Items.Strings = (
      'MPEG-1'
      'MPEG-2'
      'MPEG-4'
      'AVC'
      'reserv4'
      'reserv5'
      'reserv6'
      'reserv7'
      'SDI'
      'HD-SDI')
  end
  object SaveSigBitBtn: TBitBtn
    Left = 341
    Top = 614
    Width = 98
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 11
    OnClick = SaveSigBitBtnClick
  end
  object SaveSigAsBitBtn: TBitBtn
    Left = 451
    Top = 614
    Width = 137
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082' ...'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 12
    OnClick = SaveSigAsBitBtnClick
  end
  object OpenSigBitBtn: TBitBtn
    Left = 173
    Top = 614
    Width = 117
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' ...'
    DoubleBuffered = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      555555555555555555555555555555555555555FFFFFFFFFF555550000000000
      55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
      B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
      000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
      555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
      55555575FFF75555555555700007555555555557777555555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 13
    OnClick = OpenSigBitBtnClick
  end
  object g450tog420_ChB: TCheckBox
    Left = 13
    Top = 74
    Width = 320
    Height = 17
    Caption = #1047#1072#1084#1077#1085#1103#1090#1100' G-450 '#1085#1072' G-420 '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1092#1072#1081#1083#1086#1074' MPEG'
    TabOrder = 14
  end
  object Edit3: TEdit
    Left = 201
    Top = 17
    Width = 57
    Height = 21
    TabOrder = 15
    OnChange = Edit3Change
    OnExit = Edit3Exit
  end
  object ts_id_change_ChB: TCheckBox
    Left = 13
    Top = 92
    Width = 320
    Height = 17
    Caption = #1047#1072#1084#1077#1085#1103#1090#1100' transport_stream_id, '#1095#1090#1086#1073#1099' '#1089#1086#1074#1087#1072#1076#1072#1083' '#1089' ID'
    TabOrder = 16
  end
  object ClearSigButton: TButton
    Left = 392
    Top = 70
    Width = 181
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' ('#1085#1086#1074#1099#1081' '#1089#1080#1075#1085#1072#1083')'
    TabOrder = 17
    OnClick = ClearSigButtonClick
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      #1055#1086#1090#1086#1082' (*.m2t, *.ts)|*.m2t; *.ts|'#1054#1087#1080#1089#1072#1090#1077#1083#1100' (*.cnf)|*.cnf|'#1042#1089#1077' '#1092#1072#1081#1083 +
      #1099' (*.*)|*.*'
    Left = 24
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    Left = 92
    Top = 220
  end
end
