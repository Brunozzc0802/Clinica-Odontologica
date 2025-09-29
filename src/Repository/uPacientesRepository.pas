unit uPacientesRepository;

interface

uses uUsuarioConexao,uPacientes,  System.SysUtils,
System.Generics.Collections, FireDAC.Comp.Client;

implementation

type
  TPacientesRepository = class
  public
  class function ListarTodos: TObjectList<TPaciente>;
end;

{ TPacientesRepository }

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
      Paciente.Id    := FieldByName('id').AsInteger;
      Paciente.Nome  := FieldByName('nome').AsString;
      Paciente.Cpf := FieldByName('cpf').AsString;
      Paciente.Telefone := FieldByName('telefone').AsString;
      Paciente.Cep := FieldByName('cep').AsString;
      Paciente.DataNascimento := FieldByName('data_nascimento').AsString;
      Paciente.Endereco := FieldByName('endereco').AsString;
      Paciente.Ativo := FieldByName('ativo').AsBoolean;
      Result.Add(Paciente);
      Next;
    end;
  end;
end;

end.
