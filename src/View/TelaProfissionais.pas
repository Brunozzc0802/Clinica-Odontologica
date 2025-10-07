unit TelaProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, uProfissionaisController, uProfissionais,
  System.Generics.Collections;

type
  TPagProfissionais = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconPacientes: TImage;
    btnX: TImage;
    pnlAzulPrincipal: TPanel;
    imgLogo1: TImage;
    imgLogo2: TImage;
    sgProfissionais: TStringGrid;
    pesquisar: TSearchBox;
    pnlBotoesDireita: TPanel;
    btnAdd: TPanel;
    lblAddUsu: TLabel;
    btnAddNovo: TPanel;
    Label2: TLabel;
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
    btnConsultas: TPanel;
    lblConsultas: TLabel;
    btnLimpar: TPanel;
    lblLimpar: TLabel;
    btnSair: TPanel;
    lblSair: TLabel;
    btnAlterarNovo: TPanel;
    Label3: TLabel;
    pnlAdd: TPanel;
    EdNome: TEdit;
    edCEP: TEdit;
    edEndereco: TEdit;
    btnadicionar: TPanel;
    lblAddpaciente: TLabel;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    edTelefone: TMaskEdit;
    edCPF: TMaskEdit;
    pnlRestaurar: TPanel;
    imgRestore: TImage;
    Label6: TLabel;
    imgXrestore: TImage;
    sgRestore: TStringGrid;
    btnCRestore: TPanel;
    lblRestore: TLabel;
    edEmail: TEdit;
    procedure CarregarGrid;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnXClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnAddMouseEnter(Sender: TObject);
    procedure btnAddMouseLeave(Sender: TObject);
    procedure btnAlterarMouseEnter(Sender: TObject);
    procedure btnAlterarMouseLeave(Sender: TObject);
    procedure btnPesquisarMouseEnter(Sender: TObject);
    procedure btnPesquisarMouseLeave(Sender: TObject);
    procedure btnDeletarMouseEnter(Sender: TObject);
    procedure btnDeletarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnRestaurarMouseEnter(Sender: TObject);
    procedure btnRestaurarMouseLeave(Sender: TObject);
    procedure btnConsultasMouseEnter(Sender: TObject);
    procedure btnConsultasMouseLeave(Sender: TObject);
    procedure btnLimparMouseLeave(Sender: TObject);
    procedure btnLimparMouseEnter(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure adicionarProf;
    procedure btnadicionarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure ConfirmarAlteracoes(Sender: TObject);
    procedure btnConfirmarAlteracoesClick(Sender: TObject);
    procedure btnadicionarMouseEnter(Sender: TObject);
    procedure btnadicionarMouseLeave(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseEnter(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  private
    ProfissionaisLista: TObjectList<TProfissionais>;
    ProfissionalIdalterar: Integer;
  public
    { Public declarations }
  end;

var
  PagProfissionais: TPagProfissionais;

implementation

{$R *.dfm}

{ TPagProfissionais }

procedure TPagProfissionais.adicionarProf;
var
  Controller: TProfissionaisController;
begin
  Controller := TProfissionaisController.Create;
  try

    if (EdNome.Text = '') or (edCPF.Text = '') or (edTelefone.Text = '') or
    (edCEP.Text = '') or (edEmail.Text = '') or (edEndereco.Text = '')
    then begin
      ShowMessage('Preencha todos os campos');
      exit;
    end;

      Controller.AdicionarProfissional(
      edNome.Text,
      edCPF.Text,
      edTelefone.Text,
      edCEP.Text,
      edEndereco.Text,
      edEmail.Text);
    ShowMessage('Profissional adicionado com sucesso!');
    CarregarGrid;
    edNome.clear;
    edCPF.clear;
    edTelefone.clear;
    edCEP.clear;
    edEndereco.clear;
    edEmail.Clear;
  finally
    Controller.Free;
  end;
end;

procedure TPagProfissionais.btnAddClick(Sender: TObject);
  begin
    if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
    end;

    if (btnAlterarNovo.Visible = True) then begin
      EdNome.Clear;
      edCEP.Clear;
      edEndereco.Clear;
      edEmail.Clear;
      edTelefone.Clear;
      edCPF.Clear;
      EdNome.SetFocus;
      sgprofissionais.Row := 0;
      sgprofissionais.Col := 0;
      sgprofissionais.SetFocus;

    if btnNovoPesquisar.Visible = true  then begin
        sgProfissionais.Top := sgProfissionais.Top - (pesquisar.Height + 5);
        sgProfissionais.Height := sgProfissionais.Height + (pesquisar.Height + 5);
        pesquisar.Visible := False;
        btnNovoPesquisar.Visible := False;
      end;

    end;

      btnAlterarNovo.Visible := false;
      btnAddNovo.Visible := True;
      btnNovoPesquisar.Visible := False;
      btnRestaurarNovo.Visible := false;
      btnConfirmarAlteracoes.Visible := false;
      btnadicionar.Visible := True;
      pnlAdd.Visible := True;
      imgLogo2.Visible := True;
      imgLogo1.Visible := False;
      EdNome.SetFocus;
  end;

procedure TPagProfissionais.btnAddMouseEnter(Sender: TObject);
  begin
    btnAdd.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnAddMouseLeave(Sender: TObject);
  begin
    btnadd.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnadicionarClick(Sender: TObject);
  begin
    adicionarProf;
  end;

procedure TPagProfissionais.btnadicionarMouseEnter(Sender: TObject);
  begin
    btnAdicionar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnadicionarMouseLeave(Sender: TObject);
  begin
    btnAdicionar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnAlterarClick(Sender: TObject);
var
  linha: Integer;
  begin
    linha := sgProfissionais.Row;
    if linha <= 0 then
    begin
      ShowMessage('Selecione um profissional para alterar!');
      Exit;
    end;

    if btnNovoPesquisar.Visible = true  then begin
      sgProfissionais.Top := sgProfissionais.Top - (pesquisar.Height + 5);
      sgProfissionais.Height := sgProfissionais.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

    ProfissionalIdalterar := StrToIntDef(sgProfissionais.Cells[0, linha], 0);
    EdNome.Text := sgProfissionais.Cells[1, linha];
    edCPF.Text := sgProfissionais.Cells[2, linha];
    edTelefone.Text := sgProfissionais.Cells[3, linha];
    edEmail.Text := sgProfissionais.Cells[4, linha];
    edCEP.Text := sgProfissionais.Cells[5, linha];
    edendereco.Text := sgProfissionais.Cells[6, linha];

    btnConfirmarAlteracoes.Visible := True;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := True;
    btnAddNovo.Visible := False;
    pnlAdd.Visible := True;
   end;
procedure TPagProfissionais.btnAlterarMouseEnter(Sender: TObject);
  begin
    btnAlterar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnAlterarMouseLeave(Sender: TObject);
  begin
    btnAlterar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnCancelarMouseEnter(Sender: TObject);
  begin
    btnCancelar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnCancelarMouseLeave(Sender: TObject);
  begin
    btncancelar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnConfirmarAlteracoesClick(Sender: TObject);
  begin
    ConfirmarAlteracoes(nil);
  end;

procedure TPagProfissionais.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnConsultasMouseEnter(Sender: TObject);
  begin
    btnConsultas.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnConsultasMouseLeave(Sender: TObject);
  begin
    btnconsultas.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnDeletarMouseEnter(Sender: TObject);
  begin
    btnDeletar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnDeletarMouseLeave(Sender: TObject);
  begin
    btnDeletar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnPesquisarMouseEnter(Sender: TObject);
  begin
    btnPesquisar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnPesquisarMouseLeave(Sender: TObject);
  begin
    btnPesquisar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnLimparMouseEnter(Sender: TObject);
  begin
    btnLimpar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnLimparMouseLeave(Sender: TObject);
  begin
    btnLimpar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnRestaurarMouseEnter(Sender: TObject);
  begin
    btnRestaurar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnRestaurarMouseLeave(Sender: TObject);
  begin
    btnRestaurar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnSairMouseEnter(Sender: TObject);
  begin
    btnSair.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnSairMouseLeave(Sender: TObject);
  begin
    btnSair.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnXClick(Sender: TObject);
  begin
    close;
  end;

procedure TPagProfissionais.CarregarGrid;
  var
  Controller: TProfissionaisController;
  I: Integer;
begin
  Controller := TProfissionaisController.Create;
  try
    if Assigned(ProfissionaisLista) then
    ProfissionaisLista.Free;
    ProfissionaisLista := Controller.BuscarTodos;

    sgProfissionais.Cells[0,0] := 'ID';
    sgProfissionais.Cells[1,0] := 'Nome do Profissional';
    sgProfissionais.Cells[2,0] := 'CPF';
    sgProfissionais.Cells[3,0] := 'Telefone';
    sgProfissionais.Cells[4,0] := 'Cep';
    sgProfissionais.Cells[5,0] := 'Endereço';
    sgProfissionais.Cells[6,0] := 'Email';

    sgProfissionais.RowCount := ProfissionaisLista.Count + 1;

    for I := 0 to ProfissionaisLista.Count - 1 do
    begin
      sgProfissionais.Cells[0, I + 1] := IntToStr(ProfissionaisLista[I].Id);
      sgProfissionais.Cells[1, I + 1] := ProfissionaisLista[I].Nome;
      sgProfissionais.Cells[2, I + 1] := ProfissionaisLista[I].cpf;
      sgProfissionais.Cells[3, I + 1] := ProfissionaisLista[I].telefone;
      sgProfissionais.Cells[4, I + 1] := ProfissionaisLista[I].cep;
      sgProfissionais.Cells[5, I + 1] := ProfissionaisLista[I].endereco;
      sgProfissionais.Cells[6, I + 1] := ProfissionaisLista[I].email;
    end;
  finally
    Controller.Free;
  end;
end;

procedure TPagProfissionais.ConfirmarAlteracoes(Sender: TObject);
var
  Controller: TProfissionaisController;
begin
  if ProfissionalIdalterar = 0 then
  begin
    ShowMessage('Selecione um Profissional para alterar');
    Exit;
  end;
  Controller := TProfissionaisController.Create;
  try
    Controller.AlterarProfissional(
    ProfissionalIdalterar,
    edNome.Text,
    edCpf.Text,
    edTelefone.Text,
    edEmail.Text,
    edCep.Text,
    edEndereco.Text
);


    ShowMessage('Alterações feitas com sucesso!');
    btnAlterarNovo.Visible := False;
    CarregarGrid;
    sgProfissionais.Row := 0;
    sgProfissionais.Col := 0;
    sgProfissionais.SetFocus;
    pnlAdd.Visible := False;

  finally
    Controller.Free;
  end;
end;

procedure TPagProfissionais.FormCreate(Sender: TObject);
  begin
    sgProfissionais.Cells[0,0] := 'ID';
    sgProfissionais.Cells[1,0] := 'Nome do Paciente';
    sgProfissionais.Cells[2,0] := 'CPF';
    sgProfissionais.Cells[3,0] := 'Telefone';
    sgProfissionais.Cells[4,0] := 'Cep';
    sgProfissionais.Cells[5,0] := 'Endereço';
    sgProfissionais.Cells[6,0] := 'Email';

    sgProfissionais.ColWidths[0] := 50;
    sgProfissionais.ColWidths[1] := 175;
    sgProfissionais.ColWidths[2] := 130;
    sgProfissionais.ColWidths[3] := 130;
    sgProfissionais.ColWidths[4] := 110;
    sgProfissionais.ColWidths[5] := 185;
    sgProfissionais.ColWidths[6] := 157;
  end;

procedure TPagProfissionais.FormShow(Sender: TObject);
  begin
    CarregarGrid;
  end;

end.
