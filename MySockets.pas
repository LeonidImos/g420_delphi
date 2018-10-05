unit MySockets;

interface
uses Sockets, Classes, Windows, Messages, Dialogs, Controls, SysUtils, IdTCPClient;

const
TCP_BUFFER_SIZE = 1*1024*1024;
EMUL_TCP_BUFFER_SIZE = 1*1024*1024;
WM_TCP_EVENTS = WM_USER+100;
WTE_TCP_CONNECT = 0;
WTE_TCP_DISCONNECT = 1;
WTE_TCP_RECEIVE = 2;

type
//  TMyClientSocket = class(TControl)
  TMyClientSocket = class(TComponent)
  private
    RunEn: boolean;
    ThreadHandle: THandle;                     
    ThreadID: dword;
    CriticalSection: TRTLCriticalSection;
    FRemoteHost: string;
    FRemotePort: string;
    FActive: boolean;
    FConnected: boolean;
    break_thread: boolean;
    stop_connect: boolean;
    start_pos,end_pos,max_pos: integer;
    arr: array[0..TCP_BUFFER_SIZE-1]of byte;
    em_start_pos, em_end_pos: integer;
    emul_arr: array[0..EMUL_TCP_BUFFER_SIZE-1]of byte;
//    Owner: TWinControl;
    function GetActive: boolean;
    procedure SetActive(value: boolean);
    procedure SetRemoteHost(value: string);
    procedure SetRemotePort(value: string);
    procedure TestThread;
    procedure GetEvents(var Msg: TMessage); message WM_TCP_EVENTS;
{    procedure TcpClientConnect(Sender: TObject);
    procedure TcpClientDisconnect(Sender: TObject);
    procedure TcpClientReceive(Sender: TObject; Buf: PAnsiChar; var DataLen: Integer);
    procedure TcpClientSend(Sender: TObject; Buf: PAnsiChar; var DataLen: Integer); }
    procedure TcpClientError(Sender: TObject; SocketError: Integer);

  public
    TCPClient: TCustomIpClient;
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    function ReceiveLength: integer;
    function ReceiveBuf(var buf; leng: integer): integer;
    function EmulReceiveBuf(var buf; bufsize: integer): boolean; // Кладет (данные в массив приема)
    procedure SendBuf(var buf; bufsize: integer);
    property Active: boolean read GetActive write SetActive;
    property RemoteHost: string read FRemoteHost write SetRemoteHost;
    property RemotePort: string read FRemotePort write SetRemotePort;
    property Connected: boolean read FConnected;
  end;

implementation
//******************************************************************************
function TCPThreadProc(MyTCPClient: TMyClientSocket): Integer;
const
SLEEP_TIME = 10;
CLOSE_COUNT_MAX = 5000 div SLEEP_TIME; // 5 секунд
var host,port: AnsiString;
//close_count: integer;
wait_close: boolean;
time_close, CurTime, SleepTime: TDateTime;
RunEn, data_detect: boolean;
leng:integer;
handle: THandle;
//isConnected: boolean;
begin
//  close_count:=0;
  wait_close:=false;
  RunEn:=true;
  handle:=0;
  time_close:=now+30.0/(60*60*24); // 30 sec
  SleepTime:=10/(24*3600*1000); // 10 ms
//  isConnected:=false;
  if MyTCPClient.Owner<>nil then
    if MyTCPClient.Owner is TWinControl then
      handle:=TWinControl(MyTCPClient.Owner).Handle;
  while RunEn do
  begin
    data_detect:=false;

    if MyTCPClient.stop_connect then
    begin
      data_detect:=true;
      MyTCPClient.TCPClient.Close;
      MyTCPClient.FConnected:=MyTCPClient.TCPClient.Connected;
      MyTCPClient.stop_connect:=false;
      if handle>0 then PostMessage(handle, WM_TCP_EVENTS, 1, 0);
    end;

    CurTime:=now;
    if (MyTCPClient.FActive)and(not MyTCPClient.stop_connect) then
    begin
      wait_close:=false;          // останавливаем счетчик(таймер) выхода из потока
      if not MyTCPClient.TCPClient.Active then
      begin
        EnterCriticalSection(MyTCPClient.CriticalSection);
        host:=MyTCPClient.RemoteHost;
        port:=MyTCPClient.RemotePort;
        LeaveCriticalSection(MyTCPClient.CriticalSection);
        if host<>MyTCPClient.TCPClient.RemoteHost then MyTCPClient.TCPClient.RemoteHost:=host;
        if port<>MyTCPClient.TCPClient.RemotePort then MyTCPClient.TCPClient.RemotePort:=port;
        MyTCPClient.TCPClient.Open;
        MyTCPClient.FConnected:=MyTCPClient.TCPClient.Connected;
        if MyTCPClient.FConnected then
        begin
          if handle>0 then PostMessage(handle, WM_TCP_EVENTS, 0, 0);
        end
        else
        begin
          MyTCPClient.FActive:=false;
          MyTCPClient.TCPClient.Close;
        end;
      end;
    end;

