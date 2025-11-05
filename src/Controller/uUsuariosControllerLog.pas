unit uUsuariosControllerLog;

interface

uses
  uUsuarioLog, uUsuarioRepositoryLog, System.SysUtils;

type
  TLogController = class
  public
    procedure RegistrarLog(const UsuarioQueExecutouAcao, Usuario, Acao, Detalhes, Grupo: string);
  end;

implementation

procedure TLogController.RegistrarLog(const UsuarioQueExecutouAcao, Usuario, Acao, Detalhes,
  Grupo: string);
var
  UserLog: TLogRepository;
  Registro: TUsuarioLog;
begin
  Registro := TUsuarioLog.Create;
  try
    Registro.UsuarioQueExecutouAcao := UsuarioQueExecutouAcao;
    Registro.Usuario := Usuario;
    Registro.Acao := Acao;
    Registro.Detalhes := Detalhes;
    Registro.Grupo := Grupo;
    Registro.DataHora := Now;

    UserLog := TLogRepository.Create;
    try
      UserLog.Salvar(Registro);
    finally
      UserLog.Free;
    end;
  finally
    Registro.Free;
  end;
end;

end.
