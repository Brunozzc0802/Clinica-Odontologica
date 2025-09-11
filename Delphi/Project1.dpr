program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  uConexao in '..\src\Model\uConexao.pas' {dmConexao: TDataModule},
  uUsuario in '..\src\Model\uUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;

end.
