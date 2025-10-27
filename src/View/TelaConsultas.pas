unit TelaConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Samples.Calendar, System.Generics.Collections,
  uPacientes, uProfissionais, uProcedimentos, Vcl.WinXCalendars,
  uConsultasController;

type
  TPagConsultas = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconConsultas: TImage;
    btnX: TImage;
    pnlAzulPrincipal: TPanel;
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
    Calendar1: TCalendarView;
    DateTimePicker1: TDateTimePicker;
    sgConsultas: TStringGrid;
    Panel1: TPanel;
    lblListar: TLabel;
    Panel2: TPanel;
    label7: TLabel;
    imgLogo1: TImage;
    edHoraInicio: TMaskEdit;
    btnadicionar: TPanel;
    lblAddprocedimento: TLabel;
    edHoraFim: TMaskEdit;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    procedure btnXClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnadicionarMouseEnter(Sender: TObject);
    procedure btnadicionarMouseLeave(Sender: TObject);
    procedure btnAlterarMouseEnter(Sender: TObject);
    procedure btnAlterarMouseLeave(Sender: TObject);
    procedure btnDeletarMouseEnter(Sender: TObject);
    procedure btnDeletarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnRestaurarMouseLeave(Sender: TObject);
    procedure btnRestaurarMouseEnter(Sender: TObject);
    procedure btnLimparMouseEnter(Sender: TObject);
    procedure btnLimparMouseLeave(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseEnter(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseLeave(Sender: TObject);
    procedure btnAddMouseEnter(Sender: TObject);
    procedure btnAddMouseLeave(Sender: TObject);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Controller: TConsultaController;
    procedure CarregarComboBox;
  public
    { Public declarations }
  end;

var
  PagConsultas: TPagConsultas;

implementation

{$R *.dfm}

procedure TPagConsultas.FormCreate(Sender: TObject);
  begin
    Controller := TConsultaController.Create;
    CarregarComboBox;
  end;

procedure TPagConsultas.FormDestroy(Sender: TObject);
  begin
    Controller.Free;
  end;

procedure TPagConsultas.CarregarComboBox;
var
  ListaPacientes: TObjectList<TPaciente>;
  ListaProfissionais: TObjectList<TProfissionais>;
  ListaProcedimentos: TObjectList<TProcedimento>;
  Paciente: TPaciente;
  Profissional: TProfissionais;
  Procedimento: TProcedimento;
begin
  ListaPacientes := Controller.BuscarPacientes;
  if Assigned(ListaPacientes) then
  try
    for Paciente in ListaPacientes do
      cbNomePaci.Items.AddObject(Paciente.Nome, TObject(Paciente.Id));
  finally
    ListaPacientes.Free;
  end;

  if cbNomePaci.Items.Count > 0 then
    cbNomePaci.ItemIndex := -1;

  ListaProfissionais := Controller.BuscarProfissionais;
  if Assigned(ListaProfissionais) then
  try
    for Profissional in ListaProfissionais do
      cbNomeProf.Items.AddObject(Profissional.Nome, TObject(Profissional.Id));
  finally
    ListaProfissionais.Free;
  end;

  if cbNomeProf.Items.Count > 0 then
    cbNomeProf.ItemIndex := -1;
  ListaProcedimentos := Controller.BuscarProcedimentos;
  if Assigned(ListaProcedimentos) then
  try
    for Procedimento in ListaProcedimentos do
      cbNomeProc.Items.AddObject(Procedimento.Nome, TObject(Procedimento.Id));
  finally
    ListaProcedimentos.Free;
  end;

  if cbNomeProc.Items.Count > 0 then
    cbNomeProc.ItemIndex := -1;
end;

procedure TPagConsultas.btnAddClick(Sender: TObject);
  begin
      if sgConsultas.Visible = True then begin
        sgConsultas.Visible := False;
        calendar1.Visible := True;
        panel2.Visible := false;
      end;
      if Calendar1.Date > 0 then begin
        DateTimePicker1.Date := Calendar1.Date;
        Calendar1.Enabled := False;
      end;

      if pnlRestaurar.Visible = true then begin
        pnlRestaurar.Visible := False;
        btnRestaurarNovo.Visible := false;
      end;

      if (btnAlterarNovo.Visible = True) then begin
          cbNomePaci.ItemIndex := 0;
          cbNomeProf.ItemIndex := 0;
          cbNomeProc.ItemIndex := 0;
          edHoraInicio.Clear;
          edHoraFim.Clear;
          btnalterarNovo.Visible := False;
          btnAddNovo.Visible := True;
      end;

        btnAddNovo.Visible := True;
        pnlAdd.Visible := True;
        btnadicionar.Visible := True;
        btnConfirmarAlteracoes.Visible := False;
        imgLogo2.Visible := True;
        imgLogo1.Visible := False;
  end;


procedure TPagConsultas.btnAddMouseEnter(Sender: TObject);
  begin
    btnAdd.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnAddMouseLeave(Sender: TObject);
  begin
    btnAdd.Color := $007C3E05;
  end;

procedure TPagConsultas.btnadicionarMouseEnter(Sender: TObject);
  begin
    btnadicionar.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnadicionarMouseLeave(Sender: TObject);
  begin
    btnadicionar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnAlterarMouseEnter(Sender: TObject);
  begin
    btnAlterar.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnAlterarMouseLeave(Sender: TObject);
  begin
    btnAlterar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnCancelarClick(Sender: TObject);
  begin
      calendar1.Enabled := True;
      pnlAdd.Visible := False;
      btnAddNovo.Visible := False;
      btnRestaurarNovo.Visible := False;
      pnlRestaurar.Visible := false;
      btnAlterarNovo.Visible := False;
      imgLogo1.Visible := True;
      imgLogo2.visible := False;
      panel2.Visible := False;
      sgConsultas.Visible := False;
      calendar1.Visible := True;
      calendar1.Date := 01/10/2025;
  end;

procedure TPagConsultas.btnCancelarMouseEnter(Sender: TObject);
  begin
    btnCancelar.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnCancelarMouseLeave(Sender: TObject);
  begin
    btnCancelar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagConsultas.btnDeletarMouseEnter(Sender: TObject);
  begin
    btnDeletar.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnDeletarMouseLeave(Sender: TObject);
  begin
    btnDeletar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnLimparClick(Sender: TObject);
  begin
    cbNomePaci.ItemIndex := 0;
    cbNomeProf.ItemIndex := 0;
    cbNomeProc.ItemIndex := 0;
    edHoraInicio.Clear;
    edHoraFim.Clear;
  end;

procedure TPagConsultas.btnLimparMouseEnter(Sender: TObject);
  begin
    btnLimpar.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnLimparMouseLeave(Sender: TObject);
  begin
    btnLimpar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnRestaurarMouseEnter(Sender: TObject);
  begin
    btnRestaurar.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnRestaurarMouseLeave(Sender: TObject);
  begin
    btnRestaurar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnSairClick(Sender: TObject);
  begin
    Close;
  end;

procedure TPagConsultas.btnSairMouseEnter(Sender: TObject);
  begin
    btnSair.Color := $00F78B2B;
  end;

procedure TPagConsultas.btnSairMouseLeave(Sender: TObject);
  begin
    btnSair.Color := $007C3E05;
  end;

procedure TPagConsultas.btnXClick(Sender: TObject);
  begin
    Close;
  end;

procedure TPagConsultas.Panel1Click(Sender: TObject);
  begin

    if pnlAdd.Visible = True then begin
      pnlAdd.Visible := False;
      btnAddNovo.Visible := False;
      btnAlterarnovo.Visible := False;
    end;
    sgConsultas.Visible := True;
    sgConsultas.Cells[0,0] := 'ID';
    sgConsultas.Cells[1,0] := 'Paciente';
    sgConsultas.Cells[2,0] := 'Profissional';
    sgConsultas.Cells[3,0] := 'Procedimento';
    sgConsultas.Cells[4,0] := 'Data';
    sgConsultas.Cells[5,0] := 'Hora Inicio';
    sgConsultas.Cells[6,0] := 'Hora Fim';

    sgConsultas.ColWidths[0] := 50;
    sgConsultas.ColWidths[1] := 120;
    sgConsultas.ColWidths[2] := 120;
    sgConsultas.ColWidths[3] := 120;
    sgConsultas.ColWidths[4] := 120;
    sgConsultas.ColWidths[5] := 120;
    sgConsultas.ColWidths[6] := 120;
    calendar1.Visible := False;
    panel2.Visible := True;
  end;

procedure TPagConsultas.Panel1MouseEnter(Sender: TObject);
  begin
    panel1.Color := $00F78B2B;
  end;

procedure TPagConsultas.Panel1MouseLeave(Sender: TObject);
  begin
    panel1.Color := $007C3E05;
  end;

end.
