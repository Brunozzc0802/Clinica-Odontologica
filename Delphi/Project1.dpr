program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  uConexao in '..\src\Model\uConexao.pas',
  uUsuario in '..\src\Model\uUsuario.pas',
  uControllerUsuarios in '..\src\Controller\uControllerUsuarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;

end.
