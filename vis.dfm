object VisForm: TVisForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1075#1077#1085#1077#1088#1072#1090#1086#1088#1072' '#1043'-420'
  ClientHeight = 605
  ClientWidth = 976
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
    Left = 584
    Top = 0
    Width = 392
    Height = 605
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 12
      Top = 75
      Width = 289
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 605
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Memo1: TMemo
      Left = 0
      Top = 73
      Width = 584
      Height = 532
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
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 584
      Height = 73
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
      object DeviceErrorChB: TCheckBox
        Left = 212
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Device Error'
        TabOrder = 2
      end
      object Edit1: TEdit
        Left = 12
        Top = 46
        Width = 182
        Height = 21
        TabOrder = 3
      end
      object Button9: TButton
        Left = 212
        Top = 44
        Width = 75
        Height = 25
        Caption = #1057#1090#1088#1086#1082#1072
        TabOrder = 4
        OnClick = Button9Click
      end
      object Button2: TButton
        Left = 368
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Button2'
        TabOrder = 5
        OnClick = Button2Click
      end
    end
  end
  object g420OpenDialog: TOpenDialog
    FilterIndex = 0
    Left = 240
    Top = 76
  end
  object ImageList1: TImageList
    Left = 336
    Top = 80
    Bitmap = {
      494C0101020008009C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
    Left = 424
    Top = 64
  end
end
