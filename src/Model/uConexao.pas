unit uConexao;

interface


uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async, FireDAC.DApt;

  type TConexao = class
    private
    AConnection: TFDConnection;
    public
    constructor Create;
    destructor Destroy;
    function Connection: TFDConnection;
  end;

implementation
 uses
 System.SysUtils;

{ TConexao }

function TConexao.Connection: TFDConnection;
  begin
    Result := AConnection;
  end;

constructor TConexao.Create;
  begin
    AConnection := TFDConnection.Create(nil);
    Connection.DriverName := 'PG';
    with AConnection.Params do
  begin
    Values['Database'] := 'clinicia_odontologica';
    Values['User_Name'] := 'postgres';
    Values['Password'] := 'root';
    Values['Server'] := 'localhost';
    Values['Port'] := '5432';
  end;
  AConnection.Connected := True;
  end;

destructor TConexao.Destroy;
  begin
    AConnection.Free;
  end;

end.
