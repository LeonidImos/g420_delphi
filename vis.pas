unit vis;

interface

uses
  MySockets, const_type,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ExtCtrls, IniFiles, Buttons, ImgList, ComCtrls;

type

  TVisForm = class(TForm)
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    g420_filename_dsp11_edit: TEdit;
    g420_dsp11Button: TButton;
    g420_dsp_StatusPanel: TPanel;
    g420_dsp_RestartChB: TCheckBox;
    g420_filename_dsp12_edit: TEdit;
    g420_dsp12Button: TButton;
    g420_filename_dsp21_edit: TEdit;
    g420_dsp21Button: TButton;
    GroupBox6: TGroupBox;
    g420logChB: TCheckBox;
    G420loopChB: TCheckBox;
    ConnectEdit: TEdit;
    ConnectButton: TButton;
    ConnectStatusPanel: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    MemoClearButton: TButton;
    MemoCopyButton: TButton;
    DeviceErrorChB: TCheckBox;
    g420OpenDialog: TOpenDialog;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    g420_filename_sd1_edit: TEdit;
    g420_sd1Button: TButton;
    Label1: TLabel;
    g420_bitrateEdit: TEdit;
    Label19: TLabel;
    g420_StartAddrEdit: TEdit;
    IncrChB: TCheckBox;
    Label20: TLabel;
    g420_blockCount_SpinEdit: TSpinEdit;
    g420_playModeCbB: TComboBox;
    g420_startButton: TBitBtn;
    g420_stopButton: TBitBtn;
    Panel4: TPanel;
    ListBox1: TListBox;
    Panel5: TPanel;
    g420_sd_StatusPanel: TPanel;
    SaveDialog: TSaveDialog;
    GroupBox1: TGroupBox;
    ProgSigChB: TCheckBox;
    ListProgButton: TButton;
    g420_sd_CbB: TComboBox;
    GroupBox2: TGroupBox;
    SigAddButton: TButton;
    SigEditButton: TButton;
    SigDelButton: TButton;
    SigPlayButton: TButton;
    GroupBox4: TGroupBox;
    ListSaveButton: TButton;
    ListOpenButton: TButton;
    ListClearButton: TButton;
    ListReadButton: TButton;
    Label2: TLabel;
    g420_bitrateOutEdit: TEdit;
    Edit1: TEdit;
    Button9: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure MemoClearButtonClick(Sender: TObject);
    procedure MemoCopyButtonClick(Sender: TObject);
    procedure g420_dsp11ButtonClick(Sender: TObject);
    procedure g420_allChBClick(Sender: TObject);
    procedure g420_dsp12ButtonClick(Sender: TObject);
    procedure g420_dsp21ButtonClick(Sender: TObject);
    procedure g420_sd1ButtonClick(Sender: TObject);
//    procedure g420_sd2ButtonClick(Sender: TObject);
//    procedure g420_sd3ButtonClick(Sender: TObject);
//    procedure g420_sd4ButtonClick(Sender: TObject);
    procedure g420_filename_editDblClick(Sender: TObject);
    procedure g420_StartAddrEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure g420_bitrateEditChange(Sender: TObject);
    procedure g420_bitrateOutEditChange(Sender: TObject);
    procedure g420_startButtonClick(Sender: TObject);
    procedure g420_stopButtonClick(Sender: TObject);
    procedure SigAddButtonClick(Sender: TObject);
    procedure SigEditButtonClick(Sender: TObject);
    procedure SigDelButtonClick(Sender: TObject);
    procedure ListSaveButtonClick(Sender: TObject);
    procedure ListOpenButtonClick(Sender: TObject);
    procedure ListProgButtonClick(Sender: TObject);
    procedure SigPlayButtonClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ListClearButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    MyClientSocket: TMyClientSocket;
    IdleSleepTime: TDateTime;
    ConnectState: integer;
    ArrIn: TarrTCP;
    ArrInPos: integer;
    mess: TMessOut;
    factory_num: word;
    ver_device: word;
    SendDeviceInfoTime: TDateTime; // время следующей посылки запроса DeviceInfo
    SendStatusTime: TDateTime;     // время следующей посылки запроса Status
    TestFilesTime: TDateTime;
    FileTime: array[0..3]of dword;
    FileCheckSum: array[0..3]of byte;
    G420FileStruct: TG420FileStruct;
    save_last_block: dword;
    CurDir: string;
    CurIniFileName: string;
    first_show: boolean;
    wath_dog: integer;
    SignalList: array of TSignalListItem3;
    ProgList: array[0..G420_MAX_PROG_LIST-1]of TProgItem;
    ProgListCount: integer;
    request_id: word;
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);
    function EventConnect(CurTime: TDateTime): boolean;
    function EventSendTimer(CurTime: TDateTime): boolean;
    function EventTestFiles(CurTime: TDateTime): boolean;
    function EventSocketRead: boolean;
    function FindFirst(i1,i2:integer):integer;
    function GetLengMess(p:integer):integer;
    procedure GetMess(p,leng_mess:integer; const ArrIn: TarrTCP);
    function SendCommand(target_id,comand,count: word; P_param: PArrWord):boolean;
    function SendCommandSys(target_id,comand:word): boolean;
    function SendCommandSysParam(target_id,comand,param:word): boolean;
    function SendCommandDSP(target_id,comand,count: word; P_param: PArrWord; req_id_force: word = $ffff): word;
    procedure SendCommandDSP_continue(target_id,comand, block_length: word; start_addr: dword; P_param: PArrWord; req_id_force: word);
    function SendCommandDSP2(target_id,comand,count,param1,param2: word): word;
    procedure ReceiveDeviceInfo(p,leng:integer; const ArrIn: TarrTCP);
    procedure ReceiveSysError(p,leng:integer; const ArrIn: TarrTCP);
    procedure ReceiveProgArrStatus(p,leng:integer; const ArrIn: TarrTCP);
    procedure ReceiveStatus(p:integer; const ArrIn: TarrTCP);
    function Strg(format: byte; Value: int64; Digits: integer; DecAllign: boolean = false): string;
    function IntToBin(Value: cardinal): string;
    function CurTimeFine: string;
    procedure EnCrypt16(pass: string; var arr: tPassword);
    function DeCrypt16(arr: tPassword): string;
    procedure SaveToFile;
    procedure LoadFromFileWindow;
    procedure LoadFromFile;
    function  g420_get_start_addr(mess_en: boolean): integer;
    function  g420_get_bitrate(mess_en: boolean): integer;
    function  g420_get_bitrate_out(mess_en: boolean): integer;
    procedure g420_Start_send(FileName: string; device, param, group: byte; panel: TPanel; start_addr: int64);
    procedure g420_send_next_DSP;
    procedure g420_send_next_SD;
    procedure g420_receive(Item: PG420ReceiveMess);
    function g420_test_receive_error(Item: PG420ReceiveMess): boolean;
    procedure g420_TestTime(t: TDateTime);
    procedure ShowSignalList;
    function PrepareListSignal: integer;
  public
    { Public declarations }
  end;

var
  VisForm: TVisForm;

implementation

uses add_signal;

{$R *.dfm}
//******************************************************************************


procedure TVisForm.FormCreate(Sender: TObject);
begin
  MyClientSocket:=TMyClientSocket.Create(nil);
  ConnectState:=0;
  IdleSleepTime:=now+100/(24*3600*1000); // 100 ms
  SendDeviceInfoTime:=IdleSleepTime;
  SendStatusTime:=IdleSleepTime;
  CurDir:=GetCurrentDir;
  CurIniFileName:=CurDir+'\g420_prog.ini';
  first_show:=true;
  LoadFromFile;
  Application.OnIdle:=ApplicationIdle;
  ProgListCount:=0;
  request_id:=1;
end;
//------------------------------------------------------------------------------
procedure TVisForm.FormDestroy(Sender: TObject);
begin
  Application.OnIdle:=nil;
  SaveToFile;
  MyClientSocket.Destroy;
end;
//------------------------------------------------------------------------------
procedure TVisForm.FormActivate(Sender: TObject);
begin
  if first_show then
  begin
    LoadFromFileWindow;
    first_show:=false;
  end;

end;
//------------------------------------------------------------------------------
procedure TVisForm.MemoClearButtonClick(Sender: TObject);
begin
  Memo1.Clear;
end;
//------------------------------------------------------------------------------
procedure TVisForm.MemoCopyButtonClick(Sender: TObject);
begin
  Memo1.SelectAll;
  Memo1.CopyToClipboard;
end;

//------------------------------------------------------------------------------

procedure TVisForm.SigAddButtonClick(Sender: TObject);
var leng: integer;
begin
  AddSigmalForm.list_item.signal.name:='';
  AddSigmalForm.list_item.signal.sig_id_type:=0;
  AddSigmalForm.list_item.sig_id_list:=0;
  AddSigmalForm.list_item.signal.sig_id_num:=0;
  AddSigmalForm.list_item.signal.prog_count:=0;
  AddSigmalForm.list_item.signal.br_count:=0;
  AddSigmalForm.list_item.SigFileName:='';
  AddSigmalForm.list_item.sig_id_list:=AddSigmalForm.SigListCbB.ItemIndex;
//  AddSigmalForm.NameEdit.Text:='';
  AddSigmalForm.ShowSignalWindow;
//  AddSigmalForm.Memo1.Clear;
  if (AddSigmalForm.ShowModal=mrOK)and(AddSigmalForm.list_item.signal.br_count>0) then
  begin
    leng:=Length(SignalList);
    SetLength(SignalList, leng+1);
    SignalList[leng]:=AddSigmalForm.list_item;
    PrepareListSignal;
    ShowSignalList;
    if (leng>0)and(leng<ListBox1.Items.Count) then
      ListBox1.ItemIndex:=leng;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.SigEditButtonClick(Sender: TObject);
var ind: integer;
begin
  ind:=ListBox1.ItemIndex;
  if (ind>=0)and(ind<Length(SignalList)) then
  begin
    AddSigmalForm.list_item:=SignalList[ind];
//    AddSigmalForm.signal.SigFileName:=SignalList[ind].SigFileName;
//    AddSigmalForm.NameEdit.Text:=AddSigmalForm.signal.name;
    AddSigmalForm.ShowSignalWindow;
//    AddSigmalForm.Memo1.Clear;
    if (AddSigmalForm.ShowModal=mrOK)and(AddSigmalForm.list_item.signal.br_count>0) then
    begin
      SignalList[ind]:=AddSigmalForm.list_item;
      PrepareListSignal;
      ShowSignalList;
      if (ind>0)and(ind<ListBox1.Items.Count) then
        ListBox1.ItemIndex:=ind;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.ListSaveButtonClick(Sender: TObject);
var ini: TIniFile;
leng, i, j: integer;
sect_name: string;
FileName, ext: string;
begin
  if SaveDialog.Execute then
  begin
    FileName:=SaveDialog.FileName;
    ext:=ExtractFileExt(FileName);
    if LowerCase(ext)<>'.lst' then FileName:=FileName+'.lst';

    ini:=TIniFile.Create(FileName);
    leng:=length(SignalList);
    ini.WriteInteger('main', 'Signal_counter',leng);
    for i:=0 to leng-1 do
    begin
      sect_name:='signal_'+IntToStr(i);
      ini.WriteString(sect_name, 'SigFileName', SignalList[i].SigFileName);
      ini.WriteString(sect_name, 'name', SignalList[i].signal.name);
      ini.WriteInteger(sect_name, 'sig_id_type', SignalList[i].signal.sig_id_type);
      ini.WriteInteger(sect_name, 'sig_id_list', SignalList[i].sig_id_list);
      ini.WriteInteger(sect_name, 'sig_id_num', SignalList[i].signal.sig_id_num);
      ini.WriteInteger(sect_name, 'min_br', SignalList[i].signal.min_br);
      ini.WriteInteger(sect_name, 'table_pres', SignalList[i].signal.table_pres);
      ini.WriteInteger(sect_name, 'prog_count', SignalList[i].signal.prog_count);
      ini.WriteInteger(sect_name, 'br_count', SignalList[i].signal.br_count);
      ini.WriteInteger(sect_name, 'flags', SignalList[i].signal.flags);
      for j:=0 to SignalList[i].signal.prog_count-1 do
      begin
        ini.WriteInteger(sect_name, 'service_id_'+IntToStr(j), SignalList[i].signal.ProgInfo[j].service_id);
      end;
      for j:=0 to SignalList[i].signal.br_count-1 do
      begin
        ini.WriteString(sect_name, 'file_name_'+IntToStr(j), SignalList[i].signal.Signal_br[j].file_name);
        ini.WriteInteger(sect_name, 'start_addr_'+IntToStr(j), SignalList[i].signal.Signal_br[j].start_addr);
        ini.WriteInteger(sect_name, 'length_'+IntToStr(j), SignalList[i].signal.Signal_br[j].length);
        ini.WriteInteger(sect_name, 'delta_pts_'+IntToStr(j), SignalList[i].signal.Signal_br[j].delta_pts);
        ini.WriteInteger(sect_name, 'bitrate_'+IntToStr(j), SignalList[i].signal.Signal_br[j].br);
      end;
    end;
    ini.Destroy;
  end;
end;
//------------------------------------------------------------------------------

procedure TVisForm.ListClearButtonClick(Sender: TObject);
begin
  SetLength(SignalList, 0);
  ShowSignalList;

end;
//------------------------------------------------------------------------------

procedure TVisForm.ListOpenButtonClick(Sender: TObject);
var ini: TIniFile;
leng, i, j: integer;
sect_name: string;
begin
  g420OpenDialog.Filter:='Файлы списка сигналов(*.lst)|*.lst|Все файлы (*.*)|*.*';
  if g420OpenDialog.Execute then
  begin
    ini:=TIniFile.Create(g420OpenDialog.FileName);
    leng:=ini.ReadInteger('main', 'Signal_counter',0);
    SetLength(SignalList, leng);
    for i:=0 to leng-1 do
    begin
      sect_name:='signal_'+IntToStr(i);
      SignalList[i].SigFileName:=ini.ReadString(sect_name, 'SigFileName','');
      SignalList[i].signal.name:=ini.ReadString(sect_name, 'name','unknone');
      SignalList[i].signal.sig_id_type:=ini.ReadInteger(sect_name, 'sig_id_type',0);
      SignalList[i].sig_id_list:=ini.ReadInteger(sect_name, 'sig_id_list',0);
      SignalList[i].signal.sig_id_num:=ini.ReadInteger(sect_name, 'sig_id_num',0);
      SignalList[i].signal.min_br:=ini.ReadInteger(sect_name, 'min_br',0);
      SignalList[i].signal.table_pres:=ini.ReadInteger(sect_name, 'table_pres',0);
      SignalList[i].signal.prog_count:=ini.ReadInteger(sect_name, 'prog_count',0);
      SignalList[i].signal.br_count:=ini.ReadInteger(sect_name, 'br_count',0);
      SignalList[i].signal.flags:=ini.ReadInteger(sect_name, 'flags',0);
      for j:=0 to SignalList[i].signal.prog_count-1 do
      begin
        SignalList[i].signal.ProgInfo[j].service_id:=ini.ReadInteger(sect_name, 'service_id_'+IntToStr(j), 0);
      end;
      for j:=0 to SignalList[i].signal.br_count-1 do
      begin
        SignalList[i].signal.Signal_br[j].file_name:=ini.ReadString(sect_name, 'file_name_'+IntToStr(j), '');
        SignalList[i].signal.Signal_br[j].start_addr:=ini.ReadInteger(sect_name, 'start_addr_'+IntToStr(j), 0);
        SignalList[i].signal.Signal_br[j].length:=ini.ReadInteger(sect_name, 'length_'+IntToStr(j), 0);
        SignalList[i].signal.Signal_br[j].delta_pts:=ini.ReadInteger(sect_name, 'delta_pts_'+IntToStr(j), 0);
        SignalList[i].signal.Signal_br[j].br:=ini.ReadInteger(sect_name, 'bitrate_'+IntToStr(j), 0);
      end;
    end;
    ini.Destroy;
    PrepareListSignal;
    ShowSignalList;
  end;
