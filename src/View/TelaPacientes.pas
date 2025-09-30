unit TelaPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON,uPacientesController,uPacientes,
  System.Generics.Collections, Vcl.ComCtrls, Vcl.Mask;

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
    btnDeletarNovo: TPanel;
    Label4: TLabel;
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
    pnlAddPacientes: TPanel;
    EdNomePaciente: TEdit;
    edCPF: TEdit;
    edCEP: TEdit;
    edEndereco: TEdit;
    btnaddPaciente: TPanel;
    lblAddpaciente: TLabel;
    NetHTTPClient1: TNetHTTPClient;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    edDataNasc: TDateTimePicker;
    edTelefone: TMaskEdit;
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
    procedure btnConsultasMouseEnter(Sender: TObject);
    procedure btnConsultasMouseLeave(Sender: TObject);
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
    procedure buscarCEP(const CEP: string);
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
  private
     PacienteIdalterar: Integer;
     PacientesLista: TObjectList<TPaciente>;
  public
    { Public declarations }
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
  // Laço de comparação de todas as linhas (exceto a primeira se for cabeçalho)
  for i := 1 to sgPacientes.RowCount - 2 do
    for j := i + 1 to sgPacientes.RowCount - 1 do
      if StrToIntDef(sgPacientes.Cells[0, i], 0) > StrToIntDef(sgPacientes.Cells[0, j], 0) then
      begin
        // Troca todas as colunas da linha i com a linha j
        var k: Integer;
        for k := 0 to sgPacientes.ColCount - 1 do
        begin
          temp := sgPacientes.Cells[k, i];
          sgPacientes.Cells[k, i] := sgPacientes.Cells[k, j];
          sgPacientes.Cells[k, j] := temp;
        end;
      end;
end;
procedure TPagPacientes.buscarCEP(const CEP: string);
var
  HTTP: TNetHTTPClient;
  Response: IHTTPResponse;
  JsonResp: TJSONObject;
begin
  HTTP := TNetHTTPClient.Create(nil);
  try
    Response := HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json/');
    if Response.StatusCode = 200 then
    begin
      JsonResp := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      try
        edEndereco.Text := JsonResp.GetValue('logradouro').Value;
        edDataNasc.SetFocus;
      finally
        JsonResp.Free;
      end;
    end else
      ShowMessage('CEP não encontrado!');
      edCEP.SetFocus;
  finally
    HTTP.Free;
  end;
end;
procedure TPagPacientes.CarregarPacientes;
  var
  Controller: TPacientesController;
  I: Integer;
begin
  Controller := TPacientesController.Create;
  try
    if Assigned(PacientesLista) then
    PacientesLista.Free;
    PacientesLista := Controller.BuscarTodos;

    // Cabeçalho
    sgPacientes.Cells[0,0] := 'ID';
    sgPacientes.Cells[1,0] := 'Nome do Paciente';
    sgPacientes.Cells[2,0] := 'CPF';
    sgPacientes.Cells[3,0] := 'Telefone';
    sgPacientes.Cells[4,0] := 'Cep';
    sgPacientes.Cells[5,0] := 'Data de nascimento';
    sgPacientes.Cells[6,0] := 'Endereço';

    sgPacientes.RowCount := PacientesLista.Count + 1;

    for I := 0 to PacientesLista.Count - 1 do
    begin
      sgPacientes.Cells[0, I + 1] := IntToStr(PacientesLista[I].Id);
      sgPacientes.Cells[1, I + 1] := PacientesLista[I].Nome;
      sgPacientes.Cells[2, I + 1] := PacientesLista[I].cpf;
      sgPacientes.Cells[3, I + 1] := PacientesLista[I].telefone;
      sgPacientes.Cells[4, I + 1] := PacientesLista[I].cep;
      sgPacientes.Cells[5, I + 1] := DateToStr(PacientesLista[I].DataNascimento);
      sgPacientes.Cells[6, I + 1] := PacientesLista[I].endereco;
    end;
  finally
    Controller.Free;
  end;
end;

procedure TPagPacientes.adicionarPaciente;
var
  Controller: TPacientesController;
  DataNascimento: TDate;
