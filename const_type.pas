unit const_type;

interface
uses Types, ExtCtrls;

const
MAX_ARRAY_IN_TCP = 5000000;
MAX_TARGET_OLD = 4;
MAX_OUT_MESS_PARAM = 2000;
MAX_PID_T2MI = 4;
MAX_ADV_OPT = 2;
MAX_BOARD_DESCR = 15;
MAX_BOARD_IN_CON = 8;
MAX_BOARD_OUT_CON = 8;
MAX_NUMBER_OF_PROGRAMS = 64; // максимальное количество принимаемых программ

MAX_BITRATE_LIST = 32;

MAX_OPT_ARR = 32;


G420_BLOCK_DATA = 1024; // 512 либо 1024
G420_SD_ALLIGN = 512;   // если файл не кратен этой величине, дополняем $ff чтобы стал кратен
G420_MAX_PROG_LIST = 200;


  Target0 = 0;

  Comand_Get_Device_Info     = 1;
  Comand_Get_Device_Errors   = 2;
  Comand_Set_Device_Mode  = $4003;
  Comand_g420_ProgArr     = $4010;
  Comand_g420_SetPlayMode = $4012;


// (Target_id=1..4)
  Comand_Get_Status      = 4;

//----------------------------------
// ответы
// (Target_id=0)
  Mess_Device_Info = 1;
  Mess_Device_Errors = 2;
  Mess_Prog_Arr_Status = $4010;
// (Target_id=1..4)
  Mess_Status = 1;
// формат данных
  fDec    = 0; // десятичный
  fHex    = 1; // шестнадцатиричный
  fBin    = 2; // двоичный
  fHexDec = 3; // шестнадцатиричный (в скобках десятичный)

  START_KEY = $5600;
  MULT_KEY  = $00e3;
  ADD_KEY   = $105a;

//цвета
  err1Color =        $b0b0ff;
  err1ColorSel =     $9090e0;
  err2Color =        $80d0ff;
  err2ColorSel =     $60b0e0;
  err3Color =        $80ffff;
  err3ColorSel =     $60e0e0;
  err4Color =        $ffff80;
  err4ColorSel =     $e0e060;
  errGreenColor =    $80ff80;
  errGreenColorSel = $60e060;
  GistProgColor1   = $f4a500;

  MainSection = 'main';
  ItemWinLeft = 'WindowsLeft';
  ItemWinTop = 'WindowsTop';
  ItemWinWidth = 'WindowsWidth';
  ItemWinHeight = 'WindowsHeight';
  ItemWinMaximize = 'WindowMaximize';
  ItemDeviceError = 'DeviceErrorEn';

  HostsSection = 'Hosts';
  ItemHost = 'Host';
{  ItemPort = 'Port';  }

  g420Section = 'g420';
  ItemG420_DSP11 = 'G420_DSP11';
  ItemG420_DSP12 = 'G420_DSP12';
  ItemG420_DSP21 = 'G420_DSP21';
  ItemG420_SD1 = 'G420_SD1';
  ItemG420_SD2 = 'G420_SD2';
  ItemG420_SD3 = 'G420_SD3';
  ItemG420_SD4 = 'G420_SD4';
  ItemG420_SendBlocks = 'G420_SendBlocks';
  ItemG420_StartAddr = 'G420_StartAddr';
  ItemG420_Increment = 'G420_Increment';
  ItemG420_SD_use = 'G420_SD_use';
  ItemG420_PlayMode = 'G420_PlayMode';
  ItemG420_BitRateIn = 'G420_BitRateIn';
  ItemG420_BitRateOut = 'G420_BitRateOut';
  ItemFileTime_prexix = 'FileTime_';
  ItemFileCheckSum_prexix = 'FileCheckSum_';


IN_EXCL_MODE_DISABLE = 0;
IN_EXCL_MODE_IP      = 1;
IN_EXCL_MODE_PASS    = 2;
IN_EXCL_MODE_IP_PASS = 3;
IN_EXCL_MODE_OTHER   = 4;
IN_EXCL_MODE_ALL     = 5;
IN_EXCL_MODE_MY      = 6;

