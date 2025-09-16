unit uUsuarioService;

interface

uses
  uUsuarios, uUsuarioRepository, System.SysUtils;

type
  TUsuarioService = class
  public
    class function Login(const Usuario: TUsuario): Boolean;
  end;

implementation

{ TUsuarioService }

class function TUsuarioService.Login(const Usuario: TUsuario): Boolean;
begin
  if (Usuario.Nome = '') or (Usuario.Senha = '') then
    raise Exception.Create('Nome e senha obrigatórios');

  Result := TUsuarioRepository.VerificarUsuario(Usuario);
end;

end.

