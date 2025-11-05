unit TelaConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.WinXCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.Samples.Calendar, System.Generics.Collections,
  uPacientes, uProfissionais, uProcedimentos, Vcl.WinXCalendars,
  uConsultasController, uConsultas, Vcl.ExtDlgs, uConsultaControllerLog, uDadosGlobais;

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
    tmrAtualizarStatus: TTimer;

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
    procedure btnadicionarClick(Sender: TObject);
    procedure btnSugerirHorarioClick(Sender: TObject);
    procedure btnLimparHorarioClick(Sender: TObject);
    procedure Panel1MouseEnter(Sender: TObject);
    procedure Panel1MouseLeave(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarAlteracoesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edHoraInicioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNomePaciKeyPress(Sender: TObject; var Key: Char);
    procedure cbNomeProfKeyPress(Sender: TObject; var Key: Char);
    procedure cbNomeProcKeyPress(Sender: TObject; var Key: Char);
    procedure edHoraInicioKeyPress(Sender: TObject; var Key: Char);
    procedure edHoraFimKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CarregarConsultas;
    procedure tmrAtualizarStatusTimer(Sender: TObject);
    procedure sgConsultasDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);

  private
    Controller: TConsultaController;
    ConsController: TLogController;
    ConsultaIdAlterar: Integer;
    procedure CarregarComboBox;
    procedure RecarregarComboBox;
    procedure AtualizarHora;
    procedure SugerirHorarioDisponivel;
    function ConverterParaHora(const Texto: string): TTime;
    procedure CarregarDadosConsultaNaTela;
    procedure ConfigurarEstadoBotaoAlterar;
    function ValidarCampos: Boolean;

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
    sgConsultas.Cells[5, 0] := 'Hora Inicio';
    sgConsultas.Cells[6, 0] := 'Hora Fim';
    sgConsultas.Cells[7, 0] := 'Status';

    I := 1;
    for Consulta in Lista do begin
      sgConsultas.Cells[0, I] := Consulta.Id.ToString;
      sgConsultas.Cells[1, I] := Consulta.NomePaciente;
      sgConsultas.Cells[2, I] := Consulta.NomeProfissional;
      sgConsultas.Cells[3, I] := Consulta.NomeProcedimento;
      sgConsultas.Cells[4, I] := DateToStr(Consulta.Data);
      sgConsultas.Cells[5, I] := FormatDateTime('hh:nn', Consulta.HoraInicio);
      sgConsultas.Cells[6, I] := FormatDateTime('hh:nn', Consulta.HoraFim);

      // Determinar status baseado no campo ativo e na data/hora
      if Consulta.Ativo then begin
        if (Consulta.Data > Date) or
          ((Consulta.Data = Date) and (Consulta.HoraInicio > Time)) then
          sgConsultas.Cells[7, I] := 'Agendado'
        else if (Consulta.Data < Date) or
          ((Consulta.Data = Date) and (Consulta.HoraFim < Time)) then
          sgConsultas.Cells[7, I] := 'Concluído'
        else
          sgConsultas.Cells[7, I] := 'Em Andamento'
      end
      else
        sgConsultas.Cells[7, I] := 'Cancelado';

      Inc(I);
    end;
  finally
    Lista.Free;
  end;
end;

procedure TPagConsultas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Calendar1.Enabled := True;
  pnlAdd.Visible := False;
  btnAddNovo.Visible := False;
  btnRestaurarNovo.Visible := False;
  pnlRestaurar.Visible := False;
  btnAlterarNovo.Visible := False;
  imgLogo1.Visible := True;
  imgLogo2.Visible := False;
  Panel2.Visible := False;
  sgConsultas.Visible := False;
  Calendar1.Visible := True;
  Calendar1.Date := EncodeDate(2025, 10, 1);
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

  // Configurar timer para atualizar status a cada minuto
  tmrAtualizarStatus.Interval := 60000; // 60 segundos
  tmrAtualizarStatus.Enabled := True;

  // Inicializa variáveis e estados
  ConsultaIdAlterar := 0;
  btnAlterar.Enabled := False; // Começa desabilitado
  btnConfirmarAlteracoes.Visible := False;
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

