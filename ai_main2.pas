unit ai_main2;

interface

uses
  list, MyTypes, options, constants,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, WinSock, Mask, ComCtrls, inifiles, Dialog,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;

const
MAC_H = ord('A')*256+ord('T');
MaxPribors = 100;
ATP_INIT_PORT = 3870;
UDP_CMD_FIND_INIT = 25;
UDP_CMD_STAT_INIT = 25;
UDP_SUBCMD_GET_INFO    = 1;  // самодиагностики (какие платы обнаружены)
UDP_SUBCMD_GET_CONF    = 2;  // Заводские параметры конфигурации прибора
UDP_SUBCMD_GET_ARROPT1 = 4;  // массивы 1-4
UDP_SUBCMD_GET_ARROPT2 = 5;  // массивы 5-8
UDP_SUBCMD_GET_ARROPT3 = 6;  // массивы 9-12
UDP_SUBCMD_GET_ARROPT4 = 7;  // массивы 13-16
UDP_SUBCMD_GET_ARROPT5 = 8;  // массивы 17-20
UDP_SUBCMD_GET_ARROPT6 = 9;  // массивы 21-24
UDP_SUBCMD_GET_ARROPT7 = 10; // массивы 25-28
UDP_SUBCMD_GET_ARROPT8 = 11; // массивы 29-32

UDP_CMD_INIT = 27;
UDP_CMD_INIT_OK = 27;
UDP_SUBCMD_BURN        = 0; // выполнить запись всех полученных параметров в энергонезависимую память
UDP_SUBCMD_SET_CONF    = 1; // скопировать конфигурацию прибора в оперативную память
UDP_SUBCMD_SET_ARROPT1 = 2; // массивы 1-4
UDP_SUBCMD_SET_ARROPT2 = 3; // массивы 5-8
UDP_SUBCMD_SET_ARROPT3 = 4; // массивы 9-12
UDP_SUBCMD_SET_ARROPT4 = 5; // массивы 13-16
UDP_SUBCMD_SET_ARROPT5 = 6; // массивы 17-20
UDP_SUBCMD_SET_ARROPT6 = 7; // массивы 21-24
UDP_SUBCMD_SET_ARROPT7 = 8; // массивы 25-28
UDP_SUBCMD_SET_ARROPT8 = 9; // массивы 29-32

UDP_CMD_RUN_DIAGN     = 64;

//UDP_CMD_INIT_NO_CLEARABLE = $FF;
//UDP_CMD_INIT_WRITE_ERROR  = $FE;
//UDP_CMD_CHANGE = 29;
//UDP_CMD_CHANGE_OK = 30;


ASI_OPT = 0;
SPI_OPT = 1;
OUT_OPT = 2;

MAC_FF: tMAC = ($ff,$ff,$ff,$ff,$ff,$ff);

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

  tInitData = packed record
    xid             : dword;
    zavod_num       : word;
    device_type     : word;
    mac             : tMac;
    reserve1        : array[14..31]of byte;
    board_descriptor: TBoardDescriptors;
    reserv2         : array[32+SizeOf(TBoardDescriptors)..1023]of byte;
//    adv_opt     : array[0..MAX_ADV_OPT-1] of word;
//    boards      : tArrOptLink;
//    reserve2    : array[0..15] of byte;
  end;

  PFullMess = ^TFullMess;
  TFullMess = record
    ip_request: dword;
    zavod_num : word;
    isInfo    : boolean;
    isInit    : boolean;
    isArrs    : array[0..7]of boolean;
    reqArrs   : array[0..7]of boolean;
    send_step : integer;      // 0-sett, 1-arr1, 2-arr2, 100-burn
    send_count: integer;      // число попыток
    time_count: integer;      // время в единицах таймера до следующей попытки
    b_info    : TBoardsInfo;  // результаты самодиагностики
    init      : tInitData;    // конфигурация
    arrs      : TOptionsInit_v3;
  end;

  TuniData = packed record
    case integer of
      0: (b_info: TBoardsInfo);
      1: (init: tInitData);
      2: (arrs: array[0..3] of tOptInit);
  end;

  TMess = packed record
    header : tHeader;
    data   : TuniData;
  end;

{  tInitMess = packed record
    header : tHeader;
    data   : tInitData;
  end;    }

  pMess_uni = ^tMess_uni;
  tMess_uni = record
    case integer of
      0: (rec: TMess);
      1: (ch: array[1..SizeOf(TMess)] of char;);
      2: (arr: array[0..(SizeOf(TMess)div 2)-1]of word);
  end;

  tpint = ^integer;

  TRecCB = record
    BAport:  TComboBox;
    ASI_opt: TComboBox;
    ASIport: TComboBox;
//    ASI_lab: TLabel;
    SPI_opt: TComboBox;
    SPIport: TComboBox;
    SPI_ASI1_CB: TCheckBox;  // включение входа ASI1 на входной опции TSoIP с несколькими входами (type=$21)
    SPI_ASI2_CB: TCheckBox;  // включение входа ASI2 на входной опции TSoIP с несколькими входами (type=$21)
//    SPI_lab: TLabel;
    OUT_opt_en: TCheckBox;
    OUT_opt: TComboBox;
    OUTport: TComboBox;
//    OUT_lab: TLabel;
    OUT_ASI1_CB: TCheckBox;  // включение входа ASI1 на выходной опции TSoIP с несколькими входами (type=$21)
    OUT_ASI2_CB: TCheckBox;  // включение входа ASI2 на выходной опции TSoIP с несколькими входами (type=$21)
    OUT_SPI1_CB: TCheckBox;  // дополнительное подключение выхода следующего БА по SPI к выходной опции TSoIP с несколькими входами (type=$21)
    OUT_SPI2_CB: TCheckBox;  // дополнительное подключение выхода следующего после следующего БА по SPI к выходной опции TSoIP с несколькими входами (type=$21)
  end;

  tArrMAC = array of tMAC;

  TForm1 = class(TForm)
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Label4: TLabel;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    Memo2: TMemo;
    ProgressBar1: TProgressBar;
    Memo3: TMemo;
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OptIn1Panel: TPanel;
    Label13: TLabel;
    OptIn1CB: TComboBox;
    InPort1CB: TComboBox;
    BA1Panel: TPanel;
    OptOut1Panel: TPanel;
    Label15: TLabel;
    OutPort1CB: TComboBox;
    OptOut1CB: TComboBox;
    OptIn2Panel: TPanel;
    Label17: TLabel;
    OptIn2CB: TComboBox;
    InPort2CB: TComboBox;
    BA2Panel: TPanel;
    OptOut2Panel: TPanel;
    Label19: TLabel;
    OutPort2CB: TComboBox;
    OptOut2CB: TComboBox;
    OptIn1Bevel: TBevel;
    T2MIBevel12: TBevel;
    T2MIBevel11: TBevel;
    T2MIBevel13: TBevel;
    OptOut1Bevel: TBevel;
    OptOut2Bevel: TBevel;
    T2MIBevel14: TBevel;
    ProgramButton: TButton;
    GroupBox1: TGroupBox;
    BA1_SPInum_label: TLabel;
    BA2_SPInum_label: TLabel;
    BA1_SPInum_CB: TComboBox;
    BA2_SPInum_CB: TComboBox;
    OptIn1ASIPanel: TPanel;
    Label7: TLabel;
    ASIport1Label: TLabel;
    OptASI1CB: TComboBox;
    InASIPort1CB: TComboBox;
    OptIn2ASIPanel: TPanel;
    Label9: TLabel;
    ASIport2Label: TLabel;
    OptASI2CB: TComboBox;
    InASIPort2CB: TComboBox;
    Opt1ASIBevel: TBevel;
    OptIn3ASIPanel: TPanel;
    Label11: TLabel;
    ASIport3Label: TLabel;
    OptASI3CB: TComboBox;
    InASIPort3CB: TComboBox;
    OptIn3Panel: TPanel;
    Label21: TLabel;
    OptIn3CB: TComboBox;
    InPort3CB: TComboBox;
    BA3Panel: TPanel;
    OptOut3Panel: TPanel;
    Label23: TLabel;
    OutPort3CB: TComboBox;
    OptOut3CB: TComboBox;
    OptIn4ASIPanel: TPanel;
    Label25: TLabel;
    ASIport4Label: TLabel;
    OptASI4CB: TComboBox;
    InASIPort4CB: TComboBox;
    OptIn4Panel: TPanel;
    Label27: TLabel;
    OptIn4CB: TComboBox;
    InPort4CB: TComboBox;
    BA4Panel: TPanel;
    OptOut4Panel: TPanel;
    Label29: TLabel;
    OutPort4CB: TComboBox;
    OptOut4CB: TComboBox;
    OptIn3Bevel: TBevel;
    Opt3ASIBevel: TBevel;
    T2MIBevel31: TBevel;
    OptOut3Bevel: TBevel;
    OptOut4Bevel: TBevel;
    T2MIBevel33: TBevel;
    T2MIBevel32: TBevel;
    T2MIBevel34: TBevel;
    OptIn2Bevel: TBevel;
    Opt2ASIBevel: TBevel;
    OptIn4Bevel: TBevel;
    Opt4ASIBevel: TBevel;
    T2MIBevel21: TBevel;
    T2MIBevel22: TBevel;
    T2MIBevel23: TBevel;
    T2MIBevel24: TBevel;
    T2MIBevel15: TBevel;
    T2MIBevel25: TBevel;
    T2MIBevel35: TBevel;
    Opt1ASI_CB: TCheckBox;
    Opt1SPI_CB: TCheckBox;
    Opt1out_CB: TCheckBox;
    Opt2ASI_CB: TCheckBox;
    Opt2SPI_CB: TCheckBox;
    Opt2out_CB: TCheckBox;
    Opt3ASI_CB: TCheckBox;
    Opt3SPI_CB: TCheckBox;
    Opt3out_CB: TCheckBox;
    Opt4ASI_CB: TCheckBox;
    Opt4SPI_CB: TCheckBox;
    Opt4out_CB: TCheckBox;
    BA3_SPInum_label: TLabel;
    BA3_SPInum_CB: TComboBox;
    BA4_SPInum_label: TLabel;
    BA4_SPInum_CB: TComboBox;
    GroupBox2: TGroupBox;
    ModificCB: TComboBox;
    DeviceCB: TComboBox;
    BA_1LinkCB: TCheckBox;
    BA_2LinkCB: TCheckBox;
    BA_3LinkCB: TCheckBox;
    IdUDP: TIdUDPClient;
    Timer2: TTimer;
    Out1_ASI1_ChB: TCheckBox;
    Out1_ASI2_ChB: TCheckBox;
    Out1_SPI1_ChB: TCheckBox;
    Out1_SPI2_ChB: TCheckBox;
    Out2_SPI2_ChB: TCheckBox;
    Out2_SPI1_ChB: TCheckBox;
    Out2_ASI2_ChB: TCheckBox;
    Out2_ASI1_ChB: TCheckBox;
    Out3_SPI1_ChB: TCheckBox;
    Out3_ASI2_ChB: TCheckBox;
    Out3_ASI1_ChB: TCheckBox;
    Out4_ASI2_ChB: TCheckBox;
    Out4_ASI1_ChB: TCheckBox;
    SPI1_ASI2_ChB: TCheckBox;
    SPI1_ASI1_ChB: TCheckBox;
    SPI2_ASI2_ChB: TCheckBox;
    SPI2_ASI1_ChB: TCheckBox;
    SPI3_ASI2_ChB: TCheckBox;
    SPI3_ASI1_ChB: TCheckBox;
    SPI4_ASI2_ChB: TCheckBox;
    SPI4_ASI1_ChB: TCheckBox;
    Out3_SPI2_ChB: TCheckBox;
    Out4_SPI2_ChB: TCheckBox;
    Out4_SPI1_ChB: TCheckBox;
    TestButton: TButton;
    OptOut2Bevel2: TBevel;
    OptOut2Bevel3: TBevel;
    OptOut3Bevel2: TBevel;
    OptOut4Bevel2: TBevel;
    OptOut3Bevel3: TBevel;
    OptOut4Bevel3: TBevel;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
//    procedure Button14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure ConfCBChange(Sender: TObject);
    procedure ProgramButtonClick(Sender: TObject);
    procedure OptCBChange(Sender: TObject);
    procedure PortCBChange(Sender: TObject);
    procedure Opt_CBClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TestButtonClick(Sender: TObject);
    procedure Out_mult_ChBClick(Sender: TObject);
//    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    messages: array[0..MaxPribors-1]of TFullMess;
    test_mess: tMess_uni;
    SendMess: TFullMess;
    count_mess:integer;
    ipNet,ipMask,ipAddr: dword;
    CurIndex:integer;
    IniFile: TIniFile;
    FileName: string;
    ExistDB: boolean;
    ArrZN: array of word;
    ArrXid: array of dword;
    SetXid: dword;
    SetMac: TMac;
    SetAdvMAC: tArrMAC;
    SetZN: word;
    SetIndex: integer;
    foundZN: boolean;
    FBA_en: array[1..4]of boolean;
    FOptASI_en: array[1..MAX_BA_NUM]of boolean;
    FOptSPI_en: array[1..MAX_BA_NUM]of boolean;
    FOptOut_en: array[1..MAX_BA_NUM]of boolean;
    FT2MI_link: array[1..MAX_BA_NUM-1]of boolean;
    ArrRecCB: array[1..MAX_BA_NUM]of TRecCB;
    BAArrInit: array[1..MAX_BA_NUM]of tOptInit;
    OptArrSPI: array[1..MAX_BA_NUM, 0..MAX_ONE_OPT_ARRS-1]of tOptInit;
    OptArrASI: array[1..MAX_BA_NUM, 0..MAX_ONE_OPT_ARRS-1]of tOptInit;
    OptArrOut: array[1..MAX_BA_NUM, 0..MAX_ONE_OPT_ARRS-1]of tOptInit;
    ASItoOPT_ind: array[0..MAX_IN_OPTION-1]of integer; // по индексу комбобокса для опциии с подключением на ASI получаем индекс опции в массиве
    OPTtoASI_ind: array[0..MAX_IN_OPTION-1]of integer; // по индексу опции в массиве получем индекс комбобокса для опциии с подключением на ASI, если нельзя подключить на ASI, то получим -1
    BlockirCBClick: boolean;
    send_process: boolean;
    ArrMac: array of TMac;
    ArrAdvMacs: array of tArrMAC;
    procedure FindIPAddr;
    function AddrToStr(addr: dword):string;
    function NetToStr(addr,mask:dword):string;
    function MacToStr(mac: TMac):string;
    function MacWToStr(mac_h,mac_l:dword):string;
    function WordToStr(data: word):string;
    function TestAddr(AddrSt:string; var Addr :dword):boolean;
    procedure TestAddrMask(AddrSt:string; var Addr,Mask :dword);
    function TestZavNum(NumSt:string; var Num:word):boolean;
    function TestMac(MacSt:string; var mac_h,mac_l:dword):boolean;
    function MacWToMac(mac_h,mac_l:dword): tMac;
    procedure CriptMess(numw: integer; var mess: pMess_uni);
    function DecriptMess(numw: integer; var mess: pMess_uni):boolean;
    function HexToInt(const st:string; out data:word; MaxData:word=$ffff):boolean;
    procedure FindBlocks;
    procedure ShowSettings;
    procedure ShowSetOption(b_ind, opt_maintype: integer; ind: integer; OptType: word);
    function GetXid(const st:string):dword;
    function GetMAC(start_pos: integer; const st:string):tMAC;
    procedure GetAdvMAC(const st:string; var MACs: tArrMAC);
    function GetZN(const st:string):word;
    function GetCreateTime(const st:string):tDateTime;
    function GetChangeTime(const st:string):tDateTime;
    function GetNewXid:dword;
    function AddRecord(var xid:dword; mac:tMac; zavod_num:word; AdvMAC: tArrMAC): integer;
    function FindRecord(var xid: dword; var mac: TMac; ZN:word; AdvMACs: TArrMAC):integer;
    function GetNewMac(var PriorMac: tArrMAC): TMac;
    function EqMac(mac1:TMac; mac2:TMac):boolean;
    function EqMacAll(ind: integer; mac:TMac):boolean;
    procedure AddMac(mac:TMac);
    function TestControlPorts: boolean;
    function GetBA_en(index:integer): boolean;
    procedure SetBA_en(index:integer; value: boolean);
    function GetOptASI_en(index:integer): boolean;
    procedure SetOptASI_en(index:integer; value: boolean);
    function GetOptSPI_en(index:integer): boolean;
    procedure SetOptSPI_en(index:integer; value: boolean);
    function GetOptOut_en(index:integer): boolean;
    procedure SetOptOut_en(index:integer; value: boolean);
    function GetT2MI_link(index:integer): boolean;
    procedure SetT2MI_link(index:integer; value: boolean);
    procedure ReadUDP;
    procedure ReadUDP_One(mess: pMess_uni; NumberBytes: Integer; FromIP: String; Port: Integer);
    function FindMess(ip_request: dword; zavod_num : word; var index: integer): boolean;
    procedure SendRequest(ReqIP: dword; zavod_num, command, subcommand: word);
    procedure SendSetting;
    function GetMacOptionCount(opt_ind: integer; isInOpt: boolean): integer;
    procedure AddMacOption(opt_ind: integer; isInOpt: boolean; var OptInit: tOptInit; arrofs: byte);
    procedure AddMacTSoIPOut(var OptInit: tOptInit; arrofs: byte);
    procedure AddMacTSoIPIn(var OptInit: tOptInit; arrofs: byte);
    procedure GetMacOption(opt_ind: integer; isInOpt: boolean; OptInit: tOptInit; var MACs: tArrMAC; arrofs: byte);
    procedure GetMacOptionTSoIPOut(OptInit: tOptInit; var MACs: tArrMAC; arrofs: byte);
    property BA_en[index:integer]: boolean read GetBA_en write SetBA_en;
    property OptASI_en[index:integer]: boolean read GetOptASI_en write SetOptASI_en;
    property OptSPI_en[index:integer]: boolean read GetOptSPI_en write SetOptSPI_en;
    property OptOut_en[index:integer]: boolean read GetOptOut_en write SetOptOut_en;
    property T2MI_link[index:integer]: boolean read GetT2MI_link write SetT2MI_link;
  public
    { Public declarations }
  end;

