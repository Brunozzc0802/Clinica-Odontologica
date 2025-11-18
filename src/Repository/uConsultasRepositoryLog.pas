unit uConsultasRepositoryLog;

interface

uses
  uConsultaLog, System.SysUtils, System.IOUtils;

type
  TLogRepository = class
  public
    procedure Salvar(ALog: TConsultaLog);
  end;

implementation

procedure TLogRepository.Salvar(ALog: TConsultaLog);
var
  LogFile: TextFile;
  LogDir, LogPath, LogLine: string;
  FileHandle: Integer;
begin
  if not Assigned(ALog) then
    Exit;

  try
    LogDir := 'C:\Users\bruno\OneDrive\Desktop\Projeto empresa\Clinica-Odontologica\Logs\';

    if not DirectoryExists(LogDir) then
      ForceDirectories(LogDir);

    LogPath := LogDir + 'consulta_log.txt';

    LogLine := Format('Usuario: %s | %s | Paciente: %s | Profissional: %s | Procedimento: %s | Dia: %s | Horário: %s | %s', [
      ALog.UsuarioQueExecutouAcao,
      ALog.Acao,
      ALog.Paciente,
      ALog.Profissional,
      ALog.Procedimento,
      ALog.Data,
      ALog.Hora,
      FormatDateTime('hh:nn:ss dd-mm-yyyy', ALog.DataHora)
    ]);

    FileHandle := 0;
    AssignFile(LogFile, LogPath);
    try
      if FileExists(LogPath) then
        Append(LogFile)
      else
        Rewrite(LogFile);

      FileHandle := 1;

      WriteLn(LogFile, LogLine);

      CloseFile(LogFile);
      FileHandle := 0;
    except
      on E: Exception do begin
        if FileHandle = 1 then begin
          try
            CloseFile(LogFile);
          except
          end;
        end;
        raise Exception.Create('Erro ao salvar log: ' + E.Message);
      end;
    end;
  except
    on E: Exception do
      raise;
  end;
end;

end.