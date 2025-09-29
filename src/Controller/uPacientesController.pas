unit uPacientesController;

interface

uses  uPacientes, uPacientesRepository, System.Generics.Collections, System.SysUtils;

type
  TPacientesController = class
  public
    function BuscarTodos: TObjectList<TPaciente>;
  end;

implementation



{ TPacientesController }

function TPacientesController.BuscarTodos: TObjectList<TPaciente>;
begin
   Result := TPacientesRepository.ListarTodos;
end;

end.
