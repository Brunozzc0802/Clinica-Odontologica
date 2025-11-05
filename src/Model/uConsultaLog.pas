unit uConsultaLog;

interface

type
  TConsultaLog = class
  private
    CAcao: string;
    CDataHora: TDateTime;
    CPaciente: string;
    CProfissional: string;
    CProcedimento: string;
    CData: string;
    CHora: string;
    CDetalhes: string;
    CUsuarioQueExecutouAcao: string;
  public
    property Acao: string read CAcao write CAcao;
    property DataHora: TDateTime read CDataHora write CDataHora;
    property Paciente: string read CPaciente write CPaciente;
    property Profissional: string read CProfissional write CProfissional;
    property Procedimento: string read CProcedimento write CProcedimento;
    property Data: string read CData write CData;
    property Hora: string read CHora write CHora;
    property Detalhes: string read CDetalhes write CDetalhes;
    property UsuarioQueExecutouAcao: string read CUsuarioQueExecutouAcao write CUsuarioQueExecutouAcao;
  end;

implementation

end.