procedure TPagConsultas.RecarregarComboBox;
var
  ListaPacientes: TObjectList<TPaciente>;
  ListaProfissionais: TObjectList<TProfissionais>;
  ListaProcedimentos: TObjectList<TProcedimento>;
  Paciente: TPaciente;
  Profissional: TProfissionais;
  Procedimento: TProcedimento;
  SelectedIndexPaci, SelectedIndexProf, SelectedIndexProc: Integer;
  SelectedNamePaci, SelectedNameProf, SelectedNameProc: string;
begin
  // Salvar as seleções atuais
  SelectedIndexPaci := cbNomePaci.ItemIndex;
  SelectedIndexProf := cbNomeProf.ItemIndex;
  SelectedIndexProc := cbNomeProc.ItemIndex;

  SelectedNamePaci := '';
  SelectedNameProf := '';
  SelectedNameProc := '';

  if SelectedIndexPaci >= 0 then
    SelectedNamePaci := cbNomePaci.Items[SelectedIndexPaci];
  if SelectedIndexProf >= 0 then
    SelectedNameProf := cbNomeProf.Items[SelectedIndexProf];
  if SelectedIndexProc >= 0 then
    SelectedNameProc := cbNomeProc.Items[SelectedIndexProc];

  // Limpar os comboboxes
  cbNomePaci.Clear;
  cbNomeProf.Clear;
  cbNomeProc.Clear;

  // Recarregar os dados
  ListaPacientes := Controller.BuscarPacientes;
  if Assigned(ListaPacientes) then
    try
      for Paciente in ListaPacientes do
        cbNomePaci.Items.AddObject(Paciente.Nome, TObject(Paciente.Id));
    finally
      ListaPacientes.Free;
    end;

  ListaProfissionais := Controller.BuscarProfissionais;
  if Assigned(ListaProfissionais) then
    try
      for Profissional in ListaProfissionais do
        cbNomeProf.Items.AddObject(Profissional.Nome, TObject(Profissional.Id));
    finally
      ListaProfissionais.Free;
    end;

  ListaProcedimentos := Controller.BuscarProcedimentos;
  if Assigned(ListaProcedimentos) then
    try
      for Procedimento in ListaProcedimentos do
        cbNomeProc.Items.AddObject(Procedimento.Nome, TObject(Procedimento.Id));
    finally
      ListaProcedimentos.Free;
    end;

  // Restaurar as seleções
  cbNomePaci.ItemIndex := -1;
  cbNomeProf.ItemIndex := -1;
  cbNomeProc.ItemIndex := -1;

  if SelectedNamePaci <> '' then
    cbNomePaci.ItemIndex := cbNomePaci.Items.IndexOf(SelectedNamePaci);
  if SelectedNameProf <> '' then
    cbNomeProf.ItemIndex := cbNomeProf.Items.IndexOf(SelectedNameProf);
  if SelectedNameProc <> '' then
    cbNomeProc.ItemIndex := cbNomeProc.Items.IndexOf(SelectedNameProc);
end;

procedure TPagConsultas.AtualizarHora;
var
  HoraInicio: TTime;
  IdProcedimento: Integer;
  HoraFimCalculada: TDateTime;
begin
  if cbNomeProc.ItemIndex = -1 then
    Exit;

  // Usar nossa funcao de conversao
  HoraInicio := ConverterParaHora(edHoraInicio.Text);

  if (HoraInicio = 0) and (edHoraInicio.Text <> '') then begin
    ShowMessage('Hora de inicio invalida! Use o formato HH:MM');
    Exit;
  end;

  IdProcedimento := Integer(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]);
  HoraFimCalculada := Controller.CalcularHoraFim(HoraInicio, IdProcedimento);
  edHoraFim.Text := FormatDateTime('hh:nn', HoraFimCalculada);
