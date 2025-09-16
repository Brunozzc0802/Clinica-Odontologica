unit uUsuarios;

interface

type
  TUsuario = class
  private
    UId: Integer;
    UNome: string;
    USenha: string;
  public
    property Id: Integer read UId write UId;
    property Nome: string read UNome write UNome;
    property Senha: string read USenha write USenha;
  end;

implementation

end.

