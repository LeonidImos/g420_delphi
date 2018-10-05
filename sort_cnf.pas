unit sort_cnf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

const
GROUPNAME  : array[0..6] of string =
      ('IPPP(10)','IBPB(10)','IBBP(12)','I',
       'IPPP(12)','IBPB(12)','IPPP(6)');

type
  TStream = record
    countgroup: integer;
    actualgroup: integer;
    groups: array[0..6] of integer;
  end;

  TProgram = record
    countstream: integer;
    streams: array[0..8] of TStream;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i, j, p, i1, i2, i3: integer;
fullname, fname, ext, pathold, pathnew: string;
sig_name, group_name: string;
oldname, newname: array[0..2]of string;
fl: TextFile;
st, st2: string;
progs: array[0..8] of TProgram;
prog_count: integer;
begin
  if OpenDialog1.Execute then
  begin
    for i:=0 to OpenDialog1.Files.Count-1 do
    begin
//      Memo1.Lines.Add('---------------------------------------------------');
      prog_count:=0;
      for i1:=0 to 8 do
      begin
        progs[i1].countstream:=0;
        for i2:=0 to 8 do
        begin
          progs[i1].streams[i2].countgroup:=0;
          progs[i1].streams[i2].actualgroup:=0;
        end;
      end;

      fullname:=OpenDialog1.Files[i];
//      Memo1.Lines.Add(fullname);
      pathold:=ExtractFilePath(fullname);
//      Memo1.Lines.Add(path);
      fname:=ExtractFileName(fullname);
//      Memo1.Lines.Add(fname);
      ext:=ExtractFileExt(fname);
//      Memo1.Lines.Add(ext);
      p:=length(fname)-length(ext)+1;
      Delete(fname, p, 255);
//      Memo1.Lines.Add(fname);
      sig_name:=''; group_name:='';
      AssignFile(fl, fullname);
      ReSet(fl);
      while not EOF(fl) do
      begin
        ReadLn(fl, st);
        p:=pos('=', st);
        i1:=0; i2:=0; i3:=0;
        if p>3 then
        begin
          st2:=Copy(st, 1, p-1);
          Delete(st, 1, p);
          if (st2[p-1]>='1')and(st2[p-1]<='9') then
          begin
            i1:=ord(st2[p-1])-ord('1');
            Delete(st2,p-1, 1);
            if (st2[p-2]>='1')and(st2[p-2]<='9') then
            begin
              i2:=i1;
              i1:=ord(st2[p-2])-ord('1');
              Delete(st2,p-2, 1);
              if (st2[p-3]>='1')and(st2[p-3]<='9') then
              begin
                i3:=i2; if i3>6 then i3:=6;
                i2:=i1;
                i1:=ord(st2[p-3])-ord('1');
                Delete(st2,p-3, 1);
              end;
            end;
          end;
        end else st2:='';
//        Memo1.Lines.Add(st2);
//        Memo1.Lines.Add(st);
        if uppercase(st2)='NAME' then sig_name:=st;
        if uppercase(st2)='PROGRAMS' then prog_count:=strtoint(st);
        if uppercase(st2)='STREAMS' then progs[i1].countstream:=strtoint(st);
        if uppercase(st2)='GROUPS' then progs[i1].streams[i2].countgroup:=strtoint(st);
        if uppercase(st2)='ACTUALGROUP' then progs[i1].streams[i2].actualgroup:=strtoint(st);
        if uppercase(st2)='GROUPTYPE' then progs[i1].streams[i2].groups[i3]:=strtoint(st);

      end;
      CloseFile(fl);
      for i1:=0 to prog_count-1 do
      begin
        for i2:=0 to progs[i1].countstream do
        begin
          if (progs[i1].streams[i2].countgroup>0)and
             (progs[i1].streams[i2].actualgroup<progs[i1].streams[i2].countgroup) then
          begin
            i3:=progs[i1].streams[i2].groups[progs[i1].streams[i2].actualgroup];
            st:=GROUPNAME[i3];
            if group_name='' then  group_name:=st
            else group_name:=group_name+'_'+st;
          end;
        end;
      end;
      if group_name<>'' then sig_name:=sig_name+'\'+group_name;

//      Memo1.Lines.Add('sig_name = '+sig_name);
      pathnew:=pathold+sig_name;
//      Memo1.Lines.Add(pathnew);
      if not DirectoryExists(pathnew) then
        ForceDirectories(pathnew);
      oldname[0]:=fullname+#0;
      newname[0]:=pathnew+'\'+fname+ext+#0;
      if CheckBox1.Checked then oldname[1]:=pathold+fname+'.m2t'+#0 else oldname[1]:='';
      newname[1]:=pathnew+'\'+fname+'.m2t'+#0;
      if CheckBox2.Checked then oldname[2]:=pathold+fname+'.mts'+#0 else oldname[2]:='';
      newname[2]:=pathnew+'\'+fname+'.mts'+#0;

      for j:=0 to 2 do
      begin
//        Memo1.Lines.Add('oldname'+IntToStr(j)+' = '+oldname[j]);
        if oldname[j]<>'' then
        begin
//          Memo1.Lines.Add('newname'+IntToStr(j)+' = '+newname[j]);
          if not MoveFile(PWideChar(oldname[j]), PWideChar(newname[j])) then
            Memo1.Lines.Add('Не удалось переместить файл "'+oldname[j]+'" в папку "'+newname[j]+'"');
        end;
      end;
    end;
  end;
end;

end.
