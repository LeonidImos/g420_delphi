unit t2mi_set;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TT2MI_params = packed record
    on_off: ByteBool;
    t2_version: byte;
    bwt_ext: ByteBool;
    fft_size: byte;

    guard: byte;
    modul: byte;
    pp: byte;
    num_t2_frames: byte;

    num_data_symbols: word;
    plp_id: byte;
    plp_rotation: ByteBool;

    plp_fec_type: byte;
    plp_cod: byte;
    plp_mod: byte;
    plp_time_il_type: byte;

    plp_time_il_leng: byte;
    nm_mode: ByteBool;
    plp_num_blocks: word;

    timestamp_type: byte;
    bandwidth: byte;
    reserv1: word;

    frequency: dword;

    cell_id: word;
    network_id: word;

    t2_system_id: word;
    t2mi_pid: word;

    t2mi_pmt_pid: word;
    t2mi_stream_id: byte;
    reserv2: byte;

    bufs: dword;
    reserv3: array[0..4]of dword;

    t2mi_err_enabled: ByteBool;
    packet_type_freq: byte;
    packet_payl_freq: byte;
    payload_freq: byte;

    crc_err_freq: byte;
    packet_count_freq: byte;
    plp_num_bl_freq: byte;
    tr_order_freq: byte;

    timestamp_err_freq: byte;
    timestamp_disc_freq: byte;
    reserv4: word;

    reserv5: array[0..4]of dword;

    design_delay: dword;
    bitrate_in: dword;

  end;
//typedef struct
{		// TParamT2mi;

// выходные данные
	dword	design_delay;
	dword	bitrate_in;	// требуемый битрейт входного для модуля T2-MI транспортного потока, не задается, а вычисляется по другим параметрам
}// TParamT2mi;

  TT2miSetForm = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button3: TButton;
    Label1: TLabel;
    T2Ver_CbB: TComboBox;
    T2Ver_Res_Edit: TEdit;
    Label2: TLabel;
    FFT_Res_Edit: TEdit;
    FFT_CbB: TComboBox;
    Label3: TLabel;
    Guard_Res_Edit: TEdit;
    Guard_CbB: TComboBox;
    Label4: TLabel;
    L1_mod_Res_Edit: TEdit;
    L1_mod_CbB: TComboBox;
    Label5: TLabel;
    PP_Res_Edit: TEdit;
    PP_CbB: TComboBox;
    Label6: TLabel;
    Bwt_ChB: TCheckBox;
    Bwt_Res_ChB: TCheckBox;
    Label7: TLabel;
    NumFrames_Res_Edit: TEdit;
    Label8: TLabel;
    NumSymbols_Res_Edit: TEdit;
    TabSheet3: TTabSheet;
    NumFrames_Edit: TEdit;
    NumSymbols_Edit: TEdit;
    Band_Res_Edit: TEdit;
    Band_CbB: TComboBox;
    Label9: TLabel;
    plp_fec_Res_Edit: TEdit;
    plp_fec_CbB: TComboBox;
    Label10: TLabel;
    plp_id_Res_Edit: TEdit;
    plp_id_Edit: TEdit;
    Label11: TLabel;
    plp_rot_Res_ChB: TCheckBox;
    plp_rot_ChB: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    plp_cod_CbB: TComboBox;
    plp_cod_Res_Edit: TEdit;
    Label14: TLabel;
    plp_mod_CbB: TComboBox;
    plp_mod_Res_Edit: TEdit;
    il_leng_Res_Edit: TEdit;
    il_leng_Edit: TEdit;
    Label15: TLabel;
    plp_mode_Res_Edit: TEdit;
    plp_mode_CbB: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    plp_num_block_Edit: TEdit;
    plp_num_block_Res_Edit: TEdit;
    Label18: TLabel;
    timestamp_CbB: TComboBox;
    timestamp_Res_Edit: TEdit;
    Label19: TLabel;
    Freq_Edit: TEdit;
    Freq_Res_Edit: TEdit;
    Label20: TLabel;
    cell_id_Edit: TEdit;
    cell_id_Res_Edit: TEdit;
    Label21: TLabel;
    nw_id_Edit: TEdit;
    nw_id_Res_Edit: TEdit;
    Label22: TLabel;
    t2sys_id_Edit: TEdit;
    t2sys_id_Res_Edit: TEdit;
    Label23: TLabel;
    t2mi_pid_Edit: TEdit;
    t2mi_pid_Res_Edit: TEdit;
    Label24: TLabel;
    pmti_pid_Edit: TEdit;
    pmti_pid_Res_Edit: TEdit;
    Label25: TLabel;
    stream_id_CbB: TComboBox;
    stream_id_Res_Edit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
     T2MI_params: TT2MI_params;
     procedure Param_to_Interface;
     procedure ShowParams;
  end;

