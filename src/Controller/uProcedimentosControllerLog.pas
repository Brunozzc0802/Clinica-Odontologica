unit uProcedimentosControllerLog;

interface

uses
  uProcedimentoLog, uProcedimentosRepositoryLog, System.SysUtils;

type
  TLogController = class
  public
    procedure RegistrarLog(const UsuarioQueExecutouAcao, Procedimento, Acao, Detalhes, Valor, Duracao: string);
  end;

implementation

procedure TLogController.RegistrarLog(const UsuarioQueExecutouAcao, Procedimento, Acao, Detalhes,
  Valor, Duracao: string);
var
  ProcLog: TLogRepository;
  Registro: TProcedimentoLog;
begin
  Registro := TProcedimentoLog.Create;
  try
    Registro.UsuarioQueExecutouAcao := UsuarioQueExecutouAcao;
    Registro.Procedimento := Procedimento;
    Registro.Acao := Acao;
    Registro.Detalhes := Detalhes;
    Registro.Valor := Valor;
    Registro.Duracao := Duracao;
    Registro.DataHora := Now;

    ProcLog := TLogRepository.Create;
    try
      ProcLog.Salvar(Registro);
    finally
      ProcLog.Free;
    end;
  finally
    Registro.Free;
  end;
end;

end.