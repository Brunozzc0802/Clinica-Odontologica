unit uUsuariosController;

interface

uses
  uUsuarios, uUsuarioRepository;

type
  TUsuarioController = class
  public
    function VerificarUsuario(const Nome, Senha: string): Boolean;
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

end.