end;
//------------------------------------------------------------------------------

procedure TVisForm.SigPlayButtonClick(Sender: TObject);
var mess: TG420PlayMess;
{comm,} mode, sd_on, group: byte;
start_addr, bitrate, bitrateout, ostat, i, bi: integer;
ind, leng, sig_type: integer;
FileName: string;
fl: file;
size: int64;
leng_one, block_count_one: int64;
name: AnsiString;
begin
  PrepareListSignal;
  ind:=ListBox1.ItemIndex;
  leng:=Length(SignalList);
  if (ind>=0)and(ind<leng) then
  begin
    case g420_sd_CbB.ItemIndex of
      0: begin sd_on:=1; group:=1; end;
      1: begin sd_on:=2; group:=1; end;
      2: begin sd_on:=4; group:=1; end;
      3: begin sd_on:=8; group:=1; end;
      4: begin sd_on:=3; group:=2; end;
      5: begin sd_on:=12; group:=2; end;
      6: begin sd_on:=15; group:=4; end;
      else exit;
    end;
{    sig_type:=(SignalList[ind].sig_id shr 28) and $0f;
    case sig_type of
      0..7:  begin
               // MPEG в цикле
               comm:=32; mode:=sd_on;
             end;
      8: begin
           // SDI в цикле
           comm:=2; mode:=sd_on;
         end;
      9: begin
           // HD SDI в цикле
           comm:=4; mode:=sd_on;
         end;
      else exit;
    end;     }


    bitrateout:=g420_get_bitrate_out(true);
    if bitrateout<0 then exit;
    if (bitrateout<SignalList[ind].signal.min_br)and(bitrateout<>0) then bitrateout:=SignalList[ind].signal.min_br;
    bi:=0;
    for i:=0 to SignalList[ind].signal.br_count-1 do
    begin
      if bitrateout>SignalList[ind].signal.Signal_br[i].br then
        bi:=i
      else
        break;
    end;
    start_addr:=SignalList[ind].signal.Signal_br[bi].start_addr;
    bitrate:=SignalList[ind].signal.Signal_br[bi].br;
    size:=SignalList[ind].signal.Signal_br[bi].length;

    if (size<1)or(size>$7ffffff0) then
    begin
      g420_sd_StatusPanel.Color:=clYellow;
      g420_sd_StatusPanel.Caption:='Ошибочный размер файла = '+IntToStr(size);
      CloseFile(fl);
      exit;
    end;

    if (size mod group)<>0 then
    begin
      g420_sd_StatusPanel.Color:=clYellow;
      g420_sd_StatusPanel.Caption:='Ошибочный размер файла = '+IntToStr(size);
      Memo1.Lines.Add('размер файла не кратен числу SD карт');
      G420FileStruct.state:=2;
      exit;
    end;
//    block_count_one:=SignalList[ind].Signal_br[bi].leng_bl;
//    ostat:=SignalList[ind].Signal_br[bi].last_bl_leng;
    block_count_one:=0;
    ostat:=0;

    name:=SignalList[ind].signal.name;

    mess.PlayCommand:=254;
//    mess.Mode:=mode;
    mess.Mode:=0;
    mess.sig_id:=SignalList[ind].signal.sig_id_num + ((SignalList[ind].signal.sig_id_type and $0f) shl 28)+
                ((SignalList[ind].sig_id_list and $0f) shl 24);
    mess.StartAdress:=0;
    mess.Length:=0;
    mess.LastBlockBytes:=0;
//    mess.reserve:=0;
    mess.BitRateInput:=0;
    mess.BitRateOutput:=bitrateout;
    for i:=0 to 15 do mess.name[i]:=ord(name[i+1]);

    SendCommand(0, Comand_g420_SetPlayMode, SizeOf(mess) div 2, @mess);

    if g420logChB.Checked then
    begin
      memo1.Lines.Add('--------------------------------');
      memo1.Lines.Add('Размер файла='+IntToStr(size));
      memo1.Lines.Add('PlayCommand='+IntToStr(mess.PlayCommand));
      memo1.Lines.Add('Mode='+IntToStr(mess.Mode));
      memo1.Lines.Add('sig_id='+Strg(fHexDec, mess.sig_id,8));
      memo1.Lines.Add('StartAdress='+Strg(fHexDec, mess.StartAdress,8));
      memo1.Lines.Add('Length='+IntToStr(mess.Length));
      memo1.Lines.Add('LastBlockBytes='+IntToStr(mess.LastBlockBytes));
      memo1.Lines.Add('BitRateInput='+IntToStr(mess.BitRateInput));
      memo1.Lines.Add('BitRateOutput='+IntToStr(mess.BitRateOutput));
      memo1.Lines.Add('name="'+name+'"');
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TVisForm.SigDelButtonClick(Sender: TObject);
var ind, i, leng: integer;
begin
  ind:=ListBox1.ItemIndex;
  leng:=Length(SignalList);
  if (ind>=0)and(ind<leng) then
  begin
    for i:=ind to leng-2 do
      SignalList[i]:=SignalList[i+1];
    SetLength(SignalList, leng-1);
    ShowSignalList;
    if ListBox1.Items.Count>0 then
    begin
      if ind<ListBox1.Items.Count then ListBox1.ItemIndex:=ind
      else ListBox1.ItemIndex:=ListBox1.Items.Count-1;

    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TVisForm.Button1Click(Sender: TObject);
var sig_count, list_count, i: integer;
sig_id: dword;
begin
  sig_count:=Length(SignalList);
  list_count:=AddSigmalForm.SigListCbB.Items.Count;
  Memo1.Clear;
  memo1.Lines.Add('[main]');
  memo1.Lines.Add('signal_count='+IntToStr(sig_count));
  memo1.Lines.Add('list_count='+IntToStr(list_count));
  for i:=0 to list_count-1 do
    memo1.Lines.Add('list_'+IntToStr(i)+'='+AddSigmalForm.SigListCbB.Items[i]);
  for i:=0 to sig_count-1 do
  begin
    memo1.Lines.Add('[signal_'+IntToStr(i)+']');
    memo1.Lines.Add('name='+SignalList[i].signal.name);
{    sig_id:=SignalList[i].signal.sig_id_num +
          ((SignalList[i].sig_id_list and $0f) shl 24)+
          ((SignalList[i].signal.sig_id_type and $0f) shl 28);   }
    memo1.Lines.Add('sig_id_num='+IntToStr(SignalList[i].signal.sig_id_num));
    memo1.Lines.Add('sig_id_type='+IntToStr(SignalList[i].signal.sig_id_type));
    memo1.Lines.Add('list_ind='+IntToStr(SignalList[i].sig_id_list));
  end;

end;
//------------------------------------------------------------------------------
procedure TVisForm.Button2Click(Sender: TObject);
var mess: TG420PlayMess;
begin
//  SendCommandDSP2(1, DSP_Comand_Get_Array, 0,0,0);
  mess.PlayCommand:=100;
  mess.StartAdress:=$400;
  SendCommand(0, Comand_g420_SetPlayMode, SizeOf(mess) div 2, @mess);

end;
//------------------------------------------------------------------------------

procedure TVisForm.Button3Click(Sender: TObject);
var mess: TG420PlayMess;
begin
//  SendCommandDSP2(1, DSP_Comand_Get_Array, 0,0,0);
  mess.PlayCommand:=101;
  mess.StartAdress:=$400;
  SendCommand(0, Comand_g420_SetPlayMode, SizeOf(mess) div 2, @mess);

end;

//------------------------------------------------------------------------------

procedure TVisForm.Button9Click(Sender: TObject);
const ch_cnst: array[0..63]of byte = ($41, $a0, $42, $a1, $e0, $45, $a3, $a4,
                                      $a5, $a6, $4b, $a7, $4d, $48, $4f, $a8,
                                      $50, $43, $54, $a9, $aa, $58, $e1, $ab,
                                      $ac, $e2, $ad, $ae, $62, $af, $b0, $b1,
                                      $61, $b2, $b3, $b4, $e3, $65, $b6, $b7,
                                      $b8, $b9, $ba, $bb, $bc, $bd, $6f, $be,
                                      $70, $63, $bf, $79, $e4, $78, $e5, $c0,
                                      $c1, $e6, $c2, $c3, $c4, $c5, $c6, $c7);
var st: AnsiString;
st2: string;
i: integer;
b, b2: byte;
begin
  st:=Edit1.Text;
  st2:='';
  for i:=1 to Length(st) do
  begin
    b:=ord(st[i]);
    case b of
      $21..$7f: b2:=b;
      $A8: b2:=$a2;
      $B8: b2:=$b5;
      $C0..$FF: b2:=ch_cnst[b-$c0];
      else b2:=$20;
    end;
    st2:=st2+'0x'+IntToHex(b2, 2);
//    if i<>Length(st) then
    st2:=st2+', '
  end;
  st2:=st2+'0x00';
  st2:='['+IntToStr(Length(st)+1)+'] = {'+st2+'};';
  st2:=st2+'  //('+st+')';
  Memo1.Lines.Add(st2);
end;

//------------------------------------------------------------------------------

procedure TVisForm.ConnectButtonClick(Sender: TObject);
begin
  if ConnectButton.Tag>0 then
  begin
    ConnectButton.Tag:=0;
    ConnectButton.Caption:='Установить соединение';
  end
  else
  begin
    ConnectButton.Tag:=1;
    ConnectButton.Caption:='Разорвать соединение';
  end;
end;

//------------------------------------------------------------------------------
procedure TVisForm.ApplicationIdle(Sender: TObject; var Done: Boolean);
var exec: boolean;
CurTime: TDateTime;
begin
  done:=false;
  exec:=false;
  CurTime:=now;

  if EventConnect(CurTime) then exec:=true;
  if EventSocketRead then exec:=true;
  g420_TestTime(CurTime);

  if G420FileStruct.state<>1 then
  begin
    if EventSendTimer(CurTime) then exec:=true;
    if EventTestFiles(CurTime) then exec:=true;

    if exec then IdleSleepTime:=CurTime+100/(24*3600*1000)
    else if CurTime>IdleSleepTime then
    begin
      done:=true;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TVisForm.EventConnect(CurTime: TDateTime): boolean;
var new_active: boolean;
new_state: integer;
begin
  result:=false;
  new_active:=ConnectButton.Tag>0;

  if (MyClientSocket.RemoteHost<>ConnectEdit.Text)or
     (MyClientSocket.RemotePort<>'2030') then
  begin
    MyClientSocket.Active:=false;
    MyClientSocket.RemoteHost:=ConnectEdit.Text;
    MyClientSocket.RemotePort:='2030';
  end;

  if new_active<>MyClientSocket.Active then
    MyClientSocket.Active:=new_active;

  if not MyClientSocket.Connected then factory_num:=0;

  new_state:=0;
  if MyClientSocket.Active then
  begin
    new_state:=1;
    if MyClientSocket.Connected then
    begin
      new_state:=2;
      if factory_num>0 then
      begin
        new_state:=3;

      end;
    end;
  end;

  g420_dsp11Button.Enabled:=(new_state=3);
  g420_dsp12Button.Enabled:=(new_state=3);
  g420_dsp21Button.Enabled:=(new_state=3);
  g420_sd1Button.Enabled:=(new_state=3);
  g420_startButton.Enabled:=(new_state=3);
  g420_stopButton.Enabled:=(new_state=3);
  ListProgButton.Enabled:=(new_state=3);

  if new_state<>ConnectState then
  begin
    case new_state of
      0: begin
           ConnectStatusPanel.Caption:='';
           ConnectStatusPanel.Color:=clBtnFace;
         end;
      1: begin
           ConnectStatusPanel.Caption:='Подключаемся по TCP';
           ConnectStatusPanel.Color:=clYellow;
         end;
      2: begin
           ConnectStatusPanel.Caption:='Есть TCP соединение';
           ConnectStatusPanel.Color:=clYellow;
         end;
      3: begin
           ConnectStatusPanel.Caption:='Есть соединение c Г420 № '+IntToStr(factory_num);
           ConnectStatusPanel.Color:=clLime;
         end;
    end;
    ConnectState:=new_state;
  end;
end;
//------------------------------------------------------------------------------
function TVisForm.EventSendTimer(CurTime: TDateTime): boolean;
var Pass: TPass_uni;
begin
  result:=false;

  if (MyClientSocket.Connected)and(factory_num=0)and(CurTime>SendDeviceInfoTime) then
  begin
    SendDeviceInfoTime:=CurTime+1/(24*3600); // 1 s
    EnCrypt16('', Pass.b);
    SendCommand(Target0,Comand_Get_Device_Info, 8, @Pass);
    SendCommandSysParam(Target0, Comand_Set_Device_Mode, 1);
    wath_dog:=10;
  end;

  if (MyClientSocket.Connected)and(factory_num>0)and(CurTime>SendStatusTime) then
  begin
    SendStatusTime:=CurTime+1/(24*3600); // 1 s
//    SendCommandSys(1, Comand_Get_Status);
    if wath_dog>0 then dec(wath_dog) else
    begin
      ConnectButton.Tag:=0;
      ConnectButton.Caption:='Установить соединение';
    end;
//    if (DeviceErrorChB.Checked) then
      SendCommandSys(0,Comand_Get_Device_Errors);
  end;


end;
//------------------------------------------------------------------------------
function TVisForm.EventTestFiles(CurTime: TDateTime): boolean;
const title: array[0..3]of string = ('DSP main', 'DSP reserve', 'DSP MPEG', 'SD');
var
edits: array[0..3]of TEdit;
buttons: array[0..3]of TButton;
i, j, filedate: integer;
fl: file;
size: int64;
arr: array of byte;
cs: byte;
begin
  if CurTime>TestFilesTime then
  begin
    TestFilesTime:=CurTime+1/(24*3600); // 1 s
    edits[0]:=g420_filename_dsp11_edit;
    edits[1]:=g420_filename_dsp12_edit;
    edits[2]:=g420_filename_dsp21_edit;
    edits[3]:=g420_filename_sd1_edit;
    buttons[0]:=g420_dsp11Button;
    buttons[1]:=g420_dsp12Button;
    buttons[2]:=g420_dsp21Button;
    buttons[3]:=g420_sd1Button;
    for i:=0 to 2 do
    begin
      if edits[i].Text<>'' then
      begin
        filedate:=FileAge(edits[i].Text);
        if filedate>=0 then
        begin
          if filedate<>FileTime[i] then
          begin
            FileTime[i]:=filedate;
            AssignFile(fl, edits[i].Text);
            ReSet(fl,1);
            size:=FileSize(fl);
            SetLength(arr, size);
            BlockRead(fl, arr[0], size);
            CloseFile(fl);
            cs:=0;
            for j:=0 to size-1 do cs:=cs xor arr[j];
            SetLength(arr, 0);
            if cs<>FileCheckSum[i] then
            begin
              FileCheckSum[i]:=cs;
              buttons[i].Hint:=DateTimeToStr(FileDateToDateTime(filedate));
              buttons[i].ShowHint:=true;
              buttons[i].ImageIndex:=1;
//              memo1.Lines.Add(buttons[i].Hint+' Изменился файл - '+title[i]);

            end;
          end;
        end;
      end;
    end;

//    FileTime: array[0..3]of dword;
//    FileCheckSum: array[0..3]of byte;

  end;
