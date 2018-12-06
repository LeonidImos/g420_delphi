unit main_control;

interface

uses
  const_type, MySockets,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, IniFiles, Buttons;

type
  TSignal = record
    name: string;
    sig_id: dword;
    sig_id_num: dword;
    sig_id_type: integer;
    list_ind: integer;
  end;

  TListSignal = record
    title: string;
    count: integer;
    index: integer;
  end;

  TPage = record
    cur_ind: integer;
    list_ind: integer;
    list: array of TSignal;
  end;

  TControlForm = class(TForm)
    Panel1: TPanel;
    ConnectEdit: TEdit;
    ConnectButton: TButton;
    ConnectStatusPanel: TPanel;
    TabControl1: TTabControl;
    Panel2: TPanel;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    g420_bitrateOutEdit: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ConnectButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
    CurDir, IniFileName, SigListFileName: string;
    MyClientSocket: TMyClientSocket;
    factory_num: word;
    ver_device: word;
    ConnectState: integer;
    wath_dog: integer;
    SendDeviceInfoTime: TDateTime; // время следующей посылки запроса DeviceInfo
    SendStatusTime: TDateTime;     // время следующей посылки запроса Status
    SendDeviceError: TDateTime;    // время следующей посылки запроса DeviceError
    ArrIn: TarrTCP;
    ArrInPos: integer;
    mess: TMessOut;
    sig_info: array of TPage;
    old_page: integer;
    IdleSleepTime: TDateTime;
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);
    function EventConnect(CurTime: TDateTime): boolean;
    function EventSendTimer(CurTime: TDateTime): boolean;
    function EventSocketRead: boolean;
    function FindFirst(i1,i2:integer):integer;
    function GetLengMess(p:integer):integer;
    procedure GetMess(p,leng_mess:integer; const ArrIn: TarrTCP);
    function SendCommand(target_id,comand,count: word; P_param: PArrWord):boolean;
    function SendCommandSys(target_id,comand:word): boolean;
    function SendCommandSysParam(target_id,comand,param:word): boolean;
    procedure ReceiveDeviceInfo(p,leng:integer; const ArrIn: TarrTCP);
    procedure ReceiveSysError(p,leng:integer; const ArrIn: TarrTCP);
//    procedure ReceiveProgArrStatus(p,leng:integer; const ArrIn: TarrTCP);
    procedure ReceiveStatus(p:integer; const ArrIn: TarrTCP);
    function CurTimeFine: string;
    procedure EnCrypt16(pass: string; var arr: tPassword);
    function DeCrypt16(arr: tPassword): string;
    procedure LoadSignal;
    procedure ShowPage;
    procedure LoadParamFromFile;
    procedure SaveParamToFile;
  public
    { Public declarations }
  end;

var
  ControlForm: TControlForm;

implementation

{$R *.dfm}
//******************************************************************************
procedure TControlForm.FormCreate(Sender: TObject);
begin
  CurDir:=GetCurrentDir;
  SigListFileName:=CurDir+'\g420control.listsignal';
  IniFileName:=CurDir+'\g420control.ini';
  MyClientSocket:=TMyClientSocket.Create(nil);
  IdleSleepTime:=now+100/(24*3600*1000); // 100 ms
  SendDeviceInfoTime:=IdleSleepTime;
  SendStatusTime:=IdleSleepTime;
  SendDeviceError:=IdleSleepTime;
  LoadSignal;
  LoadParamFromFile;
  Application.OnIdle:=ApplicationIdle;

end;
//------------------------------------------------------------------------------
procedure TControlForm.FormDestroy(Sender: TObject);
begin
  SaveParamToFile;
  MyClientSocket.Destroy;
end;

//------------------------------------------------------------------------------
procedure TControlForm.ApplicationIdle(Sender: TObject; var Done: Boolean);
var exec: boolean;
CurTime: TDateTime;
begin
  done:=false;
  exec:=false;
  CurTime:=now;

  if EventConnect(CurTime) then exec:=true;
  if EventSocketRead then exec:=true;
//  g420_TestTime(CurTime);

//  if G420FileStruct.state<>1 then
//  begin
    if EventSendTimer(CurTime) then exec:=true;
//    if EventTestFiles(CurTime) then exec:=true;

    if exec then IdleSleepTime:=CurTime+100/(24*3600*1000)
    else if CurTime>IdleSleepTime then
    begin
      done:=true;
    end;
//  end;
end;
//------------------------------------------------------------------------------
function TControlForm.EventConnect(CurTime: TDateTime): boolean;
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

