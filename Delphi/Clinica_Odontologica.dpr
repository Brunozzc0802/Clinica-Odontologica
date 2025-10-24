program Clinica_Odontologica;

uses
  Vcl.Forms,
  TelaLogin in '..\src\View\TelaLogin.pas' {FormLogin},
  TelaUsuarios in '..\src\View\TelaUsuarios.pas' {PagUsuarios},
  uUsuarios in '..\src\Model\uUsuarios.pas',
  uUsuarioConexao in '..\src\Model\uUsuarioConexao.pas' {dmUsuarios: TDataModule},
  uUsuariosController in '..\src\Controller\uUsuariosController.pas',
  uUsuarioRepository in '..\src\Repository\uUsuarioRepository.pas',
  TelaPacientes in '..\src\View\TelaPacientes.pas' {PagPacientes},
  uPacientes in '..\src\Model\uPacientes.pas',
  uPacientesRepository in '..\src\Repository\uPacientesRepository.pas',
  uPacientesController in '..\src\Controller\uPacientesController.pas' {$R *.res},
  TelaProfissionais in '..\src\View\TelaProfissionais.pas' {PagProfissionais},
  uProfissionais in '..\src\Model\uProfissionais.pas',
  uProfissionaisRepository in '..\src\Repository\uProfissionaisRepository.pas',
  uProfissionaisController in '..\src\Controller\uProfissionaisController.pas',
  TelaProcedimentos in '..\src\View\TelaProcedimentos.pas' {PagProcedimentos},
  uProcedimentos in '..\src\Model\uProcedimentos.pas',
  uProcedimentosRepository in '..\src\Repository\uProcedimentosRepository.pas',
  uProcedimentosController in '..\src\Controller\uProcedimentosController.pas',
  TelaConsultas in '..\src\View\TelaConsultas.pas' {PagConsultas},
  uConsultas in '..\src\Model\uConsultas.pas',
  uConsultasRepository in '..\src\Repository\uConsultasRepository.pas',
  uConsultasController in '..\src\Controller\uConsultasController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPagConsultas, PagConsultas);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TPagUsuarios, PagUsuarios);
  Application.CreateForm(TPagProcedimentos, PagProcedimentos);
  Application.CreateForm(TPagPacientes, PagPacientes);
  Application.CreateForm(TPagProfissionais, PagProfissionais);
  Application.CreateForm(TdmUsuarios, dmUsuarios);
  Application.Run;

end.
