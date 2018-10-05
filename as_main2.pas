unit as_main2;

interface

uses
  options, options_set, MyTypes, constants, Config, arrs, BA_Types,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, WinSock, Grids, ExtCtrls, Mask, ComCtrls, inifiles,
  Buttons, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdUDPServer,
  IdSocketHandle, IdGlobal;

const
//MaxInterfaces = 30;
MaxPribors = 100;
ATP_PORT = 1026;
UDP_CMD_FIND = 25;
UDP_CMD_STAT = 25;
UDP_SUBCMD_GET_INFO    = 1;  // самодиагностики (какие платы обнаружены)
UDP_SUBCMD_GET_CONF    = 2;  // заводские настройки (INIT)
UDP_SUBCMD_GET_SETTING = 4;  // эксплуатационные настройки (SET)
UDP_SUBCMD_GET_ARROPT1 = 8;  // массивы 1-4
UDP_SUBCMD_GET_ARROPT2 = 9;  // массивы 5-8
UDP_SUBCMD_GET_ARROPT3 = 10; // массивы 9-12
UDP_SUBCMD_GET_ARROPT4 = 11; // массивы 13-16
UDP_SUBCMD_GET_ARROPT5 = 12; // массивы 17-20
UDP_SUBCMD_GET_ARROPT6 = 13; // массивы 21-24
UDP_SUBCMD_GET_ARROPT7 = 14; // массивы 25-28
UDP_SUBCMD_GET_ARROPT8 = 15; // массивы 29-32
UDP_SUBCMD_GET_SERVER = 128; // параметры сервера

UDP_CMD_SET = 27;
UDP_CMD_SET_OK = 27;
UDP_SUBCMD_BURN        = 0;
UDP_SUBCMD_SET_SETTING = 4;
UDP_SUBCMD_SET_ARROPT1 = 8;  // массивы 1-4
UDP_SUBCMD_SET_ARROPT2 = 9;  // массивы 5-8
UDP_SUBCMD_SET_ARROPT3 = 10; // массивы 9-12
UDP_SUBCMD_SET_ARROPT4 = 11; // массивы 13-16
UDP_SUBCMD_SET_ARROPT5 = 12; // массивы 17-20
UDP_SUBCMD_SET_ARROPT6 = 13; // массивы 21-24
UDP_SUBCMD_SET_ARROPT7 = 14; // массивы 25-28
UDP_SUBCMD_SET_ARROPT8 = 15; // массивы 29-32
UDP_SUBCMD_SET_SERVER = 128; // параметры сервера
//UDP_CMD_SET_NO_CLEARABLE = $FF;
//UDP_CMD_SET_WRITE_ERROR  = $FE;

//START_KEY = $5600;
//MULT_KEY  = $00e3;
//ADD_KEY   = $105a;

type
  sockaddr_gen = packed record
    AddressIn: sockaddr_in;
    filler: packed array[0..7] of AnsiChar;
  end;
  INTERFACE_INFO = packed record
    iiFlags: u_long; // Флаги интерфейса
    iiAddress: sockaddr_gen; // Адрес интерфейса
    iiBroadcastAddress: sockaddr_gen; // Broadcast адрес
    iiNetmask: sockaddr_gen; // Маска подсети
  end;

  tHeader = packed record
    checksum    : word;
    command     : word;
    sub_command : word;
    response    : word;
    ip_request  : dword;
    zavod_num   : word;
    reserve     : word;
  end;

  tSetData = packed record  // эксплуатационные настройки
    ip_addr:      dword;
    ip_mask:      dword;
    ip_gateway:   dword;
    dhcp:         byte;
    control_mode: byte;
    reserv0:      word;
    control_ip:   dword;
    control_pass: tPassword;
    reserve1:     array[36..63] of byte;
    board_mode:   array[0..7] of TMode;
    reserve2:     array[128..1023]of byte;
  end;

  tSetMess = packed record
    header : tHeader;
    data   : tSetData;
  end;

  tInitData = packed record   // заводские настройки
    xid             : dword;
    zavod_num       : word;
    device_type     : word;
    mac             : tMac;
    reserve1        : array[14..31]of byte;
    board_descriptor: TBoardDescriptors;
    reserv2         : array[32+SizeOf(TBoardDescriptors)..1023]of byte;
  end;

  tInitMess = packed record
    header : tHeader;
    data   : tInitData;
  end;

  tDeviceData = packed record    // результаты самодиагностики

  end;

  TuniData = packed record
    case integer of
      0: (b_info: TBoardsInfo);
      1: (init: tInitData);
      2: (sett: tSetData);
      3: (arrs: array[0..7] of tOptControl);
  end;

  TMess = packed record
    header : tHeader;
    data   : TuniData;
  end;

  TFullMess = record
    ip_request: dword;
    zavod_num : word;
    isInfo    : boolean;
    isInit    : boolean;
    isSett    : boolean;
    isArrs    : array[0..7] of boolean;
//    isArrs2   : boolean;
    reqArrs   : array[0..7] of boolean;
//    reqArrs2  : boolean;
    send_step : integer;      // 0-sett, 1-arr1, 2-arr2, 100-burn
    send_count: integer;      // число попыток
    time_count: integer;      // время в единицах таймера до следующей попытки
    b_info    : TBoardsInfo;  // результаты самодиагностики
    init      : tInitData;    // конфигурация
    sett      : tSetData;
//    arrs      : array[0..15] of tOptControl;
    arrs      : TOptionsControl_v3;
  end;


const
HEADER_LENG = SizeOf(tHeader) div 2;
SET_LENG    = SizeOf(tSetMess) div 2;
INIT_LENG   = SizeOf(tInitMess) div 2;

