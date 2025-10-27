unit uConsultasController;

interface

uses
  System.SysUtils, System.Generics.Collections,
  uConsultasRepository, uPacientes, uProfissionais, uProcedimentos;

type
  TConsultaController = class
  public
    function BuscarPacientes: TObjectList<TPaciente>;
    function BuscarProfissionais: TObjectList<TProfissionais>;
    function BuscarProcedimentos: TObjectList<TProcedimento>;
  end;

implementation

{ TConsultaController }

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
