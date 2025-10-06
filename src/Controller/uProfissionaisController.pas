unit uProfissionaisController;

interface

uses
  uProfissionais, uProfissionaisRepository, System.Generics.Collections, System.SysUtils;

type
  TProfissionaisController = class
  public
    function BuscarTodos: TObjectList<TProfissionais>;
  end;

implementation

{ TProfissionaisController }

function TProfissionaisController.BuscarTodos: TObjectList<TProfissionais>;
var
  RepoProf: TProfissionaisRepository;
begin
  RepoProf := TProfissionaisRepository.Create;
  try
    Result := RepoProf.ListarTodos;
  finally
    RepoProf.Free;
  end;
end;

end.

