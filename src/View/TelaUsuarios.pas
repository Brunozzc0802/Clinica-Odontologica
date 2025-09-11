unit TelaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TPagUsuarios = class(TForm)
    pnlCabecalho: TPanel;
    btnXUsuarios: TSpeedButton;
    bordaCabecalhoUsuarios: TPanel;
    lblTituloUsuarios: TLabel;
    pnlFundoLateral: TPanel;
    linhaUsuarios: TLabel;
    linhaPacientes: TLabel;
    linhaConsultas: TLabel;
    linhaProcedimentos: TLabel;
    linhaRelatorios: TLabel;
    linhaFinal: TLabel;
    linhaProfissionais: TLabel;
    pnlUser: TPanel;
    iconUser: TImage;
    lblUsuarios: TLabel;
    pnlPacientes: TPanel;
    lblPacientes: TLabel;
    ImgPacientes: TImage;
    pnlProfissionais: TPanel;
    iconProfissionais: TImage;
    lblProfissionais: TLabel;
    pnlConsultas: TPanel;
    lblConsultas: TLabel;
    imgConsultas: TImage;
    pnlProcedimentos: TPanel;
    imgProcedimentos: TImage;
    lblProcedimentos: TLabel;
    pnlEncerrarSistema: TPanel;
    imgSair: TImage;
    lblEncerrarSistema: TLabel;
    pnlRelatorios: TPanel;
    ImgRelatorios: TImage;
    lblRelatorios: TLabel;
    procedure btnXUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagUsuarios: TPagUsuarios;

implementation

{$R *.dfm}

procedure TPagUsuarios.btnXUsuariosClick(Sender: TObject);
  begin
    Close;
  end;
procedure TPagUsuarios.FormCreate(Sender: TObject);
  begin
    pnlUser.Color := $00F78B2B;
  end;

end.
