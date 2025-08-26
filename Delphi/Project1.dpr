program Project1;

uses
  Vcl.Forms,
  TelaLogin in 'TelaLogin.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
