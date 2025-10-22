unit TelaConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Samples.Calendar, uConsultasController, uConsultas, System.Generics.Collections,
  uPacientes, uProfissionais, uProcedimentos;

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
    cbHorario: TComboBox;
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
    procedure PreencherCombos;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AtualizarHorariosDisponiveis;
    procedure cbNomeProfChange(Sender: TObject);
    procedure cbNomeProcChange(Sender: TObject);
    procedure Calendar1Change(Sender: TObject);
  private
    ConsultaController: TConsultaController;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagConsultas: TPagConsultas;

implementation

{$R *.dfm}

procedure TPagConsultas.AtualizarHorariosDisponiveis;
  var
  Horarios: TList<TTime>;
  Profissional: TProfissionais;
  Procedimento: TProcedimento;
  i: Integer;
begin
  cbHorario.Clear;

  if (cbNomeProf.ItemIndex = -1) or (cbNomeProc.ItemIndex = -1) then
    Exit;

  Profissional := TProfissionais(cbNomeProf.Items.Objects[cbNomeProf.ItemIndex]);
  Procedimento := TProcedimento(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]);

  Horarios := ConsultaController.ListarHorariosDisponiveis(
    Profissional.Id,
    Procedimento.Id,
    Calendar1.CalendarDate
  );
  try
    for i := 0 to Horarios.Count - 1 do
      cbHorario.Items.Add(FormatDateTime('hh:nn', Horarios[i]));
  finally
    Horarios.Free;
  end;
end;

procedure TPagConsultas.btnAddClick(Sender: TObject);
  begin
    if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
    end;

    if (btnAlterarNovo.Visible = True) then begin
        cbNomePaci.ItemIndex := -1;
        cbNomeProf.ItemIndex := -1;
        cbNomeProc.ItemIndex := -1;
        cbHorario.ItemIndex := -1;
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
      pnlAdd.Visible := False;
      btnAddNovo.Visible := False;
      btnRestaurarNovo.Visible := False;
      pnlRestaurar.Visible := false;
      btnAlterarNovo.Visible := False;
      imgLogo1.Visible := True;
      imgLogo2.visible := False;
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
    cbNomePaci.ItemIndex := -1;
    cbNomeProf.ItemIndex := -1;
    cbNomeProc.ItemIndex := -1;
    cbHorario.ItemIndex := -1;
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

procedure TPagConsultas.Calendar1Change(Sender: TObject);
  begin
    AtualizarHorariosDisponiveis;
  end;

procedure TPagConsultas.cbNomeProcChange(Sender: TObject);
  begin
    AtualizarHorariosDisponiveis;
  end;

procedure TPagConsultas.cbNomeProfChange(Sender: TObject);
  begin
    AtualizarHorariosDisponiveis;
  end;

procedure TPagConsultas.FormDestroy(Sender: TObject);
  begin
    ConsultaController.Free;
  end;

procedure TPagConsultas.FormShow(Sender: TObject);
  begin
    ConsultaController := TConsultaController.Create;
    PreencherCombos;
  end;

procedure TPagConsultas.PreencherCombos;
  var
    ListaPacientes: TObjectList<TPaciente>;
    Paciente: TPaciente;
    ListaProfissionais: TObjectList<TProfissionais>;
    Profissional: TProfissionais;
    ListaProcedimentos: TObjectList<TProcedimento>;
    Procedimento: TProcedimento;
  begin
    cbNomePaci.Clear;
    cbNomeProf.Clear;
    cbNomeProc.Clear;

    ListaPacientes := ConsultaController.ListarPacientes;
    try
      for Paciente in ListaPacientes do
        cbNomePaci.Items.AddObject(Paciente.Nome, Paciente);
    finally
      ListaPacientes.Free;
    end;


    ListaProfissionais := ConsultaController.ListarProfissionais;
    try
      for Profissional in ListaProfissionais do
        cbNomeProf.Items.AddObject(Profissional.Nome, Profissional);
    finally
      ListaProfissionais.Free;
    end;

    ListaProcedimentos := ConsultaController.ListarProcedimentos;
    try
      for Procedimento in ListaProcedimentos do
        cbNomeProc.Items.AddObject(Procedimento.Nome, Procedimento);
    finally
      ListaProcedimentos.Free;
    end;

  end;

end.
