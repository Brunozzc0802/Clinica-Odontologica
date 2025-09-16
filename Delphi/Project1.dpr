program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  TelaUsuarios in '..\src\View\TelaUsuarios.pas' {PagUsuarios},
  uConexaoUsuario in '..\src\DataModule\uConexaoUsuario.pas' {dmUsuarios: TDataModule},
  uUsuarios in '..\src\Model\uUsuarios.pas',
  uUsuarioRepository in '..\src\Repository\uUsuarioRepository.pas',
  uUsuarioService in '..\src\Service\uUsuarioService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TPagUsuarios, PagUsuarios);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.Run;

end.
