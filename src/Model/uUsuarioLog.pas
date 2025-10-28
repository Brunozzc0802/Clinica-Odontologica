unit uUsuarioLog;

interface

type
  TUsuarioLog = class
  private
    UAcao: string;
    UDataHora: TDateTime;
    UDetalhes: string;
    UUsuario: string;
  public
    property Acao: string read UAcao write UAcao;
    property DataHora: TDateTime read UDataHora write UDataHora;
    property Detalhes: string read UDetalhes write UDetalhes;
    property Usuario: string read UUsuario write UUsuario;
  end;

implementation

end.
