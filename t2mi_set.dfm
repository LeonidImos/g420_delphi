object T2miSetForm: TT2miSetForm
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' T2-MI'
  ClientHeight = 354
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 521
    Height = 316
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 593
    ExplicitHeight = 376
    object TabSheet1: TTabSheet
      Caption = #1056#1077#1078#1080#1084' T2-MI ('#1056#1077#1078#1080#1084' DVB-T2)'
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 585
      ExplicitHeight = 348
      object Label1: TLabel
        Left = 60
        Top = 24
        Width = 66
        Height = 13
        Caption = 'T2_VERSION:'
      end
      object Label2: TLabel
        Left = 78
        Top = 52
        Width = 46
        Height = 13
        Caption = 'FFT_size:'
      end
      object Label3: TLabel
        Left = 74
        Top = 78
        Width = 50
        Height = 13
        Caption = 'BWT_EXT:'
      end
      object Label4: TLabel
        Left = 33
        Top = 108
        Width = 93
        Height = 13
        Caption = 'GUARD_INTERVAL:'
      end
      object Label5: TLabel
        Left = 80
        Top = 164
        Width = 44
        Height = 13
        Caption = 'L1_MOD:'
      end
      object Label6: TLabel
        Left = 42
        Top = 192
        Width = 84
        Height = 13
        Caption = 'PILOT_PATTERN:'
      end
      object Label7: TLabel
        Left = 36
        Top = 220
        Width = 90
        Height = 13
        Caption = 'NUM_T2_FRAMES:'
      end
      object Label8: TLabel
        Left = 16
        Top = 249
        Width = 110
        Height = 13
        Caption = 'NUM_DATA_SYMBOLS:'
      end
      object Label9: TLabel
        Left = 59
        Top = 136
        Width = 65
        Height = 13
        Caption = 'BANDWIDTH:'
      end
      object T2Ver_CbB: TComboBox
        Left = 140
        Top = 21
        Width = 97
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 0
        Text = '1.1.1'
        Items.Strings = (
          '1.1.1'
          '1.2.1'
          '1.3.1')
      end
      object T2Ver_Res_Edit: TEdit
        Left = 264
        Top = 21
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object FFT_Res_Edit: TEdit
        Left = 264
        Top = 49
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object FFT_CbB: TComboBox
        Left = 140
        Top = 49
        Width = 97
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 3
        Text = '1 K'
        Items.Strings = (
          '1 K'
          '2 K'
          '4 K'
          '8 K'
          '16 K'
          '32 K')
      end
      object Guard_Res_Edit: TEdit
        Left = 264
        Top = 105
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object Guard_CbB: TComboBox
        Left = 140
        Top = 105
        Width = 97
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 5
        Text = '1/32'
        Items.Strings = (
          '1/32'
          '1/16'
          '1/8'
          '1/4'
          '1/128'
          '19/128'
          '19/256')
      end
      object L1_mod_Res_Edit: TEdit
        Left = 264
        Top = 161
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object L1_mod_CbB: TComboBox
        Left = 140
        Top = 161
        Width = 97
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 7
        Text = 'BPSK'
        Items.Strings = (
          'BPSK'
          'QPSK'
          '16-QAM'
          '64-QAM')
      end
      object PP_Res_Edit: TEdit
        Left = 264
        Top = 189
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 8
      end
      object PP_CbB: TComboBox
        Left = 140
        Top = 189
        Width = 97
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 9
        Text = 'PP1'
        Items.Strings = (
          'PP1'
          'PP2'
          'PP3'
          'PP4'
          'PP5'
          'PP6'
          'PP7'
          'PP8')
      end
      object Bwt_ChB: TCheckBox
        Left = 140
        Top = 77
        Width = 97
        Height = 17
        TabOrder = 10
      end
      object Bwt_Res_ChB: TCheckBox
        Left = 264
        Top = 76
        Width = 97
        Height = 17
        Enabled = False
        TabOrder = 11
      end
      object NumFrames_Res_Edit: TEdit
        Left = 264
        Top = 216
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 12
      end
      object NumSymbols_Res_Edit: TEdit
        Left = 264
        Top = 245
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 13
      end
      object NumFrames_Edit: TEdit
        Left = 140
        Top = 217
        Width = 97
        Height = 21
        TabOrder = 14
      end
      object NumSymbols_Edit: TEdit
        Left = 140
        Top = 246
        Width = 97
        Height = 21
        TabOrder = 15
      end
      object Band_Res_Edit: TEdit
        Left = 264
        Top = 133
        Width = 97
        Height = 21
        Enabled = False
        TabOrder = 16
      end
      object Band_CbB: TComboBox
        Left = 140
        Top = 133
        Width = 97
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 17
        Text = '1.7 '#1052#1043#1094
        Items.Strings = (
          '1.7 '#1052#1043#1094
          '5 '#1052#1043#1094
          '6 '#1052#1043#1094
          '7 '#1052#1043#1094
          '8 '#1052#1043#1094
          '10 '#1052#1043#1094)
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' PLP'
      ImageIndex = 1
      ExplicitWidth = 585
      ExplicitHeight = 328
      object Label10: TLabel
        Left = 50
        Top = 71
        Width = 76
        Height = 13
        Caption = 'PLP_FEC_TYPE:'
      end
      object Label11: TLabel
        Left = 88
        Top = 20
        Width = 38
        Height = 13
        Caption = 'PLP_ID:'
      end
      object Label12: TLabel
        Left = 46
        Top = 45
        Width = 80
        Height = 13
        Caption = 'PLP_ROTATION:'
      end
      object Label13: TLabel
        Left = 77
        Top = 99
        Width = 49
        Height = 13
        Caption = 'PLP_COD:'
      end
      object Label14: TLabel
        Left = 76
        Top = 127
        Width = 50
        Height = 13
        Caption = 'PLP_MOD:'
      end
      object Label15: TLabel
        Left = 39
        Top = 154
        Width = 87
        Height = 13
        Caption = 'TIME_IL_LENGTH:'
      end
      object Label16: TLabel
        Left = 70
        Top = 182
        Width = 56
        Height = 13
        Caption = 'PLP_MODE:'
      end
      object Label17: TLabel
        Left = 33
        Top = 209
        Width = 93
        Height = 13
        Caption = 'PLP_NUM_BLOCKS:'
      end
      object plp_fec_Res_Edit: TEdit
        Left = 324
        Top = 68
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object plp_fec_CbB: TComboBox
        Left = 140
        Top = 68
        Width = 157
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = '16K LDPC'
        Items.Strings = (
          '16K LDPC'
          '64K LDPC')
      end
      object plp_id_Res_Edit: TEdit
        Left = 324
        Top = 17
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object plp_id_Edit: TEdit
        Left = 140
        Top = 18
        Width = 157
        Height = 21
        TabOrder = 3
        Text = '0'
      end
      object plp_rot_Res_ChB: TCheckBox
        Left = 324
        Top = 44
        Width = 157
        Height = 17
        Enabled = False
        TabOrder = 4
      end
      object plp_rot_ChB: TCheckBox
        Left = 140
        Top = 45
        Width = 97
        Height = 17
        TabOrder = 5
      end
      object plp_cod_CbB: TComboBox
        Left = 140
        Top = 96
        Width = 157
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 6
        Text = '1/2'
        Items.Strings = (
          '1/2'
          '3/5'
          '2/3'
          '3/4'
          '4/5'
          '5/6')
      end
      object plp_cod_Res_Edit: TEdit
        Left = 324
        Top = 96
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object plp_mod_CbB: TComboBox
        Left = 140
        Top = 124
        Width = 157
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 8
        Text = 'QPSK'
        Items.Strings = (
          'QPSK'
          '16-QAM'
          '64-QAM'
          '256-QAM')
      end
      object plp_mod_Res_Edit: TEdit
        Left = 324
        Top = 124
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object il_leng_Res_Edit: TEdit
        Left = 324
        Top = 151
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 10
      end
      object il_leng_Edit: TEdit
        Left = 140
        Top = 152
        Width = 157
        Height = 21
        TabOrder = 11
        Text = '0'
      end
      object plp_mode_Res_Edit: TEdit
        Left = 324
        Top = 179
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 12
      end
      object plp_mode_CbB: TComboBox
        Left = 140
        Top = 179
        Width = 157
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 13
        Text = 'NM (Normal Mode)'
        Items.Strings = (
          'NM (Normal Mode)'
          'HEM (High Efficiency Mode)')
      end
      object plp_num_block_Edit: TEdit
        Left = 140
        Top = 207
        Width = 157
        Height = 21
        TabOrder = 14
        Text = '0'
      end
      object plp_num_block_Res_Edit: TEdit
        Left = 324
        Top = 206
        Width = 157
        Height = 21
        Enabled = False
        TabOrder = 15
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1088#1086#1095#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 2
      ExplicitWidth = 585
      ExplicitHeight = 348
      object Label18: TLabel
        Left = 55
        Top = 19
        Width = 71
        Height = 13
        Caption = 'T2_timestamp:'
      end
      object Label19: TLabel
        Left = 62
        Top = 46
        Width = 64
        Height = 13
        Caption = 'FREQUENCY:'
      end
      object Label20: TLabel
        Left = 82
        Top = 73
        Width = 44
        Height = 13
        Caption = 'CELL_ID:'
      end
      object Label21: TLabel
        Left = 55
        Top = 100
        Width = 71
        Height = 13
        Caption = 'NETWORK_ID:'
      end
      object Label22: TLabel
        Left = 49
        Top = 127
        Width = 77
        Height = 13
        Caption = 'T2_SYSTEM_ID:'
      end
      object Label23: TLabel
        Left = 74
        Top = 154
        Width = 52
        Height = 13
        Caption = 'T2-MI PID:'
      end
      object Label24: TLabel
        Left = 88
        Top = 181
        Width = 44
        Height = 13
        Caption = 'PMT PID:'
      end
      object Label25: TLabel
        Left = 50
        Top = 209
        Width = 77
        Height = 13
        Caption = 't2mi_stream_id:'
      end
      object timestamp_CbB: TComboBox
        Left = 140
        Top = 16
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 1
        TabOrder = 0
        Text = 'Relative ('#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077')'
        Items.Strings = (
          #1042#1099#1082#1083#1102#1095#1077#1085#1099
          'Relative ('#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1077')')
      end
      object timestamp_Res_Edit: TEdit
        Left = 316
        Top = 16
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Freq_Edit: TEdit
        Left = 140
        Top = 44
        Width = 153
        Height = 21
        TabOrder = 2
        Text = '0'
      end
      object Freq_Res_Edit: TEdit
        Left = 316
        Top = 43
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object cell_id_Edit: TEdit
        Left = 140
        Top = 71
        Width = 153
        Height = 21
        TabOrder = 4
        Text = '0'
      end
      object cell_id_Res_Edit: TEdit
        Left = 316
        Top = 70
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object nw_id_Edit: TEdit
        Left = 140
        Top = 98
        Width = 153
        Height = 21
        TabOrder = 6
        Text = '0'
      end
      object nw_id_Res_Edit: TEdit
        Left = 316
        Top = 97
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object t2sys_id_Edit: TEdit
        Left = 140
        Top = 125
        Width = 153
        Height = 21
        TabOrder = 8
        Text = '0'
      end
      object t2sys_id_Res_Edit: TEdit
        Left = 316
        Top = 124
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object t2mi_pid_Edit: TEdit
        Left = 140
        Top = 152
        Width = 153
        Height = 21
        TabOrder = 10
        Text = '0'
      end
      object t2mi_pid_Res_Edit: TEdit
        Left = 316
        Top = 151
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object pmti_pid_Edit: TEdit
        Left = 140
        Top = 179
        Width = 153
        Height = 21
        TabOrder = 12
        Text = '0'
      end
      object pmti_pid_Res_Edit: TEdit
        Left = 316
        Top = 178
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 13
      end
      object stream_id_CbB: TComboBox
        Left = 140
        Top = 206
        Width = 153
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 14
        Text = '0'
        Items.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7')
      end
      object stream_id_Res_Edit: TEdit
        Left = 316
        Top = 206
        Width = 153
        Height = 21
        Enabled = False
        TabOrder = 15
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 521
    Height = 38
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 376
    ExplicitWidth = 593
    object Panel2: TPanel
      Left = 196
      Top = 1
      Width = 324
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 268
      ExplicitHeight = 56
      object Button1: TButton
        Left = 236
        Top = 5
        Width = 75
        Height = 21
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 0
      end
      object Button2: TButton
        Left = 144
        Top = 5
        Width = 75
        Height = 21
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        TabOrder = 1
      end
      object Button3: TButton
        Left = 52
        Top = 5
        Width = 75
        Height = 21
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100
        TabOrder = 2
      end
    end
  end
end
