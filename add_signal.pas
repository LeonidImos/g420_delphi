unit add_signal;

interface

uses
  const_type,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, inifiles;

const BUF_SIZE = 8192; // в пакетах

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
  end;

  TAddSigmalForm = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    NameEdit: TEdit;
    AddSigButton: TButton;
    OpenDialog1: TOpenDialog;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    StatusPanel: TPanel;
    SigListCbB: TComboBox;
    vt: TLabel;
    Label5: TLabel;
    SigTypeCbB: TComboBox;
    Label2: TLabel;
    IDEdit: TEdit;
    procedure AddSigButtonClick(Sender: TObject);
//    procedure Button3Click(Sender: TObject);
//    procedure ListBox1Click(Sender: TObject);
//    procedure Button4Click(Sender: TObject);
//    procedure Button2Click(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SigListCbBChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ArrTS: array[0..BUF_SIZE-1]of TTransportPaket;
    pat_ok: boolean;
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
    packet_count: int64;
    table_pres: word;
    sig_type: integer;  // (mpeg1=0, mpeg2=1, mpeg4=2, avc=3, sdi=8, hdsdi=9)
//    procedure AddSdiFile(FileName: string);
//    procedure AddMpegFile(FileName: string);
//    procedure ClearAnalise;
//    procedure Analise(count: integer);
//    procedure AnalisePAT(ind, ofs: integer);
//    procedure AnalisePMT(ind, ofs: integer);
//    procedure PostAnalise(fileName: string);
    procedure LoadSignal(FileName: string);
    procedure ShowSignal;
  public
    { Public declarations }
    list_item: TSignalListItem3;
//    SignalFileName: string;
    procedure ShowSignalWindow;
  end;

var
  AddSigmalForm: TAddSigmalForm;

implementation

{$R *.dfm}
//******************************************************************************
procedure TAddSigmalForm.OKBitBtnClick(Sender: TObject);
begin
  list_item.signal.name:=NameEdit.Text;
end;
//------------------------------------------------------------------------------

procedure TAddSigmalForm.AddSigButtonClick(Sender: TObject);
var ext, filename: string;
begin
  if OpenDialog1.Execute then
  begin
    filename:=LowerCase(OpenDialog1.FileName);
{    ext:=ExtractFileExt(filename);
//    filename:=ExtractFileName(OpenDialog1.FileName);

    if ext='.cnf' then
    begin
      Delete(filename, Length(filename)-Length(ext), 255);
      filename:=filename+'.m2t';
      ext:='.m2t';
    end;  }
    LoadSignal(filename);
//    if ext='.m2t' then AddMpegFile(filename) else AddSdiFile(filename);
  end;
end;
//------------------------------------------------------------------------------
{procedure TAddSigmalForm.Button2Click(Sender: TObject);
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
end;   }

//------------------------------------------------------------------------------
{procedure TAddSigmalForm.Button3Click(Sender: TObject);
begin
  Memo1.Clear;
end; }
//------------------------------------------------------------------------------

{procedure TAddSigmalForm.Button4Click(Sender: TObject);
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
end;    }

