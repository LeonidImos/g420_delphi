unit MyTypes;

interface
uses constants, {options,} type_dvbt2, memory, MyTypes2,
     Graphics, Types, Classes, ExtCtrls;

type
//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ общие ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------
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

//  TGlobalMode=(ATPMode,FileMode);

  TStyle=record
    Font: TFont;
    Color,ColorSel: TColor;
  end;

  tMac = array[0..5]of byte;

  TArrString = array of string;

  TInputName = record
    Name: string;
    Text: string;
  end;

  TInputNames = array of TInputName;

  TTimeRecord = record
    StartTime: TDateTime;
    EndTime: TDateTime;
    FullTime: TDateTime;
    AnaliseTime: TDateTime;
  end;

  TPrintInfoBA = record
    enabled: boolean;
    ObjControl: string;
    InputName: string;
    b_type: byte;
    t2mi_on: boolean;
  end;

  TProtocolTempl = record
    Header: string;
    Location: string;
    Poverka: string;
    Podpis: string;
    TimeEn: boolean;
    ZakluchEn: boolean;
    DateEn: boolean;
    DateAuto: boolean;
  end;

  PPrintInfo = ^TPrintInfo;
  TPrintInfo = record
    BoardCount: integer;
    device_type: word;
    factory_num: word;
    CurTime: TDateTime;
    TimeRecord: TTimeRecord;
    CurDir: string;
    marg: TRect;
    PageWidth: integer;
    prot: TProtocolTempl;
    BAprnInfo: array[0..MAX_BA_NUM-1] of TPrintInfoBA;
  end;

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ для анализа файла ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------
  PStat=^TStat;
  TStat=record
    PrevItem,NextItem:PStat;
    PID:word;
    Time_prev_PAT:double;
    Time_prev_PCR:double;
    Prev_PCR:int64;
    Discontinuity:boolean;
    max_accuracy:double;
    is_PCR:boolean;
    min_period_PCR, max_period_PCR,average_period_PCR: double;
    count_period_PCR:integer;
    bitrate:double;
  end;

{  TErrorT2MI=record
    filtrInd: integer;
    filtrBackInd: integer;
    count: word;
    err_code: byte;
     streamid: byte;
    PID: word;
    param1: dword;
    param2: dword;
    ErrTime: TDateTime;
  end;}

//  TPStreamMy=^TStreamMy;

{  TTimesRecord = record
    refresh: boolean;
    state: byte;
    no_sync: boolean;
    no_sync_t2mi: boolean;
    StartTime: TDateTime;
    EndTime: TDateTime;
    NoATPPeriod: TDateTime;
    NoSyncPeriod: TDateTime;
    LastEventTime: TDateTime;
  end;  }

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ для отображения скоростей ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  TSpeedRecord = record
    hierarchy: byte;
    style: byte;
//    typ: byte;
    name: WideString;
    br: PBitRate;
  end;

  PSpeeds = ^TSpeeds;
  TSpeeds = record
    header: array[0..5]of string;
    count:array[0..2]of integer;  // 0-программы(иерархическая структура); 1-список по пидам; 2-эффективная и полная скорость
    items: array[0..2]of array of TSpeedRecord;
    BitRteFull: double;
    ShowEnable: boolean;
  end;

  PSpeedIndexs = ^TSpeedIndexs;
  TSpeedIndexs = array of integer;

{  PDataStyle=^TDataStyle;
  TDataStyle=record
    style: byte;
    typ: byte;
  end;  }

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ для отображения дерева ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------
  PDataTreeNode=^TDataTreeNode;
  TDataTreeNode=record
    style: byte;
    typ: byte;
    StreamInd: word;
    ind1: integer;
    ind2: word;
    start: word;
    leng: word;
    ofs1: byte;
    ofs2: byte;
    adv_info1: word;
    adv_info2: word;
    text: string;
    txtMode: byte;
    txtID: dword;
  end;

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ для отображения заголовков журнала ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  THeaderSectionInfo = record
    Enabled: boolean;
    Alignment: TAlignment;
    Name: string;
    Width: integer;
    MinWidth: integer;
    MaxWidth: integer;
  end;

  TPHeaderInfo = ^THeaderInfo;
  THeaderInfo = record
    count: integer;
    count_en: integer;
    sect: array of THeaderSectionInfo;
    ind: array of integer;
  end;



//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ для TCP ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  ParrTCP = ^TarrTCP;
  TarrTCP = array[0..MAX_ARRAY_IN_TCP]of byte;

//  string30=string[30];
//  arr20=array[0..19]of byte;
//  arr5=array[0..4]of byte;

  PEthHeader=^TEthHeader;
  TEthHeader=record
    Prefix: dword;
    Length: dword;
    Target_ID: word;
    Command_ID: word;
    Command: word;
    Response: word;
  end;

  PBoardErrors = ^TBoardErrors;
  TBoardErrors = packed record
    total_count: dword;
    counts: array[0..cBoardErrMaxNum-1]of dword;
  end;

  TMessIn=record
    header: TEthHeader;
    arr: array[0..400]of byte;
  end;

  TMessOut=record
    header: TEthHeader;
    param: array[0..MAX_OUT_MESS_PARAM-1]of word;
  end;

  PMessOutLong=^TMessOutLong;
  TMessOutLong=record
    header: TEthHeader;
    param: array[0..1000000000-1]of word;
  end;

  PErrorIn = ^TErrorIn;
  TErrorIn=packed record
    count: dword;
    err_code: byte;
    err_ext: byte;
    PID: word;
    packet: dword;
    param1: dword;
    param2: dword;
  end;

  PErrors=^TErrors;
  TErrors = packed record
    time_interval: word;
    err: array[0..NUM_ERRORS_MPEG-1]of TErrorIn;
  end;

  PErrors_v3 = ^TErrors_v3;
  TErrors_v3 = packed record
    multy_id: dword;
    errs: TErrors;
  end;

  TMode = packed record
    input_select: byte;
    t2mi_plp: byte;
    t2mi_pid: word;
    multy_id: dword;
//    reserv: array[0..3]of byte;
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


  PStatus=^TStatus;
  TStatus=packed record
    atpstatus: TATPStatus;
    flags: byte;
    number_prog: byte;
    load: byte;
    version_struct: byte;
    bitrate: dword;
    mode: TMode;
    transport_stream_id: word;
    flags2: word;
    sync_t2mi: array[0..MAX_PID_T2MI-1]of byte;
    version_status: byte;
    Reserve3: array[21+MAX_PID_T2MI..31]of byte;
  end;

  PStatus_v3=^TStatus_v3;
  TStatus_v3=packed record
    atpstatus: TATPStatus_v3;              // 0-63
    ts_count: byte;                        // 0
    ver_stream_list: byte;                 // 1
    load: byte;                            // 2
    version_struct_full: byte;             // 3
    bitrate: dword;                        // 4-7
    mode: TMode;                           // 8-15
    reserve1a: word;  // 16-17 бывший transport_stream_id, для многопоточного не актуален
    flags: byte;                           // 18
    number_prog: byte;                     // 19
    sync_t2mi: array[0..MAX_PID_T2MI-1]of byte;                 // 20 - x
    sync_t2mi_reserve: array[20+MAX_PID_T2MI..27]of byte;       //  x - 27
    flags2: word;                                               // 28-29
    version_status: byte;                                       // 30
    reserve2: byte;                                             // 31
//    ts_count: byte;
    t2mi_version: array[0..MAX_PID_T2MI-1]of dword;             // 32 - x
    t2mi_version_reserve: array[32+4*MAX_PID_T2MI..63]of byte;  // x - 63

//    version_struct_ts: array[0..99] of byte;                    // 64 - 163
    version_struct_ts: array[0..49] of byte;                    // 64 - 163
    marker: array[0..6] of dword;
    res_mark: array[7*4..49]of byte;

    jitter_multy_id: dword;                                     // 164 - 167
    jitter_pid: word;                                           // 168 - 169
    reserv2a: word;                                             // 170 - 171
    packet: dword; // global_packet_count                          172 - 175
    no_stream: array[0..3]of dword;                             // 176 - 191
    analise_off: array[0..3]of dword;                           // 192 - 207

    list_Count: word;                                         // 208 - 209
    storage_Count: word;                                         // 210 - 211
    ts_count_ext:word;                                          // 212 - 213
    section_info_count: word;                                    // 214 - 215
    pid_count_sum: dword;                                         // 216 - 219
    dump_mode:  word;
    dump_multy_id:  dword;
    reserv:  word;

