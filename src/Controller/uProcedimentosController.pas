unit uProcedimentosController;

interface

uses
  uProcedimentos, uProcedimentosRepository, System.Generics.Collections, System.SysUtils;

type
  TProcedimentosController = class
  public
    function BuscarTodos: TObjectList<TProcedimento>;
    function BuscarInativos: TObjectList<TProcedimento>;
    procedure AdicionarProcedimento(const Nome: string; const Valor: Double; const Duracao: TTime);
    procedure AlterarProcedimento(const Id: Integer; const Nome: string; const Valor: Double; const Duracao: TTime);
    procedure DesativarProcedimento(const Id: Integer);
    procedure RestaurarProcedimento(const Id: Integer);
  end;

implementation

{ TProcedimentosController }

procedure TProcedimentosController.AdicionarProcedimento(const Nome: string; const Valor: Double; const Duracao: TTime);
var
  Procedimento: TProcedimento;
  RepoProc: TProcedimentoRepository;
  begin
    Procedimento := TProcedimento.Create;
    try
      Procedimento.Nome := Nome;
      Procedimento.Valor := Valor;
      Procedimento.Duracao := Duracao;
      Procedimento.Ativo := True;
      RepoProc := TProcedimentoRepository.Create;
      try
        RepoProc.Adicionar(Procedimento);
      finally
        RepoProc.Free;
      end;
    finally
      Procedimento.Free;
    end;
  end;

procedure TProcedimentosController.AlterarProcedimento(const Id: Integer; const Nome: string; const Valor: Double; const Duracao: TTime);
var
  Procedimento: TProcedimento;
  RepoProc: TProcedimentoRepository;
  begin
    Procedimento := TProcedimento.Create;
    try
      Procedimento.Id := Id;
      Procedimento.Nome := Nome;
      Procedimento.Valor := Valor;
      Procedimento.Duracao := Duracao;
      Procedimento.Ativo := True;
      RepoProc := TProcedimentoRepository.Create;
      try
        RepoProc.Alterar(Procedimento);
      finally
        RepoProc.Free;
      end;
    finally
      Procedimento.Free;
    end;
  end;

function TProcedimentosController.BuscarTodos: TObjectList<TProcedimento>;
var
  RepoProc: TProcedimentoRepository;
  begin
    RepoProc := TProcedimentoRepository.Create;
    try
      Result := RepoProc.ListarProcedimentos;
    finally
      RepoProc.Free;
    end;
  end;

function TProcedimentosController.BuscarInativos: TObjectList<TProcedimento>;
var
  RepoProc: TProcedimentoRepository;
  begin
    RepoProc := TProcedimentoRepository.Create;
    try
      Result := RepoProc.ListarInativos;
    finally
      RepoProc.Free;
    end;
  end;

procedure TProcedimentosController.DesativarProcedimento(const Id: Integer);
var
  RepoProc: TProcedimentoRepository;
  begin
    RepoProc := TProcedimentoRepository.Create;
    try
      RepoProc.DesativarProcedimento(Id);
    finally
      RepoProc.Free;
    end;
  end;

procedure TProcedimentosController.RestaurarProcedimento(const Id: Integer);
var
  RepoProc: TProcedimentoRepository;
  begin
    RepoProc := TProcedimentoRepository.Create;
    try
      RepoProc.RestaurarProcedimento(Id);
    finally
      RepoProc.Free;
    end;
  end;

end.