{  g420_dsp11Button.Enabled:=(new_state=3);
  g420_dsp12Button.Enabled:=(new_state=3);
  g420_dsp21Button.Enabled:=(new_state=3);
  g420_sd1Button.Enabled:=(new_state=3);
  g420_startButton.Enabled:=(new_state=3);
  g420_stopButton.Enabled:=(new_state=3);
  ListProgButton.Enabled:=(new_state=3);  }

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
    SpeedButton1.Enabled:=ConnectState=3;
  end;
end;
//------------------------------------------------------------------------------
function TControlForm.EventSendTimer(CurTime: TDateTime): boolean;
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
{  if (MyClientSocket.Connected)and(factory_num>0)and(CurTime>SendDeviceError) then
  begin
    SendDeviceError:=CurTime+2/(24*3600); // 2 s
    SendCommandSys(1, Comand_Get_Device_Errors);
    if wath_dog>0 then dec(wath_dog) else
    begin
      ConnectButton.Tag:=0;
      ConnectButton.Caption:='Установить соединение';
    end;
  end;     }


end;
//------------------------------------------------------------------------------
function TControlForm.EventSocketRead: boolean;
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
//    Memo1.Lines.Add(st);
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
function TControlForm.FindFirst(i1,i2:integer):integer;
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
function TControlForm.GetLengMess(p:integer):integer;
var header: PEthHeader;
begin
  header:=@ArrIn[p];
  result:=header.Length;
end;
//------------------------------------------------------------------------------
procedure TControlForm.GetMess(p,leng_mess:integer; const ArrIn: TarrTCP);
var header: PEthHeader;
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
//           Mess_Data: ReceivePersBuf(p,header.Length,ArrIn);
//           Mess_SysMegaBuffer: ReceiveSysMegaBuf(p,ArrIn);
//           Mess_Opt_Control: ReceiveOptControl(p,header.Length,ArrIn);
//           Mess_Opt_Status: ReceiveOptStatus(p,header.Length,ArrIn);
//           Mess_Prog_Arr_Status: ReceiveProgArrStatus(p,header.Length,ArrIn);
//           Mess_Run_Self_Test: ReceiveSelfTest(p,ArrIn);
//           else Memo1.Lines.Add('неизвестная команда = '+Strg(fHex,header.Command,4)+', target = '+IntToStr(header.Target_ID));
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
//              else Memo1.Lines.Add('неизвестная команда = '+Strg(fHex,header.Command,4)+', target = '+IntToStr(header.Target_ID));
            end;
          end;
  end;
//  if b_d.Log.log_com_enable then LogRecvCommand(header, @ArrIn[p+16]);

//  Time1:=0;
end;
//------------------------------------------------------------------------------
function TControlForm.SendCommand(target_id,comand,count: word; P_param: PArrWord):boolean;
var i, leng: integer;
g420: TG420ReceivePack;
g420Send: PG420Send;
//item: PCommandItem;
begin
  result:=false;

{  if (G420loopChB.Checked)and(comand=Comand_g420_ProgArr) then
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
  end;      }

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
function TControlForm.SendCommandSys(target_id,comand:word): boolean;
begin
  result:=SendCommand(target_id,comand,0,nil);
end;
//------------------------------------------------------------------------------
function TControlForm.SendCommandSysParam(target_id,comand,param:word): boolean;
begin
  result:=SendCommand(target_id,comand,1,@param);
end;
//------------------------------------------------------------------------------

procedure TControlForm.ReceiveDeviceInfo(p,leng:integer; const ArrIn: TarrTCP);
var
device_info: PDeviceInfo;
device_info_v3: PDeviceInfo_v3;
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

end;
//------------------------------------------------------------------------------
procedure TControlForm.ReceiveSysError(p,leng:integer; const ArrIn: TarrTCP);
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
//  Memo1.Lines.Add('----------------------------------------------');
//  Memo1.Lines.Add(TimeToStr(Now));
//  Memo1.Lines.Add('Total_Counts = '+IntToStr(SysErrors.Total_Counts));
  {for i:=0 to cError_Max_Num-1 do
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
    end;     }
end;
//------------------------------------------------------------------------------
procedure TControlForm.ReceiveStatus(p:integer; const ArrIn: TarrTCP);
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

//  if (DeviceErrorChB.Checked)and(Errors_Count <> 0) then
//    SendCommandSys(0,Comand_Get_Device_Errors);
end;
//------------------------------------------------------------------------------
procedure TControlForm.CheckBox1Click(Sender: TObject);
begin
  g420_bitrateOutEdit.Enabled:=CheckBox1.Checked;
{  if CheckBox1.Checked then
    SpeedButton1.Caption:='Выбрать сигнал и изменить битрейт'
  else SpeedButton1.Caption:='Выбрать сигнал '  }