end;
//------------------------------------------------------------------------------
function TVisForm.EventSocketRead: boolean;
var
Len,p,p2,i,leng_mess:integer;
st: string;
label _begin_,_restart_;
begin
_begin_:
  result:=false;
  Len:=MyClientSocket.ReceiveLength;
  if(Len=0)then exit;
  result:=true;
  if Len+ArrInPos>MAX_ARRAY_IN_TCP then Len:=MAX_ARRAY_IN_TCP-ArrInPos;
  Len:=MyClientSocket.ReceiveBuf(ArrIn[ArrInPos],Len);
  if ArrInPos<0 then
  begin
    st:='TATPThread.ClientSocketRead: ArrInPos<0';
    Memo1.Lines.Add(st);
//    AddLogFile(st, 'atp_log.txt');
  end;

  inc(ArrInPos,Len);
  if ArrInPos<8 then exit;
  p:=0;
_restart_:
    p2:=FindFirst(p,ArrInPos);
    p:=p2;
  if p<0 then begin ArrInPos:=0; exit; end;

//  if atp_new.Time1=0 then atp_new.Time1:=Time;
  if ArrInPos-p<8 then
  begin
    for i:=p to ArrInPos-1 do ArrIn[i-p]:=ArrIn[i];
    dec(ArrInPos,p);
    exit;
  end;

  leng_mess:=GetLengMess(p);
  if ArrInPos-p<leng_mess then
  begin
    if p<>0 then
    begin
      for i:=p to ArrInPos-1 do ArrIn[i-p]:=ArrIn[i];
      dec(ArrInPos,p);
    end;
    exit;
  end;

  GetMess(p,leng_mess, ArrIn);

  inc(p,leng_mess);
  if p<ArrInPos then goto _restart_;
  ArrInPos:=0;
  goto _begin_;

end;
//------------------------------------------------------------------------------
function TVisForm.FindFirst(i1,i2:integer):integer;
var i:integer;
begin
  for i:=i1 to i2-4 do
    if (ArrIn[i]=$99)and(ArrIn[i+1]=$65)and(ArrIn[i+2]=$AF)and(ArrIn[i+3]=$12) then
    begin
      result:=i;
      exit;
    end;
  result:=-1;
end;
//------------------------------------------------------------------------------
function TVisForm.GetLengMess(p:integer):integer;
var header: PEthHeader;
begin
  header:=@ArrIn[p];
  result:=header.Length;
end;
//------------------------------------------------------------------------------
procedure TVisForm.GetMess(p,leng_mess:integer; const ArrIn: TarrTCP);
var header: PEthHeader;
pArrW: PArrWord;
leng, i, j: integer;
st: string;
//ba: integer;
begin
  header:=@ArrIn[p];

//  if FormHandle>0 then PostMessage(FormHandle, WM_LED_EVENTS, DATA_LED_ID, clYellow);
//  if b_d.Log.log_com_enable then LogRecvCommand(header, @ArrIn[p+16]);

  case header.Target_ID of
    0: begin
         case header.Command of
           Mess_Device_Info: ReceiveDeviceInfo(p,header.Length,ArrIn);
           Mess_Device_Errors: ReceiveSysError(p,header.Length,ArrIn);
//           Mess_Device_TimeStat: ReceiveTimeStat(p,ArrIn);
           Mess_Data:
           begin
             Memo1.Lines.Add('Получен персональный буфер, length = '+IntToStr(header.Length - 16));
             pArrW:=@ArrIn[p+16];
             leng:=(header.Length - 16) div 2;
             j:=0; st:='';
             for i:=0 to leng-1 do
             begin
               st:=st+IntToHex(pArrW[i], 4)+' ';
               if (i mod 8)=7 then
               begin
                 Memo1.Lines.Add(st);
                 st:='';
               end;
             end;
             if st<>'' then Memo1.Lines.Add(st);

           end;
//           Mess_SysMegaBuffer: ReceiveSysMegaBuf(p,ArrIn);
//           Mess_Opt_Control: ReceiveOptControl(p,header.Length,ArrIn);
//           Mess_Opt_Status: ReceiveOptStatus(p,header.Length,ArrIn);
           Mess_Prog_Arr_Status: ReceiveProgArrStatus(p,header.Length,ArrIn);
//           Mess_Run_Self_Test: ReceiveSelfTest(p,ArrIn);
           else Memo1.Lines.Add('неизвестная команда = '+Strg(fHex,header.Command,4)+', target = '+IntToStr(header.Target_ID));
         end;

       end;
    1..4: begin
          {  if not targ_to_ba(header.Target_ID-1, ba) then
            begin
              Memo1.Lines.Add('ошибочный target = '+IntToStr(header.Target_ID));
              exit;
            end;    }
            case header.Command of
              Mess_Status: ReceiveStatus(p,ArrIn);
//              Mess_Analys_MPEG: Board[ba].ReceiveErrors(p,ArrIn);
//              Mess_Analys_T2MI: Board[ba].ReceiveErrorsT2MI(p,ArrIn);
//              Mess_TS_Struct: Board[ba].ReceiveStruct(p,ArrIn);
//              Mess_Speed_PIDs: Board[ba].ReceiveSpeed(p,ArrIn);
//              Mess_T2MI_Info: Board[ba].ReceiveT2MI_Info(p,ArrIn);
              else Memo1.Lines.Add('неизвестная команда = '+Strg(fHex,header.Command,4)+', target = '+IntToStr(header.Target_ID));
            end;
          end;
  end;
//  if b_d.Log.log_com_enable then LogRecvCommand(header, @ArrIn[p+16]);

//  Time1:=0;
end;
//------------------------------------------------------------------------------
function TVisForm.SendCommand(target_id,comand,count: word; P_param: PArrWord):boolean;
var i, leng: integer;
g420: TG420ReceivePack;
g420Send: PG420Send;
//item: PCommandItem;
begin
  result:=false;

  if (G420loopChB.Checked)and(comand=Comand_g420_ProgArr) then
  begin
    leng:=SizeOf(TG420ReceivePack);
    g420Send:=@P_param[0];
    g420.header.Prefix:=$12AF6599;
    g420.header.Length:=leng;
    g420.header.Target_ID:=0;
    g420.header.Command:=Comand_g420_ProgArr;
    g420.header.Response:=0;
    g420.mess.dest_device:=g420Send.header.dest_device;
    g420.mess.device_param:=g420Send.header.device_param;
    g420.mess.Block_count:=1;
    g420.mess.start_address:=g420Send.header.start_address;
    g420.mess.prog_status:=0;
//    g420.mess.prog_status:=$800000e4;
//    ReceiveProgArrStatus(-16, SizeOf(TG420ReceiveMess), ParrTCP(@g420mess)^);
    MyClientSocket.EmulReceiveBuf(g420, leng);
    case g420Send.header.dest_device of
      3: save_last_block:=g420Send.header.start_address+g420Send.header.arr_length-1;
      4..7:
      begin
        if g420Send.header.start_address=save_last_block then
        begin
          g420.mess.device_param:=1;
          g420.mess.start_address:=1234;
          MyClientSocket.EmulReceiveBuf(g420, leng);
        end;
      end;
    end;
//    sleep(5);
    result:=true;
    exit;
  end;

  if not MyClientSocket.Connected then exit;


  if count>MAX_OUT_MESS_PARAM then count:=MAX_OUT_MESS_PARAM;
  if P_param=nil then count:=0;
  leng:=16+2*count;
//  mess:=AllocMem(leng);
//  new(item);
  mess.header.Prefix:=$12AF6599;
  mess.header.Length:=leng;
  mess.header.Target_ID:=target_id;
  mess.header.Command:=comand;
  mess.header.Response:=0;
  for i:=0 to count-1 do mess.param[i]:=p_param[i];
  move(P_param[0], mess.param[0], leng-16);

  MyClientSocket.SendBuf(mess, leng);

  result:=true;
end;
//------------------------------------------------------------------------------
function TVisForm.SendCommandSys(target_id,comand:word): boolean;
begin
  result:=SendCommand(target_id,comand,0,nil);
end;
//------------------------------------------------------------------------------
function TVisForm.SendCommandSysParam(target_id,comand,param:word): boolean;
begin
  result:=SendCommand(target_id,comand,1,@param);
end;
//------------------------------------------------------------------------------
function TVisForm.SendCommandDSP(target_id,comand,count: word; P_param: PArrWord; req_id_force: word = $ffff): word;
var i: integer;
params: array[0..MAX_OUT_MESS_PARAM+4-1]of word;
begin
  if req_id_force=$ffff then
  begin
    inc(request_id); if request_id>$ff00 then request_id:=0;
    req_id_force:=request_id;
  end;
  if count>MAX_OUT_MESS_PARAM then count:=MAX_OUT_MESS_PARAM;

  params[0]:=$55aa; params[1]:=comand; params[2]:=count+1 ;
  params[3]:=req_id_force;
  for i:=0 to count-1 do params[i+4]:=P_param[i];

  SendCommand(target_id, Comand_Send_Info, count+4, @params);
  result:=request_id;
end;
//------------------------------------------------------------------------------
procedure TVisForm.SendCommandDSP_continue(target_id,comand, block_length: word; start_addr: dword; P_param: PArrWord; req_id_force: word);
var i: integer;
params: array[0..SEND_BLOCK_SIZE+8-1]of word;
check_sum, count: word;
begin
{  if req_id_force=$ffff then
  begin
    inc(request_id); if request_id>$ff00 then request_id:=0;
    req_id_force:=request_id;
  end;     }
  count:=(block_length+1)shr 1; // размер блока данных в словах (block_length - в байтах)
  if count>SEND_BLOCK_SIZE then count:=SEND_BLOCK_SIZE;

  params[0]:=$55aa; params[1]:=comand; params[2]:=count+5 ;
  params[3]:=req_id_force;
  params[5]:=start_addr and $ffff;
  params[6]:=(start_addr shr 16) and $ffff;
  params[7]:=block_length;
  check_sum:=req_id_force;
  for i:=5 to 7 do check_sum:=(check_sum + params[i]) and $ffff;

  for i:=0 to count-1 do
  begin
    params[i+8]:=P_param[i];
    check_sum:=(check_sum + P_param[i]) and $ffff;
  end;
  params[4]:=check_sum;

  SendCommand(target_id, Comand_Send_Info, count+8, @params);
end;
//------------------------------------------------------------------------------
function TVisForm.SendCommandDSP2(target_id,comand,count,param1,param2: word): word;
var params: array[0..1]of word;
begin
  if count>2 then count:=2;
  params[0]:=param1; params[1]:=param2;
  result:=SendCommandDSP(target_id, comand, count, @params);
end;
//------------------------------------------------------------------------------

procedure TVisForm.ReceiveDeviceInfo(p,leng:integer; const ArrIn: TarrTCP);
var
device_info: PDeviceInfo;
device_info_v3: PDeviceInfo_v3;
//i, ba{, targ}: integer;
//f_num_txt, f_num_hint: string;
//send_id, arr_ind: byte;
//OptType: word;
//BADatas: TBADatas;
//OptArrDatasSet, OptArrDatasStatus: TOptArrDatas;
begin
  device_info:=@ArrIn[p+16];
  device_info_v3:=PDeviceInfo_v3(device_info);
  ver_device:=device_info.device_version;
  case ver_device of
    2..5:
    begin
      factory_num:=device_info.factory_num;
    end;
    6..100:
    begin
      factory_num:=device_info_v3.factory_num;
    end;
  end;



//  device_version:=device_info.device_version;

{  for i:=0 to MAX_TARGET-1 do
  begin
    SaveType_v3[i]:=device_info.BoardInfo[i].typ;
    if b_d.Log.show_board_info then
      AddLog('BoardInfo target='+IntToStr(i+1)+
             '; type='+IntToStr(device_info.BoardInfo[i].typ)+
             '; ver='+IntToStr(device_info.BoardInfo[i].version)+
             '; i2c_typ='+IntToStr(device_info.BoardInfo[i].i2c_typ)+
             '; i2c_ver='+IntToStr(device_info.BoardInfo[i].i2c_version)+
             '; opt_typ='+IntToStr(device_info.BoardInfo[i].opt_typ)+
             '; opt_ver='+IntToStr(device_info.BoardInfo[i].opt_version));
  end;
  if b_d.Log.show_board_info then for i:=0 to MAX_BOARD_DESCR-1 do
      AddLog('BoardDescriptor ['+IntToStr(i)+
             ']; target='+IntToStr(device_info.b_descrs[i].target)+
             '; arr_ind_init='+Strg(fHex, device_info.b_descrs[i].arr_ind_init, 2)+
             '; arr_ind_set='+Strg(fHex, device_info.b_descrs[i].arr_ind_set, 2)+
             '; arr_ind_status='+Strg(fHex, device_info.b_descrs[i].arr_ind_status, 2)+
             '; brdtyp='+Strg(fHex, device_info.b_descrs[i].brdtyp, 4)+
             '; in[0]='+Strg(fHex, device_info.b_descrs[i].in_opt_con[0], 2)+
             '; in[1]='+Strg(fHex, device_info.b_descrs[i].in_opt_con[1], 2)+
             '; in[2]='+Strg(fHex, device_info.b_descrs[i].in_opt_con[2], 2)+
             '; in[3]='+Strg(fHex, device_info.b_descrs[i].in_opt_con[3], 2)+
             '; out[0]='+Strg(fHex, device_info.b_descrs[i].out_opt_con[0], 2)+
             '; out[1]='+Strg(fHex, device_info.b_descrs[i].out_opt_con[1], 2));



  BoardCount:=ParsingDeviceInfo_v3(@device_info.b_descrs, device_info.BoardInfo, BADatas, OptArrDatasSet, OptArrDatasStatus, ba_link);

  for ba:=0 to BoardCount-1 do
  begin
    if Board[ba]<>nil then //if Board[ba].b_type<>BADatas[ba].b_type then
    begin
      Board[ba].Destroy; Board[ba]:=nil;
    end;
    if Board[ba]=nil then
    begin
      case BADatas[ba].b_type of
        2: Board[ba]:=TQoeBoard_v3.Create(self, ba, b_d);
        else Board[ba]:=TMpegBoard_v3.Create(self, ba, b_d);
      end;
      Board[ba].b_type:=BADatas[ba].b_type;
    end;

//    Board[ba].enable:=true;
    Board[ba].targ:=BADatas[ba].targ;

    Board[ba].b_ver:=BADatas[ba].b_ver;
    Board[ba].first_status:=true;

  end;

  for ba:=BoardCount to MAX_BA_NUM-1 do
  begin
    if Board[ba]<>nil then Board[ba].Destroy;
//    Board[ba].enable:=false; Board[ba].targ:=-1;
  end;

  f_num_txt:='Заводской номер '+IntToStr(device_info.factory_num)+': ';
  f_num_hint:='Заводской номер анализатора - '+IntToStr(device_info.factory_num)+#13+
    'Версия анализатора - '+IntToStr(device_info.device_version);
  EnterCriticalSection(b_d.CritSect);
  try
    b_d.DeviceData.FactoryNum_txt:=f_num_txt;
    b_d.DeviceData.FactoryNum_hint:=f_num_hint;
    b_d.DeviceData.BoardCount:=BoardCount;
    b_d.DeviceData.factory_num:=device_info.factory_num;
    b_d.DeviceData.device_version:=device_info.device_version;
    b_d.DeviceData.BADatas:=BADatas;
    b_d.DeviceData.OptArrDatasSet:=OptArrDatasSet;
    b_d.DeviceData.OptArrDatasStatus:=OptArrDatasStatus;

    b_d.DeviceData.change_out:=true;
  finally
    LeaveCriticalSection(b_d.CritSect);
  end;

  SetMonopol(true);
  SendCommandSys(Target0,Comand_Get_Opt_Control or Comand_Get_Opt_Status);
  first_opt_control:=true;
  first_opt_status:=true; }
