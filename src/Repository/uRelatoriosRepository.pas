unit uRelatoriosRepository;

interface

uses
  uUsuarioConexao, uProfissionais, uProcedimentos, System.SysUtils,
  System.Generics.Collections, FireDAC.Comp.Client;

type
  TRelatoriosRepository = class
  public
    function BuscarProfissionaisAtivos: TObjectList<TProfissionais>;
    function BuscarProcedimentosAtivos: TObjectList<TProcedimento>;
    function GerarRelatorioConsultasPorPeriodo(DataInicio, DataFim: TDateTime): TFDQuery;
    function GerarRelatorioPorProfissional(ProfissionalId: integer; DataInicio, DataFim: TDateTime): TFDQuery;
    function GerarRelatorioPorProcedimento(ProcedimentoId: integer; DataInicio, DataFim: TDateTime): TFDQuery;
    function GerarRelatorioConsultasPorData(DataSelecionada: TDateTime): TFDQuery;
    function ContarConsultasConcluidas: Integer;
    function ContarConsultasAgendadas: Integer;
    function ContarConsultasCanceladas: Integer;
  end;

implementation

function TRelatoriosRepository.BuscarProfissionaisAtivos: TObjectList<TProfissionais>;
var
  Profissional: TProfissionais;
begin
  Result := TObjectList<TProfissionais>.Create(True);
  try
    with dmUsuarios.queryProfissionais do begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT id, nome FROM profissionais WHERE ativo = TRUE ORDER BY nome';
      Open;

      while not Eof do begin
        Profissional := TProfissionais.Create;
        Profissional.Id := FieldByName('id').AsInteger;
        Profissional.Nome := FieldByName('nome').AsString;
        Result.Add(Profissional);
        Next;
      end;
    end;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao buscar profissionais: ' + E.Message);
    end;
  end;
end;

function TRelatoriosRepository.BuscarProcedimentosAtivos: TObjectList<TProcedimento>;
var
  Procedimento: TProcedimento;
begin
  Result := TObjectList<TProcedimento>.Create(True);
  try
    with dmUsuarios.queryProcedimentos do begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT id, nome FROM procedimentos WHERE ativo = TRUE ORDER BY nome';
      Open;

      while not Eof do begin
        Procedimento := TProcedimento.Create;
        Procedimento.Id := FieldByName('id').AsInteger;
        Procedimento.Nome := FieldByName('nome').AsString;
        Result.Add(Procedimento);
        Next;
      end;
    end;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao buscar procedimentos: ' + E.Message);
    end;
  end;
end;

function TRelatoriosRepository.GerarRelatorioConsultasPorPeriodo(DataInicio, DataFim: TDateTime): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmUsuarios.FDConnection1;

  with Result do begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT c.data, c.horas, p.nome as paciente_nome, prof.nome as profissional_nome, ' +
      'proc.nome as procedimento_nome, proc.valor ' +
      'FROM consultas c ' +
      'INNER JOIN pacientes p ON c.paciente_id = p.id ' +
      'INNER JOIN profissionais prof ON c.profissional_id = prof.id ' +
      'INNER JOIN procedimentos proc ON c.procedimento_id = proc.id ' +
      'WHERE c.data BETWEEN :data_inicio AND :data_fim ' +
      'AND c.ativo = TRUE ' +
      'ORDER BY c.data, c.horas';

    ParamByName('data_inicio').AsDate := DataInicio;
    ParamByName('data_fim').AsDate := DataFim;
    Open;
  end;
end;

function TRelatoriosRepository.GerarRelatorioPorProfissional(ProfissionalId: integer; DataInicio, DataFim: TDateTime): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmUsuarios.FDConnection1;

  with Result do begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT c.data, c.horas, p.nome as paciente_nome, ' +
      'proc.nome as procedimento_nome, proc.valor ' +
      'FROM consultas c ' +
      'INNER JOIN pacientes p ON c.paciente_id = p.id ' +
      'INNER JOIN procedimentos proc ON c.procedimento_id = proc.id ' +
      'WHERE c.profissional_id = :profissional_id ' +
      'AND c.data BETWEEN :data_inicio AND :data_fim ' +
      'AND c.ativo = TRUE ' +
      'ORDER BY c.data, c.horas';

    ParamByName('profissional_id').AsInteger := ProfissionalId;
    ParamByName('data_inicio').AsDate := DataInicio;
    ParamByName('data_fim').AsDate := DataFim;
    Open;
  end;
