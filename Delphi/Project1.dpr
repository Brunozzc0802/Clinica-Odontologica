program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  TelaUsuarios in '..\src\View\TelaUsuarios.pas' {PagUsuarios},
  uUsuarios in '..\src\Model\uUsuarios.pas',
  uUsuarioConexao in '..\src\Model\uUsuarioConexao.pas' {dmUsuarios: TDataModule},
  uUsuariosController in '..\src\Controller\uUsuariosController.pas',
  uUsuarioRepository in '..\src\Repository\uUsuarioRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TPagUsuarios, PagUsuarios);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.Run;

end.
