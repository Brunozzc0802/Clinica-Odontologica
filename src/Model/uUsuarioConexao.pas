unit uUsuarioConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.DAPt,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DAPt.Intf, FireDAC.Comp.DataSet,
  frxSmartMemo, frxClass, frxDBSet, frCoreClasses;

type
  TdmUsuarios = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    queryUsu: TFDQuery;
    queryPacientes: TFDQuery;
    queryProfissionais: TFDQuery;
    queryProcedimentos: TFDQuery;
    queryConsultas: TFDQuery;
    queryRelaConsul: TFDQuery;
    frxReport1: TfrxReport;
    dtRelaConsul: TfrxDBDataset;
    queryRelaProf: TFDQuery;
    frxReport2: TfrxReport;
    dtRelaProf: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
