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
    function CalcularHoraFim(HoraInicio: TDateTime; IdProcedimento: Integer): TDateTime;
    function BuscarConsultas: TObjectList<TConsulta>;
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

function TConsultaController.CalcularHoraFim(HoraInicio: TDateTime;IdProcedimento: Integer): TDateTime;
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

end.