end;
//------------------------------------------------------------------------------
procedure TVisForm.ReceiveSysError(p,leng:integer; const ArrIn: TarrTCP);
const
cError_Max_Num   = 32;
cError_FIFO_Leng = 256;
type
  PSysErrors = ^TSysErrors;
  TSysErrors = packed record
    Total_Counts: dword;
    arr: array[0..cError_Max_Num-1]of byte;
    FIFO_Count: dword;
    FIFO: array[0..cError_FIFO_Leng-1] of byte;
  end;

var SysErrors: PSysErrors;
i,i2: integer;
//st: string;
function err_name(err: byte): string;
begin
  case err of
    $01: result:='cError_SPI_Prefix - Приняли не префикс';
    $02: result:='cError_SPI_Command - Приняли неизвестную команду';
    $03: result:='cError_SPI_Length - В сообщении с переменной длиной значение поля Length больше предела 256';
    $04: result:='cError_SPI_CheckWord - В принятом сообщении не совпала расчитаная мной и полученная контрольная сумма';
    $05: result:='cError_SPI_DSP_TimeOut - Истекло время ожидания слова при приёме сообщения от DSP';
    $06: result:='cError_SPI_I2C_TimeOut - Истекло время ожидания слова при приёме сообщения от I2C';
    $07: result:='cError_SPI_ErrMPEG_Leng - Фактическая длина сообщения не соответствует расчитаной длине';
    $08: result:='cError_SPI_ErrT2MI_Leng - Фактическая длина сообщения не соответствует расчитаной длине';
    $09: result:='cError_SPI_Tx_Mode - Неправильный адресат отправления режима';
    $0a: result:='cError_SPI_I2C_Prefix';
    $0b: result:='cError_SPI_ErrMPEG_TS_indx - Неправильный индекс массива(потока) для MPEG ошибки - слишком большой';
    $0c: result:='cError_SPI_ErrT2MI_TS_indx - Неправильный индекс массива(потока) для T2MI ошибки - слишком большой';

    $10: result:='cError_APP_NewConn_con_id - при вызове app_NewConnect с уровня TCP получили сon_id которому нет свободного соединения';
    $11: result:='cError_APP_NewConn_con_ip - при вызове app_NewConnect с уровня TCP получили src_ip которому соединение запрещено ';
    $12: result:='cError_APP_Conn_Rx_con_id - при вызове app_receive с уровня TCP получили сon_id которому нет открытого соединения';
    $13: result:='cError_APP_Conn_Bad_Prefix - принят запрос с ошибкой префикса';
    $14: result:='cError_APP_Conn_Bad_Pref_Leng';
    $15: result:='cError_APP_Conn_FirstRequest - приняли не правильный первый запрос ';
    $16: result:='cError_APP_Conn_LongRequest - приняли слишком длинный запрос - делаем псевдо приёс с последующим отбрасыванием оного';
    $17: result:='cError_APP_UnKnownCommand0 - приняли не известныую команду';
    $18: result:='cError_APP_UnKnownCommand1 - приняли не известныую команду';
    $19: result:='cError_APP_UnKnownCommand2 - приняли не известныую команду';
    $1a: result:='cError_APP_UnKnownTarget - приняли не известный таргет';
    $1b: result:='cError_APP_Rx_Cmd_Send_Info_Lend - при вызове app_receive с уровня TCP получили команду Send_Info с не правильной длиной';
    $1c: result:='cError_APP_Struct_Overflow - переполнение буфера структуры потока';
    $1d: result:='cError_APP_MegaBuf_Add - добавление данных в буфер когда он передаётся';
    $1e: result:='cError_APP_MegaBuf_Overflow - переполнение буфера ';
    $1f: result:='cError_APP_TxBuf_Overflow0 - переполнение буфера в следствии медленой пропускной способности ';
    $20: result:='cError_APP_TxBuf_Overflow1 - переполнение буфера в следствии неправильного алгоритма';
    $21: result:='cError_APP_Mess_Loop_Ready - при проверки возможности передачи буфера в TCP возникла не предвиденная ошибка';
    $22: result:='cError_APP_Target - приняли запрос для Target который отсутствует в конфигурации ';
    $23: result:='cError_APP_Exlusive - приняли запрос переключить режим анализа(вход) когда ексклюзивность не позволяет';
    $24: result:='cError_APP_SendOk - от TCP получили подтверждение передачи для соединения которое ничего не передавала';
    $25: result:='cError_APP_UnKnownSendOk - от TCP получили подтверждение передачи для не существующего на прикладном уровне элемента';
    $26: result:='cError_APP_Close_Conn1 - при вызове app_close_connection с уровня TCP получили сon_id больше чем размер массива';
    $27: result:='cError_APP_Close_Conn2 - при вызове app_close_connection с уровня TCP получили сon_id которому нет открытого соединения';
    $28: result:='cError_APP_Control_Enable - приняли запрос переключить режим анализа(вход) когда IP и/или пароль не позволяет управлять';
    $29: result:='cError_APP_Device_Info_Leng - не правильное поле длины(Length) в запросе APP_Get_Device_Info';
    $2a: result:='cError_APP_SetOptCntrl_Exlusive - приняли запрос управления опцией от клиента который не находится в монопольном режиме ';
    $2b: result:='cError_APP_SetOptCntrl_Leng - не правильное поле длины(Length) в запросе APP_Set_Opt_Control';
    $2c: result:='cError_APP_SetOptCntrl_Target - не правильное поле длины(Length) в запросе APP_Set_Opt_Control';
    $2d: result:='cError_APP_SetOptCntrl_BrdIndx - не правильная таблица преобразования NumOptToTarget[]';
    $2e: result:='cError_APP_SetOptCntrl_OtpIndx - не правильная работа фйнкции составления таблиц преобразования ';
    $2f: result:='cError_APP_SetOptStat_Exlusive - приняли запрос записи статуса опции от клиента который не находится в монопольном режиме ';
    $30: result:='cError_APP_SetOptStat_Leng - не правильное поле длины(Length) в запросе APP_Set_Opt_Status';
    $31: result:='cError_APP_SetOptStat_Target - не правильное поле длины(Length) в запросе APP_Set_Opt_Status';
    $32: result:='cError_APP_T2MI_Info_Leng - не правильное поле длины(Length) в запросе APP_Get_Device_Info';
    $33: result:='cError_APP_OptI2CisOutput - опция не может управлятся через I2C так как она являестя выходной';
    $34: result:='cError_APP_CMD_TS2IP_Leng - нет параметров в команде APP_Set_TS2IP_Mode (есть только префикс)';
    $35: result:='cError_APP_CMD_TS2IP_CMD - при приёме APP_Set_TS2IP_Mode встретили неизвестную команду управления TS2IP';
    $36: result:='cError_APP_CreateServer - создание сервера не удалость т.к. TCP ответил отказом';
    $37: result:='cError_APP_CreateClient - создание клиента не удалость т.к. TCP ответил отказом';
    $38: result:='cError_APP_TCP_break_conn - вызов функции разрыва соединения ответил отказом';
    $39: result:='cError_APP_SPI_Rx_ErrInx_Num - Неправильный индекс T2MI ошибки - слишком большой';
    $3a: result:='cError_APP_T2MI_InfoParam - не правильны(й) параметры Board,MpegID,StreamID при вызове функции T2MI_Info_Add...';
    $3b: result:='cError_APP_Set_TS2IP_Mode_Exlusive - приняли запрос управления TS TO IP от клиента который не находится в монопольном режиме ';
    $3c: result:='cError_APP_TxBrdStatus_TSnum - при отравке статуса платы анализа обнаружено что заявленно число потоков более чем допустимо';
    $3d: result:='cError_APP_SetOptCntrl_brdind - прислали параметры для опции которая не прописана в конфигурации';
    $3e: result:='cError_APP_SetOptCntrl_brdtar - прислали параметры для опции которая не верно описана в конфигурации';
    $3f: result:='cError_APP_SetOptCntrl_ArrCntZero - прислали рабочие параметры для опции для которой не заданны массивы конфигурации (число массивов=0)';
    $40: result:='cError_APP_SetOptCntrl_ArrOfs - прислали рабочие параметры для опции смещение массива больше чем заданно в конфигурации';
    $41: result:='cError_APP_SetOptCntrl_ArrIndx - прислали рабочие параметры для опции вычисленый индекс массива больше чем число массивов в системе';

    $67: result:='cError_Main_suport_target_Init';

    $68: result:='cError_CEthernet_InsertMACLoop1 - в таблице МАС нет IP  а должен быть';
    $69: result:='cError_CEthernet_ARP_Make_Pack_Mem1 - при создании сообщения ARP пакет в буфере не был найден';
    $6a: result:='cError_CEthernet_ARP_Make_Pack_Mem2 - при создании сообщения ARP пакет Eth в буфере не был найден';

    $70: result:='cError_CTCP_IP_SendWind_RTO - при проверке RTO было онаружена ошибка ';
    $71: result:='cError_CTCP_IP_AddRxSack_NoNewSack - нет новых элементов RxSack хотя список не переполнился';
    $72: result:='cError_CTCP_IP_AddRxSack_NoNewSack2 - нет новых элементов RxSack хотя список не переполнился';
    $73: result:='cError_CTCP_IP_AddRxSack_LinkListBad - мы нашли что новый сегмент далеко правее последнего сегмента в списке - а где самая первая проверка';
    $74: result:='cError_CTCP_IP_AddRxSack_LinkListBad2 - мы нашли что новый сегмент далеко правее последнего сегмента в списке - а где самая первая проверка';
    $75: result:='cError_CTCP_IP_AddRxSack_NewTcpRxSack - список RxSack пустой а новый sack не выделяют';
    $76: result:='cError_CTCP_IP_AddRxSack_AckLessPos - новая подстверждённая ack_num позиция меньше начальной позиции буфера rx_win_pos';
    $77: result:='cError_CTCP_IP_AddRxSack_RxWindOver - переполнение окна на приём';
    $78: result:='cError_CTCP_IP_AddRxSack_RxSackOver - переполнение списка селективных подтверждений';
    $79: result:='cError_CTCP_IP_AddRxSack_RxSackOver2 - переполнение списка селективных подтверждений';
    $7a: result:='cError_CTCP_IP_MemDiagnostic - обнаружена утечка памяти в CTCP_IP::MemDiagnostic()';
    $7b: result:='cError_CTCP_IP_ReTransmitTxSackFIFO - При бытрой ретрансляции связаный список TxSackFIFO онаружен разорванным';
    $7c: result:='cError_CTCP_IP_MakePacket_RxNeedSack - переменная RxNeedSack говорит что нужно передать SACKи а их нет в списках';
    $7d: result:='cError_CTCP_IP_RxProcess_Hack - оканчание принятого пакета не влезает в наше окно';
    $7e: result:='cError_CTCP_IP_SendWind_cwind_send - ошибка управления трафиком приведшая к рассогласованию размера окна передачи - заявленый размер не соответствует текущему';
    // --- Ошибки связанные с работой железа : BF533 и ALTERA ---------------------------
    $90: result:='cError_HRDWR_ETH_WR_TO_TX_FIFO - Число записанных данных в передающее ФИФО ALTERA меньше чем планировалось (записали в cALT_WR_MAC_TX_PACK_LENG больше чем приняли) - странная ошибка - на практике не должно быть т.к. мы используем PPI';
    $91: result:='cError_HRDWR_ETH_BAD_TX_FIFO_USED - Чтение из алтеры cALT_RD_MAC_TX_BUFF_USED числа используемемых ячеек TX ФИФО получили более чем должны';
    $92: result:='cError_HRDWR_ETH_EVENT_INTR_OVRN - в прерывании от MAC сообщили о переполнении входного ФИФО - т.е. потеря входных пакетов';
    $93: result:='cError_HRDWR_SPI_Rx_DMA_LAST - Предыдущее цикл чтения ДМА прочитал не столько сколько планировал - заявлял записью в альтеру';
    $94: result:='cError_HRDWR_SPI_AND_REG_FIFO - ФИФО говорит(cALT_RD_SPI_DSP_LENG) что нужно дочитывать а регистроваое ФИФО говорит(cALT_RD_RX_STATUS) что нормально - скорее всего ошибка железа';
    $95: result:='cError_HRDWR_SPI_ALT_Rx_FIFO_OVERFLOW - Переполнение входного SPI (DSP читает) ФИФО в альтре ';
    $96: result:='cError_HRDWR_PPI';
    //--- Debug -------------------------------------------------------------------------
    $F8: result:='cDebug_CTCP_IP_AddRxSack_TxSACK - Передаём ACK+SACK т.к. были обнаружены сегменты для селективного подстверждения';
    $F9: result:='cDebug_CTCP_IP_NewConnSACK_Permit - Разрешеаем работу с селективными подтверждениями';
    $FA: result:='cDebug_SPI_Msg_Board_Info - приняли по SPI команду cSPI_Msg_Board_Info';
    $FB: result:='cDebug_SPI_Msg_Board_Status - приняли по SPI команду cSPI_Msg_Board_Status';
    else result:='';
  end;

end;
begin
  if leng<>16 + cError_Max_Num + cError_FIFO_Leng + 8 then exit;
  wath_dog:=5;
  SysErrors:=@ArrIn[p+16];
  if SysErrors.Total_Counts=0 then exit;
  Memo1.Lines.Add('----------------------------------------------');
  Memo1.Lines.Add(TimeToStr(Now));
  Memo1.Lines.Add('Total_Counts = '+IntToStr(SysErrors.Total_Counts));
  for i:=0 to cError_Max_Num-1 do
  begin
   if SysErrors.arr[i]<>0 then
   begin
     Memo1.Lines.Add('err['+IntToHex(i,2)+'H] = '+IntToStr(SysErrors.arr[i])+':  '+err_name(i));
   end;
  end;
  Memo1.Lines.Add('FIFO_Count = '+IntToStr(SysErrors.FIFO_Count));
  if SysErrors.FIFO_Count>cError_FIFO_Leng then i2:=cError_FIFO_Leng
    else i2:=SysErrors.FIFO_Count;
    for i:=0 to i2-1 do
    begin
      Memo1.Lines.Add(IntToHex(SysErrors.FIFO[i],2)+'H'+':  '+err_name(SysErrors.FIFO[i]));
    end;

end;
//------------------------------------------------------------------------------
procedure TVisForm.ReceiveProgArrStatus(p,leng:integer; const ArrIn: TarrTCP);
var g420_mess: PG420ReceiveMess;
begin
  g420_mess:=PG420ReceiveMess(@ArrIn[p+16]);
  g420_receive(g420_mess);
end;
//------------------------------------------------------------------------------

procedure TVisForm.ReceiveStatus(p:integer; const ArrIn: TarrTCP);
var
status: PATPStatus;
status_v3: PATPStatus_v3;
header: PEthHeader;
{targ: word;
ba: integer;
status_ok: boolean;}
Errors_Count: byte;
begin
  header:=@ArrIn[p];
  if header.Length<80 then exit;
//  AddLog('Получен статус');
//  status:=@ArrIn[p+16];
  case ver_device of
    2..5:
    begin
      status:=@ArrIn[p+16];
      Errors_Count:=status.Errors_Count;
      if status.Exlusive_Status<>IN_EXCL_MODE_MY then
        SendCommandSysParam(Target0, Comand_Set_Device_Mode, 1);
    end;
    6..100:
    begin
      status_v3:=@ArrIn[p+16];
      Errors_Count:=status_v3.Errors_Count;
      if status_v3.Exlusive_Status<>IN_EXCL_MODE_MY then
        SendCommandSysParam(Target0, Comand_Set_Device_Mode, 1);
    end;
    else Errors_Count:=0;
  end;

  wath_dog:=5;

  if (DeviceErrorChB.Checked)and(Errors_Count <> 0) then
    SendCommandSys(0,Comand_Get_Device_Errors);
end;
//------------------------------------------------------------------------------

