unit uProfissionaisControllerLog;

interface

uses
  uProfissionaisLog, uProfissionaisRepositoryLog, System.SysUtils;

type
  TLogController = class
  public
    procedure RegistrarLog(const UsuarioQueExecutouAcao, Profissional, Acao, Detalhes, Cpf: string);
  end;

implementation

procedure TLogController.RegistrarLog(const UsuarioQueExecutouAcao, Profissional, Acao, Detalhes,
  Cpf: string);
var
  ProfLog: TLogRepository;
  Registro: TProfissionalLog;
begin
  Registro := TProfissionalLog.Create;
  try
    Registro.UsuarioQueExecutouAcao := UsuarioQueExecutouAcao;
    Registro.Profissional := Profissional;
    Registro.Acao := Acao;
    Registro.Detalhes := Detalhes;
    Registro.Cpf := Cpf;
    Registro.DataHora := Now;

    ProfLog := TLogRepository.Create;
    try
      ProfLog.Salvar(Registro);
    finally
      ProfLog.Free;
    end;
  finally
    Registro.Free;
  end;
end;

end.