begin
  Controller := TPacientesController.Create;
  try

    if (EdNomePaciente.Text = '') or (edCPF.Text = '') or (edTelefone.Text = '') or
    (edCEP.Text = '') or (edDataNasc.Checked = False)
    then begin
      ShowMessage('Preencha todos os campos');
      exit;
    end;

    DataNascimento := edDataNasc.Date;
    if DataNascimento > Date then
     begin
      ShowMessage('Data de nascimento invalida!');
      Exit;
     end;


    Controller.AdicionarPaciente(
      edNomePaciente.Text,
      edCPF.Text,
      edTelefone.Text,
      edCEP.Text,
      edEndereco.Text,
      edDataNasc.Date
    );
    ShowMessage('Paciente adicionado com sucesso!');
    CarregarPacientes;
    edNomePaciente.clear;
    edCPF.clear;
    edTelefone.clear;
    edCEP.clear;
    edEndereco.clear;
    edDataNasc.Date := Date;
    edNomePaciente.SetFocus;
  finally
    Controller.Free;
  end;
end;

procedure TPagPacientes.btnAddClick(Sender: TObject);
  begin
    pnlAddPacientes.Visible := True;
    edNomePaciente.SetFocus;
    imgLogo1.Visible := False;
    imgLogo2.Visible := True;
  end;

procedure TPagPacientes.btnAddMouseEnter(Sender: TObject);
  begin
    btnAdd.Color := $00F78B2B;
  end;

procedure TPagPacientes.btnAddMouseLeave(Sender: TObject);
  begin
    btnAdd.Color := $007C3E05;
  end;

procedure TPagPacientes.btnaddPacienteClick(Sender: TObject);
  begin
    adicionarPaciente;
  end;

procedure TPagPacientes.btnAlterarClick(Sender: TObject);
var
  linha: Integer;
  begin
    linha := sgPacientes.Row;
    if linha <= 0 then
    begin
      ShowMessage('Selecione um paciente para alterar!');
      Exit;
    end;

    PacienteIdalterar := StrToIntDef(sgPacientes.Cells[0, linha], 0);
    EdNomePaciente.Text := sgPacientes.Cells[1, linha];
    edCPF.Text := sgpacientes.Cells[2, linha];
    edTelefone.Text := sgPacientes.Cells[3, linha];
    edCEP.Text := sgpacientes.Cells[4, linha];
    edDataNasc.Date := StrToDate(sgPacientes.Cells[5, linha]);
    edendereco.Text := sgpacientes.Cells[6, linha];

    btnConfirmarAlteracoes.Visible := True;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := True;
    btnAddNovo.Visible := False;
    pnlAddPacientes.Visible := True;
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
      imgLogo1.Visible := True;
      imgLogo2.visible := False;
    end;
  end;

procedure TPagPacientes.btnCancelarClick(Sender: TObject);
  begin
    pnlAddPacientes.Visible := False;
    imgLogo1.Visible := True;
    imgLogo2.visible := False;

    if pesquisar.Visible = True then begin
      sgPacientes.Top := sgPacientes.Top - (pesquisar.Height + 5);
      sgPacientes.Height := sgPacientes.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

  end;

procedure TPagPacientes.btnCancelarMouseEnter(Sender: TObject);
  begin
    btnCancelar.Color := $00F78B2B;
  end;

procedure TPagPacientes.btnCancelarMouseLeave(Sender: TObject);
  begin
    btnCancelar.Color := $007C3E05;
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
    if pnlAddPacientes.Visible = True then begin
      EdNomePaciente.Clear;
      edCPF.Clear;
      edTelefone.Clear;
      edCEP.Clear;
      edEndereco.Clear;
      edDataNasc.Date := Date;
      edNomePaciente.SetFocus;
    end else begin
      ShowMessage('Não há nenhum campo para limpar');
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

procedure TPagPacientes.btnConfirmarAlteracoesClick(Sender: TObject);
var
  Controller: TPacientesController;
  DataNascimento: TDate;
begin
  if PacienteIdalterar = 0 then
  begin
    ShowMessage('Selecione um Paciente para alterar');
    Exit;
  end;

  DataNascimento := edDataNasc.Date;
    if DataNascimento > Date then
     begin
      ShowMessage('Data de nascimento invalida!');
      Exit;
     end;

  Controller := TPacientesController.Create;
  try
    Controller.AlterarPaciente(
      PacienteIdalterar,
      edNomePaciente.Text,
      edCpf.Text,
      edTelefone.Text,
      edCep.Text,
      edEndereco.Text,
      edDataNasc.Date
    );

    ShowMessage('Alterações feitas com sucesso!');
    btnAlterarNovo.Visible := False;
    CarregarPacientes;
    sgPacientes.Row := 0;
    sgPacientes.Col := 0;
    sgPacientes.SetFocus;
    pnlAddPacientes.Visible := False;

  finally
    Controller.Free;
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

