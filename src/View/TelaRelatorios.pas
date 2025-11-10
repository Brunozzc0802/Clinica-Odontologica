unit TelaRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TPagRelatorios = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconRelatorios: TImage;
    btnX: TImage;
    pnlPrincipal: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Bevel1: TBevel;
    Label1: TLabel;
    Shape4: TShape;
    procedure btnXClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagRelatorios: TPagRelatorios;

implementation

{$R *.dfm}

procedure TPagRelatorios.btnXClick(Sender: TObject);
  begin
    Close;
  end;

end.