{    MyTCPClient.FConnected:=MyTCPClient.TCPClient.Connected;
    if (not isConnected)and(MyTCPClient.FConnected) then
    begin
      isConnected:=true;
      if handle>0 then PostMessage(handle, WM_TCP_EVENTS, 0, 0);
    end;  }

    if not MyTCPClient.FActive then
    begin
      if not wait_close then // запускаем счетчик(таймер) выхода из потока
      begin
        wait_close:=true;
        time_close:=CurTime+5.0/(60*60*24); // 5 sec
      end;
      if MyTCPClient.TCPClient.Active then
      begin
        MyTCPClient.TCPClient.Close;
        MyTCPClient.FConnected:=MyTCPClient.TCPClient.Connected;
        if handle>0 then PostMessage(handle, WM_TCP_EVENTS, 1, 0);
      end;
    end;

{    if (isConnected)and(not MyTCPClient.FConnected) then
    begin
      isConnected:=false;
      if handle>0 then PostMessage(handle, WM_TCP_EVENTS, 1, 0);
    end; }

    leng:=1;
    while (leng>0)and(MyTCPClient.FActive)and
          (MyTCPClient.FConnected)and(not MyTCPClient.break_thread) do
    begin
      EnterCriticalSection(MyTCPClient.CriticalSection);
      if (MyTCPClient.start_pos>0)and(MyTCPClient.end_pos=MyTCPClient.start_pos) then
      begin
        MyTCPClient.start_pos:=0;
        MyTCPClient.end_pos:=0;
      end;
      LeaveCriticalSection(MyTCPClient.CriticalSection);

      leng:=TCP_BUFFER_SIZE-MyTCPClient.end_pos;
      if leng>0 then
      begin
        if MyTCPClient.TCPClient.WaitForData(1)then
        begin
          leng:=MyTCPClient.TCPClient.ReceiveBuf(MyTCPClient.arr[MyTCPClient.end_pos],leng);
          if leng>0 then
          begin
            EnterCriticalSection(MyTCPClient.CriticalSection);
            inc(MyTCPClient.end_pos,leng);
            LeaveCriticalSection(MyTCPClient.CriticalSection);
            if handle>0 then PostMessage(handle, WM_TCP_EVENTS, 2, 0);
            data_detect:=true;
          end;
        end else begin leng:=0; {sleep(5)}; end;
      end {else sleep(5)};
    end;

    if data_detect then SleepTime:=CurTime + 5/(24*3600*1000)
    else if CurTime>SleepTime then sleep(5);

    if (wait_close)and(CurTime>time_close) then RunEn:=false;
    
    if MyTCPClient.break_thread then RunEn:=false;
  end;

  if MyTCPClient.TCPClient.Active then MyTCPClient.TCPClient.Close;
  MyTCPClient.ThreadHandle:=0;
//  endthread(0);
  result:=0;
end;
//------------------------------------------------------------------------------

constructor TMyClientSocket.Create(aOwner: TComponent);
begin
//  Owner:=aOwner;
  inherited Create(AOwner);
  TCPClient:=TTCPClient.Create(aOwner);
{  TCPClient.OnConnect:=TcpClientConnect;
  TCPClient.OnDisconnect:=TcpClientDisconnect;
  TCPClient.OnReceive:=TcpClientReceive;
  TCPClient.OnSend:=TcpClientSend; }
  TCPClient.OnError:=TcpClientError;

  InitializeCriticalSection(CriticalSection);
  RunEn:=false;
  ThreadHandle:=0;
  start_pos:=0;
  end_pos:=0;
  max_pos:=0;
  break_thread:=false;
  stop_connect:=false;
  em_start_pos:=0;
  em_end_pos:=0;
