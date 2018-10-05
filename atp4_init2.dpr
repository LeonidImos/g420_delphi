program atp4_init2;

uses
  Forms,
  ai_main2 in 'ai_main2.pas' {Form1},
  dialog in 'dialog.pas' {DialogForm},
  list in 'list.pas' {ListForm},
  options in 'options.pas',
  constants in 'constants.pas',
  MyTypes in 'MyTypes.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Инициализация АТП';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDialogForm, DialogForm);
  Application.CreateForm(TListForm, ListForm);
  Application.Run;
end.
