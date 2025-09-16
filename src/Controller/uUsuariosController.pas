unit uUsuariosController;

interface
uses
  uUsuarios, System.SysUtils, FireDAC.Comp.Client, uUsuarioConexao,FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,FireDAC.DApt;

type
  TUsuarioController = class
  public
    class function UsuarioExiste(const Usuario: TUsuario): Boolean;
  end;

implementation

{ TUsuarioController }

class function TUsuarioController.UsuarioExiste(const Usuario: TUsuario): Boolean;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := dmUsuarios.FDConnection1;
    FDQuery.SQL.Text := 'SELECT 1 FROM usuarios WHERE nome = :nome AND senha = :senha';
    FDQuery.ParamByName('nome').AsString := Usuario.Nome;
    FDQuery.ParamByName('senha').AsString := Usuario.Senha;
    FDQuery.Open;

    Result := not FDQuery.IsEmpty;
  finally
    FDQuery.Free;
  end;
end;

end.

