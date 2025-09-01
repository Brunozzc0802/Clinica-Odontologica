unit uControllerUsuarios;

interface

uses
  uUsuario, uConexao, FireDAC.Comp.Client, System.SysUtils;

type
  TUsuarioController = class
  private
    AConexao: TConexao;
  public
    constructor Create;
    destructor Destroy; override;
    function ValidarLogin(AUsuario: TUsuario):Boolean;
  end;

implementation

{ TUsuarioController }

constructor TUsuarioController.Create;
  begin
    AConexao := TConexao.Create;
  end;

destructor TUsuarioController.Destroy;
  begin
    AConexao.free;
    inherited;
  end;

function TUsuarioController.ValidarLogin(AUsuario: TUsuario): Boolean;
  var
    FDQuery: TFDQuery;
  begin
    FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := AConexao.Connection;
    FDQuery.SQL.Text := 'SELECT * FROM usuarios WHERE login = :nome AND senha = :senha';
    FDQuery.ParamByName('nome').AsString := AUsuario.Nome;
    FDQuery.ParamByName('senha').AsString := AUsuario.Senha;
    FDQuery.Open;
    Result := not FDQuery.Eof;
  finally
    FDQuery.Free;
  end;
end;

end.
