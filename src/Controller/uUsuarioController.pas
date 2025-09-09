unit uUsuarioController;

interface

uses
  uUsuario, uConexao, FireDAC.Comp.Client, System.SysUtils;

type
  TUsuarioController = class
  public
    function AutenticarUsuario(const Nome, Senha: string): Boolean;
    procedure InserirUsuario(Usuario: TUsuario);
  end;

implementation

function TUsuarioController.AutenticarUsuario(const Nome, Senha: string): Boolean;
var
  Qry: TFDQuery;
begin
  Result := False;
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dmConexao.FDConnection;
    Qry.SQL.Text := 'SELECT 1 FROM usuarios WHERE nome = :nome AND senha = :senha';
    Qry.ParamByName('nome').AsString := Nome;
    Qry.ParamByName('senha').AsString := Senha;
    Qry.Open;

    Result := not Qry.IsEmpty;
  finally
    Qry.Free;
  end;
end;

procedure TUsuarioController.InserirUsuario(Usuario: TUsuario);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dmConexao.FDConnection;
    Qry.SQL.Text := 'INSERT INTO usuarios (nome, senha) VALUES (:nome, :senha)';
    Qry.ParamByName('nome').AsString := Usuario.Nome;
    Qry.ParamByName('senha').AsString := Usuario.Senha;
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

end.