type
  pMess_uni = ^tMess_uni;
  tMess_uni = packed record
    case integer of
      0: (rec: TMess);
      1: (ch: array[1..SET_LENG*2] of char;);
      2: (arr: array[0..SET_LENG-1]of word);
  end;

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    p0_next_btn: TButton;
    NetSelectCB: TCheckBox;
    Label8: TLabel;
    Label7: TLabel;
    Label25: TLabel;
    Button11: TButton;
    Button1: TButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    p1_prev_btn: TButton;
    p1_next_btn: TButton;
    Label9: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    IP_Edit_Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    IP_Edit_a1: TEdit;
    IP_Edit_b1: TEdit;
    IP_Edit_c1: TEdit;
    IP_Edit_d1: TEdit;
    CloseButton: TButton;
    RadioGroup1: TRadioGroup;
    p2_prev_btn: TButton;
    p2_next_btn: TButton;
    Label6: TLabel;
    Button10: TButton;
    p3_prev_btn: TButton;
    p3_next_btn: TButton;
    ListBox1: TListBox;
    Label3: TLabel;
    Label23: TLabel;
    FindButton: TButton;
    Button5: TButton;
    SetButton: TButton;
    p4_prev_btn: TButton;
    Label2: TLabel;
    Label1: TLabel;
    Button6: TButton;
    Bevel1: TBevel;
    GroupBox4: TGroupBox;
    IP_Edit_Panel2: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    IP_Edit_a2: TEdit;
    IP_Edit_b2: TEdit;
    IP_Edit_c2: TEdit;
    IP_Edit_d2: TEdit;
    IP_Edit_Panel3: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    IP_Edit_a3: TEdit;
    IP_Edit_b3: TEdit;
    IP_Edit_c3: TEdit;
    IP_Edit_d3: TEdit;
    IP_Edit_Panel4: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    IP_Edit_a4: TEdit;
    IP_Edit_b4: TEdit;
    IP_Edit_c4: TEdit;
    IP_Edit_d4: TEdit;
    IPGatewayCB: TCheckBox;
    IPMaskCB: TCheckBox;
    IPAddrCB: TCheckBox;
    DhcpOnCB: TCheckBox;
    GroupBox1: TGroupBox;
    Button2: TButton;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    ControlMod0_RB: TRadioButton;
    ControlMod1_RB: TRadioButton;
    ControlMod2_RB: TRadioButton;
    ControlMod3_RB: TRadioButton;
    ControlMod4_RB: TRadioButton;
    IP_Edit_Panel5: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    IP_Edit_a5: TEdit;
    IP_Edit_b5: TEdit;
    IP_Edit_c5: TEdit;
    IP_Edit_d5: TEdit;
    ClientIPLabel: TLabel;
    PassLabel: TLabel;
    PassEdit: TEdit;
    MyIPButton: TButton;
    NoInitLabel: TLabel;
    IdUDP: TIdUDPClient;
    Timer: TTimer;
    Button3: TButton;
    ConfPanel: TPanel;
    procedure FindButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure IPCBClick(Sender: TObject);
    procedure SetButtonClick(Sender: TObject);
    procedure p1_next_btnClick(Sender: TObject);
    procedure p3_next_btnClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure p3_prev_btnClick(Sender: TObject);
    procedure p4_prev_btnClick(Sender: TObject);
    procedure p2_prev_btnClick(Sender: TObject);
    procedure p0_next_btnClick(Sender: TObject);
    procedure p1_prev_btnClick(Sender: TObject);
    procedure p2_next_btnClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure IP_Edit_KeyPress(Sender: TObject; var Key: Char);
    procedure IP_Edit_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IP_Edit_Change(Sender: TObject);
    procedure IP_PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DhcpOnCBClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure MyIPButtonClick(Sender: TObject);
    procedure ControlMod_RBClick(Sender: TObject);
    procedure PassEditChange(Sender: TObject);
    procedure DefConfButtonClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    messages: array[0..MaxPribors-1]of TFullMess;
    count_mess:integer;
    ipNet,ipMask,ipAddr: dword;
    CurIndex:integer;
    CurMess, SendMess: TFullMess;
    CurBADatas, SendBADatas : TBADatas;
    cur_ba_link, send_ba_link : TBA_link;
    send_process: boolean;
    CurPath:string;
    BA_ind: TBoardInd;
//    OptLink: tArrOptLink;

    BA_count: integer;
    DefaultConfig:integer;
    no_init_count: integer;

    procedure FindIPAddr;
    function AddrToStr(addr: dword):string;
    procedure AddrToStr2(num:integer; addr: dword);
    function NetToStr(addr,mask:dword):string;
    function TestAddr(AddrSt:string; var Addr :dword):boolean;
    procedure TestAddrMask(AddrSt:string; var Addr,Mask :dword);
    procedure CriptMess(numw: integer; mess: pMess_uni);
    function DecriptMess(numw: integer; var mess: pMess_uni):boolean;
    procedure EnableIPPanel(num:integer; en:boolean);
    function IPPanelResult(num:integer):string;
//    procedure EnableSetButton;
    procedure FindBlocks;
    procedure EnCrypt16(pass: string; var arr: tPassword);
    function DeCrypt16(arr: tPassword): string;
//    procedure ShowBASetting;
    procedure ShowBASetting2;
    procedure GetDefaultSetting(ind: integer);
    function GetDefaultIP(ip_request: dword): dword;
//    function GetBoardInd(var ind: integer): boolean;
    procedure ReadUDP;
    procedure ReadUDP_One(mess: pMess_uni; NumberBytes: Integer; FromIP: String; Port: Integer);
    function FindMess(ip_request: dword; zavod_num : word; var index: integer): boolean;
    procedure SendSetting;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

function WSAIoctl(s: TSocket; cmd: DWORD; lpInBuffer: PCHAR; dwInBufferLen:
  DWORD;
  lpOutBuffer: PCHAR; dwOutBufferLen: DWORD;
  lpdwOutBytesReturned: LPDWORD;
  lpOverLapped: POINTER;
  lpOverLappedRoutine: POINTER): Integer; stdcall; external 'WS2_32.DLL';

implementation

{$R *.DFM}
//******************************************************************************
procedure TForm1.FindButtonClick(Sender: TObject);
var i:integer;
begin
  if (NetSelectCB.Checked)or(RadioButton1.Checked) then FindBlocks
  else
  begin
    for i:=0 to RadioGroup1.Items.Count-1 do
    begin
      RadioGroup1.ItemIndex:=i;
      FindBlocks;
    end;
  end;
//  ReadUDP;

