unit uUsuarioRepositoryLog;

interface

uses
  uUsuarioLog, System.SysUtils, System.IOUtils;

type
  TLogRepository = class
  public
    procedure Salvar(ALog: TUsuarioLog);
  end;

implementation

procedure TLogRepository.Salvar(ALog: TUsuarioLog);
var
  LogFile: TextFile;
  LogDir, LogPath: string;
begin
   LogDir := 'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica-Odontologica\Logs\';

  if not DirectoryExists(LogDir) then
    ForceDirectories(LogDir);

  LogPath := LogDir + 'usuario_log.txt';

  AssignFile(LogFile, LogPath);
  if FileExists(LogPath) then
    Append(LogFile)
  else
    Rewrite(LogFile);

  WriteLn(LogFile,
    ALog.Usuario + ' | ' +
    ALog.Acao + ' | ' +
    ALog.Detalhes + ' | ' +
    FormatDateTime('yyyy-mm-dd hh:nn:ss', ALog.DataHora)
  );
  CloseFile(LogFile);
end;

end.