end;

procedure TPagConsultas.edHoraInicioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Key := 0;
    AtualizarHora;
    edHoraFim.SetFocus;
  end;
end;

procedure TPagConsultas.cbNomePaciKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0; // bloqueia o som
    cbNomeProf.SetFocus;
  end;
end;

procedure TPagConsultas.cbNomeProfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0; // bloqueia o som
    cbNomeProc.SetFocus;
  end;
end;

procedure TPagConsultas.cbNomeProcKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0; // bloqueia o som
    edHoraInicio.SetFocus;
  end;
end;

procedure TPagConsultas.edHoraInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0; // bloqueia o som
    AtualizarHora;
    edHoraFim.SetFocus;
  end;
end;

procedure TPagConsultas.edHoraFimKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0; // bloqueia o som
    // Chama o evento do botão adicionar
    btnadicionarClick(btnadicionar);
  end;
end;

procedure TPagConsultas.btnAddClick(Sender: TObject);
begin
  if sgConsultas.Visible then
    sgConsultas.Visible := False;

  Calendar1.Visible := True;
  Panel2.Visible := False;

  if Calendar1.Date > 0 then begin
    // Validar se a data selecionada nao e do passado
    if Calendar1.Date < Date then begin
      ShowMessage
        ('Data invalida! Nao e possivel agendar consultas para datas passadas.');
      Exit;
    end;

    DateTimePicker1.Date := Calendar1.Date;
    Calendar1.Enabled := False;
  end;

  pnlRestaurar.Visible := False;
  btnRestaurarNovo.Visible := False;

  if btnAlterarNovo.Visible then begin
    cbNomePaci.ItemIndex := -1;
    cbNomeProf.ItemIndex := -1;
    cbNomeProc.ItemIndex := -1;
    edHoraInicio.Clear;
    edHoraFim.Clear;
    btnAlterarNovo.Visible := False;
    btnAddNovo.Visible := True;
  end;

  // Recarregar os dados dos comboboxes
  RecarregarComboBox;

  pnlAdd.Visible := True;
  btnadicionar.Visible := True;
  btnConfirmarAlteracoes.Visible := False;
  imgLogo2.Visible := True;
  imgLogo1.Visible := False;
end;

procedure TPagConsultas.btnCancelarClick(Sender: TObject);
begin
  Calendar1.Enabled := True;
  pnlAdd.Visible := False;
  btnAddNovo.Visible := False;
  btnRestaurarNovo.Visible := False;
  pnlRestaurar.Visible := False;
  btnAlterarNovo.Visible := False;
  imgLogo1.Visible := True;
  imgLogo2.Visible := False;
  Panel2.Visible := False;
  sgConsultas.Visible := False;
  Calendar1.Visible := True;
  Calendar1.Date := 01 / 10 / 2025;
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

  ConfigurarEstadoBotaoAlterar;
  sgConsultas.ColWidths[2] := 120;
  sgConsultas.ColWidths[3] := 120;
  sgConsultas.ColWidths[4] := 120;
  sgConsultas.ColWidths[5] := 120;
  sgConsultas.ColWidths[6] := 120;

  Calendar1.Visible := False;
  Panel2.Visible := True;
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

procedure TPagConsultas.sgConsultasDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
  var
  BGColor: TColor;
begin
  if gdSelected in State then
    BGColor := clHighlight
  else
    BGColor := clWindow;
  sgConsultas.Canvas.Brush.Color := BGColor;
  sgConsultas.Canvas.FillRect(Rect);
  if gdSelected in State then
    sgConsultas.Canvas.Font.Color := clHighlightText
  else
    sgconsultas.Canvas.Font.Color := clWindowText;
    sgConsultas.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgConsultas.Cells[ACol, ARow]);
end;

procedure TPagConsultas.btnXClick(Sender: TObject);
begin
  Close;
end;

procedure TPagConsultas.SugerirHorarioDisponivel;
var
  HoraSugerida, HoraFimSugerida: TTime;
  DataAtual: TDate;
  HorarioEncontrado: Boolean;
  I: Integer;