SIG_FLAG_NO_CHANGE_BR        = $01;
SIG_FLAG_NO_CORRECT_PCR      = $02;
SIG_FLAG_NO_INSERT_NULL_PACK = $04;
SIG_FLAG_SDI_PACK            = $80;


type
  ParrTCP = ^TarrTCP;
  TarrTCP = array[0..MAX_ARRAY_IN_TCP]of byte;

  PArrByte = ^TArrByte;
  TArrByte = array[0..32000000]of byte;
  PArrWord = ^TArrWord;
  TArrWord = array[0..16000000]of word;
  PArrDword = ^TArrDword;
  TArrDword = array[0..8000000]of dword;
//  PArrByte = ^TArrByte;
//  TArrByte = array[0..$1fffffff]of byte;
  PArrChar = ^TArrChar;
  TArrChar = array[0..$1fffffff]of AnsiChar;

  tMac = array[0..5]of byte;
  TInOptCon = array[0..MAX_BOARD_IN_CON-1] of byte;
  TOutOptCon = array[0..MAX_BOARD_OUT_CON-1] of byte;

  tPassword = array[0..15] of byte;

  PPass_uni = ^TPass_uni;
  TPass_uni = packed record
    case integer of
    0: (b: tPassword);
    1: (w: array[0..7] of word);
  end;

  PEthHeader=^TEthHeader;
  TEthHeader=record
    Prefix: dword;
    Length: dword;
    Target_ID: word;
    Command_ID: word;
    Command: word;
    Response: word;
  end;

  PBoardDescriptor = ^TBoardDescriptor;
  TBoardDescriptor = packed record
    target: byte; // 0 - запрещено; 1-8 - БА(реализовано 5); 9-16 - опции I2C; 17-24 - опции SPI
    arr_ind_init: byte;
    arr_ind_set: byte;
    arr_ind_status: byte;
    reserv: array[4..7]of byte;
    brdtyp: word;
    // информация о входах (что подключено на соответствующий вход
    in_opt_con: TInOptCon;   // bit[7..3] - номер платы, bit[2..0] - номер выхода; $ff - вход не подключен; $fe - вход выходит наружу
    // информация о выходах (что подключено на соответствующий выход
    out_opt_con: TOutOptCon; // bit[7..3] - номер платы, bit[2..0] - номер входа; $ff - выход не подключен; $fe - выход выходит наружу
    reserv2: array[26..31]of byte;
  end;

  PBoardDescriptors = ^TBoardDescriptors;
  TBoardDescriptors = array[0..MAX_BOARD_DESCR-1] of TBoardDescriptor;

  TBoardInfo_v3 = packed record
    typ:         byte;
    version:     byte;
    data:        word;
    i2c_typ:     byte;
    i2c_version: byte;
    i2c_data:    word;
    opt_typ:     byte;
    opt_version: byte;
    opt_data:    word;
    reserv: array[12..15]of byte;
  end;

  TBoardsInfo = array[0..7] of TBoardInfo_v3;

  tOptLink = packed record
    inOptType  : word;
    outOptType : word;
  end;

  tArrOptLink = array[0..MAX_TARGET_OLD-1]of tOptLink;
//  tArrBAOptLink = array[0..MAX_BA_NUM-1]of tOptLink;

  TBoardInfo=packed record
    typ:         byte;
    version:     byte;
    data:        word;
    i2c_typ:     byte;
    i2c_version: byte;
    i2c_data:    word;
  end;

  PDeviceInfo=^TDeviceInfo;
  TDeviceInfo=packed record
    factory_num: word;
    device_version: word;
    boards      : tArrOptLink;
    adv_opt     : array[0..MAX_ADV_OPT-1] of word;
//    reserve1: word;
//    reserve2: word;
    BoardInfo: array[0..MAX_TARGET_OLD-1]of TBoardInfo;
