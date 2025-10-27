unit uConsultasRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  uPacientes, uProfissionais, uProcedimentos, uUsuarioConexao, uConsultas;

type
  TConsultaRepository = class
  public
    function ListarPacientes: TObjectList<TPaciente>;
    function ListarProfissionais: TObjectList<TProfissionais>;
    function ListarProcedimentos: TObjectList<TProcedimento>;
    function ListarConsultas: TObjectList<TConsulta>;
    function DuracaoProcedimento(IdProcedimento: Integer): Integer;
  end;

implementation

{ TConsultaRepository }

function TConsultaRepository.DuracaoProcedimento(IdProcedimento: Integer): Integer;
  var
  DuracaoTime: TDateTime;
  Horas, Minutos, Segundos, MS: Word;
begin
  with dmUsuarios.queryProcedimentos do begin
    Close;
    SQL.Text := 'SELECT duracao FROM procedimentos WHERE id = :id';
    ParamByName('id').AsInteger := IdProcedimento;
    Open;

    if not Eof then begin
      DuracaoTime := FieldByName('duracao').AsDateTime;
      DecodeTime(DuracaoTime, Horas, Minutos, Segundos, MS);
      Result := Horas * 60 + Minutos; // converte tudo para minutos
    end else begin
      Result := 0;
    end;
  end;
end;

function TConsultaRepository.ListarConsultas: TObjectList<TConsulta>;
var
  Consulta: TConsulta;
begin
  Result := TObjectList<TConsulta>.Create(True);
  with dmUsuarios.queryConsultas do
  begin
    Close;
    SQL.Text :=
      'SELECT ' +
      '  c.id, ' +
      '  c.paciente_id, p.nome AS nome_paciente, ' +
      '  c.profissional_id, pr.nome AS nome_profissional, ' +
      '  c.procedimento_id, proc.nome AS nome_procedimento, ' +
      '  c.data, c.horainicio, c.horafim, c.ativo ' +
      'FROM consultas c ' +
      'INNER JOIN pacientes p ON c.paciente_id = p.id ' +
      'INNER JOIN profissionais pr ON c.profissional_id = pr.id ' +
      'INNER JOIN procedimentos proc ON c.procedimento_id = proc.id ' +
      'WHERE c.ativo = TRUE ' +
      'ORDER BY c.data, c.horainicio';
    Open;

    while not Eof do
    begin
      Consulta := TConsulta.Create;
      Consulta.Id := FieldByName('id').AsInteger;
      Consulta.PacienteId := FieldByName('paciente_id').AsInteger;
      Consulta.ProfissionalId := FieldByName('profissional_id').AsInteger;
      Consulta.ProcedimentoId := FieldByName('procedimento_id').AsInteger;
      Consulta.Data := FieldByName('data').AsDateTime;
      Consulta.HoraInicio := FieldByName('horainicio').AsDateTime;
      Consulta.HoraFim := FieldByName('horafim').AsDateTime;
      Consulta.Ativo := FieldByName('ativo').AsBoolean;

      // Nomes extras para exibição no grid
      Consulta.NomePaciente := FieldByName('nome_paciente').AsString;
      Consulta.NomeProfissional := FieldByName('nome_profissional').AsString;
      Consulta.NomeProcedimento := FieldByName('nome_procedimento').AsString;

      Result.Add(Consulta);
      Next;
    end;
  end;
end;

function TConsultaRepository.ListarPacientes: TObjectList<TPaciente>;
var
  Paciente: TPaciente;
begin
  Result := TObjectList<TPaciente>.Create(True);
  with dmUsuarios.queryPacientes do begin
    Close;
    SQL.Text := 'SELECT id, nome FROM pacientes WHERE ativo = TRUE ORDER BY nome';
    Open;

    while not Eof do begin
      Paciente := TPaciente.Create;
      Paciente.Id := FieldByName('id').AsInteger;
      Paciente.Nome := FieldByName('nome').AsString;
      Result.Add(Paciente);
      Next;
    end;
  end;
end;

function TConsultaRepository.ListarProfissionais: TObjectList<TProfissionais>;
var
  Profissional: TProfissionais;
begin
  Result := TObjectList<TProfissionais>.Create(True);
  with dmUsuarios.queryProfissionais do begin
    Close;
    SQL.Text := 'SELECT id, nome FROM profissionais WHERE ativo = TRUE ORDER BY nome';
    Open;

    while not Eof do
    begin
      Profissional := TProfissionais.Create;
      Profissional.Id := FieldByName('id').AsInteger;
      Profissional.Nome := FieldByName('nome').AsString;
      Result.Add(Profissional);
      Next;
    end;
  end;
end;

function TConsultaRepository.ListarProcedimentos: TObjectList<TProcedimento>;
var
  Procedimento: TProcedimento;
begin
  Result := TObjectList<TProcedimento>.Create(True);
  with dmUsuarios.queryProcedimentos do
  begin
    Close;
    SQL.Text := 'SELECT id, nome, valor, duracao::TIME as duracao, ativo FROM procedimentos WHERE ativo = TRUE ORDER BY nome';
    Open;

    while not Eof do
    begin
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

end.
