unit uConsultasRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  System.DateUtils, uConsultas, uUsuarioConexao;

type
  THorarioDisponivel = record
    Horario: TTime;
    Disponivel: Boolean;
    MotivoIndisponivel: string;
  end;

  TConsultaRepository = class
  public
    function ObterDuracaoProcedimento(AProcedimentoId: Integer): TTime;
    function ObterHorariosDisponiveis(AProfissionalId: Integer; AData: TDate; AProcedimentoId: Integer): TArray<THorarioDisponivel>;
    function HorarioOcupado(AProfissionalId: Integer; AData: TDate; AHora: TTime; ADuracao: TTime): Boolean;
    procedure Adicionar(AConsulta: TConsulta);
    procedure Alterar(AConsulta: TConsulta);
    procedure Cancelar(const Id: Integer);
  end;

implementation

{ TConsultaRepository }

function TConsultaRepository.ObterDuracaoProcedimento(AProcedimentoId: Integer): TTime;
begin
  Result := 0;
  with dmUsuarios.queryConsultas do
  begin
    Close;
    SQL.Text := 'SELECT duracao::TIME as duracao FROM procedimentos WHERE id = :id';
    ParamByName('id').AsInteger := AProcedimentoId;
    Open;

    if not IsEmpty then
      Result := FieldByName('duracao').AsDateTime
    else
      Result := EncodeTime(0, 30, 0, 0); // Default 30 minutos
  end;
end;

function TConsultaRepository.ObterHorariosDisponiveis(AProfissionalId: Integer; AData: TDate; AProcedimentoId: Integer): TArray<THorarioDisponivel>;
var
  HoraInicio, HoraFim: TTime;
  IntervaloMinutos: Integer;
  HorarioAtual: TDateTime;
  ListaHorarios: TList<THorarioDisponivel>;
  Horario: THorarioDisponivel;
  I: Integer;
  Duracao: TTime;
  DuracaoMinutos: Integer;
begin
  ListaHorarios := TList<THorarioDisponivel>.Create;
  try
    Duracao := ObterDuracaoProcedimento(AProcedimentoId);
    DuracaoMinutos := HourOf(Duracao) * 60 + MinuteOf(Duracao);

    HoraInicio := EncodeTime(8, 0, 0, 0);
    HoraFim := EncodeTime(18, 0, 0, 0);
    IntervaloMinutos := 30;

    HorarioAtual := HoraInicio;


    while HorarioAtual < HoraFim do begin
      Horario.Horario := HorarioAtual;
      Horario.MotivoIndisponivel := '';

      if HorarioOcupado(AProfissionalId, AData, HorarioAtual, Duracao) then begin
        Horario.Disponivel := False;
        Horario.MotivoIndisponivel := 'Horário ocupado';
      end else if IncMinute(HorarioAtual, DuracaoMinutos) > HoraFim then begin
        Horario.Disponivel := False;
        Horario.MotivoIndisponivel := 'Fora do horário de atendimento';
      end else begin
        Horario.Disponivel := True;
      end;

      ListaHorarios.Add(Horario);
      HorarioAtual := IncMinute(HorarioAtual, IntervaloMinutos);
    end;

    SetLength(Result, ListaHorarios.Count);
    for I := 0 to ListaHorarios.Count - 1 do
      Result[I] := ListaHorarios[I];
  finally
    ListaHorarios.Free;
  end;
end;

function TConsultaRepository.HorarioOcupado(AProfissionalId: Integer; AData: TDate; AHora: TTime; ADuracao: TTime): Boolean;
var
  DuracaoMinutos: Integer;
  HorarioFim: TTime;
begin
  Result := False;

  DuracaoMinutos := HourOf(ADuracao) * 60 + MinuteOf(ADuracao);
  HorarioFim := IncMinute(AHora, DuracaoMinutos);

  with dmUsuarios.queryConsultas do begin
    Close;
    SQL.Text :=
      'SELECT COUNT(*) as total ' +
      'FROM consultas c ' +
      'INNER JOIN procedimentos proc ON proc.id = c.procedimento_id ' +
      'WHERE c.profissional_id = :profissional_id ' +
      '  AND c.data = :data ' +
      '  AND c.ativo = TRUE ' +
      '  AND ( ' +
      // Caso 1: Consulta existente começa durante o período que queremos agendar
      '    (c.horario >= :hora_inicio AND c.horario < :hora_fim) OR ' +
      // Caso 2: Consulta existente termina durante o período que queremos agendar
      '    (c.horario + proc.duracao > :hora_inicio AND c.horario + proc.duracao <= :hora_fim) OR ' +
      // Caso 3: Consulta existente engloba todo o período que queremos agendar
      '    (c.horario <= :hora_inicio AND c.horario + proc.duracao >= :hora_fim) ' +
      '  )';

    ParamByName('profissional_id').AsInteger := AProfissionalId;
    ParamByName('data').AsDate := AData;
    ParamByName('hora_inicio').AsTime := AHora;
    ParamByName('hora_fim').AsTime := HorarioFim;
    Open;

    Result := FieldByName('total').AsInteger > 0;
  end;
