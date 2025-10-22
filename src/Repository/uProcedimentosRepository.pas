unit uProcedimentosRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  uProcedimentos, uUsuarioConexao;

type
  TProcedimentoRepository = class
  public
    function ListarProcedimentos: TObjectList<TProcedimento>;
    function ListarInativos: TObjectList<TProcedimento>;
    procedure Adicionar(AProcedimento: TProcedimento);
    procedure Alterar(AProcedimento: TProcedimento);
    procedure DesativarProcedimento(const Id: Integer);
    procedure RestaurarProcedimento(const Id: Integer);
  end;

implementation

{ TProcedimentoRepository }

function TProcedimentoRepository.ListarProcedimentos: TObjectList<TProcedimento>;
var
  Procedimento: TProcedimento;
begin
  Result := TObjectList<TProcedimento>.Create(True);
  with dmUsuarios.queryProcedimentos do begin
    Close;
    SQL.Text := 'SELECT id, nome, valor, duracao::TIME as duracao, ativo FROM procedimentos WHERE ativo = TRUE';
    Open;
    while not Eof do begin
      Procedimento := TProcedimento.Create;
      Procedimento.Id := FieldByName('id').AsInteger;
      Procedimento.Nome := FieldByName('nome').AsString;
      Procedimento.Valor := FieldByName('valor').AsFloat;
      Procedimento.Duracao := FieldByName('duracao').AsDateTime;
      Procedimento.Ativo := FieldByName('ativo').AsBoolean;
      Result.Add(Procedimento);
      Next;
    end;
  end;
end;

procedure TProcedimentoRepository.RestaurarProcedimento(const Id: Integer);
  begin
    with dmUsuarios.queryProcedimentos do
    begin
      Close;
      SQL.Text := 'UPDATE procedimentos SET ativo = TRUE WHERE id = :id';
      ParamByName('id').AsInteger := Id;
      ExecSQL;
    end;
  end;

function TProcedimentoRepository.ListarInativos: TObjectList<TProcedimento>;
var
  Procedimento: TProcedimento;
begin
  Result := TObjectList<TProcedimento>.Create(True);
  with dmUsuarios.queryProcedimentos do
  begin
    Close;
    SQL.Text := 'SELECT id, nome, valor, duracao, ativo FROM procedimentos WHERE ativo = FALSE';
    Open;
    while not Eof do begin
      Procedimento := TProcedimento.Create;
      Procedimento.Id := FieldByName('id').AsInteger;
      Procedimento.Nome := FieldByName('nome').AsString;
      Procedimento.Valor := FieldByName('valor').AsFloat;
      Procedimento.Duracao := FieldByName('duracao').AsDateTime;
      Procedimento.Ativo := FieldByName('ativo').AsBoolean;
      Result.Add(Procedimento);
      Next;
    end;
  end;
end;

procedure TProcedimentoRepository.Adicionar(AProcedimento: TProcedimento);
  var
  DuracaoSQL: string;
begin
  with dmUsuarios.queryProcedimentos do begin
    Close;

    // Converte TDateTime para formato INTERVAL do PostgreSQL
    DuracaoSQL := FormatDateTime('hh:nn:ss', AProcedimento.Duracao);

    SQL.Text :=
      'INSERT INTO procedimentos (nome, valor, duracao, ativo) ' +
      'VALUES (:nome, :valor, CAST(:duracao AS INTERVAL), :ativo)';
    ParamByName('nome').AsString   := AProcedimento.Nome;
    ParamByName('valor').AsFloat   := AProcedimento.Valor;
    ParamByName('duracao').AsString := DuracaoSQL;  // Passa como string e faz CAST
    ParamByName('ativo').AsBoolean := AProcedimento.Ativo;
    ExecSQL;
  end;
end;

procedure TProcedimentoRepository.Alterar(AProcedimento: TProcedimento);
begin
  with dmUsuarios.queryProcedimentos do begin
    Close;
    SQL.Text := 'UPDATE procedimentos ' +
                'SET nome = :nome, valor = :valor, duracao = :duracao, ativo = :ativo ' +
                'WHERE id = :id';
    ParamByName('id').AsInteger      := AProcedimento.Id;
    ParamByName('nome').AsString     := AProcedimento.Nome;
    ParamByName('valor').AsFloat     := AProcedimento.Valor;
    ParamByName('duracao').AsDateTime := AProcedimento.Duracao;
    ParamByName('ativo').AsBoolean   := AProcedimento.Ativo;
    ExecSQL;
  end;
end;

procedure TProcedimentoRepository.DesativarProcedimento(const Id: Integer);
  begin
    with dmUsuarios.queryProcedimentos do
    begin
      Close;
      SQL.Text := 'UPDATE procedimentos SET ativo = FALSE WHERE id = :id';
      ParamByName('id').AsInteger := Id;
      ExecSQL;
    end;
  end;

end.
