unit uUsuarioController;

interface

uses
  uConexao, System.SysUtils;

type
  TUsuarioController = class
  public
    function VerificarUsuario(const Nome, Senha: String): Boolean;
  end;

implementation

{ TUsuarioController }

function TUsuarioController.VerificarUsuario(const Nome, Senha: String): Boolean;
begin
  Result := False;
  with dmConexao.FDQueryUsuario do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM usuarios WHERE nome = :nome AND senha = :senha');
    ParamByName('nome').AsString := Nome;
    ParamByName('senha').AsString := Senha;
    Open;

    if not IsEmpty then
      Result := True;
  end;
end;

end.

