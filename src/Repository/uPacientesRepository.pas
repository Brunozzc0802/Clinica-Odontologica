unit uPacientesRepository;

interface

uses uUsuarioConexao,uPacientes,  System.SysUtils,
System.Generics.Collections, FireDAC.Comp.Client;

type
  TPacientesRepository = class
  public
  class function ListarTodos: TObjectList<TPaciente>;
  procedure Adicionar(APaciente: TPaciente);
  procedure Alterar(APaciente: TPaciente);
end;

implementation


{ TPacientesRepository }

procedure TPacientesRepository.Adicionar(APaciente: TPaciente);
begin
  with dmUsuarios.queryPacientes do begin
    Close;
    SQL.Text :=
      'INSERT INTO pacientes (nome, cpf, telefone, cep, endereco, data_nascimento) ' +
      'VALUES (:nome, :cpf, :telefone, :cep, :endereco, :data_nascimento)';

    ParamByName('nome').AsString   := APaciente.Nome;
    ParamByName('cpf').AsString  := APaciente.Cpf;
    ParamByName('telefone').AsString  := APaciente.Telefone;
    ParamByName('cep').AsString  := APaciente.cep;
    ParamByName('data_nascimento').AsDate  := APaciente.DataNascimento;
    ParamByName('endereco').AsString  := APaciente.endereco;

    ExecSQL;
  end;
end;

procedure TPacientesRepository.Alterar(APaciente: TPaciente);
begin
  with dmUsuarios.queryPacientes do
  begin
    Close;
    SQL.Text :=
      'UPDATE pacientes ' + 'SET nome = :nome, ' + 'cpf = :cpf, ' + 'telefone = :telefone, ' +
      'cep = :cep, ' + 'endereco = :endereco, ' + 'data_nascimento = :data_nascimento, ' +
      'ativo = TRUE ' + 'WHERE id = :id';

    ParamByName('id').AsInteger            := APaciente.Id;
    ParamByName('nome').AsString           := APaciente.Nome;
    ParamByName('cpf').AsString            := APaciente.Cpf;
    ParamByName('telefone').AsString       := APaciente.Telefone;
    ParamByName('cep').AsString            := APaciente.Cep;
    ParamByName('endereco').AsString       := APaciente.Endereco;
    ParamByName('data_nascimento').AsDate  := APaciente.DataNascimento;

    ExecSQL;
  end;
end;

class function TPacientesRepository.ListarTodos: TObjectList<TPaciente>;
  var
  Paciente: TPaciente;
begin
  Result := TObjectList<TPaciente>.Create(True);
  with dmUsuarios.queryPacientes do begin
    Close;
    SQL.Text := 'SELECT id, nome, cpf , telefone, cep, data_nascimento, endereco FROM pacientes WHERE ativo = TRUE';
    Open;

    while not Eof do begin
      Paciente := TPaciente.Create;
      Paciente.Id := FieldByName('id').AsInteger;
      Paciente.Nome := FieldByName('nome').AsString;
      Paciente.Cpf := FieldByName('cpf').AsString;
      Paciente.Telefone := FieldByName('telefone').AsString;
      Paciente.Cep := FieldByName('cep').AsString;
      Paciente.DataNascimento := FieldByName('data_nascimento').AsDateTime;
      Paciente.Endereco := FieldByName('endereco').AsString;
      Result.Add(Paciente);
      Next;
    end;
  end;
end;

end.