var
  T2miSetForm: TT2miSetForm;

implementation

{$R *.dfm}
//******************************************************************************
procedure TT2miSetForm.Param_to_Interface;
begin
  if T2MI_params.t2_version>2 then T2MI_params.t2_version:=2;
  T2Ver_CbB.ItemIndex:=T2MI_params.t2_version;

  if T2MI_params.fft_size>5 then T2MI_params.fft_size:=5;
  FFT_CbB.ItemIndex:=T2MI_params.fft_size;

  Bwt_ChB.Checked:=T2MI_params.bwt_ext;

  if T2MI_params.guard>6 then T2MI_params.guard:=6;
  Guard_CbB.ItemIndex:=T2MI_params.guard;

  if T2MI_params.bandwidth>5 then T2MI_params.bandwidth:=5;
  Band_CbB.ItemIndex:=T2MI_params.bandwidth;

  if T2MI_params.modul>3 then T2MI_params.modul:=3;
  L1_mod_CbB.ItemIndex:=T2MI_params.modul;

  if T2MI_params.pp>7 then T2MI_params.pp:=7;
  PP_CbB.ItemIndex:=T2MI_params.pp;

  NumFrames_Edit.Text:=IntToStr(T2MI_params.num_t2_frames);
  NumSymbols_Edit.Text:=IntToStr(T2MI_params.num_data_symbols);
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^
  plp_id_Edit.Text:=IntToStr(T2MI_params.plp_id);

  plp_rot_ChB.Checked:=T2MI_params.plp_rotation;

  if T2MI_params.plp_fec_type>1 then T2MI_params.plp_fec_type:=1;
  plp_fec_CbB.ItemIndex:=T2MI_params.plp_fec_type;

  if T2MI_params.plp_cod>5 then T2MI_params.plp_cod:=5;
  plp_cod_CbB.ItemIndex:=T2MI_params.plp_cod;

  if T2MI_params.plp_mod>3 then T2MI_params.plp_mod:=3;
  plp_mod_CbB.ItemIndex:=T2MI_params.plp_mod;

  il_leng_Edit.Text:=IntToStr(T2MI_params.plp_time_il_leng);

  if T2MI_params.nm_mode then plp_mode_CbB.ItemIndex:=0
  else plp_mode_CbB.ItemIndex:=1;

  plp_num_block_Edit.Text:=IntToStr(T2MI_params.plp_num_blocks);

  //^^^^^^^^^^^^^^^^^^^^^^^^^^
  if T2MI_params.timestamp_type>1 then T2MI_params.timestamp_type:=1;
  timestamp_CbB.ItemIndex:=T2MI_params.timestamp_type;

  Freq_Edit.Text:=IntToStr(T2MI_params.frequency);

  cell_id_Edit.Text:=IntToStr(T2MI_params.cell_id);

  nw_id_Edit.Text:=IntToStr(T2MI_params.network_id);

  t2sys_id_Edit.Text:=IntToStr(T2MI_params.t2_system_id);

  t2mi_pid_Edit.Text:=IntToStr(T2MI_params.t2mi_pid);

  pmti_pid_Edit.Text:=IntToStr(T2MI_params.t2mi_pmt_pid);

  if T2MI_params.t2mi_stream_id>7 then T2MI_params.t2mi_stream_id:=7;
  stream_id_CbB.ItemIndex:=T2MI_params.t2mi_stream_id;