function TVisForm.Strg(format: byte; Value: int64; Digits: integer; DecAllign: boolean = false): string;
begin
  case format of
    fDec: begin
            result:=IntTostr(Value);
            if DecAllign then while Length(result)<Digits+1 do result:=' '+result;
          end;
    fHex: result:=IntToHex(Value,Digits)+'H';
    fBin: begin
            result:=IntToBin(Value);
            result:=Copy(result,Length(result)-Digits+1,Digits)+'b';
          end;
    fHexDec: result:=IntToHex(Value,Digits)+'H ('+IntToStr(Value)+')';
    else result:='Ошибка формата';
  end;
end;
//------------------------------------------------------------------------------
function TVisForm.IntToBin(Value: cardinal): string;
var i: Integer;
begin
  SetLength(result, 32);
  for i := 1 to 32 do
  begin
    if ((Value shl (i - 1)) shr 31) = 0 then
      result[i] := '0' {do not localize}
    else
      result[i] := '1'; {do not localize}
  end;
end;
//------------------------------------------------------------------------------
function TVisForm.CurTimeFine: string;
var dt: TDateTime;
begin
  dt:=Now;
  result:=DateTimeToStr(dt);
  dt:=frac(dt*(24*60*60));
  result:=result+Copy(FloatToStrF(dt,ffFixed,5,3),2,4);
end;
//------------------------------------------------------------------------------

procedure TVisForm.EnCrypt16(pass: string; var arr: tPassword);
var i, key: integer;
data: byte;
begin
  key:=START_KEY;
  for i:=0 to 15 do arr[i]:=0;
  for i:=1 to Length(pass) do arr[i-1]:=ord(pass[i]);
  for i:=0 to 15 do
  begin
    data:=arr[i] xor (key shr 8);
    key:=((key+data)*MULT_KEY + ADD_KEY)and $ffff;
    arr[i]:=data;
  end;
end;
//------------------------------------------------------------------------------
function TVisForm.DeCrypt16(arr: tPassword): string;
var i, key: integer;
data,dd: byte;
//ch: byte;
begin
  key:=START_KEY;
  result:='';
  for i:=0 to 15 do
  begin
    data:=arr[i];
    dd:=data xor (key shr 8);
    if dd=0 then exit;
    result:=result+char(dd);
    key:=((key+data)*MULT_KEY + ADD_KEY)and $ffff;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.SaveToFile;
var ini: TIniFile;
ind: integer;
//Pass: string;
//f, band, plp: dword;
SaveWinLeft,SaveWinTop,SaveWinWidth,SaveWinHeight: integer;
wp: WINDOWPLACEMENT;
begin
  ini:=TIniFile.Create(CurIniFileName);

  // --------------- MainSection -----------------
{  ini.WriteBool(MainSection,ItemConnectionState,ATPObj.Active);
  ini.WriteBool(MainSection,ItemShowHex,HexMode=fHex);
  ini.WriteInteger(MainSection,ItemAnalisStart,SettingForm.SaveAnalisRG.ItemIndex);
  ini.WriteBool(MainSection,ItemRemoteOn,RemoteLED.State);
  ini.WriteInteger(MainSection,ItemRemoteFN,RemoteMonButton.Tag);   // заводской номер

  Pass:=EnCrypt(DeCrypt16(atpBD.PassData.atpPass.b));
  ini.WriteString(MainSection, ItemClientPass, Pass);  }


  if GetWindowPlacement(Handle, @wp)then
  begin
    SaveWinLeft:=wp.rcNormalPosition.Left;
    SaveWinTop:=wp.rcNormalPosition.Top;
    SaveWinWidth:=wp.rcNormalPosition.Right-wp.rcNormalPosition.Left;
    SaveWinHeight:=wp.rcNormalPosition.Bottom-wp.rcNormalPosition.Top;
  end
  else
  begin
    SaveWinLeft:=Left;
    SaveWinTop:=Top;
    SaveWinWidth:=Width;
    SaveWinHeight:=Height;
  end;

  ini.WriteInteger(MainSection,ItemWinLeft,SaveWinLeft);
  ini.WriteInteger(MainSection,ItemWinTop,SaveWinTop);
  ini.WriteInteger(MainSection,ItemWinWidth,SaveWinWidth);
  ini.WriteInteger(MainSection,ItemWinHeight,SaveWinHeight);
  ini.WriteBool(MainSection,ItemWinMaximize,WindowState=wsMaximized);

  ini.WriteBool(MainSection, ItemDeviceError, DeviceErrorChB.Checked);


  // ---------- HostsSection ------------
  ini.WriteString(HostsSection, ItemHost, ConnectEdit.Text);

  // ------------- g420 --------------
  ini.WriteString(g420Section,ItemG420_DSP11, g420_filename_dsp11_edit.Text);
  ini.WriteString(g420Section,ItemG420_DSP12, g420_filename_dsp12_edit.Text);
  ini.WriteString(g420Section,ItemG420_DSP21, g420_filename_dsp21_edit.Text);
  ini.WriteString(g420Section,ItemG420_SD1, g420_filename_sd1_edit.Text);
  ini.WriteInteger(g420Section,ItemG420_SendBlocks,g420_blockCount_SpinEdit.Value);

  ini.WriteString(g420Section,ItemG420_StartAddr, g420_StartAddrEdit.Text);
  ini.WriteBool(g420Section,ItemG420_Increment,IncrChB.Checked);

  ini.WriteInteger(g420Section,ItemG420_SD_use,g420_sd_CbB.ItemIndex);
  ini.WriteInteger(g420Section,ItemG420_PlayMode,g420_playModeCbB.ItemIndex);
  ini.WriteString(g420Section,ItemG420_BitRateIn, g420_bitrateEdit.Text);
  ini.WriteString(g420Section,ItemG420_BitRateOut, g420_bitrateOutEdit.Text);

  for ind:=0 to 3 do
  begin
    ini.WriteInteger(g420Section, ItemFileTime_prexix+IntToStr(ind), FileTime[ind]);
    ini.WriteInteger(g420Section, ItemFileCheckSum_prexix+IntToStr(ind), FileCheckSum[ind]);
  end;

  ini.Destroy;
end;
//------------------------------------------------------------------------------
procedure TVisForm.LoadFromFileWindow;
var ini: TIniFile;
//ba: integer;
begin
  ini:=TIniFile.Create(CurIniFileName);
  // ---------------- MainSection ---------------------
  Left:=ini.ReadInteger(MainSection,ItemWinLeft,Left);
  Top:=ini.ReadInteger(MainSection,ItemWinTop,Top);
  Width:=ini.ReadInteger(MainSection,ItemWinWidth,Width);
  Height:=ini.ReadInteger(MainSection,ItemWinHeight,Height);
  if ini.ReadBool(MainSection,ItemWinMaximize,false)then
    WindowState:=wsMaximized;

  ini.Destroy;
end;
//------------------------------------------------------------------------------
function TVisForm.PrepareListSignal: integer;
var i, j, ostat: integer;
is_mpeg: boolean;
addr, min_br, count_bl, block_count_one: dword;
leng, leng_one: int64;
begin
  result:=0;
  addr:=0;
  for i:=0 to Length(SignalList)-1 do
  begin
//    is_mpeg:=((SignalList[i].sig_id shr 28)and $0f)<8;
    is_mpeg:=(SignalList[i].signal.sig_id_type and $0f)<8;
    if is_mpeg then
      inc(result, 32+SignalList[i].signal.prog_count*2+SignalList[i].signal.br_count*16)
    else inc(result, 48);

    min_br:=SignalList[i].signal.Signal_br[0].br;
    for j:=0 to SignalList[i].signal.br_count-1 do
    begin
      SignalList[i].signal.Signal_br[j].start_addr:=addr;
//      list_ind:=(SignalList[i].sig_id shr 24) and $0f;
//      lists[list_ind]:=true;
      leng:=SignalList[i].signal.Signal_br[j].length;
      count_bl:=(((leng-1) div 2048)+1)*4; // длина сигнала в блоках с учетом выравнивания
//    leng_one:=((size-1)div group) + 1;
      leng_one:=leng;
      block_count_one:=((leng_one-1) div G420_SD_ALLIGN) + 1; // длина сигнала в блоках
      ostat:=G420_SD_ALLIGN - (block_count_one*G420_SD_ALLIGN - leng_one); // остаток в последнем блоке
      SignalList[i].signal.Signal_br[j].leng_bl:=block_count_one;
      SignalList[i].signal.Signal_br[j].last_bl_leng:=ostat;
      inc(addr, count_bl);
      if min_br>SignalList[i].signal.Signal_br[j].br then min_br:=SignalList[i].signal.Signal_br[j].br;
    end;
    SignalList[i].signal.min_br:=min_br;
  end;

end;
//------------------------------------------------------------------------------
procedure TVisForm.ListProgButtonClick(Sender: TObject);
var i, j, k, list_ind: Integer;
{addr, leng, count_bl,} dw{, min_br}: dword;
lists: array[0..15] of boolean;
list_descriptor: array of byte;
is_mpeg: boolean;
d_ind, d_leng: integer;
ast: AnsiString;
fl: file;
dev, group: byte;
begin
  g420_stopButtonClick(nil);
  sleep(1000);
  // подготовка списка
  for i:=0 to 15 do lists[i]:=false;
  d_leng:=PrepareListSignal;
  for i:=0 to Length(SignalList)-1 do
  begin
{    is_mpeg:=((SignalList[i].sig_id shr 28)and $0f)<8;
    if is_mpeg then
      inc(d_leng, 32+SignalList[i].prog_count*2+SignalList[i].br_count*12)
    else inc(d_leng, 48);

    min_br:=SignalList[i].Signal_br[0].br;      }
    for j:=0 to SignalList[i].signal.br_count-1 do
    begin
{      SignalList[i].Signal_br[j].start_addr:=addr;   }
      // определяем к какому списку относится сигнал, и помечаем, что этот список не пустой
//      list_ind:=(SignalList[i].sig_id shr 24) and $0f;
      list_ind:=SignalList[i].sig_id_list and $0f;
      lists[list_ind]:=true;
{      leng:=SignalList[i].Signal_br[j].length;
      count_bl:=(((leng-1) div 2048)+1)*4;
      inc(addr, count_bl);
      if min_br>SignalList[i].Signal_br[j].br then min_br:=SignalList[i].Signal_br[j].br;  }
    end;
//    SignalList[i].min_br:=min_br;
  end;
  // добавляем к длине дескрипторов по 16 байт на каждый не пустой список
  for i:=0 to 15 do if lists[i] then inc(d_leng, 16);
  // создание файла описателей
  SetLength(list_descriptor, d_leng);
  d_ind:=0;

  for i:=0 to 15 do if lists[i] then
  begin
    if i<AddSigmalForm.SigListCbB.Items.Count then
      ast:=AddSigmalForm.SigListCbB.Items[i]
    else ast:='Menu_'+IntToStr(i+1);
    ast:=ast+'            ';
//    if length(ast)>12 then Delete(ast, 13, 255);
    for k:=0 to 11 do list_descriptor[d_ind+k]:=ord(ast[k+1]);
    inc(d_ind, 12);
    for k:=1 to 3 do list_descriptor[d_ind+k]:=0;
    list_descriptor[d_ind+3]:=$f0 + i;
    inc(d_ind, 4);
  end;

  for i:=0 to Length(SignalList)-1 do
  begin
    ast:=SignalList[i].signal.name+'            ';
//    if length(ast)>12 then Delete(ast, 13, 255);
    for k:=0 to 11 do list_descriptor[d_ind+k]:=ord(ast[k+1]);
    inc(d_ind, 12);
    dw:=SignalList[i].signal.sig_id_num;
    dw:=dw or ((SignalList[i].signal.sig_id_type) shl 28);
    dw:=dw or ((SignalList[i].sig_id_list) shl 24);
    for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
    inc(d_ind, 4);
//    is_mpeg:=((SignalList[i].sig_id shr 28)and $0f)<8;
    is_mpeg:=(SignalList[i].signal.sig_id_type and $0f)<8;
    if is_mpeg then
    begin // MPEG
      list_descriptor[d_ind]:=SignalList[i].signal.prog_count and $ff;
      inc(d_ind);
      list_descriptor[d_ind]:=SignalList[i].signal.br_count and $ff;
      inc(d_ind);
      dw:=SignalList[i].signal.table_pres;
      for k:=0 to 1 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 2);
      dw:=SignalList[i].signal.min_br;
      for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 4);
      list_descriptor[d_ind]:=SignalList[i].signal.flags;
      inc(d_ind, 1);
      for k:=0 to 6 do list_descriptor[d_ind+k]:=$ff; // reserv
      inc(d_ind, 7);
      for j:=0 to SignalList[i].signal.br_count-1 do
      begin
        dw:=SignalList[i].signal.Signal_br[j].start_addr;
        for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
        inc(d_ind, 4);
        dw:=SignalList[i].signal.Signal_br[j].leng_bl;
        for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
        inc(d_ind, 4);
        dw:=SignalList[i].signal.Signal_br[j].last_bl_leng;
        for k:=0 to 1 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
        inc(d_ind, 2);
        for k:=0 to 1 do list_descriptor[d_ind+k]:=$ff; // reserv
        inc(d_ind, 2);
        dw:=SignalList[i].signal.Signal_br[j].delta_pts;
        for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
        inc(d_ind, 4);
      end;
      for j:=0 to SignalList[i].signal.prog_count-1 do
      begin
        dw:=SignalList[i].signal.ProgInfo[j].service_id;
        for k:=0 to 1 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
        inc(d_ind, 2);
      end;
    end
    else // SDI
    begin
      dw:=SignalList[i].signal.Signal_br[0].start_addr;
      for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 4);
      dw:=SignalList[i].signal.Signal_br[0].leng_bl;
      for k:=0 to 3 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 4);
      dw:=SignalList[i].signal.Signal_br[0].last_bl_leng;
      for k:=0 to 1 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 2);
      list_descriptor[d_ind]:=SignalList[i].signal.discr_format;
      list_descriptor[d_ind+1]:=SignalList[i].signal.frame_rate;
      inc(d_ind, 2);
      dw:=SignalList[i].signal.fr_width;
      for k:=0 to 1 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 2);
      dw:=SignalList[i].signal.fr_height;
      for k:=0 to 1 do begin list_descriptor[d_ind+k]:=(dw and $000000ff); dw:=dw shr 8; end;
      inc(d_ind, 2);
      for k:=0 to 15 do list_descriptor[d_ind+k]:=$ff; // reserv
      inc(d_ind, 16);
    end;
  end;
  AssignFile(fl, 'list_sig.ls');
  ReWrite(fl, 1);
  BlockWrite(fl, list_descriptor[0], d_leng);
  CloseFile(fl);
  //-------------------
  if ProgSigChB.Checked then
  begin
    case g420_sd_CbB.ItemIndex of
      0: begin
           dev:=4; group:=1;
         end;
      1: begin
           dev:=5; group:=1;
         end;
      2: begin
           dev:=6; group:=1;
         end;
      3: begin
           dev:=7; group:=1;
         end;
      4: begin
           dev:=4; group:=2;
         end;
      5: begin
           dev:=6; group:=2;
         end;
      6: begin
           dev:=4; group:=4;
         end;
      else exit;
    end;
    for i:=0 to Length(SignalList)-1 do
    begin
      Memo1.Lines.Add(SignalList[i].signal.name);
      for j:=0 to SignalList[i].signal.br_count-1 do
      begin
        Memo1.Lines.Add(IntToStr(SignalList[i].signal.Signal_br[j].br)+'; addr='+IntToStr(SignalList[i].signal.Signal_br[j].start_addr));
        g420_Start_send(SignalList[i].signal.Signal_br[j].file_name, dev, 1, group, g420_sd_StatusPanel, SignalList[i].signal.Signal_br[j].start_addr*G420_SD_ALLIGN);
      end;
    end;
  end;
  Memo1.Lines.Add('Программирование дескрипторов');
  g420_Start_send('list_sig.ls', 16, 1, 0, g420_sd_StatusPanel, 0);
{  param:=1;
  TButton(Sender).ImageIndex:=0;
  if g420_dsp_RestartChB.Checked then param:=param or $40;
  g420_Start_send(g420_filename_dsp11_edit.Text, 1, param, 0, g420_dsp_StatusPanel,0);  }