//    OptionInfo: array[0..MAX_OPTION-1]of TOptionInfo;
  end;

  PDeviceInfo_v3 = ^TDeviceInfo_v3;
  TDeviceInfo_v3=packed record
    reserve1: word;
    device_version: word;
    reserve2: dword;
    xid: dword;
    factory_num: word;
    device_type: word;
    mac: tMac;
    reserve3: array[22..39]of byte;
    b_descrs: TBoardDescriptors;
    reserve4: array[40+SizeOf(TBoardDescriptors)..1031]of byte;
    BoardInfo: TBoardsInfo;
    reserve5: array[1160..1287]of byte;
  end;

  PATPStatus = ^TATPStatus;
  TATPStatus=packed record
    Connect_Count: byte;
    Atp_Connect_Count: byte;
    Errors_Count: byte;
    Exlusive_Status: byte;
    opt_version: byte;
    Reserve1: array[5..7]of byte;
    t2mi_version: array[0..MAX_PID_T2MI-1]of dword;
    Reserve2: array[8+4*MAX_PID_T2MI..31]of byte;
  end;

  PATPStatus_v3 = ^TATPStatus_v3;
  TATPStatus_v3=packed record
    Connect_Count: byte;
    Atp_Connect_Count: byte;
    Errors_Count: byte;
    Exlusive_Status: byte;
    control_ip: dword;
    opt_version: byte;
    Reserve1: byte;
    ts2ip_status: word;
    debug_type: word;
    debug_info: array[0..3]of word;
    Reserve2: array[22..63]of byte;
  end;

  PMessOut=^TMessOut;
  TMessOut=record
    header: TEthHeader;
    param: array[0..$10000-1]of word;
  end;

//^^^^^^^^^^^^^^^^^^^^ TG420ProgData ^^^^^^^^^^^^^^^^^^^^
  TG420StructSD = record
    curpos: dword;             // для DSP текущий адрес, для SD текущий номер блока, относительно начала файла, при старте = 0
    finish1: boolean;          // включается после отправки последнего пакета
    finish2: boolean;          // включается после получения дополнительного ответа - отчета по програмированию
    block_count_one: integer;  // число блоков для одной SD, при отправке каждого блока уменьшается на 1
    blocks_one: integer;       // число блоков для одной SD, не уменьшается
    send_block_count: integer; // число блоков, отправленных без ожидания ответа. при каждой отправке увеличивается, при каждом ответе уменьшается
    next_recv_start_address: dword; // ожидаемое поле start_address в принимаемом ответе
    err_log: string;
  end;


  TG420FileStruct = record
    device: byte;
    param: byte;
    state: byte; // 0-свободен; 1-занят; 2-ошибка
    group: byte;
//    ofs: byte;
    length: dword;
    StatusPanel: TPanel;
//    ready: boolean;
    start_address: dword;      // начальный адрес для DSP начальный номер блока для SD
    SendTime: TDateTime;
    StartTime: TDateTime;
//    unit_size: word;
    sd: array[0..3]of TG420StructSD;
