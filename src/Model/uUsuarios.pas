unit uUsuarios;

interface

type
  TUsuario = class
  private
    UId: integer;
    UNome: string;
    USenha: string;
    UAtivo: Boolean;
    UGrupo: string;
  public
    property Id: integer read UId write UId;
    property Nome: string read UNome write UNome;
    property Senha: string read USenha write USenha;
    property Ativo: Boolean read UAtivo write UAtivo;
    property Grupo: string read UGrupo write UGrupo;
  end;

implementation

end.
