unit uProfissionais;

interface

  type
  TProfissionais = class
  private
    PId: integer;
    PNome: string;
    PCpf: string;
    PTelefone: string;
    PCep: string;
    PEmail: string;
    PEndereco: string;
    PAtivo: boolean;
  public
    property Id: integer read PId write PId;
    property Nome: string read PNome write PNome;
    property Cpf: string read PCpf write PCpf;
    property Telefone: string read PTelefone write PTelefone;
    property Cep: string read PCep write PCep;
    property Email: string read PEmail write PEmail;
    property Endereco: string read PEndereco write PEndereco;
    property Ativo: boolean read PAtivo write PAtivo;

  end;

implementation

end.
