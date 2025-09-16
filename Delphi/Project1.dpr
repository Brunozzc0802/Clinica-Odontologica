program Project1;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  TelaUsuarios in '..\src\View\TelaUsuarios.pas' {PagUsuarios},
  uConexaoUsuario in '..\src\DataModule\uConexaoUsuario.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TPagUsuarios, PagUsuarios);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;

end.
