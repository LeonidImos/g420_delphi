program MakeSigG420;

uses
  Forms,
  make_sig_g420_main in 'make_sig_g420_main.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