end;

function TRelatoriosRepository.GerarRelatorioPorProcedimento(ProcedimentoId: integer; DataInicio, DataFim: TDateTime): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmUsuarios.FDConnection1;

  with Result do begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT c.data, c.horainicio, c.horafim, p.nome as paciente_nome, ' +
      'prof.nome as profissional_nome, proc.valor ' +
      'FROM consultas c ' +
      'INNER JOIN pacientes p ON c.paciente_id = p.id ' +
      'INNER JOIN profissionais prof ON c.profissional_id = prof.id ' +
      'INNER JOIN procedimentos proc ON c.procedimento_id = proc.id ' +
      'WHERE c.procedimento_id = :procedimento_id ' +
      'AND c.data BETWEEN :data_inicio AND :data_fim ' +
      'AND c.ativo = TRUE ' +
      'ORDER BY c.data, c.horainicio';

    ParamByName('procedimento_id').AsInteger := ProcedimentoId;
    ParamByName('data_inicio').AsDate := DataInicio;
    ParamByName('data_fim').AsDate := DataFim;
    Open;
  end;
end;

function TRelatoriosRepository.GerarRelatorioConsultasPorData(DataSelecionada: TDateTime): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := dmUsuarios.FDConnection1;

  with Result do begin
    Close;
    SQL.Clear;
    SQL.Text :=
      'SELECT c.data, c.horainicio, c.horafim, p.nome as paciente_nome, ' +
      'prof.nome as profissional_nome, proc.nome as procedimento_nome, proc.valor ' +
      'FROM consultas c ' +
      'INNER JOIN pacientes p ON c.paciente_id = p.id ' +
      'INNER JOIN profissionais prof ON c.profissional_id = prof.id ' +
      'INNER JOIN procedimentos proc ON c.procedimento_id = proc.id ' +
      'WHERE c.data = :data_selecionada AND c.ativo = TRUE ' +
      'ORDER BY c.horainicio';

    ParamByName('data_selecionada').AsDate := DataSelecionada;
    Open;
  end;
end;

function TRelatoriosRepository.ContarConsultasConcluidas: Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := dmUsuarios.FDConnection1;

    with Query do begin
      Close;
      SQL.Clear;
      SQL.Text :=
        'SELECT COUNT(*) as total FROM consultas ' +
        'WHERE ativo = TRUE AND ( ' +
        '  (data < CURRENT_DATE) OR ' +
        '  (data = CURRENT_DATE AND horafim < CURRENT_TIME) ' +
        ')';

      Open;

      Result := FieldByName('total').AsInteger;
    end;
  finally
    Query.Free;
  end;
end;

function TRelatoriosRepository.ContarConsultasAgendadas: Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := dmUsuarios.FDConnection1;

    with Query do begin
      Close;
      SQL.Clear;
      SQL.Text :=
        'SELECT COUNT(*) as total FROM consultas ' +
        'WHERE ativo = TRUE AND ( ' +
        '  (data > CURRENT_DATE) OR ' +
        '  (data = CURRENT_DATE AND horainicio > CURRENT_TIME) ' +
        ')';

      Open;

      Result := FieldByName('total').AsInteger;
    end;
  finally
    Query.Free;
  end;
end;

function TRelatoriosRepository.ContarConsultasCanceladas: Integer;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := dmUsuarios.FDConnection1;

    with Query do begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT COUNT(*) as total FROM consultas WHERE ativo = FALSE';
      Open;

      Result := FieldByName('total').AsInteger;
    end;
  finally
    Query.Free;
  end;
end;

end.