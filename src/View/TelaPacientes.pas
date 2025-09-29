unit TelaPacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON,uPacientesController,uPacientes,
  System.Generics.Collections;

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
    btnProcedimentos: TPanel;
    lblProcedimentos: TLabel;
    btnLimpar: TPanel;
    lblLimpar: TLabel;
    btnSair: TPanel;
    lblSair: TLabel;
    pnlAddPacientes: TPanel;
    EdNomePaciente: TEdit;
    edCPF: TEdit;
    edTelefone: TEdit;
    edCEP: TEdit;
    edEndereco: TEdit;
    edDataNasc: TEdit;
    btnaddPaciente: TPanel;
    lblAddpaciente: TLabel;
    NetHTTPClient1: TNetHTTPClient;
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
    procedure btnProcedimentosMouseEnter(Sender: TObject);
    procedure btnProcedimentosMouseLeave(Sender: TObject);
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
  private
     PacientesLista: TObjectList<TPaciente>;
  public
    { Public declarations }
  end;

var
  PagPacientes: TPagPacientes;

implementation

{$R *.dfm}

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
      finally
        JsonResp.Free;
      end;
    end else
      ShowMessage('CEP não encontrado!');
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
      sgPacientes.Cells[5, I + 1] := PacientesLista[I].dataNascimento;
      sgPacientes.Cells[6, I + 1] := PacientesLista[I].endereco;
    end;
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

procedure TPagPacientes.btnAlterarMouseEnter(Sender: TObject);
  begin
    btnAlterar.Color := $00F78B2B;
  end;

procedure TPagPacientes.btnAlterarMouseLeave(Sender: TObject);
  begin
    btnAlterar.Color := $007C3E05;
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
      edDataNasc.Clear;
      edNomePaciente.SetFocus;
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

procedure TPagPacientes.btnProcedimentosMouseEnter(Sender: TObject);
  begin
    btnProcedimentos.Color := $00F78B2B;
  end;

procedure TPagPacientes.btnProcedimentosMouseLeave(Sender: TObject);
  begin
    btnProcedimentos.Color := $007C3E05;
  end;

procedure TPagPacientes.btnPesquisarClick(Sender: TObject);
  begin
  btnAddNovo.Visible := False;
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
        edDataNasc.setfocus;
        buscarCep(edCep.Text);
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
end;

procedure TPagPacientes.FormShow(Sender: TObject);
  begin
    CarregarPacientes;
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
end.
