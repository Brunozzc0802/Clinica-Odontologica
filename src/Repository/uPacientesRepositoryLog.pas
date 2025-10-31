unit uPacientesRepositoryLog;

interface

uses
  uPacienteLog, System.SysUtils, System.IOUtils;

type
  TLogRepository = class
  public
    procedure Salvar(ALog: TPacienteLog);
  end;

implementation

procedure TLogRepository.Salvar(ALog: TPacienteLog);
var
  LogFile: TextFile;
  LogDir, LogPath, LogLine: string;
  FileHandle: Integer;
begin
  if not Assigned(ALog) then
    Exit;

  try
    LogDir := 'C:\Users\alves.4948\Desktop\CLINICA PROJETO\Clinica-Odontologica\Logs\';

    if not DirectoryExists(LogDir) then
      ForceDirectories(LogDir);

    LogPath := LogDir + 'pacinte_log.txt';

    LogLine := Format('%s | %s | %s | %s | %s',
      [ALog.Paciente,
       ALog.Acao,
       ALog.Detalhes,
       ALog.Cpf,
       FormatDateTime('hh:nn:ss dd-mm-yyyy', ALog.DataHora)]);

    FileHandle := 0;
    AssignFile(LogFile, LogPath);
    try
      if FileExists(LogPath) then
        Append(LogFile)
      else
        Rewrite(LogFile);

      FileHandle := 1; // Marca que arquivo foi aberto

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
