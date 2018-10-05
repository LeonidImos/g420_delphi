program g420control;

uses
  Forms,
  main_control in 'main_control.pas' {ControlForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TControlForm, ControlForm);
  Application.Run;
end.
