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
    procedure Alterar(AUsuario: TUsuario);
  end;

implementation

{ TUsuarioRepository }

class function TUsuarioRepository.VerificarUsuario(const Usuario: TUsuario): Boolean;
begin
  Result := False;
  with dmUsuarios.FDQuery1 do begin
    Close;
    SQL.Text := 'SELECT * FROM usuarios WHERE nome = :nome AND senha = :senha';
    ParamByName('nome').AsString := Usuario.Nome;
    ParamByName('senha').AsString := Usuario.Senha;
    Open;

    Result := not IsEmpty;
  end;
end;

class function TUsuarioRepository.ListarTodos: TObjectList<TUsuario>;
var
  Usuario: TUsuario;
begin
  Result := TObjectList<TUsuario>.Create(True);
  with dmUsuarios.FDQuery1 do begin
    Close;
    SQL.Text := 'SELECT id, nome, senha, ativo, grupo FROM usuarios WHERE ativo = TRUE';
    Open;

    while not Eof do begin
      Usuario := TUsuario.Create;
      Usuario.Id    := FieldByName('id').AsInteger;
      Usuario.Nome  := FieldByName('nome').AsString;
      Usuario.Senha := FieldByName('senha').AsString;
      Usuario.Ativo := FieldByName('ativo').AsBoolean;
      Usuario.Grupo := FieldByName('grupo').AsString;

      Result.Add(Usuario);
      Next;
    end;
  end;
end;

procedure TUsuarioRepository.Adicionar(AUsuario: TUsuario);
begin
  with dmUsuarios.FDQuery1 do begin
    Close;
    SQL.Text :=
      'INSERT INTO usuarios (nome, senha, ativo, grupo) ' +
      'VALUES (:nome, :senha, :ativo, :grupo)';

    ParamByName('nome').AsString   := AUsuario.Nome;
    ParamByName('senha').AsString  := AUsuario.Senha;
    ParamByName('ativo').AsBoolean := AUsuario.Ativo;
    ParamByName('grupo').AsString  := AUsuario.Grupo;

    ExecSQL;
  end;
end;

procedure TUsuarioRepository.Alterar(AUsuario: TUsuario);
begin
  with dmUsuarios.FDQuery1 do begin
    Close;
    SQL.Text := 'UPDATE usuarios ' + 'SET nome = :nome, senha = :senha, ativo = :ativo, grupo = :grupo ' +
    'WHERE id = :id';

    ParamByName('id').AsInteger      := AUsuario.Id;
    ParamByName('nome').AsString     := AUsuario.Nome;
    ParamByName('senha').AsString    := AUsuario.Senha;
    ParamByName('ativo').AsBoolean   := AUsuario.Ativo;
    ParamByName('grupo').AsString    := AUsuario.Grupo;

    ExecSQL;
  end;
end;

end.