end;
//------------------------------------------------------------------------------

procedure TVisForm.LoadFromFile;
var ini: TIniFile;
ind: integer;
//AnalisStart: integer;
//Pass,host,port: string;
//atpPass: TPass_uni;
//remote_on: boolean;
//remote: TRemote;
{targ,AnalisMode,InputState,ind: integer;
found,ConState,RemoteMode: boolean;
CB: TCheckBox;
f, band, plp: dword;
pid: word;  }
//^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^
begin
  ini:=TIniFile.Create(CurIniFileName);

  // ---------- HostsSection ------------
//  LoadCombo(ini, SettingForm.IPadrCB, HostsSection, ItemHost);
  ConnectEdit.Text:=ini.ReadString(HostsSection,ItemHost,'192.168.111.241');
//  SettingForm.UpDateCombo(SettingForm.IPadrCB,host);
//  LoadCombo(ini, SettingForm.PortCB, HostsSection, ItemPort);
//  port:=ini.ReadString(HostsSection,ItemPort,'2028');
//  SettingForm.UpDateCombo(SettingForm.PortCB,port);
//  ATPObj.SetSocketParam(host, port);

  // ------------- ServerSection -------------------

//  LoadCombo(ini, SettingForm.ServerNameCB, ServerSection, ItemServerHost);
//  LoadCombo(ini, SettingForm.ServerPortCB, ServerSection, ItemServerPort);

  // ---------------- MainSection ---------------------
//  if ini.ReadBool(MainSection,ItemShowHex,true)then HexMode:=fHex else HexMode:=fDec;
  DeviceErrorChB.Checked:=ini.ReadBool(MainSection, ItemDeviceError, true);

//  ConState:=ini.ReadBool(MainSection,ItemConnectionState,false);

 { AnalisStart:=ini.ReadInteger(MainSection,ItemAnalisStart,0);
  case AnalisStart of
    1: ATPObj.Active:=ini.ReadBool(MainSection,ItemConnectionState,false);
    2: ATPObj.Active:=true;
    else begin ATPObj.Active:=false; AnalisStart:=0; end;
  end;
  SettingForm.SaveAnalisRG.ItemIndex:=AnalisStart;
  case AnalisStart of
    1: remote_on:=ini.ReadBool(MainSection,ItemRemoteOn,false);
    2: remote_on:=true;
    else remote_on:=false;
  end;
  if remote_on then
  begin
    remote[0]:=true; SetRemote(remote);
  end;
  RemoteMonButton.Tag:=ini.ReadInteger(MainSection,ItemRemoteFN,0); // заводской номер

  HideInfoPanelChB.Checked:=ini.ReadBool(MainSection,ItemHideInfoPanel,false);

  Pass:=ini.ReadString(MainSection,ItemClientPass,'');
  EnCrypt16(DeCrypt(Pass),atpPass.b);
  EnterCriticalSection(atpBD.CritSect);
  atpBD.PassData.atpPass:=atpPass;
  atpBD.PassData.change_in:=true;
  LeaveCriticalSection(atpBD.CritSect);    }


  // ------------ DVBT2Section -----------------

  // ------------- JitterTestSection --------------
{  jitterfiltrCB.ItemIndex:=ini.ReadInteger(JitterTestSection,ItemFilter,0) and 3;
  pcrpidEdit.Text:=ini.ReadString(JitterTestSection,ItemPCRPID,'$121');
  pcrpid2Edit.Text:=ini.ReadString(JitterTestSection,ItemPCRPID2,'33');
  KoefFileNameEdit.Text:=ini.ReadString(JitterTestSection,ItemKoefFileName,'');
  JitterFiltr_0bEdit.Text:=ini.ReadString(JitterTestSection,ItemKoef0B,'1');
  JitterFiltr_1bEdit.Text:=ini.ReadString(JitterTestSection,ItemKoef1B,'0');
  JitterFiltr_2bEdit.Text:=ini.ReadString(JitterTestSection,ItemKoef2B,'0');
  JitterFiltr_1aEdit.Text:=ini.ReadString(JitterTestSection,ItemKoef1A,'0');
  JitterFiltr_2aEdit.Text:=ini.ReadString(JitterTestSection,ItemKoef2A,'0');
  JitterOutGB.ItemIndex:=ini.ReadInteger(JitterTestSection,ItemJitterToFile,0) and 1;
  JitterOutEdit.Text:=ini.ReadString(JitterTestSection,ItemJitterFileName,'jitter.txt');

  // ------------- ProtocolSection --------------
  BD.PrnInfo.prot.Header:=ini.ReadString(ProtocolSection,ItemHeader,'');
  BD.PrnInfo.prot.Location:=ini.ReadString(ProtocolSection,ItemLocation,'');
  BD.PrnInfo.prot.Podpis:=ini.ReadString(ProtocolSection,ItemPodpis,'гл.инж.— А.Б.Иванов; инж.— В.Г.Петров');
  BD.PrnInfo.prot.TimeEn:=ini.ReadBool(ProtocolSection,ItemTimeEn,true);
  BD.PrnInfo.prot.ZakluchEn:=ini.ReadBool(ProtocolSection,ItemZakluchEn,true);
  BD.PrnInfo.prot.DateEn:=ini.ReadBool(ProtocolSection,ItemDateEn,true);
  BD.PrnInfo.prot.DateAuto:=ini.ReadBool(ProtocolSection,ItemDateAuto,true);
  BD.PrnInfo.marg.Top:=ini.ReadInteger(ProtocolSection,ItemMargTop,10);
  BD.PrnInfo.marg.Bottom:=ini.ReadInteger(ProtocolSection,ItemMargBottom,10);
  BD.PrnInfo.marg.Left:=ini.ReadInteger(ProtocolSection,ItemMargLeft,20);
  BD.PrnInfo.marg.Right:=ini.ReadInteger(ProtocolSection,ItemMargRight,10);   }

  // ------------- g420 --------------
  g420_filename_dsp11_edit.Text:=ini.ReadString(g420Section, ItemG420_DSP11,'');
  g420_filename_dsp12_edit.Text:=ini.ReadString(g420Section, ItemG420_DSP12,'');
  g420_filename_dsp21_edit.Text:=ini.ReadString(g420Section, ItemG420_DSP21,'');
  g420_filename_sd1_edit.Text:=ini.ReadString(g420Section, ItemG420_SD1,'');
{  g420_filename_sd2_edit.Text:=ini.ReadString(g420Section, ItemG420_SD2,'');
  g420_filename_sd3_edit.Text:=ini.ReadString(g420Section, ItemG420_SD3,'');
  g420_filename_sd4_edit.Text:=ini.ReadString(g420Section, ItemG420_SD4,'');
  g420_parChB.Checked:=ini.ReadBool(g420Section,ItemG420_DoubleSD,false);
  g420_allChB.Checked:=ini.ReadBool(g420Section,ItemG420_AllSD,false);  }
  ind:=ini.ReadInteger(g420Section,ItemG420_SendBlocks,5);
  if (ind<g420_blockCount_SpinEdit.MinValue)or(ind>g420_blockCount_SpinEdit.MaxValue) then ind:=5;
  g420_blockCount_SpinEdit.Value:=ind;
  g420_StartAddrEdit.Text:=ini.ReadString(g420Section, ItemG420_StartAddr,'0');
  IncrChB.Checked:=ini.ReadBool(g420Section,ItemG420_Increment,false);
  ind:=ini.ReadInteger(g420Section,ItemG420_SD_use,0);
  if (ind<0)or(ind>=g420_sd_CbB.Items.Count) then ind:=0;
  g420_sd_CbB.ItemIndex:=ind;
  ind:=ini.ReadInteger(g420Section,ItemG420_PlayMode,0);
  if (ind<0)or(ind>=g420_playModeCbB.Items.Count) then ind:=0;
  g420_playModeCbB.ItemIndex:=ind;
  g420_bitrateEdit.Text:=ini.ReadString(g420Section, ItemG420_BitRateIn,'2049952');
  g420_bitrateOutEdit.Text:=ini.ReadString(g420Section, ItemG420_BitRateOut,'2049952');
  for ind:=0 to 3 do
  begin
    FileTime[ind]:=ini.ReadInteger(g420Section, ItemFileTime_prexix+IntToStr(ind), 0);
    FileCheckSum[ind]:=ini.ReadInteger(g420Section, ItemFileCheckSum_prexix+IntToStr(ind), $ff);
  end;

  ini.Destroy;
end;
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
procedure TVisForm.g420_allChBClick(Sender: TObject);
begin
{  g420_parChB.Enabled:=not g420_allChB.Checked;
  if g420_allChB.Checked then
  begin
    g420_sd2Button.Enabled:=false;
    g420_sd3Button.Enabled:=false;
    g420_sd4Button.Enabled:=false;
  end
  else
  begin
    g420_sd2Button.Enabled:=not g420_parChB.Checked;
    g420_sd3Button.Enabled:=true;
    g420_sd4Button.Enabled:=not g420_parChB.Checked;
  end;
  g420_filename_sd2_edit.Enabled:=g420_sd2Button.Enabled;
  g420_filename_sd3_edit.Enabled:=g420_sd3Button.Enabled;
  g420_filename_sd4_edit.Enabled:=g420_sd4Button.Enabled;   }
end;

//------------------------------------------------------------------------------
procedure TVisForm.g420_filename_editDblClick(Sender: TObject);
begin
  if (sender=g420_filename_dsp11_edit)or
     (sender=g420_filename_dsp12_edit)or
     (sender=g420_filename_dsp21_edit) then
     g420OpenDialog.Filter:='бинарные файлы (*.bin)|*.bin|все файлы (*.*)|*.*'
  else g420OpenDialog.Filter:='Потоки (*.m2t)|*.m2t|все файлы (*.*)|*.*';
  if g420OpenDialog.Execute then TEdit(Sender).Text:=g420OpenDialog.FileName;
end;

//------------------------------------------------------------------------------

procedure TVisForm.g420_dsp11ButtonClick(Sender: TObject);
var param: byte;
begin
  param:=1;
  TButton(Sender).ImageIndex:=0;
  if g420_dsp_RestartChB.Checked then param:=param or $40;
  g420_Start_send(g420_filename_dsp11_edit.Text, 1, param, 0, g420_dsp_StatusPanel,0);
end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_dsp12ButtonClick(Sender: TObject);
var param: byte;
begin
  param:=2;
  TButton(Sender).ImageIndex:=0;
  if g420_dsp_RestartChB.Checked then param:=param or $40;
  g420_Start_send(g420_filename_dsp12_edit.Text, 1, param, 0, g420_dsp_StatusPanel,0);
end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_dsp21ButtonClick(Sender: TObject);
var param: byte;
begin
  param:=1;
  TButton(Sender).ImageIndex:=0;
  g420_stopButtonClick(nil);
  sleep(1000);
  if g420_dsp_RestartChB.Checked then param:=param or $40;
  g420_Start_send(g420_filename_dsp21_edit.Text, 2, param, 0, g420_dsp_StatusPanel,0);
end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_sd1ButtonClick(Sender: TObject);
var dev, group: byte;
addr: int64;
begin
  addr:=g420_get_start_addr(true);
  TButton(Sender).ImageIndex:=0;
  if addr<0 then exit;

  case g420_sd_CbB.ItemIndex of
    0: begin
         dev:=4; group:=1;
       end;
    1: begin
         dev:=5; group:=1;
       end;
    2: begin
         dev:=6; group:=1;
       end;
    3: begin
         dev:=7; group:=1;
       end;
    4: begin
         dev:=4; group:=2;
       end;
    5: begin
         dev:=6; group:=2;
       end;
    6: begin
         dev:=4; group:=4;
       end;
    else exit;
  end;
{  group:=1;
  if g420_parChB.Checked then group:=2;
  if g420_allChB.Checked then group:=4;    }

  g420_Start_send(g420_filename_sd1_edit.Text, dev, 1, group, g420_sd_StatusPanel, addr*G420_SD_ALLIGN);
end;
//------------------------------------------------------------------------------

{procedure TVisForm.g420_sd2ButtonClick(Sender: TObject);
var addr: int64;
begin
  addr:=g420_get_start_addr(true);

  if addr<0 then exit;
  g420_Start_send(g420_filename_sd2_edit.Text, 5, 1, 1, g420_sd_StatusPanel, addr*G420_SD_ALLIGN);
end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_sd3ButtonClick(Sender: TObject);
var group: byte;
addr: int64;
begin
  addr:=g420_get_start_addr(true);
  if addr<0 then exit;

  group:=1;
  if g420_parChB.Checked then group:=2;
  g420_Start_send(g420_filename_sd3_edit.Text, 6, 1, group, g420_sd_StatusPanel, addr*G420_SD_ALLIGN);
end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_sd4ButtonClick(Sender: TObject);
var addr: int64;
begin
  addr:=g420_get_start_addr(true);
  if addr<0 then exit;
  g420_Start_send(g420_filename_sd4_edit.Text, 7, 1, 1, g420_sd_StatusPanel, addr*G420_SD_ALLIGN);
end;        }
//------------------------------------------------------------------------------
procedure TVisForm.g420_StartAddrEditChange(Sender: TObject);
begin
  if g420_get_start_addr(false)>=0 then g420_StartAddrEdit.Color:=clWindow
  else g420_StartAddrEdit.Color:=err1Color;
end;
//------------------------------------------------------------------------------
function  TVisForm.g420_get_start_addr(mess_en: boolean): integer;
var err: integer;
begin
  val(g420_StartAddrEdit.Text, result, err);
  if err<>0 then result:=-1;
  if (result<0)and(mess_en) then
  begin
    g420_sd_StatusPanel.Caption:='Ошибочный стартовый адрес';
    g420_sd_StatusPanel.Color:=clYellow;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.g420_bitrateEditChange(Sender: TObject);
begin
  if g420_get_bitrate(false)>=0 then g420_bitrateEdit.Color:=clWindow
  else g420_bitrateEdit.Color:=err1Color;
end;
//------------------------------------------------------------------------------
function  TVisForm.g420_get_bitrate(mess_en: boolean): integer;
var err: integer;
begin
  val(g420_bitrateEdit.Text, result, err);
  if err<>0 then result:=-1;
  if (result<0)and(mess_en) then
  begin
    g420_sd_StatusPanel.Caption:='Ошибочный битрейт';
    g420_sd_StatusPanel.Color:=clYellow;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.g420_bitrateOutEditChange(Sender: TObject);
begin
  if g420_get_bitrate_out(false)>=0 then g420_bitrateOutEdit.Color:=clWindow
  else g420_bitrateOutEdit.Color:=err1Color;
end;
//------------------------------------------------------------------------------
function  TVisForm.g420_get_bitrate_out(mess_en: boolean): integer;
var err: integer;
begin
  val(g420_bitrateOutEdit.Text, result, err);
  if err<>0 then result:=-1;
  if (result<0)and(mess_en) then
  begin
    g420_sd_StatusPanel.Caption:='Ошибочный битрейт';
    g420_sd_StatusPanel.Color:=clYellow;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.g420_startButtonClick(Sender: TObject);