end;
//------------------------------------------------------------------------------
procedure TT2miSetForm.ShowParams;
begin
  if T2MI_params.t2_version>2 then T2MI_params.t2_version:=2;
  T2Ver_Res_Edit.Text:=T2Ver_CbB.Items[T2MI_params.t2_version];

  if T2MI_params.fft_size>5 then T2MI_params.fft_size:=5;
  FFT_Res_Edit.Text:=FFT_CbB.Items[T2MI_params.fft_size];

  Bwt_Res_ChB.Checked:=T2MI_params.bwt_ext;

  if T2MI_params.guard>6 then T2MI_params.guard:=6;
  Guard_Res_Edit.Text:=Guard_CbB.Items[T2MI_params.guard];

  if T2MI_params.bandwidth>5 then T2MI_params.bandwidth:=5;
  Band_Res_Edit.Text:=Band_CbB.Items[T2MI_params.bandwidth];

  if T2MI_params.modul>3 then T2MI_params.modul:=3;
  L1_mod_Res_Edit.Text:=L1_mod_CbB.Items[T2MI_params.modul];

  if T2MI_params.pp>7 then T2MI_params.pp:=7;
  PP_Res_Edit.Text:=PP_CbB.Items[T2MI_params.pp];

  NumFrames_Res_Edit.Text:=IntToStr(T2MI_params.num_t2_frames);
  NumSymbols_Res_Edit.Text:=IntToStr(T2MI_params.num_data_symbols);
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^
  plp_id_Res_Edit.Text:=IntToStr(T2MI_params.plp_id);

  plp_rot_Res_ChB.Checked:=T2MI_params.plp_rotation;

  if T2MI_params.plp_fec_type>1 then T2MI_params.plp_fec_type:=1;
  plp_fec_Res_Edit.Text:=plp_fec_CbB.Items[T2MI_params.plp_fec_type];

  if T2MI_params.plp_cod>5 then T2MI_params.plp_cod:=5;
  plp_cod_Res_Edit.Text:=plp_cod_CbB.Items[T2MI_params.plp_cod];

  if T2MI_params.plp_mod>3 then T2MI_params.plp_mod:=3;
  plp_mod_Res_Edit.Text:=plp_mod_CbB.Items[T2MI_params.plp_mod];

  il_leng_Res_Edit.Text:=IntToStr(T2MI_params.plp_time_il_leng);

  if T2MI_params.nm_mode then plp_mode_Res_Edit.Text:=plp_mode_CbB.Items[0]
  else plp_mode_Res_Edit.Text:=plp_mode_CbB.Items[1];

  plp_num_block_Res_Edit.Text:=IntToStr(T2MI_params.plp_num_blocks);

  //^^^^^^^^^^^^^^^^^^^^^^^^^^
  if T2MI_params.timestamp_type>1 then T2MI_params.timestamp_type:=1;
  timestamp_Res_Edit.Text:=timestamp_CbB.Items[T2MI_params.timestamp_type];

  Freq_Res_Edit.Text:=IntToStr(T2MI_params.frequency);

  cell_id_Res_Edit.Text:=IntToStr(T2MI_params.cell_id);

  nw_id_Res_Edit.Text:=IntToStr(T2MI_params.network_id);

  t2sys_id_Res_Edit.Text:=IntToStr(T2MI_params.t2_system_id);

  t2mi_pid_Res_Edit.Text:=IntToStr(T2MI_params.t2mi_pid);

  pmti_pid_Res_Edit.Text:=IntToStr(T2MI_params.t2mi_pmt_pid);

  if T2MI_params.t2mi_stream_id>7 then T2MI_params.t2mi_stream_id:=7;
  stream_id_Res_Edit.Text:=stream_id_CbB.Items[T2MI_params.t2mi_stream_id];
end;
//------------------------------------------------------------------------------
end.