begin
  if (cbNomeProf.ItemIndex = -1) or (cbNomeProc.ItemIndex = -1) then begin
    ShowMessage('Selecione um profissional e um procedimento primeiro!');
    Exit;
  end;

  DataAtual := DateTimePicker1.Date;
  HorarioEncontrado := False;

  // Verificar horários disponíveis a cada 30 minutos
  for I := 8 to 18 do // Das 8h às 18h
  begin
    if HorarioEncontrado then
      Break;

    HoraSugerida := EncodeTime(I, 0, 0, 0); // Hora cheia

    // Calcular hora fim com base no procedimento
    HoraFimSugerida := Controller.CalcularHoraFim(HoraSugerida,
      Integer(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]));

    // Verificar se o horario esta disponivel
    if Controller.VerificarHorarioDisponivel(DataAtual, HoraSugerida,
      HoraFimSugerida, Integer(cbNomeProf.Items.Objects[cbNomeProf.ItemIndex]))
    then begin
      // Sugerir o horario encontrado
      edHoraInicio.Text := FormatDateTime('hh:nn', HoraSugerida);
      edHoraFim.Text := FormatDateTime('hh:nn', HoraFimSugerida);
      HorarioEncontrado := True;
    end;

    // Tentar a cada 30 minutos
    if not HorarioEncontrado then begin
      HoraSugerida := EncodeTime(I, 30, 0, 0); // Meia hora
      HoraFimSugerida := Controller.CalcularHoraFim(HoraSugerida,
        Integer(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]));

      if Controller.VerificarHorarioDisponivel(DataAtual, HoraSugerida,
        HoraFimSugerida, Integer(cbNomeProf.Items.Objects[cbNomeProf.ItemIndex]))
      then begin
        edHoraInicio.Text := FormatDateTime('hh:nn', HoraSugerida);
        edHoraFim.Text := FormatDateTime('hh:nn', HoraFimSugerida);
        HorarioEncontrado := True;
      end;
    end;
  end;

  if not HorarioEncontrado then begin
    ShowMessage
      ('Nao foram encontrados horarios disponiveis para este profissional neste dia.');
  end
  else begin
    ShowMessage('Horario disponivel encontrado!');
  end;
end;

procedure TPagConsultas.btnSugerirHorarioClick(Sender: TObject);
begin
  SugerirHorarioDisponivel;
end;

procedure TPagConsultas.btnLimparHorarioClick(Sender: TObject);
begin
  edHoraInicio.Clear;
  edHoraFim.Clear;
  edHoraInicio.SetFocus;
end;

function TPagConsultas.ConverterParaHora(const Texto: string): TTime;
var
  TextoLimpo: string;
  Hora, Minuto: Integer;
begin
  Result := 0;
  TextoLimpo := StringReplace(Texto, ' ', '', [rfReplaceAll]);
  if TextoLimpo = '' then
    Exit;
  TextoLimpo := StringReplace(TextoLimpo, ':', '', [rfReplaceAll]);

  // Tentar converter digitos para numeros
  try
    if Length(TextoLimpo) >= 2 then begin
      Hora := StrToInt(Copy(TextoLimpo, 1, 2));
      Minuto := 0;

      if Length(TextoLimpo) >= 4 then
        Minuto := StrToInt(Copy(TextoLimpo, 3, 2))
      else if Length(TextoLimpo) = 3 then
        Minuto := StrToInt(Copy(TextoLimpo, 3, 1));

      // Validar hora e minuto
      if (Hora >= 0) and (Hora <= 23) and (Minuto >= 0) and (Minuto <= 59) then
      begin
        Result := EncodeTime(Hora, Minuto, 0, 0);
      end;
    end;
  except
    // Erro ao converter, mantem 0
  end;
end;

