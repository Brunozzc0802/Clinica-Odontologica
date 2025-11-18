unit uLogSimples;

interface

procedure RegistrarLogSimples(const Mensagem: string);

implementation

uses System.SysUtils, System.IOUtils, System.Classes;

procedure RegistrarLogSimples(const Mensagem: string);
var
  ArquivoLog: TextFile;
  CaminhoLog: string;
begin
  try
    CaminhoLog := 'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica-Odontologica\Logs\log_sistema.txt';

    try
      // Cria diretório se não existe
      if not DirectoryExists(ExtractFilePath(CaminhoLog)) then
        ForceDirectories(ExtractFilePath(CaminhoLog));

      // Abre ou cria arquivo
      AssignFile(ArquivoLog, CaminhoLog);

      if FileExists(CaminhoLog) then
        Append(ArquivoLog)
      else
        Rewrite(ArquivoLog);

      // Escreve no arquivo
      WriteLn(ArquivoLog, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + Mensagem);

      // Fecha arquivo
      CloseFile(ArquivoLog);

    except
      // Se falhar, tenta criar arquivo simples
      try
        TFile.WriteAllText(CaminhoLog + '_fallback.txt',
          FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + ' - ' + Mensagem + #13#10,
          TEncoding.UTF8);
      except
        // Se nem assim funcionar, ignora silenciosamente
      end;
    end;

  except
    // Ignora qualquer erro no log para não travar o sistema
  end;
end;

end.