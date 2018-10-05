program g420_prog;

uses
  Forms,
  vis in 'vis.pas' {VisForm},
  MySockets in 'MySockets.pas',
  const_type in 'const_type.pas',
  add_signal in 'add_signal.pas' {AddSigmalForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVisForm, VisForm);
  Application.CreateForm(TAddSigmalForm, AddSigmalForm);
  Application.Run;
end.
