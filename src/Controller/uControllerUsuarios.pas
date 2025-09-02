unit uControllerUsuarios;

interface

uses
  uUsuario, FireDAC.Comp.Client, System.SysUtils;

type
  TUsuarioController = class
  private
  public
    ControllerConexao: TFDConnection;
    constructor Create(AConexao: TFDConnection);
    function ValidarLogin(Nome, Senha: string): TUsuario;
  end;

implementation

{ TUsuarioController }

constructor TUsuarioController.Create(AConexao: TFDConnection);
begin
  ControllerConexao := AConexao;
end;

function TUsuarioController.ValidarLogin(Nome, Senha: string): TUsuario;
var
  Query: TFDQuery;
begin
  Result := nil;
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := ControllerConexao;
    Query.SQL.Text := 'SELECT * FROM usuarios WHERE nome=:nome AND senha=:senha AND ativo=true';
    Query.ParamByName('nome').AsString := Nome;
    Query.ParamByName('senha').AsString := Senha;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result := TUsuario.Create;
      Result.Nome := Query.FieldByName('nome').AsString;
      Result.Senha := Query.FieldByName('senha').AsString;
    end;

  finally
    Query.Free;
  end;
end;
end.

