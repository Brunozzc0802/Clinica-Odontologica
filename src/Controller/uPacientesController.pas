unit uPacientesController;

interface

uses
  uPacientes, uPacientesRepository, System.Generics.Collections, System.SysUtils;

type
  TPacientesController = class
  public
    function BuscarTodos: TObjectList<TPaciente>;
    procedure AdicionarPaciente(const Nome, CPF, telefone, cep, endereco: string; dataNascimento: TDate);
    procedure AlterarPaciente(const Id: Integer; const Nome, CPF, telefone, cep, endereco: string; dataNascimento: TDate);
    procedure DesativarPaciente(const Id: Integer);
  end;

implementation

{ TPacientesController }

procedure TPacientesController.AdicionarPaciente(const Nome, CPF, telefone, cep,
  endereco: string; dataNascimento: TDate);
var
  Paciente: TPaciente;
  RepoPaci: TPacientesRepository;
  begin
    Paciente := TPaciente.Create;
    try
      Paciente.Nome  := Nome;
      Paciente.CPF := cpf;
      Paciente.telefone := telefone;
      Paciente.cep := cep;
      Paciente.endereco := endereco;
      Paciente.dataNascimento := dataNascimento;

      RepoPaci := TPacientesRepository.Create;
      try
        RepoPaci.Adicionar(Paciente);
      finally
        RepoPaci.Free;
      end;
    finally
      Paciente.Free;
    end;
  end;

procedure TPacientesController.AlterarPaciente(const Id: Integer; const Nome, CPF, telefone, cep,
  endereco: string; dataNascimento: TDate);
var
  Paciente: TPaciente;
  RepoPaci: TPacientesRepository;
  begin
    Paciente := TPaciente.Create;
    try
      Paciente.Id := Id;
      Paciente.Nome  := Nome;
      Paciente.CPF := cpf;
      Paciente.telefone := telefone;
      Paciente.cep := cep;
      Paciente.endereco := endereco;
      Paciente.dataNascimento := dataNascimento;

      RepoPaci := TPacientesRepository.Create;
      try
        RepoPaci.Alterar(Paciente);
      finally
        RepoPaci.Free;
      end;
    finally
      Paciente.Free;
    end;
  end;

function TPacientesController.BuscarTodos: TObjectList<TPaciente>;
  begin
    Result := TPacientesRepository.ListarTodos;
  end;

// ---------------- Novo método ----------------
procedure TPacientesController.DesativarPaciente(const Id: Integer);
var
  RepoPaci: TPacientesRepository;
  begin
    RepoPaci := TPacientesRepository.Create;
    try
      RepoPaci.DesativarPaciente(Id);
    finally
      RepoPaci.Free;
    end;
  end;

end.

