unit uUsuariosController;

interface

uses
  uUsuarios, uUsuarioRepository, System.Generics.Collections, System.SysUtils;

type
  TUsuarioController = class
  public
    function VerificarUsuario(const Nome, Senha: string; out Msg: string): TUsuario;
    function BuscarTodos: TObjectList<TUsuario>;
    function BuscarInativos: TObjectList<TUsuario>;
    procedure AdicionarUsuario(const Nome, Senha, Grupo: string; Ativo: Boolean);
    procedure AlterarUsuario(const Id: Integer; const Nome, Senha, Grupo: string; Ativo: Boolean);
    procedure DeletarUsuario(AUsuario: TUsuario);
    procedure RestaurarUsuario(AUsuario: TUsuario);
  end;

implementation

{ TUsuarioController }

function TUsuarioController.VerificarUsuario(const Nome, Senha: string; out Msg: string): TUsuario;
var
  RepoUsu: TUsuarioRepository;
begin
  Result := nil;
  Msg := '';
  RepoUsu := TUsuarioRepository.Create;
  try
    Result := RepoUsu.VerificarUsuario(Nome, Senha);

    if Result = nil then
    begin
      Msg := 'Usuário ou senha inválidos.';
      Exit;
    end;

    if not Result.Ativo then
    begin
      Msg := 'Este usuário está inativo.';
      FreeAndNil(Result);
      Exit;
    end;

    Msg := 'Login bem-sucedido!';
  finally
    RepoUsu.Free;
  end;
end;

function TUsuarioController.BuscarInativos: TObjectList<TUsuario>;
var
RepoUsu: TUsuarioRepository;
  begin
    RepoUsu := TUsuarioRepository.Create;
    try
      Result := RepoUsu.ListarInativos;
    finally
      RepoUsu.Free;
    end;
  end;

function TUsuarioController.BuscarTodos: TObjectList<TUsuario>;
var
RepoUsu: TUsuarioRepository;
  begin
    RepoUsu := TUsuarioRepository.Create;
    try
      Result := RepoUsu.ListarTodos;
    finally
      RepoUsu.Free;
    end;
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


procedure TUsuarioController.RestaurarUsuario(AUsuario: TUsuario);
var
  RepoUsu: TUsuarioRepository;
begin
  RepoUsu := TUsuarioRepository.Create;
  try
    AUsuario.Ativo := True;
    RepoUsu.Alterar(AUsuario);
  finally
    RepoUsu.Free;
  end;
end;

end.

