unit uConsultasController;

interface

uses
  System.SysUtils, System.Generics.Collections,
  uConsultasRepository, uPacientes, uProfissionais, uProcedimentos, uConsultas;

type
  TConsultaController = class
  public
    function BuscarPacientes: TObjectList<TPaciente>;
    function BuscarProfissionais: TObjectList<TProfissionais>;
    function BuscarProcedimentos: TObjectList<TProcedimento>;
    function CalcularHoraFim(HoraInicio: TDateTime; IdProcedimento: Integer)
      : TDateTime;
    function BuscarConsultas: TObjectList<TConsulta>;
    function VerificarHorarioDisponivel(pData: TDate;
      HoraInicio, HoraFim: TTime; ProfissionalId: Integer): Boolean;
    function AdicionarConsulta(PacienteId, ProfissionalId, ProcedimentoId
      : Integer; pData: TDate; HoraInicio, HoraFim: TTime): Boolean;
    function AlterarConsulta(ConsultaId, PacienteId, ProfissionalId, ProcedimentoId
      : Integer; pData: TDate; HoraInicio, HoraFim: TTime): Boolean;
    function DesativarConsulta(ConsultaId: Integer): Boolean;
    function RestaurarConsulta(ConsultaId: Integer): Boolean;
    function BuscarConsultasCanceladas: TObjectList<TConsulta>;
  end;

implementation

{ TConsultaController }

function TConsultaController.BuscarConsultas: TObjectList<TConsulta>;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.ListarConsultas;
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.BuscarPacientes: TObjectList<TPaciente>;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.ListarPacientes;
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.BuscarProfissionais: TObjectList<TProfissionais>;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.ListarProfissionais;
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.CalcularHoraFim(HoraInicio: TDateTime;
  IdProcedimento: Integer): TDateTime;
var
  RepoConsul: TConsultaRepository;
  Duracao: Integer;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Duracao := RepoConsul.DuracaoProcedimento(IdProcedimento);
    Result := HoraInicio + (Duracao / 1440);
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.BuscarProcedimentos: TObjectList<TProcedimento>;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.ListarProcedimentos;
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.VerificarHorarioDisponivel(pData: TDate;
  HoraInicio, HoraFim: TTime; ProfissionalId: Integer): Boolean;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.VerificarHorarioDisponivel(pData, HoraInicio, HoraFim,
      ProfissionalId);
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.AdicionarConsulta(PacienteId, ProfissionalId,
  ProcedimentoId: Integer; pData: TDate; HoraInicio, HoraFim: TTime): Boolean;
var
  RepoConsul: TConsultaRepository;
  Consulta: TConsulta;
begin
  Result := False;

  // Verificar se o horário está disponível antes de adicionar
  if not VerificarHorarioDisponivel(pData, HoraInicio, HoraFim, ProfissionalId)
  then begin
    Exit;
  end;

  RepoConsul := TConsultaRepository.Create;
  try
    Consulta := TConsulta.Create;
    try
      Consulta.PacienteId := PacienteId;
      Consulta.ProfissionalId := ProfissionalId;
      Consulta.ProcedimentoId := ProcedimentoId;
      Consulta.Data := pData;
      Consulta.HoraInicio := HoraInicio;
      Consulta.HoraFim := HoraFim;
      Consulta.Ativo := True;

      Result := RepoConsul.AdicionarConsulta(Consulta);
    finally
      Consulta.Free;
    end;
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.AlterarConsulta(ConsultaId, PacienteId, ProfissionalId,
  ProcedimentoId: Integer; pData: TDate; HoraInicio, HoraFim: TTime): Boolean;
var
  RepoConsul: TConsultaRepository;
  Consulta: TConsulta;
begin
  Result := False;

  // Verificar se o horário está disponível antes de alterar
  if not VerificarHorarioDisponivel(pData, HoraInicio, HoraFim, ProfissionalId)
  then begin
    Exit;
  end;

  RepoConsul := TConsultaRepository.Create;
  try
    Consulta := TConsulta.Create;
    try
      Consulta.Id := ConsultaId;
      Consulta.PacienteId := PacienteId;
      Consulta.ProfissionalId := ProfissionalId;
      Consulta.ProcedimentoId := ProcedimentoId;
      Consulta.Data := pData;
      Consulta.HoraInicio := HoraInicio;
      Consulta.HoraFim := HoraFim;
      Consulta.Ativo := True;

      Result := RepoConsul.AlterarConsulta(Consulta);
    finally
      Consulta.Free;
    end;
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.DesativarConsulta(ConsultaId: Integer): Boolean;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.DesativarConsulta(ConsultaId);
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.RestaurarConsulta(ConsultaId: Integer): Boolean;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.RestaurarConsulta(ConsultaId);
  finally
    RepoConsul.Free;
  end;
end;

function TConsultaController.BuscarConsultasCanceladas: TObjectList<TConsulta>;
var
  RepoConsul: TConsultaRepository;
begin
  RepoConsul := TConsultaRepository.Create;
  try
    Result := RepoConsul.ListarConsultasCanceladas;
  finally
    RepoConsul.Free;
  end;
end;

end.
