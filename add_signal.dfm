object AddSigmalForm: TAddSigmalForm
  Left = 0
  Top = 0
  Caption = 'AddSigmalForm'
  ClientHeight = 554
  ClientWidth = 597
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
  object Label1: TLabel
    Left = 19
    Top = 50
    Width = 95
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1080#1075#1085#1072#1083#1072':'
  end
  object vt: TLabel
    Left = 16
    Top = 15
    Width = 31
    Height = 13
    Caption = #1084#1077#1085#1102':'
  end
  object Label5: TLabel
    Left = 172
    Top = 13
    Width = 65
    Height = 13
    Caption = #1090#1080#1087' '#1089#1080#1075#1085#1072#1083#1072':'
  end
  object Label2: TLabel
    Left = 395
    Top = 50
    Width = 15
    Height = 13
    Caption = 'ID:'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 74
    Width = 581
    Height = 431
    ItemHeight = 13
    TabOrder = 0
  end
  object NameEdit: TEdit
    Left = 120
    Top = 47
    Width = 201
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'fgsfgsdfs'
    OnChange = NameEditChange
  end
  object AddSigButton: TButton
    Left = 351
    Top = 8
    Width = 126
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1080#1075#1085#1072#1083'...'
    TabOrder = 2
    OnClick = AddSigButtonClick
  end
  object OKBitBtn: TBitBtn
    Left = 412
    Top = 516
    Width = 75
    Height = 25
    DoubleBuffered = True
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 508
    Top = 516
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    DoubleBuffered = True
    Kind = bkCancel
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  object StatusPanel: TPanel
    Left = 16
    Top = 516
    Width = 377
    Height = 25
    BevelOuter = bvLowered
    ParentBackground = False
    TabOrder = 5
  end
  object SigListCbB: TComboBox
    Left = 53
    Top = 12
    Width = 89
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 0
    TabOrder = 6
    Text = 'MPEG-2'
    OnChange = SigListCbBChange
    Items.Strings = (
      'MPEG-2'
      'MPEG-4'
      'SDI'
      'HD-SDI'
      'Test MPEG')
  end
  object SigTypeCbB: TComboBox
    Left = 243
    Top = 10
    Width = 78
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    ItemIndex = 0
    TabOrder = 7
    Text = 'MPEG-1'
    OnChange = SigListCbBChange
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
  object IDEdit: TEdit
    Left = 416
    Top = 47
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    Filter = #1057#1080#1075#1085#1072#1083' (*.sig)|*.sig|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 24
    Top = 224
  end
end