end;
//------------------------------------------------------------------------------

procedure TControlForm.ConnectButtonClick(Sender: TObject);
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

function TControlForm.CurTimeFine: string;
var dt: TDateTime;
begin
  dt:=Now;
  result:=DateTimeToStr(dt);
  dt:=frac(dt*(24*60*60));
  result:=result+Copy(FloatToStrF(dt,ffFixed,5,3),2,4);
end;
//------------------------------------------------------------------------------

procedure TControlForm.EnCrypt16(pass: string; var arr: tPassword);
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
function TControlForm.DeCrypt16(arr: tPassword): string;
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
procedure TControlForm.LoadSignal;
var
signals: array of TSignal;
lists: array[0..15] of TListSignal;
linds: array[0..15] of integer;
sig_count, list_count, page_count, si, li, pi, sind, lind, pind: integer;
ini: TIniFile;
sect, st: string;
sig_id_num: dword;
sig_id_type: integer;
begin
  if not FileExists(SigListFileName) then
  begin
    st:=Copy(SigListFileName, length(ExtractFilePath(SigListFileName))+1, 255);
    ShowMessage('Не найден файл "'+st+'"');
  end;

  ini:=TIniFile.Create(SigListFileName);
  sig_count:=ini.ReadInteger('main', 'signal_count', 0);
  list_count:=ini.ReadInteger('main', 'list_count', 0);
  SetLength(signals, sig_count);

  for li:=0 to 15 do
  begin
    lists[li].title:='List_'+IntToStr(li);
    lists[li].count:=0;
    lists[li].index:=li;
  end;

  for li:=0 to list_count-1 do
  begin
    lists[li].title:=ini.ReadString('main', 'list_'+IntToStr(li), 'List_'+IntToStr(li));
    lists[li].count:=0;
    lists[li].index:=li;
  end;

  for si:=0 to sig_count-1 do
  begin
    sect:='signal_'+IntToStr(si);
    signals[si].name:=ini.ReadString(sect, 'name', sect);
    sig_id_num:=ini.ReadInteger(sect, 'sig_id_num', 0);
    sig_id_type:=ini.ReadInteger(sect, 'sig_id_type', 0)and $0f;
    lind:=ini.ReadInteger(sect, 'list_ind', 0)and $0f;

    signals[si].sig_id_num:=sig_id_num;
    signals[si].sig_id_type:=sig_id_type;
    signals[si].list_ind:=lind;
    signals[si].sig_id:=sig_id_num + (sig_id_type shl 28){ + (lind shl 24)};
    if sig_id_num>0 then
    begin
      inc(lists[lind].count);
    end;
  end;

  ini.Destroy;

  pind:=0;
  for li:=0 to 15 do
  begin
    if lists[li].count>0 then
    begin
      TabControl1.Tabs.Add(lists[li].title);
      linds[pind]:=li;
      lists[li].index:=pind;
      inc(pind);
    end;
  end;

  page_count:=TabControl1.Tabs.Count;
  SetLength(sig_info, page_count);
  for pi:=0 to page_count-1 do
  begin
    lind:=linds[pi];
    SetLength(sig_info[pi].list, lists[lind].count);
    sig_info[pi].cur_ind:=0;
    sig_info[pi].list_ind:=lind;
  end;

  for si:=0 to sig_count-1 do
  begin
    if signals[si].sig_id_num>0 then
    begin
      lind:=signals[si].list_ind;
      pind:=lists[lind].index;
      sind:=sig_info[pind].cur_ind;
      if sind<length(sig_info[pind].list) then
      begin
     {   sig_info[pind].list[sind].name:=signals[si].name;
        sig_info[pind].list[sind].sig_id:=signals[si].sig_id;
        sig_info[pind].list[sind].sig_id_num:=signals[si].sig_id_num;
        sig_info[pind].list[sind].sig_id_type:=signals[si].sig_id_type;}
        sig_info[pind].list[sind]:=signals[si];
        sig_info[pind].cur_ind:=sind+1;
      end;
    end;
  end;
  for pi:=0 to page_count-1 do sig_info[pi].cur_ind:=0;

  old_page:=-1;
  ShowPage;