//    cikle_time2: dword;                                         // 220 - 223
//    byte_rate: dword;                                           // 224 - 227
    Reserve3: array[228..299]of byte;                           // 228 - 299
//    Reserve3: array[208..299]of byte;                           // 208 - 299
    test_arr: array[0..99] of word;                             // 300 - 499
//  public
//    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
//    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
  end;

  PQoeStatus=^TQoeStatus;
  TQoeStatus=packed record
    atpstatus: TATPStatus;
    flags: word;
    status_version: byte;
    set_version: byte;
    audio_load: byte;
    video_load: byte;
    dvbt2_opt_status_version: byte;
    dvbt2_opt_control_version: byte;
    err_state: array[0..11]of byte;
    audio_level: array[0..11]of byte;
  end;

  PQoeStatus_v3=^TQoeStatus_v3;
  TQoeStatus_v3=packed record
    atpstatus: TATPStatus_v3;
    ts_count: byte;
    reserve1: byte;
    reserve2: byte;
    flags: byte;
    status_version: byte;
    set_version: byte;
    video_load: byte;
    audio_load: byte;
    dvbt2_opt_status_version: byte;
    dvbt2_opt_control_version: byte;
    err_state: array[0..19]of byte;
    audio_level: array[0..19]of byte;
  end;

  PRequest=^TRequest;
  TRequest=packed record
    request_id: word;
    blockcount: dword;
    blocklength: dword;
    length: dword;
    time_live: TDateTime;
    prev: PRequest;
    next: PRequest;
    blocks_ok: array of boolean;
    arr: array of byte;
  end;

  PReqBlock=^TReqBlock;
  TReqBlock=packed record
    mess_cod: word;
    req_id: word;
    param: word;
    arr: array[0..$1ffff]of byte;
  end;

  PReqBlockLong=^TReqBlockLong;
  TReqBlockLong=packed record
    mess_cod: word;
    req_id: word;
    param: dword;
    arr: array[0..$1fffffff]of byte;
  end;

  tTimeStat_Item = packed record
    Total_Time: dword;
    Total_Counts: dword;
    AverTime: dword;
  end;

  pTimeStat = ^tTimeStat;
  tTimeStat = packed record
    Time:array[0..100]of tTimeStat_Item;
  end;

  pStructMain = ^tStructMain;
  tStructMain = packed record
    number_prog: byte;
    version:     byte;
    bitrate:	 dword;
   	global_packet_count: dword;
    network_PID: word;
    transport_stream_id: word;
    network_id:	word;
    original_network_id: word;
    bouquet_id:	word;
    delivery: array[0..11] of byte;
    name_length: word;
  end;

  TGetDumpItem=record
    table_index: integer;
    section_number: byte;
  end;

  PGetDumpList=^TGetDumpList;
  TGetDumpList=record
    count: integer;
    length: integer;
    dump_arr: array of TGetDumpItem;
  end;

  TTestPCRItem=record
    byte_time: single;
    delta_pac: dword;
    delta_pcr: int64;
    obr: double;
    acc: double;
  end;

  PTestPCRList=^TTestPCRList;
  TTestPCRList=record
    count: word;
    index: word;
    list: array[0..MAX_PCR_LIST-1] of TTestPCRItem;
  end;

  PStructTSIn_v3 = ^TStructTSIn_v3;
  TStructTSIn_v3 = packed record
    leng: dword;
    multy_id: dword;
    typ1: word;
  end;

  PStructIn_v3 = ^TStructIn_v3;
  TStructIn_v3 = packed record
    ts_count: byte;
    ver_stream_list: byte;
    reserv: array[0..2]of word;
    multy_id: array[0..MAX_STREAMS_OF_BA-1]of dword;
  end;

  PSpeedTSIn_v3 = ^TSpeedTSIn_v3;
  TSpeedTSIn_v3 = packed record
    leng: dword;
    multy_id: dword;
    bitrate: dword; // с этого поля начинается заголовок сообщения однопоточного АТП
    bspeed_count_packet: dword;
    pid_count: word;
    table_count: word;
  end;

  PSpeedIn_v3 = ^TSpeedIn_v3;
  TSpeedIn_v3 = packed record
    ts_count: byte;
    ver_stream_list: byte;
    reserv: array[0..2]of word;
    SpeedTSIn: TSpeedTSIn_v3;
  end;

 { TVisualFild=record
    caption: string;
  end;

  TVisualIDFild=record
    caption: string;
    ID: integer;
  end;

  TVisualColorFild=record
    caption: string;
    Color: TColor;
  end;

  TVisualStatusFild=record
    caption: string;
    Color: TColor;
    status_ok: boolean;
  end;

  TVisualCheckFild=record
    checked: boolean;
    caption: string;
  end;   }

  TVisualGauge=record
    progress: integer;
    min,max: integer;
    ForeColor: TColor;
    text: string;
  end;

{  TVisualLED=record
    state: boolean;
    OnColor: TColor;
    OffColor: TColor;
  end;

  TBoardVisual=record
    ProgLabel,SizeLabel,BitRateLabel: TVisualFild;
    IDLabel: TVisualIDFild;
    AnalisLabel: TVisualFild;
    AnalisButton: TVisualFild;
    StatusPanel: TVisualStatusFild;
    LoadGauge: TVisualGauge;
    SyncLED,T2MILED,AnalisLED: TVisualLED;
//    BlackLevGauge: TVisualGauge;
//    IdentGauge: TVisualGauge;
//    YGauge: TVisualGauge;
//    MotionGauge: TVisualGauge;
//    BlochnostGauge: TVisualGauge;
    AudioMinGauge: TVisualGauge;
    AudioMaxGauge: TVisualGauge;
    ip_LED,ts_LED,VideoLED,AudioLED: TVisualLED;
  end;

  TVisual=record
    FactoryNum,FactoryNumHint: TVisualFild;
    InputModeHint: TVisualCheckFild;
    DumpStatusPanel: TVisualColorFild;
  end;  }

  TBoardConfig=record
    expert: boolean;
    input: byte;
  end;

  TConfig=record
    Connect_Count: byte;
    App_Connect_Count: byte;
    ExclusiveStatus: byte;
    ExclusiveMode: boolean;
  end;

  TBoardInfo=packed record
    typ:         byte;
    version:     byte;
    data:        word;
    i2c_typ:     byte;
    i2c_version: byte;
    i2c_data:    word;
  end;

{  TOptionInfo=packed record
    typ:         byte;
    version:     byte;
    data:        word;
  end;    }

  tT2MIAdvInfo = packed record
    other_flags: word;
    reserve1: word;
    adv_packet_type: word;
    adv_packet_payload: word;
    adv_payload: word;
    adv_plp_num_blocks: word;
    adv_transmission_order: word;
    adv_frame_leng: word;
    adv_signalling_inconsistency: word;
    reserve2: array[9..121]of word;
  end;

  tT2MIStreamErrors = packed record
    time_interval: word;
    reserve      : word;
    count        : array[0..31] of dword;
    info         : tT2MIAdvInfo;
  end;

  pT2MIPIDErrors = ^tT2MIPIDErrors;
  tT2MIPIDErrors = packed record
    pid: word;
    sync: byte;  // Наличие синхронизации для каждого Stream_ID в отдельном бите. бит[0] - для Stream_ID=0, лог 1 есть синхр. бит[1] - для Stream_ID=1  и т.д. т.п
    reserve: byte;
    err_flags: word;
    reserve2: array[6..7] of byte;
    stream: array[0..7] of tT2MIStreamErrors;
  end;

  pT2MIPIDErrors_v3 = ^tT2MIPIDErrors_v3;
  tT2MIPIDErrors_v3 = packed record
    multy_id: dword;
    pid: word;
    sync: byte;  // Наличие синхронизации для каждого Stream_ID в отдельном бите. бит[0] - для Stream_ID=0, лог 1 есть синхр. бит[1] - для Stream_ID=1  и т.д. т.п
    reserve: byte;
    err_flags: word;
    reserve2: array[6..7] of byte;
    stream: array[0..7] of tT2MIStreamErrors;
  end;

  pT2MIInfo = ^tT2MIInfo;
  tT2MIInfo = packed record
    version: word;
    reserve: word;
    mind: byte;
    sind: byte;
    t2mi_packets: array[0..15]of word;
    leng: word;
    pid: word;
    conf_leng: word;  // длина L1conf в битах
    L1pre: TL1pre;
    L1conf: array[0..2998] of byte;
  end;

  tPassword = array[0..15] of byte;

  PPass_uni = ^TPass_uni;
  TPass_uni = packed record
    case integer of
    0: (b: tPassword);
    1: (w: array[0..7] of word);
  end;

  PStreamListInfo = ^TStreamListInfo;
  TStreamListInfo = packed record
    ts_count: byte;
    ver_stream_list: byte;
    reserv: word;
    multy_id: array[0..MAX_STREAMS_OF_BA-1]of dword;
  end;

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ перенесено из options.pas ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  tOptLink = packed record
    inOptType  : word;
    outOptType : word;
  end;

  tArrOptLink = array[0..MAX_TARGET_OLD-1]of tOptLink;
  tArrBAOptLink = array[0..MAX_BA_NUM-1]of tOptLink;