end;
//------------------------------------------------------------------------------
procedure TForm1.FindBlocks;
var
mess: pMess_uni;
send_arr: TBytes;
ip_addr,ip_mask :dword;
cs:dword;
st:string;
begin
  if RadioButton1.Checked then
  begin
    if not TestAddr(IPPanelResult(1),ip_addr) then
    begin
      ShowMessage('Адрес не корректный');
      exit;
    end;
    ip_mask:=0;
    ipAddr:=ip_addr;
    ipMask:=ip_mask;
    ipNet:=0;
  end
  else
  begin
    if RadioGroup1.ItemIndex<0 then exit;
    st:=RadioGroup1.Items[RadioGroup1.ItemIndex];
    TestAddrMask(st,ip_addr,ip_mask);
    ipMask:=ip_mask;
    ipNet:=ip_addr;
    ip_addr:=ip_addr or (ip_mask xor $ffffffff);
    ipAddr:=ip_addr;
  end;

  ListBox1.Items.Clear; count_mess:=0;
  no_init_count:=0; NoInitLabel.Caption:='';
  p3_next_btn.Enabled:=false;

  IdUDP.Host:=AddrToStr(ip_addr);
  SetLength(send_arr, 2*HEADER_LENG);
  mess:=@send_arr[0];
  mess.rec.header.command:=UDP_CMD_FIND;

  mess.rec.header.sub_command:=UDP_SUBCMD_GET_INFO;
  mess.rec.header.response:=0;
  mess.rec.header.reserve:=$ffff;
  mess.rec.header.zavod_num:=0;
  mess.rec.header.ip_request:=ip_addr;
  CriptMess(HEADER_LENG, mess);
  IdUDP.SendBuffer(send_arr);

  DeCriptMess(HEADER_LENG, mess);
  mess.rec.header.sub_command:=UDP_SUBCMD_GET_CONF;
  CriptMess(HEADER_LENG, mess);
  IdUDP.SendBuffer(send_arr);

  DeCriptMess(HEADER_LENG, mess);
  mess.rec.header.sub_command:=UDP_SUBCMD_GET_SETTING;
  CriptMess(HEADER_LENG, mess);
  IdUDP.SendBuffer(send_arr);

  SetLength(send_arr, 0);
end;

//------------------------------------------------------------------------------

procedure TForm1.FindIPAddr;
const SIO_GET_INTERFACE_LIST = $4004747F;
  IFF_UP = $00000001;
  IFF_LOOPBACK = $00000004;
var s: TSocket;
  wsaD: WSADATA;
  NumInterfaces: Integer;
  BytesReturned, SetFlags: u_long;
  PtrA: pointer;
  Buffer: array[0..20] of INTERFACE_INFO;
  i: Integer;
  ip_addr,ip_mask :dword;
begin
  WSAStartup($0101, wsaD);                      // Запускаем WinSock
  s := Socket(AF_INET, SOCK_STREAM, 0);          // Открываем сокет
  if (s = INVALID_SOCKET) then exit;
  PtrA := @bytesReturned;
  if (WSAIoCtl(s, SIO_GET_INTERFACE_LIST, nil, 0, @Buffer, 1024,
    PtrA, nil, nil) <> SOCKET_ERROR) then
  begin
    NumInterfaces := BytesReturned div SizeOf(INTERFACE_INFO);
    RadioGroup1.Items.Clear;
    for i := 0 to NumInterfaces - 1 do        // Для каждого интерфейса
    begin
      SetFlags := Buffer[i].iiFlags;
      if ((SetFlags and IFF_UP)<>0)and
         ((SetFlags and IFF_LOOPBACK)=0) then
      begin
        ip_addr:=Buffer[i].iiAddress.addressIn.sin_addr.s_addr;
        ip_mask:=Buffer[i].iiNetmask.addressIn.sin_addr.s_addr;
        RadioGroup1.Items.Add(NetToStr(ip_addr,ip_mask));
      end;
    end;
  end;
  if RadioGroup1.Items.Count>0 then RadioGroup1.ItemIndex:=0;
  CloseSocket(s);
  WSACleanUp;
  if RadioGroup1.Items.Count = 0 then
  begin
    Label25.Visible:=true;
    p0_next_btn.Enabled:=false;
  end
  else
  begin
    Label25.Visible:=false;
    p0_next_btn.Enabled:=true;
  end;
  if RadioGroup1.Items.Count<2 then NetSelectCB.Enabled:=false
  else NetSelectCB.Enabled:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.ReadUDP;
var buf: TBytes;
leng: integer;
peerIP: string;
peerPort: word;
begin
  SetLength(buf,3000);
//  Sleep(100);
  leng:=IdUDP.ReceiveBuffer(buf, peerIP, peerPort,0);
  while leng>0 do
  begin
    ReadUDP_One(@buf[0], leng, peerIP, peerPort);
    leng:=IdUDP.ReceiveBuffer(buf, peerIP, peerPort,0);
  end;
  SetLength(buf,0);
end;
//------------------------------------------------------------------------------
procedure TForm1.ReadUDP_One(mess: pMess_uni; NumberBytes: Integer; FromIP: String; Port: Integer);
var ind, i, j, arr_ind, arr_count, c1, c2: integer;
found_arr: array[0..7]of boolean;
all_ok: boolean;
mess_out: pMess_uni;
send_arr: TBytes;
st: string;
begin
//  if count_mess>=MaxPribors then exit;
  if port<>ATP_PORT then exit;

  if (NumberBytes<>2*HEADER_LENG)and
     (NumberBytes<>2*HEADER_LENG+SizeOf(TBoardsInfo))and
     (NumberBytes<>2*HEADER_LENG+SizeOf(tInitData))and
     (NumberBytes<>2*HEADER_LENG+SizeOf(tSetData))and
     (NumberBytes<>2*HEADER_LENG+8*SizeOf(tOptControl)) then exit;
  if not DecriptMess(NumberBytes div 2, mess) then exit;

  if (mess.rec.header.command = UDP_CMD_STAT)and
     (mess.rec.header.zavod_num<>0) then
  begin
    if FindMess(mess.rec.header.ip_request, mess.rec.header.zavod_num, ind) then
    begin
      case mess.rec.header.sub_command of
        UDP_SUBCMD_GET_INFO:
        begin
          messages[ind].b_info:=mess.rec.data.b_info;
          messages[ind].isInfo:=true;
        end;
        UDP_SUBCMD_GET_CONF:
        begin
          messages[ind].init:=mess.rec.data.init;
          messages[ind].isInit:=true;
          for i:=0 to 7 do found_arr[i]:=false;
//          found_arr1:=false; found_arr2:=false;
          for i:=0 to MAX_BOARD_DESCR-1 do
          begin
            arr_ind:=mess.rec.data.init.board_descriptor[i].arr_ind_set{ and $4f}; //
            arr_count:=(arr_ind shr 5)and $07;
            arr_ind:=arr_ind and $1f;
            for j:=arr_ind to arr_ind+arr_count-1 do
            begin
//              if arr_ind in [0..7] then found_arr1:=true;
//              if arr_ind in [8..15] then found_arr2:=true;
              if arr_ind in[0..31] then found_arr[j div 4]:=true;
