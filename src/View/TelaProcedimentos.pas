unit TelaProcedimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.Mask, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.Grids, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TPagProcedimentos = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconProcedimentos: TImage;
    btnX: TImage;
    pnlAzulPrincipal: TPanel;
    imgLogo1: TImage;
    imgLogo2: TImage;
    sgProcedimentos: TStringGrid;
    pesquisar: TSearchBox;
    pnlBotoesDireita: TPanel;
    btnAdd: TPanel;
    lblAddUsu: TLabel;
    btnAddNovo: TPanel;
    btnAlterar: TPanel;
    lblAlterarUsu: TLabel;
    btnPesquisar: TPanel;
    lblPesquisar: TLabel;
    btnNovoPesquisar: TPanel;
    Label1: TLabel;
    btnDeletar: TPanel;
    lblDeletarUsu: TLabel;
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
    lblAddprocedimento: TLabel;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    EdNome: TEdit;
    edValor: TMaskEdit;
    pnlRestaurar: TPanel;
    imgRestore: TImage;
    Label6: TLabel;
    imgXrestore: TImage;
    sgRestore: TStringGrid;
    btnCRestore: TPanel;
    lblRestore: TLabel;
    edHora: TTimePicker;
    Label2: TLabel;
    procedure btnAddMouseEnter(Sender: TObject);
    procedure btnAddMouseLeave(Sender: TObject);
    procedure btnPesquisarMouseEnter(Sender: TObject);
    procedure btnPesquisarMouseLeave(Sender: TObject);
    procedure btnDeletarMouseEnter(Sender: TObject);
    procedure btnDeletarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnRestaurarMouseEnter(Sender: TObject);
    procedure btnRestaurarMouseLeave(Sender: TObject);
    procedure btnLimparMouseEnter(Sender: TObject);
    procedure btnLimparMouseLeave(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure btnAlterarMouseEnter(Sender: TObject);
    procedure btnAlterarMouseLeave(Sender: TObject);
    procedure btnadicionarMouseEnter(Sender: TObject);
    procedure btnadicionarMouseLeave(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseEnter(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseLeave(Sender: TObject);
    procedure btnCRestoreMouseEnter(Sender: TObject);
    procedure btnCRestoreMouseLeave(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnXClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagProcedimentos: TPagProcedimentos;

implementation

{$R *.dfm}

procedure TPagProcedimentos.btnAddClick(Sender: TObject);
  begin
    if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
    end;

    if (btnAlterarNovo.Visible = True) then begin
        EdNome.Clear;
        edValor.Clear;
        edHora.Time := EncodeTime(0, 0, 0, 0);
        EdNome.SetFocus;
        sgProcedimentos.Row := 0;
        sgProcedimentos.Col := 0;
        sgProcedimentos.SetFocus;
    end;

    if pesquisar.Visible = true  then begin
        pesquisar.Visible := False;
        sgProcedimentos.Top := sgProcedimentos.Top - (pesquisar.Height + 6);
        sgProcedimentos.Height := sgProcedimentos.Height + (pesquisar.Height + 6);
        btnNovoPesquisar.Visible := False;
        sgProcedimentos.Row := 0;
        sgProcedimentos.Col := 0;
    end;

      btnAlterarNovo.Visible := false;
      btnAddNovo.Visible := True;
      btnNovoPesquisar.Visible := False;
      btnRestaurarNovo.Visible := false;
      btnConfirmarAlteracoes.Visible := false;
      btnadicionar.Visible := True;
      pnlAdd.Visible := True;
      edHora.Time := EncodeTime(0, 0, 0, 0);
      imgLogo2.Visible := True;
      imgLogo1.Visible := False;
      EdNome.SetFocus;
      sgprocedimentos.Row := 0;
      sgprocedimentos.Col := 0;
  end;

procedure TPagProcedimentos.btnAddMouseEnter(Sender: TObject);
  begin
    btnAdd.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnAddMouseLeave(Sender: TObject);
  begin
     btnadd.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnadicionarMouseEnter(Sender: TObject);
  begin
    btnadicionar.Color := $00C46106;
  end;

procedure TPagProcedimentos.btnadicionarMouseLeave(Sender: TObject);
  begin
    btnAdicionar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnAlterarMouseEnter(Sender: TObject);
  begin
    btnAlterar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnAlterarMouseLeave(Sender: TObject);
  begin
    btnAlterar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnCancelarMouseEnter(Sender: TObject);
  begin
    btnCancelar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnCancelarMouseLeave(Sender: TObject);
  begin
    btnCancelar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnCRestoreMouseEnter(Sender: TObject);
  begin
    btnCRestore.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnCRestoreMouseLeave(Sender: TObject);
  begin
    btnCrestore.Color :=  $00F8973F;
  end;

procedure TPagProcedimentos.btnDeletarMouseEnter(Sender: TObject);
  begin
    btnDeletar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnDeletarMouseLeave(Sender: TObject);
  begin
    btnDeletar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnLimparMouseEnter(Sender: TObject);
  begin
    btnLimpar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnLimparMouseLeave(Sender: TObject);
  begin
    btnLimpar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnPesquisarMouseEnter(Sender: TObject);
  begin
    btnPesquisar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnPesquisarMouseLeave(Sender: TObject);
  begin
    btnPesquisar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnRestaurarMouseEnter(Sender: TObject);
  begin
    btnRestaurar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnRestaurarMouseLeave(Sender: TObject);
  begin
    btnRestaurar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnSairMouseEnter(Sender: TObject);
  begin
    btnSair.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnSairMouseLeave(Sender: TObject);
  begin
    btnSair.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnXClick(Sender: TObject);
  begin
    Close;
  end;

procedure TPagProcedimentos.FormClose(Sender: TObject;var Action: TCloseAction);
  begin
    pnlAdd.Visible := False;
    btnAddNovo.visible := false;
    pnlAdd.Visible := False;
    btnAlterarNovo.Visible := False;
    btnPesquisar.Visible := False;
    btnRestaurarNovo.Visible := False;
    pnlRestaurar.Visible := False;
    imgLogo2.Visible := False;
    imgLogo1.Visible := True;
  end;

procedure TPagProcedimentos.FormCreate(Sender: TObject);
  begin
    sgProcedimentos.Cells[0,0] := 'ID';
    sgProcedimentos.Cells[1,0] := 'Nome do Procedimento';
    sgProcedimentos.Cells[2,0] := 'Valor';
    sgProcedimentos.Cells[3,0] := 'Duração';

    sgProcedimentos.ColWidths[0] := 50;
    sgProcedimentos.ColWidths[1] := 195;
    sgProcedimentos.ColWidths[2] := 150;
    sgProcedimentos.ColWidths[3] := 140;
  end;

end.