//------------------------------------------------------------------------------
{procedure TAddSigmalForm.AddSdiFile(FileName: string);
var fl: file;
size: int64;
begin
  AssignFile(fl, FileName);
  ReSet(fl, 1);
  size:=FileSize(fl);
  signal.sig_id:=((ComboBox1.ItemIndex and $0f) shl 24) + ((8) shl 28);
  signal.prog_count:=0;
  signal.br_count:=1;
  signal.Signal_br[0].file_name:=FileName;
  signal.Signal_br[0].length:=size;
  CloseFile(fl);
  ShowSignal;
end;
//------------------------------------------------------------------------------

procedure TAddSigmalForm.AddMpegFile(FileName: string);
var fl: file;
size: int64;
part_size: integer;
begin
  ClearAnalise;
  AssignFile(fl, FileName);
  ReSet(fl, SizeOf(TTransportPaket));
  size:=FileSize(fl);
  packet_count:=size;
  while(size>0)do
  begin
    if size>BUF_SIZE then part_size:=BUF_SIZE else part_size:=size;
    BlockRead(fl, ArrTS[0], part_size);
    Analise(part_size);
    dec(size, part_size);
    inc(cur_packet, part_size);
  end;
  CloseFile(fl);
  PostAnalise(filename);
end;
//------------------------------------------------------------------------------
procedure TAddSigmalForm.ClearAnalise;
var
  i: Integer;
begin
  pat_ok:=false;
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
end;    }
//------------------------------------------------------------------------------
procedure TAddSigmalForm.SigListCbBChange(Sender: TObject);
begin
//  signal.sig_id:=(signal.sig_id and $00ffffff) + (dword(ComboBox1.ItemIndex and $0f) shl 24) +
//    (dword(ComboBox2.ItemIndex and $0f) shl 28);
  list_item.sig_id_list:=dword(SigListCbB.ItemIndex and $0f);
end;

//------------------------------------------------------------------------------
procedure TAddSigmalForm.NameEditChange(Sender: TObject);
begin
  if NameEdit.Text='' then
  begin
    NameEdit.Color:=$8080ff;
    OKBitBtn.Enabled:=false;
  end
  else
  begin
    NameEdit.Color:=clWindow;
    OKBitBtn.Enabled:=true;
  end;
end;

//------------------------------------------------------------------------------

{procedure TAddSigmalForm.ListBox1Click(Sender: TObject);
var ind: integer;
begin
  ind:=ListBox1.ItemIndex;
  if ind>=0 then
  begin
    Button4.Enabled:=true;
    Button2.Enabled:=true;
    Edit2.Text:=IntToStr(signal.Signal_br[ind].delta_pts);
  end
  else
  begin
    Button4.Enabled:=false;
    Button2.Enabled:=false;
  end;
end;  }

