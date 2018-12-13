object VisForm: TVisForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1075#1077#1085#1077#1088#1072#1090#1086#1088#1072' '#1043'-420'
  ClientHeight = 605
  ClientWidth = 1225
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 833
    Top = 0
    Width = 392
    Height = 605
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 12
      Top = 75
      Width = 369
      Height = 146
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' DSP '
      TabOrder = 0
      object g420_filename_dsp11_edit: TEdit
        Left = 12
        Top = 20
        Width = 155
        Height = 21
        TabOrder = 0
        OnDblClick = g420_filename_editDblClick
      end
      object g420_dsp11Button: TButton
        Left = 173
        Top = 19
        Width = 92
        Height = 22
        Caption = 'Eth (main)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        Images = ImageList1
        ParentFont = False
        TabOrder = 1
        OnClick = g420_dsp11ButtonClick
      end
      object g420_dsp_StatusPanel: TPanel
        Left = 97
        Top = 107
        Width = 168
        Height = 22
        BevelOuter = bvLowered
        ParentBackground = False
        TabOrder = 2
      end
      object g420_dsp_RestartChB: TCheckBox
        Left = 12
        Top = 111
        Width = 79
        Height = 17
        Caption = 'Restart DSP'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object g420_filename_dsp12_edit: TEdit
        Left = 12
        Top = 47
        Width = 155
        Height = 21
        TabOrder = 4
        OnDblClick = g420_filename_editDblClick
      end
      object g420_dsp12Button: TButton
        Left = 173
        Top = 47
        Width = 92
        Height = 22
        Caption = 'Eth (reserve)'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        Images = ImageList1
        ParentFont = False
        TabOrder = 5
        OnClick = g420_dsp12ButtonClick
      end
      object g420_filename_dsp21_edit: TEdit
        Left = 12
        Top = 75
        Width = 155
        Height = 21
        TabOrder = 6
        OnDblClick = g420_filename_editDblClick
      end
      object g420_dsp21Button: TButton
        Left = 173
        Top = 75
        Width = 92
        Height = 22
        Caption = 'MPEG'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 0
        Images = ImageList1
        ParentFont = False
        TabOrder = 7
        OnClick = g420_dsp21ButtonClick
      end
      object Button8: TButton
        Left = 271
        Top = 75
        Width = 75
        Height = 22
        Caption = #1057#1073#1088#1086#1089
        TabOrder = 8
        OnClick = Button8Click
      end
    end
    object GroupBox6: TGroupBox
      Left = 12
      Top = 227
      Width = 373
      Height = 354
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' SD '#1082#1072#1088#1090' '
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 2
        Top = 15
        Width = 369
        Height = 276
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = #1056#1091#1095#1085#1086#1077
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label1: TLabel
            Left = 12
            Top = 53
            Width = 65
            Height = 13
            Caption = #1042#1093'. '#1073#1080#1090#1088#1077#1081#1090':'
          end
          object Label19: TLabel
            Left = 12
            Top = 102
            Width = 101
            Height = 13
            Caption = #1053#1072#1095'. '#1072#1076#1088'. '#1074' '#1073#1083#1086#1082#1072#1093':'
          end
          object Label20: TLabel
            Left = 12
            Top = 130
            Width = 190
            Height = 13
            Caption = #1063#1080#1089#1083#1086' '#1073#1083#1086#1082#1086#1074', '#1073#1077#1079' '#1086#1078#1080#1076#1072#1085#1080#1103' '#1086#1090#1074#1077#1090#1072':'
          end
          object g420_filename_sd1_edit: TEdit
            Left = 12
            Top = 20
            Width = 277
            Height = 21
            TabOrder = 0
            OnDblClick = g420_filename_editDblClick
          end
          object g420_sd1Button: TButton
            Left = 295
            Top = 19
            Width = 54
            Height = 25
            Caption = 'Prog.'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = g420_sd1ButtonClick
          end
          object g420_bitrateEdit: TEdit
            Left = 83
            Top = 47
            Width = 81
            Height = 21
            TabOrder = 2
            Text = '2049952'
            OnChange = g420_bitrateEditChange
          end
          object g420_StartAddrEdit: TEdit
            Left = 119
            Top = 99
            Width = 99
            Height = 21
            TabOrder = 3
            Text = '0'
            OnChange = g420_StartAddrEditChange
          end
          object IncrChB: TCheckBox
            Left = 224
            Top = 101
            Width = 37
            Height = 17
            Caption = '++'
            TabOrder = 4
          end
          object g420_blockCount_SpinEdit: TSpinEdit
            Left = 208
            Top = 126
            Width = 49
            Height = 22
            MaxValue = 100
            MinValue = 1
            TabOrder = 5
            Value = 5
          end
          object g420_playModeCbB: TComboBox
            Left = 12
            Top = 160
            Width = 125
            Height = 22
            Style = csOwnerDrawFixed
            ItemIndex = 0
            TabOrder = 6
            Text = 'MPEG '#1086#1076#1080#1085#1086#1095#1085#1086#1077
            Items.Strings = (
              'MPEG '#1086#1076#1080#1085#1086#1095#1085#1086#1077
              'MPEG '#1074' '#1094#1080#1082#1083#1077
              'SDI '#1086#1076#1080#1085#1086#1095#1085#1086#1077
              'SDI '#1074' '#1094#1080#1082#1083#1077
              'HD SDI '#1086#1076#1080#1085#1086#1095#1085#1086#1077
              'HD SDI '#1074' '#1094#1080#1082#1083#1077
              'HD SDI '#1087#1072#1082'. '#1086#1076#1080#1085#1086#1095#1085#1086#1077
              'HD SDI '#1087#1072#1082'. '#1074' '#1094#1080#1082#1083#1077)
          end
          object g420_startButton: TBitBtn
            Left = 143
            Top = 159
            Width = 59
            Height = 25
            Caption = #1057#1090#1072#1088#1090
            DoubleBuffered = True
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
            ParentDoubleBuffered = False
            TabOrder = 7
            OnClick = g420_startButtonClick
          end
          object g420_stopButton: TBitBtn
            Left = 206
            Top = 159
            Width = 55
            Height = 25
            Caption = #1057#1090#1086#1087
            DoubleBuffered = True
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
              00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
              70E337F33333333337F3E0F33333333370E337F333FFFFF337F3E0F330000033
              70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
              70E337F3377777F337F3E0F33000003370E337F3377777F337F3E0F330000033
              70E337F33777773337F3E0F33333333370E337F33333333337F3E0F333333333
              70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
              00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
            NumGlyphs = 2
            ParentDoubleBuffered = False
            TabOrder = 8
            OnClick = g420_stopButtonClick
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1057#1087#1080#1089#1082#1086#1084' '#1089#1080#1075#1085#1072#1083#1086#1074
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Panel4: TPanel
            Left = 192
            Top = 0
            Width = 169
            Height = 248
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object GroupBox1: TGroupBox
              Left = 6
              Top = 177
              Width = 155
              Height = 69
              Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077
              TabOrder = 0
              object ProgSigChB: TCheckBox
                Left = 10
                Top = 47
                Width = 115
                Height = 17
                Caption = #1042#1084#1077#1089#1090#1077' '#1089' '#1089#1080#1075#1085#1072#1083#1072#1084#1080
                Checked = True
                State = cbChecked
                TabOrder = 0
              end
              object ListProgButton: TButton
                Left = 10
                Top = 16
                Width = 115
                Height = 25
                Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1090#1100
                Enabled = False
                TabOrder = 1
                OnClick = ListProgButtonClick
              end
            end
            object GroupBox2: TGroupBox
              Left = 6
              Top = 4
              Width = 155
              Height = 69
              Caption = #1057#1080#1075#1085#1072#1083' '
              TabOrder = 1
              object SigAddButton: TButton
                Left = 3
                Top = 15
                Width = 75
                Height = 21
                Caption = #1044#1086#1073#1072#1074#1080#1090#1100'...'
                TabOrder = 0
                OnClick = SigAddButtonClick
              end
              object SigEditButton: TButton
                Left = 3
                Top = 42
                Width = 75
                Height = 21
                Caption = #1048#1079#1084#1077#1085#1080#1090#1100'...'
                TabOrder = 1
                OnClick = SigEditButtonClick
              end
              object SigDelButton: TButton
                Left = 84
                Top = 15
                Width = 63
                Height = 21
                Caption = #1059#1076#1072#1083#1080#1090#1100
                TabOrder = 2
                OnClick = SigDelButtonClick
              end
              object SigPlayButton: TButton
                Left = 84
                Top = 42
                Width = 61
                Height = 21
                Caption = #1048#1075#1088#1072#1090#1100
                TabOrder = 3
                OnClick = SigPlayButtonClick
              end
            end
            object GroupBox4: TGroupBox
              Left = 6
              Top = 79
              Width = 153
              Height = 62
              Caption = #1057#1087#1080#1089#1086#1082
              TabOrder = 2
              object ListSaveButton: TButton
                Left = 3
                Top = 38
                Width = 79
                Height = 21
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'...'
                TabOrder = 0
                OnClick = ListSaveButtonClick
              end
              object ListOpenButton: TButton
                Left = 3
                Top = 11
                Width = 79
                Height = 21
                Caption = #1054#1090#1082#1088#1099#1090#1100'...'
                TabOrder = 1
                OnClick = ListOpenButtonClick
              end
              object ListClearButton: TButton
                Left = 88
                Top = 38
                Width = 59
                Height = 21
                Caption = #1054#1095#1080#1089#1090#1080#1090#1100
                TabOrder = 2
                OnClick = ListClearButtonClick
              end
              object ListReadButton: TButton
                Left = 88
                Top = 11
                Width = 59
                Height = 21
                Caption = #1055#1086#1083#1091#1095#1080#1090#1100
                TabOrder = 3
              end
            end
            object Button1: TButton
              Left = 10
              Top = 147
              Width = 147
              Height = 21
              Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1044#1059
              TabOrder = 3
              OnClick = Button1Click
            end
          end
          object ListBox1: TListBox
            Left = 0
            Top = 0
            Width = 192
            Height = 248
            Align = alClient
            ItemHeight = 13
            TabOrder = 1
          end
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 291
        Width = 369
        Height = 61
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label2: TLabel
          Left = 114
          Top = 10
          Width = 73
          Height = 13
          Caption = #1042#1099#1093'. '#1073#1080#1090#1088#1077#1081#1090':'
        end
        object g420_sd_StatusPanel: TPanel
          Left = 7
          Top = 29
          Width = 358
          Height = 25
          BevelOuter = bvLowered
          ParentBackground = False
          TabOrder = 0
        end
        object g420_sd_CbB: TComboBox
          Left = 8
          Top = 6
          Width = 77
          Height = 22
          Style = csOwnerDrawFixed
          ItemIndex = 0
          TabOrder = 1
          Text = 'SD1'
          Items.Strings = (
            'SD1'
            'SD2'
            'SD3'
            'SD4'
            'SD1 '#1080' SD2'
            'SD3 '#1080' SD4'
            #1074#1089#1077' 4 SD')
        end
        object g420_bitrateOutEdit: TEdit
          Left = 193
          Top = 6
          Width = 81
          Height = 21
          TabOrder = 2
          Text = '2049952'
          OnChange = g420_bitrateOutEditChange
        end
      end
    end
    object g420logChB: TCheckBox
      Left = 16
      Top = 579
      Width = 137
      Height = 17
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1083#1086#1075
      TabOrder = 2
    end
    object G420loopChB: TCheckBox
      Left = 159
      Top = 579
      Width = 130
      Height = 17
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1085#1072#1103' '#1087#1077#1090#1083#1103
      TabOrder = 3
    end
    object ConnectEdit: TEdit
      Left = 17
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 4
      Text = '192.168.111.213'
    end
    object ConnectButton: TButton
      Left = 144
      Top = 6
      Width = 145
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1089#1086#1077#1076#1080#1085#1077#1085#1080#1077
      TabOrder = 5
      OnClick = ConnectButtonClick
    end
    object ConnectStatusPanel: TPanel
      Left = 16
      Top = 36
      Width = 273
      Height = 21
      BevelOuter = bvLowered
      ParentBackground = False
      TabOrder = 6
    end
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 833
    Height = 605
    Align = alClient
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 833
    Height = 605
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl: TPageControl
      Left = 0
      Top = 0
      Width = 833
      Height = 605
      ActivePage = TabSheet4
      Align = alClient
      TabOrder = 0
      object TabSheet3: TTabSheet
        Caption = #1086#1073#1097#1080#1081' '#1083#1086#1075
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Memo1: TMemo
          Left = 0
          Top = 81
          Width = 825
          Height = 496
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 825
          Height = 81
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object MemoClearButton: TButton
            Left = 12
            Top = 12
            Width = 85
            Height = 25
            Caption = #1054#1095#1080#1089#1090#1080#1090#1100
            TabOrder = 0
            OnClick = MemoClearButtonClick
          end
          object MemoCopyButton: TButton
            Left = 112
            Top = 12
            Width = 85
            Height = 25
            Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
            TabOrder = 1
            OnClick = MemoCopyButtonClick
          end
          object Edit1: TEdit
            Left = 12
            Top = 46
            Width = 182
            Height = 21
            TabOrder = 2
          end
          object Button9: TButton
            Left = 212
            Top = 44
            Width = 75
            Height = 25
            Caption = #1057#1090#1088#1086#1082#1072
            TabOrder = 3
            OnClick = Button9Click
          end
          object DeviceErrorChB: TCheckBox
            Left = 212
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Device Error'
            TabOrder = 4
            Visible = False
          end
          object Button3: TButton
            Left = 389
            Top = 12
            Width = 75
            Height = 25
            Caption = '101'
            TabOrder = 5
            OnClick = Button3Click
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #1086#1090#1083#1072#1076#1082#1072
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Splitter1: TSplitter
          Left = 0
          Top = 220
          Width = 825
          Height = 6
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 277
          ExplicitWidth = 675
        end
        object DebugMemo: TMemo
          Left = 0
          Top = 226
          Width = 825
          Height = 351
          Align = alClient
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object DebugHeaderPanel: TPanel
          Left = 0
          Top = 0
          Width = 825
          Height = 220
          Align = alTop
          BevelOuter = bvNone
          Constraints.MinHeight = 220
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 200
            Top = 0
            Width = 6
            Height = 220
            ExplicitLeft = 197
            ExplicitHeight = 277
          end
          object AddrListPanel: TPanel
            Left = 0
            Top = 0
            Width = 200
            Height = 220
            Align = alLeft
            BevelOuter = bvNone
            Constraints.MinWidth = 200
            TabOrder = 0
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 200
              Height = 83
              Align = alTop
              BevelInner = bvLowered
              TabOrder = 0
              object AddAddrButton: TButton
                Left = 6
                Top = 8
                Width = 63
                Height = 20
                Caption = #1076#1086#1073#1072#1074#1080#1090#1100
                TabOrder = 0
                OnClick = AddAddrButtonClick
              end
              object DelAddrButton: TButton
                Left = 6
                Top = 57
                Width = 63
                Height = 20
                Caption = #1091#1076#1072#1083#1080#1090#1100
                TabOrder = 1
                OnClick = DelAddrButtonClick
              end
              object Button10: TButton
                Left = 77
                Top = 8
                Width = 117
                Height = 20
                Caption = #1074#1079#1103#1090#1100
                TabOrder = 2
                OnClick = Button10Click
              end
              object ChangeAddrButton: TButton
                Left = 6
                Top = 31
                Width = 63
                Height = 20
                Caption = #1080#1079#1084#1077#1085#1080#1090#1100
                TabOrder = 3
                OnClick = ChangeAddrButtonClick
              end
              object ReadDumpListButton: TButton
                Left = 77
                Top = 34
                Width = 117
                Height = 20
                Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1076#1072#1084#1087
                TabOrder = 4
                OnClick = ReadDumpButtonClick
              end
              object Button13: TButton
                Left = 77
                Top = 57
                Width = 117
                Height = 20
                Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1089#1090#1088#1091#1082#1082#1090'.'
                TabOrder = 5
              end
            end
            object AddrListBox: TListBox
              Left = 0
              Top = 83
              Width = 200
              Height = 137
              Align = alClient
              ItemHeight = 13
              TabOrder = 1
            end
          end
          object Panel9: TPanel
            Left = 206
            Top = 0
            Width = 619
            Height = 220
            Align = alClient
            BevelInner = bvLowered
            TabOrder = 1
            object Label5: TLabel
              Left = 236
              Top = 43
              Width = 29
              Height = 13
              Caption = #1086#1090'/'#1076#1086
            end
            object Label4: TLabel
              Left = 138
              Top = 43
              Width = 83
              Height = 13
              Caption = #1088#1072#1079#1084#1077#1088'.'#1101#1083'/'#1095#1080#1089#1083#1086
            end
            object Label3: TLabel
              Left = 62
              Top = 43
              Width = 53
              Height = 13
              Caption = #1048#1084#1103'/'#1072#1076#1088#1077#1089
            end
            object EditStructSB1: TSpeedButton
              Left = 189
              Top = 62
              Width = 20
              Height = 20
              Caption = '...'
            end
            object EditStructSB2: TSpeedButton
              Left = 189
              Top = 114
              Width = 20
              Height = 20
              Caption = '...'
            end
            object EditStructSB3: TSpeedButton
              Left = 189
              Top = 168
              Width = 20
              Height = 20
              Caption = '...'
            end
            object SpeedButton1: TSpeedButton
              Left = 421
              Top = 82
              Width = 20
              Height = 20
              Caption = 'B'
              OnClick = WriteSBClick
            end
            object SpeedButton2: TSpeedButton
              Tag = 1
              Left = 441
              Top = 82
              Width = 20
              Height = 20
              Caption = 'W'
              OnClick = WriteSBClick
            end
            object SpeedButton3: TSpeedButton
              Tag = 2
              Left = 461
              Top = 82
              Width = 24
              Height = 20
              Caption = 'DW'
              OnClick = WriteSBClick
            end
            object Label6: TLabel
              Left = 476
              Top = 43
              Width = 35
              Height = 13
              Caption = #1047#1072#1087#1080#1089#1100
            end
            object SpeedButton4: TSpeedButton
              Tag = 6
              Left = 537
              Top = 83
              Width = 24
              Height = 20
              Caption = 'DW'
              OnClick = WriteSBClick
            end
            object SpeedButton5: TSpeedButton
              Tag = 5
              Left = 517
              Top = 83
              Width = 20
              Height = 20
              Caption = 'W'
              OnClick = WriteSBClick
            end
            object SpeedButton6: TSpeedButton
              Tag = 4
              Left = 497
              Top = 83
              Width = 20
              Height = 20
              Caption = 'B'
              OnClick = WriteSBClick
            end
            object SpeedButton7: TSpeedButton
              Tag = 22
              Left = 537
              Top = 134
              Width = 24
              Height = 20
              Caption = 'DW'
              OnClick = WriteSBClick
            end
            object SpeedButton8: TSpeedButton
              Tag = 21
              Left = 517
              Top = 135
              Width = 20
              Height = 20
              Caption = 'W'
              OnClick = WriteSBClick
            end
            object SpeedButton9: TSpeedButton
              Tag = 20
              Left = 497
              Top = 134
              Width = 20
              Height = 20
              Caption = 'B'
              OnClick = WriteSBClick
            end
            object SpeedButton10: TSpeedButton
              Tag = 18
              Left = 461
              Top = 134
              Width = 24
              Height = 20
              Caption = 'DW'
              OnClick = WriteSBClick
            end
            object SpeedButton11: TSpeedButton
              Tag = 17
              Left = 441
              Top = 134
              Width = 20
              Height = 20
              Caption = 'W'
              OnClick = WriteSBClick
            end
            object SpeedButton12: TSpeedButton
              Tag = 16
              Left = 421
              Top = 134
              Width = 20
              Height = 20
              Caption = 'B'
              OnClick = WriteSBClick
            end
            object SpeedButton13: TSpeedButton
              Tag = 38
              Left = 537
              Top = 189
              Width = 24
              Height = 20
              Caption = 'DW'
              OnClick = WriteSBClick
            end
            object SpeedButton14: TSpeedButton
              Tag = 37
              Left = 517
              Top = 189
              Width = 20
              Height = 20
              Caption = 'W'
              OnClick = WriteSBClick
            end
            object SpeedButton15: TSpeedButton
              Tag = 36
              Left = 497
              Top = 189
              Width = 20
              Height = 20
              Caption = 'B'
              OnClick = WriteSBClick
            end
            object SpeedButton16: TSpeedButton
              Tag = 34
              Left = 461
              Top = 188
              Width = 24
              Height = 20
              Caption = 'DW'
              OnClick = WriteSBClick
            end
            object SpeedButton17: TSpeedButton
              Tag = 33
              Left = 441
              Top = 188
              Width = 20
              Height = 20
              Caption = 'W'
              OnClick = WriteSBClick
            end
            object SpeedButton18: TSpeedButton
              Tag = 32
              Left = 421
              Top = 188
              Width = 20
              Height = 20
              Caption = 'B'
              OnClick = WriteSBClick
            end
            object SpeedButton19: TSpeedButton
              Left = 556
              Top = 36
              Width = 23
              Height = 22
              OnClick = SpeedButton19Click
            end
            object SpeedButton20: TSpeedButton
              Left = 582
              Top = 36
              Width = 23
              Height = 22
              OnClick = SpeedButton20Click
            end
            object NameEdit1: TEdit
              Left = 47
              Top = 62
              Width = 98
              Height = 21
              TabOrder = 0
            end
            object RadioButton3: TRadioButton
              Left = 17
              Top = 180
              Width = 28
              Height = 17
              Caption = '3'
              TabOrder = 1
            end
            object RadioButton2: TRadioButton
              Left = 17
              Top = 128
              Width = 28
              Height = 17
              Caption = '2'
              TabOrder = 2
            end
            object RadioButton1: TRadioButton
              Left = 17
              Top = 75
              Width = 28
              Height = 17
              Caption = '1'
              Checked = True
              TabOrder = 3
              TabStop = True
            end
            object ToEdit1: TEdit
              Left = 215
              Top = 82
              Width = 53
              Height = 21
              TabOrder = 4
            end
            object FromEdit1: TEdit
              Left = 215
              Top = 62
              Width = 53
              Height = 21
              TabOrder = 5
            end
            object CountEdit1: TEdit
              Left = 151
              Top = 82
              Width = 58
              Height = 21
              TabOrder = 6
            end
            object SizeEdit1: TEdit
              Left = 151
              Top = 62
              Width = 38
              Height = 21
              TabOrder = 7
            end
            object AddrEdit1: TEdit
              Left = 47
              Top = 82
              Width = 98
              Height = 21
              TabOrder = 8
            end
            object Button4: TButton
              Left = 330
              Top = 8
              Width = 75
              Height = 25
              Caption = '103'
              TabOrder = 9
              OnClick = Button4Click
            end
            object Button2: TButton
              Left = 249
              Top = 8
              Width = 75
              Height = 25
              Caption = '102'
              TabOrder = 10
              OnClick = Button2Click
            end
            object Button5: TButton
              Left = 113
              Top = 8
              Width = 85
              Height = 25
              Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
              TabOrder = 11
              OnClick = MemoCopyButtonClick
            end
            object Button6: TButton
              Left = 22
              Top = 8
              Width = 85
              Height = 25
              Caption = #1054#1095#1080#1089#1090#1080#1090#1100
              TabOrder = 12
              OnClick = MemoClearButtonClick
            end
            object ReadDumpButton1: TButton
              Left = 280
              Top = 63
              Width = 117
              Height = 20
              Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1076#1072#1084#1087
              TabOrder = 13
              OnClick = ReadDumpButtonClick
            end
            object ReadStructButton1: TButton
              Left = 280
              Top = 82
              Width = 117
              Height = 20
              Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1089#1090#1088#1091#1082#1082#1090'.'
              TabOrder = 14
            end
            object NameEdit2: TEdit
              Left = 47
              Top = 114
              Width = 98
              Height = 21
              TabOrder = 15
            end
            object AddrEdit2: TEdit
              Left = 47
              Top = 134
              Width = 98
              Height = 21
              TabOrder = 16
            end
            object SizeEdit2: TEdit
              Left = 151
              Top = 114
              Width = 38
              Height = 21
              TabOrder = 17
            end
            object CountEdit2: TEdit
              Left = 151
              Top = 134
              Width = 58
              Height = 21
              TabOrder = 18
            end
            object FromEdit2: TEdit
              Left = 215
              Top = 114
              Width = 53
              Height = 21
              TabOrder = 19
            end
            object ToEdit2: TEdit
              Left = 215
              Top = 134
              Width = 53
              Height = 21
              TabOrder = 20
            end
            object ReadDumpButton2: TButton
              Tag = 1
              Left = 280
              Top = 115
              Width = 117
              Height = 20
              Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1076#1072#1084#1087
              TabOrder = 21
              OnClick = ReadDumpButtonClick
            end
            object ReadStructButton2: TButton
              Tag = 1
              Left = 280
              Top = 134
              Width = 117
              Height = 20
              Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1089#1090#1088#1091#1082#1082#1090'.'
              TabOrder = 22
            end
            object NameEdit3: TEdit
              Left = 47
              Top = 168
              Width = 98
              Height = 21
              TabOrder = 23
            end
            object AddrEdit3: TEdit
              Left = 47
              Top = 188
              Width = 98
              Height = 21
              TabOrder = 24
            end
            object SizeEdit3: TEdit
              Left = 151
              Top = 168
              Width = 38
              Height = 21
              TabOrder = 25
            end
            object CountEdit3: TEdit
              Left = 151
              Top = 188
              Width = 58
              Height = 21
              TabOrder = 26
            end
            object FromEdit3: TEdit
              Left = 215
              Top = 168
              Width = 53
              Height = 21
              TabOrder = 27
            end
            object ToEdit3: TEdit
              Left = 215
              Top = 188
              Width = 53
              Height = 21
              TabOrder = 28
            end
            object ReadDumpButton3: TButton
              Tag = 2
              Left = 280
              Top = 169
              Width = 117
              Height = 20
              Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1076#1072#1084#1087
              TabOrder = 29
              OnClick = ReadDumpButtonClick
            end
            object ReadStructButton3: TButton
              Tag = 2
              Left = 280
              Top = 188
              Width = 117
              Height = 20
              Caption = #1095#1080#1090#1072#1090#1100' '#1082#1072#1082' '#1089#1090#1088#1091#1082#1082#1090'.'
              TabOrder = 30
            end
            object Button7: TButton
              Left = 420
              Top = 5
              Width = 75
              Height = 25
              Caption = 'Button7'
              TabOrder = 31
              OnClick = Button7Click
            end
            object WriteAEdit1: TEdit
              Left = 422
              Top = 62
              Width = 62
              Height = 21
              TabOrder = 32
            end
            object WriteBEdit1: TEdit
              Left = 498
              Top = 62
              Width = 62
              Height = 21
              TabOrder = 33
            end
            object WriteBEdit2: TEdit
              Left = 498
              Top = 114
              Width = 62
              Height = 21
              TabOrder = 34
            end
            object WriteAEdit2: TEdit
              Left = 422
              Top = 114
              Width = 62
              Height = 21
              TabOrder = 35
            end
            object WriteBEdit3: TEdit
              Left = 498
              Top = 168
              Width = 62
              Height = 21
              TabOrder = 36
            end
            object WriteAEdit3: TEdit
              Left = 422
              Top = 168
              Width = 62
              Height = 21
              TabOrder = 37
            end
            object Button11: TButton
              Left = 501
              Top = 5
              Width = 75
              Height = 25
              Caption = 'Button11'
              TabOrder = 38
              OnClick = Button11Click
            end
            object Edit2: TEdit
              Left = 582
              Top = 7
              Width = 41
              Height = 21
              TabOrder = 39
              Text = '0'
            end
          end
        end
      end
    end
  end
  object g420OpenDialog: TOpenDialog
    FilterIndex = 0
    Left = 388
    Top = 372
  end
  object ImageList1: TImageList
    Left = 460
    Top = 368
    Bitmap = {
      494C010102000800E80010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00BFBFBF000000000000000000BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00BFBFBF000000000000000000BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F000000FF00000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFF800300000000
      F9FF000100000000F0FF000100000000F0FF000100000000E07F000100000000
      C07F000100000000843F0001000000001E3F000100000000FE1F000100000000
      FF1F000100000000FF8F000100000000FFC7000100000000FFE3000100000000
      FFF8000100000000FFFF80030000000000000000000000000000000000000000
      000000000000}
  end
  object SaveDialog: TSaveDialog
    Filter = #1060#1072#1081#1083#1099' '#1089#1087#1080#1089#1082#1072' '#1089#1080#1075#1085#1072#1083#1086#1074'(*.lst)|*.lst|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 528
    Top = 372
  end
end
