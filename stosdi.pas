unit stosdi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

const
  BUF_SIZE = 10; // В блоках по 6 или 8 байт

type
  TBlock_s = packed record
    lo_bit: word;
    arr: array[0..3]of byte;
  end;
  TBlock_sdi = packed record
    arr: array[0..3]of word;
  end;

  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    buf_s: array[0..BUF_SIZE-1]of TBlock_s;
    buf_sdi: array[0..BUF_SIZE-1]of TBlock_sdi;
    procedure Convert(FileName: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//******************************************************************************
procedure TForm1.Button1Click(Sender: TObject);
var i: integer;
begin
  if OpenDialog1.Execute then
  begin
    for i:=0 to OpenDialog1.Files.Count-1 do
    begin
      Convert(OpenDialog1.Files[i]);
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
end;
//------------------------------------------------------------------------------
procedure TForm1.Convert(FileName: string);
var FileNameOut, ext: string;
size, size2, leng: int64;
fl_in, fl_out: file;
sdi_ok, hdsdi_ok: boolean;
i, j: integer;
lo_bit: word;
begin
  AssignFile(fl_in, FileName);
  ReSet(fl_in, 1);
  size:=FileSize(fl_in);
  CloseFile(fl_in);
  sdi_ok:=(size mod 1620000)=0; //(1620000 = 625*1728*6/4)
  hdsdi_ok:=(size mod 11880000)=0;
  if (not sdi_ok)and(not hdsdi_ok) then
  begin
    Memo1.Lines.Add('Размер файла "'+FileName+'" не кратен кадру. Не конвертирован.');
    exit;
  end;

  ext:=ExtractFileExt(FileName);
  FileNameOut:=copy(FileName, 1, length(FileName)-length(ext))+'.sdi';
  if FileName=FileNameOut then FileNameOut:=FileNameOut+'2';

  AssignFile(fl_out, FileNameOut);
  ReSet(fl_in, SizeOf(TBlock_s));
  ReWrite(fl_out, SizeOf(TBlock_sdi));
  size:=FileSize(fl_in);
  size2:=size;
  while size2>0 do
  begin
    if size2>BUF_SIZE then leng:=BUF_SIZE else leng:=size2;
    blockRead(fl_in, buf_s[0], leng);
    for i:=0 to leng-1 do
    begin
      lo_bit:=buf_s[i].lo_bit;
      for j:=0 to 3 do
      begin
        buf_sdi[i].arr[j]:=buf_s[i].arr[j]*4 + (lo_bit and 3);
        if (lo_bit and $0c)<>0 then
          memo1.Lines.Add('Ненулевые спец биты, блок '+IntToStr(size-size2+i));

        lo_bit:=lo_bit shr 4;
      end;
    end;
    BlockWrite(fl_out, buf_sdi[0], leng);
    dec(size2, leng);
  end;
  CloseFile(fl_in);
  CloseFile(fl_out);
end;
//------------------------------------------------------------------------------

end.
