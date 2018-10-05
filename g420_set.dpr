program g420_set;

uses
  Forms,
  gs_main in 'gs_main.pas' {Form1};
(*  options in 'options.pas',
  options_set in 'options_set.pas' {FormOption},
  MyTypes in 'MyTypes.pas',
  constants in 'constants.pas',
  Config in 'Config.pas' {ConfigForm},
  BA_Types in 'BA_Types.pas',
  type_config2 in 'type_config2.pas',
  TSselectDialog in 'TSselectDialog.pas' {TSSelectDialogForm},
  SettingQoe in 'SettingQoe.pas' {SettingQoeForm};   *)

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Установки АТП';
  Application.CreateForm(TForm1, Form1);
{  Application.CreateForm(TFormOption, FormOption);
  Application.CreateForm(TConfigForm, ConfigForm);
  Application.CreateForm(TTSSelectDialogForm, TSSelectDialogForm);
  Application.CreateForm(TSettingQoeForm, SettingQoeForm);  }
  Application.Run;
end.
