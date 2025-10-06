unit uProfissionaisRepository;

interface

uses
  uUsuarioConexao, uProfissionais, System.SysUtils,
  System.Generics.Collections, FireDAC.Comp.Client;

type
  TProfissionaisRepository = class
  public
    function ListarTodos: TObjectList<TProfissionais>;
  end;

implementation

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