//------------------------------------------------------------------------------
(*procedure TAddSigmalForm.Analise(count: integer);
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
 //       st:='DTS='+IntToStr(dts);

        dts_ind:=dts_index[pid];
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
//            st:=st+' ('+IntToStr(delta_dts)+')';
          end;

        end;
 //       Memo1.Lines.Add(st);

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
            $40: table_pres:=table_pres or $0010; // NIT_actual
            $41: table_pres:=table_pres or $0020; // NIT_other
            $42: table_pres:=table_pres or $0040; // SDT_actual

            $46: table_pres:=table_pres or $0080; // SDT_other
            $4a: table_pres:=table_pres or $0100; // BAT
            $4e: table_pres:=table_pres or $0200; // EIT_actual_present
            $4f: table_pres:=table_pres or $0400; // EIT_other_present
            $50..$5f: table_pres:=table_pres or $0800; // EIT_actual_schedule
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
procedure TAddSigmalForm.AnalisePAT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, i, program_number, program_map_PID: integer;
begin
  if pat_ok then exit;

  pArr:=@ArrTS[ind].arr[ofs];
  pat_ok:=true;
  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if (sect_leng>(188-ofs))or(sect_leng<12) then exit;

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
      inc(prog_count);
    end;
    dec(leng,4); inc(i,4);
  end;

end;
//------------------------------------------------------------------------------
procedure TAddSigmalForm.AnalisePMT(ind, ofs: integer);
var pArr: PTPArr;
sect_leng, leng, i, stream_type, type_ind: integer;
begin
  pArr:=@ArrTS[ind].arr[ofs];

  sect_leng:=((pArr[1]and $0f)shl 8) + pArr[2] + 3;
  if sect_leng<14 then exit;
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
//------------------------------------------------------------------------------
procedure TAddSigmalForm.PostAnalise(fileName: string);
var frame_count, br_ind, i, j: integer;
delta_pts: dword;
st, st2: string;
err_sig, found: boolean;
ppm, br, br2: double;
begin
  Memo1.Lines.Add('---- Добавили файл '+ExtractFileName(fileName)+' -----');
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
          if prog_num[i]=signal.ProgInfo[j].service_id then found:=true;
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
    signal.ProgInfo[i].service_id:=prog_num[i];

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
//  signal.sig_id:=((ComboBox1.ItemIndex and $0f) shl 24) + ((sig_type and $0f) shl 28);
  signal.sig_id_type:=sig_type and $0f;
  signal.sig_id_list:=ComboBox1.ItemIndex and $0f;


  ShowSignal;

//  st:=st+IntToStr(frame_count)+' кадров; BR='+FloatToStrF(br/1e6, FFFixed, 9,6)+' Мбит/с';
  Memo1.Lines.Add(IntToStr(frame_count)+' кадров; BR='+FloatToStrF(br/1e6, FFFixed, 9,6)+' Мбит/с; '+
    IntToStr(packet_count)+' пакетов; table_pres=0x'+IntToHex(table_pres, 4)+'; число программ='+IntToStr(prog_count));

  if err_sig then StatusPanel.Color:=$8080ff else StatusPanel.Color:=clBtnFace;
  StatusPanel.Caption:=st;
  Edit2.Text:=IntToStr(delta_pts);

end; *)
//------------------------------------------------------------------------------
procedure TAddSigmalForm.ShowSignal;
var i, j: Integer;
br_info: TSignalBRInfo;
br, br2: double;
st: string;
begin
  //сортировка
  for i:=0 to list_item.signal.br_count-2 do
    for j:=i+1 to list_item.signal.br_count-1 do
    begin
      br:=1.0*list_item.signal.Signal_br[i].length*list_item.signal.Signal_br[j].delta_pts;  // чтобы не делить поменял индексы
      br2:=1.0*list_item.signal.Signal_br[j].length*list_item.signal.Signal_br[i].delta_pts; // получаю не битрейт, а величины им пропорциональные, для сравнения
      if br > br2 then
      begin
        br_info:=list_item.signal.Signal_br[i];
        list_item.signal.Signal_br[i]:=list_item.signal.Signal_br[j];
        list_item.signal.Signal_br[j]:=br_info;
      end;
    end;

  ListBox1.Clear;
  for i:=0 to list_item.signal.br_count-1 do
  begin
    st:='delta_pts='+IntToStr(list_item.signal.Signal_br[i].delta_pts)+' - ';
    if list_item.signal.Signal_br[i].delta_pts>0 then
    begin
      br:=list_item.signal.Signal_br[i].length*8.0*90000/list_item.signal.Signal_br[i].delta_pts;
      st:=st+FloatToStrF(br/1e6, FFFixed, 9,6)+' Мбит/с'
    end;
    st:=st+' - '+ExtractFileName(list_item.signal.Signal_br[i].file_name);
    ListBox1.Items.Add(st);
  end;

  {ListBox2.Clear;
  for i:=0 to signal.prog_count-1 do
  begin
    ListBox2.Items.Add(IntToStr(signal.ProgInfo[i].service_id));
  end;  }

  i:=list_item.sig_id_list and $0f;
  if i>=SigListCbB.Items.Count then i:=SigListCbB.Items.Count-1;
  SigListCbB.ItemIndex:=i;

  i:=list_item.signal.sig_id_type and $0f;
  if i>=SigTypeCbB.Items.Count then i:=SigTypeCbB.Items.Count-1;
  SigTypeCbB.ItemIndex:=i;

  IDEdit.Text:=IntToStr(list_item.signal.sig_id_num);

  NameEdit.Text:=list_item.signal.name;


  //ListBox1Click(nil);
end;
//------------------------------------------------------------------------------
procedure TAddSigmalForm.FormCreate(Sender: TObject);
begin
  SigListCbB.ItemIndex:=0;
end;
//------------------------------------------------------------------------------