end;

procedure TConsultaRepository.Adicionar(AConsulta: TConsulta);
var
  Duracao: TTime;
  DuracaoMinutos: Integer;
begin
  // Obter duração do procedimento
  Duracao := ObterDuracaoProcedimento(AConsulta.ProcedimentoId);
  DuracaoMinutos := HourOf(Duracao) * 60 + MinuteOf(Duracao);

  // Verificar se horário está disponível
  if HorarioOcupado(AConsulta.ProfissionalId, AConsulta.Data, AConsulta.HorarioInicio, Duracao) then
    raise Exception.Create('Horário já está ocupado!');

  with dmUsuarios.queryConsultas do begin
    Close;
    SQL.Text :=
      'INSERT INTO consultas (profissional_id, paciente_id, procedimento_id, data, horario, ativo) ' +
      'VALUES (:profissional_id, :paciente_id, :procedimento_id, :data, :horario, :ativo)';

    ParamByName('profissional_id').AsInteger := AConsulta.ProfissionalId;
    ParamByName('paciente_id').AsInteger := AConsulta.PacienteId;
    ParamByName('procedimento_id').AsInteger := AConsulta.ProcedimentoId;
    ParamByName('data').AsDate := AConsulta.Data;
    ParamByName('horario').AsTime := AConsulta.HorarioInicio;
    ParamByName('ativo').AsBoolean := True;
    ExecSQL;
  end;
end;

procedure TConsultaRepository.Alterar(AConsulta: TConsulta);
var
  Duracao: TTime;
begin
  // Obter duração do procedimento
  Duracao := ObterDuracaoProcedimento(AConsulta.ProcedimentoId);

  // Verificar disponibilidade (exceto a própria consulta)
  with dmUsuarios.queryConsultas do begin
    Close;
    SQL.Text :=
      'SELECT COUNT(*) as total ' +
      'FROM consultas c ' +
      'INNER JOIN procedimentos proc ON proc.id = c.procedimento_id ' +
      'WHERE c.profissional_id = :profissional_id ' +
      '  AND c.data = :data ' +
      '  AND c.id <> :id_atual ' +
      '  AND c.ativo = TRUE ' +
      '  AND ( ' +
      '    (c.horario >= :hora_inicio AND c.horario < :hora_fim) OR ' +
      '    (c.horario + proc.duracao > :hora_inicio AND c.horario + proc.duracao <= :hora_fim) OR ' +
      '    (c.horario <= :hora_inicio AND c.horario + proc.duracao >= :hora_fim) ' +
      '  )';

    ParamByName('profissional_id').AsInteger := AConsulta.ProfissionalId;
    ParamByName('data').AsDate := AConsulta.Data;
    ParamByName('id_atual').AsInteger := AConsulta.Id;
    ParamByName('hora_inicio').AsTime := AConsulta.HorarioInicio;
    ParamByName('hora_fim').AsTime := IncMinute(AConsulta.HorarioFim, HourOf(Duracao) * 60 + MinuteOf(Duracao));
    Open;

    if FieldByName('total').AsInteger > 0 then
      raise Exception.Create('Horário já está ocupado!');
  end;

  with dmUsuarios.queryConsultas do begin
    Close;
    SQL.Text :=
      'UPDATE consultas ' +
      'SET profissional_id = :profissional_id, ' +
      '    paciente_id = :paciente_id, ' +
      '    procedimento_id = :procedimento_id, ' +
      '    data = :data, ' +
      '    horario = :horario ' +
      'WHERE id = :id';

    ParamByName('id').AsInteger := AConsulta.Id;
    ParamByName('profissional_id').AsInteger := AConsulta.ProfissionalId;
    ParamByName('paciente_id').AsInteger := AConsulta.PacienteId;
    ParamByName('procedimento_id').AsInteger := AConsulta.ProcedimentoId;
    ParamByName('data').AsDate := AConsulta.Data;
  end;
end;

procedure TConsultaRepository.Cancelar(const Id: Integer);
begin
  with dmUsuarios.queryConsultas do begin
    Close;
    SQL.Text := 'UPDATE consultas SET ativo = FALSE WHERE id = :id';
    ParamByName('id').AsInteger := Id;
    ExecSQL;
  end;
end;

end.