procedure TPagPacientes.btnConsultasMouseEnter(Sender: TObject);
  begin
    btnConsultas.Color := $00F78B2B;
  end;

procedure TPagPacientes.btnConsultasMouseLeave(Sender: TObject);
  begin
    btnConsultas.Color := $007C3E05;
  end;

procedure TPagPacientes.btnPesquisarClick(Sender: TObject);
  begin
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := False;
  btnNovoPesquisar.Visible := True;
  pnlAddPacientes.Visible := false;
  imgLogo2.Visible := false;
  imgLogo1.Visible := True;

    if not pesquisar.Visible then begin
    pesquisar.Visible := True;
    sgPacientes.Top := pesquisar.Top + pesquisar.Height + 8;
    sgPacientes.Height := sgPacientes.Height - (pesquisar.Height + 8);
    pesquisar.SetFocus;
    end;
  end;

procedure TPagPacientes.btnPesquisarMouseEnter(Sender: TObject);
  begin
    btnPesquisar.Color := $00F78B2B;
  end;

procedure TPagPacientes.btnPesquisarMouseLeave(Sender: TObject);
  begin
    btnPesquisar.Color := $007C3E05;
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
    close;
  end;

procedure TPagPacientes.edCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
      if Key = VK_RETURN then begin
        key := 0;
        buscarCep(edCep.Text);
        edDataNasc.setfocus;
      end;
  end;

procedure TPagPacientes.edCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edTelefone.setfocus;
    end;
  end;

procedure TPagPacientes.EdNomePacienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edCPF.setfocus;
    end;
  end;

procedure TPagPacientes.edTelefoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      key := 0;
      edCEP.setfocus;
    end;
  end;

procedure TPagPacientes.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    pnlAddPacientes.Visible := False;
  end;

procedure TPagPacientes.FormCreate(Sender: TObject);
begin
  sgPacientes.Cells[0,0] := 'ID';
  sgPacientes.Cells[1,0] := 'Nome do Paciente';
  sgPacientes.Cells[2,0] := 'CPF';
  sgPacientes.Cells[3,0] := 'Telefone';
  sgPacientes.Cells[4,0] := 'Cep';
  sgPacientes.Cells[5,0] := 'Data de nascimento';
  sgPacientes.Cells[6,0] := 'Endereço';

  sgPacientes.ColWidths[0] := 40;
  sgPacientes.ColWidths[1] := 155;
  sgPacientes.ColWidths[2] := 110;
  sgPacientes.ColWidths[3] := 120;
  sgPacientes.ColWidths[4] := 115;
  sgPacientes.ColWidths[5] := 155;
  sgPacientes.ColWidths[6] := 194;

  OrdenarGrid;

end;

procedure TPagPacientes.FormShow(Sender: TObject);
  begin
    CarregarPacientes;
    OrdenarGrid;
  end;

procedure TPagPacientes.lblAddpacienteMouseEnter(Sender: TObject);
  begin
    btnAddPaciente.Color := $00C46106;
  end;

procedure TPagPacientes.lblAddpacienteMouseLeave(Sender: TObject);
  begin
    btnAddPaciente.Color := $007C3E05;
  end;

procedure TPagPacientes.lblSairClick(Sender: TObject);
  begin
    close;
  end;
procedure TPagPacientes.sgPacientesDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
var
  BGColor: TColor;
begin
  // Define a cor de fundo dependendo se a célula está selecionada
  if gdSelected in State then
    BGColor := clHighlight
  else
    BGColor := clWindow;

  // Pinta o fundo da célula
  sgPacientes.Canvas.Brush.Color := BGColor;
  sgPacientes.Canvas.FillRect(Rect);

  // Define a cor da fonte dependendo se a célula está selecionada
  if gdSelected in State then
    sgPacientes.Canvas.Font.Color := clHighlightText
  else
    sgPacientes.Canvas.Font.Color := clWindowText;

  // Desenha o texto da célula
  sgPacientes.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgPacientes.Cells[ACol, ARow]);
end;



end.