var mess: TG420PlayMess;
comm, mode, sd_on, group: byte;
start_addr, bitrate, bitrateout, ostat, i: integer;
FileName: string;
fl: file;
size: int64;
leng_one, block_count_one: int64;
name: AnsiString;
begin
  case g420_sd_CbB.ItemIndex of
    0: begin sd_on:=1; group:=1; end;
    1: begin sd_on:=2; group:=1; end;
    2: begin sd_on:=4; group:=1; end;
    3: begin sd_on:=8; group:=1; end;
    4: begin sd_on:=3; group:=2; end;
    5: begin sd_on:=12; group:=2; end;
    6: begin sd_on:=15; group:=4; end;
    else exit;
  end;
  case g420_playModeCbB.ItemIndex of
    0: begin  // MPEG одиночное
         comm:=33; mode:=sd_on;
       end;
    1: begin // MPEG в цикле
         comm:=32; mode:=sd_on;
       end;
    2: begin // SDI одиночное
         comm:=3; mode:=sd_on;
       end;
    3: begin // SDI в цикле
         comm:=2; mode:=sd_on;
       end;
    4: begin // HD SDI одиночное
         comm:=5; mode:=sd_on;
       end;
    5: begin // HD SDI в цикле
         comm:=4; mode:=sd_on;
       end;
    6: begin // HD SDI пак. одиночное
         comm:=5; mode:=$80+sd_on;
       end;
    7: begin // HD SDI пак. в цикле
         comm:=4; mode:=sd_on;
       end;
    else exit;
  end;

  start_addr:=g420_get_start_addr(true);
  if start_addr<0 then exit;
  bitrate:=g420_get_bitrate(true);
  if bitrate<0 then exit;
  bitrateout:=g420_get_bitrate_out(true);
  if bitrateout<0 then exit;


  FileName:=g420_filename_sd1_edit.Text;
  if not FileExists(FileName) then
  begin
    g420_sd_StatusPanel.Color:=clYellow;
    g420_sd_StatusPanel.Caption:='Файл не найден';
    Memo1.Lines.Add('Не найден файл "'+FileName+'"');
    exit;
  end;
  AssignFile(fl, FileName);
  ReSet(fl, 1);
  size:=FileSize(fl);
  if (size<1)or(size>$7ffffff0) then
  begin
    g420_sd_StatusPanel.Color:=clYellow;
    g420_sd_StatusPanel.Caption:='Ошибочный размер файла = '+IntToStr(size);
    CloseFile(fl);
    exit;
  end;

  if (size mod group)<>0 then
  begin
    g420_sd_StatusPanel.Color:=clYellow;
    g420_sd_StatusPanel.Caption:='Ошибочный размер файла = '+IntToStr(size);
    Memo1.Lines.Add('размер файла не кратен числу SD карт');
    G420FileStruct.state:=2;
    exit;
  end;
  leng_one:=((size-1)div group) + 1;
  block_count_one:=((leng_one-1) div G420_SD_ALLIGN) + 1;
  ostat:=G420_SD_ALLIGN - (block_count_one*G420_SD_ALLIGN - leng_one); // остаток в последнем блоке


  name:='Test signal     ';

  mess.PlayCommand:=comm;
  mess.Mode:=mode;
  mess.sig_id:=0;
  mess.StartAdress:=start_addr;
  mess.Length:=block_count_one;
  mess.LastBlockBytes:=ostat;
//  mess.reserve:=0;
  mess.BitRateInput:=bitrate;
  mess.BitRateOutput:=bitrateout;
  for i:=0 to 15 do mess.name[i]:=ord(name[i+1]);

  SendCommand(0, Comand_g420_SetPlayMode, SizeOf(mess) div 2, @mess);

  if g420logChB.Checked then
  begin
    memo1.Lines.Add('--------------------------------');
    memo1.Lines.Add('Размер файла='+IntToStr(size));
    memo1.Lines.Add('PlayCommand='+IntToStr(mess.PlayCommand));
    memo1.Lines.Add('Mode='+IntToStr(mess.Mode));
    memo1.Lines.Add('sig_id='+Strg(fHexDec, mess.sig_id,8));
    memo1.Lines.Add('StartAdress='+Strg(fHexDec, mess.StartAdress,8));
    memo1.Lines.Add('Length='+IntToStr(mess.Length));
    memo1.Lines.Add('LastBlockBytes='+IntToStr(mess.LastBlockBytes));
    memo1.Lines.Add('BitRateInput='+IntToStr(mess.BitRateInput));
    memo1.Lines.Add('BitRateOutput='+IntToStr(mess.BitRateOutput));
    memo1.Lines.Add('name="'+name+'"');
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.g420_stopButtonClick(Sender: TObject);
var mess: TG420PlayMess;
i: integer;
begin
  mess.PlayCommand:=0;
  mess.Mode:=0;
  mess.sig_id:=0;
  mess.StartAdress:=0;
  mess.Length:=1;
  mess.LastBlockBytes:=1;
//  mess.reserve:=0;
  mess.BitRateInput:=1;
  mess.BitRateOutput:=1;
  for i:=0 to 15 do mess.name[i]:=32;

  SendCommand(0, Comand_g420_SetPlayMode, SizeOf(mess) div 2, @mess);

  if g420logChB.Checked then
  begin
    memo1.Lines.Add('--------------------------------');
    memo1.Lines.Add('PlayCommand='+IntToStr(mess.PlayCommand));
    memo1.Lines.Add('Mode='+IntToStr(mess.Mode));
    memo1.Lines.Add('sig_id='+Strg(fHexDec, mess.sig_id,8));
    memo1.Lines.Add('StartAdress='+Strg(fHexDec, mess.StartAdress,8));
    memo1.Lines.Add('Length='+IntToStr(mess.Length));
    memo1.Lines.Add('LastBlockBytes='+IntToStr(mess.LastBlockBytes));
    memo1.Lines.Add('BitRateInput='+IntToStr(mess.BitRateInput));
    memo1.Lines.Add('BitRateOutput='+IntToStr(mess.BitRateOutput));
    memo1.Lines.Add('name=""');
  end;
end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_Start_send(FileName: string; device, param, group: byte;
  panel: TPanel; start_addr: int64);
var fl: file;
size: int64;
leng_one, leng, block_count_one, start_addr2: int64;
i: integer;
item: TG420StartSD;
begin
  if G420FileStruct.state=1 then  // state: 0-свободен; 1-занят; 2-ошибка
  begin
    if ProgListCount<G420_MAX_PROG_LIST then
    begin
      ProgList[ProgListCount].FileName:=FileName;
      ProgList[ProgListCount].device:=device;
      ProgList[ProgListCount].param:=param;
      ProgList[ProgListCount].group:=group;
      ProgList[ProgListCount].panel:=panel;
      ProgList[ProgListCount].start_addr:=start_addr;
      inc(ProgListCount);
    end
    else if panel<>nil then
    begin
      panel.Color:=clYellow;
      panel.Caption:='Модуль отправки занят';
    end;
    exit;
  end;

  SetPriorityClass(GetCurrentProcess, HIGH_PRIORITY_CLASS);

  if not FileExists(FileName) then
  begin
    if panel<>nil then
    begin
      panel.Color:=clYellow;
      panel.Caption:='Файл не найден';
    end;
    exit;
  end;
  AssignFile(fl, FileName);
  ReSet(fl, 1);
  size:=FileSize(fl);
  if (size<1)or(size>$7ffffff0) then
  begin
    if panel<>nil then
    begin
      panel.Color:=clYellow;
      panel.Caption:='Ошибочный размер файла = '+IntToStr(size);
    end;
    CloseFile(fl);
    exit;
  end;

  if g420logChB.Checked then Memo1.Lines.Add('размер файла = '+IntToStr(size));

  if G420FileStruct.StartTime=0 then G420FileStruct.StartTime:=now;
  G420FileStruct.last_proc:=-1;
  for i:=0 to 3 do G420FileStruct.sd[i].err_log:='';

  if group<1 then
  begin
//    G420FileStruct.block_count:=((size-1)div G420_BLOCK_DATA) + 1;
    G420FileStruct.sd[0].block_count_one:=((size-1)div G420_BLOCK_DATA) + 1;
    G420FileStruct.sd[0].blocks_one:=G420FileStruct.sd[0].block_count_one;
    G420FileStruct.group:=1;
    SetLength(G420FileStruct.arr, size);
    leng:=size;
    G420FileStruct.sd[0].curpos:=0;
    G420FileStruct.sd[0].send_block_count:=0;
    G420FileStruct.start_address:=start_addr;
    G420FileStruct.sd[0].finish1:=false;
    G420FileStruct.sd[0].finish2:=false;
    G420FileStruct.sd[0].next_recv_start_address:=0;
    G420FileStruct.max_block_count:=5;
//    G420FileStruct.unit_size:=1;
//    G420FileStruct.ready:=true; // для DSP не нужно делать подготовки
  end
  else
  begin
    if (size mod group)<>0 then
    begin
      if panel<>nil then
      begin
        panel.Color:=clYellow;
        panel.Caption:='Ошибочный размер файла = '+IntToStr(size);
      end;
      Memo1.Lines.Add('размер файла не кратен числу SD карт');
      G420FileStruct.state:=2;
      exit;
    end;
    leng_one:=((size-1)div group) + 1;
    block_count_one:=((leng_one-1) div G420_SD_ALLIGN) + 1;

    leng_one:=block_count_one*G420_SD_ALLIGN;
//    G420FileStruct.block_count:=(((leng_one-1)div G420_BLOCK_DATA) + 1)*group;
    G420FileStruct.group:=group;
    leng:=leng_one*group;
    SetLength(G420FileStruct.arr, leng);
    for i:=size to leng-1 do G420FileStruct.arr[i]:=$ff;

    item.start_address:=start_addr div (G420FileStruct.group*G420_SD_ALLIGN);
    G420FileStruct.start_address:=item.start_address;
    G420FileStruct.max_block_count:=g420_blockCount_SpinEdit.Value div group;

    param:=0;
    for i:=0 to group-1 do
    begin
      G420FileStruct.sd[i].block_count_one:=block_count_one;
      G420FileStruct.sd[i].blocks_one:=block_count_one;
      param:=param or (1 shl (device+i-4));
      G420FileStruct.sd[i].curpos:=0;
      G420FileStruct.sd[i].send_block_count:=0;
      G420FileStruct.sd[i].finish1:=false;
      G420FileStruct.sd[i].finish2:=false;
      G420FileStruct.sd[i].next_recv_start_address:=G420FileStruct.start_address;
    end;
//    G420FileStruct.unit_size:=G420_SD_ALLIGN;
//    G420FileStruct.ready:=false;

    item.dest_device:=3;
    item.device_param:=param;
    param:=0;

    start_addr2:=item.start_address;
    start_addr2:=start_addr2*G420FileStruct.group*G420_SD_ALLIGN;
    if start_addr2<>start_addr then
    begin
      if panel<>nil then
      begin
        panel.Color:=clYellow;
        panel.Caption:='Начальный адрес не кратен '+IntToStr(G420FileStruct.group*G420_SD_ALLIGN);
      end;
      exit;
    end;

    item.block_count:=block_count_one;
    item.reserve1:=0;  item.reserve2:=0;

    SendCommand(0, Comand_g420_ProgArr, SizeOf(item) div 2, @item);
    if g420logChB.Checked then memo1.Lines.Add('send "Г420 подготовка SD" start_address='+IntToStr(item.start_address)+
      '; block_count='+IntToStr(item.block_count));
    G420FileStruct.SendTime:=now;
  end;
  BlockRead(fl, G420FileStruct.arr[0], size);
  CloseFile(fl);

//  G420FileStruct.ofs:=0;
  G420FileStruct.device:=device;
  G420FileStruct.param:=param;
  G420FileStruct.length:=leng;
  G420FileStruct.StatusPanel:=panel;
  G420FileStruct.state:=1;
//  G420FileStruct.block_ind_1:=0;
//  G420FileStruct.block_ind_2:=0;
//  G420FileStruct.finish:=false;
  if panel<>nil then
  begin
    panel.Color:=clBtnFace;
    panel.Caption:='Начало';
  end;

  if device in[1,2,16] then
    g420_send_next_DSP;
end;

//------------------------------------------------------------------------------

procedure TVisForm.g420_send_next_DSP;
var item: TG420Send;
leng, ind{, ostat, sd, sd_count}: int64;
i: integer;
count: word;
begin
  while (G420FileStruct.sd[0].send_block_count<G420FileStruct.max_block_count)and
        (not G420FileStruct.sd[0].finish2) do
  begin
    leng:=G420FileStruct.length-G420FileStruct.sd[0].curpos;
    if leng>G420_BLOCK_DATA then leng:=G420_BLOCK_DATA;

    if leng<=0 then
    begin
      G420FileStruct.sd[0].finish2:=true;
{        G420FileStruct.curpos:=0; inc(G420FileStruct.ofs);
      if G420FileStruct.ofs>=G420FileStruct.group then G420FileStruct.finish:=true;
      if g420logChB.Checked then Memo1.Lines.Add('Г-420. Отправка завершена'+
        ', send_block_count='+IntToStr(G420FileStruct.send_block_count));  }
      continue;
    end;

    ind:=G420FileStruct.sd[0].curpos;
    for i:=0 to leng-1 do
    begin
      item.arr[i]:=G420FileStruct.arr[ind];
      inc(ind);
    end;

    inc(G420FileStruct.sd[0].send_block_count);

//      item.header.dest_device:=G420FileStruct.device + G420FileStruct.ofs;
    item.header.dest_device:=G420FileStruct.device;
    item.header.device_param:=G420FileStruct.param;
    item.header.start_address:=G420FileStruct.sd[0].curpos;
    item.header.arr_length:=leng;
    count:=(leng+SizeOf(TG420SendHeader)+1)div 2;
//    G420FileStruct.SendLeng:=item.header.arr_length;
    G420FileStruct.sd[0].curpos:=G420FileStruct.sd[0].curpos + leng;
    if G420FileStruct.sd[0].curpos>=G420FileStruct.length then
    begin
      item.header.device_param:=item.header.device_param or $80;
      G420FileStruct.sd[0].finish2:=true;
    end;

{    leng:=G420FileStruct.length-G420FileStruct.curpos;
    ostat:=leng mod G420FileStruct.group; // если есть остаток, значит в первые SD-шки запишется на 1 байт больше
    leng:=leng div G420FileStruct.group;  // оставшаяся длина файла, для одной SD-шки
    if G420FileStruct.ofs<ostat then inc(leng); // добавляем байт, если есть остаток
    if leng<=0 then item.header.device_param:=item.header.device_param or $80;   }

    item.header.reserve1:=0;  for i:=10 to 15 do item.header.reserve2[i]:=0;

    SendCommand(0, Comand_g420_ProgArr, count, @item);
    if g420logChB.Checked then memo1.Lines.Add(CurTimeFine+' send "Г420 DSP" device='+IntToStr(item.header.dest_device)+
      '; param='+IntToStr(item.header.device_param)+'; curpos='+IntToStr(item.header.start_address));
    G420FileStruct.SendTime:=now;
//    G420FileStruct.SendStartAddr:=item.header.start_address;

{    if g420logChB.Checked then Memo1.Lines.Add(IntToStr(G420FileStruct.block_ind_1)+
      '. Г-420 отправка, адр.= '+Strg(fHex, item.header.start_address, 8)+
      ', send_block_count='+IntToStr(G420FileStruct.send_block_count));

    inc(G420FileStruct.block_ind_1);    }
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.g420_send_next_SD;
var item: TG420Send;
leng, {ostat, }ind, sd_count: int64;
sd, i: integer;
count: word;
begin
  sd_count:=G420FileStruct.group; if sd_count<1 then sd_count:=1;

  for sd:=0 to sd_count-1 do
  begin
    while (G420FileStruct.sd[sd].send_block_count<G420FileStruct.max_block_count)and
          (not G420FileStruct.sd[sd].finish1) do
    begin
      if(G420FileStruct.sd[sd].block_count_one<=0) then
      begin
        G420FileStruct.sd[sd].finish1:=true;
        if g420logChB.Checked then memo1.Lines.Add('Finish device='+IntToStr(sd+4));
        break;
      end;

      leng:=G420_SD_ALLIGN;
      ind:=G420FileStruct.sd[sd].curpos*sd_count*G420_SD_ALLIGN+sd;
      for i:=0 to leng-1 do
      begin
        item.arr[i]:=G420FileStruct.arr[ind];
        inc(ind, sd_count);
      end;


