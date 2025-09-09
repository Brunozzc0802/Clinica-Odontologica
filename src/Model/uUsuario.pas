unit uUsuario;

interface

  type
  TUsuario = class
  private
    uID: Integer;
    uNome: string;
    uSenha: string;
  public
    property ID: Integer read uID write uID;
    property Nome: string read uNome write uNome;
    property Senha: string read uSenha write uSenha;
  end;

implementation

end.
