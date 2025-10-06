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
  private
    ProfissionaisLista: TObjectList<TProfissionais>;
  public
    { Public declarations }
  end;

var
  PagProfissionais: TPagProfissionais;

implementation

{$R *.dfm}

{ TPagProfissionais }

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

procedure TPagProfissionais.FormShow(Sender: TObject);
  begin
    CarregarGrid;
  end;

end.