//              if arr_ind>=0 then found_arr1:=true;
//              if arr_ind>=8 then found_arr2:=true;
            end;
          end;
          for i:=0 to 7 do
          begin
            if (found_arr[i])and(not messages[ind].isArrs[i])and(not messages[ind].reqArrs[i]) then
            begin
              messages[ind].reqArrs[i]:=true;
              SetLength(send_arr, 2*HEADER_LENG);
              mess_out:=@send_arr[0];
              mess_out.rec.header.command:=UDP_CMD_FIND;
              mess_out.rec.header.sub_command:=UDP_SUBCMD_GET_ARROPT1+i;
              mess_out.rec.header.response:=0;
              mess_out.rec.header.ip_request:=mess.rec.header.ip_request;
              mess_out.rec.header.zavod_num:=mess.rec.header.zavod_num;
              CriptMess(HEADER_LENG, mess_out);
              IdUDP.Host:=AddrToStr(mess.rec.header.ip_request);
              idUDP.SendBuffer(send_arr);
              SetLength(send_arr, 0);
            end;
          end;
      {    if (found_arr2)and(not messages[ind].isArrs2)and(not messages[ind].reqArrs2) then
          begin
            messages[ind].reqArrs2:=true;
            SetLength(send_arr, 2*HEADER_LENG);
            mess_out:=@send_arr[0];
            mess_out.rec.header.command:=UDP_CMD_FIND;
            mess_out.rec.header.sub_command:=UDP_SUBCMD_GET_ARROPT1;
            mess_out.rec.header.response:=0;
            mess_out.rec.header.ip_request:=mess.rec.header.ip_request;
            mess_out.rec.header.zavod_num:=mess.rec.header.zavod_num;
            CriptMess(HEADER_LENG, mess_out);
            IdUDP.Host:=AddrToStr(mess.rec.header.ip_request);
            idUDP.SendBuffer(send_arr);
            SetLength(send_arr, 0);
          end;   }
        end;
        UDP_SUBCMD_GET_SETTING:
        begin
          messages[ind].sett:=mess.rec.data.sett;
          messages[ind].isSett:=true;
        end;
        UDP_SUBCMD_GET_ARROPT1..UDP_SUBCMD_GET_ARROPT8:
        begin
          arr_ind:=mess.rec.header.sub_command-UDP_SUBCMD_GET_ARROPT1;
          move(mess.rec.data.arrs, messages[ind].arrs[arr_ind*4], SizeOf(mess.rec.data.arrs));
          messages[ind].isArrs[arr_ind]:=true;
        end;
    {    UDP_SUBCMD_GET_ARROPT2:
        begin
          move(mess.rec.data.arrs, messages[ind].arrs[8], SizeOf(mess.rec.data.arrs));
          messages[ind].isArrs2:=true;
        end;     }
      end;
//      messages[count_mess]:=mess^;
      st:=ListBox1.Items[ind];
      st:=copy(st, length(st)-1, 2);
      if st<>'OK' then
      begin
        all_ok:=(messages[ind].isInfo)and(messages[ind].isInit)and(messages[ind].isSett);
        for i:=0 to 7 do
          if (messages[ind].reqArrs[i])and(not messages[ind].isArrs[i]) then all_ok:=false; // запрос массивов есть, но массивов еще нет
//        if (messages[ind].reqArrs2)and(not messages[ind].isArrs2) then all_ok:=false; // запрос массивов есть, но массивов еще нет
        if all_ok then
        begin
//          ListBox1.Items[ind]:=ListBox1.Items[ind]+'  OK';
          ListBox1.Items[ind]:=IntToStr(messages[ind].zavod_num)+'  OK';
          p3_next_btn.Enabled:=true;
          if ind=0 then
          begin
            ListBox1.ItemIndex:=0;
            ListBox1Click(nil);
          end;
        end
        else
        begin
          c1:=0;
          if messages[ind].isInfo then inc(c1);
          if messages[ind].isInit then inc(c1);
          if messages[ind].isSett then inc(c1);
          for i:=0 to 7 do if messages[ind].isArrs[i] then inc(c1);
//          if messages[ind].isArrs2 then inc(c1);
          c2:=3;
          for i:=0 to 7 do if messages[ind].reqArrs[i] then inc(c2);
//          if messages[ind].reqArrs2 then inc(c2);
          ListBox1.Items[ind]:=IntToStr(messages[ind].zavod_num)+'  '+IntToStr(c1)+'/'+IntToStr(c2);
        end;
      end;
    end;
  end;
  if (mess.rec.header.command = UDP_CMD_STAT)and
     (mess.rec.header.zavod_num=0) then
  begin
    inc(no_init_count);
    NoInitLabel.Caption:='Найдено неинициализированных приборов: '+IntToStr(no_init_count);
  end;

  if (mess.rec.header.command = UDP_CMD_SET_OK)and
     (mess.rec.header.zavod_num = Messages[CurIndex].zavod_num) then
  begin
      case mess.rec.header.sub_command of
        UDP_SUBCMD_BURN:
        begin
          Messages[CurIndex]:=SendMess;
          if send_process then
          begin
            send_process:=false;
            ShowMessage('Установка завершена успешно');
          end;
        end;
        UDP_SUBCMD_SET_SETTING:
        begin
          SendMess.send_step:=1;
          SendMess.send_count:=0;
        end;
        UDP_SUBCMD_SET_ARROPT1:
        begin
          SendMess.send_step:=2;
          SendMess.send_count:=0;
        end;
        UDP_SUBCMD_SET_ARROPT2:
        begin
          SendMess.send_step:=100;
          SendMess.send_count:=0;
        end;
      end;
//    ShowMessage('Установка завершена успешно');

    PageControl1.ActivePageIndex:=0;
  end;
end;
//------------------------------------------------------------------------------
function TForm1.FindMess(ip_request: dword; zavod_num : word; var index: integer): boolean;
var
i: integer;
begin
  for i:=0 to count_mess-1 do
    if (messages[i].ip_request=ip_request)and(messages[i].zavod_num=zavod_num) then
    begin
      result:=true;
      index:=i;
      exit;
    end;

  if (count_mess<0)or(count_mess>=MaxPribors) then begin result:=false; exit; end;
  messages[count_mess].ip_request:=ip_request;
  messages[count_mess].zavod_num:=zavod_num;
  messages[count_mess].isInfo:=false;
  messages[count_mess].isInit:=false;
  messages[count_mess].isSett:=false;
  for i:=0 to 7 do
  begin
    messages[count_mess].isArrs[i]:=false;
//    messages[count_mess].isArrs2:=false;
    messages[count_mess].reqArrs[i]:=false;
//    messages[count_mess].reqArrs2:=false;
  end;
  result:=true;
  index:=count_mess;
  inc(count_mess);
  ListBox1.Items.Add(IntToStr(zavod_num));
end;
//------------------------------------------------------------------------------
function TForm1.AddrToStr(addr: dword):string;
var st:string;
begin
  st:=IntToStr(addr and $ff)+'.';
  st:=st+IntToStr((addr div $100) and $ff)+'.';
  st:=st+IntToStr((addr div $10000) and $ff)+'.';
  st:=st+IntToStr((addr div $1000000) and $ff);
  result:=st;
