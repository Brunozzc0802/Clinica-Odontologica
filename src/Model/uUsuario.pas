unit uUsuario;

interface

  type TUsuario = class
  private
    AId,AGrupo_id: Int64;
    ANome,ASenha: string;
    AAtivo:Boolean;
  public
    property Id: Int64 read AId write AId;
    property Nome: string read ANome write ANome;
    property Senha: string read ASenha write ASenha;
    property Ativo: Boolean read AAtivo write AAtivo;
    property Grupo_id: Int64 read AGrupo_id write AGrupo_id;
  end;

implementation

end.