const
HEADER_LENG = SizeOf(tHeader) div 2;
INIT_LENG   = SizeOf(tMess) div 2;

mac_zero: tMac = (0,0,0,0,0,0);

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
procedure TForm1.FormCreate(Sender: TObject);
var i,j,mwidth,count: integer;
tab: TTabSheet;
begin
  Randomize;

  for i:=1 to PageControl1.PageCount do
  begin
    tab:=TTabSheet(FindComponent('TabSheet'+IntToStr(i)));
    if tab<>nil then
    begin
      tab.TabVisible:=false;
    end;
  end;
  PageControl1.ActivePageIndex:=0;

  ArrRecCB[1].BAport:=BA1_SPInum_CB;
  ArrRecCB[1].ASI_opt:=OptASI1CB; ArrRecCB[1].ASIport:=InASIPort1CB; //ArrRecCB[1].ASI_lab:=ASIport1Label;
  ArrRecCB[1].SPI_opt:=OptIn1CB;  ArrRecCB[1].SPIport:=InPort1CB;    //ArrRecCB[1].SPI_lab:=SPIport1Label;
  ArrRecCB[1].SPI_ASI1_CB:=SPI1_ASI1_ChB; ArrRecCB[1].SPI_ASI2_CB:=SPI1_ASI2_ChB;
  ArrRecCB[1].OUT_opt_en:=Opt1out_CB;
  ArrRecCB[1].OUT_opt:=OptOut1CB; ArrRecCB[1].OUTport:=OutPort1CB;   //ArrRecCB[1].OUT_lab:=OUTport1Label;
  ArrRecCB[1].OUT_ASI1_CB:=Out1_ASI1_ChB; ArrRecCB[1].OUT_ASI2_CB:=Out1_ASI2_ChB;
  ArrRecCB[1].OUT_SPI1_CB:=Out1_SPI1_ChB; ArrRecCB[1].OUT_SPI2_CB:=Out1_SPI2_ChB;
  ArrRecCB[2].BAport:=BA2_SPInum_CB;
  ArrRecCB[2].ASI_opt:=OptASI2CB; ArrRecCB[2].ASIport:=InASIPort2CB;// ArrRecCB[2].ASI_lab:=ASIport2Label;
  ArrRecCB[2].SPI_opt:=OptIn2CB;  ArrRecCB[2].SPIport:=InPort2CB;    //ArrRecCB[2].SPI_lab:=SPIport2Label;
  ArrRecCB[2].SPI_ASI1_CB:=SPI2_ASI1_ChB; ArrRecCB[2].SPI_ASI2_CB:=SPI2_ASI2_ChB;
  ArrRecCB[2].OUT_opt_en:=Opt2out_CB;
  ArrRecCB[2].OUT_opt:=OptOut2CB; ArrRecCB[2].OUTport:=OutPort2CB;   //ArrRecCB[2].OUT_lab:=OUTport2Label;
  ArrRecCB[2].OUT_ASI1_CB:=Out2_ASI1_ChB; ArrRecCB[2].OUT_ASI2_CB:=Out2_ASI2_ChB;
  ArrRecCB[2].OUT_SPI1_CB:=Out2_SPI1_ChB; ArrRecCB[2].OUT_SPI2_CB:=Out2_SPI2_ChB;
  ArrRecCB[3].BAport:=BA3_SPInum_CB;
  ArrRecCB[3].ASI_opt:=OptASI3CB; ArrRecCB[3].ASIport:=InASIPort3CB; //ArrRecCB[3].ASI_lab:=ASIport3Label;
  ArrRecCB[3].SPI_opt:=OptIn3CB;  ArrRecCB[3].SPIport:=InPort3CB;    //ArrRecCB[3].SPI_lab:=SPIport3Label;
  ArrRecCB[3].SPI_ASI1_CB:=SPI3_ASI1_ChB; ArrRecCB[3].SPI_ASI2_CB:=SPI3_ASI2_ChB;
  ArrRecCB[3].OUT_opt_en:=Opt3out_CB;
  ArrRecCB[3].OUT_opt:=OptOut3CB; ArrRecCB[3].OUTport:=OutPort3CB;   //ArrRecCB[3].OUT_lab:=OUTport3Label;
  ArrRecCB[3].OUT_ASI1_CB:=Out3_ASI1_ChB; ArrRecCB[3].OUT_ASI2_CB:=Out3_ASI2_ChB;
  ArrRecCB[3].OUT_SPI1_CB:=Out3_SPI1_ChB; ArrRecCB[3].OUT_SPI2_CB:=Out3_SPI2_ChB;
  ArrRecCB[4].BAport:=BA4_SPInum_CB;
  ArrRecCB[4].ASI_opt:=OptASI4CB; ArrRecCB[4].ASIport:=InASIPort4CB; //ArrRecCB[4].ASI_lab:=ASIport4Label;
  ArrRecCB[4].SPI_opt:=OptIn4CB;  ArrRecCB[4].SPIport:=InPort4CB;    //ArrRecCB[4].SPI_lab:=SPIport4Label;
  ArrRecCB[4].SPI_ASI1_CB:=SPI4_ASI1_ChB; ArrRecCB[4].SPI_ASI2_CB:=SPI4_ASI2_ChB;
  ArrRecCB[4].OUT_opt_en:=Opt4out_CB;
  ArrRecCB[4].OUT_opt:=OptOut4CB; ArrRecCB[4].OUTport:=OutPort4CB;   //ArrRecCB[4].OUT_lab:=OUTport4Label;
  ArrRecCB[4].OUT_ASI1_CB:=Out4_ASI1_ChB; ArrRecCB[4].OUT_ASI2_CB:=Out4_ASI2_ChB;
  ArrRecCB[4].OUT_SPI1_CB:=Out4_SPI1_ChB; ArrRecCB[4].OUT_SPI2_CB:=Out4_SPI2_ChB;

  for i:=1 to 4 do
  begin
    ArrRecCB[i].BAport.Clear;
    for j:=1 to MAX_TARGET do ArrRecCB[i].BAport.Items.Add('Упр. '+IntToStr(j));
    ArrRecCB[i].BAport.ItemIndex:=i-1;
  end;

  mwidth:=0;
  for j:=1 to 4 do
  begin
    ArrRecCB[j].ASI_opt.Clear;
    ArrRecCB[j].SPI_opt.Clear;
    ArrRecCB[j].OUT_opt.Clear;
  end;
  count:=0;
  for i := 0 to MAX_IN_OPTION - 1 do
  begin
    if ( Form1.Canvas.TextWidth(inOptArr[i].name+inOptArr[i].adv_name) > mWidth) then
       mWidth :=Form1.Canvas.TextWidth(inOptArr[i].name+inOptArr[i].adv_name);
    for j:=1 to 4 do ArrRecCB[j].SPI_opt.Items.Add(inOptArr[i].name+inOptArr[i].adv_name);
    OPTtoASI_ind[i]:=-1;
    if inOptArr[i].asi_out>0 then
    begin
      for j:=1 to 4 do ArrRecCB[j].ASI_opt.Items.Add(inOptArr[i].name+inOptArr[i].adv_name);
      OPTtoASI_ind[i]:=count;
      ASItoOPT_ind[count]:=i;
      inc(count);
    end;
  end;
  mWidth:= mWidth+50;
  for j:=1 to 4 do
  begin
    SendMessage(ArrRecCB[j].SPI_opt.Handle ,$0160,mWidth,0);
    SendMessage(ArrRecCB[j].ASI_opt.Handle ,$0160,mWidth,0);
    ArrRecCB[j].SPI_opt.ItemIndex:=0;
    ArrRecCB[j].ASI_opt.ItemIndex:=0;
  end;

  mwidth:=0;
  for i := 0 to MAX_OUT_OPTION - 1 do
  begin
    if ( Form1.Canvas.TextWidth(outOptArr[i].name+outOptArr[i].adv_name) > mWidth) then
       mWidth :=Form1.Canvas.TextWidth(outOptArr[i].name+outOptArr[i].adv_name);
    for j:=1 to 4 do ArrRecCB[j].OUT_opt.Items.Add(outOptArr[i].name+outOptArr[i].adv_name);
  end;
  mWidth:= mWidth+50;
  for j:=1 to 4 do
  begin
    SendMessage(ArrRecCB[j].OUT_opt.Handle ,$0160,mWidth,0);
    ArrRecCB[j].OUT_opt.ItemIndex:=0;
  end;
  FileName:=GetCurrentDir+'\AtpInit.dat';
  if not FileExists(FileName) then
  begin
    MessageDlg('Ошибка! Не найден файл "AtpInit.dat"',mtError,[mbOK],0);
    ExistDB:=false;
    Timer1.Interval:=1;
    Timer1.Enabled:=true;
  end
  else ExistDB:=true;
  IniFile:=TIniFile.Create(FileName);
  BlockirCBClick:=false;
  iDUDP.Port:=ATP_INIT_PORT;

{  test_mess.rec.data.zavod_num:=555;
  for i:=0 to MAX_BOARD_DESCR-1 do
  begin
    test_mess.rec.data.board_descriptor[i].target:=$ff;
    for j:=0 to 3 do test_mess.rec.data.board_descriptor[i].in_opt_con[j]:=$ff;
    for j:=0 to 1 do test_mess.rec.data.board_descriptor[i].out_opt_con[j]:=$ff;
  end;
  test_mess.rec.data.board_descriptor[0].target:=1; }
  if ParamCount>0 then
    if LowerCase(ParamStr(1))='/test' then
      TestButton.Visible:=true;


end;
//------------------------------------------------------------------------------
procedure TForm1.FormDestroy(Sender: TObject);
begin
  SetLength(ArrMac,0);
  SetLength(ArrAdvMacs,0);
end;

//------------------------------------------------------------------------------
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IniFile.Destroy;
  SetLength(ArrZN,0);
  SetLength(ArrXid,0);
end;
//------------------------------------------------------------------------------
procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
var max,i, adv_count: integer;
begin
  if PageControl1.ActivePageIndex>0 then
  begin
    PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex-1;
    case PageControl1.ActivePageIndex of
      0: Button1.Caption:='Список ...';
      1: Button2.Caption:='Вперед ->';
      2: PageControl1.ActivePageIndex:=1;
      3: begin
           if RadioButton1.Checked then PageControl1.ActivePageIndex:=1;
           Button2.Enabled:=true;
         end;
      5: begin
           Button2.Enabled:=true;
           if RadioButton3.Checked then PageControl1.ActivePageIndex:=3;
         end;
    end;
  end
  else
  begin
    ListForm.initGrid;
    max:=IniFile.ReadInteger('main','num_record',0);
    for i:=1 to max do
    begin
      ListForm.AddLine(IniFile.ReadString('database','rec_'+WordToStr(i),''));
    end;
    ListForm.ShowModal;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.Button2Click(Sender: TObject);
begin
  if PageControl1.ActivePageIndex<PageControl1.PageCount-1 then
  begin
    case PageControl1.ActivePageIndex of
      0: Button1.Caption:='<- Назад';
      1: begin
           Edit1.Text:='';
           Button2.Enabled:=true;
           if RadioButton1.Checked then ProgramButton.Caption:='Инициализировать';
           if RadioButton2.Checked then ProgramButton.Caption:='Редактировать';
           if RadioButton3.Checked then
           begin
             ProgramButton.Caption:='Деинициализировать';
             Edit1.Enabled:=false;
             SetZN:=0;
             foundZN:=false;
           end else Edit1.Enabled:=true;
           FindIPAddr;
           FindBlocks;
           Button2.Caption:='Поискать';
         end;
      2: begin
           FindBlocks;
           exit;
         end;
      3: begin
           PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex+1;
           if not RadioButton1.Checked then
             Edit1.Text:=IntToStr(SetZN);
           if RadioButton3.Checked then
           begin
             SetZN:=0;
             PageControl1.ActivePageIndex:=6;
             Button2.Enabled:=false;
           end
           else Edit1.SetFocus;
           exit;
         end;
      5: begin
           if not TestControlPorts then exit;
           Button2.Enabled:=false;
         end;
    end;
    PageControl1.ActivePageIndex:=PageControl1.ActivePageIndex+1;
  end
  else
  begin
  end;
end;
//------------------------------------------------------------------------------


procedure TForm1.Button13Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
//    Panel2.Visible:=true;
  end
  else
  begin
//    Panel4.Visible:=true;
  end;
end;
//------------------------------------------------------------------------------

{procedure TForm1.Button14Click(Sender: TObject);
var mac_h,mac_l:dword;
mess:  PFullMess;
flags: byte;
dat: dword;
zn: word;
//send_arr: TBytes;
begin
  if foundZN then
  begin
    DialogForm.Memo1.Clear;
    DialogForm.Memo1.Lines.Add('Заводской номер '+IntToStr(SetZN)+' уже использовался ранее.'+
    '  Вы уверены, что хотите записать его?');
    if DialogForm.ShowModal = mrCancel then exit;
  end;

//  SetLength(send_arr, 2*HEADER_LENG);
//  mess:=@send_arr[0];
  mess:=@Messages[CurIndex];
//  idUDP.Host:=AddrToStr(mess.rec.header.ip_request);
//  flags:=$98;
  mess.rec.data.xid:=SetXid;
  if RadioButton1.Checked then
  begin
    SendRequest();
    mess.rec.header.command:=UDP_CMD_INIT;
    flags:=$9f;
    mess.rec.header.zavod_num:=0;
    mess.rec.data.zavod_num:=SetZN;
  end;
  if RadioButton2.Checked then
  begin
    mess.rec.header.command:=UDP_CMD_INIT;
    mess.rec.data.zavod_num:=SetZN;
  end;
  if RadioButton3.Checked then
  begin
    mess.rec.header.command:=UDP_CMD_INIT;
    mess.rec.data.zavod_num:=0;
    mess.rec.data.xid:=$ffffffff;
  end;
  mess.rec.data.mac:=SetMac;
  CriptMess(HEADER_LENG, mess);
  idUDP.SendBuffer(send_arr);
  SetLength(send_arr, 0);
end;      }
//------------------------------------------------------------------------------
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
      RadioGroup1.ItemIndex:=0;
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
  CloseSocket(s);
  WSACleanUp;
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
function TForm1.MacToStr(mac: TMac):string;
begin
  result:=MacWToStr(mac[0]*$10000+mac[1]*$100+mac[2],mac[3]*$10000+mac[4]*$100+mac[5]);