end;
//------------------------------------------------------------------------------
procedure TForm1.AddrToStr2(num:integer; addr: dword);
var Edit:TEdit; i:integer;
begin
  for i:=ord('a') to ord('d') do
  begin
    Edit:=TEdit(FindComponent('IP_Edit_'+char(i)+IntToStr(num)));
    if Edit<>nil then Edit.Text:=IntToStr(addr and $ff);
    addr:=addr div $100;
  end;
end;
//------------------------------------------------------------------------------
function TForm1.NetToStr(addr,mask:dword):string;
var i,k:dword;
begin
  k:=$1;
  for i:=0 to 31 do
  begin
    if (mask and k)=0 then break;
    k:=k * 2;
  end;
  result:=AddrToStr(addr)+'/'+IntToStr(i);
end;
//------------------------------------------------------------------------------

procedure TForm1.FormCreate(Sender: TObject);
var i,pch: integer;
tab:TTabSheet;
rect: trect;
begin
  atpBD.WorkMode:=false;
  for i:=0 to MAX_BA_NUM-1 do
  begin
    BD.BA_info[i]:=TBlockAnalise.Create(self);
    BD.BA_info[i].BA:=i;
  end;

  send_process:=false;

  Label4.Caption:='Анализатор подключен непосредственно'+#13+
                  'к компьютеру, либо анализатор и компьютер'+#13+
                  'включены в одну подсеть.';
  Label5.Caption:='Анализатор и компьютер находятся'+#13+
                  'в разных подсетях.';
  Label7.Caption:='Эта программа предназначена для настройки'+#13+
                  'протокола TCP/IP в АТП.'+#13+#13+
                  '1. Подключите анализатор к компьютеру при'+#13+
                  '    помощи кабеля "PathCord" (кросс), либо'+#13+
                  '    соедините его с коммутатором нужной '+#13+
                  '    подсети.'+#13+
                  '2. Включите питание анализатора.'+#13+
                  '3. Нажмите кнопку "Далее".';

  pch:=rect.Top;
  for i:=1 to PageControl1.PageCount do
  begin
    tab:=TTabSheet(FindComponent('TabSheet'+IntToStr(i)));
    if tab<>nil then
    begin
      tab.TabVisible:=false;
    end;
  end;

  PageControl1.ActivePageIndex:=0;
  Height:=Height-20;

  IdUDP.Port:=ATP_PORT;
  FindIPAddr;
  for i:=0 to 3 do PreSetConfButtons.button[i].conf:=i;
end;
//------------------------------------------------------------------------------

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    Label9.Enabled:=true;
    EnableIPPanel(1,true);
    RadioGroup1.Enabled:=false;
  end
  else
  begin
    Label9.Enabled:=false;
    EnableIPPanel(1,false);
    RadioGroup1.Enabled:=true;
  end;
end;
//------------------------------------------------------------------------------
function TForm1.TestAddr(AddrSt:string; var Addr :dword):boolean;
var st:string;
p,d,err,i:integer;
k:dword;
begin
  result:=false;
  Addr:=0; k:=1;
  for i:=0 to 3 do
  begin
    if i=3 then p:=255 else
    begin
      p:=pos('.',AddrSt);
      if p=0 then exit;
    end;
    st:=copy(AddrSt,1,p-1);
    val(st,d,err);
    if err<>0 then exit;
    Addr:=Addr+k*d;
    if i<>3 then k:=k*$100;
    Delete(AddrSt,1,p);
  end;
  result:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.TestAddrMask(AddrSt:string; var Addr,Mask :dword);
var p,d,err,i:integer;
k:dword;
begin
  p:=pos('/',AddrSt);
  TestAddr(copy(AddrSt,1,p-1),Addr);
  val(copy(AddrSt,p+1,255),d,err);
  k:=1; Mask:=0;
  for i:=1 to d do
  begin
    Mask:=Mask or k;
    k:=k*2;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.TimerTimer(Sender: TObject);
var ba, targ: integer;
st: string;
begin
  ReadUDP;

  for ba:=0 to BD.BoardCount-1 do
  begin
    if atpBD.ModeData[ba].change_in then
    begin
      ConfigForm.SetMode(ba, atpBD.ModeData[ba].Mode, 6, true, true, $ffff, 0);
      atpBD.ModeData[ba].change_in:=false;
      targ:=CurBADatas[ba].targ;
      if ConfigForm.Config<>nil then
      begin
        if BD.CurInputNames[ba]<>ConfigForm.Config.CurInputName[ba] then
          BD.CurInputNames[ba]:=ConfigForm.Config.CurInputName[ba];
      end;

      if (targ>=0)and(targ<MAX_TARGET) then CurMess.sett.board_mode[targ]:=atpBD.ModeData[ba].Mode;
    end;
  end;

  if send_process then SendSetting;

  st:=ConfigForm.ConfName+' ('+copy(ConfigForm.ConfigHintST.Caption,2,255)+')';
  if ConfPanel.Caption<>st then ConfPanel.Caption:=st;

end;

//------------------------------------------------------------------------------

procedure TForm1.ListBox1Click(Sender: TObject);
var st:string;
i, in_opt_count, conf, targ: integer;
inInd1,outInd1,inInd2,outInd2,inPort,outPort: integer;
ol: tOptLink;
begin
  CurIndex:=ListBox1.ItemIndex;
  if CurIndex<0 then exit;
  CurMess:=Messages[CurIndex];

  IPAddrCB.Visible:=true;
  IPAddrCB.Checked:=false;
  IPMaskCB.Visible:=true;
  IPMaskCB.Checked:=false;
  IPGatewayCB.Visible:=true;
  IPGatewayCB.Checked:=false;
  EnableIPPanel(2,false);
  IP_Edit_Panel2.Tag:=integer(CurMess.sett.ip_addr);
  AddrToStr2(2,IP_Edit_Panel2.Tag);
  EnableIPPanel(3,false);
  IP_Edit_Panel3.Tag:=integer(CurMess.sett.ip_mask);
  AddrToStr2(3,IP_Edit_Panel3.Tag);
  EnableIPPanel(4,false);
  IP_Edit_Panel4.Tag:=integer(CurMess.sett.ip_gateway);
  AddrToStr2(4,IP_Edit_Panel4.Tag);
  DhcpOnCB.Tag:=CurMess.sett.dhcp and $01;
  DhcpOnCB.Checked:=DhcpOnCB.Tag<>0;
  Label2.Caption:='Анализатор зав.номер № '+
    IntToStr(CurMess.zavod_num);
  st:=AddrToStr(CurMess.ip_request);
  Label1.Caption:='IP адрес запроса:   '+st;
  IdUDP.Host:=st;

  if CurMess.sett.control_mode=$ff then
  begin  // Default
    ControlMod0_RB.Checked:=true;
    AddrToStr2(5,GetDefaultIP(CurMess.ip_request));
    PassEdit.Text:='';
  end
  else
  begin
    case CurMess.sett.control_mode of
      0: ControlMod0_RB.Checked:=true;
      1: ControlMod1_RB.Checked:=true;
      2: ControlMod2_RB.Checked:=true;
      3: ControlMod3_RB.Checked:=true;
      else ControlMod4_RB.Checked:=true;
    end;
    AddrToStr2(5,CurMess.sett.control_ip);
    PassEdit.Text:=DeCrypt16(CurMess.sett.control_pass);
  end;

  for i:=0 to MAX_BA_NUM-1 do BA_ind[i]:=0;

  ShowBASetting2;

