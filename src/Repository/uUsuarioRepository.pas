unit uUsuarioRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  uUsuarios, uUsuarioConexao;

type
  TUsuarioRepository = class
  public
    class function VerificarUsuario(const Usuario: TUsuario): Boolean;
    class function ListarTodos: TObjectList<TUsuario>;
    procedure Adicionar(AUsuario: TUsuario);
  end;

implementation

{ TUsuarioRepository }

class function TUsuarioRepository.VerificarUsuario(const Usuario: TUsuario): Boolean;
begin
  Result := False;
  with dmUsuarios.FDQuery1 do
  begin
    Close;
    SQL.Text := 'SELECT * FROM usuarios WHERE nome = :nome AND senha = :senha';
    ParamByName('nome').AsString := Usuario.Nome;
    ParamByName('senha').AsString := Usuario.Senha;
    Open;

    Result := not IsEmpty;
  end;
end;

procedure TUsuarioRepository.Adicionar(AUsuario: TUsuario);
begin
 with dmUsuarios.FDQuery1 do
begin
  SQL.Clear;
  SQL.Add('INSERT INTO usuarios (id, nome, senha, ativo, grupo) ');
  SQL.Add('VALUES (:id,:nome, :senha, :ativo, :grupo)');
  ParamByName('nome').AsString  := AUsuario.Nome;
  ParamByName('senha').AsString := AUsuario.Senha;
  ParamByName('ativo').AsBoolean := AUsuario.Ativo;
  ParamByName('grupo').AsString := AUsuario.Grupo;
  ExecSQL;
end;

end;

class function TUsuarioRepository.ListarTodos: TObjectList<TUsuario>;
var
  Usuario: TUsuario;
begin
  Result := TObjectList<TUsuario>.Create(True);
  with dmUsuarios.FDQuery1 do begin
    Close;
    SQL.Text := 'SELECT nome, senha, ativo, grupo FROM usuarios';
    Open;

    while not Eof do begin
      Usuario := TUsuario.Create;
      Usuario.Id := FieldByName('id').AsInteger;
      Usuario.Nome  := FieldByName('nome').AsString;
      Usuario.Senha := FieldByName('senha').AsString;
      Usuario.Ativo := FieldByName('ativo').AsBoolean;
      Usuario.Grupo := FieldByName('grupo').AsString;

      Result.Add(Usuario);
      Next;
    end;
  end;
end;

end.

