unit make_sig_g420_main;

interface

uses
  const_type,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, inifiles;

const
  BUF_SIZE = 8192; // в пакетах
  DATA_BASE_FILE_NAME = 'g420_sig.dat';
type
  TTPArr = array[0..187] of byte;
  PTPArr = ^TTPArr;

  TTransportPaket = packed record
    arr: TTPArr;
  end;

  PCR_info = record
    first_pcr: int64;
    first_ind: int64;
    last_pcr: int64;
    last_ind: int64;
  end;

  DTS_info = record
    first_dts: int64;
    last_dts: int64;
    min_dts: int64;
    max_dts: int64;
    min_step: dword;
    discount: boolean;
    count: integer;
  end;

  TForm1 = class(TForm)
    AddFileButton: TButton;
    StatusPanel: TPanel;
    Memo1: TMemo;
    ClearLogButton: TButton;
    Label3: TLabel;
    ListBox2: TListBox;
    ChangeDeltaPtsButton: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    ListBox1: TListBox;
    Edit1: TEdit;
    Label1: TLabel;
    DelFileButton: TButton;
    ComboBox2: TComboBox;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SaveSigBitBtn: TBitBtn;
    SaveSigAsBitBtn: TBitBtn;
    OpenSigBitBtn: TBitBtn;
    SaveDialog1: TSaveDialog;
    g450tog420_ChB: TCheckBox;
    Label4: TLabel;
    Edit3: TEdit;
    ts_id_change_ChB: TCheckBox;
    ClearSigButton: TButton;
    procedure AddFileButtonClick(Sender: TObject);
    procedure DelFileButtonClick(Sender: TObject);
    procedure ChangeDeltaPtsButtonClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ClearLogButtonClick(Sender: TObject);
    procedure SaveSigBitBtnClick(Sender: TObject);
    procedure OpenSigBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveSigAsBitBtnClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure ClearSigButtonClick(Sender: TObject);
  private
    { Private declarations }
    ArrTS: array[0..BUF_SIZE-1]of TTransportPaket;
    pat_ok, pmt_ok, sdt_ok: boolean;
    cur_packet: int64;
    is_table: array[0..8191] of boolean;
    pcr_count: integer;
    pcr_index: array[0..8191] of integer;
    pcr_list : array[0..MAX_NUMBER_OF_PROGRAMS-1]of PCR_info;
    dts_count: integer;
    dts_index: array[0..8191] of integer;
    dts_list : array[0..MAX_NUMBER_OF_PROGRAMS-1]of DTS_info;
    prog_count: integer;
    prog_num: array[0..MAX_NUMBER_OF_PROGRAMS-1]of word;
    prov_name: array[0..MAX_NUMBER_OF_PROGRAMS-1]of string;
    prog_name: array[0..MAX_NUMBER_OF_PROGRAMS-1]of string;
    packet_count: int64;
    table_pres: word;
    sig_type: integer;  // (mpeg1=0, mpeg2=1, mpeg4=2, avc=3, sdi=8, hdsdi=9)
    signal: TSignalListItem2;
    SignalFileName: string;
    SigFile: file;
    rewrite_packet: boolean;
    is_insert_g420_to_sdt: boolean;
    is_insert_g420_to_nit: boolean;
    is_insert_ts_id_to_pat: boolean;
    is_insert_ts_id_to_sdt: boolean;
    is_insert_ts_id_to_eit: boolean;
    is_insert_ts_id_to_nit: boolean;
    old_ts_id, new_ts_id: word;
    cur_dir: string;
    procedure AddSdiFile(FileName: string);
    procedure AddMpegFile(FileName: string);
    procedure ClearAnalise;
    procedure Analise(count: integer);
    procedure AnalisePAT(ind, ofs: integer);
    procedure AnalisePMT(ind, ofs: integer);
    procedure AnaliseSDT(ind, ofs: integer);
    procedure AnaliseNIT(ind, ofs: integer);
    procedure AnaliseEIT(ind, ofs: integer);
    Procedure InsertCRC32(var TP:TTPArr; PosData{,PosCRC}:byte);
    procedure descriptor_analize(arr: PArrByte; leng: integer; prog_ind:integer = 0);
    function name_descriptor_analize(arr: PArrByte): string;
    procedure network_name_descriptor_analize(arr: PArrByte);
    procedure service_descriptor_analize(arr: PArrByte; prog_ind:integer);
    procedure PostAnalise(fileName: string);
    procedure ClearSignal;
    procedure ShowSignal;
    procedure SaveSignal(FileName: string);
    procedure LoadSignal(FileName: string);
    function GetNewSigId: dword;
    function TestSigId(sig_id: dword; sig_name: string):integer;
    procedure RegisterSigId(sig_id: dword; sig_name: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.SaveSigBitBtnClick(Sender: TObject);
begin
  SaveSignal(SignalFileName);
end;
//------------------------------------------------------------------------------

procedure TForm1.SaveSigAsBitBtnClick(Sender: TObject);
var FileName: string;
begin
  SaveDialog1.Filter:='Сигнал (*.sig)|*.sig|Все файлы (*.*)|*.*';
  SaveDialog1.FileName:=signal.name;
  if SaveDialog1.Execute then
  begin
    FileName:=SaveDialog1.FileName;
    if lowercase(ExtractFileExt(FileName))<>'.sig' then
      FileName:=FileName+'.sig';

    if FileExists(FileName) then
       if MessageDlg('Файл существует, перезаписать?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = IDNo then exit;

    SaveSignal(FileName);
  end;
end;

//------------------------------------------------------------------------------
procedure TForm1.OpenSigBitBtnClick(Sender: TObject);
begin
  OpenDialog1.Filter:='Сигнал (*.sig)|*.sig|Все файлы (*.*)|*.*';
  if OpenDialog1.Execute then
  begin
    LoadSignal(OpenDialog1.FileName);
  end;
end;

//------------------------------------------------------------------------------

procedure TForm1.AddFileButtonClick(Sender: TObject);
var ext, filename: string;
begin
  OpenDialog1.Filter:='Поток (*.m2t, *.ts, *.sdi)|*.m2t; *.ts; *.sdi|Описатель (*.cnf)|*.cnf|Все файлы (*.*)|*.*';
  if OpenDialog1.Execute then
  begin
    filename:=OpenDialog1.FileName;
    ext:=LowerCase(ExtractFileExt(filename));
//    filename:=ExtractFileName(OpenDialog1.FileName);

    if ext='.cnf' then
    begin
      Delete(filename, Length(filename)-Length(ext), 255);
      filename:=filename+'.m2t';
      ext:='.m2t';
    end;

    if ext='.m2t' then AddMpegFile(filename) else AddSdiFile(filename);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.DelFileButtonClick(Sender: TObject);
var ind, i: integer;
begin
  ind:=ListBox1.ItemIndex;
  if (ind>=0)and(signal.br_count>0) then
  begin
    for i:=ind to signal.br_count-2 do
      signal.Signal_br[i]:=signal.Signal_br[i+1];
    dec(signal.br_count);
    ShowSignal;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.ClearLogButtonClick(Sender: TObject);
begin
  Memo1.Clear;
end;
//------------------------------------------------------------------------------

procedure TForm1.ChangeDeltaPtsButtonClick(Sender: TObject);
var d: dword; ind, err: integer;
begin
  ind:=ListBox1.ItemIndex;
  if ind>=0 then
  begin
    val(Edit2.Text, d, err);
    if err=0 then signal.Signal_br[ind].delta_pts:=d;
    ShowSignal;
  end
  else ListBox1Click(nil);

end;

//------------------------------------------------------------------------------
procedure TForm1.AddSdiFile(FileName: string);
var fl: file;
size: int64;
path, ext: string;
p1, p2, p3: integer;
begin
  path:=ExtractFilePath(FileName); p2:=length(path);
  ext:=ExtractFileExt(FileName); p3:=length(ext);
  p1:=length(FileName)-p2-p3;
  signal.name:=copy(FileName, p2+1, p1);
  AssignFile(fl, FileName);
  ReSet(fl, 1);
  size:=FileSize(fl);
//  signal.sig_id:=((ComboBox1.ItemIndex and $0f) shl 24) + ((8) shl 28);
  signal.sig_id_type:=8;
  signal.prog_count:=0;
  signal.br_count:=1;
  signal.Signal_br[0].file_name:=FileName;
  signal.Signal_br[0].length:=size;
  CloseFile(fl);
  ShowSignal;
  AddFileButton.Enabled:=false;
end;
//------------------------------------------------------------------------------

procedure TForm1.AddMpegFile(FileName: string);
var //SigFile: file;
size: int64;
part_size, p: integer;
FileNameCnf, ext, st: string;
txt: TextFile;
begin
  ClearAnalise;
  Memo1.Lines.Add('---- Добавили файл '+ExtractFileName(fileName)+' -----');
  //если имя еще не задано, берем из cnf
  if signal.name='' then
  begin
    ext:=ExtractFileExt(FileName);
    FileNameCnf:=Copy(FileName, 1, length(FileName)-length(ext))+'.cnf';
    if FileExists(FileNameCnf) then
    begin
      AssignFile(txt, FileNameCnf);
      ReSet(txt);
      ReadLn(txt, st);
      p:=pos('=', st);
      if p>0 then
      begin
        Delete(st, 1, p);
        signal.name:=st;
        Edit1.Text:=st;
      end;
      CloseFile(txt);
    end;
  end;
  // считываем
  AssignFile(SigFile, FileName);
  ReSet(SigFile, SizeOf(TTransportPaket));
  size:=FileSize(SigFile);
  packet_count:=size;
  while(size>0)do
  begin
    Seek(SigFile, cur_packet);
    if size>BUF_SIZE then part_size:=BUF_SIZE else part_size:=size;
    BlockRead(SigFile, ArrTS[0], part_size);
    Analise(part_size);
    dec(size, part_size);
    inc(cur_packet, part_size);
  end;
  CloseFile(SigFile);
  PostAnalise(filename);
end;
//------------------------------------------------------------------------------
procedure TForm1.ClearAnalise;
var
  i: Integer;
begin
  pat_ok:=false; pmt_ok:=false; sdt_ok:=false;
  cur_packet:=0;
  pcr_count:=0;
  dts_count:=0;
  for i:=0 to 8191 do
  begin
    pcr_index[i]:=-1;
    dts_index[i]:=-1;
    is_table[i]:=i<$20;
  end;
  table_pres:=0;
  prog_count:=0;
  sig_type:=0;
  rewrite_packet:=false;
  is_insert_g420_to_sdt:=false;
  is_insert_g420_to_nit:=false;
  is_insert_ts_id_to_pat:=false;
  is_insert_ts_id_to_sdt:=false;
  is_insert_ts_id_to_eit:=false;
  is_insert_ts_id_to_nit:=false;
  new_ts_id:=signal.sig_id_num and $ffff;
  if new_ts_id=0 then new_ts_id:=1;
  old_ts_id:=0;
end;
//------------------------------------------------------------------------------
procedure TForm1.ComboBox2Change(Sender: TObject);
begin
//  signal.sig_id:=(signal.sig_id and $00ffffff) + {(dword(ComboBox1.ItemIndex and $0f) shl 24) + }
//    (dword(ComboBox2.ItemIndex and $0f) shl 28);
  signal.sig_id_type:=ComboBox2.ItemIndex and $0f;
end;
//------------------------------------------------------------------------------

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Edit1.Text='' then
  begin
    Edit1.Color:=$8080ff;
    SaveSigBitBtn.Enabled:=false;
    SaveSigAsBitBtn.Enabled:=false;
  end
  else
  begin
    Edit1.Color:=clWindow;
    SaveSigBitBtn.Enabled:=true;
    SaveSigAsBitBtn.Enabled:=true;
  end;
  signal.name:=Edit1.Text;
end;
//------------------------------------------------------------------------------
procedure TForm1.Edit3Change(Sender: TObject);
var d, err: integer;
begin
  val(Edit3.Text, d, err);
  if (err=0)and(d>0) then signal.sig_id_num:=d;
end;
//------------------------------------------------------------------------------

procedure TForm1.Edit3Exit(Sender: TObject);
var d, err: integer;
begin
  val(Edit3.Text, d, err);
  if (err=0)and(d>0) then signal.sig_id_num:=d
  else Edit3.Text:=IntToStr(signal.sig_id_num);

end;

//------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
  cur_dir:=GetCurrentDir;
  SignalFileName:='';
  ClearSignal;
  ShowSignal;
end;

//------------------------------------------------------------------------------

procedure TForm1.ListBox1Click(Sender: TObject);
var ind: integer;
begin
  ind:=ListBox1.ItemIndex;
  if ind>=0 then
  begin
    ChangeDeltaPtsButton.Enabled:=true;
    DelFileButton.Enabled:=true;
    Edit2.Text:=IntToStr(signal.Signal_br[ind].delta_pts);
  end
  else
  begin
    ChangeDeltaPtsButton.Enabled:=false;
    DelFileButton.Enabled:=false;
  end;
end;

//------------------------------------------------------------------------------
procedure TForm1.Analise(count: integer);
var i: Integer;
pid, pcr_ind, dts_ind, shift, stream_id, table_id: integer;
first, adapt, pyload_start: boolean;
pcr, dts: int64;
pcr_ext, delta_dts: integer;
pArr: PTPArr;
pts_flags: byte;
st: string;
begin
  for i:=0 to count-1 do
  begin
    pArr:=@ArrTS[i].arr;
    pid:=((pArr[1] shl 8) + pArr[2]) and $1fff;
    adapt:=(pArr[3] and $20) <> 0;
    pyload_start:=(pArr[1] and $40) <> 0;
    shift:=4;
    // PAT
//    if not pat_ok then if pid=0 then AnalisePAT(i);
    // PCR
    if adapt then
    begin
      shift:=5+pArr[4];
      if pArr[4]>6 then
        if (pArr[5] and $10) <> 0 then
        begin
          pcr_ind:=pcr_index[pid];
          first:=false;
          if pcr_ind<0 then
            if pcr_count<MAX_NUMBER_OF_PROGRAMS then
            begin
              pcr_ind:=pcr_count; inc(pcr_count); first:=true;
              pcr_index[pid]:=pcr_ind;
            end;
          if pcr_ind>=0 then
          begin
            pcr:=round(pArr[6]*33554432.0+pArr[7]*131072.0+pArr[8]*512.0+pArr[9]*2.0+(pArr[10]div 128));
            pcr_ext:=(pArr[10]*256+pArr[11])and $1ff;
            pcr:=pcr*300+pcr_ext;
            if first then pcr_list[pcr_ind].first_pcr:=pcr;
            if first then pcr_list[pcr_ind].first_ind:=cur_packet+i;
            pcr_list[pcr_ind].last_pcr:=pcr;
            pcr_list[pcr_ind].last_ind:=cur_packet+i;

          end;
        end;
    end;
    // PTS
    if pyload_start then if (pArr[shift]=0)and(pArr[shift+1]=0)and(pArr[shift+2]=1) then
    begin
      stream_id:=pArr[shift+3];
      pts_flags:=pArr[shift+7];
      if ((stream_id and $f0)=$e0)and((pts_flags and $80)<>0) then // video & PTS
      begin
        inc(shift, 9);
        if (pts_flags and $40)<>0 then inc(shift, 5); // если есть DTS - берем его
        dts:=pArr[shift] and $0e;
        dts:=dts shl 7;
        dts:=dts + pArr[shift+1];
        dts:=dts shl 8;
        dts:=dts + (pArr[shift+2] and $fe);
        dts:=dts shl 7;
        dts:=dts + pArr[shift+3];
        dts:=dts shl 8;
        dts:=dts + pArr[shift+4];
        dts:=dts shr 1;
        st:='DTS='+IntToStr(dts);

        dts_ind:=dts_index[pid];
        st:=IntToStr(dts_ind)+' '+st;

        first:=false;
        if dts_ind<0 then
          if dts_count<MAX_NUMBER_OF_PROGRAMS then
          begin
            dts_ind:=dts_count; inc(dts_count); first:=true;
            dts_index[pid]:=dts_ind;
          end;
        if dts_ind>=0 then
        begin
          if first then
          begin
            dts_list[dts_ind].first_dts:=dts;
            dts_list[dts_ind].min_step:=$ffffffff;
            dts_list[dts_ind].last_dts:=dts;
            dts_list[dts_ind].min_dts:=dts;
            dts_list[dts_ind].max_dts:=dts;
            dts_list[dts_ind].discount:=false;
            dts_list[dts_ind].count:=0;
          end
          else
          begin
            delta_dts:=dts-dts_list[dts_ind].last_dts;
            if(delta_dts<=0) then
              dts_list[dts_ind].discount:=true
            else if(dts_list[dts_ind].min_step>delta_dts) then
                   dts_list[dts_ind].min_step:=delta_dts;
            dts_list[dts_ind].last_dts:=dts;
            if(dts_list[dts_ind].min_dts>dts) then
              dts_list[dts_ind].min_dts:=dts;
            if(dts_list[dts_ind].max_dts<dts) then
              dts_list[dts_ind].max_dts:=dts;
            inc(dts_list[dts_ind].count);
            st:=st+' ('+IntToStr(delta_dts)+')';
          end;
          st:=st+'  '+IntToStr(dts_list[dts_ind].count);
        end;
//        Memo1.Lines.Add(st);

      end;
    end;
    // Таблицы
    if pyload_start then
      if is_table[pid] then
      begin
        shift:=5+pArr[4];
        if shift<186 then
        begin
          table_id:=pArr[shift];
          case table_id of
            $00: begin table_pres:=table_pres or $0001; AnalisePAT(i, shift); end;
            $01: table_pres:=table_pres or $0002;  // CAT
            $02: begin table_pres:=table_pres or $0004; AnalisePMT(i, shift); end;// PMT
            $03: table_pres:=table_pres or $0008; // TSDT
            $40: begin table_pres:=table_pres or $0010; AnaliseNIT(i, shift); end;// NIT_actual
            $41: table_pres:=table_pres or $0020; // NIT_other
            $42: begin table_pres:=table_pres or $0040; AnaliseSDT(i, shift); end;// SDT_actual

            $46: table_pres:=table_pres or $0080; // SDT_other
            $4a: table_pres:=table_pres or $0100; // BAT
            $4e: begin table_pres:=table_pres or $0200; AnaliseEIT(i, shift); end;// EIT_actual_present
            $4f: table_pres:=table_pres or $0400; // EIT_other_present
            $50..$5f: begin table_pres:=table_pres or $0800; AnaliseEIT(i, shift); end; // EIT_actual_schedule
            $60..$6f: table_pres:=table_pres or $1000; // EIT_other_schedule
            $70: table_pres:=table_pres or $4000; // TDT
            $71: table_pres:=table_pres or $2000; // RST
            $73: table_pres:=table_pres or $4000; // TOT
            $7e,$7f: table_pres:=table_pres or $8000; // DIT  SIT
          end;
        end;
      end;

  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.AnalisePAT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, i, program_number, program_map_PID: integer;
ts_id: word;
begin
//  if pat_ok then exit;
  pArr:=@ArrTS[ind].arr[ofs];
  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if (sect_leng>(188-ofs))or(sect_leng<12) then exit;

  ts_id:=(pArr[3]shl 8) + pArr[4];
  if (ts_id_change_ChB.Checked)and(ts_id<>new_ts_id) then
  begin
    pArr[3]:=hi(new_ts_id);
    pArr[4]:=lo(new_ts_id);
    rewrite_packet:=true;
    is_insert_ts_id_to_pat:=true;
  end;

  if not pat_ok then
  begin
    old_ts_id:=ts_id;
    leng:=sect_leng-12;
    i:=8;
    while leng>=4 do
    begin
      program_number:=pArr[i]*$100 + pArr[i+1];
      program_map_PID:=(pArr[i+2]and $1f)*$100 + pArr[i+3];
      is_table[program_map_PID]:=true;
      if (program_number <> 0)and(prog_count<MAX_NUMBER_OF_PROGRAMS) then
      begin
        prog_num[prog_count]:=program_number;
        prov_name[prog_count]:='';
        prog_name[prog_count]:='';
        inc(prog_count);
      end;
      dec(leng,4); inc(i,4);
    end;
  end;
  if rewrite_packet then
  begin
    InsertCRC32(ArrTS[ind].arr, ofs);
    Seek(SigFile, cur_packet+ind);
    BlockWrite(SigFile, ArrTS[ind], 1);
  end;
  pat_ok:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.AnalisePMT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, i, stream_type, type_ind: integer;
begin
//  if pmt_ok then exit;
  pArr:=@ArrTS[ind].arr[ofs];

  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if sect_leng<14 then exit;

  if not pmt_ok then
  begin
    leng:=(pArr[10]and $0f)*$100 + pArr[11];
    i:=12+leng;
    while i<=sect_leng-(5+4) do // 5 - ES_info, 4 - CRC
    begin
      stream_type:=pArr[i];
  //    ES_PID:=(pArr[i+1]and $1f)*$100 + pArr[i+2];
      leng:=(pArr[i+3]and $0f)*$100 + pArr[i+4];
      case stream_type of
        $01: type_ind:=0; // ISO/IEC 11172-2 Video
        $02: type_ind:=1; // ISO/IEC 13818-2 Video
        $10: type_ind:=2; // ISO/IEC 14496-2 Visual
        $1B: type_ind:=3; // AVC video stream as defined in ITU-T Rec. H.264 | ISO/IEC 14496-10 Video
        else type_ind:=0;
      end;
      if type_ind>sig_type then sig_type:=type_ind;

      inc(i,leng+5);
    end;
  end;
  pmt_ok:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.AnaliseSDT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, leng2, i, prog_ind{, stream_type, type_ind}: integer;
service_id, ts_id: word;
begin
//  if (sdt_ok)and(not g450tog420_ChB.Checked) then exit;
  pArr:=@ArrTS[ind].arr[ofs];

  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if sect_leng<15 then exit;

  if (ts_id_change_ChB.Checked) then
  begin
    if not pat_ok then memo1.Lines.Add('SDT встретился раньше PAT, поэтому transport_stream_id не исправлен')
    else
    begin
      ts_id:=(pArr[3]shl 8) + pArr[4];
      if(ts_id=old_ts_id)and(ts_id<>new_ts_id) then
      begin
        pArr[3]:=hi(new_ts_id);
        pArr[4]:=lo(new_ts_id);
        rewrite_packet:=true;
        is_insert_ts_id_to_sdt:=true;
      end;
    end;
  end;

  leng:=sect_leng-4;
  i:=11;
  while i<leng do
  begin
    service_id:=(pArr[i]shl 8) + pArr[i+1];
//    ES_PID:=(pArr[i+1]and $1f)*$100 + pArr[i+2];
    leng2:=(pArr[i+3]and $0f)*$100 + pArr[i+4];
    for prog_ind:=0 to prog_count-1 do if service_id=prog_num[prog_ind] then
    begin
      descriptor_analize(PArrByte(dword(pArr)+i+5), leng2, prog_ind);
    end;
    inc(i,leng2+5);
  end;
  if rewrite_packet then
  begin
    InsertCRC32(ArrTS[ind].arr, ofs{, ofs+leng});
    Seek(SigFile, cur_packet+ind);
    BlockWrite(SigFile, ArrTS[ind], 1);
    rewrite_packet:=false;
  end;
  sdt_ok:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.ClearSigButtonClick(Sender: TObject);
begin
  ClearSignal;
  ShowSignal;
  Memo1.Clear;
end;

//------------------------------------------------------------------------------
procedure TForm1.AnaliseNIT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, leng2, i: integer;
ts_id: word;
begin
  pArr:=@ArrTS[ind].arr[ofs];

  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if sect_leng<16 then exit;
  i:=10;
  leng:=((pArr[8]and $0f)shl 8) + pArr[9];
  descriptor_analize(PArrByte(dword(pArr)+i), leng);
  inc(i, leng+2);
  leng:=i + ((pArr[i-2]and $0f)shl 8) + pArr[i-1];
  while i<leng do
  begin
    if ts_id_change_ChB.Checked then
    begin
      if not pat_ok then memo1.Lines.Add('NIT встретился раньше PAT, поэтому transport_stream_id не исправлен')
      else
      begin
        ts_id:=(pArr[i]shl 8) + pArr[i+1];
        if (ts_id = old_ts_id)and(ts_id<>new_ts_id) then
        begin
          pArr[i]:=hi(new_ts_id);
          pArr[i+1]:=lo(new_ts_id);
          rewrite_packet:=true;
          is_insert_ts_id_to_nit:=true;
        end;
      end;
    end;
    leng2:=((pArr[i+4]and $0f)shl 8) + pArr[i+5];
//    descriptor_analize(PArrByte(dword(pArr)+i+6), leng2);
    inc(i, leng2+6);
  end;
  if rewrite_packet then
  begin
    InsertCRC32(ArrTS[ind].arr, ofs{, ofs+leng});
    Seek(SigFile, cur_packet+ind);
    BlockWrite(SigFile, ArrTS[ind], 1);
    rewrite_packet:=false;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.AnaliseEIT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, leng2, i: integer;
ts_id: word;
begin
  pArr:=@ArrTS[ind].arr[ofs];

  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if sect_leng<18 then exit;

  ts_id:=(pArr[8]shl 8) + pArr[9];
  if (ts_id_change_ChB.Checked)and(ts_id<>new_ts_id) then
  begin
    pArr[8]:=hi(new_ts_id);
    pArr[9]:=lo(new_ts_id);
    rewrite_packet:=true;
    is_insert_ts_id_to_eit:=true;
  end;

  if rewrite_packet then
  begin
    InsertCRC32(ArrTS[ind].arr, ofs{, ofs+leng});
    Seek(SigFile, cur_packet+ind);
    BlockWrite(SigFile, ArrTS[ind], 1);
    rewrite_packet:=false;
  end;
end;
//------------------------------------------------------------------------------

Procedure TForm1.InsertCRC32(var TP:TTPArr; PosData{,PosCRC}:byte);
var i,j:byte;
CRC,DataXor,data:dWord;  // используются для вычисления CRC таблиц PAT, PMT
PosCRC:byte;
leng: integer;
begin
  CRC:=$ffffffff;
  leng:=(TP[PosData+1]and $0f)*$100 + TP[PosData+2];
  if (leng>184-PosData)or(leng<4) then exit;
  PosCRC:=PosData+leng-1;

  for i:=PosData to PosCRC-1 do
  begin
    data:=TP[i];
    for j:=0 to 7 do
    begin
      if (((data)xor(CRC shr 24))and $80)<>0 then DataXor:=$04C11DB7
      else DataXor:=0;
      CRC:=CRC shl 1;
      CRC:=CRC xor DataXor;
      data:=data shl 1;
    end;
  end;
  for i:=0 to 3 do begin TP[PosCRC+3-i]:=CRC and $ff; CRC:=CRC shr 8; end;
  for i:=PosCRC+4 to 187 do TP[i]:=$ff;
end;
//------------------------------------------------------------------------------

procedure TForm1.descriptor_analize(arr: PArrByte; leng: integer; prog_ind:integer = 0);
var descr_leng: integer;
begin
  while leng>2 do
  begin
    case arr[0] of
      $40: network_name_descriptor_analize(arr);
      $48: service_descriptor_analize(arr, prog_ind);
    end;
    descr_leng:=Arr[1]+2;
    arr:=PArrByte(dword(arr)+descr_leng);
    dec(leng, descr_leng);
  end;
end;
//------------------------------------------------------------------------------
function TForm1.name_descriptor_analize(arr: PArrByte): string;
var leng, i: integer;
begin
  leng:=arr[1];
  result:='';
  for i:=2 to leng+1 do result:=result+AnsiChar(arr[i]);

end;
//------------------------------------------------------------------------------
procedure TForm1.network_name_descriptor_analize(arr: PArrByte);
var st: string;
p: integer;
begin
  st:=name_descriptor_analize(arr);
  if ts_id_change_ChB.Checked then
  begin
    p:=pos('450', st);
    if (p>0)and(g450tog420_ChB.Checked) then
    begin
      st[p+1]:='2';
      Arr[p+2]:=$32;
      rewrite_packet:=true;
      is_insert_g420_to_nit:=true;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.service_descriptor_analize(arr: PArrByte;  prog_ind:integer);
var ofs, p: integer;
st: string;
begin
  // provider name
  ofs:=2;
  st:=name_descriptor_analize(PArrByte(dword(arr)+ofs));
  p:=pos('450', st);
  if (p>0)and(g450tog420_ChB.Checked) then
  begin
    st[p+1]:='2';
    Arr[p+4]:=$32;
    rewrite_packet:=true;
    is_insert_g420_to_sdt:=true;
  end;
  if not sdt_ok then
    prov_name[prog_ind]:=st;

  // program name
  if not sdt_ok then
  begin
    ofs:=3+arr[3];
    prog_name[prog_ind]:=name_descriptor_analize(PArrByte(dword(arr)+ofs));
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.PostAnalise(fileName: string);
var frame_count, br_ind, i, j: integer;
delta_pts: dword;
st, st2: string;
err_sig, found: boolean;
ppm, br, br2: double;
begin
  err_sig:=false; st:=''; delta_pts:=0; br:=0; br2:=0; frame_count:=0;

  // битрейт по PCR
  if pcr_count>0 then
  begin
    if pcr_list[0].last_pcr>pcr_list[0].first_pcr then
    begin
      br:={round}((pcr_list[0].last_ind-pcr_list[0].first_ind)*188.0*8*27e6/(pcr_list[0].last_pcr-pcr_list[0].first_pcr));
    end;
  end;

  // бтирейт по DTS
  if(dts_count>0)then
  begin
    // проверяем разрыв DTS
    if dts_list[0].discount then
    begin
      st2:='Разрыв DTS; ';
      Memo1.Lines.Add(st2);
      st:=st+st2; err_sig:=true;
    end;
    if (dts_list[0].min_step<$ffffffff)and(dts_list[0].min_step>0) then
    begin
      frame_count:=((dts_list[0].max_dts-dts_list[0].min_dts)div dts_list[0].min_step) + 1;
      delta_pts:=frame_count*dts_list[0].min_step;
      br2:={round}(packet_count*188.0*8*90000/delta_pts);
      if br>0 then // корректируем битрейт и вычисляем delta_pts
      begin
        frame_count:=round((packet_count*188.0*8*90000)/(br*dts_list[0].min_step));
        delta_pts:=frame_count*dts_list[0].min_step;
        br:={round}(packet_count*188.0*8*90000/delta_pts);
      end;
    end;
  end;

  // проверка соответствия битрейтов
  if br=0 then br:=br2;
  if br>0 then
  begin
    ppm:=abs((br-br2)*1e6/br);
    if ppm>30 then
    begin
      err_sig:=true;
      st2:='BR_dts = '+FloatToStrF(br2/1e6, FFFixed, 9,6)+' Мбит/с; ';
      Memo1.Lines.Add(st2);
      st:=st+st2;
    end;
  end;

  // проверка delta_pts
{  if signal.br_count>0 then if (delta_pts<>signal.delta_pts) then
  begin
    err_sig:=true;
    Memo1.Lines.Add('delta_pts добавленного файла ('+IntToStr(delta_pts)+') отличается от предыдущих ('+IntToStr(signal.delta_pts)+')');

    st:=st+'другой delta_pts; ';
  end;   }

  // проверка списка программ
  if signal.br_count>0 then
  begin
    if signal.prog_count<>prog_count then
    begin
      err_sig:=true;
      st2:='другое число программ';
      Memo1.Lines.Add(st2+', было '+IntToStr(signal.prog_count)+'; стало '+IntToStr(prog_count));
      st:=st+st2+'; ';
    end
    else
    begin
      for i:=0 to prog_count-1 do
      begin
        found:=false;
        for j:=0 to signal.prog_count-1 do
          if prog_num[i]=signal.ProgInfo[j].service_id then
          begin
            found:=true;
            if signal.ProgInfo[j].prov_name<>prov_name[i] then
              Memo1.Lines.Add('Не совпало имя провайдера для программы '+IntToStr(prog_num[i])+
                '; было: "'+signal.ProgInfo[j].prov_name+'"; в файле: "'+prov_name[i]+'"');
            if signal.ProgInfo[j].prog_name<>prog_name[i] then
              Memo1.Lines.Add('Не совпало имя для программы '+IntToStr(prog_num[i])+
                '; было: "'+signal.ProgInfo[j].prog_name+'"; в файле: "'+prog_name[i]+'"');
          end;
        if not found then
        begin
          err_sig:=true;
          st2:='программы отличаются; ';
          Memo1.Lines.Add(st2);
          st:=st+st2;

          break;
        end;
      end;
    end;
  end;

  if is_insert_g420_to_sdt then
    Memo1.Lines.Add('Файл изменен. В SDT "450" исправлено на "420"');
  if is_insert_g420_to_nit then
    Memo1.Lines.Add('Файл изменен. В NIT "450" исправлено на "420"');
  if is_insert_ts_id_to_pat then
    Memo1.Lines.Add('Файл изменен. В PAT ts_id='+IntToStr(old_ts_id)+' исправлен на '+IntToStr(new_ts_id));
  if is_insert_ts_id_to_sdt then
    Memo1.Lines.Add('Файл изменен. В SDT ts_id='+IntToStr(old_ts_id)+' исправлен на '+IntToStr(new_ts_id));
  if is_insert_ts_id_to_eit then
    Memo1.Lines.Add('Файл изменен. В EIT ts_id='+IntToStr(old_ts_id)+' исправлен на '+IntToStr(new_ts_id));
  if is_insert_ts_id_to_nit then
    Memo1.Lines.Add('Файл изменен. В NIT ts_id='+IntToStr(old_ts_id)+' исправлен на '+IntToStr(new_ts_id));

  // проверка числа пакетов
  if packet_count>22845570 then
  begin
    err_sig:=true;
    st2:='слишком много пакетов ('+IntToStr(packet_count)+'); ';
    Memo1.Lines.Add(st2);
    st:=st+st2;
  end;

  // проверка состава таблиц
  if signal.br_count>0 then if signal.table_pres<>table_pres then
  begin
    err_sig:=true;
    st2:='отличается состав таблиц';
    Memo1.Lines.Add(st2+'; старый table_pres=0x'+IntToHex(signal.table_pres, 4)+'; новый table_pres=0x'+IntToHex(table_pres, 4));
    st:=st+st2+'; ';
  end;

  // добавление списка программ
  signal.prog_count:=prog_count;
  for i:=0 to prog_count-1 do
  begin
    signal.ProgInfo[i].service_id:=prog_num[i];
    signal.ProgInfo[i].prov_name:=prov_name[i];
    signal.ProgInfo[i].prog_name:=prog_name[i];
  end;

  // добавление состава таблиц
  signal.table_pres:=table_pres;

  // добавление битрейта
  if signal.br_count<32 then
  begin
    br_ind:=signal.br_count;
    inc(signal.br_count);
    signal.Signal_br[br_ind].file_name:=fileName;
    signal.Signal_br[br_ind].length:=packet_count*188;
    signal.Signal_br[br_ind].delta_pts:=delta_pts;
    signal.Signal_br[br_ind].br:=round(br+0.4999999); // округляем в большую сторону
  end;

  // добавление типа сигнала
//  signal.sig_id:={((ComboBox1.ItemIndex and $0f) shl 24) +} ((sig_type and $0f) shl 28);
  signal.sig_id_type:=sig_type and $0f;

  ShowSignal;

//  st:=st+IntToStr(frame_count)+' кадров; BR='+FloatToStrF(br/1e6, FFFixed, 9,6)+' Мбит/с';
  Memo1.Lines.Add(IntToStr(frame_count)+' кадров; BR='+FloatToStrF(br/1e6, FFFixed, 9,6)+' Мбит/с; '+
    IntToStr(packet_count)+' пакетов; table_pres=0x'+IntToHex(table_pres, 4)+'; число программ='+IntToStr(prog_count));

  if err_sig then StatusPanel.Color:=$8080ff else StatusPanel.Color:=clBtnFace;
  StatusPanel.Caption:=st;
  Edit2.Text:=IntToStr(delta_pts);

end;
//------------------------------------------------------------------------------
procedure TForm1.ClearSignal;
var i: integer;
begin
  signal.name:='';
  signal.sig_id_type:=0;
  signal.sig_id_num:=GetNewSigId;
  signal.min_br:=0;
  signal.table_pres:=0;
  signal.discr_format:=0;
  signal.frame_rate:=0;
  signal.fr_width:=0;
  signal.fr_height:=0;
  signal.prog_count:=0;
  signal.br_count:=0;
  for i:=0 to MAX_NUMBER_OF_PROGRAMS-1 do
  begin
    signal.ProgInfo[i].service_id:=0;
    signal.ProgInfo[i].prov_name:='';
    signal.ProgInfo[i].prog_name:='';
  end;
  for i:=0 to MAX_BITRATE_LIST-1 do
  begin
    signal.Signal_br[i].file_name:='';
    signal.Signal_br[i].start_addr:=0;
    signal.Signal_br[i].length:=0;
    signal.Signal_br[i].leng_bl:=0;
    signal.Signal_br[i].last_bl_leng:=0;
    signal.Signal_br[i].delta_pts:=0;
    signal.Signal_br[i].br:=0;
  end;
  AddFileButton.Enabled:=true;
end;
//------------------------------------------------------------------------------

procedure TForm1.ShowSignal;
var i, j: Integer;
br_info: TSignalBRInfo;
br, br2: double;
st: string;
begin
  //сортировка
  for i:=0 to signal.br_count-2 do
    for j:=i+1 to signal.br_count-1 do
    begin
      br:=1.0*signal.Signal_br[i].length*signal.Signal_br[j].delta_pts;  // чтобы не делить поменял индексы
      br2:=1.0*signal.Signal_br[j].length*signal.Signal_br[i].delta_pts; // получаю не битрейт, а величины им пропорциональные, для сравнения
      if br > br2 then
      begin
        br_info:=signal.Signal_br[i];
        signal.Signal_br[i]:=signal.Signal_br[j];
        signal.Signal_br[j]:=br_info;
      end;
    end;

  ListBox1.Clear;
  for i:=0 to signal.br_count-1 do
  begin
    st:='delta_pts='+IntToStr(signal.Signal_br[i].delta_pts)+' - ';
    if signal.Signal_br[i].delta_pts>0 then
    begin
      br:=signal.Signal_br[i].length*8.0*90000/signal.Signal_br[i].delta_pts;
      st:=st+FloatToStrF(br/1e6, FFFixed, 9,6)+' Мбит/с'
    end;
    st:=st+' - '+ExtractFileName(signal.Signal_br[i].file_name);
    ListBox1.Items.Add(st);
  end;

  ListBox2.Clear;
  for i:=0 to signal.prog_count-1 do
  begin
    ListBox2.Items.Add(IntToStr(signal.ProgInfo[i].service_id));
  end;

{  i:=(signal.sig_id shr 24)and $0f;
  if i>=ComboBox1.Items.Count then i:=ComboBox1.Items.Count-1;
  ComboBox1.ItemIndex:=i;   }

//  i:=(signal.sig_id shr 28)and $0f;
  i:=signal.sig_id_type;
  if i>=ComboBox2.Items.Count then i:=ComboBox2.Items.Count-1;
  ComboBox2.ItemIndex:=i;

  Edit3.Text:=IntToStr(signal.sig_id_num);

  Edit1.Text:=signal.name;

  ListBox1Click(nil);
end;
//------------------------------------------------------------------------------
procedure TForm1.SaveSignal(FileName: string);
var
ini: TIniFile;
i: integer;
sect_name: string;
test: int64;
begin
  i:=TestSigId(signal.sig_id_num, signal.name);
  if i=0 then RegisterSigId(signal.sig_id_num, signal.name);
  if i=1 then
  begin
    i:=MessageDlg('ID зарегистрирован в базе для другого сигнала. Найти другой, свободный ID(Yes), '+
      'нет, оставить этот и изменить для него имя сигнала(No) или отменить сохранение(Cancel)?' ,
      mtConfirmation, [mbYes, mbNo, mbCancel], 0, mbYes);
    if i = IDCancel then exit;
    if i = IDYes then signal.sig_id_num:=GetNewSigId;
    RegisterSigId(signal.sig_id_num, signal.name);
  end;


  ini:=TIniFile.Create(FileName);

  sect_name:='-------------- main --------------';
  ini.WriteString(sect_name, 'name', signal.name);
  ini.WriteInteger(sect_name, 'sig_id_type', signal.sig_id_type and $0f);
  ini.WriteInteger(sect_name, 'sig_id_num', signal.sig_id_num and $00ffffff);
  ini.WriteInteger(sect_name, 'prog_count', signal.prog_count);
  ini.WriteInteger(sect_name, 'br_count', signal.br_count);
  if (signal.sig_id_type and $0f)<8 then
  begin
    ini.WriteBool(sect_name, 'no_change_br', (signal.flags and SIG_FLAG_NO_CHANGE_BR)>0);
    ini.WriteBool(sect_name, 'no_correct_pcr', (signal.flags and SIG_FLAG_NO_CORRECT_PCR)>0);
    ini.WriteBool(sect_name, 'no_insert_null_pack', (signal.flags and SIG_FLAG_NO_INSERT_NULL_PACK)>0);
  end
  else
  begin
    ini.WriteBool(sect_name, 'sdi_pack', (signal.flags and SIG_FLAG_SDI_PACK)>0);
  end;

  sect_name:='-------------- mpeg --------------';
  ini.WriteInteger(sect_name, 'min_br', signal.min_br);
  ini.WriteInteger(sect_name, 'table_pres', signal.table_pres);

  sect_name:='-------------- sdi --------------';
  ini.WriteInteger(sect_name, 'discr_format', signal.discr_format);
  ini.WriteInteger(sect_name, 'frame_rate', signal.frame_rate);
  ini.WriteInteger(sect_name, 'fr_width', signal.fr_width);
  ini.WriteInteger(sect_name, 'fr_height', signal.fr_height);

  for i:=0 to signal.prog_count-1 do
  begin
    sect_name:='-------------- program_'+IntToStr(i+1)+' --------------';
    ini.WriteInteger(sect_name, 'service_id', signal.ProgInfo[i].service_id);
    ini.WriteString(sect_name, 'prov_name', signal.ProgInfo[i].prov_name);
    ini.WriteString(sect_name, 'prog_name', signal.ProgInfo[i].prog_name);
  end;

//  test:=$500000007;
//  ini.WriteInteger('test', 'length_hi', test div $100000000);
//  ini.WriteInteger('test', 'length_lo', test and $ffffffff);
  for i:=0 to signal.br_count-1 do
  begin
    sect_name:='-------------- br_info_'+IntToStr(i+1)+' --------------';
    ini.WriteString(sect_name, 'file_name', signal.Signal_br[i].file_name);
    ini.WriteInteger(sect_name, 'length_hi', signal.Signal_br[i].length div $100000000);
    ini.WriteInteger(sect_name, 'length_lo', signal.Signal_br[i].length and $ffffffff);
    ini.WriteInteger(sect_name, 'delta_pts', signal.Signal_br[i].delta_pts);
    ini.WriteInteger(sect_name, 'bitrate', signal.Signal_br[i].br);
  end;

  ini.Destroy;
end;
//------------------------------------------------------------------------------
procedure TForm1.LoadSignal(FileName: string);
var
ini: TIniFile;
i: integer;
sect_name: string;
leng: int64;
flags: byte;
begin
  ini:=TIniFile.Create(FileName);

  sect_name:='-------------- main --------------';
  signal.name:=ini.ReadString(sect_name, 'name', '');
  signal.sig_id_type:=ini.ReadInteger(sect_name, 'sig_id_type', 0) and $0f;
  signal.sig_id_num:=ini.ReadInteger(sect_name, 'sig_id_num', 0)and $00ffffff;
  if signal.sig_id_num=0 then
  begin
    Memo1.Lines.Add('ID равен нулю, получаем другой');
    signal.sig_id_num:=GetNewSigId;
  end;

  signal.prog_count:=ini.ReadInteger(sect_name, 'prog_count', 0);
  signal.br_count:=ini.ReadInteger(sect_name, 'br_count', 0);

  flags:=0;
  if (signal.sig_id_type and $0f)<8 then
  begin
    if ini.ReadBool(sect_name, 'no_change_br', false) then
      flags:=flags or SIG_FLAG_NO_CHANGE_BR;
    if ini.ReadBool(sect_name, 'no_correct_pcr', false) then
      flags:=flags or SIG_FLAG_NO_CORRECT_PCR;
    if ini.ReadBool(sect_name, 'no_insert_null_pack', false) then
      flags:=flags or SIG_FLAG_NO_INSERT_NULL_PACK;
  end
  else
  begin
    if ini.ReadBool(sect_name, 'sdi_pack', false) then
      flags:=flags or SIG_FLAG_SDI_PACK;
  end;
  signal.flags:=flags;

  sect_name:='-------------- mpeg --------------';
  signal.min_br:=ini.ReadInteger(sect_name, 'min_br', 0);
  signal.table_pres:=ini.ReadInteger(sect_name, 'table_pres', 0);

  sect_name:='-------------- sdi --------------';
  signal.discr_format:=ini.ReadInteger(sect_name, 'discr_format', 0);
  signal.frame_rate:=ini.ReadInteger(sect_name, 'frame_rate', 0);
  signal.fr_width:=ini.ReadInteger(sect_name, 'fr_width', 0);
  signal.fr_height:=ini.ReadInteger(sect_name, 'fr_height', 0);

  for i:=0 to signal.prog_count-1 do
  begin
    sect_name:='-------------- program_'+IntToStr(i+1)+' --------------';
    signal.ProgInfo[i].service_id:=ini.ReadInteger(sect_name, 'service_id', 0);
    signal.ProgInfo[i].prov_name:=ini.ReadString(sect_name, 'prov_name', '');
    signal.ProgInfo[i].prog_name:=ini.ReadString(sect_name, 'prog_name', '');
  end;

  for i:=0 to signal.br_count-1 do
  begin
    sect_name:='-------------- br_info_'+IntToStr(i+1)+' --------------';
    signal.Signal_br[i].file_name:=ini.ReadString(sect_name, 'file_name', '');
    leng:=ini.ReadInteger(sect_name, 'length_hi', 0)*$100000000;
    leng:=leng+ini.ReadInteger(sect_name, 'length_lo', 0);
    signal.Signal_br[i].length:=leng;
    signal.Signal_br[i].delta_pts:=ini.ReadInteger(sect_name, 'delta_pts', 0);
    signal.Signal_br[i].br:=ini.ReadInteger(sect_name, 'bitrate', 0);
  end;

  ini.Destroy;

//  Edit1.Text:=signal.name;
  if signal.sig_id_type<ComboBox2.Items.Count then
    ComboBox2.ItemIndex:=signal.sig_id_type;

  SignalFileName:=FileName;
  caption:='Создание описателей сигналов для  Г-420 - '+SignalFileName;
  ShowSignal;
end;
//------------------------------------------------------------------------------
// получает первый не используемый номер, но в базу не заносит
function TForm1.GetNewSigId: dword;
var bd: TIniFile;
last, i: integer;
st: string;
begin
  bd:=TIniFile.Create(cur_dir+'\'+DATA_BASE_FILE_NAME);
  last:=bd.ReadInteger('main', 'last_sig_id', 0);
  result:=0;
  for i:=1 to last do
  begin
    st:=bd.ReadString('sig_id_list', 'sig_id_'+IntToStr(i), '_NoSigId_');
    if st='_NoSigId_' then
    begin
      result:=i; break;
    end;
  end;
  while result=0 do
  begin
    inc(last);
    st:=bd.ReadString('sig_id_list', 'sig_id_'+IntToStr(last), '_NoSigId_');
    if st='_NoSigId_' then result:=last;
  end;
  bd.Destroy;
end;
//------------------------------------------------------------------------------
// 0 - номера нет в базе; 1 - номер есть, но имя не совпадает; 2 - номер есть, имя совпадает
function TForm1.TestSigId(sig_id: dword; sig_name: string):integer;
var bd: TIniFile;
st: string;
begin
  bd:=TIniFile.Create(cur_dir+'\'+DATA_BASE_FILE_NAME);
  st:=bd.ReadString('sig_id_list', 'sig_id_'+IntToStr(sig_id), '_NoSigId_');
  if st='_NoSigId_' then result:=0
  else if st=sig_name then result:=2
  else result:=1;

  bd.Destroy;
end;
//------------------------------------------------------------------------------
// записываем в базу новый номер, и если он больше последнего, увеличиваем последний
procedure TForm1.RegisterSigId(sig_id: dword; sig_name: string);
var bd: TIniFile;
last, i: integer;
begin
  bd:=TIniFile.Create(cur_dir+'\'+DATA_BASE_FILE_NAME);
  last:=bd.ReadInteger('main', 'last_sig_id', 0);
  if sig_id>last then
    bd.WriteInteger('main', 'last_sig_id', sig_id);
  bd.WriteString('sig_id_list', 'sig_id_'+IntToStr(sig_id), sig_name);
  bd.Destroy;
end;
//------------------------------------------------------------------------------

end.
