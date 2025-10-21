unit TelaProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, uProfissionaisController, uProfissionais,
  System.Generics.Collections;

type
  TPagProfissionais = class(TForm)
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
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconPacientes: TImage;
    btnX: TImage;
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
    procedure btnRestaurarClick(Sender: TObject);
    procedure CarregarInativos;
    procedure imgXrestoreClick(Sender: TObject);
    procedure btnCRestoreMouseEnter(Sender: TObject);
    procedure btnCRestoreMouseLeave(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure EdNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edTelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pesquisarChange(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure sgProfissionaisDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure ConfirmarRestauracao;
    procedure btnCRestoreClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OrdenarGrid;
    procedure sgRestoreDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
  private
    ProfissionaisLista: TObjectList<TProfissionais>;
    ProfissionalIdalterar: Integer;
    Controller: TProfissionaisController;
    procedure PesquisarProf(const Filtro: string);
  public
    { Public declarations }
  end;

var
  PagProfissionais: TPagProfissionais;

implementation

{$R *.dfm}

{ TPagProfissionais }


procedure TPagProfissionais.CarregarInativos;
var
  I: Integer;
begin
  try
    if Assigned(ProfissionaisLista) then
    ProfissionaisLista.Free;
    ProfissionaisLista := Controller.BuscarInativos;

    sgRestore.Cells[0,0] := 'ID';
    sgRestore.Cells[1,0] := 'Nome do Paciente';
    sgRestore.Cells[2,0] := 'CPF';
    sgRestore.Cells[3,0] := 'Telefone';
    sgRestore.Cells[4,0] := 'Cep';
    sgRestore.Cells[5,0] := 'Data de nascimento';
    sgRestore.Cells[6,0] := 'Endereço';

    sgRestore.RowCount := ProfissionaisLista.Count + 1;

    for I := 0 to ProfissionaisLista.Count - 1 do
    begin
      sgRestore.Cells[0, I + 1] := IntToStr(ProfissionaisLista[I].Id);
      sgRestore.Cells[1, I + 1] := ProfissionaisLista[I].Nome;
      sgRestore.Cells[2, I + 1] := ProfissionaisLista[I].cpf;
      sgRestore.Cells[3, I + 1] := ProfissionaisLista[I].telefone;
      sgRestore.Cells[4, I + 1] := ProfissionaisLista[I].Email;
      sgRestore.Cells[5, I + 1] := ProfissionaisLista[I].cep;
      sgRestore.Cells[6, I + 1] := ProfissionaisLista[I].endereco;
    end;
  finally

  end;
end;

procedure TPagProfissionais.adicionarProf;
  begin
    try
      if (EdNome.Text = '') or (edCPF.Text = '') or (edTelefone.Text = '') or
        (edCEP.Text = '') or (edEmail.Text = '') or (edEndereco.Text = '')
      then begin
        ShowMessage('Preencha todos os campos');
        Exit;
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
        pnlAdd.Visible := False;
    finally
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
      end;

    if pesquisar.Visible = true  then begin
        pesquisar.Visible := False;
        sgProfissionais.Top := sgProfissionais.Top - (pesquisar.Height + 6);
        sgProfissionais.Height := sgProfissionais.Height + (pesquisar.Height + 6);
        btnNovoPesquisar.Visible := False;
        sgprofissionais.Row := 0;
        sgprofissionais.Col := 0;
    end;

      btnAlterarNovo.Visible := false;
      btnAddNovo.Visible := True;
      btnNovoPesquisar.Visible := False;
      btnRestaurarNovo.Visible := false;
      btnConfirmarAlteracoes.Visible := false;
      btnadicionar.Visible := True;
      EdNome.Clear;
      edCPF.Clear;
      edTelefone.Clear;
      edCEP.Clear;
      edEndereco.Clear;
      edEmail.Clear;
      pnlAdd.Visible := True;
      imgLogo2.Visible := True;
      imgLogo1.Visible := False;
      EdNome.SetFocus;
      sgprofissionais.Row := 0;
      sgprofissionais.Col := 0;
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
    btnAdicionar.Color := $00C46106;
  end;

procedure TPagProfissionais.btnadicionarMouseLeave(Sender: TObject);
  begin
    btnAdicionar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnAlterarClick(Sender: TObject);
var
  linha: Integer;
  begin

    if btnaddNovo.Visible = True then  begin
      btnAddNovo.Visible := False;
    end;

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

procedure TPagProfissionais.btnCancelarClick(Sender: TObject);
  begin
    pnlAdd.Visible := False;
    btnAddNovo.Visible := False;
    btnRestaurarNovo.Visible := False;
    pnlRestaurar.Visible := false;
    btnAlterarNovo.Visible := False;
    imgLogo1.Visible := True;
    imgLogo2.visible := False;
    if pesquisar.Visible = true then begin
      sgProfissionais.Top := sgProfissionais.Top - (pesquisar.Height + 5);
      sgProfissionais.Height := sgProfissionais.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;
    sgProfissionais.Row := 0;
    sgProfissionais.Col := 0;
    sgProfissionais.SetFocus;
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
    btnConfirmarAlteracoes.Color := $00C46106;
  end;

procedure TPagProfissionais.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnCRestoreClick(Sender: TObject);
  begin
    ConfirmarRestauracao;
  end;

procedure TPagProfissionais.btnCRestoreMouseEnter(Sender: TObject);
  begin
    btnCRestore.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnCRestoreMouseLeave(Sender: TObject);
  begin
    btnCrestore.Color :=  $00F8973F;
  end;

procedure TPagProfissionais.btnDeletarClick(Sender: TObject);
var
  Id: Integer;
  begin
    if btnAlterarNovo.Visible = True then begin
      btnAlterarNovo.Visible := False;
      pnlAdd.Visible := False;
    end;

    Id := StrToIntDef(sgProfissionais.Cells[0, sgProfissionais.Row], 0);
    if Id > 0 then begin
      Controller.DesativarProfissional(Id);
      ShowMessage('Profissional deletado com sucesso!');
      CarregarGrid;
      sgProfissionais.Row := 0;
      sgProfissionais.Col := 0;
      sgProfissionais.SetFocus;
    end else begin
      ShowMessage('Selecione um profissional para deletar.');
    end;
  end;

procedure TPagProfissionais.btnDeletarMouseEnter(Sender: TObject);
  begin
    btnDeletar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnDeletarMouseLeave(Sender: TObject);
  begin
    btnDeletar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnPesquisarClick(Sender: TObject);
  begin
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := False;
    btnNovoPesquisar.Visible := True;
    pnlAdd.Visible := false;
    imgLogo2.Visible := false;
    imgLogo1.Visible := True;

    if not pesquisar.Visible then begin
      pesquisar.Visible := True;
      sgProfissionais.Top := pesquisar.Top + pesquisar.Height + 8;
      sgProfissionais.Height := sgProfissionais.Height - (pesquisar.Height + 8);
      pesquisar.SetFocus;
    end;

    sgprofissionais.Row := 0;
    sgprofissionais.Col := 0;
  end;

procedure TPagProfissionais.btnPesquisarMouseEnter(Sender: TObject);
  begin
    btnPesquisar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnPesquisarMouseLeave(Sender: TObject);
  begin
    btnPesquisar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnLimparClick(Sender: TObject);
  begin
    if pnlAdd.Visible = True then begin
      EdNome.Clear;
      edCPF.Clear;
      edTelefone.Clear;
      edCEP.Clear;
      edEndereco.Clear;
      edEmail.Clear;
      edNome.SetFocus;
      sgprofissionais.Row := 0;
      sgprofissionais.Col := 0;
    end;
  end;

procedure TPagProfissionais.btnLimparMouseEnter(Sender: TObject);
  begin
    btnLimpar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnLimparMouseLeave(Sender: TObject);
  begin
    btnLimpar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnRestaurarClick(Sender: TObject);
  begin
    if pnlAdd.Visible = True then begin
      pnlAdd.Visible := false;
    end;

    if btnNovoPesquisar.Visible = true  then begin
      sgProfissionais.Top := sgProfissionais.Top - (pesquisar.Height + 5);
      sgProfissionais.Height := sgProfissionais.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

    btnRestaurarNovo.Visible := True;
    CarregarInativos;
    sgRestore.Row := 0;
    sgRestore.Col := 0;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := false;
    pnlRestaurar.Visible := True;
    sgRestore.SetFocus;

    sgProfissionais.Cells[0,0] := 'ID';
    sgProfissionais.Cells[1,0] := 'Nome do Profissional';
    sgProfissionais.Cells[2,0] := 'CPF';
    sgProfissionais.Cells[3,0] := 'Telefone';
    sgProfissionais.Cells[4,0] := 'Cep';
    sgProfissionais.Cells[5,0] := 'Endereço';
    sgProfissionais.Cells[6,0] := 'Email';

    sgRestore.ColWidths[0] := 50;
    sgRestore.ColWidths[1] := 140;
    sgRestore.ColWidths[2] := 105;
    sgRestore.ColWidths[3] := 110;
    sgRestore.ColWidths[4] := 95;
    sgRestore.ColWidths[5] := 130;
    sgRestore.ColWidths[6] := 146;
  end;

procedure TPagProfissionais.btnRestaurarMouseEnter(Sender: TObject);
  begin
    btnRestaurar.Color := $00F78B2B;
  end;

procedure TPagProfissionais.btnRestaurarMouseLeave(Sender: TObject);
  begin
    btnRestaurar.Color := $007C3E05;
  end;

procedure TPagProfissionais.btnSairClick(Sender: TObject);
  begin
    Close;
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
  I: Integer;
  begin
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
    end;
  end;

procedure TPagProfissionais.ConfirmarAlteracoes(Sender: TObject);
  begin
    if ProfissionalIdalterar = 0 then
    begin
      ShowMessage('Selecione um Profissional para alterar');
      Exit;
    end;
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
    end;
  end;

procedure TPagProfissionais.ConfirmarRestauracao;
  var
  ProfissionalId: Integer;
  begin
    if sgRestore.Row > 0 then
    begin
      ProfissionalId := StrToIntDef(sgRestore.Cells[0, sgRestore.Row], 0);
      if ProfissionalId = 0 then begin
        Exit;
      end;

      try
        Controller.RestaurarProfissional(ProfissionalId);
        ShowMessage('Profissional restaurado com sucesso!');
        CarregarInativos;
        CarregarGrid;
        sgRestore.Row := 0;
        sgRestore.Col := 0;
        sgRestore.SetFocus;
      finally
        Controller.Free;
      end;
      end else
      ShowMessage('Selecione um profissional para restaurar.');
  end;

procedure TPagProfissionais.edCEPKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edEndereco.setfocus;
    end;
  end;

procedure TPagProfissionais.edCPFKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edTelefone.setfocus;
    end
  end;

procedure TPagProfissionais.edEmailKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edCEP.setfocus;
    end;
  end;

procedure TPagProfissionais.EdNomeKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edCPF.setfocus;
    end;
  end;

procedure TPagProfissionais.edTelefoneKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edEmail.setfocus;
    end;
  end;

procedure TPagProfissionais.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    pnlAdd.Visible := False;
    btnAddNovo.visible := false;
    btnAlterarNovo.Visible := False;
    btnNovoPesquisar.Visible := False;
    btnRestaurarNovo.Visible := False;
    pnlRestaurar.Visible := False;
    imgLogo2.Visible := False;
    imgLogo1.Visible := True;
    if pnlAdd.Visible = True then begin
      EdNome.Clear;
      edCPF.Clear;
      edTelefone.Clear;
      edCEP.Clear;
      edEndereco.Clear;
      edEmail.Clear;
      edNome.SetFocus;
      sgprofissionais.Row := 0;
      sgprofissionais.Col := 0;
    end;
  end;

procedure TPagProfissionais.FormCreate(Sender: TObject);
  begin
    Controller := TProfissionaisController.Create;

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

procedure TPagProfissionais.FormDestroy(Sender: TObject);
  begin
    Controller.Free;
  end;

procedure TPagProfissionais.FormShow(Sender: TObject);
  begin
    CarregarGrid;
  end;

procedure TPagProfissionais.imgXrestoreClick(Sender: TObject);
  begin
    pnlRestaurar.Visible := False;
    btnRestaurarNovo.Visible := False;
    CarregarGrid;
  end;

procedure TPagProfissionais.OrdenarGrid;
  var
  i, j: Integer;
  temp: string;
begin
  for i := 1 to sgProfissionais.RowCount - 2 do
    for j := i + 1 to sgProfissionais.RowCount - 1 do
      if StrToIntDef(sgProfissionais.Cells[0, i], 0) > StrToIntDef(sgProfissionais.Cells[0, j], 0) then
      begin
        var k: Integer;
        for k := 0 to sgProfissionais.ColCount - 1 do
        begin
          temp := sgProfissionais.Cells[k, i];
          sgProfissionais.Cells[k, i] := sgProfissionais.Cells[k, j];
          sgProfissionais.Cells[k, j] := temp;
        end;
      end;
end;

procedure TPagProfissionais.pesquisarChange(Sender: TObject);
  begin
    PesquisarProf(pesquisar.Text);
  end;

procedure TPagProfissionais.PesquisarProf(const Filtro: string);
  var
  I, Linha: Integer;
  Profissional: TProfissionais;
  TextoFiltro: string;
  begin
    if not Assigned(ProfissionaisLista) then Exit;
    sgProfissionais.ColCount := 7;
    sgProfissionais.RowCount := 1;
    Linha := 1;
    TextoFiltro := LowerCase(Filtro);
    for I := 0 to ProfissionaisLista.Count - 1 do begin
      Profissional := ProfissionaisLista[I];
      if (Filtro = '') or (Pos(TextoFiltro, LowerCase(Profissional.Nome)) > 0) or
      (Filtro = '') or (Pos(TextoFiltro, LowerCase(Profissional.Id.ToString)) > 0) then begin

      sgProfissionais.RowCount := Linha + 1;
      sgProfissionais.Cells[0, Linha] := Profissional.Id.ToString;
      sgProfissionais.Cells[1, Linha] := Profissional.Nome;
      sgProfissionais.Cells[2, Linha] := Profissional.Cpf;
      sgProfissionais.Cells[3, Linha] := Profissional.Telefone;
      sgProfissionais.Cells[4, Linha] := Profissional.Email;
      sgProfissionais.Cells[5, Linha] := Profissional.Cep;
      sgProfissionais.Cells[6, Linha] := Profissional.Endereco;
      Inc(Linha);
      end;
    end;
  end;

procedure TPagProfissionais.sgProfissionaisDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
var
  BGColor, FontColor: TColor;
  begin
    if gdSelected in State then
      BGColor := clHighlight
    else
    BGColor := clWindow;
    sgProfissionais.Canvas.Brush.Color := BGColor;
    sgProfissionais.Canvas.FillRect(Rect);
  if gdSelected in State then
    FontColor := clHighlightText
  else
    FontColor := clWindowText;
    sgProfissionais.Canvas.Font.Color := FontColor;
    sgProfissionais.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgProfissionais.Cells[ACol, ARow]);
end;
procedure TPagProfissionais.sgRestoreDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
  var
  BGColor: TColor;
begin
  if gdSelected in State then
    BGColor := clHighlight
  else
    BGColor := clWindow;
  sgRestore.Canvas.Brush.Color := BGColor;
  sgRestore.Canvas.FillRect(Rect);
  if gdSelected in State then
    sgRestore.Canvas.Font.Color := clHighlightText
  else
    sgRestore.Canvas.Font.Color := clWindowText;
    sgRestore.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgRestore.Cells[ACol, ARow]);
end;

end.