procedure TPagConsultas.btnadicionarClick(Sender: TObject);
var
  PacienteId, ProfissionalId, ProcedimentoId: Integer;
  Data: TDate;
  HoraInicio, HoraFim: TTime;
  Sucesso: Boolean;
  NomePaciente, NomeProfissional, NomeProcedimento: string;
begin
  // Validar campos obrigatórios
  if cbNomePaci.ItemIndex = -1 then begin
    ShowMessage('Selecione um paciente!');
    cbNomePaci.SetFocus;
    Exit;
  end;

  if cbNomeProf.ItemIndex = -1 then begin
    ShowMessage('Selecione um profissional!');
    cbNomeProf.SetFocus;
    Exit;
  end;

  if cbNomeProc.ItemIndex = -1 then begin
    ShowMessage('Selecione um procedimento!');
    cbNomeProc.SetFocus;
    Exit;
  end;

  if Trim(edHoraInicio.Text) = '' then begin
    ShowMessage('Informe a hora de início!');
    edHoraInicio.SetFocus;
    Exit;
  end;

  if Trim(edHoraFim.Text) = '' then begin
    ShowMessage('Informe a hora de fim!');
    edHoraFim.SetFocus;
    Exit;
  end;

  // Obter os valores dos campos
  PacienteId := Integer(cbNomePaci.Items.Objects[cbNomePaci.ItemIndex]);
  ProfissionalId := Integer(cbNomeProf.Items.Objects[cbNomeProf.ItemIndex]);
  ProcedimentoId := Integer(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]);

  Data := DateTimePicker1.Date;

  // Validar se a data não é do passado
  if Data < Date then begin
    ShowMessage('Nao e possivel agendar consultas para datas passadas!');
    DateTimePicker1.SetFocus;
    Exit;
  end;

  // Converter as horas usando a funcao auxiliar
  HoraInicio := ConverterParaHora(edHoraInicio.Text);
  HoraFim := ConverterParaHora(edHoraFim.Text);

  if (HoraInicio = 0) and (edHoraInicio.Text <> '') then begin
    ShowMessage('Hora de inicio invalida! Use o formato HH:MM');
    edHoraInicio.SetFocus;
    Exit;
  end;

  if (HoraFim = 0) and (edHoraFim.Text <> '') then begin
    ShowMessage('Hora de fim invalida! Use o formato HH:MM');
    edHoraFim.SetFocus;
    Exit;
  end;

  // Validar se a hora nao e passada (para hoje)
  if (Data = Date) and (HoraInicio < Time) then begin
    ShowMessage('Nao e possivel agendar consultas para horarios passados!');
    edHoraInicio.SetFocus;
    Exit;
  end;

  // Verificar se a hora de fim e posterior a hora de inicio
  if HoraFim <= HoraInicio then begin
    ShowMessage('A hora de fim deve ser posterior a hora de inicio!');
    edHoraFim.SetFocus;
    Exit;
  end;

  // Verificar se o horario esta disponivel
  if not Controller.VerificarHorarioDisponivel(Data, HoraInicio, HoraFim,
    ProfissionalId) then begin
    ShowMessage
      ('Horario nao esta disponivel! Verifique se ja existe uma consulta agendada neste horario.');
    edHoraInicio.SetFocus;
    Exit;
  end;

  // Tentar adicionar a consulta
  Sucesso := Controller.AdicionarConsulta(PacienteId, ProfissionalId,
    ProcedimentoId, Data, HoraInicio, HoraFim);

  if Sucesso then begin
    // Obter nomes para o log
    if cbNomePaci.ItemIndex >= 0 then
      NomePaciente := cbNomePaci.Items[cbNomePaci.ItemIndex];
    if cbNomeProf.ItemIndex >= 0 then
      NomeProfissional := cbNomeProf.Items[cbNomeProf.ItemIndex];
    if cbNomeProc.ItemIndex >= 0 then
      NomeProcedimento := cbNomeProc.Items[cbNomeProc.ItemIndex];

    // Adicionar log
    ConsController := TLogController.Create;
    try
      ConsController.RegistrarLog(UsuarioLogado.Nome, NomePaciente, NomeProfissional, NomeProcedimento,
        FormatDateTime('dd/mm/yyyy', Data), FormatDateTime('hh:nn', HoraInicio), 'Agendou Consulta',
        '');
    finally
      ConsController.Free;
    end;

    ShowMessage('Consulta agendada com sucesso!');

    // Limpar os campos
    cbNomePaci.ItemIndex := -1;
    cbNomeProf.ItemIndex := -1;
    cbNomeProc.ItemIndex := -1;
    edHoraInicio.Clear;
    edHoraFim.Clear;

    // Atualizar a lista de consultas se estiver visivel
    if sgConsultas.Visible then begin
      CarregarConsultas;
    end;

    // Fechar o painel de adicao
    pnlAdd.Visible := False;
    btnAddNovo.Visible := False;
    imgLogo2.Visible := False;
    imgLogo1.Visible := True;
  end
  else begin
    ShowMessage('Erro ao agendar consulta! Tente novamente.');
  end;