end;
//------------------------------------------------------------------------------
function TForm1.MacWToStr(mac_h,mac_l: dword):string;
var st: string;
begin
  st:=IntToHex((mac_h div $10000) and $ff,2)+':';
  st:=st+IntToHex((mac_h div $100) and $ff,2)+':';
  st:=st+IntToHex(mac_h and $ff,2)+':';
  st:=st+IntToHex((mac_l div $10000) and $ff,2)+':';
  st:=st+IntToHex((mac_l div $100) and $ff,2)+':';
  st:=st+IntToHex(mac_l and $ff,2);
  result:=st;
end;
//------------------------------------------------------------------------------
function TForm1.WordToStr(data: word):string;
begin
  result:=IntToStr(data);
  while length(result)<5 do result:='0'+result;
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
    k:=k*$100;
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

procedure TForm1.TestButtonClick(Sender: TObject);
begin
  ProgramButton.Caption:='TEST';
  count_mess:=1;
  messages[0].ip_request:=$0100007f;
  messages[0].zavod_num:=12345;
  messages[0].init.xid:=0;
  messages[0].init.zavod_num:=12345;
  messages[0].init.device_type:=4;
  messages[0].init.board_descriptor[0].target:=1;
  messages[0].init.board_descriptor[0].arr_ind_init:=$ff;
  messages[0].init.board_descriptor[0].arr_ind_set:=$ff;
  messages[0].init.board_descriptor[0].arr_ind_status:=$ff;
  messages[0].init.board_descriptor[0].brdtyp:=0;
  ShowSettings;
  Edit1.Text:=IntToStr(SetZN);
  PageControl1.ActivePageIndex:=4;
//  Edit1.SetFocus;
end;

//------------------------------------------------------------------------------
function TForm1.TestZavNum(NumSt:string; var Num:word):boolean;
var err:integer;
dat:dword;
begin
  result:=false;
  val(NumSt,dat,err);
  if err<>0 then exit;
  if dat>$ffff then exit;
  Num:=dat;
  result:=true;
end;
//------------------------------------------------------------------------------
function TForm1.TestMac(MacSt:string; var mac_h,mac_l:dword):boolean;
var st:string;
p,i:integer;
d:word;
mac:dword;
begin
  result:=false;
  mac:=0;
  for i:=0 to 5 do
  begin
    if i=5 then p:=255 else
    begin
      p:=pos(':',MacSt);
      if p=0 then exit;
    end;
    st:=copy(MacSt,1,p-1);
    if not HexToInt(st,d,255)then exit;
    mac:=mac*$100+d;
    if i=2 then begin mac_h:=mac; mac:=0; end;
    if i=5 then mac_l:=mac;
    Delete(MacSt,1,p);
  end;
  result:=true;
end;

//------------------------------------------------------------------------------
function TForm1.MacWToMac(mac_h,mac_l:dword): tMac;
begin
  result[0]:=(mac_h div $10000)and $ff;
  result[1]:=(mac_h div $100)and $ff;
  result[2]:=(mac_h)and $ff;
  result[3]:=(mac_l div $10000)and $ff;
  result[4]:=(mac_l div $100)and $ff;
  result[5]:=(mac_l)and $ff;
end;

//------------------------------------------------------------------------------
procedure TForm1.CriptMess(numw: integer; var mess: pMess_uni);
var cs: word;
i: integer;
begin
  cs:=0;
  for i:=1 to numw-1 do cs:=cs+mess.arr[i];
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
function TForm1.HexToInt(const st:string; out data:word; MaxData:word=$ffff):boolean;
var i,md:dword;
begin
  data:=0;
  md:=MaxData div 16;
  result:=true;
  for i:=1 to Length(st) do
  begin
    case st[i] of
      ' ': continue;
      '0'..'9': if data<=md then data:=data*16+(ord(st[i])-48)else result:=false;
      'A'..'F': if data<=md then data:=data*16+(ord(st[i])-55)else result:=false;
      'a'..'f': if data<=md then data:=data*16+(ord(st[i])-87)else result:=false;
      else result:=false;
    end;
    if not result then exit;
  end;
  if data>MaxData then result:=false;
end;
//------------------------------------------------------------------------------
Procedure TForm1.FindBlocks;
var st:string;
ip_addr,ip_mask :dword;
//mess: pMess_uni;
i: integer;
//send_arr: TBytes;
begin
//  SetLength(send_arr, 2*HEADER_LENG);
//  mess:=@send_arr[0];
  for i:=0 to RadioGroup1.Items.Count-1 do
  begin
    st:=RadioGroup1.Items[i];
    TestAddrMask(st,ip_addr,ip_mask);
    ipMask:=ip_mask;
    ipNet:=ip_addr;
    ip_addr:=ip_addr or (ip_mask xor $ffffffff);
    ipAddr:=ip_addr;
    ListBox1.Items.Clear; count_mess:=0;

    Memo2.Clear;
    Memo2.Lines.Add('Поиск ATP!');

{    idUDP.Host:=AddrToStr(ip_addr);
    mess.rec.header.command:=UDP_CMD_FIND_INIT;
    mess.rec.header.sub_command:=UDP_SUBCMD_GET_INFO;
    mess.rec.header.response:=0;
    mess.rec.header.zavod_num:=0;
    mess.rec.header.ip_request:=ip_addr;
    mess.rec.header.reserve:=$FFFF;
    CriptMess(HEADER_LENG, mess);
    idUDP.SendBuffer(send_arr);

    DeCriptMess(HEADER_LENG, mess);
    mess.rec.header.sub_command:=UDP_SUBCMD_GET_CONF;
    CriptMess(HEADER_LENG, mess);
    IdUDP.SendBuffer(send_arr);      }

    SendRequest(ip_addr, 0, UDP_CMD_FIND_INIT, UDP_SUBCMD_GET_INFO);
//    SendRequest(ip_addr, 0, UDP_CMD_FIND_INIT, UDP_SUBCMD_GET_CONF);
  end;

//  SetLength(send_arr, 0);
  ProgressBar1.Position:=0;
  Timer1.Enabled:=true;
end;

//------------------------------------------------------------------------------

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if not ExistDB then begin close; exit; end;
  ProgressBar1.Position:=ProgressBar1.Position+1;
  if ProgressBar1.Position=ProgressBar1.Max then
  begin
    Timer1.Enabled:=false;
    if RadioButton1.Checked then
    begin
      case count_mess of
        0: begin
             Memo2.Clear;
             Memo2.Lines.Add('Не найдено АТП требующих инициализации!');
           end;
        1: begin
             Button2.Caption:='Вперед ->';
             Button2.Enabled:=false;
             PageControl1.ActivePageIndex:=4;
             ListBox1.ItemIndex:=0;
             ShowSettings;
             Edit1.SetFocus;
           end;
        else
           begin
             Memo2.Clear;
             Memo2.Lines.Add('Число найденых АТП, требующих инициализации = '+IntToStr(count_mess)+'. Отключите все АТП кроме одного и нажмите кнопку "Поискать"');
           end;
      end;
    end
    else
    begin
      case count_mess of
        0: begin
             Memo2.Clear;
             Memo2.Lines.Add('Не найдены АТП!');
           end;
        1: begin
             Button2.Caption:='Вперед ->';
             Memo2.Clear;
             Memo2.Lines.Add('Число найденых АТП = '+IntToStr(count_mess)+'.');
             ListBox1.ItemIndex:=0;
             ShowSettings;
             Edit1.Text:=IntToStr(SetZN);
             PageControl1.ActivePageIndex:=4;
             if RadioButton3.Checked then
             begin
               SetZN:=0;
               PageControl1.ActivePageIndex:=6;
               Button2.Enabled:=false;
             end
          end;
        else
           begin
             Button2.Caption:='Вперед ->';
             PageControl1.ActivePageIndex:=3;
             Memo2.Clear;
             Memo2.Lines.Add('Число найденых АТП = '+IntToStr(count_mess)+'.');
             ListBox1.ItemIndex:=0;
             ShowSettings;
           end;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.Timer2Timer(Sender: TObject);
begin
  ReadUDP;

  if send_process then SendSetting;
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
var ind, i, arr_ind, c1, c2: integer;
found_arr:array[0..7]of boolean;
all_ok: boolean;
st: string;
begin
  if port<>ATP_INIT_PORT then exit;
//  if (NumberBytes<>2*HEADER_LENG)and(NumberBytes<>2*INIT_LENG) then exit;
  if (NumberBytes<>2*HEADER_LENG)and
     (NumberBytes<>2*HEADER_LENG+SizeOf(TBoardsInfo))and
     (NumberBytes<>2*HEADER_LENG+SizeOf(tInitData))and
     (NumberBytes<>2*HEADER_LENG+8*SizeOf(tOptInit)) then exit;

  if not DecriptMess(NumberBytes div 2, mess) then exit;

  if mess.rec.header.command = UDP_CMD_STAT_INIT then
  begin
    if RadioButton1.Checked then
    begin
//      if mess.rec.data.zavod_num=0 then
      if mess.rec.header.zavod_num=0 then
      begin
        if count_mess>=MaxPribors then exit;
        if mess.rec.header.sub_command=UDP_SUBCMD_GET_INFO then
        begin
          messages[count_mess].b_info:=mess.rec.data.b_info;
          messages[count_mess].ip_request:=mess.rec.header.ip_request;
          messages[count_mess].init.xid:=$ffffffff;
          messages[count_mess].init.zavod_num:=0;
          messages[count_mess].init.mac:=MAC_FF;
          messages[count_mess].isInfo:=true;
          messages[count_mess].isInit:=true;
          inc(count_mess);
        end;
      end;
    end
    else
    begin
      if mess.rec.header.zavod_num<>0 then
      begin
        if FindMess(mess.rec.header.ip_request, mess.rec.header.zavod_num, ind) then
        begin
          case mess.rec.header.sub_command of
            UDP_SUBCMD_GET_INFO:
            begin
              messages[ind].b_info:=mess.rec.data.b_info;
              messages[ind].isInfo:=true;
              SendRequest(mess.rec.header.ip_request, mess.rec.header.zavod_num, UDP_CMD_FIND_INIT, UDP_SUBCMD_GET_CONF);
            end;
            UDP_SUBCMD_GET_CONF:
            begin
              messages[ind].init:=mess.rec.data.init;
              messages[ind].isInit:=true;
              for i:=0 to 7 do found_arr[i]:=false;
              for i:=0 to MAX_BOARD_DESCR-1 do
              begin
                arr_ind:=mess.rec.data.init.board_descriptor[i].arr_ind_init and $1f;
                if arr_ind in [0..31] then found_arr[arr_ind div 4]:=true;
              {  if arr_ind in [4..7] then found_arr2:=true;
                if arr_ind in [8..11] then found_arr3:=true;
                if arr_ind in [12..15] then found_arr4:=true;  }
              end;
              for i:=0 to 7 do
                if (found_arr[i])and(not messages[ind].isArrs[i])and(not messages[ind].reqArrs[i]) then
                begin
                  messages[ind].reqArrs[i]:=true;
                  SendRequest(mess.rec.header.ip_request, mess.rec.header.zavod_num, UDP_CMD_FIND_INIT, UDP_SUBCMD_GET_ARROPT1+i);
                end;
     {         if (found_arr2)and(not messages[ind].isArrs2)and(not messages[ind].reqArrs2) then
              begin
                messages[ind].reqArrs2:=true;
                SendRequest(mess.rec.header.ip_request, mess.rec.header.zavod_num, UDP_CMD_FIND_INIT, UDP_SUBCMD_GET_ARROPT2);
              end; }
            end;
            UDP_SUBCMD_GET_ARROPT1..UDP_SUBCMD_GET_ARROPT8:
            begin
              arr_ind:=mess.rec.header.sub_command-UDP_SUBCMD_GET_ARROPT1;
              move(mess.rec.data.arrs, messages[ind].arrs[arr_ind*4], SizeOf(mess.rec.data.arrs));
              messages[ind].isArrs[arr_ind]:=true;
            end;
 {           UDP_SUBCMD_GET_ARROPT2:
            begin
              move(mess.rec.data.arrs, messages[ind].arrs[8], SizeOf(mess.rec.data.arrs));
              messages[ind].isArrs2:=true;
            end;   }
          end;
//          messages[count_mess]:=mess^;
//          inc(count_mess);


          st:=ListBox1.Items[ind];
          st:=copy(st, length(st)-1, 2);
          if st<>'OK' then
          begin
            all_ok:=(messages[ind].isInfo)and(messages[ind].isInit);
            for i:=0 to 7 do
              if (messages[ind].reqArrs[i])and(not messages[ind].isArrs[i]) then all_ok:=false; // запрос массивов есть, но массивов еще нет
//            if (messages[ind].reqArrs2)and(not messages[ind].isArrs2) then all_ok:=false; // запрос массивов есть, но массивов еще нет
            if all_ok then
            begin
    //          ListBox1.Items[ind]:=ListBox1.Items[ind]+'  OK';
              ListBox1.Items[ind]:=IntToStr(messages[ind].zavod_num)+'  OK';
//              p3_next_btn.Enabled:=true;
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
              for i:=0 to 7 do
               if messages[ind].isArrs[i] then inc(c1);
//              if messages[ind].isArrs2 then inc(c1);
              c2:=2;
              for i:=0 to 7 do
               if messages[ind].reqArrs[i] then inc(c2);
//              if messages[ind].reqArrs2 then inc(c2);
              ListBox1.Items[ind]:=IntToStr(messages[ind].zavod_num)+'  '+IntToStr(c1)+'/'+IntToStr(c2);
            end;
          end;




//          ListBox1.Items.Add(IntToStr(mess.rec.data.zavod_num));
        end;
      end;
    end;
  end;

  if (mess.rec.header.command = UDP_CMD_INIT_OK) then
  begin
    if mess.rec.header.response=0 then
    begin
      case mess.rec.header.sub_command of
        UDP_SUBCMD_BURN:
        begin

          if send_process then
          begin
            send_process:=false;
            Messages[CurIndex]:=SendMess;
            AddRecord(SetXid,SetMac,SetZN, SetAdvMAC);
            ShowMessage('Инициализация завершена успешно');
          end;
     {     Messages[CurIndex]:=mess^;
          AddRecord(SetXid,SetMac,SetZN);
          ShowMessage('Инициализация завершена успешно'); }
        end;
        UDP_SUBCMD_SET_CONF:
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
{        begin
          SendRequest(mess.rec.header.ip_request, mess.rec.header.zavod_num, UDP_SUBCMD_BURN);
        end;    }
      end;
    end
    else
    begin
      ShowMessage('Ошибка '+IntToStr(mess.rec.header.response));
    end;
  end;


{  if (mess.rec.header.command = UDP_CMD_CHANGE_OK) then
  begin
    Messages[CurIndex]:=mess^;
    AddRecord(SetXid,SetMac,SetZN);
    ShowMessage('Изменения успешно внесены');
  end;       }
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
  for i:=0 to 7 do
   messages[count_mess].isArrs[i]:=false;
//  messages[count_mess].isArrs2:=false;
  for i:=0 to 7 do
   messages[count_mess].reqArrs[i]:=false;
//  messages[count_mess].reqArrs2:=false;
  result:=true;
  index:=count_mess;
  inc(count_mess);
  ListBox1.Items.Add(IntToStr(zavod_num));
end;
//------------------------------------------------------------------------------
procedure TForm1.SendRequest(ReqIP: dword; zavod_num, command, subcommand: word);
var mess_out: pMess_uni;
send_arr: TBytes;
begin
  idUDP.Host:=AddrToStr(ReqIP);
  iDUDP.Port:=ATP_INIT_PORT;
  SetLength(send_arr, 2*HEADER_LENG);
  mess_out:=@send_arr[0];
  mess_out.rec.header.command:=command;
  mess_out.rec.header.sub_command:=subcommand;
  mess_out.rec.header.response:=0;
  mess_out.rec.header.ip_request:=ReqIP;
  mess_out.rec.header.zavod_num:=zavod_num;
  CriptMess(HEADER_LENG, mess_out);
  idUDP.SendBuffer(send_arr);
  SetLength(send_arr, 0);