//      item.header.dest_device:=G420FileStruct.device + G420FileStruct.ofs;
      item.header.dest_device:=G420FileStruct.device + sd;
      item.header.device_param:=G420FileStruct.param;
      item.header.start_address:=G420FileStruct.start_address+G420FileStruct.sd[sd].curpos;
      item.header.arr_length:=leng;
      count:=(leng+SizeOf(TG420SendHeader)+1)div 2;
//      G420FileStruct.SendLeng:=item.header.arr_length;
//      G420FileStruct.curpos:=G420FileStruct.curpos + G420FileStruct.SendLeng*G420FileStruct.group;

 {     leng:=G420FileStruct.length-G420FileStruct.curpos;
      ostat:=leng mod G420FileStruct.group; // если есть остаток, значит в первые SD-шки запишется на 1 байт больше
      leng:=leng div G420FileStruct.group;  // оставшаяся длина файла, для одной SD-шки
      if G420FileStruct.ofs<ostat then inc(leng); // добавляем байт, если есть остаток
      if leng<=0 then item.header.device_param:=item.header.device_param or $80;   }

      item.header.reserve1:=0;  for i:=10 to 15 do item.header.reserve2[i]:=0;

      SendCommand(0, Comand_g420_ProgArr, count, @item);
      if g420logChB.Checked then memo1.Lines.Add(CurTimeFine+' send "Г420 SD" device='+IntToStr(item.header.dest_device)+
        '; param='+IntToStr(item.header.device_param)+'; curpos='+IntToStr(item.header.start_address));
      G420FileStruct.SendTime:=now;
//      G420FileStruct.SendStartAddr:=item.header.start_address;

      inc(G420FileStruct.sd[sd].send_block_count);
      dec(G420FileStruct.sd[sd].block_count_one);
      inc(G420FileStruct.sd[sd].curpos);
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.g420_receive(Item: PG420ReceiveMess);
var //st: string;
finish: boolean;
proc, sd, sd_count: integer;
{leng, ostat, }new_start_addr: int64;
//data: dword;
//err_fin, err_mess: byte;
pi: TProgItem;
i: Integer;
st: string;
begin
  if g420_test_receive_error(Item) then exit;

  case Item.dest_device of
    1,2,16:
    begin
      if G420FileStruct.sd[0].send_block_count>0 then dec(G420FileStruct.sd[0].send_block_count);
      g420_send_next_DSP;
      finish:=(G420FileStruct.sd[0].finish2)and(G420FileStruct.sd[0].send_block_count<=0);
      proc:=round(100.0*G420FileStruct.sd[0].curpos/G420FileStruct.length);
    end;
    3:
    begin
      g420_send_next_SD;
      proc:=0; finish:=false;
    end;
    4..7:
    begin
      sd:=Item.dest_device-G420FileStruct.device;
      if(sd<0)or(sd>3)then exit;
      if Item.device_param=0 then // подтверждение отсылки блока
      begin
        if G420FileStruct.sd[sd].send_block_count>0 then dec(G420FileStruct.sd[sd].send_block_count, Item.Block_count);

        g420_send_next_SD;
      end
      else G420FileStruct.sd[sd].finish2:=true; // дополнительный ответ - отчет о программировании

      finish:=true; proc:=0;
      for sd:=0 to G420FileStruct.group-1 do
      begin
        if (not G420FileStruct.sd[sd].finish2)or(G420FileStruct.sd[sd].send_block_count>0) then finish:=false;
        inc(proc, G420FileStruct.sd[sd].curpos);
      end;
      proc:=round(100.0*proc*G420_SD_ALLIGN/G420FileStruct.length);
    end;
    else exit;
  end;

  if finish then
  begin
    sd_count:=G420FileStruct.group;
    if sd_count<1 then sd_count:=1;
    if sd_count>4 then sd_count:=4;
    for sd:=0 to sd_count-1 do if G420FileStruct.sd[sd].err_log<>'' then
    begin
      Memo1.Lines.Add(G420FileStruct.sd[sd].err_log);
      G420FileStruct.sd[sd].err_log:='';
    end;

    G420FileStruct.state:=0;
    if (G420FileStruct.device>=4)and(G420FileStruct.device<=7)and(IncrChB.Checked) then
    begin
      new_start_addr:=G420FileStruct.start_address;
      new_start_addr:=new_start_addr+(((G420FileStruct.length-1)div G420_SD_ALLIGN)+1);
      g420_StartAddrEdit.Text:=IntToStr(new_start_addr);
    end;
    // Запуск нового программирования из списка
    if ProgListCount>0 then
    begin
      pi:=ProgList[0];
      for i:=0 to ProgListCount-2 do ProgList[i]:=ProgList[i+1];
      dec(ProgListCount);
      g420_Start_send(pi.FileName, pi.device, pi.param, pi.group, pi.panel, pi.start_addr);
    end
    else
    begin
      if G420FileStruct.StatusPanel<>nil then
      begin
        G420FileStruct.StatusPanel.Caption:='OK, время = '+TimeToStr(now-G420FileStruct.StartTime);
        G420FileStruct.StatusPanel.Color:=clLime;
      end;
      G420FileStruct.StartTime:=0;
    end;
  end
  else
  begin
    if G420FileStruct.StatusPanel<>nil then
    begin
//      proc:=round(100.0*G420FileStruct.block_ind_2/G420FileStruct.block_count);
      if proc<>G420FileStruct.last_proc then
      begin
        st:='программирование '+IntToStr(proc)+'%';
        if ProgListCount>0 then st:=st+' (и еще файлов : '+IntToStr(ProgListCount)+')';

        G420FileStruct.StatusPanel.Caption:=st;
        G420FileStruct.last_proc:=proc;
      end;
      if G420FileStruct.StatusPanel.Color<>clBtnFace then
        G420FileStruct.StatusPanel.Color:=clBtnFace;
    end;
//    g420_send_next;
  end;
end;
//------------------------------------------------------------------------------
function TVisForm.g420_test_receive_error(Item: PG420ReceiveMess):boolean;
var st: string;
sd: integer;
data: dword;
err_fin, err_mess: byte;
begin
  result:=true;

  if G420FileStruct.state<>1 then  // программирование выключено, отбрасываем сообщение
  begin
    Memo1.Lines.Add('Получен ответ от Г-420 при остановленном программировании.');
    exit;
  end;

  if item.dest_device>16 then
  begin
    st:=IntToStr(item.dest_device);
    Memo1.Lines.Add('Ошибка! Получен ответ с полем dest_device = '+st);
    if G420FileStruct.StatusPanel<>nil then
    begin
      G420FileStruct.StatusPanel.Caption:='ошибочный dest_device='+st;
      G420FileStruct.StatusPanel.Color:=err1Color;
    end;

    G420FileStruct.state:=2;
    exit;
  end;

  if item.prog_status<>0 then
  begin
    case item.dest_device of
      1,2:
        begin
          st:='ошибка: '+IntToStr(item.prog_status);
          Memo1.Lines.Add('Программирование DSP, '+st);
          if G420FileStruct.StatusPanel<>nil then
          begin
            G420FileStruct.StatusPanel.Caption:=st;
            G420FileStruct.StatusPanel.Color:=err1Color;
          end;
        end;
      3:
        begin
          if G420FileStruct.StatusPanel<>nil then
          begin
            G420FileStruct.StatusPanel.Caption:='prog_status='+IntToHex(Item.prog_status, 8)+'H';
            G420FileStruct.StatusPanel.Color:=err1Color;
          end;

          Memo1.Lines.Add('Ошибка при подготовке к программированию SD');

          if (Item.prog_status and $80000000)<>0 then
            Memo1.Lines.Add('Ни одна SD CARD не была запрошена для программирования');
          data:=Item.prog_status;
          for sd:=1 to 4 do
          begin
            case data and 3 of
              0: Memo1.Lines.Add('SD_'+IntToStr(sd)+' OK');
              1: Memo1.Lines.Add('SD_'+IntToStr(sd)+' нет готовности');
              2: Memo1.Lines.Add('SD_'+IntToStr(sd)+' ошибка при команде программирования');
              3: Memo1.Lines.Add('SD_'+IntToStr(sd)+' отсутствует');
            end;
            data:=data shr 2;
          end;
        end;
      4..7:
        begin
          sd:=Item.dest_device-G420FileStruct.device;
          if(sd<0)or(sd>3)then exit;
          if G420FileStruct.StatusPanel<>nil then
          begin
            G420FileStruct.StatusPanel.Caption:='Ошибка = '+IntToStr(Item.prog_status);
            G420FileStruct.StatusPanel.Color:=err1Color;
          end;

          if Item.device_param=0 then // подтверждение отсылки блока
          begin
            Memo1.Lines.Add(CurTimeFine+' Ошибка таймаута посылки блока в SD_'+IntToStr(Item.dest_device-3)+
              ' '+IntToStr(Item.prog_status)+
              '; блок: '+IntToStr(Item.start_address));
          end
          else  // дополнительный ответ - отчет о программировании
          begin
            Memo1.Lines.Add(CurTimeFine+' Ошибка программирования SD_'+IntToStr(Item.dest_device-3)+
              ' '+IntToStr(Item.prog_status)+
              '; запрограммировано блоков: '+IntToStr(Item.start_address)+
              ' из '+IntToStr(G420FileStruct.sd[sd].blocks_one));

            err_fin:=item.prog_status and $0f;
            case err_fin of
              0: st:='без ошибок (текущее состояние SD CARD = tran)';
              1: st:='ошибка при ожидании/получении ответа на команду CMD13 от SD CARD';
              2: st:='ошибка при ожидании/получении ответа на команду CMD12 от SD CARD';
              3: st:='истекло число попыток ожидания пока карта перейдёт из состояния prg в tran';
              4: st:='выполнения ожидания конца программирования состояние не равно tran';
              5: st:='ошибка при ожидании/получении ответа на команду ACMD22 от SD CARD';
              else st:=IntToStr(err_fin);
            end;
            Memo1.Lines.Add('результат работы процедуры финализации : '+st);

            err_mess:=(item.prog_status shr 4) and $0f;
            case err_mess of
              0: st:='запрограммировали все блоки данных без ошибок';
              1: st:='потребовали свыше (в данной карте ошибок не было)';
              2: st:='получили не правильную последовательность блоков на входе';
              3: st:='истекло время ожидания на программирование (ошибка в карте';
              else st:=IntToStr(err_mess);
            end;
            Memo1.Lines.Add('причина завершения : '+st);
          end;
        end;
      16:
        begin
          st:='ошибка: '+IntToStr(item.prog_status);
          Memo1.Lines.Add('Программирование описателей сигнала, '+st);
          if G420FileStruct.StatusPanel<>nil then
          begin
            G420FileStruct.StatusPanel.Caption:=st;
            G420FileStruct.StatusPanel.Color:=err1Color;
          end;
        end;
    end;
    G420FileStruct.state:=2;
    exit;
  end;

  result:=false;

  case Item.dest_device of
    1,2,16:
    begin
      if g420logChB.Checked then
        Memo1.Lines.Add(CurTimeFine+' Receive device='+IntToStr(Item.dest_device)+
          '; start_address='+IntToStr(Item.start_address)+
          '; send_block_count='+IntToStr(G420FileStruct.sd[0].send_block_count));
      if Item.start_address<>G420FileStruct.sd[0].next_recv_start_address then
      begin
        st:=' получен ошибочный start_address ('+IntToStr(Item.start_address)+
          '), ожидался start_address='+IntToStr(G420FileStruct.sd[0].next_recv_start_address)+
          '; (Device='+IntToStr(Item.dest_device)+')';
        if g420logChB.Checked then Memo1.Lines.Add(CurTimeFine+' g420_receive:'+st);
        if G420FileStruct.sd[0].err_log='' then
          G420FileStruct.sd[0].err_log:='В процессе программирования был'+st;
      end;
      G420FileStruct.sd[0].next_recv_start_address:=G420FileStruct.sd[0].next_recv_start_address+G420_BLOCK_DATA;
    end;
    4..7:
    begin
      sd:=Item.dest_device-G420FileStruct.device;
      if(sd<0)or(sd>3)then exit;
      if Item.device_param=0 then // подтверждение отсылки блока
      begin
        if g420logChB.Checked then
          Memo1.Lines.Add(CurTimeFine+' Receive device='+IntToStr(Item.dest_device)+
            '; start_address='+IntToStr(Item.start_address)+
            '; send_block_count='+IntToStr(G420FileStruct.sd[sd].send_block_count));

        if Item.start_address<>G420FileStruct.sd[sd].next_recv_start_address then
        begin
          st:=' получен ошибочный start_address ('+IntToStr(Item.start_address)+
            '), ожидался start_address='+IntToStr(G420FileStruct.sd[sd].next_recv_start_address)+
            '; (Device='+IntToStr(Item.dest_device)+')';
          if g420logChB.Checked then Memo1.Lines.Add(CurTimeFine+' g420_receive:'+st);
          if G420FileStruct.sd[sd].err_log='' then
            G420FileStruct.sd[sd].err_log:=CurTimeFine+'В процессе программирования был'+st;
          result:=true;
          exit;
        end;
        G420FileStruct.sd[sd].next_recv_start_address:=G420FileStruct.sd[sd].next_recv_start_address+Item.Block_count;
      end
      else
      begin
        if g420logChB.Checked then
          Memo1.Lines.Add(CurTimeFine+' Receive finish block, device='+IntToStr(Item.dest_device)+
            '; Block_Count='+IntToStr(Item.start_address));
      end;
    end;
  end;

end;
//------------------------------------------------------------------------------

procedure TVisForm.g420_TestTime(t: TDateTime);
var sd_count, sd: integer;
begin
//  exit; //!!!!!!!!!!!!!!!!!!

  if G420FileStruct.state<>1 then exit;

//  sd_count:=G420FileStruct.group; if sd_count<1 then sd_count:=1;
  sd_count:=G420FileStruct.group;
  if sd_count<1 then sd_count:=1;
  if sd_count>4 then sd_count:=4;
  for sd:=0 to sd_count-1 do if G420FileStruct.sd[sd].err_log<>'' then
    Memo1.Lines.Add(G420FileStruct.sd[sd].err_log);

  if t>G420FileStruct.SendTime + 5.0/(24*3600) then
  begin
    if G420FileStruct.StatusPanel<>nil then
    begin
      G420FileStruct.StatusPanel.Caption:='Ошибка таймаута';
      G420FileStruct.StatusPanel.Color:=err1Color;
    end;
    G420FileStruct.state:=2;
  end;
end;
//------------------------------------------------------------------------------
procedure TVisForm.ShowSignalList;
var i, ti: integer;
st: string;
begin
  ListBox1.Clear;
  for i:=0 to Length(SignalList)-1 do
  begin
    st:=SignalList[i].signal.name;
    ti:=SignalList[i].sig_id_list and $0f;
    if(ti>=0)and(ti<AddSigmalForm.SigListCbB.Items.Count)then
      st:=st+' ('+AddSigmalForm.SigListCbB.Items[ti]+')';
{    case ti of
      0..3: st:=st+' ('+AddSigmalForm.SigListCbB.Items[ti]+')';
    end;  }
    ListBox1.Items.Add(st);
  end;
end;
//------------------------------------------------------------------------------
end.