end;

procedure TPagConsultas.tmrAtualizarStatusTimer(Sender: TObject);
begin
  // Atualizar o status das consultas se o grid estiver visivel
  if sgConsultas.Visible then begin
    CarregarConsultas;
  end;
end;


procedure TPagConsultas.btnAlterarClick(Sender: TObject);
var
  Linha: Integer;
begin
  Linha := sgConsultas.Row;
  if Linha <= 0 then begin
    ShowMessage('Selecione uma consulta para alterar!');
    Exit;
  end;

  if pnlRestaurar.Visible = true then begin
    pnlRestaurar.Visible := False;
    btnRestaurarNovo.Visible := False;
  end;

  // Recarregar os dados dos comboboxes
  RecarregarComboBox;

  // Carrega os dados da consulta selecionada
  ConsultaIdAlterar := StrToIntDef(sgConsultas.Cells[0, Linha], 0);
  CarregarDadosConsultaNaTela;

  btnConfirmarAlteracoes.Visible := true;
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := true;
  pnlAdd.Visible := true;
end;


procedure TPagConsultas.btnConfirmarAlteracoesClick(Sender: TObject);
var
  PacienteId, ProfissionalId, ProcedimentoId: Integer;
  HoraInicio, HoraFim: TTime;
  NomePaciente, NomeProfissional, NomeProcedimento: string;
begin
  if ValidarCampos then
  begin
    try
      // Obtém os IDs dos itens selecionados nos combos
      PacienteId := Integer(cbNomePaci.Items.Objects[cbNomePaci.ItemIndex]);
      ProfissionalId := Integer(cbNomeProf.Items.Objects[cbNomeProf.ItemIndex]);
      ProcedimentoId := Integer(cbNomeProc.Items.Objects[cbNomeProc.ItemIndex]);
      HoraInicio := ConverterParaHora(edHoraInicio.Text);
      HoraFim := ConverterParaHora(edHoraFim.Text);

      // Chama o controller para alterar a consulta
      if Controller.AlterarConsulta(ConsultaIdAlterar, PacienteId, ProfissionalId,
                               ProcedimentoId, DateTimePicker1.Date, HoraInicio, HoraFim) then
      begin
        // Adicionar log
        if cbNomePaci.ItemIndex >= 0 then
          NomePaciente := cbNomePaci.Items[cbNomePaci.ItemIndex];
        if cbNomeProf.ItemIndex >= 0 then
          NomeProfissional := cbNomeProf.Items[cbNomeProf.ItemIndex];
        if cbNomeProc.ItemIndex >= 0 then
          NomeProcedimento := cbNomeProc.Items[cbNomeProc.ItemIndex];

        ConsController := TLogController.Create;
        try
          ConsController.RegistrarLog(UsuarioLogado.Nome, NomePaciente, NomeProfissional, NomeProcedimento,
            FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date), FormatDateTime('hh:nn', HoraInicio), 'Alterou Consulta',
            '');
        finally
          ConsController.Free;
        end;

        ShowMessage('Consulta alterada com sucesso!');
        CarregarConsultas;
        pnlAdd.Visible := False;
        imgLogo1.Visible := True;
        imgLogo2.Visible := False;
        btnConfirmarAlteracoes.Visible := False;
        ConsultaIdAlterar := 0;
        ConfigurarEstadoBotaoAlterar;
      end
      else
      begin
        ShowMessage('Não foi possível alterar a consulta! Verifique o horário.');
      end;
    except
      on E: Exception do
        ShowMessage('Erro ao alterar consulta: ' + E.Message);
    end;
  end;
