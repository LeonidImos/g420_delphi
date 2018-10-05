object Form1: TForm1
  Left = 1357
  Top = 312
  BorderStyle = bsSingle
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080' '#1075#1077#1085#1077#1088#1072#1090#1086#1088#1072' '#1043'-420'
  ClientHeight = 326
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 606
    Height = 325
    ActivePage = TabSheet5
    Style = tsButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '0'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label8: TLabel
        Left = 188
        Top = 15
        Width = 163
        Height = 24
        Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080' '#1043'-420'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 152
        Top = 45
        Width = 223
        Height = 13
        Caption = #1069#1090#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '
      end
      object Label25: TLabel
        Left = 164
        Top = 228
        Width = 237
        Height = 13
        Caption = #1042' '#1089#1080#1089#1090#1077#1084#1077' '#1085#1077' '#1086#1073#1085#1072#1088#1091#1078#1077#1085#1086' '#1089#1077#1090#1077#1074#1099#1093' '#1091#1089#1090#1088#1086#1081#1089#1090#1074' !'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object p0_next_btn: TButton
        Left = 112
        Top = 260
        Width = 75
        Height = 25
        Caption = #1044#1072#1083#1077#1077' >'
        TabOrder = 0
        OnClick = p0_next_btnClick
      end
      object NetSelectCB: TCheckBox
        Left = 164
        Top = 196
        Width = 121
        Height = 17
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1086#1076#1089#1077#1090#1100
        TabOrder = 1
      end
      object Button11: TButton
        Left = 512
        Top = 260
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 2
        OnClick = CloseButtonClick
      end
      object Button1: TButton
        Left = 16
        Top = 260
        Width = 75
        Height = 25
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 3
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = '1'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label9: TLabel
        Left = 184
        Top = 184
        Width = 201
        Height = 13
        Caption = 'IP '#1072#1076#1088#1077#1089' '#1043'-420, '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1099#1081' '#1089#1077#1081#1095#1072#1089' :'
        Enabled = False
      end
      object Label5: TLabel
        Left = 210
        Top = 136
        Width = 163
        Height = 26
        Caption = #1043'-420 '#1080' '#1082#1086#1084#1087#1100#1102#1090#1077#1088' '#1085#1072#1093#1086#1076#1103#1090#1089#1103' '#1074' '#13#10#1088#1072#1079#1085#1099#1093' '#1089#1077#1075#1084#1077#1085#1090#1072#1093' '#1089#1077#1090#1080'.'
        OnClick = Label5Click
      end
      object Label4: TLabel
        Left = 200
        Top = 72
        Width = 197
        Height = 39
        Caption = 
          #1043'-420 '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1085#1077#1087#1086#1089#1088#1077#1076#1089#1090#1074#1077#1085#1085#1086' '#13#10#1082' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1091' '#1083#1080#1073#1086' '#1073#1083#1086#1082' '#1080' '#1082#1086#1084#1087#1100 +
          #1102#1090#1077#1088' '#13#10#1074#1082#1083#1102#1095#1077#1085#1099' '#1074' '#1086#1076#1080#1085' '#1089#1077#1075#1084#1077#1085#1090' '#1089#1077#1090#1080
        OnClick = Label4Click
      end
      object RadioButton2: TRadioButton
        Left = 160
        Top = 72
        Width = 17
        Height = 41
        BiDiMode = bdLeftToRight
        Checked = True
        ParentBiDiMode = False
        TabOrder = 0
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton1: TRadioButton
        Left = 160
        Top = 128
        Width = 17
        Height = 41
        TabOrder = 1
        OnClick = RadioButton1Click
      end
      object p1_prev_btn: TButton
        Left = 16
        Top = 260
        Width = 75
        Height = 25
        Caption = '< '#1053#1072#1079#1072#1076
        TabOrder = 2
        OnClick = p1_prev_btnClick
      end
      object p1_next_btn: TButton
        Left = 112
        Top = 260
        Width = 75
        Height = 25
        Caption = #1044#1072#1083#1077#1077' >'
        TabOrder = 3
        OnClick = p1_next_btnClick
      end
      object IP_Edit_Panel1: TPanel
        Left = 210
        Top = 203
        Width = 120
        Height = 21
        Cursor = crIBeam
        BevelOuter = bvLowered
        BevelWidth = 2
        Color = clWindow
        Enabled = False
        ParentBackground = False
        TabOrder = 4
        OnMouseDown = IP_PanelMouseDown
        object Label10: TLabel
          Left = 30
          Top = 8
          Width = 3
          Height = 13
          Caption = '.'
        end
        object Label11: TLabel
          Left = 60
          Top = 8
          Width = 3
          Height = 13
          Caption = '.'
        end
        object Label12: TLabel
          Left = 90
          Top = 8
          Width = 3
          Height = 13
          Caption = '.'
        end
        object IP_Edit_a1: TEdit
          Left = 7
          Top = 5
          Width = 22
          Height = 14
          AutoSize = False
          BorderStyle = bsNone
          Enabled = False
          MaxLength = 3
          TabOrder = 0
          Text = '192'
          OnChange = IP_Edit_Change
          OnKeyDown = IP_Edit_KeyDown
          OnKeyPress = IP_Edit_KeyPress
        end
        object IP_Edit_b1: TEdit
          Left = 37
          Top = 5
          Width = 22
          Height = 14
          BorderStyle = bsNone
          Enabled = False
          MaxLength = 3
          TabOrder = 1
          Text = '168'
          OnChange = IP_Edit_Change
          OnKeyDown = IP_Edit_KeyDown
          OnKeyPress = IP_Edit_KeyPress
        end
        object IP_Edit_c1: TEdit
          Left = 67
          Top = 5
          Width = 22
          Height = 14
          BorderStyle = bsNone
          Enabled = False
          MaxLength = 3
          TabOrder = 2
          Text = '222'
          OnChange = IP_Edit_Change
          OnKeyDown = IP_Edit_KeyDown
          OnKeyPress = IP_Edit_KeyPress
        end
        object IP_Edit_d1: TEdit
          Left = 97
          Top = 5
          Width = 22
          Height = 14
          BorderStyle = bsNone
          Enabled = False
          MaxLength = 3
          TabOrder = 3
          Text = '15'
          OnChange = IP_Edit_Change
          OnKeyDown = IP_Edit_KeyDown
          OnKeyPress = IP_Edit_KeyPress
        end
      end
      object CloseButton: TButton
        Left = 512
        Top = 260
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 5
        OnClick = CloseButtonClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = '2'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 172
        Top = 3
        Width = 279
        Height = 26
        Caption = 
          #1042' '#1089#1080#1089#1090#1077#1084#1077' '#1086#1073#1085#1072#1088#1091#1078#1077#1085#1086' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1089#1077#1090#1077#1074#1099#1093' '#1091#1089#1090#1088#1086#1081#1089#1090#1074'. '#13#10#1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1077#1075 +
          #1084#1077#1085#1090' '#1089#1077#1090#1080', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1043'-420'
      end
      object RadioGroup1: TRadioGroup
        Left = 172
        Top = 48
        Width = 249
        Height = 193
        Caption = #1055#1086#1076#1089#1077#1090#1080' '
        TabOrder = 0
        Visible = False
      end
      object p2_prev_btn: TButton
        Left = 16
        Top = 260
        Width = 75
        Height = 25
        Caption = '< '#1053#1072#1079#1072#1076
        TabOrder = 1
        OnClick = p2_prev_btnClick
      end
      object p2_next_btn: TButton
        Left = 112
        Top = 260
        Width = 75
        Height = 25
        Caption = #1044#1072#1083#1077#1077' >'
        TabOrder = 2
        OnClick = p2_next_btnClick
      end
      object Button10: TButton
        Left = 512
        Top = 260
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 3
        OnClick = CloseButtonClick
      end
    end
    object TabSheet4: TTabSheet
      Caption = '3'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 153
        Top = 16
        Width = 244
        Height = 13
        Caption = #1053#1072#1081#1076#1077#1085#1099' '#1075#1077#1085#1077#1088#1072#1090#1086#1088#1099' '#1089' '#1079#1072#1074#1086#1076#1089#1082#1080#1084#1080' '#1085#1086#1084#1077#1088#1072#1084#1080' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 176
        Top = 220
        Width = 207
        Height = 26
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1073#1083#1086#1082' '#1076#1083#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1085#1072#1089#1090#1088#1086#1077#1082#13#10' '#1080' '#1085#1072#1078#1084#1080#1090#1077' "'#1044#1072#1083#1077#1077'"'
      end
      object NoInitLabel: TLabel
        Left = 171
        Top = 452
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object p3_prev_btn: TButton
        Left = 16
        Top = 260
        Width = 75
        Height = 25
        Caption = '< '#1053#1072#1079#1072#1076
        TabOrder = 0
        OnClick = p3_prev_btnClick
      end
      object p3_next_btn: TButton
        Left = 112
        Top = 260
        Width = 75
        Height = 25
        Caption = #1044#1072#1083#1077#1077' >'
        Enabled = False
        TabOrder = 1
        OnClick = p3_next_btnClick
      end
      object ListBox1: TListBox
        Left = 203
        Top = 48
        Width = 158
        Height = 166
        ItemHeight = 13
        TabOrder = 2
        OnClick = ListBox1Click
      end
      object FindButton: TButton
        Left = 432
        Top = 108
        Width = 100
        Height = 25
        Caption = #1055#1086#1080#1089#1082#1072#1090#1100' '#1077#1097#1077
        TabOrder = 3
        OnClick = FindButtonClick
      end
      object Button5: TButton
        Left = 512
        Top = 260
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 4
        OnClick = CloseButtonClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = '4'
      ImageIndex = 4
      object Bevel1: TBevel
        Left = 8
        Top = 8
        Width = 585
        Height = 33
        Shape = bsFrame
      end
      object Label2: TLabel
        Left = 30
        Top = 16
        Width = 176
        Height = 16
        Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1079#1072#1074'.'#1085#1086#1084#1077#1088' '#8470' '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 335
        Top = 16
        Width = 133
        Height = 14
        Caption = 'IP '#1072#1076#1088#1077#1089' '#1079#1072#1087#1088#1086#1089#1072':  '
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
      object SetButton: TButton
        Left = 220
        Top = 258
        Width = 129
        Height = 25
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
        TabOrder = 0
        OnClick = SetButtonClick
      end
      object p4_prev_btn: TButton
        Left = 12
        Top = 258
        Width = 75
        Height = 25
        Caption = '< '#1053#1072#1079#1072#1076
        TabOrder = 1
        OnClick = p4_prev_btnClick
      end
      object Button6: TButton
        Left = 508
        Top = 258
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        TabOrder = 2
        OnClick = CloseButtonClick
      end
      object GroupBox4: TGroupBox
        Left = 336
        Top = 48
        Width = 257
        Height = 129
        Caption = ' '#1057#1077#1090#1077#1074#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1043'-420'
        TabOrder = 3
        object IP_Edit_Panel2: TPanel
          Left = 128
          Top = 16
          Width = 120
          Height = 21
          BevelOuter = bvLowered
          BevelWidth = 2
          Color = clWindow
          Enabled = False
          ParentBackground = False
          TabOrder = 0
          OnMouseDown = IP_PanelMouseDown
          object Label14: TLabel
            Left = 30
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label15: TLabel
            Left = 60
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label16: TLabel
            Left = 90
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object IP_Edit_b2: TEdit
            Left = 37
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 1
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_c2: TEdit
            Left = 67
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 2
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_d2: TEdit
            Left = 97
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 3
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_a2: TEdit
            Left = 7
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 0
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
        end
        object IP_Edit_Panel3: TPanel
          Left = 128
          Top = 40
          Width = 120
          Height = 21
          BevelOuter = bvLowered
          BevelWidth = 2
          Color = clWindow
          Enabled = False
          ParentBackground = False
          TabOrder = 1
          OnMouseDown = IP_PanelMouseDown
          object Label17: TLabel
            Left = 30
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label18: TLabel
            Left = 60
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label19: TLabel
            Left = 90
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object IP_Edit_a3: TEdit
            Left = 7
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 0
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_b3: TEdit
            Left = 37
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 1
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_c3: TEdit
            Left = 67
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 2
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_d3: TEdit
            Left = 97
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 3
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
        end
        object IP_Edit_Panel4: TPanel
          Left = 128
          Top = 64
          Width = 120
          Height = 21
          BevelOuter = bvLowered
          BevelWidth = 2
          Color = clWindow
          Enabled = False
          ParentBackground = False
          TabOrder = 2
          OnMouseDown = IP_PanelMouseDown
          object Label20: TLabel
            Left = 30
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label21: TLabel
            Left = 60
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label22: TLabel
            Left = 90
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object IP_Edit_a4: TEdit
            Left = 7
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 0
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_b4: TEdit
            Left = 37
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 1
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_c4: TEdit
            Left = 67
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 2
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_d4: TEdit
            Left = 97
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 3
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
        end
        object IPGatewayCB: TCheckBox
          Left = 11
          Top = 64
          Width = 110
          Height = 17
          Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1096#1083#1102#1079
          TabOrder = 3
          OnClick = IPCBClick
        end
        object IPMaskCB: TCheckBox
          Left = 11
          Top = 40
          Width = 110
          Height = 17
          Caption = #1052#1072#1089#1082#1072' '#1087#1086#1076#1089#1077#1090#1080
          TabOrder = 4
          OnClick = IPCBClick
        end
        object IPAddrCB: TCheckBox
          Left = 11
          Top = 16
          Width = 73
          Height = 17
          Caption = 'IP '#1072#1076#1088#1077#1089
          TabOrder = 5
          OnClick = IPCBClick
        end
        object DhcpOnCB: TCheckBox
          Left = 11
          Top = 104
          Width = 97
          Height = 17
          Caption = 'DHCP '#1089#1077#1088#1074#1077#1088
          TabOrder = 6
          OnClick = DhcpOnCBClick
        end
        object Button2: TButton
          Left = 128
          Top = 100
          Width = 121
          Height = 21
          Caption = #1047#1072#1074#1086#1076#1089#1082#1080#1077' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
          TabOrder = 7
          OnClick = Button2Click
        end
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 48
        Width = 321
        Height = 129
        Caption = ' '#1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '
        TabOrder = 4
        Visible = False
        object ClientIPLabel: TLabel
          Left = 192
          Top = 16
          Width = 60
          Height = 13
          Caption = 'IP '#1082#1083#1080#1077#1085#1090#1072': '
          Enabled = False
        end
        object PassLabel: TLabel
          Left = 192
          Top = 80
          Width = 47
          Height = 13
          Caption = #1055#1072#1088#1086#1083#1100' : '
          Enabled = False
        end
        object GroupBox10: TGroupBox
          Left = 8
          Top = 16
          Width = 177
          Height = 105
          Caption = ' '#1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1043'-420'
          TabOrder = 0
          object ControlMod0_RB: TRadioButton
            Left = 8
            Top = 16
            Width = 161
            Height = 17
            Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086' '#1074#1089#1077#1084' '
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = ControlMod_RBClick
          end
          object ControlMod1_RB: TRadioButton
            Tag = 1
            Left = 8
            Top = 32
            Width = 161
            Height = 17
            Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086' '#1087#1086' IP'
            TabOrder = 1
            OnClick = ControlMod_RBClick
          end
          object ControlMod2_RB: TRadioButton
            Tag = 2
            Left = 8
            Top = 48
            Width = 161
            Height = 17
            Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086' '#1087#1086' '#1087#1072#1088#1086#1083#1102' '
            TabOrder = 2
            OnClick = ControlMod_RBClick
          end
          object ControlMod3_RB: TRadioButton
            Tag = 3
            Left = 8
            Top = 64
            Width = 161
            Height = 17
            Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086' '#1087#1086' IP '#1089' '#1087#1072#1088#1086#1083#1077#1084' '
            TabOrder = 3
            OnClick = ControlMod_RBClick
          end
          object ControlMod4_RB: TRadioButton
            Tag = 4
            Left = 8
            Top = 80
            Width = 161
            Height = 17
            Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1086
            TabOrder = 4
            OnClick = ControlMod_RBClick
          end
        end
        object IP_Edit_Panel5: TPanel
          Left = 192
          Top = 32
          Width = 120
          Height = 21
          BevelOuter = bvLowered
          BevelWidth = 2
          Color = clWindow
          ParentBackground = False
          TabOrder = 1
          OnMouseDown = IP_PanelMouseDown
          object Label28: TLabel
            Left = 30
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label29: TLabel
            Left = 60
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object Label30: TLabel
            Left = 90
            Top = 8
            Width = 3
            Height = 13
            Caption = '.'
          end
          object IP_Edit_a5: TEdit
            Left = 7
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 0
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_b5: TEdit
            Left = 37
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 1
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_c5: TEdit
            Left = 67
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 2
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
          object IP_Edit_d5: TEdit
            Left = 97
            Top = 5
            Width = 22
            Height = 14
            BorderStyle = bsNone
            Enabled = False
            MaxLength = 3
            TabOrder = 3
            Text = '111'
            OnChange = IP_Edit_Change
            OnKeyDown = IP_Edit_KeyDown
            OnKeyPress = IP_Edit_KeyPress
          end
        end
        object PassEdit: TEdit
          Left = 192
          Top = 96
          Width = 121
          Height = 21
          Enabled = False
          MaxLength = 16
          PasswordChar = '*'
          TabOrder = 2
          OnChange = PassEditChange
        end
        object MyIPButton: TButton
          Left = 192
          Top = 56
          Width = 121
          Height = 22
          Caption = #1042#1079#1103#1090#1100' IP '#1101#1090#1086#1075#1086' '#1055#1050
          Enabled = False
          TabOrder = 3
          OnClick = MyIPButtonClick
        end
      end
    end
  end
  object IdUDP: TIdUDPClient
    Port = 1026
    Left = 476
    Top = 12
  end
  object Timer: TTimer
    Interval = 100
    OnTimer = TimerTimer
    Left = 512
    Top = 8
  end
end
