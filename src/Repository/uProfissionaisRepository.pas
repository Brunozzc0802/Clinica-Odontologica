unit uProfissionaisRepository;

interface

uses
  uUsuarioConexao, uProfissionais, System.SysUtils,
  System.Generics.Collections, FireDAC.Comp.Client;

type
  TProfissionaisRepository = class
  public
    function ListarTodos: TObjectList<TProfissionais>;
    function ListarInativos: TObjectList<TProfissionais>;
    procedure Adicionar(AProfissional: TProfissionais);
    procedure Alterar(AProfissional: TProfissionais);
    procedure DesativarProfissional(const Id: Integer);
  end;

implementation

procedure TProfissionaisRepository.Adicionar(AProfissional: TProfissionais);
begin
  with dmUsuarios.queryProfissionais do
  begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'INSERT INTO profissionais (nome, cpf, telefone, email, cep, endereco, ativo) ' +
      'VALUES (:nome, :cpf, :telefone, :email, :cep, :endereco, TRUE)';

    ParamByName('nome').AsString     := AProfissional.Nome;
    ParamByName('cpf').AsString      := AProfissional.Cpf;
    ParamByName('telefone').AsString := AProfissional.Telefone;
    ParamByName('email').AsString    := AProfissional.Email;
    ParamByName('cep').AsString      := AProfissional.Cep;
    ParamByName('endereco').AsString := AProfissional.Endereco;
    ExecSQL;
  end;
end;
procedure TProfissionaisRepository.Alterar(AProfissional: TProfissionais);
begin
  with dmUsuarios.queryProfissionais do begin
    Close;
    SQL.Text :=
      'UPDATE profissionais ' + 'SET nome = :nome, ' + 'cpf = :cpf, ' + 'telefone = :telefone, ' + 'email = :email,' +
      'cep = :cep, ' + 'endereco = :endereco, ' + 'ativo = TRUE ' + 'WHERE id = :id';

    ParamByName('id').AsInteger       := AProfissional.Id;
    ParamByName('nome').AsString      := AProfissional.Nome;
    ParamByName('cpf').AsString       := AProfissional.Cpf;
    ParamByName('telefone').AsString  := AProfissional.Telefone;
    ParamByName('email').AsString     := AProfissional.Email;
    ParamByName('cep').AsString       := AProfissional.cep;
    ParamByName('endereco').AsString    := AProfissional.endereco;
    ExecSQL;
  end;
end;

procedure TProfissionaisRepository.DesativarProfissional(const Id: Integer);
  begin
    with dmUsuarios.queryProfissionais do begin
      Close;
      SQL.Text := 'UPDATE profissionais SET ativo = FALSE WHERE id = :id';
      ParamByName('id').AsInteger := Id;
      ExecSQL;
    end;
  end;

function TProfissionaisRepository.ListarInativos: TObjectList<TProfissionais>;
  var
  Profissional: TProfissionais;
begin
  Result := TObjectList<TProfissionais>.Create(True);
  with dmUsuarios.queryProfissionais do begin
    Close;
    SQL.Text := 'SELECT id, nome, cpf, telefone, email, cep, endereco  FROM profissionais WHERE ativo = FALSE';
    Open;

    while not Eof do begin
      Profissional := TProfissionais.Create;
      Profissional.Id := FieldByName('id').AsInteger;
      Profissional.Nome := FieldByName('nome').AsString;
      Profissional.Cpf := FieldByName('cpf').AsString;
      Profissional.Telefone := FieldByName('telefone').AsString;
      Profissional.Email := FieldByName('email').AsString;
      Profissional.Cep := FieldByName('cep').AsString;
      Profissional.Endereco := FieldByName('endereco').AsString;
      Result.Add(Profissional);
      Next;
    end;
  end;
end;


function TProfissionaisRepository.ListarTodos: TObjectList<TProfissionais>;
var
  Profissional: TProfissionais;
begin
  Result := TObjectList<TProfissionais>.Create(True);
  with dmUsuarios.queryProfissionais do
  begin
    Close;
    SQL.Text := 'SELECT id, nome, cpf, telefone, cep, email, endereco FROM profissionais WHERE ativo = TRUE';
    Open;

    while not Eof do
    begin
      Profissional := TProfissionais.Create;
      Profissional.Id := FieldByName('id').AsInteger;
      Profissional.Nome := FieldByName('nome').AsString;
      Profissional.Cpf := FieldByName('cpf').AsString;
      Profissional.Telefone := FieldByName('telefone').AsString;
      Profissional.Cep := FieldByName('cep').AsString;
      Profissional.Email := FieldByName('email').AsString;
      Profissional.Endereco := FieldByName('endereco').AsString;
      Result.Add(Profissional);
      Next;
    end;
  end;
end;

end.

