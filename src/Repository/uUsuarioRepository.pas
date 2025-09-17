unit uUsuarioRepository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, uUsuarios, uUsuarioConexao;

type
  TUsuarioRepository = class
  public
    class function VerificarUsuario(const Usuario: TUsuario): Boolean;
  end;

implementation

{ TUsuarioRepository }

class function TUsuarioRepository.VerificarUsuario(const Usuario: TUsuario): Boolean;
begin
  Result := False;
  with dmUsuarios.FDQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM usuarios WHERE nome = :nome AND senha = :senha');
    ParamByName('nome').AsString := Usuario.Nome;
    ParamByName('senha').AsString := Usuario.Senha;
    Open;
    if not IsEmpty then
      Result := True;
  end;
end;

end.

