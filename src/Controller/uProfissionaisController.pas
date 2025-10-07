unit uProfissionaisController;

interface

uses
  uProfissionais, uProfissionaisRepository, System.Generics.Collections, System.SysUtils;

type
  TProfissionaisController = class
  public
    function BuscarTodos: TObjectList<TProfissionais>;
    procedure AdicionarProfissional(const Nome, CPF, telefone,email, cep, endereco: string);
  end;

implementation

{ TProfissionaisController }

procedure TProfissionaisController.AdicionarProfissional(const Nome, CPF, telefone, email, cep, endereco: string);
var
  Profissional: TProfissionais;
  RepoProf: TProfissionaisRepository;
  begin
    Profissional := TProfissionais.Create;
    try
      Profissional.Nome  := Nome;
      Profissional.CPF := cpf;
      Profissional.telefone := telefone;
      Profissional.Email := email;
      Profissional.cep := cep;
      Profissional.endereco := endereco;

      RepoProf := TProfissionaisRepository.Create;
      try
        RepoProf.Adicionar(Profissional);
      finally
        RepoProf.Free;
      end;
    finally
      profissional.Free;
    end;
  end;

function TProfissionaisController.BuscarTodos: TObjectList<TProfissionais>;
var
  RepoProf: TProfissionaisRepository;
begin
  RepoProf := TProfissionaisRepository.Create;
  try
    Result := RepoProf.ListarTodos;
  finally
    RepoProf.Free;
  end;
end;

end.