{    device: byte;
    reserve1: byte;
    dvbc_freq: word;
    dvbt_freq: word;
    dvbt_band: byte;
    reserve2: byte;
    dvbt2_freq: word;
    dvbt2_band: byte;
    dvbt2_plp: byte;
}

  tOptionRxData = packed record
    device: byte;
    change: byte; // 1 - применить настройки; 0 - без изменений
    reserve2: word;
    dvbc_freq: dword;
    dvbt_freq: dword;
    dvbt_band: word;
    reserve3: word;
    dvbt2_freq: dword;
    dvbt2_band: word;
    dvbt2_plp: byte;
    reserve4: byte;
  end;

  pOptionDataAlitronika = ^tOptionDataAlitronika;
  tOptionDataAlitronika = packed record
    contr: byte;
    dataLength: byte;
    src_id: byte;
    reserve: array[0..6]of byte;
    rx: array[0..3] of tOptionRxData;
  end;

{  pOptionDataAlitronika_i2c = ^tOptionDataAlitronika_i2c;
  tOptionDataAlitronika_i2c = packed record
    length: word;
    contr: byte;
    dataLength: byte;
    src_id: byte;
    reserve: array[0..6]of byte;
    rx: array[0..3] of tOptionRxData;
  end;    }

//  TarrIndex = array[0..3]of integer;

  tOptionDataIPTV = packed record
    contr: byte;
    dataLength: byte;
    reserve: array[0..7]of byte;
    ip_addr    : dword;
    mask       : dword;
    gateway    : dword;
    mc_addr    : dword; // Multicast address
    port       : word;
    delay      : word; // задержка в мс (от 1 до 9942)
    dhcp       : byte; // 0- откл.; 1- вкл.
    addressing : byte; // 0-unicast; 1-multicast
    FECEnable  : byte; // FEC декодирование 0- откл.; 1- вкл.
    rate_estim : byte; // оценка битовой скорости
                       // 0 - вкл., с использованием PCR
                       // 1 - откл., фиксированная задержка
                       // 2 - вкл., без использования PCR
                       // 3 - откл., без задержки

  end;

  tOptionDataDVB_Ku = packed record
//    length: word;
    contr: byte;
    dataLength: byte;
    reserve: array[0..7]of byte;
    device: byte;
    reserve1: byte;
    dvbc_freq: word;
    dvbt_freq: word;
    dvbt_band: byte;
    reserve2: byte;
    dvbt2_freq: word;
    dvbt2_band: byte;
    dvbt2_plp: byte;
  end;

  PDescrUDP = ^TDescrUDP;
  TDescrUDP = packed record
    self_port: word;
    dst_mac: TMac;
    dst_ip: dword;
    dst_port: word;
    multy_id: dword;
    mode: word;
    reserve: dword;
  end;

  PDescrUDP2 = ^TDescrUDP2;
  TDescrUDP2 = packed record
    self_port: word;
    dst_mac: TMac;
    dst_ip: dword;
    dst_port: word;
    multy_id: dword;
    mode: word;
  end;


  pOptionDataTSoIP_out = ^tOptionDataTSoIP_out;
  tOptionDataTSoIP_out = packed record
    self_ip: dword;
    self_mask: dword;
    gateway: dword;
    reserve: array[12..19]of byte;
    descr_udp: array[0..MAX_TSoIP_OUT_OPTION_CAST-1]of TDescrUDP;
  end;

  pOptionDataTSoIP_out2 = ^tOptionDataTSoIP_out2;
  tOptionDataTSoIP_out2 = packed record
//    prefix: word;
//    cod_comand: word;
    sub_comand: word;
    self_ip: dword;
    self_mask: dword;
    gateway: dword;
    reserve: array[0..33]of byte;
    descr_udp: array[0..MAX_TSoIP_OUT_OPTION2_CAST-1]of TDescrUDP2;
  end;

  pOptionDataAdvTSoIP_out = ^tOptionDataAdvTSoIP_out;
  tOptionDataAdvTSoIP_out = packed record
    sub_comand: word;
    reserve: array[0..5]of byte;
    descr_udp: array[0..MAX_TSoIP_OUT_OPTION2_CAST2-1]of TDescrUDP2;
  end;

  PDescrStream = ^TDescrStream;
  TDescrStream = packed record
    dst_ip: dword;
    dst_port: word;
    mode: word;
  end;

  pOptionDataTSoIP_in = ^tOptionDataTSoIP_in;
  tOptionDataTSoIP_in = packed record
//    prefix: word;
//    cod_comand: word;
    sub_comand: word;
    self_ip: dword;
    self_mask: dword;
    gateway: dword;
    source_id: byte;
    report_period: byte;
    reserve: array[0..7]of byte;
    descr_stream: array[0..MAX_TSoIP_IN_OPTION_CAST-1]of TDescrStream;
  end;

  pOptionDataAdvTSoIP_in = ^tOptionDataAdvTSoIP_in;
  tOptionDataAdvTSoIP_in = packed record
    sub_comand: word;
    reserve: array[0..5]of byte;
    descr_stream: array[0..MAX_TSoIP_IN_OPTION_CAST2-1]of TDescrStream;
  end;

  tOptControlData = packed record
    case integer of
    0:(arr: array[0..127]of byte;);
    1:(ali: tOptionDataAlitronika;);
    2:(iptv: tOptionDataIPTV;);
    3:(ku: tOptionDataDVB_Ku;);
    4:(tsoip_out: tOptionDataTSoIP_out;);
//    5:(tsoip_out2: tOptionDataTSoIP_out2;);
//    6:(tsoip_out_adv: tOptionDataAdvTSoIP_out;);
  end;

  tOptControlData_v3 = packed record
    case integer of
    0:(arr: array[0..255]of byte;);
    1:(ali: tOptionDataAlitronika;);
//    2:(ali2: tOptionDataAlitronika_i2c;);
    3:(iptv: tOptionDataIPTV;);
    4:(ku: tOptionDataDVB_Ku;);
    5:(tsoip_out: tOptionDataTSoIP_out;);
    6:(tsoip_out2: tOptionDataTSoIP_out2;);
    7:(tsoip_out_adv: tOptionDataAdvTSoIP_out;);
    8:(tsoip_in: tOptionDataTSoIP_in;);
    9:(tsoip_in_adv: tOptionDataAdvTSoIP_in;);
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

  tOptionControl = packed record
    InOpt:  tOptControl;
    OutOpt: tOptControl;
  end;

  tSendOptControl = packed record
    numopt: byte;
    arrofs: byte;
    control: tOptControl;
  end;

  tSendOptControl_v3 = packed record
    numopt: byte;
    arrofs: byte;
    control: tOptControl_v3;
  end;

{  tSendOptControl_v3_i2c = packed record
    numopt: byte;
    arrofs: byte;
    length: word; // длина в словах
    control: tOptControl_v3;
  end;    }

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

  POptionsControl = ^TOptionsControl;
  TOptionsControl = array[0..MAX_TARGET_OLD-1]of tOptionControl;

  POptionsControl_v3 = ^TOptionsControl_v3;
  TOptionsControl_v3 = array[0..MAX_OPT_ARR-1]of tOptControl_v3;

  TOptInitTSoIP_out = packed record
    self_mac: tMac;
  end;

  TOptInitTSoIP_in = packed record
    self_mac: tMac;
  end;

  pOptInit = ^tOptInit;
  tOptInit = packed record
    case integer of
    0:(arr: array[0..255]of byte;);
    1:(tsoip_out: TOptInitTSoIP_out;);
    2:(tsoip_in: TOptInitTSoIP_in;);
  end;

  POptionsInit_v3 = ^TOptionsInit_v3;
  TOptionsInit_v3 = array[0..MAX_OPT_ARR-1]of tOptInit;

  TOptionStatusAlitronika = packed record
