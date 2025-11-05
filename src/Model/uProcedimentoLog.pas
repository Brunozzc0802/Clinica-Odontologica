unit uProcedimentoLog;

interface

type
  TProcedimentoLog = class
  private
    PAcao: string;
    PDataHora: TDateTime;
    PProcedimento: string;
    PDetalhes: string;
    PValor: string;
    PDuracao: string;
    PUsuarioQueExecutouAcao: string;
  public
    property Acao: string read PAcao write PAcao;
    property DataHora: TDateTime read PDataHora write PDataHora;
    property Procedimento: string read PProcedimento write PProcedimento;
    property Detalhes: string read PDetalhes write PDetalhes;
    property Valor: string read PValor write PValor;
    property Duracao: string read PDuracao write PDuracao;
    property UsuarioQueExecutouAcao: string read PUsuarioQueExecutouAcao write PUsuarioQueExecutouAcao;
  end;

implementation

end.