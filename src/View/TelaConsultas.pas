unit TelaConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Samples.Calendar;

type
  TPagConsultas = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconConsultas: TImage;
    btnX: TImage;
    pnlAzulPrincipal: TPanel;
    imgLogo1: TImage;
    imgLogo2: TImage;
    pnlBotoesDireita: TPanel;
    btnAdd: TPanel;
    lblAddUsu: TLabel;
    btnAddNovo: TPanel;
    Label2: TLabel;
    btnAlterar: TPanel;
    lblAlterarUsu: TLabel;
    btnDeletar: TPanel;
    lblDeletar: TLabel;
    btnCancelar: TPanel;
    lblCancelarUsu: TLabel;
    btnRestaurar: TPanel;
    lblRestaurar: TLabel;
    btnRestaurarNovo: TPanel;
    Label5: TLabel;
    btnLimpar: TPanel;
    lblLimpar: TLabel;
    btnSair: TPanel;
    lblSair: TLabel;
    btnAlterarNovo: TPanel;
    Label3: TLabel;
    pnlAdd: TPanel;
    btnadicionar: TPanel;
    lblAddpaciente: TLabel;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    pnlRestaurar: TPanel;
    imgRestore: TImage;
    Label6: TLabel;
    imgXrestore: TImage;
    sgRestore: TStringGrid;
    btnCRestore: TPanel;
    lblRestore: TLabel;
    cbNomePaci: TComboBox;
    cbNomeProf: TComboBox;
    cbNomeProc: TComboBox;
    Calendar1: TCalendar;
    ComboBox1: TComboBox;
    procedure btnXClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagConsultas: TPagConsultas;

implementation

{$R *.dfm}

procedure TPagConsultas.btnXClick(Sender: TObject);
  begin
    Close;
  end;

end.
