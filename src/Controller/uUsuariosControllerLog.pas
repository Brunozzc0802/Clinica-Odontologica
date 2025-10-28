unit uUsuariosControllerLog;

interface

uses
  uUsuarioLog, uUsuarioRepositoryLog, System.SysUtils;

type
  TLogController = class
  public
    procedure RegistrarLog(const Usuario, Acao, Detalhes: string);
  end;

implementation

procedure TLogController.RegistrarLog(const Usuario, Acao, Detalhes: string);
var
  UserLog: TLogRepository;
  Registro: TUsuarioLog;
  begin
    Registro := TUsuarioLog.Create;
    try
      Registro.Usuario := Usuario;
      Registro.Acao := Acao;
      Registro.Detalhes := Detalhes;
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