end;
//------------------------------------------------------------------------------
procedure TControlForm.ShowPage;
var pind, {sind, }page_count, sig_count, i, cur_ind: integer;
begin
  pind:=TabControl1.TabIndex;
  page_count:=length(sig_info);
  if page_count>TabControl1.Tabs.Count then page_count:=TabControl1.Tabs.Count;

  if (pind<0)or(pind>=page_count) then exit;
  if pind=old_page then exit;

  if (old_page>=0)and(old_page<page_count) then
    sig_info[old_page].cur_ind:=ListBox1.ItemIndex;

  ListBox1.Clear;
  sig_count:=length(sig_info[pind].list);
  for i:=0 to sig_count-1 do
    ListBox1.Items.Add(sig_info[pind].list[i].name);

  cur_ind:=sig_info[pind].cur_ind;
  if (cur_ind>=0)and(cur_ind<sig_count) then
    ListBox1.ItemIndex:=cur_ind;

  old_page:=pind;
end;
//------------------------------------------------------------------------------
procedure TControlForm.SpeedButton1Click(Sender: TObject);
var mess: TG420PlayMess;
{comm,}// mode, sd_on, group: byte;
{start_addr, bitrate,} bitrateout,{ ostat, }i, bi, err: integer;
{ind, leng,} sig_type: integer;
{FileName: string;
fl: file;
size: int64;
leng_one, block_count_one: int64; }
name: AnsiString;
pind, sind, page_count, sig_count: integer;
begin
  if not CheckBox1.Checked then bitrateout:=0
  else
  begin
    val(g420_bitrateOutEdit.Text, bitrateout, err);
    if err<>0 then bitrateout:=0;
    if bitrateout<0 then bitrateout:=0;
  end;


  pind:=TabControl1.TabIndex;
  page_count:=length(sig_info);
  if page_count>TabControl1.Tabs.Count then page_count:=TabControl1.Tabs.Count;

  if (pind<0)or(pind>=page_count) then exit;
  sind:=ListBox1.ItemIndex;
  sig_count:=length(sig_info[pind].list);
  if (sind<0)or(sind>=sig_count) then exit;

  name:=sig_info[pind].list[sind].name+'                ';

  mess.PlayCommand:=254;
  mess.Mode:=0;
  mess.sig_id:=sig_info[pind].list[sind].sig_id;
  mess.StartAdress:=0;
  mess.Length:=0;
  mess.LastBlockBytes:=0;
//    mess.reserve:=0;
  mess.BitRateInput:=0;
  mess.BitRateOutput:=bitrateout;
  for i:=0 to 15 do mess.name[i]:=ord(name[i+1]);

  SendCommand(0, Comand_g420_SetPlayMode, SizeOf(mess) div 2, @mess);


end;

//------------------------------------------------------------------------------
procedure TControlForm.TabControl1Change(Sender: TObject);
begin
  ShowPage;
  ListBox1Click(nil);
end;
//------------------------------------------------------------------------------
procedure TControlForm.ListBox1Click(Sender: TObject);
var pind, sind, page_count, sig_count: integer;
begin
  pind:=TabControl1.TabIndex;
  page_count:=length(sig_info);
  if page_count>TabControl1.Tabs.Count then page_count:=TabControl1.Tabs.Count;

  if (pind<0)or(pind>=page_count) then exit;
  sind:=ListBox1.ItemIndex;
  sig_count:=length(sig_info[pind].list);
  if (sind<0)or(sind>=sig_count) then exit;
  if sig_info[pind].list[sind].sig_id_type<8 then
  begin
      CheckBox1.Enabled:=true;
      g420_bitrateOutEdit.Enabled:=CheckBox1.Checked;
  end
  else
  begin
      CheckBox1.Enabled:=false;
      g420_bitrateOutEdit.Enabled:=false;
  end;
end;
//------------------------------------------------------------------------------

procedure TControlForm.LoadParamFromFile;
var ini: TIniFile;
begin
  ini:=TIniFile.Create(IniFileName);
  ConnectEdit.Text:=ini.ReadString('main', 'host', '192.168.1.1');
  g420_bitrateOutEdit.Text:=ini.ReadString('main', 'bitrate', '5000000');
  CheckBox1.Checked:=ini.ReadBool('main', 'bitrate_change', false);
  ini.Destroy;
end;
//------------------------------------------------------------------------------
procedure TControlForm.SaveParamToFile;
var ini: TIniFile;
begin
  ini:=TIniFile.Create(IniFileName);
  ini.WriteString('main', 'host', ConnectEdit.Text);
  ini.WriteString('main', 'bitrate', g420_bitrateOutEdit.Text);
  ini.WriteBool('main', 'bitrate_change', CheckBox1.Checked);
  ini.Destroy;
end;
//------------------------------------------------------------------------------

end.
