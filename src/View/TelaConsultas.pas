unit TelaConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Samples.Calendar, System.Generics.Collections,
  uPacientes, uProfissionais, uProcedimentos, Vcl.WinXCalendars,
  uConsultasController, uConsultas;

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
    procedure edHoraInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregarConsultas;

  private
    Controller: TConsultaController;
    procedure CarregarComboBox;
    procedure AtualizarHora;

  public
    { Public declarations }
  end;

var
  PagConsultas: TPagConsultas;

implementation

{$R *.dfm}

procedure TPagConsultas.CarregarConsultas;
var
  Lista: TObjectList<TConsulta>;
  Consulta: TConsulta;
  I: Integer;
begin
  Lista := Controller.BuscarConsultas;
  try
    sgConsultas.RowCount := Lista.Count + 1;
    sgConsultas.Cells[0, 0] := 'ID';
    sgConsultas.Cells[1, 0] := 'Paciente';
    sgConsultas.Cells[2, 0] := 'Profissional';
    sgConsultas.Cells[3, 0] := 'Procedimento';
    sgConsultas.Cells[4, 0] := 'Data';
    sgConsultas.Cells[5, 0] := 'Hora Início';
    sgConsultas.Cells[6, 0] := 'Hora Fim';

    I := 1;
    for Consulta in Lista do
    begin
      sgConsultas.Cells[0, I] := Consulta.Id.ToString;
      sgConsultas.Cells[1, I] := Consulta.NomePaciente;
      sgConsultas.Cells[2, I] := Consulta.NomeProfissional;
      sgConsultas.Cells[3, I] := Consulta.NomeProcedimento;
      sgConsultas.Cells[4, I] := DateToStr(Consulta.Data);
      sgConsultas.Cells[5, I] := FormatDateTime('hh:nn', Consulta.HoraInicio);
      sgConsultas.Cells[6, I] := FormatDateTime('hh:nn', Consulta.HoraFim);
      Inc(I);
    end;
  finally
    Lista.Free;
  end;
end;

procedure TPagConsultas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  calendar1.Enabled := True;
  pnlAdd.Visible := False;
  btnAddNovo.Visible := False;
  btnRestaurarNovo.Visible := False;
  pnlRestaurar.Visible := False;
  btnAlterarNovo.Visible := False;
  imgLogo1.Visible := True;
  imgLogo2.Visible := False;
  panel2.Visible := False;
  sgConsultas.Visible := False;
  calendar1.Visible := True;
  calendar1.Date := EncodeDate(2025,10,1);
  cbNomePaci.ItemIndex := -1;
  cbNomeProf.ItemIndex := -1;
  cbNomeProc.ItemIndex := -1;
  edHoraInicio.Clear;
  edHoraFim.Clear;
end;

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
  cbNomePaci.ItemIndex := -1;
  ListaProfissionais := Controller.BuscarProfissionais;
  if Assigned(ListaProfissionais) then
  try
    for Profissional in ListaProfissionais do
      cbNomeProf.Items.AddObject(Profissional.Nome, TObject(Profissional.Id));
  finally
    ListaProfissionais.Free;
  end;
  cbNomeProf.ItemIndex := -1;
  ListaProcedimentos := Controller.BuscarProcedimentos;
  if Assigned(ListaProcedimentos) then
  try
    for Procedimento in ListaProcedimentos do
      cbNomeProc.Items.AddObject(Procedimento.Nome, TObject(Procedimento.Id));
  finally
    ListaProcedimentos.Free;
  end;
  cbNomeProc.ItemIndex := -1;
end;

procedure TPagConsultas.AtualizarHora;
var
  HoraInicio, HoraFim: TDateTime;
  IdProcedimento: Integer;
begin
  if cbNomeProc.ItemIndex = -1 then Exit;

  if not TryStrToTime(edHoraInicio.Text, HoraInicio) then
  begin
    ShowMessage('Hora de início inválida!');
    Exit;
  end;

  IdProcedimento := Integer(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]);
  HoraFim := Controller.CalcularHoraFim(HoraInicio, IdProcedimento);
  edHoraFim.Text := FormatDateTime('hh:nn', HoraFim);
end;

procedure TPagConsultas.edHoraInicioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    AtualizarHora;
    edHoraFim.SetFocus;
  end;
end;

procedure TPagConsultas.btnAddClick(Sender: TObject);
begin
  if sgConsultas.Visible then
    sgConsultas.Visible := False;

  calendar1.Visible := True;
  panel2.Visible := False;

  if Calendar1.Date > 0 then
  begin
    DateTimePicker1.Date := Calendar1.Date;
    Calendar1.Enabled := False;
  end;

  pnlRestaurar.Visible := False;
  btnRestaurarNovo.Visible := False;

  if btnAlterarNovo.Visible then
  begin
    cbNomePaci.ItemIndex := -1;
    cbNomeProf.ItemIndex := -1;
    cbNomeProc.ItemIndex := -1;
    edHoraInicio.Clear;
    edHoraFim.Clear;
    btnAlterarNovo.Visible := False;
    btnAddNovo.Visible := True;
  end;

  pnlAdd.Visible := True;
  btnadicionar.Visible := True;
  btnConfirmarAlteracoes.Visible := False;
  imgLogo2.Visible := True;
  imgLogo1.Visible := False;
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

procedure TPagConsultas.btnLimparClick(Sender: TObject);
begin
  cbNomePaci.ItemIndex := -1;
  cbNomeProf.ItemIndex := -1;
  cbNomeProc.ItemIndex := -1;
  edHoraInicio.Clear;
  edHoraFim.Clear;
end;

procedure TPagConsultas.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TPagConsultas.Panel1Click(Sender: TObject);
begin
  pnlAdd.Visible := False;
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := False;

  sgConsultas.Visible := True;
  CarregarConsultas;

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
    btnadicionar.Color := $00C46106;
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

procedure TPagConsultas.btnDeletarMouseEnter(Sender: TObject);
  begin
    btnDeletar.Color := $00F78B2B;
  end;
procedure TPagConsultas.btnDeletarMouseLeave(Sender: TObject);
  begin
    btnDeletar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnCancelarMouseEnter(Sender: TObject);
  begin
    btnCancelar.Color := $00F78B2B;
  end;
procedure TPagConsultas.btnCancelarMouseLeave(Sender: TObject);
  begin
    btnCancelar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnRestaurarMouseEnter(Sender: TObject);
  begin
    btnRestaurar.Color := $00F78B2B;
  end;
procedure TPagConsultas.btnRestaurarMouseLeave(Sender: TObject);
  begin
    btnRestaurar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnLimparMouseEnter(Sender: TObject);
  begin
    btnLimpar.Color := $00F78B2B;
  end;
procedure TPagConsultas.btnLimparMouseLeave(Sender: TObject);
  begin
    btnLimpar.Color := $007C3E05;
  end;

procedure TPagConsultas.btnSairMouseEnter(Sender: TObject);
  begin
    btnSair.Color := $00F78B2B;
  end;
procedure TPagConsultas.btnSairMouseLeave(Sender: TObject);
  begin
    btnSair.Color := $007C3E05;
  end;

procedure TPagConsultas.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $00C46106;
  end;
procedure TPagConsultas.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagConsultas.Panel1MouseEnter(Sender: TObject);
  begin
    Panel1.Color := $00F78B2B;
  end;
procedure TPagConsultas.Panel1MouseLeave(Sender: TObject);
  begin
    Panel1.Color := $007C3E05;
  end;


procedure TPagConsultas.btnXClick(Sender: TObject);
  begin
    Close;
  end;

end.