end;
//------------------------------------------------------------------------------

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  CurIndex:=ListBox1.ItemIndex;
  ShowSettings;
end;
//------------------------------------------------------------------------------
procedure TForm1.ShowSettings;
type
TConfBoard=record
  InASIopt: word;
  InSPIopt: word;
  Outopt:word;
end;
var init: tInitData;
descr: PBoardDescriptor;
ba, i, j, k, boardCount, ba_port, b_ind, o_ind, o_port: integer;
o_descr_ind: integer;
device_index: integer;
ConfBoards: array[0..3]of TConfBoard;
CBopt,CBport: TComboBox;
OptLink: tOptLink;
link, is_optarr: boolean;
//send_id, arr_ind: byte;
ArrParam: TArrParam;
opttype: word;
ba_init_ind, ba_init_count, opt_count: integer;
begin
  if CurIndex<0 then exit;
  Label1.Caption:='IP запроса: '+AddrToStr(Messages[CurIndex].ip_request);
  init:=Messages[CurIndex].init;
  is_optarr:=Messages[CurIndex].zavod_num<>0;
  SetZN:=init.zavod_num;
  SetXid:=init.xid;
  SetMac:=init.mac;
//  SetLength(SetAdvMAC, 1);
//  SetAdvMAC[0,0]:=1;
//  SetAdvMAC[0,1]:=2;
  SetLength(SetAdvMAC, 0);
  for i:=1 to MAX_BA_NUM do for k:=0 to MAX_ONE_OPT_ARRS-1 do for j:=0 to 255 do
  begin
    OptArrSPI[i, k].arr[j]:=255;
    OptArrASI[i, k].arr[j]:=255;
    OptArrOut[i, k].arr[j]:=255;
  end;


  boardCount:=GetBoardCount(@init.board_descriptor);
  opt_count:=0;

//  if boardCount<1 then boardCount:=1;

  for ba:=0 to boardCount-1 do
  begin
    descr:=@init.board_descriptor[ba];
    b_ind:=ba+1;
    BA_en[b_ind]:=true;
    ba_port:=descr.target-1;
    if (ba_port<0)or(ba_port>=MAX_TARGET) then ba_port:=0;
    CBport:=TComboBox(FindComponent('BA'+intToStr(b_ind)+'_SPInum_CB'));
    if CBport<>nil then CBport.ItemIndex:=ba_port;

    if GetBA_Init_info(@init.board_descriptor, ba, ba_init_ind, ba_init_count) then
    begin
// для БА только 1 массив     for k:=0 to ba_init_count-1 do
      begin
        if is_optarr then BAArrInit[b_ind]:=Messages[CurIndex].arrs[ba_init_ind]
        else GetDefaultBA_Init(2, @BAArrInit[b_ind]);
      end;
    end;

    o_ind:=GetOptIndex2_v3(@init.board_descriptor, ba, 0, true, ArrParam, opttype, o_port);
    OptSPI_en[b_ind]:=o_ind>0;
    if OptSPI_en[b_ind] then
    begin
      inc(opt_count);
      for k:=0 to ArrParam.arr_count_init-1 do
      begin
        if is_optarr then OptArrSPI[b_ind, k]:=Messages[CurIndex].arrs[ArrParam.arr_ind_init+k]
        else GetDefaultInOptionInit(2, o_ind, @OptArrSPI[b_ind, k], k);
        GetMacOption(o_ind, true, OptArrSPI[b_ind, k], SetAdvMAC, k);
      end;

      CBport:=ArrRecCB[b_ind].SPIport;
      if (o_port>=0)and(o_port<CBport.Items.Count)then
      begin
        CBport.ItemIndex:=o_port;
        CBport.Tag:=o_port;
      end;

      CBopt:=ArrRecCB[b_ind].SPI_opt;
      if (o_ind>=0)and(o_ind<CBopt.Items.Count)then
      begin
        CBopt.ItemIndex:=o_ind;
        OptCBChange(CBopt);
      end;
    end;

    o_ind:=GetOptIndex2_v3(@init.board_descriptor, ba, 1, true, ArrParam, opttype, o_port);
    OptASI_en[b_ind]:=o_ind>0;
    if OptASI_en[b_ind] then
    begin
      inc(opt_count);
      for k:=0 to ArrParam.arr_count_init-1 do
      begin
        if is_optarr then OptArrASI[b_ind, k]:=Messages[CurIndex].arrs[ArrParam.arr_ind_init+k]
        else GetDefaultInOptionInit(2, o_ind, @OptArrASI[b_ind, k], k);
        GetMacOption(o_ind, true, OptArrASI[b_ind, k], SetAdvMAC, k);
      end;

      CBport:=ArrRecCB[b_ind].ASIport;
      if (o_port>=0)and(o_port<CBport.Items.Count)then
      begin
        CBport.ItemIndex:=o_port;
        CBport.Tag:=o_port;
      end;

      o_ind:=OPTtoASI_ind[o_ind];
      CBopt:=ArrRecCB[b_ind].ASI_opt;
      if (o_ind>=0)and(o_ind<CBopt.Items.Count)then
      begin
        CBopt.ItemIndex:=o_ind;
        OptCBChange(CBopt);
      end;
    end;

    o_ind:=GetOptIndex2_v3(@init.board_descriptor, ba, 0, false, ArrParam, opttype, o_port);
    OptOUT_en[b_ind]:=o_ind>0;
    if OptOUT_en[b_ind] then
    begin
      inc(opt_count);
      for k:=0 to ArrParam.arr_count_init-1 do
      begin
        if is_optarr then OptArrOut[b_ind, k]:=Messages[CurIndex].arrs[ArrParam.arr_ind_init+k]
        else GetDefaultOutOptionInit(2, o_ind, @OptArrOut[b_ind, k], k);
        GetMacOption(o_ind, false, OptArrOut[b_ind, k], SetAdvMAC, k);
      end;

      CBport:=ArrRecCB[b_ind].OUTport;
      if (o_port>=0)and(o_port<CBport.Items.Count)then
      begin
        CBport.ItemIndex:=o_port;
        CBport.Tag:=o_port;
      end;

      CBopt:=ArrRecCB[b_ind].OUT_opt;
      if (o_ind>=0)and(o_ind<CBopt.Items.Count)then
      begin
        CBopt.ItemIndex:=o_ind;
        OptCBChange(CBopt);
      end;
      if (o_ind>0)and(o_ind<MAX_OUT_OPTION) then if outOptArr[o_ind].func=9 then
      begin
        o_descr_ind:=(init.board_descriptor[ba].out_opt_con[0] shr 3)and $0f;
        k:=1;
        if o_descr_ind<MAX_BOARD_DESCR then for j:=0 to MAX_BOARD_IN_CON-1 do
        begin
          if init.board_descriptor[o_descr_ind].in_opt_con[j]=$fe then
          begin
            if k=1 then ArrRecCB[ba+1].OUT_ASI1_CB.Checked:=true;
            if k=2 then ArrRecCB[ba+1].OUT_ASI2_CB.Checked:=true;
            inc(k);
          end;
          if ((init.board_descriptor[o_descr_ind].in_opt_con[j] shr 3)and $0f)=ba+1 then
            ArrRecCB[ba+1].OUT_SPI1_CB.Checked:=true;
          if ((init.board_descriptor[o_descr_ind].in_opt_con[j] shr 3)and $0f)=ba+2 then
            ArrRecCB[ba+1].OUT_SPI2_CB.Checked:=true;
        end;
      end;

    end;

    T2MI_link[b_ind]:=TestLink(@init.board_descriptor, ba);
  end;
  for ba:=boardCount+1 to 4 do BA_en[ba]:=false;

  case init.device_type of
    2: begin
         if (boardCount<=2)and(opt_count<=2) then device_index:=0 else device_index:=1;  // АТП-1
       end;
    3: device_index:=3;  // АТС-3
    else device_index:=3;
  end;

//  device_index:=2;
//  if (boardCount<=2){and(not newconf)} then device_index:=0 else
  if init.device_type=3 then // АТС-3
  begin
    case boardCount of
      1: begin
           if (OptIn1CB.Text=Name_TSoIP_input)and  // АТС-3-00
              (not OptASI_en[1])and
              (OptSPI_en[1])and
              (not OptOUT_en[1]) then device_index:=2;
           if (OptIn1CB.Text=Name_TSoIP_ASI_input)and  // АТС-3-01
              (OptASI_en[1])and
              (OptSPI_en[1])and
              (not OptOUT_en[1]) then device_index:=2;
         end;
      2: begin
           if (OptIn2CB.Text=Name_TSoIP_input)and    // АТС-3-02
              (not OptASI_en[1])and
              (not OptASI_en[2])and
              (not OptSPI_en[1])and
              (OptSPI_en[2])and
              (T2MI_link[1])and
              (not OptOUT_en[1])and
              (not OptOUT_en[2]) then device_index:=2;
         end;
      3: begin
           if (OptIn3CB.Text=Name_TSoIP_input)and    // АТС-3-03
              (not OptASI_en[1])and
              (not OptASI_en[2])and
              (not OptASI_en[3])and
              (not OptSPI_en[1])and
              (not OptSPI_en[2])and
              (OptSPI_en[3])and
              (T2MI_link[1])and
              (T2MI_link[2])and
              (not OptOUT_en[1])and
              (not OptOUT_en[2])and
              (not OptOUT_en[3]) then device_index:=2;
           if (OptIn3CB.Text=Name_TSoIP_input)and    // АТС-3-04
              (not OptASI_en[1])and
              (OptASI_en[2])and
              (not OptASI_en[3])and
              (not OptSPI_en[1])and
              (not OptSPI_en[2])and
              (OptSPI_en[3])and
              (T2MI_link[1])and
              (T2MI_link[2])and
              (not OptOUT_en[1])and
              (not OptOUT_en[2])and
              (not OptOUT_en[3]) then device_index:=2;
         end;
      4: begin
           if (OptIn4CB.Text=Name_TSoIP_input)and    // АТС-3-05
              (not OptASI_en[1])and
              (OptASI_en[2])and
              (not OptASI_en[3])and
              (not OptASI_en[4])and
              (not OptSPI_en[1])and
              (not OptSPI_en[2])and
              (not OptSPI_en[3])and
              (OptSPI_en[4])and
              (T2MI_link[1])and
              (T2MI_link[2])and
              (T2MI_link[3])and
              (not OptOUT_en[1])and
              (not OptOUT_en[2])and
              (not OptOUT_en[3])and
              (not OptOUT_en[4]) then device_index:=2;
         end;
    end;
  end;
  DeviceCB.ItemIndex:=device_index;
  DeviceCB.Tag:=-1;
  ConfCBChange(nil);

  SetIndex:=FindRecord(SetXid,SetMac,SetZN,SetAdvMAC);

  Label3.Caption:='MAC адрес: '+MacToStr(init.mac);
  Label5.Caption:='Новый MAC адрес: '+MacToStr(SetMac);
end;
//------------------------------------------------------------------------------
procedure TForm1.ShowSetOption(b_ind, opt_maintype: integer; ind: integer; OptType: word);
var CB: TComboBox;
boardCount, i: integer;
//Lab: TLabel;
begin
  if (b_ind<1)or(b_ind>4)then exit;
  case opt_maintype of
    ASI_OPT: begin CB:=ArrRecCB[b_ind].ASIport; {Lab:=ArrRecCB[b_ind].ASI_lab;} end;
    SPI_OPT: begin CB:=ArrRecCB[b_ind].SPIport; {Lab:=ArrRecCB[b_ind].SPI_lab;} end;
    OUT_OPT: begin CB:=ArrRecCB[b_ind].OUTport; {Lab:=ArrRecCB[b_ind].OUT_lab;} end;
    else exit;
  end;

  case ind of
    -1: begin
          CB.Tag:=CB.Tag and $0f;
          CB.ItemIndex:=CB.Tag;
          CB.Visible:=true;
//          Lab.Visible:=true;
        end;
     0: begin
          CB.Tag:=CB.Tag or $80;
          CB.Visible:=false;
//          Lab.Visible:=false;
        end;
    else  begin
            CB.ItemIndex:=ind-1;
            CB.Tag:=ind-1;
            CB.Visible:=true;
//            Lab.Visible:=true;
          end;
  end;

{  if (opt_maintype=SPI_OPT)and((OptType and $7f00)=$2100) then
  begin
    ArrRecCB[b_ind].SPI_ASI1_CB.Visible:=true;
    ArrRecCB[b_ind].SPI_ASI2_CB.Visible:=true;
  end
  else
  begin
    ArrRecCB[b_ind].SPI_ASI1_CB.Visible:=false;
    ArrRecCB[b_ind].SPI_ASI2_CB.Visible:=false;
  end;  }

  if (opt_maintype=OUT_OPT) then
  begin
    if (OptType and $7f00)=$2100 then
    begin
      boardCount:=0; for i:=1 to 4 do if BA_en[i] then boardCount:=i;
      ArrRecCB[b_ind].OUT_ASI1_CB.Visible:=true;
      ArrRecCB[b_ind].OUT_ASI2_CB.Visible:=true;
      ArrRecCB[b_ind].OUT_SPI1_CB.Visible:=b_ind<boardCount;
      ArrRecCB[b_ind].OUT_SPI2_CB.Visible:=b_ind<boardCount-1;
    end
    else
    begin
      ArrRecCB[b_ind].OUT_ASI1_CB.Visible:=false;
      ArrRecCB[b_ind].OUT_ASI2_CB.Visible:=false;
      ArrRecCB[b_ind].OUT_SPI1_CB.Checked:=false;
      ArrRecCB[b_ind].OUT_SPI1_CB.Visible:=false;
      ArrRecCB[b_ind].OUT_SPI2_CB.Checked:=false;
      ArrRecCB[b_ind].OUT_SPI2_CB.Visible:=false;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TForm1.GetNewXid:dword;
var max,i: integer;
rXid: dword;
label restart;
begin
  max:=IniFile.ReadInteger('main','num_record',0);
restart:
  result:=random($7fffffff)+1;
  for i:=1 to max do
  begin
    rXid:=GetXid(IniFile.ReadString('database','rec_'+WordToStr(i),''));
    if rXid = result then goto restart; //если новый xid уже используется, получаем еще
  end;
end;
//------------------------------------------------------------------------------
function TForm1.AddRecord(var xid:dword; mac:tMac; zavod_num:word; AdvMAC: tArrMAC): integer;
var max,i,ind: integer;
rXid,nXid: dword;
st,CreateTime,ChangeTime:string;
begin
  max:=IniFile.ReadInteger('main','num_record',0);
  CreateTime:='';
  ind:=0;
  if xid = 0 then
  begin
    nXid:=GetNewXid;
  end
  else
  begin
    nXid:=xid;
    for i:=1 to max do
    begin
      st:=IniFile.ReadString('database','rec_'+WordToStr(i),'');
      rXid:=GetXid(st);
      if rXid = nXid then
      begin
        CreateTime:=copy(st,34,10);
        ind:=i; break;
      end;
      if rXid=0 then ind:=i;
    end;
  end;
  if ind = 0 then
  begin
    ind:=max+1;
    IniFile.WriteInteger('main','num_record',max+1);
  end;
  if IniFile.ReadString('database','head','')='' then
    IniFile.WriteString('database','head','       xid           MAC         ZN   CreateTime ChangeTime Option MACs');
  ChangeTime:=DateToStr(Date);
  st:='';
  for i:=0 to length(AdvMAC)-1 do
  begin
    st:=st+'|'+MacToStr(AdvMAC[i]);
  end;

  if CreateTime='' then CreateTime:=ChangeTime;
  IniFile.WriteString('database','rec_'+WordToStr(ind),
    IntToHex(nXid,8)+'|'+
    MacToStr(mac)+'|'+
    WordToStr(zavod_num)+'|'+
    CreateTime+'|'+
    ChangeTime+
    st);
  xid:=nXid;
  result:=ind;
