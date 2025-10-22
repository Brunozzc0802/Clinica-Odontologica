unit uConsultasController;

interface

uses
  System.Generics.Collections, SysUtils,
  uConsultas, uConsultasRepository,
  uProfissionaisRepository, uProfissionais,
  uProcedimentosRepository, uProcedimentos,
  uPacientes, uPacientesRepository;

type
  TConsultaController = class
  private
    RepoConsulta: TConsultaRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function ListarPacientes: TObjectList<TPaciente>;
    function ListarProfissionais: TObjectList<TProfissionais>;
    function ListarProcedimentos: TObjectList<TProcedimento>;
    function ListarHorariosDisponiveis(AProfissionalId, AProcedimentoId: Integer; AData: TDate): TList<TTime>;
    function GetProcedimento(AId: Integer): TProcedimento;
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

function TConsultaController.ListarHorariosDisponiveis(AProfissionalId, AProcedimentoId: Integer; AData: TDate): TList<TTime>;
var
  Procedimento: TProcedimento;
  HoraAtual, HoraFim: TTime;
begin
  Result := TList<TTime>.Create;

  Procedimento := GetProcedimento(AProcedimentoId);
  if Procedimento = nil then Exit;

  try
    HoraAtual := EncodeTime(8, 0, 0, 0);
    HoraFim := EncodeTime(17, 0, 0, 0);

    while (HoraAtual + Procedimento.Duracao <= HoraFim) do
    begin
      if not RepoConsulta.HorarioOcupado(AProfissionalId, AData, HoraAtual, Procedimento.Duracao) then
        Result.Add(HoraAtual);

      HoraAtual := HoraAtual + Procedimento.Duracao;
    end;
  finally
    Procedimento.Free;
  end;
end;

end.

