program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  uConexao in '..\src\Model\uConexao.pas' {dmConexao: TDataModule},
  uUsuario in '..\src\Model\uUsuario.pas',
  TelaUsuarios in '..\src\View\TelaUsuarios.pas' {PagUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TPagUsuarios, PagUsuarios);
  Application.Run;

end.