//    header: TOptStatusHeader;
    status_ver: byte;
    dataLength: byte;
    opt_type: byte;
    opt_ver: byte;
    reserve: array[0..5]of byte;

    device: byte;
    reserve1: byte;
    status: word;
    frequency : dword;
    snr       : integer;
    ber       : dword;
    reserve2  : dword;
    info: UAT_INFO_SHORT;
  end;

  TOptionStatusKu4_i2c_one_module = packed record
    device: byte;    // 0 - DVB-T2; 1 - DVB-T; 2 - DVB-C
    lock: byte;      // 0x00 - нет сигнала;  0xff – настроено; 0x55 – идет настройка
    rfpwr: word;     // 10*dBm; $ffff - не действительно
    ber: dword;      // BER*2^24
    freq: dword;     // частота, Гц
    plp_cur: byte;   // текущий PLP_ID
    plp_count: byte; // число PLP
    plp: array[0..14]of byte; // список PLP_ID
  end;

  TOptionStatusKu4_i2c = packed record
    status_ver: byte;
    dataLength: byte;
    opt_type: byte;
    opt_ver: byte;
    reserve: array[0..5]of byte;
    rx: array[0..3]of TOptionStatusKu4_i2c_one_module;
  end;

  PTOptionStatusIPTV = ^TOptionStatusIPTV;
  TOptionStatusIPTV = packed record
    status_ver: byte;
    dataLength: byte;
    opt_type: byte;
    opt_ver: byte;
    reserve: array[0..5]of byte;

    status       : byte;
    protocol     : byte;
    size         : byte;
    PCRpresent   : byte;
    FECdelay     : dword;
    FECcolumns   : word;
    FECrows      : word;
    jitter       : dword;
    lost_after   : int64;
    lost_before  : int64;
    bitrate      : dword;
    rate_change  : dword;
    jitter_error : dword;
    lock_error   : dword;
    delay_factor : dword;
    TPperIP      : byte;
    output       : byte;
    busy         : byte;
  end;

  POptionStatusTSoIP_out = ^TOptionStatusTSoIP_out;
  TOptionStatusTSoIP_out = packed record
    status_phy: word;
    TS_bitrate1: dword;
    TS_bitrate2: dword;
    TS_bitrate3: dword;
    TS_bitrate4: dword;
  end;

  TUDPStatus = packed record
    bitrate: dword;  // [26..0]-br; [27]–TS_byterate_UDP1 ready; [28] – Наличие потока на входе; [29] – Overflow FIFO
    multy_id: dword; // [7..0] src_id; [21..8]-number; [30..22]-0; [31]-Transmit enable
  end;

  POptionStatusTSoIP_out2 = ^TOptionStatusTSoIP_out2;
  TOptionStatusTSoIP_out2 = packed record
    sub_command: word;
    status_phy: word;
    status_input: word;
    reserve: word;
    udp: array[0..30]of TUDPStatus;
  end;

  POptionStatusTSoIP_in = ^TOptionStatusTSoIP_in;
  TOptionStatusTSoIP_in = packed record
    sub_command: word;
    status_phy: word;
    reserve: dword;
    TS_bitrate: array[0..29]of dword;
  end;

  TOptStatusData = packed record
    case integer of
    0: (arr: array[0..255]of byte;);
    1: (ali: TOptionStatusAlitronika;);
    2: (ku4: TOptionStatusKu4_i2c;);
    3: (iptv: TOptionStatusIPTV;);
    4: (tsoip_out: TOptionStatusTSoIP_out;);
    5: (tsoip_out2: TOptionStatusTSoIP_out2;);
    6: (tsoip_in: TOptionStatusTSoIP_in;);
  end;

  POptStatus = ^TOptStatus;
  TOptStatus = packed record
//    status_ver: byte;
//    dataLength: byte;
//    opt_type: byte;
//    opt_ver: byte;
//    reserve: array[0..5]of byte;
    data: TOptStatusData;
  end;

  TSendOptStatus=packed record
    numopt: byte;
    reserv: byte;
    status: TOptStatus;
  end;

{  TOutOptionStatus = packed record
    case integer of
    0: (arr: array[0..127]of byte;);
  end;   }

  TOptionStatus = packed record
    InOpt:  TOptStatus;
    OutOpt: TOptStatus;
  end;

  POptionsStatus = ^TOptionsStatus;
  TOptionsStatus = array[0..MAX_TARGET_OLD-1]of TOptionStatus;

  POptionsStatus_v3 = ^TOptionsStatus_v3;
  TOptionsStatus_v3 = array[0..MAX_OPT_ARR-1]of TOptStatus;

{  TStructMashine = record
    change: boolean;
//    refresh: boolean;
    Time: TDateTime;
    Hint: string;
    Color: TColor;
  end;  }

  TInOptCon = array[0..MAX_BOARD_IN_CON-1] of byte;
  TOutOptCon = array[0..MAX_BOARD_OUT_CON-1] of byte;

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
    ts_src_id:      byte; // первый идентификатор источника потока, используется в платах при преобразовании формата 188 в 192, входит в multy_id
    ts_src_count:   byte; // число идентификаторов источника потока. Если 0, то src_id не актуально. Если >1 то источники нумеруются подряд, как src_id+i, где i=[0..src_count-1]
    reserv2: array[28..31]of byte;
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

  TTimeSetting = packed record
    PTS_time: dword; 		// 700 ms
    PCR_time: dword;		// 40 ms
    PID_video_time: dword;	// 5000 ms
    PID_audio_time: dword;	// 5000 ms
    PID_data_time: dword;	// 5000 ms
    SI_time: dword;		// 25 ms
    table_time: array[0..8]of  dword;	// 0-PAT; 1-NIT_actual; 2-SDT_actual; 3-EIT_actual; 4-TDT; 5-NIT_other; 6-SDT_other; 7-EIT_other; 8-PMT;
  end;

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ джиттер ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  PTPCRListItem = ^TPCRListItem;
  TPCRListItem = packed record
    status: word;
    dPack: word;
    dPCR: dword;
    drift_src: dword;
    fo_src: dword;
    jitter_src: word;
    reserv: word;
    drift_001: dword;
    fo_001: dword;
    jitter_001: dword;
    accur_001 : dword;
    drift_user: dword;
    fo_user: dword;
    jitter_user: dword;
    accur_user : dword;
    scale: dword;
    debug: dword;
  end;

  PTPCRList = ^TPCRList;
  TPCRList = packed record
    leng: word;
    pid: word;
    time: dword;
    req_item: dword;
    next_item: dword;
    bitrate: dword;
    t_pcr: dword;
    packet_time: dword;
    Fsr: dword;
    k_drift: dword;
    k_fo: dword;
    k_jitter: dword;
    reserv1: dword;
    reserv2: dword;
{    arrstart: word;
    arrleng: word;
    arrcount: dword;
    i1: dword;
    leng1: dword;
    i2: dword;
    leng2: dword;  }
    arr: array[0..MAX_PCR_LIST_ITEM-1] of TPCRListItem;
  end;

  PTZFilter = ^TZFilter;
  TZFilter = record
    r_in1, r_in2, r_in3, r_in4, r_out1, r_out2, r_out3, r_out4: single;
    a1,a2,b0,b1,b2: single;
    polus4: boolean;
    start_time: dword; // время переходного процесса фильтра в числе итераций
  end;

  TJitterState = record
    mgf1atp: boolean;
    mgf1: boolean;
    mgf2: boolean;
    mgf3: boolean;
    mgf4: boolean;
    Fsr_user: string;
    graph_en: array[0..4]of boolean;
  end;

  TJitterWorkStatus = record
    time: TDateTime;
    wait_time: byte;
    wstatus: byte;
    pid: word;
    count: integer;  // число полученных отсчетов, где переходный процесс фильтров уже закончен, входящих в статистику
  end;

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ качество ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  PQoeSetIP = ^TQoeSetIP;
  TQoeSetIP = packed record
    ip_adr: dword;
    ip_mask: dword;
    ip_gateway: dword;
    ip_group: dword;
    udp_port: word;
    internal_port: word;
    flags: word;
    reserve: word;
  end;

  PQoeSetDecVideo = ^TQoeSetDecVideo;
  TQoeSetDecVideo = packed record
    pid: word;
    codec: word;
    height: word;
    width: word;
    auto_set: bytebool;
    reserve1 : byte;
    reserve2 : word;
  end;

  PQoeSetDecAudio = ^TQoeSetDecAudio;
  TQoeSetDecAudio = packed record
    pid: word;
    codec: word;
    f_discr: word;
    chanels: word;
    auto_set: bytebool;
    reserve1 : byte;
    reserve2 : word;
  end;

  PQoeSetAnalisVideo = ^TQoeSetAnalisVideo;
  TQoeSetAnalisVideo = packed record
 {   level_black: single;
    level_black_foul: single;
    level_ident: single;
    level_ident_foul: single;
    level_motion: single;
    time_stop_video: byte;
    mean_y_level: byte;
    num_black_frames: byte;
    black_pixel: byte;
    difference_pixel: byte;
    num_freeze_frames: byte;
    level_block: byte;
    level_block_foul: byte;
    num_block_frames: byte;
    block_size: byte;
    reserve: word;  }
  (*  black_level_warn: single;
    black_level_err: single;
    freeze_level_warn: single;
    freeze_level_err: single;
    diff_level_warn: single;
    video_loss: byte;
    luma_level_warn: byte;
    num_till_black: byte;
    black_pixel: byte;
    pixel_diff: byte;
    num_till_freeze: byte;
    block_level_warn: single;
    block_level_err: single;
    num_till_block: byte;
    reserve: byte;    *)
    vloss: single;
    black_cont: single;
    black_peak: single;
    black_cont_en: ByteBool;
    black_peak_en: ByteBool;
    luma_cont: single;
    luma_peak: single;
    luma_cont_en: ByteBool;
    luma_peak_en: ByteBool;
    black_time: single;
    black_pixel: dword;
    reserve1: dword;
    freeze_cont: single;
    freeze_peak: single;
    freeze_cont_en: ByteBool;
    freeze_peak_en: ByteBool;
    diff_cont: single;
    diff_peak: single;
    diff_cont_en: ByteBool;
    diff_peak_en: ByteBool;
    freeze_time: single;
    pixel_diff: word;
    reserve2: dword;
    block_cont: single;
    block_peak: single;
    block_cont_en: ByteBool;
    block_peak_en: ByteBool;
    block_time: single;
    block_size: dword;
    reserve3: dword;
  end;

  PQoeSetAnalisAudio = ^TQoeSetAnalisAudio;
  TQoeSetAnalisAudio = packed record
