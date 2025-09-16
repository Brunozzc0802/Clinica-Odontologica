unit uUsuarioRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uConexaoUsuario, uUsuarios;

type
  TUsuarioRepository = class
  public
    class function VerificarUsuario(const Usuario: TUsuario): Boolean;
  end;

implementation

{ TUsuarioRepository }

class function TUsuarioRepository.VerificarUsuario(const Usuario: TUsuario): Boolean;
begin
  with dmUsuarios.FDQueryUsuarios do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM usuarios WHERE nome = :nome AND senha = :senha');
    ParamByName('nome').AsString := Usuario.Nome;
    ParamByName('senha').AsString := Usuario.Senha;
    Open;

    Result := not IsEmpty;
  end;
end;

end.

