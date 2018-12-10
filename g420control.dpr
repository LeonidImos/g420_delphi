program g420control;

uses
  Forms,
  main_control in 'main_control.pas' {ControlForm},
  t2mi_set in 't2mi_set.pas' {T2miSetForm},
  const_type in 'const_type.pas',
  leds in 'leds.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TControlForm, ControlForm);
  Application.CreateForm(TT2miSetForm, T2miSetForm);
  Application.Run;
end.