(*    level_over: single;
    level_over_foul: single;
    level_under: single;
    level_under_foul: single;
    time_stop_audio: byte;
    time_loudness: byte;
    time_silence: byte;
    snd_meas_type: byte;
    reserve2: dword;      *)
    aloss: single;
    silence_cont: single;
    silence_peak: single;
    silence_cont_en: ByteBool;
    silence_peak_en: ByteBool;
    silence_time: single;
    reserve1: dword;
    loudness_cont: single;
    loudness_peak: single;
    loudness_cont_en: ByteBool;
    loudness_peak_en: ByteBool;
    loudness_time: single;
    reserve2: dword;
  end;

  TQoePIDItem = packed record
    vid_pid: word;
    aud_pid: word;
    vid_codec: byte;
    aud_codec: byte;
  end;

  TQoeStringItem = packed record
    arr: array[0..25]of byte;
  end;

  PQoeProgramInfoIn = ^TQoeProgramInfoIn;
  TQoeProgramInfoIn = packed record
    cur_prog: byte;
    prog_num: byte;
    name: array[0..63]of TQoeStringItem;
    params: array[0..63]of TQoePIDItem;
  end;

  TDopusk = record
    norm_p, norm_m, foul_p, foul_m: double;
  end;

  TBoardInd = array[0..MAX_BA_NUM-1] of integer;
  TNames = array[0..MAX_BA_NUM-1] of string;
  TInSelect = array[0..MAX_BA_NUM-1] of byte;
  TBoardsType = array[0..MAX_BA_NUM-1] of byte;
  TBAtype = TInSelect;

  TQoE_vid_pid_params = packed record
    width: integer;
    height: integer;
    aspect_x: integer;
    aspect_y: integer;
    frame_rate: single;
  end;

  TQoE_aud_pid_param = packed record
    channels_num: integer;
    sample_rate: integer;
    bitrate: integer;
  end;

  TQoE_pid_params = packed record
    case integer of
    0:(vid_params: TQoE_vid_pid_params;); // 20
    1:(aud_params: TQoE_aud_pid_param;);  // 12
  end;

  TQoE_name = packed record
    case integer of
    0:(arr: array[0..25] of byte;); // 26
    1:(st: String[25];);
  end;

  TQoe_pid_info = packed record   //56
    wParam: dword;
    pid: word;
    typ: word; //  1-audio; 2-video; 3-data
    codec: word;
    codec_name: TQoE_name;        // 26
    pid_params: TQoE_pid_params;  // 20
  end;

  TQoE_prog_main = packed record  //62
//    wParam: dword;
    cur_index: dword;      // 4
    stream_ind: word;      // 2
    prog_name: TQoE_name;  // 26
    prov_name: TQoE_name;  // 26
//    prog_type: word;       // 2
    prog_id: word;       // 2
    pids_num: word;        // 2
  end;

  PQoE_prog_info = ^TQoE_prog_info;
  TQoE_prog_info = packed record
    main: TQoE_prog_main;                      // 62
    prog_pids: array[0..31]of TQoe_pid_info;   // 56*pids_num
  end;

  TQoeProgramMain = packed record   // 8
    wParam: dword;
//    wParam: word;
//    cur_index: word;
    stream_num: word;
    prog_num: word;
  end;

  PQoeProgramInfo = ^TQoeProgramInfo;
  TQoeProgramInfo = packed record
    main: TQoeProgramMain;
    prog_info: array[0..MAX_QOE_PROGS-1]of TQoE_prog_info;
  end;

  PQoeMultyProgramInfo = ^TQoeMultyProgramInfo;
  TQoeMultyProgramInfo = packed record
    list: TQoeProgramInfo;
    select: TQoeProgramInfo;
  end;

  PTimesRecordQoe = ^TTimesRecordQoe;
  TTimesRecordQoe = record
    refresh: boolean;
    video_state: integer;
    audio_state: integer;
    video_state_old: integer;
    audio_state_old: integer;
    no_sync: boolean;
    NoVideo: TDateTime;
    BlackFrame: TDateTime;
    FreezeFrame: TDateTime;
    Blochnost: TDateTime;
    BlackFrameWarning: TDateTime;
    FreezeFrameWarning: TDateTime;
    BlochnostWarning: TDateTime;
    NoAudio: TDateTime;
    UnderAudio: TDateTime;
    OverAudio: TDateTime;
    UnderAudioWarning: TDateTime;
    OverAudioWarning: TDateTime;
    LastStateTime: TDateTime;
    DeltaTime: TDateTime;
  end;

{  TQoeInfoProg = record
    actual: boolean;
    name: string;
  end;  }

  TQoeStateArr = array[0..6]of byte; // ind: 0 - v_loss; 1 - black; 2 - freeze; 3 - blochnoct
                                     // ind: 4 - a_loss; 5 - under; 6 - over
                                     // value: 0-зеленый; 1-желтый; 2-орнжевый; 3-красный

  TQoeStateProg = record
    actual: boolean;
    level_aud: integer;
    level_color: TColor;
    state: TQoeStateArr;
//    TimesRecordQoe: TTimesRecordQoe;
//    last_mess_video, last_mess_audio: boolean;
//    last_err_v, last_err_a: TErrorIn;
    pid_video: word;
    pid_audio: word;
  end;

  PQoeStateProgs = ^TQoeStateProgs;
  TQoeStateProgs = array[0..MAX_QOE_SELECT_PROG-1]of TQoeStateProg;

  TQoeSumState = record
    err_code: byte;
    active: boolean;
  end;

  PSumState = ^TSumState;
  TSumState = record
    video: array[1..7]of TQoeSumState;
    audio: array[1..5]of TQoeSumState;
  end;

  TQoeStateBA = record
    change_list: boolean;
    prog_count: integer;
