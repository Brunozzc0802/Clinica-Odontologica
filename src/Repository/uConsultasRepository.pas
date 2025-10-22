unit uConsultasRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  uConsultas, uUsuarioConexao;

type
  TConsultaRepository = class
  public
    function ListarTodas: TObjectList<TConsulta>;
    procedure Adicionar(AConsulta: TConsulta);

    // NOVO método
    function HorarioOcupado(AProfissionalId: Integer; AData: TDate; AHora: TTime; ADuracao: TTime): Boolean;
  end;

implementation

{ TConsultaRepository }

function TConsultaRepository.ListarTodas: TObjectList<TConsulta>;
var
  Consulta: TConsulta;
begin
  Result := TObjectList<TConsulta>.Create(True);
  with dmUsuarios.queryConsultas do
  begin
    Close;
    SQL.Text := 'SELECT id, profissional_id, paciente_id, procedimento_id, data, horario, ativo FROM consultas';
    Open;

    while not Eof do
    begin
      Consulta := TConsulta.Create;
      Consulta.Id := FieldByName('id').AsInteger;
      Consulta.ProfissionalId := FieldByName('profissional_id').AsInteger;
      Consulta.PacienteId := FieldByName('paciente_id').AsInteger;
      Consulta.ProcedimentoId := FieldByName('procedimento_id').AsInteger;
      Consulta.Data := FieldByName('data').AsDateTime;
      Consulta.Horario := FieldByName('horario').AsDateTime;
      Consulta.Ativo := FieldByName('ativo').AsBoolean;
      Result.Add(Consulta);
      Next;
    end;
  end;
end;

procedure TConsultaRepository.Adicionar(AConsulta: TConsulta);
begin
  with dmUsuarios.queryConsultas do
  begin
    Close;
    SQL.Text := 'INSERT INTO consultas (profissional_id, paciente_id, procedimento_id, data, horario, ativo) ' +
                'VALUES (:profissional_id, :paciente_id, :procedimento_id, :data, :horario, :ativo)';
    ParamByName('profissional_id').AsInteger := AConsulta.ProfissionalId;
    ParamByName('paciente_id').AsInteger := AConsulta.PacienteId;
    ParamByName('procedimento_id').AsInteger := AConsulta.ProcedimentoId;
    ParamByName('data').AsDate := AConsulta.Data;
    ParamByName('horario').AsTime := AConsulta.Horario;
    ParamByName('ativo').AsBoolean := AConsulta.Ativo;
    ExecSQL;
  end;
end;

function TConsultaRepository.HorarioOcupado(AProfissionalId: Integer; AData: TDate; AHora: TTime; ADuracao: TTime): Boolean;
var
  Lista: TObjectList<TConsulta>;
  Consulta: TConsulta;
  HoraInicio, HoraFim: TDateTime;
begin
  Result := False;
  Lista := ListarTodas;
  try
    for Consulta in Lista do
    begin
      if (Consulta.ProfissionalId = AProfissionalId) and (Consulta.Data = AData) then
      begin
        HoraInicio := Consulta.Horario;
        HoraFim := HoraInicio + ADuracao;

        // Verifica sobreposição de horários
        if (AHora < HoraInicio + (Consulta.Horario - HoraInicio)) and (AHora + ADuracao > HoraInicio) then
        begin
          Result := True;
          Exit;
        end;
      end;
    end;
  finally
    Lista.Free;
  end;
end;

end.

