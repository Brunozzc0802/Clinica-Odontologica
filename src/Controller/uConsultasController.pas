unit uConsultasController;
interface
uses
  System.Generics.Collections, SysUtils, System.DateUtils,
  uConsultas, uConsultasRepository,
  uProfissionaisRepository, uProfissionais,
  uProcedimentosRepository, uProcedimentos,
  uPacientes, uPacientesRepository;
type
  THorarioDisponivel = uConsultasRepository.THorarioDisponivel;

  TConsultaController = class
  private
    RepoConsulta: TConsultaRepository;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarPacientes: TObjectList<TPaciente>;
    function ListarProfissionais: TObjectList<TProfissionais>;
    function ListarProcedimentos: TObjectList<TProcedimento>;
    function GetProcedimento(AId: Integer): TProcedimento;
    procedure Adicionar(AConsulta: TConsulta);
    procedure Alterar(AConsulta: TConsulta);
    procedure CancelarConsulta(const Id: Integer);
    function ObterHorariosDisponiveis(AProfissionalId: Integer; AData: TDate; AProcedimentoId: Integer): TArray<THorarioDisponivel>;
    function HorarioOcupado(AProfissionalId: Integer; AData: TDate; AHora: TTime; ADuracao: TTime): Boolean;
    function ObterDuracaoProcedimento(AProcedimentoId: Integer): TTime;
  end;

implementation
{ TConsultaController }
constructor TConsultaController.Create;
begin
  RepoConsulta := TConsultaRepository.Create;
end;

destructor TConsultaController.Destroy;
begin
  RepoConsulta.Free;
  inherited;
end;

// -- Pacientes --
function TConsultaController.ListarPacientes: TObjectList<TPaciente>;
var
  PacienteRepo: TPacientesRepository;
  Paciente: TPaciente;
begin
  Result := TObjectList<TPaciente>.Create(False);
  PacienteRepo := TPacientesRepository.Create;
  try
    for Paciente in PacienteRepo.ListarPacientes do
      Result.Add(Paciente);
  finally
    PacienteRepo.Free;
  end;
end;

// -- Profissionais --
function TConsultaController.ListarProfissionais: TObjectList<TProfissionais>;
var
  ProfRepo: TProfissionaisRepository;
  Prof: TProfissionais;
begin
  Result := TObjectList<TProfissionais>.Create(False);
  ProfRepo := TProfissionaisRepository.Create;
  try
    for Prof in ProfRepo.ListarProfissionais do
      Result.Add(Prof);
  finally
    ProfRepo.Free;
  end;
end;

// -- Procedimentos --
function TConsultaController.ListarProcedimentos: TObjectList<TProcedimento>;
var
  ProcRepo: TProcedimentoRepository;
  Proc: TProcedimento;
begin
  Result := TObjectList<TProcedimento>.Create(False);
  ProcRepo := TProcedimentoRepository.Create;
  try
    for Proc in ProcRepo.ListarProcedimentos do
      Result.Add(Proc);
  finally
    ProcRepo.Free;
  end;
end;

function TConsultaController.GetProcedimento(AId: Integer): TProcedimento;
var
  ProcRepo: TProcedimentoRepository;
  Proc: TProcedimento;
begin
  Result := nil;
  ProcRepo := TProcedimentoRepository.Create;
  try
    for Proc in ProcRepo.ListarProcedimentos do
    begin
      if Proc.Id = AId then
      begin
        Result := TProcedimento.Create;
        Result.Id := Proc.Id;
        Result.Nome := Proc.Nome;
        Result.Valor := Proc.Valor;
        Result.Duracao := Proc.Duracao;
        Result.Ativo := Proc.Ativo;
        Exit;
      end;
    end;
  finally
    ProcRepo.Free;
  end;
end;


procedure TConsultaController.Adicionar(AConsulta: TConsulta);
begin
  RepoConsulta.Adicionar(AConsulta);
end;

procedure TConsultaController.Alterar(AConsulta: TConsulta);
begin
  RepoConsulta.Alterar(AConsulta);
end;

procedure TConsultaController.CancelarConsulta(const Id: Integer);
begin
  RepoConsulta.Cancelar(Id);
end;

// -- Horários Disponíveis --
function TConsultaController.ObterHorariosDisponiveis(AProfissionalId: Integer; AData: TDate; AProcedimentoId: Integer): TArray<THorarioDisponivel>;
begin
  Result := RepoConsulta.ObterHorariosDisponiveis(AProfissionalId, AData, AProcedimentoId);
end;

// -- Verifica horário ocupado --
function TConsultaController.HorarioOcupado(AProfissionalId: Integer; AData: TDate; AHora: TTime; ADuracao: TTime): Boolean;
begin
  Result := RepoConsulta.HorarioOcupado(AProfissionalId, AData, AHora, ADuracao);
end;

// -- Duração procedimento --
function TConsultaController.ObterDuracaoProcedimento(AProcedimentoId: Integer): TTime;
begin
  Result := RepoConsulta.ObterDuracaoProcedimento(AProcedimentoId);
end;

end.