//    TimesRecordQoeSum: TTimesRecordQoe;
//    state_prog: array of TQoeStateProg;
//    info_prog: array[0..MAX_QOE_PROGS-1]of TQoeInfoProg;
    name: array[0..MAX_QOE_SELECT_PROG-1]of string;

    change_state: boolean;
    state_prog: TQoeStateProgs;
    SumState: TSumState;
  end;

  PQoeState = ^TQoeState;
  TQoeState = record
    header_short: array[0..9]of string;
    header_long: array[0..9]of string;
    header: array[0..9]of string;
    StartWidth: array[0..9]of integer;
    QoeStateBA: array[0..MAX_BA_NUM-1]of TQoeStateBA;
  end;

  TQoeProgVar = record
    video_state: integer;
    audio_state: integer;
    video_state_old: integer;
    audio_state_old: integer;
    last_mess_video, last_mess_audio: boolean;
    last_err_v, last_err_a: TErrorIn;
    pid_video: word;
    pid_audio: word;
  end;

  TBA_link = array[0..MAX_TARGET-1]of integer;

//------------------------------------------------------------------------------
//^^^^^^^^^^^^^^^^^^^^ конфигурация ^^^^^^^^^^^^^^^^^^^^
//------------------------------------------------------------------------------

  TPreSetConfig = record
    conf: integer;
    inSel: TInSelect;
    name: string;
    hint: string;
  end;

  pPreSetConfigButtons = ^TPreSetConfigButtons;
  TPreSetConfigButtons = record
    button: array[0..NUM_BUTTON_PRESET_CONFIG-1]of TPreSetConfig; // 4 кнопки
  end;

  Tts_src_item = record
    opt_arr_ind: integer;
    id: byte;  // идентификатор источника потока
    typ: byte; // тип источника
               // 0 - вход БА
               // 1 - выход декодера T2-MI
               // 2 - выход приемника DVB-C/T/T2
               // 3 - выход входной платы TSoIP
    ba: byte;
    param1: byte;
    param2_: dword;
    param3: dword;
    param11_: single;
    param12: single;
  end;

  Tts_src_list = record
    count: integer;
    item: array[0..MAX_TS_SRC_ID_LIST-1]of Tts_src_item;
    hash: array[0..255]of byte;
  end;

  PProgFlashReport = ^TProgFlashReport;
  TProgFlashReport = packed record
    reslt: word;
    reserv: word;
    next_addr: dword;
    manuf_id: byte;
    device_id: byte;
    reserv2: word;
    all_leng: dword;
  end;

  PDebugArrByte = ^TDebugArrByte;
  TDebugArrByte = packed record
    type_access: word;
    port: word;
    start_addr: dword;
    leng: dword;
    arr: array[0..$1000000]of byte;
  end;

  PDebugArrWord = ^TDebugArrWord;
  TDebugArrWord = packed record
    type_access: word;
    port: word;
    start_addr: dword;
    leng: dword;
    arr: array[0..$1000000]of word;
  end;

  PDebugArrDWord = ^TDebugArrDWord;
  TDebugArrDWord = packed record
    type_access: word;
    port: word;
    start_addr: dword;
    leng: dword;
    arr: array[0..$1000000]of dword;
  end;

//******************************************************************************
// --------- обмен между потоками -----------------
//******************************************************************************

//^^^^^^^^^^^^^^^^^^^^ TConnectData ^^^^^^^^^^^^^^^^^^^^
  TRemote = array[0..MAX_BA_NUM-1] of boolean;

  TConnectData = record
    change_in: boolean;                        // изменились входные параметры
    Host: string[200];                              // адрес соединения
    Port: string[200];                              // порт соединения
    active: boolean;                           // установка соединения
    active_req: boolean;                       // запрос на установку соединения, нужно, чтобы поток не пропустил сброс-установку соединения при изменении параметров

    change_remote: boolean;
    remote: TRemote;                            // дистанционный мониторинг

    change_out: boolean;                       // изменилось состояние
    state: integer;
//    active: boolean;
    data_led_color: TColor;                    // постоянный цвет светодиода "данные"
    atp_led_color: TColor;                     // постоянный цвет светодиода "АТП"
    statuspanel_color: TColor;                 // цвет панели статуса соединения
    statuspanel_text: string;                  // текст панели статуса соединения
//    statuspanel_hint: string;                  // подсказка панели статуса соединения
    button_text: string;                       // название кнопки "Установить соединение"
  end;

//^^^^^^^^^^^^^^^^^^^^ TLogData ^^^^^^^^^^^^^^^^^^^^
  TLogData = record
    change_in: boolean;                        // изменились входные параметры
    log_enable: boolean;
    log_com_enable: boolean;
    log_com_dev_opt_en: boolean;
    log_com_status_err_en: boolean;
    log_com_struct_en: boolean;
    log_com_speed_en: boolean;
    log_opt_dvb_t2_en: boolean;
    log_stream_list_en: boolean;
    log_tcp_debug_en: boolean;
    log_device_error_en: boolean;
    log_emul_err_en: boolean;
    log_emul_err_cod: byte;
    log_emul_err_ext: byte;
    log_get_list_ts: boolean;
    g420_loop_emul: boolean;
    emulQoe: boolean;
    emulQoe_b0_type:byte;
    emulQoe_b1_type:byte;
    disable_gen_qoe_err: boolean;
    status_err_id_log_mpeg_en: boolean;
    status_err_id_log_qoe_en: boolean;
    log_mode_en: boolean;
    show_board_info: boolean;
    log_ats_pers_en: boolean;
    log_ats_pers_mess: word;
    log_ats_prog_info_en: boolean;
    gen_struct_ba1: boolean;
    gen_struct_ba2: boolean;
    gen_struct_ba3: boolean;
    log_del_ts_en: boolean;
    no_reset_ba: boolean; // не сбрасывать блок анализа при изменении настроек входной опции
  end;

//^^^^^^^^^^^^^^^^^^^^ TPassData ^^^^^^^^^^^^^^^^^^^^
  TPassData = record
    change_in: boolean;                        // изменились входные параметры
    atpPass: TPass_uni;
  end;

//^^^^^^^^^^^^^^^^^^^^ TDeviceData ^^^^^^^^^^^^^^^^^^^^
  tArrParam = record
    send_id_set: byte;
    send_id_status: byte;
    arr_ind_init: byte;
    arr_ind_set: byte;
    arr_ind_status: byte;
    arr_count_init: byte;
    arr_count_set: byte;
    arr_count_status: byte;
    ts_src_id: byte;     // первый идентификатор источника потока, используется в платах при преобразовании формата 188 в 192, входит в multy_id
    ts_src_count: byte;  // число идентификаторов источника потока. Если 0, то src_id не актуально. Если >1 то источники нумеруются подряд, как src_id+i, где i=[0..src_count-1]
  end;

  TBAData = record
    b_type: byte;                        // тип блока анализа; 1 - анализ ТП, 2 - анализ качества
    b_ver: byte;
    targ: word;                          // targ=target-1, идентификатор блока анализа, соответствующий разъему SPI, к которому он подключен. targ=0..3 => SPI1..SPI4
    ts_src_id_asi: byte;                 // код источника потока - входа БА
    ts_src_id_t2mi: byte;                // код источника потока - выхода декодера T2-MI
    OptInInd: array[0..MAX_BOARD_IN_CON-1]of integer;     // индекс опции в массиве inOptArr модуля options.pas
    OptInParam: array[0..MAX_BOARD_IN_CON-1]of TArrParam;

//    OptInSendId: array[0..MAX_BOARD_IN_CON-1]of byte;     // идентификатор опции, используемый при отправке массивов в прибор (в протоколе верхнего уровня называется Board_Opt_Num)
//    OptInArrInd: array[0..MAX_BOARD_IN_CON-1]of integer;  // индекс массивов управления и статуса в массивах BD.OptControlArr и BD.OptStatusArr

    OptOutInd: array[0..MAX_BOARD_OUT_CON-1]of integer;    // индекс опции в массиве outOptArr модуля options.pas
    OptOutParam: array[0..MAX_BOARD_OUT_CON-1]of TArrParam;
    OptOutNextBA: boolean;
    OptOutNextBA2: boolean;

