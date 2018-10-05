object Form1: TForm1
  Left = 1579
  Top = 70
  BorderStyle = bsDialog
  Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1058#1055
  ClientHeight = 675
  ClientWidth = 908
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 57
    Top = 0
    Width = 851
    Height = 637
    ActivePage = TabSheet7
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '0'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label4: TLabel
        Left = 208
        Top = 64
        Width = 154
        Height = 16
        Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103' '#1040#1058#1055
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Memo1: TMemo
        Left = 192
        Top = 160
        Width = 209
        Height = 73
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          ' '#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1080#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1080' '#1040#1058#1055'.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = '1'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object RadioButton1: TRadioButton
        Left = 192
        Top = 112
        Width = 113
        Height = 17
        Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 192
        Top = 160
        Width = 113
        Height = 17
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
        TabOrder = 1
      end
      object RadioButton3: TRadioButton
        Left = 192
        Top = 208
        Width = 137
        Height = 17
        Caption = #1044#1077#1080#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
        TabOrder = 2
      end
      object RadioGroup1: TRadioGroup
        Left = 408
        Top = 40
        Width = 73
        Height = 121
        Caption = 'RadioGroup1'
        TabOrder = 3
        Visible = False
      end
      object TestButton: TButton
        Left = 192
        Top = 271
        Width = 75
        Height = 25
        Caption = 'TEST'
        TabOrder = 4
        Visible = False
        OnClick = TestButtonClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = '2'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo2: TMemo
        Left = 64
        Top = 56
        Width = 457
        Height = 81
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          #1055#1086#1080#1089#1082' '#1040#1058#1055)
        ReadOnly = True
        TabOrder = 0
      end
      object ProgressBar1: TProgressBar
        Left = 32
        Top = 216
        Width = 545
        Height = 16
        Max = 10
        TabOrder = 1
      end
    end
    object TabSheet4: TTabSheet
      Caption = '3'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo3: TMemo
        Left = 176
        Top = 40
        Width = 97
        Height = 177
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          #1053#1072#1081#1076#1077#1085#1099' '#1087#1088#1080#1073#1086#1088#1099
          #1089#1086' '#1089#1083#1077#1076#1091#1102#1097#1080#1084#1080' '
          #1079#1072#1074#1086#1076#1089#1082#1080#1084#1080' '
          #1085#1086#1084#1077#1088#1072#1084#1080':'
          ''
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1080#1073#1086#1088'  '
          #1076#1083#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '
          #1085#1072#1089#1090#1088#1086#1077#1082'.')
        ReadOnly = True
        TabOrder = 0
      end
      object ListBox1: TListBox
        Left = 344
        Top = 40
        Width = 97
        Height = 201
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 14
        ParentFont = False
        TabOrder = 1
        OnClick = ListBox1Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = '4'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 184
        Top = 80
        Width = 130
        Height = 13
        Caption = 'IP '#1079#1072#1087#1088#1086#1089#1072': 192.168.1.255'
      end
      object Label2: TLabel
        Left = 184
        Top = 108
        Width = 93
        Height = 13
        Caption = #1047#1072#1074#1086#1076#1089#1082#1086#1081' '#1085#1086#1084#1077#1088':'
      end
      object Label3: TLabel
        Left = 204
        Top = 144
        Width = 149
        Height = 13
        Caption = #1052#1040#1057' '#1072#1076#1088#1077#1089': 00:00:00:00:00:00'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 168
        Top = 168
        Width = 186
        Height = 13
        Caption = #1053#1086#1074#1099#1081' '#1052#1040#1057' '#1072#1076#1088#1077#1089': 00:00:00:00:00:00'
      end
      object Label6: TLabel
        Left = 64
        Top = 128
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Edit1: TEdit
        Left = 296
        Top = 104
        Width = 73
        Height = 21
        MaxLength = 6
        TabOrder = 0
        OnChange = Edit1Change
        OnKeyPress = Edit1KeyPress
      end
    end
    object TabSheet6: TTabSheet
      Caption = '5'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object OptIn1Bevel: TBevel
        Left = 400
        Top = 176
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel12: TBevel
        Left = 416
        Top = 176
        Width = 17
        Height = 57
        Shape = bsLeftLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel11: TBevel
        Left = 416
        Top = 152
        Width = 17
        Height = 25
        Shape = bsBottomLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel13: TBevel
        Left = 416
        Top = 232
        Width = 201
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut1Bevel: TBevel
        Left = 600
        Top = 136
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut2Bevel: TBevel
        Left = 600
        Top = 256
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel14: TBevel
        Left = 600
        Top = 232
        Width = 17
        Height = 25
        Shape = bsRightLine
        Style = bsRaised
        Visible = False
      end
      object Opt1ASIBevel: TBevel
        Left = 188
        Top = 124
        Width = 245
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptIn3Bevel: TBevel
        Left = 400
        Top = 416
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object Opt3ASIBevel: TBevel
        Left = 188
        Top = 364
        Width = 245
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel31: TBevel
        Left = 416
        Top = 392
        Width = 17
        Height = 25
        Shape = bsBottomLine
        Style = bsRaised
        Visible = False
      end
      object OptOut3Bevel: TBevel
        Left = 600
        Top = 376
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut4Bevel: TBevel
        Left = 600
        Top = 496
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel33: TBevel
        Left = 416
        Top = 472
        Width = 201
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel32: TBevel
        Left = 416
        Top = 416
        Width = 17
        Height = 57
        Shape = bsLeftLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel34: TBevel
        Left = 600
        Top = 472
        Width = 17
        Height = 25
        Shape = bsRightLine
        Style = bsRaised
        Visible = False
      end
      object OptIn2Bevel: TBevel
        Left = 400
        Top = 296
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object Opt2ASIBevel: TBevel
        Left = 188
        Top = 244
        Width = 245
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptIn4Bevel: TBevel
        Left = 400
        Top = 536
        Width = 33
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object Opt4ASIBevel: TBevel
        Left = 188
        Top = 484
        Width = 245
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel21: TBevel
        Left = 416
        Top = 272
        Width = 17
        Height = 25
        Shape = bsBottomLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel22: TBevel
        Left = 416
        Top = 296
        Width = 17
        Height = 57
        Shape = bsLeftLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel23: TBevel
        Left = 416
        Top = 352
        Width = 201
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel24: TBevel
        Left = 600
        Top = 352
        Width = 17
        Height = 25
        Shape = bsRightLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel15: TBevel
        Left = 600
        Top = 256
        Width = 17
        Height = 25
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel25: TBevel
        Left = 600
        Top = 376
        Width = 17
        Height = 25
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object T2MIBevel35: TBevel
        Left = 600
        Top = 496
        Width = 17
        Height = 25
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut2Bevel2: TBevel
        Left = 600
        Top = 280
        Width = 60
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut2Bevel3: TBevel
        Left = 640
        Top = 225
        Width = 20
        Height = 55
        Shape = bsRightLine
        Style = bsRaised
        Visible = False
      end
      object OptOut3Bevel2: TBevel
        Left = 600
        Top = 400
        Width = 60
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut4Bevel2: TBevel
        Left = 600
        Top = 520
        Width = 60
        Height = 17
        Shape = bsTopLine
        Style = bsRaised
        Visible = False
      end
      object OptOut3Bevel3: TBevel
        Left = 640
        Top = 345
        Width = 20
        Height = 55
        Shape = bsRightLine
        Style = bsRaised
        Visible = False
      end
      object OptOut4Bevel3: TBevel
        Left = 640
        Top = 465
        Width = 20
        Height = 55
        Shape = bsRightLine
        Style = bsRaised
        Visible = False
      end
      object OptIn1Panel: TPanel
        Left = 216
        Top = 136
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Visible = False
        object Label13: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' SPI'
        end
        object OptIn1CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InPort1CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object SPI1_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          TabOrder = 2
          Visible = False
        end
        object SPI1_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 3
          Visible = False
        end
      end
      object BA1Panel: TPanel
        Left = 432
        Top = 120
        Width = 169
        Height = 73
        BevelInner = bvLowered
        Caption = #1041#1083#1086#1082' '#1072#1085#1072#1083#1080#1079#1072' 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Opt1ASI_CB: TCheckBox
          Left = 8
          Top = 8
          Width = 45
          Height = 17
          Caption = 'ASI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Opt_CBClick
        end
        object Opt1SPI_CB: TCheckBox
          Left = 8
          Top = 48
          Width = 45
          Height = 17
          Caption = 'SPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Opt_CBClick
        end
        object Opt1out_CB: TCheckBox
          Left = 112
          Top = 8
          Width = 45
          Height = 17
          Caption = #1042#1099#1093'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Opt_CBClick
        end
      end
      object OptOut1Panel: TPanel
        Left = 632
        Top = 120
        Width = 185
        Height = 105
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
        object Label15: TLabel
          Left = 24
          Top = 4
          Width = 105
          Height = 16
          Caption = #1042#1099#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103
        end
        object OutPort1CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object OptOut1CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
          OnChange = OptCBChange
        end
        object Out1_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 2
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out1_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          Enabled = False
          TabOrder = 3
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out1_SPI1_ChB: TCheckBox
          Left = 8
          Top = 83
          Width = 77
          Height = 17
          Caption = #1041#1040'2 '#1074#1099#1093
          TabOrder = 4
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out1_SPI2_ChB: TCheckBox
          Left = 104
          Top = 83
          Width = 77
          Height = 17
          Caption = #1041#1040'3 '#1074#1099#1093
          Enabled = False
          TabOrder = 5
          Visible = False
          OnClick = Out_mult_ChBClick
        end
      end
      object OptIn2Panel: TPanel
        Left = 216
        Top = 256
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        Visible = False
        object Label17: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' SPI'
        end
        object OptIn2CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InPort2CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object SPI2_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          TabOrder = 2
          Visible = False
        end
        object SPI2_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 3
          Visible = False
        end
      end
      object BA2Panel: TPanel
        Left = 432
        Top = 240
        Width = 169
        Height = 73
        BevelInner = bvLowered
        Caption = #1041#1083#1086#1082' '#1072#1085#1072#1083#1080#1079#1072' 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
        object Opt2ASI_CB: TCheckBox
          Left = 8
          Top = 8
          Width = 45
          Height = 17
          Caption = 'ASI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Opt_CBClick
        end
        object Opt2SPI_CB: TCheckBox
          Left = 8
          Top = 48
          Width = 45
          Height = 17
          Caption = 'SPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Opt_CBClick
        end
        object Opt2out_CB: TCheckBox
          Left = 112
          Top = 8
          Width = 45
          Height = 17
          Caption = #1042#1099#1093'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Opt_CBClick
        end
      end
      object OptOut2Panel: TPanel
        Left = 632
        Top = 240
        Width = 185
        Height = 105
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        Visible = False
        object Label19: TLabel
          Left = 24
          Top = 4
          Width = 105
          Height = 16
          Caption = #1042#1099#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103
        end
        object OutPort2CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object OptOut2CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
          OnChange = OptCBChange
        end
        object Out2_SPI2_ChB: TCheckBox
          Left = 104
          Top = 83
          Width = 77
          Height = 17
          Caption = #1041#1040'4 '#1074#1099#1093
          Enabled = False
          TabOrder = 2
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out2_SPI1_ChB: TCheckBox
          Left = 8
          Top = 83
          Width = 77
          Height = 17
          Caption = #1041#1040'3 '#1074#1099#1093
          TabOrder = 3
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out2_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          Enabled = False
          TabOrder = 4
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out2_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 5
          Visible = False
          OnClick = Out_mult_ChBClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 356
        Top = 0
        Width = 461
        Height = 89
        Caption = ' '#1042#1099#1073#1086#1088' '#1088#1072#1079#1098#1077#1084#1086#1074' '#1085#1072' '#1073#1083#1086#1082#1077' '#1089#1086#1087#1088#1103#1078#1077#1085#1080#1103' '
        TabOrder = 6
        object BA1_SPInum_label: TLabel
          Left = 12
          Top = 32
          Width = 128
          Height = 13
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1041#1040'1:'
        end
        object BA2_SPInum_label: TLabel
          Left = 12
          Top = 60
          Width = 128
          Height = 13
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1041#1040'2:'
          Visible = False
        end
        object BA3_SPInum_label: TLabel
          Left = 256
          Top = 32
          Width = 128
          Height = 13
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1041#1040'3:'
          Visible = False
        end
        object BA4_SPInum_label: TLabel
          Left = 256
          Top = 60
          Width = 128
          Height = 13
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1041#1040'4:'
          Visible = False
        end
        object BA1_SPInum_CB: TComboBox
          Left = 144
          Top = 28
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = #1059#1087#1088'. 1'
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4')
        end
        object BA2_SPInum_CB: TComboBox
          Left = 144
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 1
          ParentFont = False
          TabOrder = 1
          Text = #1059#1087#1088'. 2'
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4')
        end
        object BA3_SPInum_CB: TComboBox
          Left = 388
          Top = 28
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 2
          ParentFont = False
          TabOrder = 2
          Text = #1059#1087#1088'. 3'
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4')
        end
        object BA4_SPInum_CB: TComboBox
          Left = 388
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemIndex = 3
          ParentFont = False
          TabOrder = 3
          Text = #1059#1087#1088'. 4'
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4')
        end
      end
      object OptIn1ASIPanel: TPanel
        Left = 4
        Top = 108
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        Visible = False
        object Label7: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' ASI'
        end
        object ASIport1Label: TLabel
          Left = 8
          Top = 60
          Width = 84
          Height = 16
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088'.:'
          Visible = False
        end
        object OptASI1CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InASIPort1CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
      end
      object OptIn2ASIPanel: TPanel
        Left = 4
        Top = 228
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        Visible = False
        object Label9: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' ASI'
        end
        object ASIport2Label: TLabel
          Left = 8
          Top = 60
          Width = 84
          Height = 16
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088'.:'
          Visible = False
        end
        object OptASI2CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InASIPort2CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
      end
      object OptIn3ASIPanel: TPanel
        Left = 4
        Top = 348
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Visible = False
        object Label11: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' ASI'
        end
        object ASIport3Label: TLabel
          Left = 8
          Top = 60
          Width = 84
          Height = 16
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088'.:'
          Visible = False
        end
        object OptASI3CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InASIPort3CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
      end
      object OptIn3Panel: TPanel
        Left = 216
        Top = 376
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        Visible = False
        object Label21: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' SPI'
        end
        object OptIn3CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InPort3CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object SPI3_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          TabOrder = 2
          Visible = False
        end
        object SPI3_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 3
          Visible = False
        end
      end
      object BA3Panel: TPanel
        Left = 432
        Top = 360
        Width = 169
        Height = 73
        BevelInner = bvLowered
        Caption = #1041#1083#1086#1082' '#1072#1085#1072#1083#1080#1079#1072' 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        Visible = False
        object Opt3ASI_CB: TCheckBox
          Left = 8
          Top = 8
          Width = 45
          Height = 17
          Caption = 'ASI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Opt_CBClick
        end
        object Opt3SPI_CB: TCheckBox
          Left = 8
          Top = 48
          Width = 45
          Height = 17
          Caption = 'SPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Opt_CBClick
        end
        object Opt3out_CB: TCheckBox
          Left = 112
          Top = 8
          Width = 45
          Height = 17
          Caption = #1042#1099#1093'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Opt_CBClick
        end
      end
      object OptOut3Panel: TPanel
        Left = 632
        Top = 360
        Width = 185
        Height = 105
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        Visible = False
        object Label23: TLabel
          Left = 24
          Top = 4
          Width = 105
          Height = 16
          Caption = #1042#1099#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103
        end
        object OutPort3CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object OptOut3CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
          OnChange = OptCBChange
        end
        object Out3_SPI1_ChB: TCheckBox
          Left = 8
          Top = 83
          Width = 77
          Height = 17
          Caption = #1041#1040'4 '#1074#1099#1093
          TabOrder = 2
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out3_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          Enabled = False
          TabOrder = 3
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out3_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 4
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out3_SPI2_ChB: TCheckBox
          Left = 104
          Top = 83
          Width = 77
          Height = 17
          Caption = 'none'
          Enabled = False
          TabOrder = 5
          Visible = False
          OnClick = Out_mult_ChBClick
        end
      end
      object OptIn4ASIPanel: TPanel
        Left = 4
        Top = 468
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        Visible = False
        object Label25: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' ASI'
        end
        object ASIport4Label: TLabel
          Left = 8
          Top = 60
          Width = 84
          Height = 16
          Caption = #1056#1072#1079#1098#1077#1084' '#1091#1087#1088'.:'
          Visible = False
        end
        object OptASI4CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InASIPort4CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
      end
      object OptIn4Panel: TPanel
        Left = 216
        Top = 496
        Width = 185
        Height = 89
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        Visible = False
        object Label27: TLabel
          Left = 24
          Top = 4
          Width = 139
          Height = 16
          Caption = #1042#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103' '#1085#1072' SPI'
        end
        object OptIn4CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 0
          OnChange = OptCBChange
        end
        object InPort4CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object SPI4_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          TabOrder = 2
          Visible = False
        end
        object SPI4_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 3
          Visible = False
        end
      end
      object BA4Panel: TPanel
        Left = 432
        Top = 480
        Width = 169
        Height = 73
        BevelInner = bvLowered
        Caption = #1041#1083#1086#1082' '#1072#1085#1072#1083#1080#1079#1072' 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        Visible = False
        object Opt4ASI_CB: TCheckBox
          Left = 8
          Top = 8
          Width = 45
          Height = 17
          Caption = 'ASI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Opt_CBClick
        end
        object Opt4SPI_CB: TCheckBox
          Left = 8
          Top = 48
          Width = 45
          Height = 17
          Caption = 'SPI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Opt_CBClick
        end
        object Opt4out_CB: TCheckBox
          Left = 112
          Top = 8
          Width = 45
          Height = 17
          Caption = #1042#1099#1093'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Opt_CBClick
        end
      end
      object OptOut4Panel: TPanel
        Left = 632
        Top = 480
        Width = 185
        Height = 105
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
        Visible = False
        object Label29: TLabel
          Left = 24
          Top = 4
          Width = 105
          Height = 16
          Caption = #1042#1099#1093#1086#1076#1085#1072#1103' '#1086#1087#1094#1080#1103
        end
        object OutPort4CB: TComboBox
          Tag = 128
          Left = 112
          Top = 56
          Width = 65
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = #1059#1087#1088'. 1'
          Visible = False
          OnChange = PortCBChange
          Items.Strings = (
            #1059#1087#1088'. 1'
            #1059#1087#1088'. 2'
            #1059#1087#1088'. 3'
            #1059#1087#1088'. 4'
            #1059#1087#1088'. 5'
            #1059#1087#1088'. 6'
            #1059#1087#1088'. 7'
            #1059#1087#1088'. 8')
        end
        object OptOut4CB: TComboBox
          Left = 8
          Top = 24
          Width = 169
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
          OnChange = OptCBChange
        end
        object Out4_ASI2_ChB: TCheckBox
          Left = 63
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI2'
          Enabled = False
          TabOrder = 2
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out4_ASI1_ChB: TCheckBox
          Left = 8
          Top = 60
          Width = 49
          Height = 17
          Caption = 'ASI1'
          TabOrder = 3
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out4_SPI2_ChB: TCheckBox
          Left = 104
          Top = 83
          Width = 77
          Height = 17
          Caption = 'none'
          Enabled = False
          TabOrder = 4
          Visible = False
          OnClick = Out_mult_ChBClick
        end
        object Out4_SPI1_ChB: TCheckBox
          Left = 8
          Top = 83
          Width = 77
          Height = 17
          Caption = 'none'
          TabOrder = 5
          Visible = False
          OnClick = Out_mult_ChBClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 0
        Width = 337
        Height = 89
        Caption = #1040#1087#1087#1072#1088#1072#1090#1085#1072#1103' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
        TabOrder = 17
        object ModificCB: TComboBox
          Left = 12
          Top = 56
          Width = 313
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 0
          Text = #1073#1072#1079#1086#1074#1072#1103' (1 '#1073#1083#1086#1082' '#1072#1085#1072#1083#1080#1079#1072')'
          OnChange = ConfCBChange
          Items.Strings = (
            #1073#1072#1079#1086#1074#1072#1103' (1 '#1073#1083#1086#1082' '#1072#1085#1072#1083#1080#1079#1072')'
            '2TS (2 '#1085#1077#1079#1072#1074#1080#1089#1080#1084#1099#1093' '#1073#1083#1086#1082#1072' '#1072#1085#1072#1083#1080#1079#1072')'
            'T2-MI (2 '#1073#1083#1086#1082#1072' '#1072#1085#1072#1083#1080#1079#1072' '#1089#1086#1077#1076#1080#1085#1077#1085#1099')')
        end
        object DeviceCB: TComboBox
          Left = 12
          Top = 24
          Width = 313
          Height = 22
          Style = csOwnerDrawFixed
          TabOrder = 1
          OnChange = ConfCBChange
          Items.Strings = (
            #1040#1058#1055
            #1042#1099#1073#1086#1088#1086#1095#1085#1072#1103' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1040#1058#1055'-1'
            #1040#1058#1057
            #1042#1099#1073#1086#1088#1086#1095#1085#1072#1103' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103' '#1040#1058#1057'-3')
        end
      end
      object BA_1LinkCB: TCheckBox
        Left = 425
        Top = 204
        Width = 200
        Height = 17
        Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100' '#1073#1083#1086#1082#1080' '#1072#1085#1072#1083#1080#1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
        OnClick = Opt_CBClick
      end
      object BA_2LinkCB: TCheckBox
        Left = 425
        Top = 324
        Width = 200
        Height = 17
        Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100' '#1073#1083#1086#1082#1080' '#1072#1085#1072#1083#1080#1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 19
        OnClick = Opt_CBClick
      end
      object BA_3LinkCB: TCheckBox
        Left = 425
        Top = 444
        Width = 200
        Height = 17
        Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100' '#1073#1083#1086#1082#1080' '#1072#1085#1072#1083#1080#1079#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 20
        OnClick = Opt_CBClick
      end
    end
    object TabSheet7: TTabSheet
      Caption = '6'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ProgramButton: TButton
        Left = 292
        Top = 236
        Width = 209
        Height = 57
        Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1074' '#1087#1088#1080#1073#1086#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = ProgramButtonClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 57
    Height = 637
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Image1: TImage
      Left = 8
      Top = 40
      Width = 49
      Height = 137
      Picture.Data = {
        07544269746D617086CD0000424D86CD00000000000036000000280000004F00
        0000DB000000010018000000000050CD0000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF6162614C4C4C575756828281
        CACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF5A5A
        5A4D4D4D5F605F787978808080767776666766797978FCFBFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDDDCDC4F4F4F5C5C5C6A6B6A8586859293938B8C8B898A8A
        888989838383717271FAFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD5859586262626869
        688182818E8E8E7A7A7A6C6C6B6465646363627071708081817D7D7DFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF999A995E5F5E6565656969697878778D8D8D6C6D6C4D4E4D49494A6A6A69
        5F5F5F565655656564777776BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080806364636B6C6B6666656667667A7B
        7B8989894646463434353333344646465959597374725858586B6B6A737373FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B35E
        5F5E6C6D6B6D6D6C6B6D6B68696880807F797A7A2828292F2F302D2D2E313132
        4D4D4CB4B4B47172715D5D5D757575D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF6566656A6B6A6C6D6B6869686D6E6D696A698383
        837273722626272A2B2C2728292626274646465959586A6A6960615F727371AF
        AFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E75D5E5D69
        6A696B6C6A6B6C6B6C6D6C696A6986878672737229292A2526271E1F201F2021
        3636365151516161606465646F7070979797FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC7C7C66060606B6C6B6869686C6D6C6E6F6E6869688383
        8377777739393A2F2F302325252223233232334E4E4E5C5C5C6768667273718C
        8D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9B9B95F605F66
        66666D6E6D6C6D6C6D6E6D6B6B6A8686857F807F8686863333342D2D2E282829
        3232334C4C4C5B5B5B646463777877848484FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB9B9B96262616C6C6B6D6E6E6D6E6D6F706E696A698888
        887B7B7AB9B9B932323332333328292A3535364B4B4B5C5D5C6869687A7B7A92
        9393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBE6263626C
        6D6C6C6D6C6D6E6D6E6F6D696A698081807A7A7AD4D3D33535363637382C2D2E
        3838395050506262616A6B6A7F807F929392FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCECECE6263616D6E6D6E6E6D6D6E6D6F706F6A6B698484
        83797A7ADBDADA3A3A3B3636372D2E2E3B3B3B515050656564686968808080A2
        A2A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA6162616C
        6D6C6B6C6B6E6F6D7071706A6A698686867B7C7BDADADA3B3C3C38393A2E2F2F
        3B3C3C5252526364636D6E6D828282A0A1A1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE6E6E56061606D6E6D6F706F6E6F6E6E6F6E696A698585
        857E7F7EDADADA3C3C3D3636372E2E2F3F3F3F5555546465646C6D6C808180AF
        AFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F260615F6E
        6F6E6D6E6D6D6E6D7071706A6B6A858585808180D5D5D53E3E3E3838392E2E2F
        424243545454646463727271818282B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFBFCFC6162616E6E6D6F706F6E6F6E7071706A6B6A8687
        867E7F7FD3D3D23C3C3C3636372E2F2F424243565756666766737372848585BC
        BDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6263626C
        6D6C6E706F7171706F716F6B6B6A858686808080CECECE3B3B3C3535362D2D2E
        4343445B5B5A656665767776818282C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF6566646D6E6D6F706F6D6E6E7171706C6D6C8686
        867F807FB6B6B63838393838393B3C3D49494A575756666765757675858585CB
        CBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6869686D
        6E6D6E6F6E7071707071706C6D6C8384838889896868674F50504D4E4E565656
        4D4E4D595958686968787978858585CECECEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7475736B6C6B6F706F6F716F7071706E6E6E8181
        818A8A8A757575808180717372595959505050575756676867797A79838484DB
        DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777766C
        6D6C7172717171707273726D6D6C8282828D8E8D747473797A79757674575757
        5151515A5A5A696A697A7A7A848484DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF8384836B6C6B7071706F706F7273716F706F8282
        818D8D8D7778777E7E7E7273725959595152515A5A5A696A687C7D7C818181E7
        E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A896B
        6C6B6F716F7172707172716E6F6D8383838D8D8D7879797D7E7D5859585B5C5B
        5151515A5A5A6B6C6B7C7D7C808181ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF9898976B6C6B7071707172707172706F706E8080
        809393935E5E5D6B6C6B6262625959595152515D5D5C6B6C6B7E7E7E838383F8
        F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6A
        6C6A7071707273717273716E6F6E7F7F7E949595606060616261656665595959
        5354535D5D5C6B6C6A7C7C7C838383FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFA3A3A2696A687172717172717273727071707B7C
        7B9091916F6F6F64646470716F5556565656565E5E5D696A697F7F7E848484FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD69
        6A687172707071707475747273717B7B7B9191907D7D7C7879785A5A5A5A5A5A
        5454535E5E5D6B6C6B818181838484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB0B1B06A6B697273717273727474737172717B7B
        7A91919178787866676676777657575755555560605F6C6D6C8080808C8C8CFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B76A
        6B69727271737472747573737473797979939393747574727271777877575757
        5556556262616A6B6A8081808D8E8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBFC0BF6A6B697475737475737374737475737C7C
        7C9292936A6A6A656665797A795556555858586061606D6E6D7E7F7E919191FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C1C169
        69687273727273727374727676757C7D7C9292926A6B6A666766777877585858
        5858576363626C6D6C8384839A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC5C5C4696A687274727474737576747273727C7D
        7C9292926A6B6A6B6C6B777877595A5A5757576262626B6C6B8687869D9E9DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C86B
        6C6A7374737374737576747475747F807F9293936E6F6E6969697C7C7B595959
        5959586364626A6B6A858585A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD0D0D0696A687576747476737677757677758080
        80959595696A6A6566657576755D5E5D5959596263626D6E6C868686A8A8A8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D4D369
        6A68757674737473757675797A78818281949594696A687475755B5C5B5B5B5B
        5A5A5A6061606D6E6D848484AAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD4D4D46869677374727677767676757575748485
        849292926B6C6B6262615E5F5F5E5E5E5C5C5B60605F6C6D6C858585AAABABFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D2D36D
        6E6B7878767677757778767576748484849595956263626C6C6C7273725C5C5B
        5B5B5B6161606D6E6C838383ABACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD4D4D46C6D6B757675777877797A787678768282
        829798976464646666666868685C5C5C5C5C5C6262616D6E6D838383A0A1A1FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D36C
        6D6B7778767879777878777A7A788081809596966D6E6D717171616161606060
        5C5C5C5F5F5E6E6F6D8282829D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD4D3D36D6D6C7879787677767677767677758283
        829697966666665859595C5C5C5C5D5C5C5C5C5E5E5D6D6E6D818180949595FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D46D
        6E6D797A787A7B797979787979788384829495947879788889886E6E6E626362
        5C5D5C6161606F706E7E7F7E8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD3D3D26E6F6D7A7A797879787B7B7A7778768383
        839494947D7E7D8586868283825F5F5F5C5C5C60605F6E6E6E7C7D7C8C8C8DFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D36E
        6F6D7A7A787A7A79797A797677768283829090907D7D7D8485847F7F7F5F605F
        5B5B5B6061606E6F6E7F7F7E898989FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD1D1D170706F7C7C7B7B7B7A7D7D7D7979788080
        808E8E8E8181818788878181815F5F5E5C5C5C60605F6F6F6E7C7D7D858686FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB71
        71707B7B7A7C7C7B797A797879788485849191917777777373736465645E5F5E
        5A5A5A6160606E6F6E797A798A8A8AF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC3C3C37373727B7C7B7C7C7B797A79797A798181
        819292927575755E5E5E6263626161615B5B5B6565646D6D6C7879788B8B8BFB
        FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C071
        71707A7B7A7C7C7B7B7B7A7A7A798485848F909082838290909065656660605F
        5B5B5B6262616E706E7475748B8C8BEFEFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBEBEBE7374737C7C7B7C7D7C7C7C7B7979787E7F
        7E949594686868696A696D6D6D5D5E5D5A5B5A6363627071707576758B8B8CEC
        ECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B573
        74737C7D7C7C7C7B7C7C7B7879788484849192918182816D6D6D525252626262
        5959596364637172717475748B8C8CEBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB3B3B27576757D7D7D7B7B7A7A7A79797A798283
        839394946161616A6A6A5F5F5F6162625A5A5A6363626E6F6D7274738D8E8EDF
        DFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B276
        76757C7C7B7C7D7C7C7D7C7979788283829494946465646262616E6E6E626262
        5B5B5B6363636F706F7374728C8D8DE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFA7A7A77677767C7C7C7C7C7B7B7B7A7C7C7B8283
        829696966D6D6D6A6A695F5F5F6161605959596364636D6E6D7374728D8D8DD4
        D3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A4A476
        76757B7C7B7C7C7C7B7C7B797A798282819696965C5C5C696A69575757626362
        5757576364637071707071708C8C8CD6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFA2A2A27676767C7C7B7D7D7C7C7D7C7778778283
        829494946A6B6B6465655E5E5E5D5D5D595A596263617071707373728D8D8DC8
        C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A77
        78777E7E7E7B7C7B7E7E7E797A788485849293938182818B8C8B7D7E7D666766
        595A596261617072707171708C8C8BC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF9696957778777D7D7D7E7E7E7C7D7C7B7C7A8182
        819595957071706F706F5E5E5E5F605F5858576262616F706F6E6F6E8D8D8DBB
        BBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92929279
        7A797E7E7E7E7E7E7E7E7D7B7B7A8383839494948182817474745A5A5A676867
        58585862626273747270716F888989BEBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF8F908F7A7A7A7E7E7E7E7E7E7D7D7D7B7B7B8586
        859697967B7C7B7373736969695E5F5E5959596162607172716F706F898A8AB0
        B1B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8888877B
        7C7B7F7F7F7E7E7E7E7E7E7B7B7B8687869797976666664E4E4F6566656B6B6B
        5657566363627273717072708B8B8BB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF8383837C7C7C7F7F7E7E7F7E7F7F7F7A7B7A898A
        899696967373735A5A5A5556566464645757565F605F7374726F6F6E8A8B8BA3
        A3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383837C
        7C7C7E7F7F7F7F7F7D7D7D7D7D7C8687869798988080805858585F6060616161
        5454545E5E5E737472717271828282A6A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7D7D7D7C7D7D80807F80807F8080807B7C7B8787
        87999A997878787373737879796E6F6E5454546161607273727676748081819C
        9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979797F
        807F7F7F7F80807F8080807B7B7A8888889C9D9C5E5E5E6E6F6F6A6B6A5F605F
        5656565F5F5E747573767775838483959595FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7877777E7E7E80807F8180807F807F7B7C7B8C8C
        8B9999996969695D5D5D5C5D5C6363635253526161607172717475747F808095
        9595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878777E
        7E7E8182817F7F7F8181817C7C7C8687869B9B9B787978575858656564646464
        53545460605F74747277787680807F919292FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF7676758081808282828382828181807F7F7E8888
        889798978182816464646869696C6D6D5151516161607172707778777B7B7A91
        9191FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76767580
        80808081808181818383827A7A798787879797978485846C6D6C696A69636362
        5455555F5F5F70716F797A79797A79939393FAFAFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFCFCFC7676768080808282818080808282817B7C7B8889
        889495948A8B8A919191898A8A7475745252525E5F5E72737179797879797893
        9393F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F575757582
        82828181818383838181807B7B7A8A8A89969796898A8A8A8B8B838383707271
        5253525F605F6F706F787977797A79919191EEEEEEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF2F2F27677768080808383828282818383827D7D7D898A
        89979897898A8A7E7E7E8383837778775151525F5F5F6A6B6A7B7C7A75767593
        9494E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F176767583
        83828282828383828484847B7C7B898A899798987D7D7D878887727372727372
        5253535F5F5E6D6D6C7D7D7C767776929392E4E4E4FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEAEAEA7576758282828282828383838585847C7C7B8C8C
        8C9898988A8B8B8C8C8C8585856D6E6D5455545A5B5A6B6C6B7B7B7A75767596
        9696D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E4E476767681
        82818585848383828585848181808A8A8A9899998E8F8E8383838F90906F706F
        5353535F5F5E696A69797A78787877949595D6D6D6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE5E5E57878788383828384838584848686868080808C8D
        8C9A9C9B7575755657575E5F5E7172715859585D5E5D6B6C6B7C7D7B72737293
        9494CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBDBDB77777682
        82818485848383828585848383828C8C8C9999997C7C7C4C4C4D5657577A7A7A
        53545360605F6A6A697A7B7A747573959596C9CACAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD3D4D478787784848386868584848486868580807F8D8D
        8D999A9A79797A5C5D5D7878787475755455555F5F5E696A697B7C7A74757496
        9796C4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D478787885
        85848686868484838989888484838D8D8D9899987979794C4C4C6E6E6E737473
        5353535E5F5E6B6C6B7A7B7A757574979798BABBBBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCBCBCB7A7A7A8585848485848484848988888282828E8F
        8E999A9A8889895B5B5B6C6D6C7474735656565E5E5E6A6B6A7B7C7B75757497
        9797BABBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C7C77C7C7B84
        84838484838788868989898384838B8C8B9B9C9B8E8F8F737473666666777777
        5454545D5D5D6C6D6C7A7B79737473959695B1B2B2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC4C4C47C7C7B8585858585848787868989888383838B8B
        8B9A9A9A7474745B5B5B5C5C5D7979795454546060606B6B6A7A7B7973737295
        9696B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C37D7D7C86
        86858787868586858A8A898484848B8B8A9B9B9B8686855D5E5E6B6B6B787978
        5050506061606B6C6A797A79757574939494A5A5A6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB9B9B97E7E7D858685878786868686888888868685898A
        8A9D9E9D8383836768687272727777775252535D5D5C6B6C6B797A7974757496
        9696A4A5A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B77F7F7E87
        8786868787898A898989898787878C8C8C9C9C9C8B8B8B7373734849497A7B7A
        5050515F5F5E696A69797A797576759393949C9C9CFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB8B8B87E7E7E8686868787868787878B8B8B8485848B8B
        8B9FA0A08383836464648C8D8D7373735252525D5D5D6969687A7A7976767593
        94949D9E9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0AF81828188
        88878888888989888989898585858D8D8D9D9E9D828282515252848584757575
        4F50505D5D5D6B6C6A797A79767776919191979797FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFA5A6A68383838888888989898888888A8A8A8686868A8A
        8AA6A7A78080804A4B4B5D5D5C7B7C7B5151515D5D5D6A6B6A7C7C7B77787790
        9090989999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A88383838A
        8A8A8989888989888B8B8A8686868D8E8D999A9A858585535353676867777877
        5152525D5D5D6A6A697677767B7C7B919191999A9AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFA5A5A58282818989888686868C8C8B8C8C8C8787878888
        87A3A3A38E8E8E9495947B7C7C7475745455555C5C5C696A697677767B7B7A89
        8A8A9A9B9BF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9C9C8585858A
        8A898D8D8C8B8B8A898989878886898A89A3A4A48A8B8B8F8F8F878888727372
        5554555B5B5B6C6D6B7475737C7C7C8C8C8B9D9D9EFAFAFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF9D9C9C868685898A898B8B8B8989898F8F8E8787878D8D
        8DA4A5A68383839292928D8D8D7273725353535A5B5A6C6D6B7475747D7D7D8A
        8B8B9F9F9FF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9595958788878B
        8A8A8989898989888E8F8E8686868C8C8CA2A3A38788879192928A8B8B727372
        5556565B5C5B6B6C6B7575747E7F7E8888889C9C9CEFEFEFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF9393938888888B8B8B8D8E8D8B8B8B8D8D8C8686868E8E
        8EA6A7A78C8C8C9090908A8B8B7172725354535858586B6C6B7576747E7E7E84
        85849D9E9EEDEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D8D8D898A898B
        8B8B8D8D8D8C8D8D8F8F8F8585858E8F8FA5A6A68484848B8C8C8485856F7070
        5454545859586B6C6A7475737E7E7E8080809D9E9EEFF0EFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF8C8C8B8989898B8B8C8B8B8B8B8B8B8E8E8E8586868D8D
        8DA8A8A8676868626262646564737373545554595A596C6C6B7475747E7E7E7F
        807FA1A2A1E4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8485848A8B8A8C
        8D8C8B8B8B8D8D8D8F8F8F858585929392A4A5A5949494434444515252737372
        5455545656566E6F6D7273717F807F8182819E9E9EE5E5E5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF8282828B8B8A8C8C8C8B8C8C8D8E8D9090908888888F90
        90AAAAAA6F70706363636B6B6B6D6D6C5556565959586B6C6B7374737E7E7E7F
        7F7F9D9D9DDDDEDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8182818B8B8B8C
        8C8C8D8D8D8C8C8D9191908787878E8F8FA7A7A77979796F7070666666707170
        5656565454546D6D6C7274728080807D7D7D9FA0A0D5D6D6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7F8C8C8C8C8C8C8D8D8D8D8C8C8F8F8F8888879495
        94A6A7A76F70705C5C5C6161616B6C6B5555545555556B6B6A74757383838280
        807FA1A1A2D0D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC7F7F7F8C8C8C8D
        8D8D8E8E8E8C8C8C929291858585919292AAAAAA6869696666666F6F6F6E6E6E
        5657565454546C6D6B7071708282827E7E7E9FA0A0CDCDCDFFFFFFFFFFFFFFFF
        FFFFFFFFD4D4D4B3B3B3C8C8C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7F7F7F8C8C8B8C8C8C8C8C8C8F8F8E9393938686869494
        94AAABAB7F80805859585E5E5E6A6A6A5353535354536B6B6A73737284848481
        82819D9D9CC6C7C7FFFFFFF6F6F67A7A7B2B2C2E1415171E1E1F1D1E20202022
        666767FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA7E7E7E8D8D8D8C
        8C8C8D8E8D8D8D8D929291878787949494ADADAD6D6D6D5E5E5E6B6B6B747474
        5757575253536A6B6A74757386868580807F9F9F9FC3C3C3C9C9CA2323241112
        1323232429292B878989C0C2C3B5B7B8999A9B454547F2F2F2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF1F1F18182828D8D8D8C8C8C8F8F8E8E8F8E9292928787879394
        94ABABAB6A6B6A6565655E5F5E6B6B6A5555555353526C6C6B7475738585847A
        7B7AA2A2A39F9FA01212141717191C1D1E161617B4B6B7B7BABBB4B6B6B8BABA
        B3B5B6BDBFBF595A5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3F38080808D8D8D8D
        8D8D8E8D8D8F908F959595878786949594ACADAD8C8D8C565656676867707170
        5858585051516B6C6B7374728B8A8A7A7A79A4A4A49B9B9B0B0C0D1111130909
        0A545556C2C3C4AFB0B12C2C2D1B1B1C8D8F8FBEC0C17D7E7FECECECFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFECEBEB8181818D8D8D8C8C8B90908F8E8E8E9595948787869192
        91AAABAB71727270706F7474747071715757575151516B6B6A7778768787867A
        7A79A4A5A5A9A9AA0000000000010000002F2F30C2C4C44F4F51353537313133
        0000009A9B9BB5B6B6DCDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E2E28383828D8D8D8C
        8D8D8D8D8D8F8F8F939393898988989898A5A6A69191914D4D4D5758586D6D6D
        5657575051506C6D6C7576748788867B7B7A9D9E9EBDBDBD0000020404055C5C
        5ED4D6D6BFC0C13A3A3B3A3A3B3E3E3F2222244C4D4EBEBFC05F6061FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE3E3E28181818D8D8D8D8D8D8C8C8C8F8F8F9595948787869292
        92ACACAC797A796464647A7A7A6C6C6C5556565050506E6E6D7575748383837B
        7B7A9E9F9FC3C4C40C0C0D00000005050687898AC2C4C43333343D3D3F373839
        2A2A2B3A3B3C858586939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA8383838C8D8C8E
        8E8E8F8F8E919190959595898988949494A8A9A88283836C6C6C6566656B6B6B
        5758585252526C6D6C7576748283827979799B9B9BBCBCBC3636370000000000
        003F4041C9CBCB36363739393B2B2C2E3131332C2D2EC2C4C4D5D6D6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD4D4D48484848F8E8E8D8D8D8E8E8E90908F9797968888889494
        94A9A9A97273736868686B6C6C6C6C6B5959595151506D6E6C75757482838279
        79799E9F9FB4B6B66162620000005C5D5ED1D4D4C5C7C73030322C2D2E38383A
        2E2E302C2D2EAAABAC626364FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D2D28686868D8D8D8E
        8E8E8F8E8E919191969696868685939393A9AAAA6A6A6A6464636A6B6B6B6C6C
        5454545050506C6C6B7475738585857B7C7B9B9C9CB3B3B39898980000000000
        006C6C6DBEBFBF37373927282939393B3333352D2D2E8F90917A7B7BFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC7C7C78585848E8D8D8F8F8E8F8F8F9393929898978787869292
        92A9A9AA8283835C5C5C6565666667665656574F4F4F6E6E6D7475738586847F
        7F7F959695AEAEAEC5C5C50405060A0A0B373739C3C5C53232342B2B2C363637
        303032272829B8BABADBDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C78384848D8D8D90
        908F8F8F8F9291919A9A99888887979898A9AAAA8081806869687878786E6E6E
        5354544D4D4D6B6C6B7475738686857D7D7D9A9A9AAEAEAEB8B8B85454553333
        34C5C8C8C0C3C33737393636382E2E2F34343629292AA3A6A6545556FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBCBDBC8687868D8E8D8F8F8F919191919190999999878787999A
        9AABABAB7576765959595152526B6C6B5555554D4D4D6A6A697475738283827C
        7C7C989999AEAFAFB1B2B2AEAFAF0000004B4C4DBFC1C13D3D3F2F3031343435
        3737392525269FA1A1979798FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBA8484848E8E8E90
        90909191909594949C9C9B8A8A89989999AAAAAA7778786464647A7A7A686867
        5253534D4E4D6969687273728585847D7D7C9B9B9BADAEAEABACACBEBEBE4242
        432E2E2FC0C2C33737392C2D2E38383A3535381F1F20C1C3C4C3C4C5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB1B2B28888878E8E8E90908F8F8F8F9393939B9B9B8888879999
        99A8A9A97A7A7B5D5E5D5B5B5B6565655757574D4D4D6B6C6B7374728282817F
        7F7F979897AEAFAFAEAFAFAFB0B0AAABABB7B9B9BCBEBF2F2F312C2D2E3A3A3B
        363637151516A0A1A14C4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAA8686858E8E8E8F
        8F8F9091909696969D9D9C8787879A9A9AABADAC898A8A4E4E4F6A6A6A676867
        5656564C4C4C6868677474738383837D7D7C999999AFB0B1ACADADAEAFAFB3B4
        B46D6E6FC2C5C52E2E2F3232343A3A3B3536370D0D0EA8AAAAA8A9A9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA3A3A38989898F8F8F8F8F8F90908F9595949B9B9B8A8A899696
        96ADADAD898A896B6C6B5C5D5D7070705556564D4D4D68696874747382828281
        8180939493AEAEAEADADAEADAEAEB1B1B19D9E9EC2C4C42E2E302B2B2D39393B
        38383909090ABEC0C1BDBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9C9B8888889091908D
        8E8E9191919898979C9C9C8B8B8B989897ADADAD8182826B6C6B6465655F5F5F
        5454554A4B4B6A6B6A757674808180838382939393AEAFAFADAEAEAEAFAFB1B2
        B2ADAEAEB6B8B8272728292A2B3A3A3B3838390C0C0D999A9A3A3B3CFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9898978989898F8F8E8F8F8F9191919797969D9C9C8989889B9C
        9CB0B0B07475757272716E6F6E6C6D6C5353544C4C4C68696875767582838282
        8381949594AEAEAEACADADAEAEADACADADB1B1B1B8B8B84A4A4C252526353637
        36363809090AA6A7A7CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C8C8C898A898E8E8D8F
        8F8F9392929696969D9D9D888988999999B0B0B0737373636363696969636363
        5555554A4A4A6A6A6876777480807F838383939392AEAEAEADAEAEACADADADAE
        AEB0B0B0B2B2B2B9BABA3333352021223A3A3B020203BEC0C0C3C5C6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8C8C8B8A8A8A919190909090929292969696A0A09F8A8A89999A
        9AB0B1B06869685858587172716161615555554A4A4A68686779797880818084
        84848F8F8FADAEAFADAEAEADADAEADAEAEB1B1B1AFB0B0B4B4B4B6B7B7252526
        3030320B0B0C9798992C2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8080808A8A8A90908F90
        90909393929696959E9E9E8A8B8A9D9D9CB1B2B27B7B7B676868606060616161
        5353534949496A6A697777767D7E7D878786939393B0B0B0AFB0B0ADAEAEAFAF
        AFAEAFAEAFB0B0B0B0B0B7B8B8959595232425060607AEB0B0CECECFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7D7D7D8B8C8B8D8E8D8F8F8F9394939595959F9F9F8989889999
        99B0B1B18787876363636061616162615253534848486667667979787C7D7C8A
        8A898E8F8EACACADB0B0B1AFB0B0AEAEAFB0B1B1B1B1B1B1B2B2B0B1B1C1C1C1
        4C4C4E000000CDD0D0BABCBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7E7C8B8B8A8F8F8F8F
        8F8E929292989898A1A1A1888887999999B0B0B0797A796F70707C7D7D6C6C6B
        4D4E4E4B4B4B6767667A7A787D7D7C888888909191AEAFAFADAEAEADADADACAC
        ACAFB0B0AFB0B0B0B0B0B2B2B2B5B5B68A8B8C0101028D8E8E2D2D2EFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7A7A798C8C8C8D8D8D8F8F8F9494939797979F9F9F8888889B9B
        9BAEAFAF8181816464645C5C5C5E5F5E4F4F4F4646466868677878777C7D7C8D
        8C8C8C8D8CACACACADAEAEAEAEAEABACACAEAEAEAFB0B0AFB0B0AEAFAFAEAFAF
        B4B4B4000000B0B2B2DBDBDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979788B8B8B8E8E8E8F
        8F8F949494979897A1A0A08A8A8A969797B1B1B1838484898A89686868646565
        525353474748676867797978797A798B8B8A8E8F8EACADADB1B2B2AFAFAFABAC
        ACADAEAEB4B4B4B2B3B3B2B3B3ABACACC1C2C2000001C4C6C6A8AAAAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF4F4F47778778A8A8A8E8E8E9191909595949A9A99A2A2A28888889A9B
        9AAFB0B07D7D7D5E5D5D656565616161545555474848666665797A787E7E7D8D
        8E8D8A8B8AB1B2B2AEAFAFB0B0B1A5A5A58080808384838E8F8EA0A0A0B2B3B3
        C6C7C609090A8182832C2C2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F17777778B8B8B8E8E8D8E
        8E8E949494989898A1A1A1888887979797B1B2B28788889192926D6D6D5C5D5C
        5151514747476363627A7A787D7D7C90908F8B8C8CA5A6A6B1B2B2B8B9B9494A
        4A2E2F2F393A3B3F3F3F4949495D5D5D757575000000B4B5B5E3E4E4FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEDEDED7777768C8C8C8E8E8D90908F9696959A9A9AA2A2A28786869C9C
        9CB1B2B28585856B6B6B6B6C6B6464635354544646466566657A7B797B7B7A8D
        8D8D898989A7A8A8A9A9A9BBBCBC0000001C1C1E1314150F0F111212141C1C1D
        2E2E30000000D0D3D3989B9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E2E37979788B8C8B8F8F8E90
        908F9393939C9C9CA4A4A48989889FA0A0AFB0B06D6E6E6C6D6D606060616261
        5454554646466767667778777C7D7C9595948D8D8CA5A5A5ACACACADADAD0404
        052A2A2C2424251A1A1B2424253535373636382D2D2E6061623F4040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDFDFDF7A7A7A8B8B8B8D8D8D8E8F8E9495949A9A99A7A8A78484849D9D
        9DB0B1B07B7C7C6060607373735F5F5F5353534444446565647A7A797E7F7E98
        9896888888A8A8A8ABACACB3B4B40000000404050B0B0C2323243636372F2F30
        2F2F3037373931313241414258595AEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D67778778B8B8B8F8F8F8F
        8F8F9494949C9C9BA4A4A4848484A2A2A1B0B0B08686866162626061616A6A6A
        5555554545466566657A7A7981817F959595868786A9A9A9ACAEAEB8B8B80000
        000F0F111818192121224040412C2D2E35363730303133343532323438383935
        3637FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD1D1D07A7A798D8E8D8D8D8D8F8F8F9696959B9B9BA7A7A7858685A6A7
        A6B3B3B37B7B7B5B5C5C6666666565655253534747476666657B7C7A7C7D7C9A
        9A99848584ABABABAFAFAFB9BABA0000000E0E0F1010112F2F302D2E2E333435
        262627303030393A3A3C3D3D3E3E40313132C2C3C3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCDCD7A7A7A8D8D8D8F8F8F8E
        8D8D9898979B9A9AA5A5A5888888A8A9A9ACADAD8C8D8D5758585A5B5A646564
        555555464647666665797A797F7F7E9D9D9C838382ACACAD9D9E9EBBBBBB0000
        000707080808090000010808091D1E1F2F2F3131313332323337373835353632
        3334BCBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC1C1C17D7D7C8D8D8D9191908F8F8F9796969D9D9CA5A5A5858685ABAB
        ABABACAC7778785555546869695C5C5D5455554747475F605F7878777E7E7D9D
        9D9C858584ADAEADAAAAAABCBDBD0000000D0D0E0F10110B0B0C131314252527
        3233343E3E40474748494A4C5151523B3B3CC9C9CAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF7C7C7C8E8E8D8F8F8F90
        908F999898999999A6A6A5898989ABACACAAABAB8E8E8E8C8C8C757676656666
        5354544545466262617A7B7A7F7F7F9B9B9A868585A7A7A7ABACACB7B8B80000
        000D0D0F1313141D1D1F29292A333334292A2B2F2F313435363C3C3D4444456C
        6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB7B7B77E7E7E8F8F8E8F8F8E9292919797979A9A9AA6A6A6888888ADAD
        ADADADAD8989898F908F8383836666665A5B5A4A4A4A6263627879777D7D7C9E
        9E9E868686A7A7A7AAAAAAB8B8B90000000F0F100E0E0F2B2B2C3434362C2C2D
        2F2F313535363B3B3D454547444445414242FAFAFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B08181818E8E8E91919192
        92919797979A9A9AA7A6A6878786AEAFAFB5B5B5797A79868787818181646564
        61626149494A6565647B7B7A7F807E9C9C9B7D7D7DAFB0B0B3B4B4BFC0C03131
        320000001212141B1B1D3636372D2D2F31323331313339393B3A3A3A48484A3F
        3F40D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAFAFAF8282818F8F8F90909090908F9898989B9B9AA8A9A8888888B1B1
        B1B5B6B67C7C7C8081807071717273726262624E4F4F6465647A7B7A8383829F
        9F9F878887989897ACADADB4B4B5C3C4C46C6C6C2E2E2F101011000000000000
        03040511111220212226272839393A414142E2E2E2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A381818190909090909092
        9291999998999999ABABAB868686ACADADB9B9B97A7B7A8C8D8D8585857A7B7A
        6F706F5253536869687879788A8A8A8E8E8D7B7B7B9C9C9BA5A6A5A6A6A6A9A9
        A9B1B1B1BBBCBCBEBFBF9F9F9F8C8D8D6D6D6E52525239393A2728292020222B
        2C2EEDEDEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA1A1A18585858F8F8F919190959594989898989897A8A8A8878786ABAC
        ACBCBDBD8081808889887D7E7D7B7D7C7374735D5E5D6B6C6A797A788F8F8F79
        7A787C7D7C8F8F8F9494949898989595959B9B9B9C9C9C9B9B9BA5A6A5ACADAC
        B7B7B7B5B6B6BABBBBBABABAB3B4B4A8A8A8B7B8B8E5E5E5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E9E86878691919092929292
        92929898989B9B9BA7A6A68A8A8AABABABBCBCBC8E8F8E818181838383838383
        7879796364646D6E6C7D7D7B8A8A898181818A8B8B8A8A8A8E8E8D8D8D8D8D8E
        8D8C8D8D898A8A8687868787878787878E8E8D9091909090909696969292929D
        9D9D9697979C9D9DC4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9695958888889191919292929393929999999C9C9CA6A6A6868786B1B1
        B1B7B8B89FA0A07C7D7C7C7D7D8182827D7E7E696A696E6F6E8384838D8D8DA1
        A1A1999A999696959494949292929090908A8A8A8888888888888585857F807F
        7778777272716C6D6C6A6B6A6A6A69747474868686969697A5A6A6E0E0E0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9696958B8B8B8F8F8F92929294
        94939A9A99999999ACACAB8C8C8CADADADB5B6B6B7B8B8797978898A8A888989
        7B7C7B6E6F6E7374728C8B8B9F9F9FAEAEAEA3A3A3A1A1A1A0A0A09B9C9C9898
        989091909090908D8D8D8A8B8B898A8A8788878384847E7F7E7575756D6E6D67
        68676667667E7E7D9A9A9AAFB0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8B8B8B8B8B8B9393929494939393929B9B9A999999AEAEAD858685ACAD
        ADB3B3B3B9B9B88C8D8D8384838B8B8B7879786E6F6E828382939393B2B2B2AB
        ACACADADADABACACA7A8A8A4A5A59F9F9F9F9F9F9D9D9D989798919191909090
        9393938F8F8F8C8C8C8787878384837F7F7E797A79828282929292999999F8F8
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484838C8C8C92929196979696
        96959A99999B9B9BAEAEAD838382ADADADB3B3B3B5B5B5B0B1B1747575838383
        7979787778778E8E8EACADADB2B2B2B0B1B1ADAEAEABABABABABABA9AAAAA7A8
        A7A3A4A4A3A3A3A0A0A09A9A9A9596969696969898989394949494949292928E
        8E8E8C8C8C8D8E8D9392939D9E9DE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F7F7F8989899292929494939292929999999C9C9BADADAD858584B8B8
        B8B5B5B5B5B5B5BABABA9999997979797A7B7A8A8B8BA2A2A2B0B0B0B2B3B3AE
        AFAFB0B1B1AEAEAEACADADAAABABAAAAABABACACA8A8A8A8A9A9A2A3A3A0A1A1
        9C9C9C999999999A9A9999999898979898989898989696969A9B9A9E9F9FC2C2
        C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7D7D91919093939296969693
        94949999999C9C9BACACAB888888B7B7B7B6B6B6B3B4B3B6B6B6B9BABBA7A8A9
        9FA09FA6A6A6B2B3B3B1B2B2AEAEAEB3B3B3AEAEAEB1B2B2B2B2B3AFAFAFAFB0
        AFADAEAEABACACAEAEAEABABABA8A8A9A4A5A5A2A3A39F9F9EA3A3A39D9E9E9B
        9C9C9B9B9B9A9A9A9F9F9FA2A2A2AFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFE7B7C7B9191909191919595959595949B9B9B999998ABABAA8C8D8CB7B8
        B8B3B3B3B4B5B5B2B3B3B5B6B6BABBBBB9BABAB5B6B6B2B2B2B1B1B1A8A9A9B5
        B5B5B0B1B1AFAFAFB0B1B1B1B1B1AFB1B1B2B3B3B1B1B1ADADAEAEAEAEACADAD
        ACADADACACACA9AAAAA8A8A89FA0A0A5A5A5A4A5A5A4A5A4A8A8A9ABABABA3A5
        A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F57F7F7E8F8F8F91919193939399
        99989999989C9D9CA6A6A58F8F8FB7B7B7B4B5B5B3B4B4B3B4B4B6B6B6B4B5B5
        B4B5B5B2B3B2B2B2B2B3B4B4B1B1B1B0B1B1B1B1B1B2B3B3B2B2B2AFB0B0B2B3
        B3B2B2B2B2B3B2B0B0B0B0B0B0ADAEAEAFB0B0B1B2B2B0B1B1ACACADADADAEAB
        ABABAAABABA8A9A9ABACACADAEAEA3A3A3F5F5F5FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        EFEFEF7F807F908F8F9191909494949999999A9A9A9C9C9CA3A3A38F8F8EB6B6
        B7AEAFAFB3B4B4B3B3B4B7B8B8AFAFAFB5B5B5B1B1B1B1B1B1B2B3B3B3B4B3AB
        ACACAFB0B0AFAFAFAEAFAFB1B2B2B0B0B0B1B2B2B0B1B1B3B3B3B0B1B1B0B0B0
        B1B2B2B2B3B3B3B4B4B3B4B4B0B1B1B4B4B4B0B0B0AFAFAFAFAFB0B0B1B1A6A6
        A7E6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E27F7F7F9292918D8D8C96969698
        98979999989D9D9C9E9E9D9B9B9BB0B1B2B0B0B0B0B1B1B3B3B3B2B3B2B0B1B1
        B0B1B1ACADADAEAFAFB2B2B2A9A9A9ACADACAFB0B0B0B1B1AEAFAFACADADAEAF
        AFB0B0B0AFAFAFB1B1B2B2B2B2B0B1B1AFB0B0B1B2B2ACADADB4B5B5AFB0B0B0
        B0B0B3B4B4B0B0B0B0B0B0B2B2B2A7A7A7E0E0E0FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DCDCDC8282828F8F8F9191909797979898979696959D9D9D9898989393939B9C
        9C9FA0A0AAAAAAACACACADAEAFAFB0B0B1B2B2B0B1B1AEAEAEABABABAEAFAFAF
        B0B0ADADADABACACAFB0B0ADAEADAFAFAFADADADAEAFAFB0B0B0B0AFB0AEAFAF
        B0B0B0AFAFAFB0B1B1B0B0B0ACADADB0B1B1B0B1B1B0B1B1AFB0B0B2B2B2A7A8
        A8D6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3D3D38384838F8F8F969696A0A09F97
        9796999999A0A0A0979796959594C8CACBDDE0E0C0C1C1AFB1B19FA09FA7A8A8
        A7A7A7A7A7A7ACACACB1B1B1ADAEAEAAABABACADADB0B1B1A7A8A7ACACADA9AA
        AAA9AAAAAFAFB0ACACADB0B1B1AFAFAFADADADAFB0B0B1B1B1B1B1B1B0B0B1B0
        B1B1AEAFAFAFB0B0B0B1B1ACADADA7A8A8CECECEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C3C3C38787879B9B9A7F7F7E333334A1A0A0989898A2A2A2939393989898DFE2
        E3E3E5E5E2E5E6E3E6E7E7E9EACBCDCDAEAFAFA3A4A4A4A4A4A6A7A7A9AAAAA9
        A9A9ACADADABACABADADADA9AAABA8A8A8AFB0B0ABABABAFB0B0AAAAABADADAD
        AFAFAFB0B1B0AFAFAFADADADAEAFAFAEAEAFADAEAEAEAFAEACACACB0B0B0A8A9
        A9C8C9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B09090904343443435353C3C3DA3
        A3A3979797A9A9A98D8D8D989897E5E8E8DEE0E2DFE1E2EEEFF0EAECEDE3E5E6
        E8EAECE6E9EACCCECFB9BABA9C9D9DA3A4A49D9D9DA3A3A3A7A8A8A3A4A3A3A4
        A4A9A9AAA9AAAAA3A3A3A1A2A2A1A1A19A9A9A9E9F9FA1A2A3ACADADACADADAE
        AFAFB1B1B1B7B7B8B8B9BAA9AAAAA5A6A6CECFCFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A1A1A09494944849494C4C4D5152519D9D9D9A9A9AA7A7A69393939F9F9FE0E3
        E4DEE1E1D1D6D76B7073A0A3A4DFE2E4DEDFE0DFE1E2E0E3E3DFE3E4E0E3E4C0
        C2C2AFB1B1A5A6A6ABACADACAEAFB1B2B3B4B6B6BEC0C0CBCDCECCCFD0D4D6D6
        DEE0E1E6E8E9E7E9E9E6E9EBEAEDEEE9ECEEE5E7E8E7E9E9E6E8E9AFB0B0A0A1
        A1D6D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A9393923F4040494A4A5D5D5D9C
        9C9C9A9A9AA5A6A5959595A6A6A6DDE0E1E5E8E9ACAEAF0000004A4D4EEAEDED
        D8DADBDDE0E1DEE0E1DEE0E0E0E3E4DFE2E3E1E4E5E5E7E8DDDFE0DEDFE0DCE0
        E1DEE2E4DCE0E1DCE0E1DEE0E1DBDEDEDEE1E2E6E7E8E5E8E9E6E8E8E7E9E9E6
        E8E9EAEDEEE9EBECEFF1F2A6A6A69F9F9FE2E2E2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        8282828B8B8B4040414747486969699A9A9A9F9F9FA3A3A3A8A8A8ADAEAEDFE2
        E4DADDDFDEE3E30D0D0E5A5C5CF3F6F7E3E6E6DDDEDFE2E4E4E0E2E2DFE0E1DD
        DEDEDEE0E1DDDFE0EFF2F3EFF1F1ECEEEFDFE2E2CFD1D1C3C6C6CED0D1B7B9BB
        B0B2B3A8AAAB9899989494958A8A8A898A8A8A8B8A7475756C6C6CA2A3A39E9F
        9FEDEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F58383827C7C7D4344444747486C6C6C9B
        9B9A7F807F7F7F7E8A8A89898988C8C9CAF8FAFBF1F5F7E0E3E4EBEEEFE5E7E9
        D7D8D9D7DADBD6D9DAD9DADBD8D9DADCDEDFD9DCDDDDDFE06465655D5D5D5B5B
        5B5C5C5C6566656F6F6F7070707E7E7E8585858B8C8C9797979F9F9FA5A5A5A3
        A4A4A6A6A6B2B4B4B7B7B7B1B1B19E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E1E1
        8787876565654747484C4D4D494A4A3F3F3F6E6F6F8082823D3E3F1C1C1D3939
        396F6F6EAEAEADDADDDEFEFFFFECF0F2E4E7E8E2E4E5E1E3E4DFE1E2DBDCDDDF
        E1E2E0E4E5DBDCDD8384848989898C8D8C939393969797989998A3A4A3A2A3A4
        A9AAAAB5B7B7B8BABAB7B9B9B9BBBBBABBBBB6B7B7A3A4A4AAABABABACACA6A7
        A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D7747474494A4A4646474A4A4A494A4A46
        4747818282C8CBCBB7B9B9AFB1B18687883C3D3D1212132A2B2A5D5C5CA3A4A3
        CDCECEECF0F1E4E5E6E4E7E8E3E7E8E3E5E5E3E6E7EBEEEFDBDDDEE0E2E2E5E9
        EADDE0E1E9EBECE7EAEBE5E9EAE7EAECE4E7E9E1E3E3E6E7E8E4E7E8E3E4E4EA
        EDEECCCECF898989989999A3A4A4C3C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDCDCD414142
        4243434747484A4A4B4B4B4C4B4C4C424242909393BEC1C2AAABACB4B6B6B8BA
        BAB0B2B3C6C9C98385854B4C4D1313141C1C1C4E4E4D9D9E9DC7C9CADDDDDEE4
        E7E8DBDDDED0D3D3D2D5D6D9DBDCDCE0E1DEE1E3E3E6E6E9EBEDECEEEFF2F4F6
        F2F4F5F3F5F6EAEDEED4D6D7C3C4C5898A8A6061609B9C9BB2B3B3949494F4F4
        F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7777773D3E3E4444454748494849494849494A4A4B42
        4343AEB0B1BCBEBFAFB1B1BABDBDB2B5B5B0B3B3B2B4B5A6A7A7B7BABABDBFBF
        9FA1A15B5C5D1717181616164848478D8D8CBBBCBCD0D2D3CBCDCDB7B9B9ACAE
        AF9696968282827879797777775E5E5E5353535858586262626A6A6A7574758E
        8F8EB0B0B0B0B1B1A6A7A7A7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525253424344
        4242434848494A4B4B4D4D4D5252524343447374759597987E8181CFD2D2ADB0
        B0BFC2C3AEB0B0AAACADA3A5A6B2B4B5ACAFB0B9BCBDC2C5C5A7A9AA64666624
        25262324246C6B6B6E6E6E797A798282818B8B8B9D9E9EA2A3A3AAAAAAB2B3B3
        B0B0B0B0B1B1B1B2B2B1B2B2B3B4B4B0B0B0B2B2B2A6A7A7828383FEFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF3A3A3A4545464A4A4B5455554B4C4C3F404027272823
        23241F1F21222324292A2B3032338386876D6F70BFC2C2AAAFAFA4A7A7B6B8B8
        ACAFAFB0B3B3B0B3B3ADAEAEBFC1C2CED1D29597979B9C9CB9B9B9B6B7B7B4B5
        B5B4B5B5B0B1B1B1B2B1B0B1B1B2B3B3B3B3B4B3B4B4B1B1B1A6A7A7A4A4A498
        98987A7B7A808080F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F22E2E2F363737
        3334342021222021212424252B2B2C28292A28292A2324252424252425251A1B
        1C1617184244455F62636A6B6CBCC1C2B3B7B7B5B8B9B5B9B9AFB2B2B7BABBC5
        C9C98F90904A4A4A7A7B7A8F8F8E9A9C9BA0A09FA3A4A49C9C9C9595947C7C7B
        7979797778776464645C5C5B7B7C7CB6B6B6F5F5F6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF9F9F98384848E8F8F4546472122231717191B1B1C1F202122
        23232121231F1F201F20212223242526272121221E1F201B1C1D151516353738
        414142727677B3B6B7BBBFC0BCBFC0C5C8C87476761212131F1F202425262D2D
        2E4444443E3F3F3434353233332D2C2D1E1F203031316B6B6B6E6F70FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8585866060611B1C1D0D0D0E1617181818191F20201F20211B1B
        1C1D1E1F1F1F201F1F211E1F201E1E1F191A1A1111122E30312C2C2D7A7F80A4
        A7A84C4C4D0000000000000000000000008284836768680C0C0D222325222224
        0C0C0E474849C5C8C99D9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F
        9FA07B7C7C28292A0B0C0E1111121717181D1D1E2021221A1B1C1E1F201E1E1F
        1A1B1C1515170C0C0D0708091314153133341212130000000000010202030A0A
        0B828383AEB0B03B3B3C2A2A2C2E2E2E0000008B8D8DBDBEBF898A8BFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1A1A18586873C3D
        3E0A0B0C0D0E0F1718181213140B0C0D0B0C0D545455A7A7A8F5F6F6FFFFFFFF
        FFFF2E2E2F0404052424261D1D1E272829363738B1B4B4AAADAD505152333335
        818283B6B8B8B1B2B3535354FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE8B8C8C141616707172C1C2C2
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D2F1A1A1B4F4E4E3132332A2A
        2C36363837383ABDBFC0BEBFBFBFC1C2C0C2C2BABCBD38383A606061FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF3132331616185656563131322C2D2E3F3F413A3A3C222224616263888A8B
        6B6B6D2F2F313E3E40666767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B2C2E2C2C2D4A4A4A2A2A2C2D2D
        2F3D3D3E3E3E403B3B3C3636383534363535363E3E403D3D3F616162FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF2223241C1C1D3F3F3F2E2F302D2D303A3A3C3D3D3E3C3C3D3B3C3D3B3B3C
        3E3E403F40413E3E40676869FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1E1F2E2E2F3B3B3B2425263435
        363C3C3D4040413D3D3E3D3D3E3E3E403E3D3F3D3D3F3E3E40626263FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF191A1B2A2A2B3A3A3C26272839393B3F3F413E3E403D3E3F3E3E403F3F40
        3D3D3F3D3D3F404042636365FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0C0E1D1E1F26262728292A3838
        394142444141424040423F3F414141433D3D3F4040423A3B3D646465FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
        F0F00000001010111415162526274545465050514A4A4B4546484040413F4041
        4141423E3F403A3B3C6F7071FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7273740505070F0F100D0D0E1E1E204141
        435353545455564A4A4B4647484242443F3F413F3F413E3E4068696AFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF5F5F5A7A7A7737475BABBBBBDBEBFCCCDCDCBCC
        CCE6E6E6FBFAFAE6E6E6FBFBFBF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFD2D3D300
        000010111319191B0808090E0F112524264646485353534E4E4F48484A464647
        3F3F404141423C3C3D6D6E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADBDB8788893D3D3F191A1C2C
        2C2EA9ABACBABDBDB9BCBCB7B9B9BDC0C0A1A3A3AEB0B0A2A4A58B8C8DB6B8B9
        868788ACAEAEA9ACADABADAD8A8B8C3232346C6D6E2223259C9FA0999A9B8789
        8A5656584C4C4D5050514C4C4D4A4A4B4141423F3F413E3E406D6D6EFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBD
        28292A16171923232428282A2E2E303C3D3DC6C8C8C4C6C7C7C9C9C4C6C6C0C1
        C1C7CACAC5C7C7C0C2C2C5C7C7BFC1C2BFC1C1BBBEBFCACCCCC7C9C9CFD1D1DC
        DFE0C8CBCBD7D8D9D0D2D2CDD0D0CCCDCED6D8D85F60614E4E4F4E4E50444446
        424344404042434445737476FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF27282A2525273132332E2F312C2D2E2B2C2E4E
        4E4FBEC1C1C6CACABDBFC0C6C7C8C7C9C9CACCCDCCCDCDCACCCDC7C9CAC6C8C9
        C7C9C9CDCFCFC8C9CAC1C4C4CDCFCFCBCDCED5D7D8D1D3D4CCCECFC6C8C9CFD1
        D2D2D4D5A5A6A74444454A4A4C4545474141433F3F413E3F40848485FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF151518
        28292A2B2C2D2E2F302B2B2D2F2F30414142B9BBBBC3C5C5C1C3C3C7C9CAC1C3
        C4C4C7C7CBCDCDCDCFD0CCCECFC7C8C9C9CBCBCBCCCDC7C9CAC4C7C8CCCDCEC8
        CACBC9CCCDCECFCFD0D2D2D6D8D8CFD2D3CCCDCDC4C6C63E3E404A4A4C424243
        4141433E3E3F4243448E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF1517192A2B2D2D2E2F2F2F302E2F3028282A1B
        1C1D323334A5A7A7BFC1C0A4A6A7DADCDCDADCDCD0D0D1D1D3D3D7D8D8DBDCDC
        D8D9DAD1D3D3D5D6D7CACBCCC7C8C9CED0D0D5D7D8CDCFCFC5C6C7CBCDCDD0D0
        D1DDDFE0B2B2B33B3B3C4545464041433E3E3F3E3E403E3F40AFB0B0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2E2F
        23242629292B292A2C2627291D1F201E1F202D2D2E2C2C2D3737392525263131
        3229292B5152535F5F616F71727E7F80A2A4A5ABAEAFCFD2D3D9DBDDDADCDDE3
        E4E5D8DBDBE3E5E6E6E8E9DBDDDED7DADAD7D9DA4040413F3F41444446414143
        3F3F414141433A3B3DDBDBDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB2B1B20405082223242424261E1F2020212221
        22242A2A2B3636373435362B2B2C27282A262728282829262628222324222223
        2323252424251718191717181515162122243F40414445475152535354564546
        471213143232343E3E3F403F414040423E3E404444453C3C3EFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        D3D3D325262717181A27282A1E1F212021222224253131323A3A3C2A2A2C2828
        2A24262727282A25262825262828282A26272926272928282A25262724242623
        24252021232222241E1E201D1E1F1D1D1F2A2A2C3738393B3B3D3E3E3F3E3E40
        3E3E3F3F3F4178797AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171720A0B0D1D1E201E
        1F201F20212021233E3E3F3A3A3B2424262728292627292728292A2B2C29292B
        2A2B2C2D2E2F27282929292B25262827282A27282928282A27282A2B2C2D292A
        2B2E2E2F3232343B3A3C3E3E403E3F413D3D3F333335D5D5D6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD1D1D12324251415172122241F20212323253E3D3F2E2E
        2F28282928282A27282A27272928292A28292A27282928292A28292A2A2B2C29
        292B292A2B28292A2A2A2C2A2A2C2D2E2F2E2E2F3737393E3E403E3F403E3E3F
        454546515152FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75
        75760C0D0F2021221F21222A2A2B4241423031322223242D2D2E2A2A2C2A2B2C
        2B2B2C292A2B28292A2A2B2D28292A28292A28282A28292A28292A2C2C2D2D2E
        2F3333353A3A3C3E3E403D3D3E444547242426E3E4E4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D828292B1B1C1D2526272727
        294646463D3E3E2627292A2A2B3132332F2F312F2F312F2F303030312F30312E
        2E2F2D2E302D2D2E2F30313131333535363A3A3C3C3D3E3E3F40444446212123
        A1A1A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF8989891313152728292828293F3F405050502E2E30242526
        2E2E2F3334353B3B3D38383A39393B36363839393A39393B39393B3B3B3D3C3D
        3E3E3D3F3E3E4039383A161618858687FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F55455
        561515172627283030324343445151513F3F4028292A2D2D2E32323334343639
        3A3B363638393A3B3B3B3C3D3D3E3F3F403838392728290F1012AFB0B1FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E059595B191A1B28282A2F2F31
        3C3C3E44444539393B3031322A2A2B2E2F302D2D2E3232342D2E2F28282A1D1E
        200F0F114C4D4EFAFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF1F1F18E8F9040414322222529292B2F2F3134343534343534
        34362C2C2E2222231E1E20232426676769D1D2D2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F4F4F5BDBDBE9292937676786B6C6D747476828284A4A5A6D9D9DAFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      Stretch = True
      Transparent = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 637
    Width = 908
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 65
      Height = 25
      Caption = #1057#1087#1080#1089#1086#1082' ...'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 88
      Top = 8
      Width = 65
      Height = 25
      Caption = #1042#1087#1077#1088#1077#1076' ->'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 336
      Top = 8
      Width = 65
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 16
    Top = 192
  end
  object IdUDP: TIdUDPClient
    Port = 0
    Left = 16
    Top = 244
  end
  object Timer2: TTimer
    Interval = 100
    OnTimer = Timer2Timer
    Left = 48
    Top = 192
  end
end