end;
//------------------------------------------------------------------------------

procedure TForm1.IPCBClick(Sender: TObject);
var
CB:tCheckBox;
Panel:tPanel;
st:string; num:integer;
begin
  CB:=TCheckBox(Sender);
  if CB=nil then exit;
  if CB.Name='IPAddrCB' then num:=2
  else if CB.Name='IPMaskCB' then num:=3
  else if CB.Name='IPGatewayCB' then num:=4
  else exit;
  if CB.Checked then EnableIPPanel(num,true)
  else
  begin
    EnableIPPanel(num,false);
    Panel:=TPanel(FindComponent('IP_Panel'+IntToStr(num)));
    if Panel<>nil then AddrToStr2(num,Panel.Tag);
  end;
//  EnableSetButton;
end;
//------------------------------------------------------------------------------
procedure TForm1.CriptMess(numw: integer; mess: pMess_uni);
var cs: word;
i: integer;
begin
  cs:=0;
  for i:=1 to numw-1 do cs:=(cs+mess.arr[i])and $ffff;      
  mess.rec.header.checksum:=($80000000 - cs)and $0000ffff;
  for i:=1 to numw-1 do mess.arr[i]:=mess.arr[i] xor mess.rec.header.checksum;
end;
//------------------------------------------------------------------------------
function TForm1.DecriptMess(numw: integer; var mess: pMess_uni):boolean;
var i:integer;
cs: dword;
begin
  result:=false;
  for i:=1 to numw-1 do mess.arr[i]:=mess.arr[i] xor mess.rec.header.checksum;
  cs:=0;
  for i:=0 to numw-1 do cs:=cs+mess.arr[i];
  cs:=cs and $0000ffff;
  if cs<>0 then exit;
  result:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------
// --- panel 0 ---
procedure TForm1.p0_next_btnClick(Sender: TObject);
begin
  p1_next_btnClick(Sender);
end;

//------------------------------------------------------------------------------
// --- panel 1 ---
procedure TForm1.p1_prev_btnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

procedure TForm1.p1_next_btnClick(Sender: TObject);
var i:integer;
begin
//  FindIPAddr;
  if RadioButton1.Checked then
  begin
    FindButtonClick(Sender);
    PageControl1.ActivePageIndex:=3;
  end
  else
    case RadioGroup1.Items.Count of
      0: begin
           Label6.Caption:='В системе не обнаружено сетевых устройств.';
           RadioGroup1.Visible:=false;
           p2_next_btn.Visible:=false;
           PageControl1.ActivePageIndex:=2;
         end;
      1: begin
           FindButtonClick(Sender);
           PageControl1.ActivePageIndex:=3;
         end;
      else begin
             if NetSelectCB.Checked then
             begin
               Label6.Caption:='В системе обнаружено несколько сетевых'+#13+
                               'устройств. Выберите подсеть к которой'+#13+
                               'подключен анализатор.';
               RadioGroup1.Visible:=true;
               p2_next_btn.Visible:=true;
               PageControl1.ActivePageIndex:=2;
             end
             else
             begin
               FindButtonClick(Sender);
               PageControl1.ActivePageIndex:=3;
             end;
           end;
    end;
end;
//------------------------------------------------------------------------------
// --- panel 2 ---

procedure TForm1.p2_prev_btnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
end;

procedure TForm1.p2_next_btnClick(Sender: TObject);
begin
  FindButtonClick(Sender);
  PageControl1.ActivePageIndex:=3;
end;

//------------------------------------------------------------------------------
// --- panel 3 ---

procedure TForm1.p3_prev_btnClick(Sender: TObject);
begin
  if (RadioButton1.Checked)or
     (RadioGroup1.Items.Count=1)or
     (not NetSelectCB.Checked) then PageControl1.ActivePageIndex:=0
  else
    begin
      Label6.Caption:='В системе обнаружено несколько сетевых'+#13+
                      'устройств. Выберите подсеть к которой'+#13+
                      'подключен анализатор.';
      RadioGroup1.Visible:=true;
      p2_next_btn.Visible:=true;
      PageControl1.ActivePageIndex:=2;
    end;
end;

procedure TForm1.p3_next_btnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=4;
//  EnableSetButton;
end;

//------------------------------------------------------------------------------
// --- panel 4 ---

