unit uUsuarioController;

interface

  uses
    uConexao, System.SysUtils, FireDAC.Comp.Client;
  type TUsuarioController = class
    public
      function VerificarUsuario(const Nome, Senha: String): Boolean;
  end;

implementation

{ TUsuarioController }

function TUsuarioController.VerificarUsuario(const Nome, Senha: String): Boolean;
begin
  with dmConexao.FDQueryUsuario do
    begin
      Close;
      Connection := dmConexao.FDConnection;
      SQL.Text := 'SELECT COUNT(*) AS Total FROM usuarios WHERE nome = :nome AND senha = :senha';
      ParamByName('nome').AsString := Nome;
      ParamByName('senha').AsString := Senha;
      Open;
      try
        Result := FieldByName('Total').AsInteger > 0;
      finally
        Close;
      end;
    end;
end;
end.
