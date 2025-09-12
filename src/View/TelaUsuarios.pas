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
    pnlUsuarios: TPanel;
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
    pnlBordaBaixoUsuarios: TPanel;
    pnlAzulPrincipal: TPanel;
    procedure btnXUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlPacientesMouseEnter(Sender: TObject);
    procedure pnlPacientesMouseLeave(Sender: TObject);
    procedure ImgPacientesMouseEnter(Sender: TObject);
    procedure ImgPacientesMouseLeave(Sender: TObject);
    procedure lblPacientesMouseEnter(Sender: TObject);
    procedure lblPacientesMouseLeave(Sender: TObject);
    procedure pnlProfissionaisMouseEnter(Sender: TObject);
    procedure pnlProfissionaisMouseLeave(Sender: TObject);
    procedure lblProfissionaisMouseEnter(Sender: TObject);
    procedure lblProfissionaisMouseLeave(Sender: TObject);
    procedure iconProfissionaisMouseEnter(Sender: TObject);
    procedure iconProfissionaisMouseLeave(Sender: TObject);
    procedure pnlConsultasMouseEnter(Sender: TObject);
    procedure pnlConsultasMouseLeave(Sender: TObject);
    procedure lblConsultasMouseEnter(Sender: TObject);
    procedure lblConsultasMouseLeave(Sender: TObject);
    procedure imgConsultasMouseEnter(Sender: TObject);
    procedure imgConsultasMouseLeave(Sender: TObject);
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
    pnlUsuarios.Color := $00F78B2B;
  end;

procedure TPagUsuarios.iconProfissionaisMouseEnter(Sender: TObject);
  begin
     pnlProfissionais.Color := $00F78B2B;
  end;

procedure TPagUsuarios.iconProfissionaisMouseLeave(Sender: TObject);
  begin
     pnlProfissionais.Color := $007C3E05;
  end;

procedure TPagUsuarios.imgConsultasMouseEnter(Sender: TObject);
  begin
     PnlConsultas.Color := $00F78B2B;
  end;

procedure TPagUsuarios.imgConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
  end;

procedure TPagUsuarios.ImgPacientesMouseEnter(Sender: TObject);
  begin
    pnlPacientes.Color := $00F78B2B;
  end;

procedure TPagUsuarios.ImgPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;


procedure TPagUsuarios.lblConsultasMouseEnter(Sender: TObject);
  begin
    PnlConsultas.Color := $00F78B2B;
  end;

procedure TPagUsuarios.lblConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
  end;

procedure TPagUsuarios.lblPacientesMouseEnter(Sender: TObject);
  begin
     pnlPacientes.Color := $00F78B2B;
  end;

procedure TPagUsuarios.lblPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;


procedure TPagUsuarios.lblProfissionaisMouseEnter(Sender: TObject);
  begin
    pnlProfissionais.Color := $00F78B2B;
  end;

procedure TPagUsuarios.lblProfissionaisMouseLeave(Sender: TObject);
  begin
     pnlProfissionais.Color := $007C3E05;
  end;

procedure TPagUsuarios.pnlConsultasMouseEnter(Sender: TObject);
  begin
    PnlConsultas.Color := $00F78B2B;
  end;

procedure TPagUsuarios.pnlConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
  end;

procedure TPagUsuarios.pnlPacientesMouseEnter(Sender: TObject);
  begin
    pnlPacientes.Color := $00F78B2B;
  end;

procedure TPagUsuarios.pnlPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;
procedure TPagUsuarios.pnlProfissionaisMouseEnter(Sender: TObject);
  begin
    pnlProfissionais.Color := $00F78B2B;
  end;

procedure TPagUsuarios.pnlProfissionaisMouseLeave(Sender: TObject);
  begin
    pnlProfissionais.Color := $007C3E05;
  end;

end.
