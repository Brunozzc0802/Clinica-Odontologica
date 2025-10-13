unit uProcedimentos;

interface

type
  TProcedimento = class
  private
    PId: integer;
    PNome: string;
    PValor: Double;
    PDuracao: TTime;
    PAtivo: Boolean;
  public
    property Id: Integer read PId write PId;
    property Nome: String read PNome write PNome;
    property Valor: Double read PValor write PValor;
    property Ativo: Boolean read PAtivo write PAtivo;
    property Duracao: TTime read PDuracao write PDuracao;
  end;

implementation

end.