//    OptOutSendId: array[0..MAX_BOARD_OUT_CON-1]of byte;    // идентификатор опции, используемый при отправке массивов в прибор (в протоколе верхнего уровня называется Board_Opt_Num)
//    OptOutArrInd: array[0..MAX_BOARD_OUT_CON-1]of integer; // индекс массивов управления и статуса в массивах BD.OptControlArr и BD.OptStatusArr

    link: boolean;                       // наличие связи с нижним блоком анализа
  end;
  TBADatas = array[0..MAX_BA_NUM-1] of TBAData;

  POptArrData = ^TOptArrData;
  TOptArrData = record
    brd_ind: integer;     // индекс блока анализа brd_ind=0..3 => BA1..BA4
    con_ind: integer;     // номер соединителя блока анализа, к которому подключена опция, 0..3 для входной, 0..1 для выходной
    opt_ind: integer;     // индекс опции в массиве inOptArr или outOptArr модуля options.pas
    OptType: word;
    send_id: byte;        // идентификатор опции, используемый при отправке массивов в прибор (в протоколе верхнего уровня называется Board_Opt_Num)
    ret_type: byte;       // тип, который возвращает сама опция
    ret_ver: byte;        // версия, которую возвращает сама опция
    isInOpt: boolean;     // true - входная опция, false - выходная опция
    pair_opt_arr_ind: byte; // парный индекс массива(для контрола - статус и наоборот)
    arr_count: byte;      // число массивов для платы
    arrofs: byte;
//    ts_src_id: byte;     // первый идентификатор источника потока, используется в платах при преобразовании формата 188 в 192, входит в multy_id
//    ts_src_count: byte;  // число идентификаторов источника потока. Если 0, то src_id не актуально. Если >1 то источники нумеруются подряд, как src_id+i, где i=[0..src_count-1]
    // информация о входах (что подключено на соответствующий вход
    in_con: TInOptCon;  // bit[7..3] - номер платы, bit[2..0] - номер выхода; $ff - вход не подключен; $fe - вход выходит наружу
    // информация о выходах (что подключено на соответствующий выход
    out_con: TOutOptCon; // bit[7..3] - номер платы, bit[2..0] - номер входа; $ff - выход не подключен; $fe - выход выходит наружу
  end;
  TOptArrDatas = array[0..MAX_OPT_ARR-1] of TOptArrData;

  TDeviceData = record
    change_out: boolean;                       // изменилось состояние
//    DeviceInfo: TDeviceInfo;
    FactoryNum_txt: string;
    FactoryNum_hint: string;
    BoardCount: integer;
    factory_num: word;
    DeviceType: word;
    DeviceVersion: word;
    BADatas: TBADatas;
    OptArrDatasSet: TOptArrDatas;
    OptArrDatasStatus: TOptArrDatas;
  end;

//^^^^^^^^^^^^^^^^^^^^ TOptionsArrData (OptControl, optStatus)^^^^^^^^^^^^^^^^^^^^
  POptionsArrItem = ^TOptionsArrItem;
  TOptionsArrItem = record
    index: integer;
    optArr: pointer;
    next: POptionsArrItem;
  end;

  POptionsArrData = ^TOptionsArrData;
  TOptionsArrData = record
    not_empty: boolean;
    FirstItem: POptionsArrItem;
    LastItem: POptionsArrItem;
  end;

//^^^^^^^^^^^^^^^^^^^^ TModeData ^^^^^^^^^^^^^^^^^^^^
  TModeData = record
    change_in: boolean;                       // изменилось состояние
    Mode: TMode;
  end;

//^^^^^^^^^^^^^^^^^^^^ TCommandData ^^^^^^^^^^^^^^^^^^^^
  PCommandItem = ^TCommandItem;
  TCommandItem = record
    leng: integer;
    mess: PMessOutLong;
    next: PCommandItem;
  end;

  TCommandData = record
    not_empty: boolean;
    FirstItem: PCommandItem;
    LastItem: PCommandItem;
//    count_in, count_out: integer;
  end;

//^^^^^^^^^^^^^^^^^^^^ TTextData ^^^^^^^^^^^^^^^^^^^^
  PTextItem = ^TTextItem;
  TTextItem = record
    leng: integer;
    win: integer;
    txt: pArrByte;
    next: PTextItem;
  end;

  TTextData = record
    not_empty: boolean;
    FirstItem: PTextItem;
    LastItem: PTextItem;
  end;

//^^^^^^^^^^^^^^^^^^^^ TStatusData ^^^^^^^^^^^^^^^^^^^^

  TStatusBA = record
    autoStruct: boolean;
    autoT2miStruct: boolean;
    ReqMpegStruct: boolean;    // запрос на получение новой структуры Mpeg
    ReqT2miStruct: boolean;    // запрос на получение новой структуры T2MIInfo

    change_out: boolean;                   // изменилось состояние
    full_status: boolean;         // корректный статус, если нет, меняем только светодиоды
    LoadGauge: TVisualGauge;
    mode: TMode;
    no_sync: boolean;
//    status: TStatus;

    SyncLEDColor: TColor;
    T2miLEDColor: TColor;
    t2mi_on: boolean;
    mpeg_struct_change: boolean;           // изменилась структура MPEG
    isAllStruct: boolean;                  // есть полная стуктура (сбрасывается при координальных изменениях потока)
    t2mi_struct_change: boolean;           // изменилась структура T2-MI
    isAllT2miStruct: boolean;
    leng_pack: byte;
    BitRate: dword;
    BitRateSt: string;
    ts_num_st: string;
    prog_num_st: string;
    no_sync_t2mi: boolean;
    jitter_multy_id: dword;
    jitter_pid: word;

    ipLEDColor: TColor;
    tsLEDColor: TColor;
    VideoLEDColor: TColor;
    AudioLEDColor: TColor;
    AudioMinGauge: TVisualGauge;
    AudioMaxGauge: TVisualGauge;
    qoeFlags: word;
  end;

  TStatusData = record
    change_out: boolean;                       // изменилось состояние (не относится к StatusBA)
    Connect_Count: integer;
    Atp_Connect_Count: integer;
    Exlusive_Status: byte;
    control_ip: dword;
    StatusBA: array[0..MAX_BA_NUM-1] of TStatusBA;
  end;

//^^^^^^^^^^^^^^^^^^^^ TTimeRecordData ^^^^^^^^^^^^^^^^^^^^
{  TTimeRecordBA = record
    clear: boolean;     // установка флага в основном потоке, приводит к очистке TimesRecord в потоке АТП
                        // одновременно очищает TimesRecord из QoE
    mpeg: TTimesRecord;

  end;

  TTimeRecordData = array[0..MAX_BA_NUM-1] of TTimeRecordBA;   }

//^^^^^^^^^^^^^^^^^^^^ TErrorsData ^^^^^^^^^^^^^^^^^^^^

  PSyncMpegBA = ^TSyncMpegBA;
  TSyncMpegBA = record
//    change_out: boolean;                       // изменилось состояние (не относится к StatusBA)
    no_sync: boolean;
    no_sync_t2mi: boolean;
    mode: TMode;
    time_old: TDateTime;
    time_new: TDateTime;
    ts_count: byte;
    version_stream_list: byte;
    multy_id: array[0..MAX_STREAMS_OF_BA-1]of dword;
    no_stream: array[0..3]of dword;   //
    analise_off: array[0..3]of dword; //
  end;

  PErrorItem = ^TErrorItem;
  TErrorItem = record
    multy_id: dword;
    time: TDateTime;
    err: TErrorIn;
    next: PErrorItem;
  end;

  PErrorBA = ^TErrorBA;
  TErrorBA = record
    not_empty: boolean;
    FirstItem: PErrorItem;
    LastItem: PErrorItem;
    SyncBA: TSyncMpegBA;
  end;

//  PErrorsData = ^TErrorsData;
  TErrorsData = array[0..MAX_BA_NUM-1] of TErrorBA;

//^^^^^^^^^^^^^^^^^^^^ TStructMpegData ^^^^^^^^^^^^^^^^^^^^
  TStructMpegBA = record
    change_out: boolean;                   // изменилось состояние
    StreamCount: integer;
    Streams: pointer;
    Time: TDateTime;
  end;

  TStructMpegData = array[0..MAX_BA_NUM-1] of TStructMpegBA;

