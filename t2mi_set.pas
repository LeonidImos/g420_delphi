unit t2mi_set;

interface

uses
  const_type, leds,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  PT2MI_params = ^TT2MI_params;
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
    SetPageControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    ApplyButton: TButton;
    UpDateButton: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    OnButton: TButton;
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
    Test1Button: TButton;
    Test2Button: TButton;
    DataImage: TImage;
    Label26: TLabel;
    procedure UpDateButtonClick(Sender: TObject);
    procedure Test1ButtonClick(Sender: TObject);
    procedure Test2ButtonClick(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnButtonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    T2MI_params: TT2MI_params;
    t2miLED: TLED;
    procedure Param_to_Interface;
    procedure ShowParams;
    function EditToInt(edit: TEdit; min, max: integer; var res: integer): bool;
    procedure Interface_to_Param;
  public
    { Public declarations }
    show_ok: boolean; //
    procedure ReceiveParam(p_param: PT2MI_params);
  end;

var
  T2miSetForm: TT2miSetForm;

implementation
uses main_control;
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
procedure TT2miSetForm.Test1ButtonClick(Sender: TObject);
begin
  T2MI_params.t2_version:=1;
  T2MI_params.bwt_ext:=true;
  T2MI_params.fft_size:=1;
  T2MI_params.guard:=2;
  T2MI_params.modul:=1;
  T2MI_params.pp:=3;
  T2MI_params.num_t2_frames:=3;
  T2MI_params.num_data_symbols:=6;
  T2MI_params.plp_id:=1;
  T2MI_params.plp_rotation:=false;
  T2MI_params.plp_fec_type:=0;
  T2MI_params.plp_cod:=1;
  T2MI_params.plp_mod:=1;
  T2MI_params.plp_time_il_type:=0;
  T2MI_params.plp_time_il_leng:=1;
  T2MI_params.nm_mode:=false;
  T2MI_params.plp_num_blocks:=22;
  T2MI_params.timestamp_type:=0;
  T2MI_params.bandwidth:=2;
  T2MI_params.reserv1:=0;
  T2MI_params.frequency:=111000000;
  T2MI_params.cell_id:=5;
  T2MI_params.network_id:=1234;
  T2MI_params.t2_system_id:=3333;
  T2MI_params.t2mi_pid:=4096;
  T2MI_params.t2mi_pmt_pid:=32;
  T2MI_params.t2mi_stream_id:=1;
  T2MI_params.reserv2:=0;
  T2MI_params.bufs:=0;
  Param_to_Interface;
end;
//------------------------------------------------------------------------------

procedure TT2miSetForm.Test2ButtonClick(Sender: TObject);
begin
  T2MI_params.t2_version:=2;
  T2MI_params.bwt_ext:=false;
  T2MI_params.fft_size:=3;
  T2MI_params.guard:=4;
  T2MI_params.modul:=2;
  T2MI_params.pp:=6;
  T2MI_params.num_t2_frames:=11;
  T2MI_params.num_data_symbols:=23;
  T2MI_params.plp_id:=4;
  T2MI_params.plp_rotation:=true;
  T2MI_params.plp_fec_type:=1;
  T2MI_params.plp_cod:=3;
  T2MI_params.plp_mod:=2;
  T2MI_params.plp_time_il_type:=0;
  T2MI_params.plp_time_il_leng:=3;
  T2MI_params.nm_mode:=true;
  T2MI_params.plp_num_blocks:=33;
  T2MI_params.timestamp_type:=1;
  T2MI_params.bandwidth:=5;
  T2MI_params.reserv1:=0;
  T2MI_params.frequency:=222000000;
  T2MI_params.cell_id:=500;
  T2MI_params.network_id:=4321;
  T2MI_params.t2_system_id:=6666;
  T2MI_params.t2mi_pid:=5096;
  T2MI_params.t2mi_pmt_pid:=33;
  T2MI_params.t2mi_stream_id:=2;
  T2MI_params.reserv2:=0;
  T2MI_params.bufs:=0;
  Param_to_Interface;

end;

//------------------------------------------------------------------------------
procedure TT2miSetForm.UpDateButtonClick(Sender: TObject);
var param: word;
begin
  show_ok:=false;
  param:=0;
  SendCommandDSP(0, DSP_Comand_Set_T2MI_Param, 1, @param);
//  ShowParams;
end;
//------------------------------------------------------------------------------

procedure TT2miSetForm.ApplyButtonClick(Sender: TObject);
var //params: array[1..16] of word;
//ad, dat, i: dword;
pnt: pointer;
param: word;
begin
  Interface_to_Param;
  pnt:=@T2MI_params;
//  for i:=1 to 16 do params[i]:=i*256 + i;
  SendCommandDSP(0, DSP_Comand_Set_T2MI_Param_part1, 16, pnt);

//  for i:=1 to 16 do params[i]:=(i+16)*257;
  inc(dword(pnt),32);
  SendCommandDSP(0, DSP_Comand_Set_T2MI_Param_part2, 16, pnt);

//  for i:=1 to 16 do params[i]:=(i+32)*257;
  inc(dword(pnt),32);
  SendCommandDSP(0, DSP_Comand_Set_T2MI_Param_part3, 16, pnt);

  param:=4;
  SendCommandDSP(0, DSP_Comand_Set_T2MI_Param, 1, @param);

  param:=1;
  SendCommandDSP(0, DSP_Comand_Get_Signal_Parametrs, 1, @param);
end;
//------------------------------------------------------------------------------

function TT2miSetForm.EditToInt(edit: TEdit; min, max: integer; var res: integer): bool;
var err: integer;
begin
  result:=false;
  val(edit.Text, res, err);
  if err<>0 then
  begin
    edit.Hint:='Должно быть числовое значение';
    edit.Color:=$8080ff;
    exit;
  end;
  if(res<min)or(res>max) then
  begin
    edit.Hint:='Значение должно быть от '+IntToStr(min)+' до '+IntToStr(max);
    edit.Color:=$8080ff;
    exit;
  end;
  edit.Color:=clWindow;
  result:=true;
end;
//------------------------------------------------------------------------------
procedure TT2miSetForm.FormCreate(Sender: TObject);
begin
  show_ok:=false;
  t2miLED:=TLED.Create(DataImage,clLime,clGray);
end;

procedure TT2miSetForm.FormDestroy(Sender: TObject);
begin
  t2miLED.Destroy;
end;

//------------------------------------------------------------------------------

procedure TT2miSetForm.Interface_to_Param;
var //param_ok: boolean;
dat, i: integer;
page_err_ind: integer;
begin
//  param_ok:=true;
  page_err_ind:=-1;
  T2MI_params.t2_version:=T2Ver_CbB.ItemIndex;
  T2MI_params.fft_size:=FFT_CbB.ItemIndex;
  T2MI_params.bwt_ext:=Bwt_ChB.Checked;
  T2MI_params.guard:=Guard_CbB.ItemIndex;
  T2MI_params.bandwidth:=Band_CbB.ItemIndex;
  T2MI_params.modul:=L1_mod_CbB.ItemIndex;
  T2MI_params.pp:=PP_CbB.ItemIndex;

  if not EditToInt(NumFrames_Edit, 2, 255, dat) then if page_err_ind<0 then page_err_ind:=0;
  T2MI_params.num_t2_frames:=dat;

  if not EditToInt(NumSymbols_Edit, 3, 2098, dat) then if page_err_ind<0 then page_err_ind:=0;
  T2MI_params.num_data_symbols:=dat;

  //^^^^^^^^^^^^^^^^^^^^^^^^^^^

  if not EditToInt(plp_id_Edit, 0, 255, dat) then if page_err_ind<0 then page_err_ind:=1;
  T2MI_params.plp_id:=dat;

  T2MI_params.plp_rotation:=plp_rot_ChB.Checked;

  T2MI_params.plp_fec_type:=plp_fec_CbB.ItemIndex;
  T2MI_params.plp_cod:=plp_cod_CbB.ItemIndex;
  T2MI_params.plp_mod:=plp_mod_CbB.ItemIndex;

  if not EditToInt(il_leng_Edit, 0, 255, dat) then if page_err_ind<0 then page_err_ind:=1;
  T2MI_params.plp_time_il_leng:=dat;

  T2MI_params.nm_mode:=plp_mode_CbB.ItemIndex=0;

  if not EditToInt(plp_num_block_Edit, 1, 1023, dat) then if page_err_ind<0 then page_err_ind:=1;
  T2MI_params.plp_num_blocks:=dat;

  //^^^^^^^^^^^^^^^^^^^^^^^^^^

  T2MI_params.timestamp_type:=timestamp_CbB.ItemIndex;

  if not EditToInt(Freq_Edit, 36000000, 862000000, dat) then if page_err_ind<0 then page_err_ind:=2;
  T2MI_params.frequency:=dat;

  if not EditToInt(cell_id_Edit, 0, $ffff, dat) then if page_err_ind<0 then page_err_ind:=2;
  T2MI_params.cell_id:=dat;

  if not EditToInt(nw_id_Edit, 1, $ffff, dat) then if page_err_ind<0 then page_err_ind:=2;
  T2MI_params.network_id:=dat;

  if not EditToInt(t2sys_id_Edit, 1, $ffff, dat) then if page_err_ind<0 then page_err_ind:=2;
  T2MI_params.t2_system_id:=dat;

  if not EditToInt(t2mi_pid_Edit, $20, $1ffe, dat) then if page_err_ind<0 then page_err_ind:=2;
  T2MI_params.t2mi_pid:=dat;

  if not EditToInt(pmti_pid_Edit, $20, $1ffe, dat) then if page_err_ind<0 then page_err_ind:=2;
  T2MI_params.t2mi_pmt_pid:=dat;

  T2MI_params.t2mi_stream_id:=stream_id_CbB.ItemIndex;

  T2MI_params.plp_time_il_type:=0;
  T2MI_params.reserv1:=0;
  T2MI_params.reserv2:=0;
  T2MI_params.bufs:=0;
  for i:=0 to 4 do T2MI_params.reserv3[i]:=0;
  T2MI_params.t2mi_err_enabled:=false;
  T2MI_params.packet_type_freq:=0;
  T2MI_params.packet_payl_freq:=0;
  T2MI_params.payload_freq:=0;

  T2MI_params.crc_err_freq:=0;
  T2MI_params.packet_count_freq:=0;
  T2MI_params.plp_num_bl_freq:=0;
  T2MI_params.tr_order_freq:=0;
  T2MI_params.timestamp_err_freq:=0;
  T2MI_params.timestamp_disc_freq:=0;
  T2MI_params.reserv4:=0;
  for i:=0 to 4 do T2MI_params.reserv5[i]:=0;

  if page_err_ind<0 then
  begin

  end
  else SetPageControl.TabIndex:=page_err_ind;

end;
//------------------------------------------------------------------------------
procedure TT2miSetForm.OnButtonClick(Sender: TObject);
var param: word;
begin
  if T2MI_params.on_off then
  begin
    OnButton.Caption:='Включить';
    T2MI_params.on_off:=false;
    param:=2;
    SendCommandDSP(0, DSP_Comand_Set_T2MI_Param, 1, @param);
  end
  else
  begin
    OnButton.Caption:='Выключить';
    T2MI_params.on_off:=true;
    param:=3;
    SendCommandDSP(0, DSP_Comand_Set_T2MI_Param, 1, @param);
  end;

  param:=1;
  SendCommandDSP(0, DSP_Comand_Get_Signal_Parametrs, 1, @param);
end;

//------------------------------------------------------------------------------
procedure TT2miSetForm.ReceiveParam(p_param: PT2MI_params);
begin
  T2MI_params:=p_param^;

  if not show_ok then
  begin
    Param_to_Interface;
    show_ok:=true;
  end;

  if T2MI_params.on_off then
  begin
    OnButton.Caption:='Выключить';
    t2miLED.OnSwich;
  end
  else
  begin
    OnButton.Caption:='Включить';
    t2miLED.OffSwich;
  end;

  ShowParams;
end;
//------------------------------------------------------------------------------

end.