end;
//------------------------------------------------------------------------------
function TForm1.GetXid(const st:string):dword;
var d0,d1:word;
begin
  result:=0;
  if length(st)<54 then exit;
  if (HexToInt(copy(st,1,4),d1))and(HexToInt(copy(st,5,4),d0)) then result:=d1*$10000+d0;
end;
//------------------------------------------------------------------------------
function TForm1.GetMAC(start_pos: integer; const st:string):tMAC;
var i:integer; d:word;
mac:tMAC;
begin
  for i:=0 to 5 do if HexToInt(copy(st,i*3+start_pos,2),d,255) then result[i]:=d else result[i]:=0;
end;
//------------------------------------------------------------------------------
procedure TForm1.GetAdvMAC(const st:string; var MACs: tArrMAC);
var i, count: integer;
begin
  count:=(length(st)-54)div 18;
  SetLength(MACs, count);
  for i:=0 to count-1 do MACs[i]:=GetMAC(56+i*18, st);
end;
//------------------------------------------------------------------------------

function TForm1.GetZN(const st:string):word;
var d,err:integer;
begin
  val(copy(st,28,5),d,err);
  if err<>0 then result:=0
  else result:=d and $ffff;
end;
//------------------------------------------------------------------------------
function TForm1.GetCreateTime(const st:string):tDateTime;
begin
end;
//------------------------------------------------------------------------------
function TForm1.GetChangeTime(const st:string):tDateTime;
begin
end;
//------------------------------------------------------------------------------
function TForm1.FindRecord(var xid: dword; var mac: TMac; ZN:word; AdvMACs: TArrMAC):integer;
var max,i,j,index:integer;
st:string;
rXid:dword;
rMac,fMac:TMac;
rZN,fZN:word;
em,EquallyMacXid,EquallyMacNotXid:boolean;
begin
  if xid=$ffffffff then xid:=0;
  max:=IniFile.ReadInteger('main','num_record',0);
  SetLength(ArrZN,max);
  SetLength(ArrXid,max);
  index:=0; EquallyMacXid:=false; EquallyMacNotXid:=false;
  //^^^^^^^^ сбор информации ^^^^^^^^^^^^^^^^
  SetLength(ArrMac,max+1);
  SetLength(ArrAdvMacs,max+1);
  for i:=1 to max do
  begin
    st:=IniFile.ReadString('database','rec_'+WordToStr(i),'');
    rXid:=GetXid(st);
    if rXid<>0 then
    begin
      rMac:=GetMac(10, st);
      ArrMac[i-1]:=rMac;
      rZN:=GetZN(st);
      em:=EqMac(rMac,mac);
      ArrZN[i-1]:=rZn;
      ArrXid[i-1]:=rXid;
      if rXid=xid then
      begin
        index:=i;
        fMac:=rMac; fZN:=rZN;
        if em then EquallyMacXid:=true;
        SetLength(ArrAdvMacs[i-1], 0);
      end
      else
      begin
        if em then EquallyMacNotXid:=true;
        GetAdvMac(st, ArrAdvMacs[i-1]);
      end;
    end;
  end;
  //^^^^^^^^^^^^ выполняемые действия ^^^^^^^^^^^^^^^^^^^^^^
  if index <> 0 then // в базе найден xid прибора
  begin
    if not EquallyMacXid then // mac в базе для правильного xid не совпал с mac прибора
    begin
      if EquallyMacNotXid then
      begin
        mac:=fMac; // если в базе найден mac прибора для другого xid, то меняем mac в приборе (берем из правильного xid)
      end
      else
      begin
        AddRecord(xid,mac,ZN, AdvMACs); // если в базе не встретился mac прибора, то меняем mac в базе (берем из прибора)
      end;
    end;
    result:=index;
  end
  else  // xid не найден
  begin
    if (EquallyMacNotXid)or(EqMac(mac, MAC_FF)) then mac:=GetNewMac(AdvMACs);
//    else
    result:=AddRecord(xid,mac,ZN, AdvMACs);
    ArrMac[result-1]:=mac;
    SetLength(ArrAdvMacs[result-1], 0);
  end;
  if xid = 0 then xid:=GetNewXid;
end;
//------------------------------------------------------------------------------
function TForm1.GetNewMac(var PriorMac: tArrMAC): TMac;
var
//ArrMac: array of TMac;
max,i, pi, pCount: integer;
st: string;
mac: TMac;
found: boolean;
m4,m5: byte;
begin
{  max:=IniFile.ReadInteger('main','num_record',0);
  SetLength(ArrMac,max);
  for i:= 1 to max do
  begin
    st:=IniFile.ReadString('database','rec_'+WordToStr(i),'');
    ArrMac[i-1]:=GetMac(10, st);
  end;  }
  max:=Length(ArrMac); i:=Length(ArrAdvMacs);
  if max>i then max:=i;

  pCount:=length(PriorMac);
  for pi:=0 to pCount-1 do
  begin
    mac:=PriorMac[pi]; found:=false;
    if (mac[0]=0)and(mac[1]=$50)and(mac[2]=$c2)and(mac[3]=$88)and(mac[4]=$50)and(mac[5]=0) then found:=true;
    for i:=0 to max-1 do if EqMacAll(i, mac) then found:=true;
    if not found then
    begin
      result:=mac;
      for i:=0 to pCount-2-pi do PriorMac[i]:=PriorMac[pi+i+1];
      if pCount>0 then SetLength(PriorMac, pCount-1);
      exit;
    end;
  end;


  mac[0]:=0; mac[1]:=$50; mac[2]:=$c2; mac[3]:=$88;
  for m4:=$51 to $51 do for m5:=0 to $ff do
  begin
    mac[4]:=m4; mac[5]:=m5; found:=false;
    if (m4=$50)and(m5=0) then found:=true;
    for i:=0 to max-1 do if EqMacAll(i, mac) then found:=true;
    if not found then
    begin
      result:=mac; exit;
    end;
  end;
  for i:=0 to 5 do mac[i]:=0;
  result:=mac;
end;
//------------------------------------------------------------------------------
function TForm1.EqMac(mac1:TMac; mac2:TMac):boolean;
var i:integer;
begin
  result:=true;
  for i:=0 to 5 do if mac1[i]<>mac2[i] then result:=false;
end;
//------------------------------------------------------------------------------
function TForm1.EqMacAll(ind: integer; mac:TMac):boolean;
var i:integer;
begin
  result:=true;
  if EqMac(ArrMac[ind],mac) then exit;
  for i:=0 to length(ArrAdvMacs[ind])-1 do
    if EqMac(ArrAdvMacs[ind][i], mac) then exit;
  result:=false;
end;
//------------------------------------------------------------------------------
procedure TForm1.AddMac(mac:TMac);
var count: integer;
begin
  if (SetIndex>0)and(SetIndex<=length(ArrAdvMacs)) then
  begin
    count:=length(ArrAdvMacs[SetIndex-1]);
    SetLength(ArrAdvMacs[SetIndex-1], count+1);
    ArrAdvMacs[SetIndex-1][count]:=mac;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key>='0')and(Key<='9') then exit;
  if Key=#8 then exit;
  Key:=Char(0);
end;
//------------------------------------------------------------------------------

procedure TForm1.Edit1Change(Sender: TObject);
var d,err,i,max:integer;
begin
  Button2.Enabled:=false;
  SetZN:=0;
  if (Length(Edit1.Text)<=0)then exit;
  val(Edit1.Text,d,err);
  if err<>0 then exit;
  if d>$ffff then exit;
  SetZN:=d;
  if d=0 then exit;
  Button2.Enabled:=true;
  max:=Length(ArrZN);
  foundZN:=false;
  for i:=0 to max-1 do
  begin
//    if (ArrZN[i]=SetZN)and(SetIndex<>i+1) then begin foundZN:=true; break; end;
    if (ArrZN[i]=SetZN)and(ArrXid[i]<>SetXid) then begin foundZN:=true; break; end;
  end;
  if foundZN then Label6.Caption:='Такой зав. номер уже использовался'
  else Label6.Caption:='';
end;
//------------------------------------------------------------------------------

procedure TForm1.ConfCBChange(Sender: TObject);
var i,comut: integer;
check: boolean;
CB: TCheckBox;
change_cb: boolean;
begin
  if DeviceCB.Tag<>DeviceCB.ItemIndex then
  begin
    DeviceCB.Tag:=DeviceCB.ItemIndex;
    change_cb:=true;
  end else change_cb:=false;

  Opt1ASI_CB.Enabled:=true; Opt1SPI_CB.Enabled:=true; Opt1out_CB.Enabled:=true;
  Opt2ASI_CB.Enabled:=true; Opt2SPI_CB.Enabled:=true; Opt2out_CB.Enabled:=true;
  Opt3ASI_CB.Enabled:=true; Opt3SPI_CB.Enabled:=true; Opt3out_CB.Enabled:=true;
  Opt4ASI_CB.Enabled:=true; Opt4SPI_CB.Enabled:=true; Opt4out_CB.Enabled:=true;
  BA_1LinkCB.Visible:=false;
  BA_2LinkCB.Visible:=false;
  BA_3LinkCB.Visible:=false;
  OptIn1CB.Enabled:=true;

  case DeviceCB.ItemIndex of
    0: begin   // АТП
         if change_cb then
         begin
           ModificCB.Clear;
           ModificCB.Items.Add('базовая (1 блок анализа)');
           ModificCB.Items.Add('2TS (2 независимых блока анализа)');
           ModificCB.Items.Add('T2-MI (2 блока анализа соединены)');
           if not BA_en[2] then ModificCB.ItemIndex:=0
           else if not T2MI_link[1] then ModificCB.ItemIndex:=1
           else ModificCB.ItemIndex:=2;
           OptIn1CB.Enabled:=true;
           OptIn2CB.Enabled:=true;
         end;

         case ModificCB.ItemIndex of
           0: begin
                BA_en[1]:=true;
                for i:=2 to 4 do BA_en[i]:=false;
                for i:=1 to 3 do T2MI_link[i]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
              end;
           1: begin
                for i:=1 to 2 do BA_en[i]:=true;
                for i:=3 to 4 do BA_en[i]:=false;
                for i:=1 to 3 do T2MI_link[i]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
                Opt2ASI_CB.Enabled:=false; Opt2ASI_CB.Checked:=false;
              end;
           2: begin
                for i:=1 to 2 do BA_en[i]:=true;
                for i:=3 to 4 do BA_en[i]:=false;
                T2MI_link[1]:=true;
                for i:=2 to 3 do T2MI_link[i]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
                Opt2ASI_CB.Enabled:=false; Opt2ASI_CB.Checked:=false;
                Opt1SPI_CB.Enabled:=false; Opt1SPI_CB.Checked:=false;
                Opt2out_CB.Enabled:=false; Opt2out_CB.Checked:=false;
              end;
         end;
       end;

    2: begin  // АТС
         if change_cb then
         begin
           ModificCB.Clear;
           ModificCB.Items.Add('АТС-3/1');
           ModificCB.Items.Add('АТС-3/2');
           ModificCB.Items.Add('АТС-3/3');
           ModificCB.Items.Add('АТС-3/4');
           ModificCB.Items.Add('АТС-3/5');
           ModificCB.Items.Add('АТС-3/6');
           if not BA_en[2] then
           begin
             if not Opt1ASI_CB.Checked then ModificCB.ItemIndex:=0
             else ModificCB.ItemIndex:=1;
           end
           else if not BA_en[3] then ModificCB.ItemIndex:=2
           else if not BA_en[4] then 
           begin
             if not Opt2ASI_CB.Checked then ModificCB.ItemIndex:=3
             else ModificCB.ItemIndex:=4;
           end
           else ModificCB.ItemIndex:=5;
         end;

         case ModificCB.ItemIndex of
           0: begin
                BA_en[1]:=true;
                for i:=2 to 4 do BA_en[i]:=false;
                for i:=1 to 3 do T2MI_link[i]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
                Opt1SPI_CB.Enabled:=false; Opt1SPI_CB.Checked:=true;
                Opt1out_CB.Enabled:=false; Opt1out_CB.Checked:=false;
                for i:=0 to OptIn1CB.Items.Count-1 do
                  if OptIn1CB.Items[i]=Name_TSoIP_input then
                  begin
                    OptIn1CB.Enabled:=false;
                    OptIn1CB.ItemIndex:=i;
                    break;
                  end;
              end;
           1: begin
                BA_en[1]:=true;
                for i:=2 to 4 do BA_en[i]:=false;
                for i:=1 to 3 do T2MI_link[i]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=true;
                Opt1SPI_CB.Enabled:=false; Opt1SPI_CB.Checked:=true;
                Opt1out_CB.Enabled:=false; Opt1out_CB.Checked:=false;
                for i:=0 to OptIn1CB.Items.Count-1 do
                  if OptIn1CB.Items[i]=Name_TSoIP_ASI_input then
                  begin
                    OptIn1CB.Enabled:=false;
                    OptIn1CB.ItemIndex:=i;
                    break;
                  end;
              end;
           2: begin
                for i:=1 to 2 do BA_en[i]:=true;
                for i:=3 to 4 do BA_en[i]:=false;
                T2MI_link[1]:=true;
                for i:=2 to 3 do T2MI_link[i]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
                Opt1SPI_CB.Enabled:=false; Opt1SPI_CB.Checked:=false;
                Opt1out_CB.Enabled:=false; Opt1out_CB.Checked:=false;
                Opt2ASI_CB.Enabled:=false; Opt2ASI_CB.Checked:=false;
                Opt2SPI_CB.Enabled:=false; Opt2SPI_CB.Checked:=true;
                Opt2out_CB.Enabled:=false; Opt2out_CB.Checked:=false;
                for i:=0 to OptIn2CB.Items.Count-1 do
                  if OptIn2CB.Items[i]=Name_IPTV_opt then
                  begin
                    OptIn2CB.Enabled:=false;
                    OptIn2CB.ItemIndex:=i;
                    break;
                  end;
              end;
         3,4: begin
                for i:=1 to 3 do BA_en[i]:=true;
                BA_en[4]:=false;
                for i:=1 to 2 do T2MI_link[i]:=true;
                T2MI_link[3]:=false;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
                Opt1SPI_CB.Enabled:=false; Opt1SPI_CB.Checked:=false;
                Opt1out_CB.Enabled:=false; Opt1out_CB.Checked:=false;
                Opt2ASI_CB.Enabled:=false; Opt2ASI_CB.Checked:=ModificCB.ItemIndex=3;
                Opt2SPI_CB.Enabled:=false; Opt2SPI_CB.Checked:=false;
                Opt2out_CB.Enabled:=false; Opt2out_CB.Checked:=false;
                Opt3ASI_CB.Enabled:=false; Opt3ASI_CB.Checked:=false;
                Opt3SPI_CB.Enabled:=false; Opt3SPI_CB.Checked:=true;
                Opt3out_CB.Enabled:=false; Opt3out_CB.Checked:=false;
                for i:=0 to OptIn3CB.Items.Count-1 do
                  if OptIn3CB.Items[i]=Name_IPTV_opt then
                  begin
                    OptIn3CB.Enabled:=false;
                    OptIn3CB.ItemIndex:=i;
                    break;
                  end;
              end;
           5: begin
                for i:=1 to 4 do BA_en[i]:=true;
                for i:=1 to 3 do T2MI_link[i]:=true;
                Opt1ASI_CB.Enabled:=false; Opt1ASI_CB.Checked:=false;
                Opt1SPI_CB.Enabled:=false; Opt1SPI_CB.Checked:=false;
                Opt1out_CB.Enabled:=false; Opt1out_CB.Checked:=false;
                Opt2ASI_CB.Enabled:=false; Opt2ASI_CB.Checked:=true;
                Opt2SPI_CB.Enabled:=false; Opt2SPI_CB.Checked:=false;
                Opt2out_CB.Enabled:=false; Opt2out_CB.Checked:=false;
                Opt3ASI_CB.Enabled:=false; Opt3ASI_CB.Checked:=false;
                Opt3SPI_CB.Enabled:=false; Opt3SPI_CB.Checked:=false;
                Opt3out_CB.Enabled:=false; Opt3out_CB.Checked:=false;
                Opt4ASI_CB.Enabled:=false; Opt4ASI_CB.Checked:=false;
                Opt4SPI_CB.Enabled:=false; Opt4SPI_CB.Checked:=true;
                Opt4out_CB.Enabled:=false; Opt4out_CB.Checked:=false;
                for i:=0 to OptIn4CB.Items.Count-1 do
                  if OptIn4CB.Items[i]=Name_IPTV_opt then
                  begin
                    OptIn4CB.Enabled:=false;
                    OptIn4CB.ItemIndex:=i;
                    break;
                  end;
              end;
         end;
       end;

    1,3: begin  // выборочная АТП-1 и АТС-3
         if change_cb then
         begin
           ModificCB.Clear;
           ModificCB.Items.Add('1 блок анализа');
           ModificCB.Items.Add('2 блока анализа');
           ModificCB.Items.Add('3 блока анализа');
           ModificCB.Items.Add('4 блока анализа');
           if not BA_en[2] then ModificCB.ItemIndex:=0
           else if not BA_en[3] then ModificCB.ItemIndex:=1
           else if not BA_en[4] then ModificCB.ItemIndex:=2
           else ModificCB.ItemIndex:=3;
           OptIn1CB.Enabled:=true;
           OptIn2CB.Enabled:=true;
           OptIn3CB.Enabled:=true;
           OptIn4CB.Enabled:=true;
         end;

         case ModificCB.ItemIndex of
           0: begin
                BA_en[1]:=true;
                for i:=2 to 4 do BA_en[i]:=false;
              end;
           1: begin
                for i:=1 to 2 do BA_en[i]:=true;
                for i:=3 to 4 do BA_en[i]:=false;
                BA_1LinkCB.Visible:=true;
              end;
           2: begin
                for i:=1 to 3 do BA_en[i]:=true;
                BA_en[4]:=false;
                BA_1LinkCB.Visible:=true;
                BA_2LinkCB.Visible:=true;
              end;
           3: begin
                for i:=1 to 4 do BA_en[i]:=true;
                BA_1LinkCB.Visible:=true;
                BA_2LinkCB.Visible:=true;
                BA_3LinkCB.Visible:=true;
              end;
         end;
       end;
  end;

  for i:=1 to 4 do
  begin
    CB:=TCheckBox(FindComponent('Opt'+IntToStr(i)+'ASI_CB'));
    Opt_CBClick(CB);
    CB:=TCheckBox(FindComponent('Opt'+IntToStr(i)+'SPI_CB'));
    Opt_CBClick(CB);
    CB:=TCheckBox(FindComponent('Opt'+IntToStr(i)+'out_CB'));
    Opt_CBClick(CB);
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.ProgramButtonClick(Sender: TObject);
var //mess:  pMess_uni;
i, j: integer;
isASIopt,isSPIopt,isOUTopt,isNextBAOUTopt: boolean;
boardcount, advcount, opt_ind, d_ind, b1_ind, b2_ind{, in_ind}: integer;
opt_arr_ind_init, opt_arr_ind_set, opt_arr_ind_status: integer;
port, dev_type: word;
//send_arr: TBytes;
b_descr, o_descr: PBoardDescriptor;
{flags_arr, }opt_arr_count, src_ind: byte;
//test_mode: tOptInit;
//test_mode2: tOptControl;
begin
  if foundZN then
  begin
    DialogForm.Memo1.Clear;
    DialogForm.Memo1.Lines.Add('Заводской номер '+IntToStr(SetZN)+' уже использовался ранее.'+
    '  Вы уверены, что хотите записать его?');
    if DialogForm.ShowModal = mrCancel then exit;
  end;