//    SendLeng: word;
//    SendStartAddr: dword;
//    block_ind_2: integer;
//    block_ind_1: integer;
    max_block_count: integer; // число блоков без ожидания подтверждения
    arr: array of byte;
    last_proc: integer;
  end;

  PG420StartSD = ^TG420StartSD;
  TG420StartSD = packed record  // запрос для подготовки к программированию SD CARD
    dest_device: byte;  // =3
    device_param: byte; // b[0]=1 - будет программироваться SD1;
                        // b[1]=1 - будет программироваться SD2;
                        // b[2]=1 - будет программироваться SD3;
                        // b[3]=1 - будет программироваться SD4;
    reserve1: word;
    start_address: dword; // Начальный адрес программирования первого блока (адрес не в байтах а блоках и каждый блок по 512 байт) общий для всех SD CARD
    block_count: dword; // Число блоков для программирования (не может быть =0)
    reserve2: dword;
  end;

  PG420SendHeader = ^TG420SendHeader;
  TG420SendHeader = packed record
    dest_device: byte;
    device_param: byte;
    reserve1: word;
    start_address: dword;
    arr_length: word;
    reserve2: array[10..15]of byte;
  end;

  PG420Send = ^TG420Send;
  TG420Send = packed record  // запрос для программирования DSP и SD CARD
    header: TG420SendHeader;
    arr: array[0..G420_BLOCK_DATA-1]of byte;
  end;

  PG420ReceiveMess = ^TG420ReceiveMess;
  TG420ReceiveMess = packed record
    dest_device: byte;         // для всего
    device_param: byte;        // для DSP - device_param, для SD - SubCommand
    Block_count: word;         // число подтвержденных блоков (0 – не допустимое значение)
    start_address: dword;      // для DSP в байтах для SD в блоках
    prog_status: integer;
    reserve2: array[12..15]of byte;
  end;

  PG420ReceivePack = ^TG420ReceivePack;
  TG420ReceivePack = packed record
    header: TEthHeader;
    mess: TG420ReceiveMess;
  end;

  TG420PlayMess = packed record
    PlayCommand: byte;
    Mode: byte;
    LastBlockBytes: word;
    sig_id: dword;
    StartAdress: dword;
    Length: dword;
    BitRateInput: dword;
    BitRateOutput: dword;
    name: array[0..15]of byte;
  end;

  TSignalProgInfo = record
    service_id: word;
    prov_name: string;
    prog_name: string;
  end;

  TSignalBRInfo = record
    file_name: string;
    start_addr: dword;
    length: int64;
    leng_bl: dword;
    last_bl_leng: word;
    delta_pts: dword;
    br: dword;
  end;

  TSignalListItem = record
    name: string;
    sig_id: dword;
    //MPEG
    min_br: dword;
    table_pres: word;
    // SDI
    discr_format: byte;	// Формат дискретизации (4:2:0,4:2:2 и т.п.)
    frame_rate: byte;		// Кадровая частота
    fr_width: word;		// Ширина в пикселях
    fr_height: word;		// Высота в пикселях
    //
    prog_count: integer;
    br_count: integer;
    ProgInfo: array[0..MAX_NUMBER_OF_PROGRAMS-1] of TSignalProgInfo;
    Signal_br: array[0..MAX_BITRATE_LIST-1] of TSignalBRInfo;
  end;

  TSignalListItem2 = record
    name: string;
    sig_id_type: byte;
//    sig_id_list: byte;
    flags: byte;
    sig_id_num: dword;
    //MPEG
    min_br: dword;
    table_pres: word;
    // SDI
    discr_format: byte;	// Формат дискретизации (4:2:0,4:2:2 и т.п.)
    frame_rate: byte;		// Кадровая частота
    fr_width: word;		// Ширина в пикселях
    fr_height: word;		// Высота в пикселях
    //
    prog_count: integer;
    br_count: integer;
    ProgInfo: array[0..MAX_NUMBER_OF_PROGRAMS-1] of TSignalProgInfo;
    Signal_br: array[0..MAX_BITRATE_LIST-1] of TSignalBRInfo;
  end;

  TSignalListItem3 = record
    SigFileName: string;
    sig_id_list: byte;
    signal: TSignalListItem2;
  end;

  TProgItem = record
    FileName: string;
    device: byte;
    param: byte;
    group: byte;
    panel: TPanel;
    start_addr: int64;
  end;

  tOptControlData = packed record
    case integer of
    0:(arr: array[0..127]of byte;);
  end;

  tOptControlData_v3 = packed record
    case integer of
    0:(arr: array[0..255]of byte;);
  end;

  pOptControl = ^tOptControl;
  tOptControl = packed record
//    control_test_del: byte;
//    dataLength_test: byte;
//    reserve: array[0..7]of byte;
    data: tOptControlData;
  end;

  pOptControl_v3 = ^tOptControl_v3;
  tOptControl_v3 = packed record
    data: tOptControlData_v3;
  end;

  POptionsControl_v3 = ^TOptionsControl_v3;
  TOptionsControl_v3 = array[0..MAX_OPT_ARR-1]of tOptControl_v3;


implementation

end.