//^^^^^^^^^^^^^^^^^^^^ TSpeedData ^^^^^^^^^^^^^^^^^^^^
  TSpeedPIDItem = record
    pid: word;
    br: double;
  end;

  PSpeedPIDList = ^TSpeedPIDList;
  TSpeedPIDList = array[0..$1fff]of TSpeedPIDItem;

  TSpeedTableItem = record
    info: TTableInfo;
    br: double;
  end;

  PSpeedTableList = ^TSpeedTableList;
  TSpeedTableList = array[0..$1fff]of TSpeedTableItem;

  PSpeedItem = ^TSpeedItem;
  TSpeedItem = record
    multy_id: dword;
    pid_count: word;
    table_count: word;
    PidList: PSpeedPIDList;
    TableList: PSpeedTableList;
    next: PSpeedItem;
  end;

  TSpeedDataBA = record
    not_empty: boolean;
    FirstItem: PSpeedItem;
    LastItem: PSpeedItem;
  end;

  TSpeedData = array[0..MAX_BA_NUM-1] of TSpeedDataBA;

//^^^^^^^^^^^^^^^^^^^^ TTableDumpReqData (запрос) ^^^^^^^^^^^^^^^^^^^^

  PTableDumpReqItem = ^TTableDumpReqItem;
  TTableDumpReqItem = record
    info: TTableInfo;
    multy_id: dword;
    leng: word;
    sect: byte;
    next: PTableDumpReqItem;
  end;

  TTableDumpReqBA = record
    not_empty: boolean;
    FirstItem: PTableDumpReqItem;
    LastItem: PTableDumpReqItem;
  end;

  TTableDumpReqData = array[0..MAX_BA_NUM-1] of TTableDumpReqBA;

//^^^^^^^^^^^^^^^^^^^^ TTableDumpData (ответ) ^^^^^^^^^^^^^^^^^^^^

  PTableDumpItem = ^TTableDumpItem;
  TTableDumpItem = record
    info: TTableInfo;
    multy_id: dword;
    sect: byte;
    Section: PSection;
    next: PTableDumpItem;
  end;

  TTableDumpBA = record
    not_empty: boolean;
    FirstItem: PTableDumpItem;
    LastItem: PTableDumpItem;
  end;

  TTableDumpData = array[0..MAX_BA_NUM-1] of TTableDumpBA;

//^^^^^^^^^^^^^^^^^^^^ TJitterData ^^^^^^^^^^^^^^^^^^^^

  PJitterItem = ^TJitterItem;
  TJitterItem = record
    PCRList: PTPCRList;
    next: PJitterItem;
  end;

  TJitterBA = record
    change_in: boolean;                        // изменились входные параметры
    jitterOn: boolean;
    next_jitter_item: dword;
    not_empty: boolean;
    FirstItem: PJitterItem;
    LastItem: PJitterItem;
  end;

  TJitterData = array[0..MAX_BA_NUM-1] of TJitterBA;

//^^^^^^^^^^^^^^^^^^^^ TAnalisStateData ^^^^^^^^^^^^^^^^^^^^

  TAnalisStateBA = record
    change_out: boolean;                   // изменилось состояние
    PanelTxt: string;
    PanelColor: TColor;
    status_ok: boolean;
    state: byte;
  end;

  TAnalisStateData = array[0..MAX_BA_NUM-1] of TAnalisStateBA;

//^^^^^^^^^^^^^^^^^^^^ TT2MIInfoData ^^^^^^^^^^^^^^^^^^^^

  PT2MIInfoItem = ^TT2MIInfoItem;
  TT2MIInfoItem = record
    length: integer;
    time: TDateTime;
    data: pT2MIInfo;
    next: PT2MIInfoItem;
  end;

  TT2MIInfoBA = record
    not_empty: boolean;
    FirstItem: PT2MIInfoItem;
    LastItem: PT2MIInfoItem;
  end;

  TT2MIInfoData = array[0..MAX_BA_NUM-1] of TT2MIInfoBA;
//^^^^^^^^^^^^^^^^^^^^ TT2miFrameSeqData ^^^^^^^^^^^^^^^^^^^^
  TT2miFrameSeqBA = record
    change_out: boolean;                   // изменилось состояние
    count: integer;
    seq: pT2MI_frames_seq;
  end;

  TT2miFrameSeqData = array[0..MAX_BA_NUM-1] of TT2miFrameSeqBA;
//^^^^^^^^^^^^^^^^^^^^ TQoeSetData ^^^^^^^^^^^^^^^^^^^^
  TQoeSetBA = record
    QoeSetIP: TQoeSetIP;
    QoeSetIP_change: boolean;
    QoeSetDecVideo: TQoeSetDecVideo;
    QoeSetDecVideo_change: boolean;
    QoeSetDecAudio: TQoeSetDecAudio;
    QoeSetDecAudio_change: boolean;
    QoeSetAnalisVideo: TQoeSetAnalisVideo;
    QoeSetAnalisVideo_change: boolean;
    QoeSetAnalisAudio: TQoeSetAnalisAudio;
    QoeSetAnalisAudio_change: boolean;
    QoeSetProgInfo: TQoeMultyProgramInfo;
    QoeSetProgInfo_change: boolean;
  end;

  TQoeSetData = array[0..MAX_BA_NUM-1] of TQoeSetBA;

//^^^^^^^^^^^^^^^^^^^^ TQoeStateData ^^^^^^^^^^^^^^^^^^^^
  TQoeProgInfo = record
    change_in: boolean;
    info: TQoeProgramInfo;
  end;

  TQoeStateData = record
    QoeProgInfo: TQoeProgInfo;
    QoeStateBA: TQoeStateBA;
  end;

  TQoeStateDatas = array[0..MAX_BA_NUM-1]of TQoeStateData;

//      qoe_prog_num: integer;
//    qoe_state: PQoeStateProgs;
//^^^^^^^^^^^^^^^^^^^^ TG420ProgData ^^^^^^^^^^^^^^^^^^^^
  TG420StructSD = record
    curpos: dword;             // для DSP текущий адрес, для SD текущий номер блока, относительно начала файла, при старте = 0
    finish: boolean;
    block_count_one: integer;  // число блоков для одной SD, при отправке каждого блока уменьшается на 1
    send_block_count: integer; // число блоков, отправленных без ожидания ответа. при каждой отправке увеличивается, при каждом ответе уменьшается
    next_recv_start_address: dword; // ожидаемое поле start_address в принимаемом ответе
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
    dest_device: byte;
    device_param: byte;
    reserve1: word;
    start_address: dword;
    prog_status: byte;
    reserve2: array[9..15]of byte;
  end;

  PG420ProgReceiveItem = ^TG420ProgReceiveItem;
  TG420ProgReceiveItem = record
    mess: PG420ReceiveMess;
    next: PG420ProgReceiveItem;
  end;

  PG420ProgData = ^TG420ProgData;
  TG420ProgData = record
    not_empty: boolean;
    FirstItem: PG420ProgReceiveItem;
    LastItem: PG420ProgReceiveItem;
  end;

//  TG420Prog = array[0..MAX_BA_NUM-1] of TErrorBA;

//^^^^^^^^^^^^^^^^^^^^ TDumpOldControlData ^^^^^^^^^^^^^^^^^^^^
  TDumpOldControlData = record
    req: boolean; // запрос на дамп (обрабатывается в потоке atp, копируется имя файла, устанавливается wait, сбрасывается req, отправляется запрос в БА)
    target: byte; //
    wait: boolean; // ожидание захвата дампа (если дамп придет от прибора то сохранится и флаг сбросится, при сброшенном флаге дамп игнорируется)
    save_ok: boolean;
    save_status: integer;
    req_filename: string; // имя файла для сохранения дампа, устанавливается в основном потоке
    filename: string; // имя файла для сохранения дампа, копируется из req_filename, используется только в потоке atp
  end;

//^^^^^^^^^^^^^^^^^^^^ TDumpOldControlData ^^^^^^^^^^^^^^^^^^^^
  TProgBA = record
    req: boolean; // запрос на программирование прошивки (обрабатывается в потоке atp, копируется имя файла, устанавливается wait, сбрасывается req)
    req_ba: byte; // блок анализа, устанавливается в основном потоке
    ba: byte;     // блок анализа, копируется из req_ba, используется только в потоке atp
    state: byte;  // 0-выключено; 1-идет работа; 2-завершено успешно; >=3-завершено с ошибкой (3-плата не поддерживает запись; 4-Файл не найден; 5-Файл слишком большой; )
    err_code: word;
    err_mess_count: integer;
    progress: byte; // проценты 0-100
    req_filename: string; // имя файла прошивки, устанавливается в основном потоке
    filename: string; // имя файла прошивки, копируется из req_filename, используется только в потоке atp
    start_time: TDateTime;
  end;

//******************************************************************************

implementation


end.