procedure TForm1.p4_prev_btnClick(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=3;
end;
//------------------------------------------------------------------------------

procedure TForm1.SetButtonClick(Sender: TObject);
begin
  CurMess.arrs:=BD.OptControlArr;
  SendMess:=CurMess;
  SendBADatas:=CurBADatas;
  send_ba_link:=cur_ba_link;

  SendMess.send_step:=0;
  SendMess.send_count:=0;
  SendMess.time_count:=0;
  send_process:=true;
end;
//------------------------------------------------------------------------------
procedure TForm1.SendSetting;
var mess: pMess_uni;
dhcp:byte;
dat: dword;
send_arr: TBytes;
leng, i, arr_pack: integer;
begin
  if not send_process then exit;
  if SendMess.time_count>0 then dec(SendMess.time_count);
  if SendMess.time_count>0 then exit;

  if SendMess.send_count>5 then
  begin
    send_process:=false;
    ShowMessage('Ошибка установки.'+#13+'Нет ответа от прибора.');
    exit;
  end;

  for i:=0 to 6 do
    if SendMess.send_step=i+1 then if not SendMess.reqArrs[i] then SendMess.send_step:=i+2;
  if SendMess.send_step=8 then if not SendMess.reqArrs[7] then SendMess.send_step:=100;

  if SendMess.send_step=100 then leng:=HEADER_LENG else leng:=SET_LENG;
  if SendMess.send_step>100 then exit;

  SetLength(send_arr, 2*leng);
  mess:=@send_arr[0];
  case SendMess.send_step of
    0: begin
         mess.rec.data.sett:=SendMess.sett;
         mess.rec.header.sub_command:=UDP_SUBCMD_SET_SETTING;
         SendMess.time_count:=2;
       end;
    1..8: begin
         arr_pack:=SendMess.send_step-1;
         move(SendMess.arrs[arr_pack*4], mess.rec.data.arrs, SizeOf(mess.rec.data.arrs));
         mess.rec.header.sub_command:=UDP_SUBCMD_SET_ARROPT1+arr_pack;
         SendMess.time_count:=2;
       end;
{    2: begin
         move(SendMess.arrs[8], mess.rec.data.arrs, SizeOf(mess.rec.data.arrs));
         mess.rec.header.sub_command:=UDP_SUBCMD_SET_ARROPT2;
         SendMess.time_count:=2;
       end;    }
    100: begin
         mess.rec.header.sub_command:=UDP_SUBCMD_BURN;
         SendMess.send_step:=101;
         SendMess.time_count:=10;
       end;
  end;
  mess.rec.header.command:=UDP_CMD_SET;
  mess.rec.header.response:=0;
  mess.rec.header.ip_request:=SendMess.ip_request;
  mess.rec.header.zavod_num:=SendMess.zavod_num;
  mess.rec.header.reserve:=$ffff;
  CriptMess(leng, mess);

  IdUDP.SendBuffer(send_arr);
  inc(SendMess.send_count);
  SetLength(send_arr, 0);
end;
//------------------------------------------------------------------------------

procedure TForm1.Label4Click(Sender: TObject);
begin
  RadioButton2.Checked:=true;
end;
//------------------------------------------------------------------------------

procedure TForm1.Label5Click(Sender: TObject);
begin
  RadioButton1.Checked:=true;
end;
//------------------------------------------------------------------------------

procedure TForm1.IP_Edit_KeyPress(Sender: TObject; var Key: Char);
var Edit,NextEdit:TEdit;
st:string; p:char;
dat:dword;
err,i,maxval:integer;
begin
  if Key=#8 then exit;
  if (Key<'0')or(Key>'9') then begin Key:=#0; exit; end;

  Edit:=TEdit(Sender);
  maxval:=255; // StreamIDEdit
  if Edit.Name='PIDEdit'then maxval:=8190;
  if Edit.Name='StreamIDEdit'then maxval:=7;

  NextEdit:=nil;
  if Copy(Edit.Name,1,7)='IP_Edit'then
  begin
    p:=Edit.Name[9];
    if p<>'d' then 
    begin
      st:=Edit.Name; st[9]:=char(ord(p)+1);
      NextEdit:=TEdit(FindComponent(st));
    end;
  end;

  Edit.ClearSelection;
  for i:=1 to Length(Edit.Text) do
    if (Edit.Text[i]<'0')or(Edit.Text[i]>'9') then begin Edit.Text:=''; break; end;
  if Edit.Text = '0' then Edit.SelStart :=1;

  st:=Edit.Text;
  Insert(Key,st,Edit.SelStart+1);
  val(st,dat,err);
  if (err<>0)or(dat>maxval) then begin Key:=#0; exit; end;

  if NextEdit<>nil then
    if Length(Edit.Text)=2 then NextEdit.SetFocus;
end;
//------------------------------------------------------------------------------

procedure TForm1.IP_Edit_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var Edit,NextEdit,PrevEdit:TEdit;
st:string; p:char;
begin
  if (Key<>37)and(Key<>39) then exit;
  Edit:=TEdit(Sender);

  p:=Copy(Edit.Name,9,1)[1];
  if p='d' then NextEdit:=nil
  else
  begin
    st:=Edit.Name; st[9]:=char(ord(p)+1);
    NextEdit:=TEdit(FindComponent(st));
  end;
  if p='a' then PrevEdit:=nil
  else
  begin
    st:=Edit.Name; st[9]:=char(ord(p)-1);
    PrevEdit:=TEdit(FindComponent(st));
  end;

  if NextEdit<>nil then
    if (Key=39)and(Edit.SelStart=Length(Edit.Text)) then
    begin
      if Edit.Text='' then Edit.Text:='0';
      NextEdit.SetFocus;
    end;
  if (Key=37)and(Edit.SelLength>0) then Edit.SelLength:=0
  else if PrevEdit<>nil then
         if (Key=37)and(Edit.SelStart=0) then
         begin
           if Edit.Text='' then Edit.Text:='0';
           PrevEdit.SetFocus;
         end;

end;
//------------------------------------------------------------------------------

procedure TForm1.EnableIPPanel(num:integer; en:boolean);
var Edit:TEdit; Panel:TPanel; i:integer;
begin
  Panel:=TPanel(FindComponent('IP_Edit_Panel'+IntToStr(num)));
  if Panel<>nil then Panel.Enabled:=en;
  for i:=ord('a') to ord('d') do
  begin
    Edit:=TEdit(FindComponent('IP_Edit_'+char(i)+IntToStr(num)));
    if Edit<>nil then Edit.Enabled:=en;
  end;
end;

//------------------------------------------------------------------------------
function TForm1.IPPanelResult(num:integer):string;
var Edit:TEdit; i:integer; st:string;
begin
  result:='';
  for i:=ord('a') to ord('d') do
  begin
    Edit:=TEdit(FindComponent('IP_Edit_'+char(i)+IntToStr(num)));
    st:='0';
    if Edit<>nil then
    begin
      if Edit.Text='' then Edit.Text:='0';
      st:=Edit.Text;
    end;
    result:=result+'.'+st;
  end;
  Delete(result,1,1);
end;
//------------------------------------------------------------------------------

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
//  EnableSetButton;
end;
//------------------------------------------------------------------------------

procedure TForm1.IP_Edit_Change(Sender: TObject);
var Edit:TEdit;
p,ind:integer;
st:string;
dat: dword;
Panel: TPanel;
begin
  Edit:=TEdit(Sender);
  ind:=ord(Edit.Name[10])-48;

  Panel:=TPanel(FindComponent('IP_Edit_Panel'+IntToStr(ind)));
  if Panel=nil then p:=(ord(Edit.Name[9])-96)*30-15
  else p:=((ord(Edit.Name[9])-96)*2-1)*Panel.Width div 8;

  p:=(ord(Edit.Name[9])-96)*30-15;
  st:=Edit.Text;
  while (Length(st)>1)and(st[1]='0') do Delete(st,1,1);
  if Edit.Text<>st then
  begin
    Edit.Text:=st;
    Edit.SelStart:=Edit.GetTextLen;
  end;
  Edit.Width:=canvas.TextWidth(Edit.text);
  if Edit.Width<2 then Edit.Width:=2;
  Edit.Left:=p-(Edit.Width div 2);
  p:=Edit.SelStart;
  Edit.SelStart:=0;
  Edit.SelStart:=p;
  case ind of
    2: if TestAddr(IPPanelResult(2),dat)then CurMess.sett.ip_addr:=dat;
    3: if TestAddr(IPPanelResult(3),dat)then CurMess.sett.ip_mask:=dat;
    4: if TestAddr(IPPanelResult(4),dat)then CurMess.sett.ip_gateway:=dat;
    5: if TestAddr(IPPanelResult(5),dat)then CurMess.sett.control_ip:=dat;
  end; 
//  EnableSetButton;
end;
//------------------------------------------------------------------------------

procedure TForm1.IP_PanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Panel:TPanel; Edit:TEdit; numEdit:char; numPanel:string;
begin
  Panel:=TPanel(Sender);
  numPanel:=copy(Panel.Name,9,255);
  numEdit:=Char((X div 30)+97);
  Edit:=TEdit(FindComponent('IP_Edit_'+numEdit+numPanel));
  if Edit<>nil then
  begin
    Edit.SetFocus;
    Edit.SelLength:=0;
    if (X mod 30)<15 then Edit.SelStart:=0
    else Edit.SelStart:=Edit.GetTextLen;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.DhcpOnCBClick(Sender: TObject);
begin
  if DhcpOnCB.Checked then CurMess.sett.dhcp:=1
  else CurMess.sett.dhcp:=0;
//  EnableSetButton;
end;
//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
begin
  FindIPAddr;
end;

//------------------------------------------------------------------------------
procedure TForm1.Button2Click(Sender: TObject);
begin
  IPAddrCB.Checked:=true;
  IPMaskCB.Checked:=true;
  IPGatewayCB.Checked:=true;
  DhcpOnCB.Checked:=true;
  AddrToStr2(2,$0101a8c0);
  AddrToStr2(3,$00ffffff);
  AddrToStr2(4,0);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ConfigForm.ConfPreSetSB.Visible:=false;
  ConfigForm.OKBitBtn.visible:=true;
  ConfigForm.RightGB.visible:=false;
  ConfigForm.ShowModal;
end;

//------------------------------------------------------------------------------

procedure TForm1.EnCrypt16(pass: string; var arr: tPassword);
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
function TForm1.DeCrypt16(arr: tPassword): string;
var i, key: integer;
data,dd: byte;
ch: byte;
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
procedure TForm1.ShowBASetting2;
var BADatas: TBADatas;
ba, targ, i, j: integer;
ba_link: TBA_link;
begin
  BD.BoardCount:=ParsingDeviceInfo_v3(@CurMess.init.board_descriptor, CurMess.b_info,
    BADatas, BD.OptArrDatasSet, BD.OptArrDatasStatus, ba_link);
  for ba:=0 to BD.BoardCount-1 do BD.BA_info[ba].BAData:=BADatas[ba];

  BD.OptControlArr:=CurMess.arrs;
  for i:=0 to MAX_OPT_ARR-1 do
    if BD.OptArrDatasSet[i].brd_ind>=0 then
      if BD.OptControlArr[i].data.arr[1]=255 then
      begin
        if BD.OptArrDatasSet[i].isInOpt then GetDefaultInOptionSetting(1, BD.OptArrDatasSet[i].opt_ind, @BD.OptControlArr[i], BD.OptArrDatasSet[i].arrofs)
        else GetDefaultOutOptionSetting(1, BD.OptArrDatasSet[i].opt_ind, @BD.OptControlArr[i], BD.OptArrDatasSet[i].arrofs);
      end;

  ConfigForm.Init;
  for ba:=0 to BD.BoardCount-1 do
  begin
    targ:=BADatas[ba].targ;
    ConfigForm.SetMode(ba, CurMess.sett.board_mode[targ], 6, true, true, $ffff, 0);
    if ConfigForm.Config.Boards[0].BoardType=2 then ConfigForm.Config.Boards[0].Enabled:=false;
    BD.CurInputNames[ba]:=ConfigForm.Config.CurInputName[ba];
  end;

  Create_ts_src_id_list;
  CurBADatas:=BADatas;
  cur_ba_link:=ba_link;
end;
//------------------------------------------------------------------------------
procedure TForm1.TabControl1Change(Sender: TObject);
begin
  ShowBASetting2;
end;
//------------------------------------------------------------------------------
procedure TForm1.GetDefaultSetting(ind: integer);
var inInd,outInd,inPort,outPort,i: integer;
mode: TMode;
begin
  if (ind<0)or(ind>3)then exit;
  inInd:=0; outInd:=0;
  if inInd=0 then mode.input_select:=1 else mode.input_select:=0;
  if outInd=-1 then mode.input_select:=mode.input_select + 2;
  mode.t2mi_plp:=0;
  mode.t2mi_pid:=4096;
  mode.multy_id:=0;
  CurMess.sett.board_mode[ind]:=mode;
end;
//------------------------------------------------------------------------------
function TForm1.GetDefaultIP(ip_request: dword): dword;
var i: integer;
ip_addr,ip_mask :dword;
begin
  result:=0;
  for i:=0 to RadioGroup1.Items.Count-1 do
  begin
    TestAddrMask(RadioGroup1.Items[i],ip_addr,ip_mask);
    if (ip_addr and ip_mask)=(ip_request and ip_mask) then
    begin
      result:=ip_addr;
      exit;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.MyIPButtonClick(Sender: TObject);
begin
  AddrToStr2(5,GetDefaultIP(CurMess.ip_request));
end;
//------------------------------------------------------------------------------

procedure TForm1.ControlMod_RBClick(Sender: TObject);
var cm: byte;
Enabled: boolean;
begin
  cm:=TRadioButton(Sender).Tag;
  Enabled:=cm in[1,3];
  EnableIPPanel(5,Enabled);
  MyIPButton.Enabled:=Enabled;
  ClientIPLabel.Enabled:=Enabled;
  Enabled:=cm in[2,3];
  PassEdit.Enabled:=Enabled;
  PassLabel.Enabled:=Enabled;
  CurMess.sett.control_mode:=cm;
//  EnableSetButton;
end;
//------------------------------------------------------------------------------

procedure TForm1.PassEditChange(Sender: TObject);
begin
  EnCrypt16(PassEdit.Text, CurMess.sett.control_pass);
//  EnableSetButton;
end;
//------------------------------------------------------------------------------

procedure TForm1.DefConfButtonClick(Sender: TObject);
var SB: TSpeedButton;
begin
end;
//------------------------------------------------------------------------------

end.
