unit uPacientesControllerLog;

interface

uses
  uPacienteLog, uPacientesRepositoryLog, System.SysUtils;

type
  TLogController = class
  public
    procedure RegistrarLog(const Paciente, Acao, Detalhes, Cpf: string);
  end;

implementation

procedure TLogController.RegistrarLog(const Paciente, Acao, Detalhes,
  Cpf: string);
var
  PaciLog: TLogRepository;
  Registro: TPacienteLog;
begin
  Registro := TPacienteLog.Create;
  try
    Registro.Paciente := Paciente;
    Registro.Acao := Acao;
    Registro.Detalhes := Detalhes;
    Registro.Cpf := Cpf;
    Registro.DataHora := Now;

    PaciLog := TLogRepository.Create;
    try
      PaciLog.Salvar(Registro);
    finally
      PaciLog.Free;
    end;
  finally
    Registro.Free;
  end;
end;

end.
