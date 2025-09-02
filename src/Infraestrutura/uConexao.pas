unit uConexao;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.Stan.Option,
  FireDAC.Phys.Intf, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TConexao = class
  private
    AConexao: TFDConnection;
    ADriver: TFDPhysPgDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
  public
    constructor Create;
    destructor Destroy; override;
    function Connection: TFDConnection;
  end;

implementation

{ TConexao }

function TConexao.Connection: TFDConnection;
begin
  Result := AConexao;
end;

constructor TConexao.Create;
begin
  inherited;
  ADriver := TFDPhysPgDriverLink.Create(nil);
  WaitCursor := TFDGUIxWaitCursor.Create(nil);
  AConexao := TFDConnection.Create(nil);
  AConexao.DriverName := 'PG';
  with AConexao.Params do
  begin
    Values['Database'] := 'clinicia_odontologica';
    Values['User_Name'] := 'postgres';
    Values['Password'] := 'root';
    Values['Server'] := 'localhost';
    Values['Port'] := '5432';
  end;
  AConexao.Connected := True;
end;

destructor TConexao.Destroy;
begin
  AConexao.Free;
  ADriver.Free;
  WaitCursor.Free;
  inherited;
end;

end.