//  SetLength(send_arr, 2*INIT_LENG);
//  mess:=@send_arr[0];
  SendMess:=Messages[CurIndex];
  SendMess.init.xid:=SetXid;
  if DeviceCB.ItemIndex<2 then dev_type:=2 else dev_type:=3;
  SendMess.init.device_type:=dev_type;
{  idUDP.Host:=AddrToStr(mess.rec.header.ip_request);
  mess.rec.data.init.xid:=SetXid;
  mess.rec.header.command:=UDP_CMD_INIT;
  mess.rec.header.sub_command:=UDP_SUBCMD_SET_CONF;
  mess.rec.header.response:=0;    }

  if RadioButton1.Checked then
  begin
    SendMess.zavod_num:=0;
    SendMess.init.zavod_num:=SetZN;
  end;
  if RadioButton2.Checked then
  begin
    SendMess.init.zavod_num:=SetZN;
  end;
  if RadioButton3.Checked then
  begin
    SendMess.init.zavod_num:=0;
    SendMess.init.xid:=$ffffffff;
  end;
  SendMess.init.mac:=SetMac;

  for i:=0 to MAX_BOARD_DESCR-1 do
  begin
    SendMess.init.board_descriptor[i].target:=$ff;
    SendMess.init.board_descriptor[i].arr_ind_init:=0;
    SendMess.init.board_descriptor[i].arr_ind_set:=0;
    SendMess.init.board_descriptor[i].arr_ind_status:=0;
    SendMess.init.board_descriptor[i].brdtyp:=$ffff;
    SendMess.init.board_descriptor[i].ts_src_id:=0;
    SendMess.init.board_descriptor[i].ts_src_count:=0;
    for j:=0 to MAX_BOARD_IN_CON-1 do SendMess.init.board_descriptor[i].in_opt_con[j]:=$ff;
    for j:=0 to MAX_BOARD_OUT_CON-1 do SendMess.init.board_descriptor[i].out_opt_con[j]:=$ff;
    for j:=4 to 7 do SendMess.init.board_descriptor[i].reserv[j]:=$ff;
    for j:=28 to 31 do SendMess.init.board_descriptor[i].reserv2[j]:=$ff;
  end;

  boardcount:=4; for i:=2 to 4 do if not BA_en[i] then begin boardcount:=i-1; break; end;
  for i:=0 to 7 do SendMess.reqArrs[i]:=false;
//  SendMess.reqArrs2:=false;

  advcount:=0;  d_ind:=boardcount; opt_arr_ind_init:=0; opt_arr_ind_set:=0; opt_arr_ind_status:=0;
  src_ind:=1;
  for i:=1 to boardcount do
  begin
    b_descr:=@SendMess.init.board_descriptor[i-1];
    b_descr.target:=ArrRecCB[i].BAport.ItemIndex+1;

    if (dev_type=2)or(i>1) then // src_id для БА, кроме БА качества
    begin
      b_descr.ts_src_id:=src_ind;
      b_descr.ts_src_count:=2; // для простоты для блока анализа всегда задается 2
      b_descr.arr_ind_init:=(opt_arr_ind_init and $1f) + $20; // count=1
      BAArrInit[i].arr[0]:=src_ind;
      BAArrInit[i].arr[1]:=src_ind+1;
      SendMess.arrs[opt_arr_ind_init]:=BAArrInit[i];
      inc(opt_arr_ind_init);
      inc(src_ind, 2);
    end;

    isASIopt:=(OptASI_en[i])and(ArrRecCB[i].ASI_opt.ItemIndex<>0);
    isSPIopt:=(OptSPI_en[i])and(ArrRecCB[i].SPI_opt.ItemIndex<>0);
    isOUTopt:=(OptOUT_en[i])and(ArrRecCB[i].OUT_opt.ItemIndex<>0);
    if i=boardcount then isNextBAOUTopt:=false
    else isNextBAOUTopt:=(OptOUT_en[i+1])and(ArrRecCB[i+1].OUT_opt.ItemIndex<>0);

    if isSPIopt then //опция на SPI
    begin
      o_descr:=@SendMess.init.board_descriptor[d_ind];
      opt_ind:=ArrRecCB[i].SPI_opt.ItemIndex;
      if (opt_ind<0)and(opt_ind>=MAX_IN_OPTION)then opt_ind:=0;
      port:=ArrRecCB[i].SPIport.ItemIndex;
      case inOptArr[opt_ind].typ and $000f of
        0..7: o_descr.target:=17+port; // SPI
//        14:   o_descr.target:=8+i;     // I2C
        14:   o_descr.target:=8+b_descr.target;     // I2C
        else  o_descr.target:=$fe;     // другие способы управления
      end;
      b_descr.in_opt_con[0]:=d_ind shl 3;
      o_descr.out_opt_con[0]:=(i-1) shl 3;
      o_descr.in_opt_con[0]:=$fe; // выходит наружу
      o_descr.brdtyp:=inOptArr[opt_ind].typ;
      if inOptArr[opt_ind].src_count>0 then
      begin
        o_descr.ts_src_id:=src_ind;
        o_descr.ts_src_count:=inOptArr[opt_ind].src_count;
        inc(src_ind, o_descr.ts_src_count);
      end;
      if inOptArr[opt_ind].func>=0 then
      begin
//        flags_arr:=0;
//        if not GetDefaultInOptionInit(0, opt_ind, nil) then flags_arr:=flags_arr or $80;
        opt_arr_count:=GetArrCount(opt_ind, true, 0);
        o_descr.arr_ind_init:=opt_arr_ind_init or (opt_arr_count shl 5);
//        if flags_arr=0 then
        if opt_arr_count>0 then
        begin
          // вставка ts_src_id
          case o_descr.brdtyp of
            $03BC, $04BC, $05BC, $06BC, $07BC, $08BC, $09BC: // Серегин, управление через QoE, 4 модуля
            begin
              OptArrSPI[i, 0].arr[0]:=o_descr.ts_src_id;
            end;
          end;
          // заполнение массивов инициализации
          for j:=0 to opt_arr_count-1 do
          begin
            if opt_arr_ind_init>=MAX_OPT_ARR then
            begin
              ShowMessage('Слишком много массивов инициализации');
              exit;
            end;
            SendMess.arrs[opt_arr_ind_init]:=OptArrSPI[i, j];
            AddMacOption(opt_ind, true, SendMess.arrs[opt_arr_ind_init], j);
            inc(opt_arr_ind_init);
          end;
//          if opt_arr_ind<8 then SendMess.reqArrs1:=true else SendMess.reqArrs2:=true;
//          for j:=0 to 7 do
//            SendMess.reqArrs[j]:=(opt_arr_ind_init>j*4);
//          SendMess.reqArrs2:=(opt_arr_ind_init>8);
        end;

//        if not GetDefaultInOptionSetting(0, opt_ind, nil) then flags_arr:=flags_arr or $40;
        opt_arr_count:=GetArrCount(opt_ind, true, 1);
        o_descr.arr_ind_set:=opt_arr_ind_set or (opt_arr_count shl 5);
        inc(opt_arr_ind_set, opt_arr_count);
        if opt_arr_ind_set>MAX_OPT_ARR then
        begin
          ShowMessage('Слишком много массивов настроек опций');
          exit;
        end;

        opt_arr_count:=GetArrCount(opt_ind, true, 2);
        o_descr.arr_ind_status:=opt_arr_ind_status or (opt_arr_count shl 5);
        inc(opt_arr_ind_status, opt_arr_count);
        if opt_arr_ind_status>MAX_OPT_ARR then
        begin
          ShowMessage('Слишком много массивов статуса опций');
          exit;
        end;

//        o_descr.arr_ind:=opt_arr_ind or flags_arr;
//        inc(opt_arr_ind);
      end;
      inc(d_ind);
    end;

    if isASIopt then //опция на ASI
    begin
      o_descr:=@SendMess.init.board_descriptor[d_ind];
      opt_ind:=ArrRecCB[i].ASI_opt.ItemIndex;
      if (opt_ind<0)and(opt_ind>=MAX_IN_OPTION)then opt_ind:=0;
      opt_ind:=ASItoOPT_ind[opt_ind];
      port:=ArrRecCB[i].ASIport.ItemIndex;
      case inOptArr[opt_ind].typ and $000f of
        0..7: o_descr.target:=17+port; // SPI
//        14:   o_descr.target:=8+i;     // I2C
        14:   o_descr.target:=8+b_descr.target;     // I2C
        else  o_descr.target:=$fe;     // другие способы управления
      end;
      b_descr.in_opt_con[1]:=d_ind shl 3;
      o_descr.out_opt_con[0]:=(i-1) shl 3 + 1;
      o_descr.in_opt_con[0]:=$fe; // выходит наружу
      o_descr.brdtyp:=inOptArr[opt_ind].typ;
      if inOptArr[opt_ind].src_count>0 then
      begin
        o_descr.ts_src_id:=src_ind;
        o_descr.ts_src_count:=inOptArr[opt_ind].src_count;
        inc(src_ind, o_descr.ts_src_count);
      end;
      if inOptArr[opt_ind].func>=0 then
      begin
        {flags_arr:=0;
        if not GetDefaultInOptionInit(0, opt_ind, nil) then flags_arr:=flags_arr or $80;
        if flags_arr=0 then
        begin
          SendMess.arrs[opt_arr_ind]:=OptArrASI[i];
          AddMacOption(opt_ind, true, SendMess.arrs[opt_arr_ind]);
          if opt_arr_ind<8 then SendMess.reqArrs1:=true else SendMess.reqArrs2:=true;
        end;   }
        opt_arr_count:=GetArrCount(opt_ind, true, 0);
        if opt_arr_ind_init+opt_arr_count>MAX_OPT_ARR then
          opt_arr_count:=MAX_OPT_ARR-opt_arr_ind_init;
        o_descr.arr_ind_init:=opt_arr_ind_init or (opt_arr_count shl 5);
        if opt_arr_count>0 then
        begin
          // вставка ts_src_id
          case o_descr.brdtyp of
            $03BC, $04BC, $05BC, $06BC, $07BC, $08BC, $09BC: // Серегин, управление через QoE, 4 модуля
            begin
              OptArrSPI[i, 0].arr[0]:=o_descr.ts_src_id;
            end;
          end;
          // заполнение массивов инициализации
          for j:=0 to opt_arr_count-1 do
          begin
            if opt_arr_ind_init>=MAX_OPT_ARR then
            begin
              ShowMessage('Слишком много массивов инициализации');
              exit;
            end;
            SendMess.arrs[opt_arr_ind_init]:=OptArrASI[i, j];
            AddMacOption(opt_ind, true, SendMess.arrs[opt_arr_ind_init], j);
            inc(opt_arr_ind_init);
          end;
//          if opt_arr_ind<8 then SendMess.reqArrs1:=true else SendMess.reqArrs2:=true;
//          for j:=0 to 7 do
//            SendMess.reqArrs[j]:=(opt_arr_ind_init>j*4);
//          SendMess.reqArrs2:=(opt_arr_ind_init>8);
        end;


//        if not GetDefaultInOptionSetting(0, opt_ind, nil) then flags_arr:=flags_arr or $40;
//        o_descr.arr_ind:=opt_arr_ind or flags_arr;
//        inc(opt_arr_ind);
        opt_arr_count:=GetArrCount(opt_ind, true, 1);
        o_descr.arr_ind_set:=opt_arr_ind_set or (opt_arr_count shl 5);
        inc(opt_arr_ind_set, opt_arr_count);
        if opt_arr_ind_set>MAX_OPT_ARR then
        begin
          ShowMessage('Слишком много массивов настроек опций');
          exit;
        end;

        opt_arr_count:=GetArrCount(opt_ind, true, 2);
        o_descr.arr_ind_status:=opt_arr_ind_status or (opt_arr_count shl 5);
        inc(opt_arr_ind_status, opt_arr_count);
        if opt_arr_ind_status>MAX_OPT_ARR then
        begin
          ShowMessage('Слишком много массивов статуса опций');
          exit;
        end;

      end;
      inc(d_ind);
    end;

    if isOUTopt then //выходная опция
    begin
      o_descr:=@SendMess.init.board_descriptor[d_ind];
      opt_ind:=ArrRecCB[i].OUT_opt.ItemIndex;
      if (opt_ind<0)and(opt_ind>=MAX_IN_OPTION)then opt_ind:=0;
      port:=ArrRecCB[i].OUTport.ItemIndex;
      case outOptArr[opt_ind].typ and $000f of
        0..7: o_descr.target:=17+port; // SPI
        else  o_descr.target:=$fe;     // другие способы управления
      end;
      b_descr.out_opt_con[0]:=d_ind shl 3;
      o_descr.in_opt_con[0]:=(i-1) shl 3;
      if outOptArr[opt_ind].func=9 then
      begin
