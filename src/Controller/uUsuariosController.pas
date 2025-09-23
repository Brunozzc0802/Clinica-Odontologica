unit uUsuariosController;

interface

uses
  uUsuarios, uUsuarioRepository, System.Generics.Collections, System.SysUtils;

type
  TUsuarioController = class
  public
    function VerificarUsuario(const Nome, Senha: string; out Msg: string): Boolean;
    function BuscarTodos: TObjectList<TUsuario>;
    procedure AdicionarUsuario(const Nome, Senha, Grupo: string; Ativo: Boolean);
    procedure AlterarUsuario(const Id: Integer; const Nome, Senha, Grupo: string; Ativo: Boolean);
    procedure DeletarUsuario(AUsuario: TUsuario);
  end;

implementation

{ TUsuarioController }

function TUsuarioController.VerificarUsuario(const Nome, Senha: string; out Msg: string): Boolean;
var
  Usuario: TUsuario;
begin
  Result := False;
  Msg := '';
  Usuario := TUsuarioRepository.VerificarUsuario(Nome, Senha);
  if Usuario = nil then begin
    Msg := 'Usu�rio ou senha inv�lidos.';
    Exit;
  end;

  if not Usuario.Ativo then begin
    Msg := 'Est� Usu�rio Est� Inativo';
    Usuario.Free;
    Exit;
  end;

  // Login bem-sucedido
  Result := True;
  Msg := 'Login bem-sucedido!';
  Usuario.Free;
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

procedure TUsuarioController.DeletarUsuario(AUsuario: TUsuario);
var
  RepoUsu: TUsuarioRepository;
begin
  RepoUsu := TUsuarioRepository.Create;
  try
    AUsuario.Ativo := False;
    RepoUsu.Alterar(AUsuario);
  finally
    RepoUsu.Free;
  end;
end;


end.

