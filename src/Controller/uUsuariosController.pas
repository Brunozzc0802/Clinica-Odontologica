unit uUsuariosController;

interface

uses
  uUsuarios, uUsuarioRepository, System.Generics.Collections;

type
  TUsuarioController = class
  public
    function VerificarUsuario(const Nome, Senha: string): Boolean;
    function BuscarTodos: TObjectList<TUsuario>;
    procedure AdicionarUsuario(const Nome, Senha, Grupo: string; Ativo: Boolean);
    procedure AlterarUsuario(const Id: Integer; const Nome, Senha, Grupo: string; Ativo: Boolean);
  end;

implementation

{ TUsuarioController }

function TUsuarioController.VerificarUsuario(const Nome, Senha: string): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.Nome := Nome;
    Usuario.Senha := Senha;
    Result := TUsuarioRepository.VerificarUsuario(Usuario);
  finally
    Usuario.Free;
  end;
end;

function TUsuarioController.BuscarTodos: TObjectList<TUsuario>;
begin
  Result := TUsuarioRepository.ListarTodos;
end;

procedure TUsuarioController.AdicionarUsuario(const Nome, Senha, Grupo: string; Ativo: Boolean);
var
  Usuario: TUsuario;
  RepoUsu: TUsuarioRepository;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.Nome  := Nome;
    Usuario.Senha := Senha;
    Usuario.Grupo := Grupo;
    Usuario.Ativo := Ativo;

    RepoUsu := TUsuarioRepository.Create;
    try
      RepoUsu.Adicionar(Usuario);
    finally
      RepoUsu.Free;
    end;
  finally
    Usuario.Free;
  end;
end;

procedure TUsuarioController.AlterarUsuario(const Id: Integer; const Nome, Senha, Grupo: string; Ativo: Boolean);
var
  Usuario: TUsuario;
  RepoUsu: TUsuarioRepository;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.Id    := Id;
    Usuario.Nome  := Nome;
    Usuario.Senha := Senha;
    Usuario.Grupo := Grupo;
    Usuario.Ativo := Ativo;

    RepoUsu := TUsuarioRepository.Create;
    try
      RepoUsu.Alterar(Usuario);
    finally
      RepoUsu.Free;
    end;
  finally
    Usuario.Free;
  end;
end;


end.