//        in_ind:=1;
        if ArrRecCB[i].OUT_SPI1_CB<>nil then if ArrRecCB[i].OUT_SPI1_CB.Checked then
        begin
          o_descr.in_opt_con[1]:=(i) shl 3;
          SendMess.init.board_descriptor[i-1].out_opt_con[0]:=(d_ind shl 3)+1;
//          inc(in_ind);
        end;
        if ArrRecCB[i].OUT_SPI2_CB<>nil then if ArrRecCB[i].OUT_SPI2_CB.Checked then
        begin
          o_descr.in_opt_con[2]:=(i+1) shl 3;
          SendMess.init.board_descriptor[i].out_opt_con[0]:=(d_ind shl 3)+2;
//          inc(in_ind);
        end;
        if ArrRecCB[i].OUT_ASI1_CB.Checked then
        begin
          o_descr.in_opt_con[3]:=$fe; // выходит наружу
//          inc(in_ind);
        end;
        if (ArrRecCB[i].OUT_ASI2_CB.Checked){and(in_ind<4)} then
        begin
          o_descr.in_opt_con[4]:=$fe; // выходит наружу
//          inc(in_ind);
        end;

      end;

      o_descr.out_opt_con[0]:=$fe; // выходит наружу
      o_descr.brdtyp:=outOptArr[opt_ind].typ or $8000;
      if outOptArr[opt_ind].src_count>0 then
      begin
        o_descr.ts_src_id:=src_ind;
        o_descr.ts_src_count:=outOptArr[opt_ind].src_count;
        inc(src_ind, o_descr.ts_src_count);
      end;
      if OutOptArr[opt_ind].func>=0 then
      begin
{        flags_arr:=0;
        if not GetDefaultOutOptionInit(0, opt_ind, nil) then flags_arr:=flags_arr or $80;
        if flags_arr=0 then
        begin
          SendMess.arrs[opt_arr_ind]:=OptArrOut[i];
          AddMacOption(opt_ind, false, SendMess.arrs[opt_arr_ind]);
          if opt_arr_ind<8 then SendMess.reqArrs1:=true else SendMess.reqArrs2:=true;
        end;  }
        opt_arr_count:=GetArrCount(opt_ind, false, 0);
        if opt_arr_ind_init+opt_arr_count>MAX_OPT_ARR then
          opt_arr_count:=MAX_OPT_ARR-opt_arr_ind_init;
        o_descr.arr_ind_init:=opt_arr_ind_init or (opt_arr_count shl 5);
        if opt_arr_count>0 then
        begin
          for j:=0 to opt_arr_count-1 do
          begin
            if opt_arr_ind_init>=MAX_OPT_ARR then
            begin
              ShowMessage('Слишком много массивов инициализации');
              exit;
            end;
            SendMess.arrs[opt_arr_ind_init]:=OptArrOut[i, j];
            AddMacOption(opt_ind, false, SendMess.arrs[opt_arr_ind_init], j);
            inc(opt_arr_ind_init);
          end;
//          if opt_arr_ind<8 then SendMess.reqArrs1:=true else SendMess.reqArrs2:=true;
//          for j:=0 to 7 do
//            SendMess.reqArrs[j]:=(opt_arr_ind_init>j*4);
//          SendMess.reqArrs2:=(opt_arr_ind_init>8);
        end;

//        if not GetDefaultOutOptionSetting(0, opt_ind, nil) then flags_arr:=flags_arr or $40;
//        o_descr.arr_ind:=opt_arr_ind or flags_arr;
//        inc(opt_arr_ind);
        opt_arr_count:=GetArrCount(opt_ind, false, 1);
        o_descr.arr_ind_set:=opt_arr_ind_set or (opt_arr_count shl 5);
        inc(opt_arr_ind_set, opt_arr_count);
        if opt_arr_ind_set>MAX_OPT_ARR then
        begin
          ShowMessage('Слишком много массивов настроек опций');
          exit;
        end;

        opt_arr_count:=GetArrCount(opt_ind, false, 2);
        o_descr.arr_ind_status:=opt_arr_ind_status or (opt_arr_count shl 5);
        inc(opt_arr_ind_status, opt_arr_count);
        if opt_arr_ind_status>MAX_OPT_ARR then
        begin
          ShowMessage('Слишком много массивов статуса опций');
          exit;
        end;
      end;
      inc(d_ind);
    end;

  end;
  for j:=0 to 7 do
    SendMess.reqArrs[j]:=(opt_arr_ind_init>j*4);

  for i:=1 to boardcount-1 do if T2MI_link[i] then
  begin
    isSPIopt:=(OptSPI_en[i])and(ArrRecCB[i].SPI_opt.ItemIndex<>0);
    isNextBAOUTopt:=(OptOUT_en[i+1])and(ArrRecCB[i+1].OUT_opt.ItemIndex<>0);

    if not isSPIopt then b1_ind:=i-1
    else b1_ind:=(SendMess.init.board_descriptor[i-1].in_opt_con[0] shr 3)and $0f;
    if not isNextBAOUTopt then b2_ind:=i
    else b2_ind:=(SendMess.init.board_descriptor[i].out_opt_con[0] shr 3)and $0f;
    SendMess.init.board_descriptor[b1_ind].in_opt_con[0]:=b2_ind shl 3;
    SendMess.init.board_descriptor[b2_ind].out_opt_con[0]:=b1_ind shl 3;
  end;

//  CriptMess(INIT_LENG, mess);
//  idUDP.SendBuffer(send_arr);
//  SetLength(send_arr, 0);
//  SetLength(ArrAdvMacs[SetIndex-1],2);
//  SetLength(SetAdvMAC,0);
  if (SetIndex>0)and(SetIndex<=length(ArrAdvMacs)) then
    SetAdvMAC:=ArrAdvMacs[SetIndex-1]
  else SetLength(SetAdvMAC, 0);


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
leng, i: integer;
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
//  if SendMess.send_step=1 then if not SendMess.reqArrs1 then SendMess.send_step:=2;
//  if SendMess.send_step=2 then if not SendMess.reqArrs2 then SendMess.send_step:=100;

  if SendMess.send_step=100 then leng:=HEADER_LENG else leng:=INIT_LENG;
  if SendMess.send_step>100 then exit;

  SetLength(send_arr, 2*leng);
  mess:=@send_arr[0];
  case SendMess.send_step of
    0: begin
         mess.rec.data.init:=SendMess.init;
         mess.rec.header.sub_command:=UDP_SUBCMD_SET_CONF;
         SendMess.time_count:=2;
       end;
    1..8: begin
         i:=SendMess.send_step-1;
         move(SendMess.arrs[i*4], mess.rec.data.arrs, SizeOf(mess.rec.data.arrs));
         mess.rec.header.sub_command:=UDP_SUBCMD_SET_ARROPT1+i;
         SendMess.time_count:=2;
       end;
  {  2: begin
         move(SendMess.arrs[8], mess.rec.data.arrs, SizeOf(mess.rec.data.arrs));
         mess.rec.header.sub_command:=UDP_SUBCMD_SET_ARROPT2;
         SendMess.time_count:=2;
       end;     }
    100: begin
         mess.rec.header.sub_command:=UDP_SUBCMD_BURN;
         SendMess.send_step:=101;
         SendMess.time_count:=10;
       end;
  end;
  idUDP.Host:=AddrToStr(SendMess.ip_request);
  iDUDP.Port:=ATP_INIT_PORT;
  mess.rec.header.command:=UDP_CMD_INIT;
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

procedure TForm1.OptCBChange(Sender: TObject);
var OptCB,PortCB: TComboBox;
itIn: boolean;
OptType: word;
ind,pind,i,b_ind: integer;
omt: integer; //Opt_maintype
begin
  OptCB:=TComboBox(Sender);

  omt:=-1;
  for i:=1 to 4 do
  begin
    if OptCB=ArrRecCB[i].ASI_opt then begin omt:=ASI_OPT; b_ind:=i; break; end;
    if OptCB=ArrRecCB[i].SPI_opt then begin omt:=SPI_OPT; b_ind:=i; break; end;
    if OptCB=ArrRecCB[i].OUT_opt then begin omt:=OUT_OPT; b_ind:=i; break; end;
  end;

  case omt of
    ASI_OPT: begin
               ind:=OptCB.ItemIndex;
               if (ind<0)and(ind>=MAX_IN_OPTION) then exit;
               ind:=ASItoOPT_ind[ind];
               if (ind<0)and(ind>=MAX_IN_OPTION) then exit;
               OptType:=inOptArr[ind].typ;
             end;
    SPI_OPT: begin
               ind:=OptCB.ItemIndex;
               if (ind<0)and(ind>=MAX_IN_OPTION) then exit;
               OptType:=inOptArr[ind].typ;
             end;
    OUT_OPT: begin
               ind:=OptCB.ItemIndex;
               if (ind<0)and(ind>=MAX_OUT_OPTION) then exit;
               OptType:=outOptArr[ind].typ;
             end;
    else exit;
  end;

  if (OptType and $0008)=0 then pind:=-1 else pind:=0;
  if ind=0 then pind:=0;
  OptCB.Tag:=pind;
  ShowSetOption(b_ind, omt, pind, OptType);
end;
//------------------------------------------------------------------------------

procedure TForm1.PortCBChange(Sender: TObject);
begin
  TComboBox(Sender).Tag:=TComboBox(Sender).ItemIndex;
end;
//------------------------------------------------------------------------------
function TForm1.TestControlPorts: boolean;
var count,i,j: integer;
ports:array[0..15]of integer;
begin
  count:=0;
  for i:=1 to 4 do
  begin
    if BA_en[i] then
    begin
      ports[count]:=ArrRecCB[i].BAport.ItemIndex;
      inc(count);
    end;
    if (ArrRecCB[i].ASIport.Tag<$80)and(OptASI_en[i]) then
    begin
      ports[count]:=ArrRecCB[i].ASIport.ItemIndex;
      inc(count);
    end;
    if (ArrRecCB[i].SPIport.Tag<$80)and(OptSPI_en[i]) then
    begin
      ports[count]:=ArrRecCB[i].SPIport.ItemIndex;
      inc(count);
    end;
    if (ArrRecCB[i].OUTport.Tag<$80)and(OptOut_en[i]) then
    begin
      ports[count]:=ArrRecCB[i].OUTport.ItemIndex;
      inc(count);
    end;
  end;

  for i:=1 to count-1 do for j:=0 to i-1 do
    if ports[i]=ports[j] then
    begin
      MessageDlg('Разъем "Упр. '+IntToStr(ports[i]+1)+'" используется для управления более чем одной платы. Измените настройки.',
        mtWarning	, [mbOK], 0);
      result:=false;
      exit;
    end;

{  count:=0;
  for i:=1 to 4 do if (OptASI_en[i])and(OptSPI_en[i]) then inc(count);
  if count>2 then
  begin
    MessageDlg('Число блоков анализа с двумя входными опциями равно '+IntToStr(count)+', допускается не больше 2',
      mtWarning	, [mbOK], 0);
    result:=false;
    exit;
  end;   }

  count:=0;
  for i:=1 to 4 do if BA_en[i] then
  begin
    inc(count);
    if OptASI_en[i] then inc(count);
    if OptSPI_en[i] then inc(count);
    if OptOut_en[i] then inc(count);
  end;
  if count>15 then
  begin
    MessageDlg('Число блоков анализа и опций равно '+IntToStr(count)+', допускается не больше 15',
      mtWarning	, [mbOK], 0);
    result:=false;
    exit;
  end;


  result:=true;
end;
//------------------------------------------------------------------------------

function TForm1.GetBA_en(index:integer): boolean;
begin
  result:=false;
  if (index<1)or(index>4)then exit;
  result:=FBA_en[index];
end;
//------------------------------------------------------------------------------
procedure TForm1.SetBA_en(index:integer; value: boolean);
begin
  if (index<1)or(index>4)then exit;
  FBA_en[index]:=value;
  case index of
    1: begin
         BA1Panel.Visible:=value;
         BA1_SPInum_label.Visible:=value;
         BA1_SPInum_CB.Visible:=value;
       end;
    2: begin
         BA2Panel.Visible:=value;
         BA2_SPInum_label.Visible:=value;
         BA2_SPInum_CB.Visible:=value;
//         if BA2_SPInum_CB.ItemIndex<0 then BA2_SPInum_CB.ItemIndex:=1;
       end;
    3: begin
         BA3Panel.Visible:=value;
         BA3_SPInum_label.Visible:=value;
         BA3_SPInum_CB.Visible:=value;
//         if BA3_SPInum_CB.ItemIndex<0 then BA3_SPInum_CB.ItemIndex:=2;
       end;
    4: begin
         BA4Panel.Visible:=value;
         BA4_SPInum_label.Visible:=value;
         BA4_SPInum_CB.Visible:=value;
//         if BA4_SPInum_CB.ItemIndex<0 then BA4_SPInum_CB.ItemIndex:=3;
       end;
  end;
end;
//------------------------------------------------------------------------------
function TForm1.GetOptASI_en(index:integer): boolean;
begin
  result:=false;
  if (index<1)or(index>4)then exit;
  result:=FOptASI_en[index];
end;
//------------------------------------------------------------------------------
procedure TForm1.SetOptASI_en(index:integer; value: boolean);
begin
  if (index<1)or(index>4)then exit;
  FOptASI_en[index]:=value;
  BlockirCBClick:=true;
  case index of
    1: begin
         OptIn1ASIPanel.Visible:=value;
         Opt1ASIBevel.Visible:=value;
         Opt1ASI_CB.Checked:=value;
       end;
    2: begin
         OptIn2ASIPanel.Visible:=value;
         Opt2ASIBevel.Visible:=value;
         Opt2ASI_CB.Checked:=value;
       end;
    3: begin
         OptIn3ASIPanel.Visible:=value;
         Opt3ASIBevel.Visible:=value;
         Opt3ASI_CB.Checked:=value;
       end;
    4: begin
         OptIn4ASIPanel.Visible:=value;
         Opt4ASIBevel.Visible:=value;
         Opt4ASI_CB.Checked:=value;
       end;
  end;
  BlockirCBClick:=false;
end;
//------------------------------------------------------------------------------
function TForm1.GetOptSPI_en(index:integer): boolean;
begin
  result:=false;
  if (index<1)or(index>4)then exit;
  result:=FOptSPI_en[index];
end;
//------------------------------------------------------------------------------
procedure TForm1.SetOptSPI_en(index:integer; value: boolean);
begin
  if (index<1)or(index>4)then exit;
  FOptSPI_en[index]:=value;
  BlockirCBClick:=true;
  case index of
    1: begin
         OptIn1Panel.Visible:=value;
         OptIn1Bevel.Visible:=value;
         if value then T2MIBevel11.Left:=OptIn1Panel.Left-T2MIBevel11.Width
         else T2MIBevel11.Left:=BA1Panel.Left-T2MIBevel11.Width;
         T2MIBevel12.Left:=T2MIBevel11.Left;
         T2MIBevel13.Left:=T2MIBevel11.Left;
         T2MIBevel13.Width:=T2MIBevel14.Left+T2MIBevel14.Width-T2MIBevel13.Left;
         Opt1SPI_CB.Checked:=value;
       end;
    2: begin
         OptIn2Panel.Visible:=value;
         OptIn2Bevel.Visible:=value;
         if value then T2MIBevel21.Left:=OptIn2Panel.Left-T2MIBevel21.Width
         else T2MIBevel21.Left:=BA2Panel.Left-T2MIBevel21.Width;
         T2MIBevel22.Left:=T2MIBevel21.Left;
         T2MIBevel23.Left:=T2MIBevel21.Left;
         T2MIBevel23.Width:=T2MIBevel24.Left+T2MIBevel24.Width-T2MIBevel23.Left;
         Opt2SPI_CB.Checked:=value;
       end;
    3: begin
         OptIn3Panel.Visible:=value;
         OptIn3Bevel.Visible:=value;
         if value then T2MIBevel31.Left:=OptIn3Panel.Left-T2MIBevel31.Width
         else T2MIBevel31.Left:=BA3Panel.Left-T2MIBevel31.Width;
         T2MIBevel32.Left:=T2MIBevel31.Left;
         T2MIBevel33.Left:=T2MIBevel31.Left;
         T2MIBevel33.Width:=T2MIBevel34.Left+T2MIBevel34.Width-T2MIBevel33.Left;
         Opt3SPI_CB.Checked:=value;
       end;
    4: begin
         OptIn4Panel.Visible:=value;
         OptIn4Bevel.Visible:=value;
         Opt4SPI_CB.Checked:=value;
       end;
  end;
  BlockirCBClick:=false;
