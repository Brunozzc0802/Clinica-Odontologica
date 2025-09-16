unit uUsuarios;

interface

type
  TUsuario = class
  private
    UNome: string;
    USenha: string;
    UAtivo: Boolean;
    UGrupo: Integer;
  public
    property Nome: string read UNome write UNome;
    property Senha: string read USenha write USenha;
    property Ativo: boolean read UAtivo write UAtivo;
    property Grupo: integer read UGrupo write UGrupo;
  end;

implementation

end.

