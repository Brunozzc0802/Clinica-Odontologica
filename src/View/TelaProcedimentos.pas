unit TelaProcedimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.Mask, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.Grids, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uProcedimentosController, uProcedimentos,
  System.Generics.Collections;

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
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure CarregarGrid;
    procedure FormShow(Sender: TObject);
    procedure adicionarProcedimento;
    procedure btnadicionarClick(Sender: TObject);
  private
    ProcedimentoLista: TObjectList<TProcedimento>;
    Controller: TProcedimentosController;
  public
    { Public declarations }
  end;

var
  PagProcedimentos: TPagProcedimentos;

implementation

{$R *.dfm}


procedure TPagProcedimentos.FormCreate(Sender: TObject);
  begin
    Controller := TProcedimentosController.Create;
    ProcedimentoLista := TObjectList<TProcedimento>.Create;

    sgProcedimentos.Cells[0,0] := 'ID';
    sgProcedimentos.Cells[1,0] := 'Nome do Procedimento';
    sgProcedimentos.Cells[2,0] := 'Valor';
    sgProcedimentos.Cells[3,0] := 'Duração';

    sgProcedimentos.ColWidths[0] := 50;
    sgProcedimentos.ColWidths[1] := 195;
    sgProcedimentos.ColWidths[2] := 150;
    sgProcedimentos.ColWidths[3] := 140;
  end;

procedure TPagProcedimentos.FormShow(Sender: TObject);
  begin
    CarregarGrid;
  end;

procedure TPagProcedimentos.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(Controller);
    FreeAndNil(ProcedimentoLista);
  end;

procedure TPagProcedimentos.CarregarGrid;
var
  I: Integer;
  begin
    try
      if Assigned(ProcedimentoLista) then
      ProcedimentoLista.Free;
      ProcedimentoLista := Controller.BuscarTodos;

      sgProcedimentos.Cells[0,0] := 'ID';
      sgProcedimentos.Cells[1,0] := 'Nome do Procedimento';
      sgProcedimentos.Cells[2,0] := 'Valor';
      sgProcedimentos.Cells[3,0] := 'Duração';
      sgProcedimentos.RowCount := ProcedimentoLista.Count + 1;

      for I := 0 to ProcedimentoLista.Count - 1 do
      begin
        sgProcedimentos.Cells[0, I + 1] := IntToStr(ProcedimentoLista[I].Id);
        sgProcedimentos.Cells[1, I + 1] := ProcedimentoLista[I].Nome;
        sgProcedimentos.Cells[2, I + 1] := FloatToStr(ProcedimentoLista[I].Valor);
        sgProcedimentos.Cells[3, I + 1] := TimeToStr(ProcedimentoLista[I].Duracao);
      end;
    finally
    end;
  end;


procedure TPagProcedimentos.AdicionarProcedimento;
begin
  if (EdNome.Text = '') or
     (EdValor.Text = '') or
     (EdHora.Time = EncodeTime(0, 0, 0, 0)) then
  begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  try
    Controller.AdicionarProcedimento(
      EdNome.Text,
      StrToFloat(EdValor.Text),
      EdHora.Time
    );

    ShowMessage('Procedimento adicionado com sucesso!');
    CarregarGrid;
      EdNome.Clear;
      EdValor.Clear;
      EdHora.Time := EncodeTime(0,0,0,0);
  except
    on E: Exception do
      ShowMessage('Erro ao adicionar procedimento: ' + E.Message);
  end;
end;

procedure TPagProcedimentos.btnAddClick(Sender: TObject);
  begin
    pnlAdd.Visible := True;
    btnadicionar.Visible := True;
    btnConfirmarAlteracoes.Visible := False;

    EdNome.Clear;
    edValor.Clear;
    edHora.Time := EncodeTime(0, 0, 0, 0);
    EdNome.SetFocus;

    imgLogo2.Visible := True;
    imgLogo1.Visible := False;
  end;

procedure TPagProcedimentos.btnCancelarClick(Sender: TObject);
  begin
    pnlAdd.Visible := False;
    imgLogo1.Visible := True;
    imgLogo2.Visible := False;
  end;

procedure TPagProcedimentos.btnLimparClick(Sender: TObject);
  begin
    if pnlAdd.Visible = True then
    begin
      EdNome.Clear;
      edValor.Clear;
      edHora.Time := EncodeTime(0, 0, 0, 0);
      EdNome.SetFocus;
    end;
  end;

procedure TPagProcedimentos.btnXClick(Sender: TObject);
  begin
    Close;
  end;

procedure TPagProcedimentos.btnAddMouseEnter(Sender: TObject);
  begin
    btnAdd.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnAddMouseLeave(Sender: TObject);
  begin
    btnAdd.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnadicionarClick(Sender: TObject);
  begin
    adicionarProcedimento;
  end;

procedure TPagProcedimentos.btnadicionarMouseEnter(Sender: TObject);
  begin
    btnadicionar.Color := $00C46106;
  end;

procedure TPagProcedimentos.btnadicionarMouseLeave(Sender: TObject);
  begin
    btnadicionar.Color := $007C3E05;
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
    btnCRestore.Color := $00F8973F;
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

end.