end;
//------------------------------------------------------------------------------
function TForm1.GetOptOut_en(index:integer): boolean;
begin
  result:=false;
  if (index<1)or(index>4)then exit;
  result:=FOptOut_en[index];
end;
//------------------------------------------------------------------------------
procedure TForm1.SetOptOut_en(index:integer; value: boolean);
begin
  if (index<1)or(index>4)then exit;
  FOptOut_en[index]:=value;
  BlockirCBClick:=true;
  if (index>1)and(value) then
  begin
    ArrRecCB[index-1].OUT_SPI1_CB.Checked:=false;
    if ArrRecCB[index-1].OUT_SPI2_CB<>nil then ArrRecCB[index-1].OUT_SPI2_CB.Checked:=false;
  end;
  if (index>2)and(value) then ArrRecCB[index-2].OUT_SPI2_CB.Checked:=false;

  if not value then
  begin
    if ArrRecCB[index].OUT_SPI1_CB<>nil then ArrRecCB[index].OUT_SPI1_CB.Checked:=false;
    if ArrRecCB[index].OUT_SPI2_CB<>nil then ArrRecCB[index].OUT_SPI2_CB.Checked:=false;
  end;

  case index of
    1: begin
         OptOut1Panel.Visible:=value;
         OptOut1Bevel.Visible:=value;
         Opt1out_CB.Checked:=value;
       end;
    2: begin
         OptOut2Panel.Visible:=value;
         OptOut2Bevel.Visible:=value;
         if value then T2MIBevel14.Left:=OptOut2Panel.Left+OptOut2Panel.Width
         else T2MIBevel14.Left:=BA2Panel.Left+BA2Panel.Width;
         T2MIBevel15.Left:=T2MIBevel14.Left;
         T2MIBevel13.Width:=T2MIBevel14.Left+T2MIBevel14.Width-T2MIBevel13.Left;
         Opt2out_CB.Checked:=value;
       end;
    3: begin
         OptOut3Panel.Visible:=value;
         OptOut3Bevel.Visible:=value;
         if value then T2MIBevel24.Left:=OptOut3Panel.Left+OptOut3Panel.Width
         else T2MIBevel24.Left:=BA3Panel.Left+BA3Panel.Width;
         T2MIBevel25.Left:=T2MIBevel24.Left;
         T2MIBevel23.Width:=T2MIBevel24.Left+T2MIBevel24.Width-T2MIBevel23.Left;
         Opt3out_CB.Checked:=value;
       end;
    4: begin
         OptOut4Panel.Visible:=value;
         OptOut4Bevel.Visible:=value;
         if value then T2MIBevel34.Left:=OptOut4Panel.Left+OptOut4Panel.Width
         else T2MIBevel34.Left:=BA4Panel.Left+BA4Panel.Width;
         T2MIBevel35.Left:=T2MIBevel34.Left;
         T2MIBevel33.Width:=T2MIBevel34.Left+T2MIBevel34.Width-T2MIBevel33.Left;
         Opt4out_CB.Checked:=value;
       end;
  end;
  BlockirCBClick:=false;
end;
//------------------------------------------------------------------------------
function TForm1.GetT2MI_link(index:integer): boolean;
begin
  result:=false;
  if (index<1)or(index>3)then exit;
  result:=FT2MI_link[index];
end;
//------------------------------------------------------------------------------
procedure TForm1.SetT2MI_link(index:integer; value: boolean);
begin
  if (index<1)or(index>3)then exit;
  FT2MI_link[index]:=value;
  BlockirCBClick:=true;
  if value then
  begin
    ArrRecCB[index].OUT_SPI1_CB.Checked:=false;
    if ArrRecCB[index].OUT_SPI2_CB<>nil then ArrRecCB[index].OUT_SPI2_CB.Checked:=false;
    if index>1 then
      if ArrRecCB[index-1].OUT_SPI2_CB<>nil then
        ArrRecCB[index-1].OUT_SPI2_CB.Checked:=false;
  end;

  if (index>1)and(value) then ArrRecCB[index-1].OUT_SPI2_CB.Checked:=false;
  case index of
    1: begin
         T2MIBevel11.Visible:=value;
         T2MIBevel12.Visible:=value;
         T2MIBevel13.Visible:=value;
         T2MIBevel14.Visible:=value;
         T2MIBevel15.Visible:=value;
         BA_1LinkCB.Checked:=value;
       end;
    2: begin
         T2MIBevel21.Visible:=value;
         T2MIBevel22.Visible:=value;
         T2MIBevel23.Visible:=value;
         T2MIBevel24.Visible:=value;
         T2MIBevel25.Visible:=value;
         BA_2LinkCB.Checked:=value;
       end;
    3: begin
         T2MIBevel31.Visible:=value;
         T2MIBevel32.Visible:=value;
         T2MIBevel33.Visible:=value;
         T2MIBevel34.Visible:=value;
         T2MIBevel35.Visible:=value;
         BA_3LinkCB.Checked:=value;
       end;
  end;
  BlockirCBClick:=false;
end;
//------------------------------------------------------------------------------

procedure TForm1.Opt_CBClick(Sender: TObject);
var CB: TCheckBox;
ind: integer;
begin
  if BlockirCBClick then exit;
  if Sender=nil then exit;
  CB:=TCheckBox(Sender);
  if length(CB.Name)<5 then exit;
  ind:=ord(CB.Name[4])-48;
  if (ind<1)or(ind>4)then exit;
  if (DeviceCB.ItemIndex=0)and(ModificCB.ItemIndex=1) then
  begin
    if (not Opt1SPI_CB.Checked)or(Opt1out_CB.Checked) then Opt2SPI_CB.Checked:=false;
    if (Opt1SPI_CB.Checked)or(not Opt1out_CB.Checked) then Opt2out_CB.Checked:=false;
  end;
  case CB.Name[5] of
    'A': OptASI_en[ind]:=(BA_en[ind])and(CB.Checked);
    'S': OptSPI_en[ind]:=(BA_en[ind])and(CB.Checked);
    'o': OptOut_en[ind]:=(BA_en[ind])and(CB.Checked);
    'L': T2MI_link[ind]:=(BA_en[ind])and(BA_en[ind+1])and(CB.Checked);
  end;
  if (DeviceCB.ItemIndex=0)and(ModificCB.ItemIndex=1) then
  begin
    Opt1SPI_CB.Enabled:=(not Opt1out_CB.Checked)or(not Opt2out_CB.Checked);
    Opt1out_CB.Enabled:=(not Opt1SPI_CB.Checked)or(not Opt2SPI_CB.Checked);
    Opt2SPI_CB.Enabled:=(Opt1SPI_CB.Checked)and(not Opt1out_CB.Checked);
    Opt2out_CB.Enabled:=(not Opt1SPI_CB.Checked)and(Opt1out_CB.Checked);
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.Out_mult_ChBClick(Sender: TObject);
var CB, CB_dis: TCheckBox;
ind, count: integer;
begin
//  if BlockirCBClick then exit;
  if Sender=nil then exit;
  CB:=TCheckBox(Sender);
  if length(CB.Name)<5 then exit;
  ind:=ord(CB.Name[4])-48;
  if (ind<1)or(ind>4)then exit;

  if not ArrRecCB[ind].OUT_ASI1_CB.Checked then
  begin
    ArrRecCB[ind].OUT_ASI2_CB.Checked:=false;
    ArrRecCB[ind].OUT_ASI2_CB.Enabled:=false;
  end;
  if not ArrRecCB[ind].OUT_SPI1_CB.Checked then
  begin
    ArrRecCB[ind].OUT_SPI2_CB.Checked:=false;
    ArrRecCB[ind].OUT_SPI2_CB.Enabled:=false;
  end;

  // защита от использования больше 4 входов опции
  count:=0;
  if ArrRecCB[ind].OUT_ASI1_CB.Checked then inc(count) else CB_dis:=ArrRecCB[ind].OUT_ASI1_CB;
  if ArrRecCB[ind].OUT_ASI2_CB.Checked then inc(count) else CB_dis:=ArrRecCB[ind].OUT_ASI2_CB;
  if ArrRecCB[ind].OUT_SPI1_CB.Checked then inc(count) else CB_dis:=ArrRecCB[ind].OUT_SPI1_CB;
  if ArrRecCB[ind].OUT_SPI2_CB.Checked then inc(count) else CB_dis:=ArrRecCB[ind].OUT_SPI2_CB;
  if count=3 then CB_dis.Enabled:=false
  else
  begin
    ArrRecCB[ind].OUT_ASI1_CB.Enabled:=true;
    ArrRecCB[ind].OUT_ASI2_CB.Enabled:=ArrRecCB[ind].OUT_ASI1_CB.Checked;
    ArrRecCB[ind].OUT_SPI1_CB.Enabled:=true;
    ArrRecCB[ind].OUT_SPI2_CB.Enabled:=ArrRecCB[ind].OUT_SPI1_CB.Checked;
  end;

  if (CB=ArrRecCB[ind].OUT_SPI1_CB)and(ind<4) then
  begin
//    ArrRecCB[ind+1].OUT_opt_en.Enabled:=not CB.Checked;
    if CB.Checked then
    begin
      OptOut_en[ind+1]:=false;
      T2MI_link[ind]:=false;
    end;
  end;
  if (CB=ArrRecCB[ind].OUT_SPI2_CB)and(ind<3) then
  begin
//    ArrRecCB[ind+2].OUT_opt_en.Enabled:=not CB.Checked;
    if CB.Checked then
    begin
      OptOut_en[ind+2]:=false;
      T2MI_link[ind+1]:=false;
    end;
  end;
  // прорисовка линий
  case ind of
    1: begin
         OptOut2Bevel2.Visible:=ArrRecCB[ind].OUT_SPI1_CB.Checked;
         OptOut2Bevel3.Visible:=OptOut2Bevel2.Visible;
         OptOut3Bevel2.Visible:=ArrRecCB[ind].OUT_SPI2_CB.Checked;
         OptOut3Bevel3.Visible:=OptOut3Bevel2.Visible;
         if OptOut3Bevel2.Visible then
         begin
           OptOut3Bevel2.Width:=160;
           OptOut3Bevel3.Left:=OptOut3Bevel2.Left+OptOut3Bevel2.Width-OptOut3Bevel3.Width;
           OptOut3Bevel3.Top:=OptOut1Panel.Top+OptOut1Panel.Height;
           OptOut3Bevel3.Height:=OptOut3Bevel2.Top-OptOut3Bevel3.Top;
         end;
       end;
    2: begin
         OptOut3Bevel2.Visible:=ArrRecCB[ind].OUT_SPI1_CB.Checked;
         OptOut3Bevel3.Visible:=OptOut3Bevel2.Visible;
         if OptOut3Bevel2.Visible then
         begin
           OptOut3Bevel2.Width:=60;
           OptOut3Bevel3.Left:=OptOut3Bevel2.Left+OptOut3Bevel2.Width-OptOut3Bevel3.Width;
           OptOut3Bevel3.Top:=OptOut2Panel.Top+OptOut2Panel.Height;
           OptOut3Bevel3.Height:=OptOut3Bevel2.Top-OptOut3Bevel3.Top;
         end;
         OptOut4Bevel2.Visible:=ArrRecCB[ind].OUT_SPI2_CB.Checked;
         OptOut4Bevel3.Visible:=OptOut4Bevel2.Visible;
         if OptOut4Bevel2.Visible then
         begin
           OptOut4Bevel2.Width:=160;
           OptOut4Bevel3.Left:=OptOut4Bevel2.Left+OptOut4Bevel2.Width-OptOut4Bevel3.Width;
           OptOut4Bevel3.Top:=OptOut2Panel.Top+OptOut2Panel.Height;
           OptOut4Bevel3.Height:=OptOut4Bevel2.Top-OptOut4Bevel3.Top;
         end;
       end;
    3: begin
         OptOut4Bevel2.Visible:=ArrRecCB[ind].OUT_SPI1_CB.Checked;
         OptOut4Bevel3.Visible:=OptOut4Bevel2.Visible;
         if OptOut4Bevel2.Visible then
         begin
           OptOut4Bevel2.Width:=60;
           OptOut4Bevel3.Left:=OptOut4Bevel2.Left+OptOut4Bevel2.Width-OptOut4Bevel3.Width;
           OptOut4Bevel3.Top:=OptOut3Panel.Top+OptOut3Panel.Height;
           OptOut4Bevel3.Height:=OptOut4Bevel2.Top-OptOut4Bevel3.Top;
         end;
       end;
  end;

end;

//------------------------------------------------------------------------------
function TForm1.GetMacOptionCount(opt_ind: integer; isInOpt: boolean): integer;
begin
  result:=0;
  if isInOpt then
  begin
    if (opt_ind>=0)and(opt_ind<MAX_IN_OPTION) then
    begin
      case inOptArr[opt_ind].func of
        0: exit;
      end;
    end;
  end
  else
  begin
    if (opt_ind>=0)and(opt_ind<MAX_OUT_OPTION) then
    begin
      case outOptArr[opt_ind].func of
        8,9: result:=1;
      end;
    end;
  end;
end;
//------------------------------------------------------------------------------
procedure TForm1.AddMacOption(opt_ind: integer; isInOpt: boolean; var OptInit: tOptInit; arrofs: byte);
begin
  if isInOpt then
  begin
    if (opt_ind>=0)and(opt_ind<MAX_IN_OPTION) then
    begin
      GetDefaultInOptionInit(1, opt_ind, @OptInit, arrofs);
      case inOptArr[opt_ind].func of
        0: exit;
        10..13: AddMacTSoIPIn(OptInit, arrofs);
        else exit;
      end;
    end;
  end
  else
  begin
    if (opt_ind>=0)and(opt_ind<MAX_OUT_OPTION) then
    begin
      GetDefaultOutOptionInit(1, opt_ind, @OptInit, arrofs);
      case outOptArr[opt_ind].func of
        8,9: AddMacTSoIPOut(OptInit, arrofs);
        else exit;
      end;
    end;
  end;

end;
//------------------------------------------------------------------------------
procedure TForm1.AddMacTSoIPOut(var OptInit: tOptInit; arrofs: byte);
begin
  if arrofs<>0 then exit;

  OptInit.tsoip_out.self_mac:=GetNewMac(SetAdvMac);
  AddMac(OptInit.tsoip_out.self_mac);
end;
//------------------------------------------------------------------------------
procedure TForm1.AddMacTSoIPIn(var OptInit: tOptInit; arrofs: byte);
begin
  if arrofs<>0 then exit;

  OptInit.tsoip_in.self_mac:=GetNewMac(SetAdvMac);
  AddMac(OptInit.tsoip_out.self_mac);
end;
//------------------------------------------------------------------------------
procedure TForm1.GetMacOption(opt_ind: integer; isInOpt: boolean;
  OptInit: tOptInit; var MACs: tArrMAC; arrofs: byte);
begin
  if isInOpt then
  begin
    if (opt_ind>=0)and(opt_ind<MAX_IN_OPTION) then
    begin
      case inOptArr[opt_ind].func of
        0: exit;
        else exit;
      end;
    end;
  end
  else
  begin
    if (opt_ind>=0)and(opt_ind<MAX_OUT_OPTION) then
    begin
      case outOptArr[opt_ind].func of
        8,9: GetMacOptionTSoIPOut(OptInit, MACs, arrofs);
        else exit;
      end;
    end;
  end;

end;
//------------------------------------------------------------------------------
procedure TForm1.GetMacOptionTSoIPOut(OptInit: tOptInit; var MACs: tArrMAC; arrofs: byte);
var count: integer;
begin
  if arrofs<>0 then exit;

  if not EqMac(OptInit.tsoip_out.self_mac, MAC_FF) then
  begin
    count:=Length(MACs);
    SetLength(MACs, count+1);
    MACs[count]:=OptInit.tsoip_out.self_mac;
  end;
end;
//------------------------------------------------------------------------------

end.
