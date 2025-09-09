program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  uConexao in '..\src\Model\uConexao.pas' {DataModule1: TDataModule},
  uUsuario in '..\src\Model\uUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;

end.
