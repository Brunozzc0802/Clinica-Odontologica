unit uConsultaControllerLog;

interface

uses
  uConsultaLog, uConsultasRepositoryLog, System.SysUtils;

type
  TLogController = class
  public
    procedure RegistrarLog(const UsuarioQueExecutouAcao, Paciente, Profissional, Procedimento, Data, Hora, Acao, Detalhes: string);
  end;

implementation

procedure TLogController.RegistrarLog(const UsuarioQueExecutouAcao, Paciente, Profissional, Procedimento,
  Data, Hora, Acao, Detalhes: string);
var
  ConsLog: TLogRepository;
  Registro: TConsultaLog;
begin
  Registro := TConsultaLog.Create;
  try
    Registro.UsuarioQueExecutouAcao := UsuarioQueExecutouAcao;
    Registro.Paciente := Paciente;
    Registro.Profissional := Profissional;
    Registro.Procedimento := Procedimento;
    Registro.Data := Data;
    Registro.Hora := Hora;
    Registro.Acao := Acao;
    Registro.Detalhes := Detalhes;
    Registro.DataHora := Now;

    ConsLog := TLogRepository.Create;
    try
      ConsLog.Salvar(Registro);
    finally
      ConsLog.Free;
    end;
  finally
    Registro.Free;
  end;
end;

end.