end;

procedure TPagConsultas.ConfigurarEstadoBotaoAlterar;
begin
  // Botão alterar sempre fica habilitado quando o grid estiver visível
  // A validação é feita no momento do clique
  btnAlterar.Enabled := sgConsultas.Visible;
end;

procedure TPagConsultas.CarregarDadosConsultaNaTela;
var
  i: Integer;
begin
  if ConsultaIdAlterar <= 0 then Exit;

  // Procura o paciente no combobox
  for i := 0 to cbNomePaci.Items.Count - 1 do
  begin
    if cbNomePaci.Items[i] = sgConsultas.Cells[1, sgConsultas.Row] then
    begin
      cbNomePaci.ItemIndex := i;
      Break;
    end;
  end;

  // Procura o profissional no combobox
  for i := 0 to cbNomeProf.Items.Count - 1 do
  begin
    if cbNomeProf.Items[i] = sgConsultas.Cells[2, sgConsultas.Row] then
    begin
      cbNomeProf.ItemIndex := i;
      Break;
    end;
  end;

  // Procura o procedimento no combobox
  for i := 0 to cbNomeProc.Items.Count - 1 do
  begin
    if cbNomeProc.Items[i] = sgConsultas.Cells[3, sgConsultas.Row] then
    begin
      cbNomeProc.ItemIndex := i;
      Break;
    end;
  end;

  // Carrega data e horários
  try
    DateTimePicker1.Date := StrToDate(sgConsultas.Cells[4, sgConsultas.Row]);
  except
    // Se não conseguir converter, usa a data atual
    DateTimePicker1.Date := Date;
  end;

  edHoraInicio.Text := sgConsultas.Cells[5, sgConsultas.Row];
  edHoraFim.Text := sgConsultas.Cells[6, sgConsultas.Row];

  // Mostra o botão de confirmar alterações
  btnConfirmarAlteracoes.Visible := True;
end;

function TPagConsultas.ValidarCampos: Boolean;
var
  HoraInicio, HoraFim: TTime;
begin
  Result := False;

  // Valida seleção dos combos
  if cbNomePaci.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um paciente!');
    cbNomePaci.SetFocus;
    Exit;
  end;

  if cbNomeProf.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um profissional!');
    cbNomeProf.SetFocus;
    Exit;
  end;

  if cbNomeProc.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um procedimento!');
    cbNomeProc.SetFocus;
    Exit;
  end;

  // Valida horários usando o método ConverterParaHora
  HoraInicio := ConverterParaHora(edHoraInicio.Text);
  if HoraInicio = 0 then
  begin
    ShowMessage('Hora de início inválida!');
    edHoraInicio.SetFocus;
    Exit;
  end;

  HoraFim := ConverterParaHora(edHoraFim.Text);
  if HoraFim = 0 then
  begin
    ShowMessage('Hora de fim inválida!');
    edHoraFim.SetFocus;
    Exit;
  end;

  // Valida se hora fim é maior que hora início
  if HoraFim <= HoraInicio then
  begin
    ShowMessage('Hora fim deve ser maior que hora início!');
    edHoraFim.SetFocus;
    Exit;
  end;

  // Valida se a data não é no passado
  if DateTimePicker1.Date < Date then
  begin
    ShowMessage('Não é possível agendar consultas para datas passadas!');
    DateTimePicker1.SetFocus;
    Exit;
  end;

  Result := True;
end;

end.
