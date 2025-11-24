unit TelaPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON,
  uPacientesController, uPacientes,
  System.Generics.Collections, Vcl.ComCtrls, Vcl.Mask, DateUtils,
  uPacientesControllerLog, uDadosGlobais, TelaConsultas;

type
  TPagPacientes = class(TForm)
    bordaCabecalhoPacientes: TPanel;
    pnlCabecalho: TPanel;
    lblTituloPacientes: TLabel;
    iconPacientes: TImage;
    btnX: TImage;
    pnlAzulPrincipal: TPanel;
    imgLogo1: TImage;
    imgLogo2: TImage;
    sgPacientes: TStringGrid;
    pesquisar: TSearchBox;
    pnlBotoesDireitaPacientes: TPanel;
    btnAdd: TPanel;
    lblAddUsu: TLabel;
    btnAddNovo: TPanel;
    Label2: TLabel;
    btnAlterar: TPanel;
    lblAlterarUsu: TLabel;
    btnAlterarNovo: TPanel;
    Label3: TLabel;
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
    btnSair: TPanel;
    lblSair: TLabel;
    pnlAddPacientes: TPanel;
    EdNomePaciente: TEdit;
    edCEP: TEdit;
    edEndereco: TEdit;
    btnaddPaciente: TPanel;
    lblAddpaciente: TLabel;
    NetHTTPClient1: TNetHTTPClient;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    edDataNasc: TDateTimePicker;
    edTelefone: TMaskEdit;
    edCPF: TMaskEdit;
    pnlRestaurar: TPanel;
    imgRestore: TImage;
    Label6: TLabel;
    imgXrestore: TImage;
    sgRestore: TStringGrid;
    btnCRestore: TPanel;
    lblRestore: TLabel;
    btnLimpar: TPanel;
    lblLimpar: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure btnXClick(Sender: TObject);
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
    procedure btnLimparMouseEnter(Sender: TObject);
    procedure btnLimparMouseLeave(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure lblAddpacienteMouseEnter(Sender: TObject);
    procedure lblAddpacienteMouseLeave(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure CarregarPacientes;
    procedure EdNomePacienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCPFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edTelefoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCEPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    function buscarCEP(const CEP: string): Boolean;
    procedure FormShow(Sender: TObject);
    procedure adicionarPaciente;
    procedure btnaddPacienteClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarAlteracoesClick(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseEnter(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseLeave(Sender: TObject);
    procedure sgPacientesDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure btnAlterarNovoClick(Sender: TObject);
    procedure OrdenarGrid;
    procedure pesquisarChange(Sender: TObject);
    procedure btnAddNovoClick(Sender: TObject);
    procedure btnNovoPesquisarClick(Sender: TObject);
    procedure ConfirmarAlteracoes(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure imgXrestoreClick(Sender: TObject);
    procedure CarregarInativos;
    procedure sgRestoreDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure ConfirmarRestauracao;
    procedure btnCRestoreClick(Sender: TObject);
    procedure btnCRestoreMouseEnter(Sender: TObject);
    procedure btnCRestoreMouseLeave(Sender: TObject);
    procedure EdNomePacienteKeyPress(Sender: TObject; var Key: Char);
    procedure edCPFKeyPress(Sender: TObject; var Key: Char);
    procedure edTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edCEPKeyPress(Sender: TObject; var Key: Char);
    procedure edEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure edDataNascKeyPress(Sender: TObject; var Key: Char);
    procedure pesquisarKeyPress(Sender: TObject; var Key: Char);

  private
    PacienteIdalterar: Integer;
    PacientesLista: TObjectList<TPaciente>;
    Controller: TPacientesController;
    PaciController: TLogController;
    procedure PesquisarPacientes(const Filtro: string);
    function IdadeValida(DataNascimento: TDate): Boolean;
  public
    { Public declarations }
    procedure ConfigurarPermissoes;
  end;

var
  PagPacientes: TPagPacientes;

implementation

{$R *.dfm}

procedure TPagPacientes.OrdenarGrid;
var
  i, j: Integer;
  temp: string;
begin
  for i := 1 to sgPacientes.RowCount - 2 do
    for j := i + 1 to sgPacientes.RowCount - 1 do
      if StrToIntDef(sgPacientes.Cells[0, i], 0) >
        StrToIntDef(sgPacientes.Cells[0, j], 0) then begin
        var
          k: Integer;
        for k := 0 to sgPacientes.ColCount - 1 do begin
          temp := sgPacientes.Cells[k, i];
          sgPacientes.Cells[k, i] := sgPacientes.Cells[k, j];
          sgPacientes.Cells[k, j] := temp;
        end;
      end;
end;

procedure TPagPacientes.pesquisarChange(Sender: TObject);
begin
  PesquisarPacientes(pesquisar.Text);
end;

procedure TPagPacientes.PesquisarPacientes(const Filtro: string);
var
  i, Linha: Integer;
  Paciente: TPaciente;
  TextoFiltro: string;
begin
  if not Assigned(PacientesLista) then
    Exit;
  sgPacientes.ColCount := 7;
  sgPacientes.RowCount := 1;
  Linha := 1;
  TextoFiltro := LowerCase(Filtro);
  for i := 0 to PacientesLista.Count - 1 do begin
    Paciente := PacientesLista[i];
    if (Filtro = '') or (Pos(TextoFiltro, LowerCase(Paciente.Nome)) > 0) or
      (Filtro = '') or (Pos(TextoFiltro, LowerCase(Paciente.Id.ToString)) > 0)
    then begin
      sgPacientes.RowCount := Linha + 1;
      sgPacientes.Cells[0, Linha] := Paciente.Id.ToString;
      sgPacientes.Cells[1, Linha] := Paciente.Nome;
      sgPacientes.Cells[2, Linha] := Paciente.Cpf;
      sgPacientes.Cells[3, Linha] := Paciente.Telefone;
      sgPacientes.Cells[4, Linha] := Paciente.CEP;
      sgPacientes.Cells[5, Linha] := Paciente.Endereco;
      sgPacientes.Cells[6, Linha] := DateToStr(Paciente.DataNascimento);
      Inc(Linha);
    end;
  end;
end;

procedure TPagPacientes.CarregarInativos;
var
  i: Integer;
begin
  FreeAndNil(PacientesLista);
  PacientesLista := Controller.BuscarInativos;

  if not Assigned(PacientesLista) then
    Exit;

  sgRestore.RowCount := PacientesLista.Count + 1;

  for i := 0 to PacientesLista.Count - 1 do begin
    sgRestore.Cells[0, i + 1] := IntToStr(PacientesLista[i].Id);
    sgRestore.Cells[1, i + 1] := PacientesLista[i].Nome;
    sgRestore.Cells[2, i + 1] := PacientesLista[i].Cpf;
    sgRestore.Cells[3, i + 1] := PacientesLista[i].Telefone;
    sgRestore.Cells[4, i + 1] := PacientesLista[i].CEP;
    sgRestore.Cells[5, i + 1] := DateToStr(PacientesLista[i].DataNascimento);
    sgRestore.Cells[6, i + 1] := PacientesLista[i].Endereco;
  end;
end;

procedure TPagPacientes.CarregarPacientes;
var
  i: Integer;
begin
  FreeAndNil(PacientesLista);
  PacientesLista := Controller.BuscarTodos;

  if not Assigned(PacientesLista) then
    Exit;

  sgPacientes.RowCount := PacientesLista.Count + 1;

  for i := 0 to PacientesLista.Count - 1 do begin
    sgPacientes.Cells[0, i + 1] := IntToStr(PacientesLista[i].Id);
    sgPacientes.Cells[1, i + 1] := PacientesLista[i].Nome;
    sgPacientes.Cells[2, i + 1] := PacientesLista[i].Cpf;
    sgPacientes.Cells[3, i + 1] := PacientesLista[i].Telefone;
    sgPacientes.Cells[4, i + 1] := PacientesLista[i].CEP;
    sgPacientes.Cells[5, i + 1] := DateToStr(PacientesLista[i].DataNascimento);
    sgPacientes.Cells[6, i + 1] := PacientesLista[i].Endereco;
  end;
end;

procedure TPagPacientes.ConfirmarAlteracoes(Sender: TObject);
var
  DataNascimento: TDate;
begin
  if PacienteIdalterar = 0 then begin
    ShowMessage('Selecione um Paciente para alterar');
    Exit;
  end;

  DataNascimento := edDataNasc.Date;
  if DataNascimento > Date then begin
    ShowMessage('Data de nascimento inv�lida!');
    Exit;
  end;

  Controller.AlterarPaciente(PacienteIdalterar, EdNomePaciente.Text, edCPF.Text,
    edTelefone.Text, edCEP.Text, edEndereco.Text, edDataNasc.Date);
  PaciController.RegistrarLog(UsuarioLogado.Nome, EdNomePaciente.Text,
    'Alterou', 'Cpf', edCPF.Text);
  ShowMessage('Alterações feitas com sucesso!');
  btnAlterarNovo.Visible := False;
  CarregarPacientes;
  OrdenarGrid;
  sgPacientes.Row := 0;
  sgPacientes.Col := 0;
  sgPacientes.SetFocus;
  pnlAddPacientes.Visible := False;
end;

procedure TPagPacientes.ConfirmarRestauracao;
var
  PacienteId: Integer;
  Paciente: TPaciente;
begin
  if sgRestore.Row > 0 then begin
    PacienteId := StrToIntDef(sgRestore.Cells[0, sgRestore.Row], 0);
    if PacienteId = 0 then begin
      Exit;
    end;

    Paciente := TPaciente.Create;
    Paciente.Nome := sgRestore.Cells[1, sgRestore.Row];
    Paciente.Cpf := sgRestore.Cells[2, sgRestore.Row];

    try
      Controller.RestaurarPaciente(PacienteId);
      PaciController.RegistrarLog(UsuarioLogado.Nome, Paciente.Nome,
        'Restaurou', 'Cpf', Paciente.Cpf);
      ShowMessage('Paciente restaurado com sucesso!');
      CarregarInativos;
      CarregarPacientes;
      sgRestore.Row := 0;
      sgRestore.Col := 0;
      sgRestore.SetFocus;
    finally
      Paciente.Free;
    end;
  end
  else
    ShowMessage('Selecione um paciente para restaurar.');
end;

procedure TPagPacientes.adicionarPaciente;
begin
  if (EdNomePaciente.Text = '') or (edCPF.Text = '') or (edTelefone.Text = '')
    or (edCEP.Text = '') or (edDataNasc.Checked = False) then begin
    ShowMessage('Preencha todos os campos');
    Exit;
  end;

  if not IdadeValida(edDataNasc.Date) then begin
    Exit;
  end;

  try
    Controller.adicionarPaciente(EdNomePaciente.Text, edCPF.Text,
      edTelefone.Text, edCEP.Text, edEndereco.Text, edDataNasc.Date);
    PaciController.RegistrarLog(UsuarioLogado.Nome, EdNomePaciente.Text,
      'Adicionou', 'CPF', edCPF.Text);
    ShowMessage('Paciente adicionado com sucesso!');
    CarregarPacientes;
    OrdenarGrid;

    btnAddNovo.Visible := False;
    pnlAddPacientes.Visible := False;

    EdNomePaciente.Clear;
    edCPF.Clear;
    edTelefone.Clear;
    edCEP.Clear;
    edEndereco.Clear;
    edDataNasc.Date := Date;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar paciente: ' + E.Message);
  end;
end;

procedure TPagPacientes.btnAddClick(Sender: TObject);
begin
  if pnlRestaurar.Visible = true then begin
    pnlRestaurar.Visible := False;
    btnRestaurarNovo.Visible := False;
  end;

  if (btnAlterarNovo.Visible = true) then begin
    EdNomePaciente.Clear;
    edCEP.Clear;
    edEndereco.Clear;
    edTelefone.Clear;
    edCPF.Clear;
    EdNomePaciente.SetFocus;
    sgPacientes.Row := 0;
    sgPacientes.Col := 0;
    sgPacientes.SetFocus;

    if btnNovoPesquisar.Visible = true then begin
      sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
      sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

  end;

  btnAlterarNovo.Visible := False;
  btnAddNovo.Visible := true;
  btnNovoPesquisar.Visible := False;
  btnRestaurarNovo.Visible := False;
  btnConfirmarAlteracoes.Visible := False;
  btnaddPaciente.Visible := true;
  pnlAddPacientes.Visible := true;
  imgLogo2.Visible := true;
  imgLogo1.Visible := False;
  EdNomePaciente.SetFocus;
end;

procedure TPagPacientes.btnAddMouseEnter(Sender: TObject);
begin
  btnAdd.Color := $00F78B2B;
end;

procedure TPagPacientes.btnAddMouseLeave(Sender: TObject);
begin
  btnAdd.Color := $007C3E05;
end;

procedure TPagPacientes.btnAddNovoClick(Sender: TObject);
begin
  if btnAddNovo.Visible = true then begin
    pnlAddPacientes.Visible := False;
    btnAddNovo.Visible := False;
  end;
end;

procedure TPagPacientes.btnaddPacienteClick(Sender: TObject);
begin
  adicionarPaciente;
end;

procedure TPagPacientes.btnAlterarClick(Sender: TObject);
var
  Linha: Integer;
begin
  Linha := sgPacientes.Row;
  if Linha <= 0 then begin
    ShowMessage('Selecione um paciente para alterar!');
    Exit;
  end;

  if btnNovoPesquisar.Visible = true then begin
    sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
    sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
    pesquisar.Visible := False;
    btnNovoPesquisar.Visible := False;
  end;

  PacienteIdalterar := StrToIntDef(sgPacientes.Cells[0, Linha], 0);
  EdNomePaciente.Text := sgPacientes.Cells[1, Linha];
  edCPF.Text := sgPacientes.Cells[2, Linha];
  edTelefone.Text := sgPacientes.Cells[3, Linha];
  edCEP.Text := sgPacientes.Cells[4, Linha];
  edDataNasc.Date := StrToDate(sgPacientes.Cells[5, Linha]);
  edEndereco.Text := sgPacientes.Cells[6, Linha];

  btnConfirmarAlteracoes.Visible := true;
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := true;
  btnAddNovo.Visible := False;
  pnlAddPacientes.Visible := true;
end;

procedure TPagPacientes.btnAlterarMouseEnter(Sender: TObject);
begin
  btnAlterar.Color := $00F78B2B;
end;

procedure TPagPacientes.btnAlterarMouseLeave(Sender: TObject);
begin
  btnAlterar.Color := $007C3E05;
end;

procedure TPagPacientes.btnAlterarNovoClick(Sender: TObject);
begin
  if btnAlterarNovo.Visible = true then begin
    pnlAddPacientes.Visible := False;
    btnAlterarNovo.Visible := False;
    imgLogo1.Visible := true;
    imgLogo2.Visible := False;
  end;
end;

procedure TPagPacientes.btnCancelarClick(Sender: TObject);
begin
  pnlAddPacientes.Visible := False;
  btnAddNovo.Visible := False;
  btnRestaurarNovo.Visible := False;
  pnlRestaurar.Visible := False;
  btnAlterarNovo.Visible := False;
  imgLogo1.Visible := true;
  imgLogo2.Visible := False;
  if pesquisar.Visible = true then begin
    sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
    sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
    pesquisar.Visible := False;
    btnNovoPesquisar.Visible := False;
  end;
  sgPacientes.Row := 0;
  sgPacientes.Col := 0;
  sgPacientes.SetFocus;

end;

procedure TPagPacientes.btnCancelarMouseEnter(Sender: TObject);
begin
  btnCancelar.Color := $00F78B2B;
end;

procedure TPagPacientes.btnCancelarMouseLeave(Sender: TObject);
begin
  btnCancelar.Color := $007C3E05;
end;

procedure TPagPacientes.btnDeletarClick(Sender: TObject);
var
  Id: Integer;
  Nome, Cpf: string;
begin
  if btnAlterarNovo.Visible = true then begin
    btnAlterarNovo.Visible := False;
    pnlAddPacientes.Visible := False;
  end;

  if btnNovoPesquisar.Visible = true then begin
    sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
    sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
    pesquisar.Visible := False;
    btnNovoPesquisar.Visible := False;
  end;

  Id := StrToIntDef(sgPacientes.Cells[0, sgPacientes.Row], 0);

  if Id > 0 then begin
    Nome := sgPacientes.Cells[1, sgPacientes.Row];
    Cpf := sgPacientes.Cells[2, sgPacientes.Row];
    PaciController.RegistrarLog(UsuarioLogado.Nome, Nome, 'Deletou',
      'CPF', Cpf);
    Controller.DesativarPaciente(Id);
    ShowMessage('Paciente deletado com sucesso!');
    CarregarPacientes;
    sgPacientes.Row := 0;
    sgPacientes.Col := 0;
    sgPacientes.SetFocus;
  end
  else
    ShowMessage('Selecione um paciente para deletar.');
end;

procedure TPagPacientes.btnDeletarMouseEnter(Sender: TObject);
begin
  btnDeletar.Color := $00F78B2B;
end;

procedure TPagPacientes.btnDeletarMouseLeave(Sender: TObject);
begin
  btnDeletar.Color := $007C3E05;
end;

procedure TPagPacientes.btnLimparClick(Sender: TObject);
begin
  if pnlAddPacientes.Visible = true then begin
    EdNomePaciente.Clear;
    edCPF.Clear;
    edTelefone.Clear;
    edCEP.Clear;
    edEndereco.Clear;
    edDataNasc.Date := Date;
    EdNomePaciente.SetFocus;
  end;

end;

procedure TPagPacientes.btnLimparMouseEnter(Sender: TObject);
begin
  btnLimpar.Color := $00F78B2B;
end;

procedure TPagPacientes.btnLimparMouseLeave(Sender: TObject);
begin
  btnLimpar.Color := $007C3E05;
end;

procedure TPagPacientes.btnNovoPesquisarClick(Sender: TObject);
begin
  if btnNovoPesquisar.Visible = true then begin
    sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
    sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
    pesquisar.Visible := False;
    btnNovoPesquisar.Visible := False;
  end;

end;

procedure TPagPacientes.btnConfirmarAlteracoesClick(Sender: TObject);
begin
  if not IdadeValida(edDataNasc.Date) then begin
    Exit;
  end
  else begin
    ConfirmarAlteracoes(nil);
  end;
end;

procedure TPagPacientes.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
begin
  btnConfirmarAlteracoes.Color := $00C46106;
end;

procedure TPagPacientes.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
begin
  btnConfirmarAlteracoes.Color := $007C3E05;
end;

procedure TPagPacientes.btnCRestoreClick(Sender: TObject);
begin
  ConfirmarRestauracao;
  OrdenarGrid;
end;

procedure TPagPacientes.btnCRestoreMouseEnter(Sender: TObject);
begin
  btnCRestore.Color := $00F8973F;
end;

procedure TPagPacientes.btnCRestoreMouseLeave(Sender: TObject);
begin
  btnCRestore.Color := $00F78B2B;
end;

procedure TPagPacientes.btnPesquisarClick(Sender: TObject);
begin
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := False;
  btnNovoPesquisar.Visible := true;
  pnlAddPacientes.Visible := False;
  imgLogo2.Visible := False;
  imgLogo1.Visible := true;

  if not pesquisar.Visible then begin
    pesquisar.Visible := true;
    sgPacientes.Top := pesquisar.Top + pesquisar.Height + 8;
    sgPacientes.Height := sgPacientes.Height - (pesquisar.Height + 8);
    pesquisar.SetFocus;
  end;

  sgPacientes.Row := 0;
  sgPacientes.Col := 0;
  sgPacientes.SetFocus;
end;

procedure TPagPacientes.btnPesquisarMouseEnter(Sender: TObject);
begin
  btnPesquisar.Color := $00F78B2B;
end;

procedure TPagPacientes.btnPesquisarMouseLeave(Sender: TObject);
begin
  btnPesquisar.Color := $007C3E05;
end;

procedure TPagPacientes.btnRestaurarClick(Sender: TObject);
begin
  if pnlAddPacientes.Visible = true then begin
    pnlAddPacientes.Visible := False;
  end;

  if btnNovoPesquisar.Visible = true then begin
    sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
    sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
    pesquisar.Visible := False;
    btnNovoPesquisar.Visible := False;
  end;

  btnRestaurarNovo.Visible := true;
  CarregarInativos;
  sgRestore.Row := 0;
  sgRestore.Col := 0;
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := False;
  pnlRestaurar.Visible := true;
  sgRestore.SetFocus;

  sgRestore.Cells[0, 0] := 'ID';
  sgRestore.Cells[1, 0] := 'Nome do Paciente';
  sgRestore.Cells[2, 0] := 'CPF';
  sgRestore.Cells[3, 0] := 'Telefone';
  sgRestore.Cells[4, 0] := 'Cep';
  sgRestore.Cells[5, 0] := 'Data de nascimento';
  sgRestore.Cells[6, 0] := 'Endereço';

  sgRestore.ColWidths[0] := 50;
  sgRestore.ColWidths[1] := 140;
  sgRestore.ColWidths[2] := 105;
  sgRestore.ColWidths[3] := 110;
  sgRestore.ColWidths[4] := 95;
  sgRestore.ColWidths[5] := 130;
  sgRestore.ColWidths[6] := 146;

end;

procedure TPagPacientes.btnRestaurarMouseEnter(Sender: TObject);
begin
  btnRestaurar.Color := $00F78B2B;
end;

procedure TPagPacientes.btnRestaurarMouseLeave(Sender: TObject);
begin
  btnRestaurar.Color := $007C3E05;
end;

procedure TPagPacientes.btnSairMouseEnter(Sender: TObject);
begin
  btnSair.Color := $00F78B2B;
end;

procedure TPagPacientes.btnSairMouseLeave(Sender: TObject);
begin
  btnSair.Color := $007C3E05;
end;

procedure TPagPacientes.btnXClick(Sender: TObject);
begin
  Close;
  pnlAddPacientes.Visible := False;
  btnAddNovo.Visible := False;
  btnRestaurarNovo.Visible := False;
  pnlRestaurar.Visible := False;
  btnAlterarNovo.Visible := False;
  imgLogo1.Visible := true;
  imgLogo2.Visible := False;
  if pesquisar.Visible = true then begin
    sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
    sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
    pesquisar.Visible := False;
    btnNovoPesquisar.Visible := False;
  end;
end;

function TPagPacientes.buscarCEP(const CEP: string): Boolean;
var
  HTTP: TNetHTTPClient;
  Response: IHTTPResponse;
  JsonResp: TJSONObject;
begin
  Result := False;
  HTTP := TNetHTTPClient.Create(nil);
  try
    Response := HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json/');
    if Response.StatusCode = 200 then begin
      JsonResp := TJSONObject.ParseJSONValue(Response.ContentAsString)
        as TJSONObject;
      try
        if JsonResp.GetValue('erro') <> nil then begin
          ShowMessage('CEP não encontrado!');
          edCEP.SetFocus;
          Exit;
        end;

        edEndereco.Text := JsonResp.GetValue('logradouro').Value;
        edDataNasc.SetFocus;
        Result := true;
      finally
        JsonResp.Free;
      end;
    end
    else begin
      ShowMessage('CEP não encontrado!');
      edCEP.SetFocus;
    end;
  finally
    HTTP.Free;
  end;
end;

procedure TPagPacientes.edCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Key := 0;
    buscarCEP(edCEP.Text);
  end;
end;

procedure TPagPacientes.edCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Key := 0;
    edTelefone.SetFocus;
  end;
end;

procedure TPagPacientes.EdNomePacienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Key := 0;
    edCPF.SetFocus;
  end;
end;

procedure TPagPacientes.edTelefoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Key := 0;
    edCEP.SetFocus;
  end;
end;

procedure TPagPacientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pnlAddPacientes.Visible := False;
  btnAddNovo.Visible := False;
  pnlAddPacientes.Visible := False;
  btnAlterarNovo.Visible := False;
  btnNovoPesquisar.Visible := False;
  btnRestaurarNovo.Visible := False;
  pnlRestaurar.Visible := False;
  imgLogo2.Visible := False;
  imgLogo1.Visible := true;
end;

procedure TPagPacientes.FormCreate(Sender: TObject);
begin
  Controller := TPacientesController.Create;
  PaciController := TLogController.Create;
  PacientesLista := nil;

  sgPacientes.Cells[0, 0] := 'ID';
  sgPacientes.Cells[1, 0] := 'Nome do Paciente';
  sgPacientes.Cells[2, 0] := 'CPF';
  sgPacientes.Cells[3, 0] := 'Telefone';
  sgPacientes.Cells[4, 0] := 'Cep';
  sgPacientes.Cells[5, 0] := 'Data de nascimento';
  sgPacientes.Cells[6, 0] := 'Endereço';

  sgPacientes.ColWidths[0] := 40;
  sgPacientes.ColWidths[1] := 155;
  sgPacientes.ColWidths[2] := 110;
  sgPacientes.ColWidths[3] := 120;
  sgPacientes.ColWidths[4] := 115;
  sgPacientes.ColWidths[5] := 155;
  sgPacientes.ColWidths[6] := 194;
  OrdenarGrid;

end;

procedure TPagPacientes.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Controller);
  FreeAndNil(PacientesLista);
  FreeAndNil(PaciController);
end;

procedure TPagPacientes.ConfigurarPermissoes;
begin
  if Assigned(UsuarioLogado) and (UsuarioLogado.Grupo = 'Profissional') then
  begin
    btnAdd.Visible := False;
    btnAlterar.Visible := False;
    btnDeletar.Visible := False;
    btnRestaurar.Visible := False;
    btnLimpar.Visible := False;
    btnPesquisar.Visible := true;
    btnSair.Visible := true;
    btnPesquisar.Top := 6;
    btnCancelar.Top := 53;
    btnSair.Top := 100
  end
  else begin
    btnAdd.Visible := true;
    btnAlterar.Visible := true;
    btnRestaurar.Visible := true;
    btnPesquisar.Visible := true;
    btnLimpar.Visible := true;
    btnSair.Visible := true;

  end;
end;

procedure TPagPacientes.FormShow(Sender: TObject);
begin
  ConfigurarPermissoes;
  CarregarPacientes;
  OrdenarGrid;
  sgPacientes.Row := 0;
  sgPacientes.Col := 0;
  sgPacientes.SetFocus;
end;

function TPagPacientes.IdadeValida(DataNascimento: TDate): Boolean;
var
  Idade: Integer;
begin
  Result := False;

  if DataNascimento > Date then begin
    ShowMessage('Data de nascimento inválida!');
    Exit;
  end;
  Idade := YearOf(Date) - YearOf(DataNascimento);

  if (MonthOf(DataNascimento) > MonthOf(Date)) or
    ((MonthOf(DataNascimento) = MonthOf(Date)) and
    (DayOf(DataNascimento) > DayOf(Date))) then
    Dec(Idade);

  if (Idade < 3) or (Idade > 100) then begin
    ShowMessage('Data de nascimento inválida!');
    Exit;
  end;
  Result := true;
end;

procedure TPagPacientes.imgXrestoreClick(Sender: TObject);
begin
  pnlRestaurar.Visible := False;
  btnRestaurarNovo.Visible := False;
  CarregarPacientes;
  OrdenarGrid;
end;

procedure TPagPacientes.lblAddpacienteMouseEnter(Sender: TObject);
begin
  btnaddPaciente.Color := $00C46106;
end;

procedure TPagPacientes.lblAddpacienteMouseLeave(Sender: TObject);
begin
  btnaddPaciente.Color := $007C3E05;
end;

procedure TPagPacientes.lblSairClick(Sender: TObject);
begin
  Close;
end;

procedure TPagPacientes.sgPacientesDrawCell(Sender: TObject;
  ACol, ARow: LongInt; Rect: TRect; State: TGridDrawState);
var
  BGColor: TColor;
begin
  if gdSelected in State then
    BGColor := clHighlight
  else
    BGColor := clWindow;
  sgPacientes.Canvas.Brush.Color := BGColor;
  sgPacientes.Canvas.FillRect(Rect);
  if gdSelected in State then
    sgPacientes.Canvas.Font.Color := clHighlightText
  else
    sgPacientes.Canvas.Font.Color := clWindowText;
  sgPacientes.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgPacientes.Cells[ACol, ARow]);
end;

procedure TPagPacientes.sgRestoreDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
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

procedure TPagPacientes.EdNomePacienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    edCPF.SetFocus;
  end;
end;

procedure TPagPacientes.edCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    edTelefone.SetFocus;
  end;
end;

procedure TPagPacientes.edTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    edCEP.SetFocus;
  end;
end;

procedure TPagPacientes.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    if edEndereco.CanFocus then
      edEndereco.SetFocus
    else
      edDataNasc.SetFocus;
  end;
end;

procedure TPagPacientes.edEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    edDataNasc.SetFocus;
  end;
end;

procedure TPagPacientes.edDataNascKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    if btnaddPaciente.Visible then
      btnaddPaciente.SetFocus
    else if btnConfirmarAlteracoes.Visible then
      btnConfirmarAlteracoes.SetFocus;
  end;
end;

procedure TPagPacientes.pesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    sgPacientes.SetFocus;
  end;
end;

end.