procedure TAddSigmalForm.LoadSignal(FileName: string);
var
ini: TIniFile;
i: integer;
sect_name: string;
leng: int64;
flags: byte;
begin
  ini:=TIniFile.Create(FileName);

  sect_name:='-------------- main --------------';
  list_item.signal.name:=ini.ReadString(sect_name, 'name', '');
  list_item.signal.sig_id_type:=ini.ReadInteger(sect_name, 'sig_id_type', 0) and $0f;
  list_item.signal.sig_id_num:=ini.ReadInteger(sect_name, 'sig_id_num', 0)and $00ffffff;
{  if signal.sig_id_num=0 then
  begin
    Memo1.Lines.Add('ID равен нулю, получаем другой');
    signal.sig_id_num:=GetNewSigId;
  end;  }

  list_item.signal.prog_count:=ini.ReadInteger(sect_name, 'prog_count', 0);
  list_item.signal.br_count:=ini.ReadInteger(sect_name, 'br_count', 0);

  flags:=0;
  if (list_item.signal.sig_id_type and $0f)<8 then
  begin
    if ini.ReadBool(sect_name, 'no_change_br', false) then
      flags:=flags or SIG_FLAG_NO_CHANGE_BR;
    if ini.ReadBool(sect_name, 'no_correct_pcr', false) then
      flags:=flags or SIG_FLAG_NO_CORRECT_PCR;
  end
  else
  begin
    if ini.ReadBool(sect_name, 'sdi_pack', false) then
      flags:=flags or SIG_FLAG_SDI_PACK;
  end;
  list_item.signal.flags:=flags;

  sect_name:='-------------- mpeg --------------';
  list_item.signal.min_br:=ini.ReadInteger(sect_name, 'min_br', 0);
  list_item.signal.table_pres:=ini.ReadInteger(sect_name, 'table_pres', 0);

  sect_name:='-------------- sdi --------------';
  list_item.signal.discr_format:=ini.ReadInteger(sect_name, 'discr_format', 0);
  list_item.signal.frame_rate:=ini.ReadInteger(sect_name, 'frame_rate', 0);
  list_item.signal.fr_width:=ini.ReadInteger(sect_name, 'fr_width', 0);
  list_item.signal.fr_height:=ini.ReadInteger(sect_name, 'fr_height', 0);

  for i:=0 to list_item.signal.prog_count-1 do
  begin
    sect_name:='-------------- program_'+IntToStr(i+1)+' --------------';
    list_item.signal.ProgInfo[i].service_id:=ini.ReadInteger(sect_name, 'service_id', 0);
    list_item.signal.ProgInfo[i].prov_name:=ini.ReadString(sect_name, 'prov_name', '');
    list_item.signal.ProgInfo[i].prog_name:=ini.ReadString(sect_name, 'prog_name', '');
  end;

  for i:=0 to list_item.signal.br_count-1 do
  begin
    sect_name:='-------------- br_info_'+IntToStr(i+1)+' --------------';
    list_item.signal.Signal_br[i].file_name:=ini.ReadString(sect_name, 'file_name', '');
    leng:=ini.ReadInteger(sect_name, 'length_hi', 0)*$100000000;
    leng:=leng+ini.ReadInteger(sect_name, 'length_lo', 0);
    list_item.signal.Signal_br[i].length:=leng;
    list_item.signal.Signal_br[i].delta_pts:=ini.ReadInteger(sect_name, 'delta_pts', 0);
    list_item.signal.Signal_br[i].br:=ini.ReadInteger(sect_name, 'bitrate', 0);
  end;

  ini.Destroy;

//  Edit1.Text:=signal.name;
  if list_item.signal.sig_id_type<SigTypeCbB.Items.Count then
    SigTypeCbB.ItemIndex:=list_item.signal.sig_id_type;

  list_item.SigFileName:=FileName;
  caption:='Файл - '+FileName;
  ShowSignal;
end;
//------------------------------------------------------------------------------
procedure TAddSigmalForm.ShowSignalWindow;
begin
  if list_item.SigFileName='' then ShowSignal
  else LoadSignal(list_item.SigFileName);

end;
//------------------------------------------------------------------------------

end.
