unit uUsuariosController;

interface

uses
  uUsuarios, uUsuarioRepository, System.Generics.Collections;

type
  TUsuarioController = class
  public
    function VerificarUsuario(const Nome, Senha: string): Boolean;
    function BuscarTodos: TObjectList <TUsuario>;

  end;

implementation

{ TUsuarioController }

function TUsuarioController.VerificarUsuario(const Nome, Senha: string): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.Nome := Nome;
    Usuario.Senha := Senha;
    Result := TUsuarioRepository.VerificarUsuario(Usuario);
  finally
    Usuario.Free;
  end;
end;

function TUsuarioController.BuscarTodos: TObjectList<TUsuario>;
begin
  Result := TUsuarioRepository.ListarTodos;
end;

end.