end;
//------------------------------------------------------------------------------
destructor TMyClientSocket.Destroy;
var i: integer;
begin
  break_thread:=true;
  for i:=0 to 1000 do
  begin
    if ThreadHandle=0 then break;
    sleep(10);
  end;
  TCPClient.Destroy;
  inherited Destroy;
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.Open;
begin
  Active:=true;
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.Close;
begin
//  if FActive then stop_connect:=true;
  Active:=false;
end;
//------------------------------------------------------------------------------
function TMyClientSocket.GetActive: boolean;
begin
  TestThread;
  result:=FActive;
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.SetActive(value: boolean);
begin
  if (FActive)and(not value) then stop_connect:=true;
  FActive:=value;
  TestThread;
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.SetRemoteHost(value: string);
begin
  EnterCriticalSection(CriticalSection);
  FRemoteHost:=value;
  LeaveCriticalSection(CriticalSection);
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.SetRemotePort(value: string);
begin
  EnterCriticalSection(CriticalSection);
  FRemotePort:=value;
  LeaveCriticalSection(CriticalSection);
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.TestThread;
begin
  if (ThreadHandle=0)and(FActive) then
  begin
    RunEn:=true;
    ThreadHandle:= BeginThread(nil, 0, @TCPThreadProc, self, 0, ThreadID);
  end;
end;
//------------------------------------------------------------------------------
function TMyClientSocket.ReceiveLength: integer;
begin
  EnterCriticalSection(CriticalSection);
  result:=end_pos-start_pos;
  LeaveCriticalSection(CriticalSection);
  if result=0 then
  begin
    result:=em_end_pos-em_start_pos;
    if result<0 then result:=0;
  end;
end;
//------------------------------------------------------------------------------
function TMyClientSocket.ReceiveBuf(var buf; leng: integer): integer;
begin
  result:=leng;
  EnterCriticalSection(CriticalSection);
  if max_pos<end_pos then max_pos:=end_pos;
  if result>end_pos-start_pos then result:=end_pos-start_pos;
  LeaveCriticalSection(CriticalSection);
  if result>0 then
  begin
    move(arr[start_pos], buf, result);
    EnterCriticalSection(CriticalSection);
    inc(start_pos, result);
    LeaveCriticalSection(CriticalSection);
  end
  else if em_end_pos-em_start_pos>0 then
  begin
    result:=leng;
    if result>em_end_pos-em_start_pos then result:=em_end_pos-em_start_pos;
    move(emul_arr[em_start_pos], buf, result);
    inc(em_start_pos, result);
    if em_start_pos>=em_end_pos then
    begin
      em_start_pos:=0;
      em_end_pos:=0;
    end;
  end;
end;
//------------------------------------------------------------------------------
function TMyClientSocket.EmulReceiveBuf(var buf; bufsize: integer): boolean;
begin
  result:=false;
  if bufsize>EMUL_TCP_BUFFER_SIZE-em_end_pos then exit;
  result:=true;
  if bufsize<=0 then exit;
//  if bufsize>em_end_pos-em_start_pos then bufsize:=em_end_pos-em_start_pos;

  move(buf, emul_arr[em_end_pos], bufsize);

  inc(em_end_pos, bufsize);

end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.SendBuf(var buf; bufsize: integer);
begin
  TCPClient.SendBuf(buf, bufsize);
end;
//------------------------------------------------------------------------------
procedure TMyClientSocket.GetEvents(var Msg: TMessage);
begin
  ShowMessage('test');
end;
//------------------------------------------------------------------------------
{procedure TMyClientSocket.TcpClientConnect(Sender: TObject);
begin
  ShowMessage('TcpClientConnect');

end;
//------------------------------------------------------------------------------

procedure TMyClientSocket.TcpClientDisconnect(Sender: TObject);
begin
  ShowMessage('TcpClientDisconnect');

end;
//------------------------------------------------------------------------------

procedure TMyClientSocket.TcpClientReceive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  ShowMessage('TcpClientReceive');

end;
//------------------------------------------------------------------------------

procedure TMyClientSocket.TcpClientSend(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
  ShowMessage('TcpClientSend');

end;        }
//------------------------------------------------------------------------------

procedure TMyClientSocket.TcpClientError(Sender: TObject; SocketError: Integer);
begin
//  ShowMessage('TcpClientError');
  Active:=false;
end;
//------------------------------------------------------------------------------

end.
