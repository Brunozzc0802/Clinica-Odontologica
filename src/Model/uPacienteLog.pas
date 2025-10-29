unit uPacienteLog;

interface

type
  TPacienteLog = class
  private
    PAcao: string;
    PDataHora: TDateTime;
    PCPF: string;
    PDetalhes: string;
    PPaciente: string;
  public
    property Acao: string read PAcao write PAcao;
    property DataHora: TDateTime read PDataHora write PDataHora;
    property Cpf: string read PCPF write PCPF;
    property Detalhes: string read PDetalhes write PDetalhes;
    property Paciente: string read PPaciente write PPaciente;
  end;

implementation

end.
