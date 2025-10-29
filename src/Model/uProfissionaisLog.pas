unit uProfissionaisLog;

interface

type
  TProfissionalLog = class
  private
    PAcao: string;
    PDataHora: TDateTime;
    PCPF: string;
    PDetalhes: string;
    PProfissional: string;
  public
    property Acao: string read PAcao write PAcao;
    property DataHora: TDateTime read PDataHora write PDataHora;
    property Cpf: string read PCPF write PCPF;
    property Detalhes: string read PDetalhes write PDetalhes;
    property Profissional: string read PProfissional write PProfissional;
  end;

implementation

end.
