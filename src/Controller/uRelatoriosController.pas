unit uRelatoriosController;

interface

uses
  uRelatoriosRepository, uProfissionais, uProcedimentos, System.SysUtils,
  System.Generics.Collections, Vcl.Forms, Vcl.StdCtrls, FireDAC.Comp.Client,
  uUsuarioConexao, Vcl.Dialogs, frxClass, System.DateUtils, Vcl.Controls;

type
  TRelatoriosController = class
  private
    RepoRela: TRelatoriosRepository;
  public
    constructor Create;
    destructor Destroy; override;

    function BuscarProfissionais: TObjectList<TProfissionais>;
    function BuscarProcedimentos: TObjectList<TProcedimento>;
    procedure CarregarProfissionaisNoComboBox(ComboBox: TComboBox);
    procedure CarregarProcedimentosNoComboBox(ComboBox: TComboBox);
    function GerarRelatorioConsultas(DataInicio, DataFim: TDateTime): TFDQuery;
        function GerarRelatorioProcedimento(ProcedimentoId: integer; DataInicio, DataFim: TDateTime): TFDQuery;
    function GerarRelatorioConsultasPorData(DataSelecionada: TDateTime): TFDQuery;
    procedure GerarRelatorioConsultasFastReport(DataSelecionada: TDateTime);
    procedure GerarRelatorioProfissionalFastReport(ComboBox: TComboBox);
    function ContarConsultasConcluidas: Integer;
    function ContarConsultasAgendadas: Integer;
    function ContarConsultasCanceladas: Integer;
    function ValidarDatasRelatorio(DataInicio, DataFim: TDateTime): Boolean;
  end;

implementation

constructor TRelatoriosController.Create;
begin
  inherited;
  RepoRela := TRelatoriosRepository.Create;
end;

destructor TRelatoriosController.Destroy;
begin
  FreeAndNil(RepoRela);
  inherited;
end;

function TRelatoriosController.BuscarProfissionais: TObjectList<TProfissionais>;
begin
  try
    Result := RepoRela.BuscarProfissionaisAtivos;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao buscar profissionais: ' + E.Message);
    end;
  end;
end;

function TRelatoriosController.BuscarProcedimentos: TObjectList<TProcedimento>;
begin
  try
    Result := RepoRela.BuscarProcedimentosAtivos;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao buscar procedimentos: ' + E.Message);
    end;
  end;
end;

procedure TRelatoriosController.CarregarProfissionaisNoComboBox(ComboBox: TComboBox);
var
  ListaProfissionais: TObjectList<TProfissionais>;
  Profissional: TProfissionais;
begin
  ComboBox.Items.Clear;

  ListaProfissionais := BuscarProfissionais;
  try
    if Assigned(ListaProfissionais) then begin
      for Profissional in ListaProfissionais do begin
        ComboBox.Items.AddObject(Profissional.Nome, TObject(Profissional.Id));
      end;

      if ComboBox.Items.Count > 0 then
        ComboBox.ItemIndex := 0
      else
        ComboBox.ItemIndex := -1;
    end;
  finally
    ListaProfissionais.Free;
  end;
end;

procedure TRelatoriosController.CarregarProcedimentosNoComboBox(ComboBox: TComboBox);
var
  ListaProcedimentos: TObjectList<TProcedimento>;
  Procedimento: TProcedimento;
begin
  ComboBox.Items.Clear;

  ListaProcedimentos := BuscarProcedimentos;
  try
    if Assigned(ListaProcedimentos) then begin
      for Procedimento in ListaProcedimentos do begin
        ComboBox.Items.AddObject(Procedimento.Nome, TObject(Procedimento.Id));
      end;

      if ComboBox.Items.Count > 0 then
        ComboBox.ItemIndex := 0
      else
        ComboBox.ItemIndex := -1;
    end;
  finally
    ListaProcedimentos.Free;
  end;
end;

function TRelatoriosController.GerarRelatorioConsultas(DataInicio, DataFim: TDateTime): TFDQuery;
begin
  if not ValidarDatasRelatorio(DataInicio, DataFim) then
    raise Exception.Create('Data de início não pode ser maior que a data de fim');

  Result := RepoRela.GerarRelatorioConsultasPorPeriodo(DataInicio, DataFim);
end;


function TRelatoriosController.GerarRelatorioProcedimento(ProcedimentoId: integer; DataInicio, DataFim: TDateTime): TFDQuery;
begin
  if not ValidarDatasRelatorio(DataInicio, DataFim) then
    raise Exception.Create('Data de início não pode ser maior que a data de fim');

  Result := RepoRela.GerarRelatorioPorProcedimento(ProcedimentoId, DataInicio, DataFim);
end;


function TRelatoriosController.ValidarDatasRelatorio(DataInicio, DataFim: TDateTime): Boolean;
begin
  Result := (DataInicio <= DataFim);
end;

function TRelatoriosController.GerarRelatorioConsultasPorData(DataSelecionada: TDateTime): TFDQuery;
begin
  try
    Result := RepoRela.GerarRelatorioConsultasPorData(DataSelecionada);
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao buscar relatório de consultas por data: ' + E.Message);
    end;
  end;
end;

procedure TRelatoriosController.GerarRelatorioConsultasFastReport(DataSelecionada: TDateTime);
var
  RelatorioPath: string;
begin
  try
    with dmUsuarios.queryRelaConsul do begin
      Close;
      SQL.Clear;
      SQL.Text :=
        'SELECT c.id, c.data, c.horainicio, c.horafim, p.nome as paciente_nome, ' +
        'c.paciente_id, prof.nome as profissional_nome, c.profissional_id, ' +
        'proc.nome as procedimento_nome, c.procedimento_id, proc.valor ' +
        'FROM consultas c ' +
        'INNER JOIN pacientes p ON c.paciente_id = p.id ' +
        'INNER JOIN profissionais prof ON c.profissional_id = prof.id ' +
        'INNER JOIN procedimentos proc ON c.procedimento_id = proc.id ' +
        'WHERE c.data = :data_selecionada AND c.ativo = TRUE ' +
        'ORDER BY c.horainicio';

      ParamByName('data_selecionada').AsDate := DataSelecionada;
      Open();

      if IsEmpty then begin
        ShowMessage('Nenhuma consulta encontrada para a data ' + FormatDateTime('dd/mm/yyyy', DataSelecionada));
        Exit;
      end;
    end;

    dmUsuarios.dtRelaConsul.DataSet := dmUsuarios.queryRelaConsul;

    RelatorioPath := 'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica-Odontologica\assets\Relatórios\RelatorioConsultas1.fr3';

    if not FileExists(RelatorioPath) then begin
      ShowMessage('Arquivo de relatório não encontrado: ' + RelatorioPath);
      Exit;
    end;
    dmUsuarios.frxReport1.LoadFromFile(RelatorioPath);
    dmUsuarios.frxReport1.ShowReport();

  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

function TRelatoriosController.ContarConsultasConcluidas: Integer;
begin
  try
    Result := RepoRela.ContarConsultasConcluidas;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao contar consultas concluídas: ' + E.Message);
    end;
  end;
end;

function TRelatoriosController.ContarConsultasAgendadas: Integer;
begin
  try
    Result := RepoRela.ContarConsultasAgendadas;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao contar consultas agendadas: ' + E.Message);
    end;
  end;
end;

function TRelatoriosController.ContarConsultasCanceladas: Integer;
begin
  try
    Result := RepoRela.ContarConsultasCanceladas;
  except
    on E: Exception do begin
      raise Exception.Create('Erro ao contar consultas canceladas: ' + E.Message);
    end;
  end;
end;

procedure TRelatoriosController.GerarRelatorioProfissionalFastReport(ComboBox: TComboBox);
var
  RelatorioPath: string;
  ProfissionalId: Integer;
begin
  try
    if not Assigned(ComboBox) or (ComboBox.ItemIndex < 0) then
    begin
      ShowMessage('Selecione um profissional');
      Exit;
    end;

    ProfissionalId := Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);

    with dmUsuarios.queryRelaProf do
    begin
      Close;
      ParamByName('profissional_id').AsInteger := ProfissionalId;
      Open();

      if IsEmpty then
      begin
        ShowMessage('Nenhuma consulta encontrada para este profissional');
        Exit;
      end;
    end;

    dmUsuarios.dtRelaProf.DataSet := dmUsuarios.queryRelaProf;
    RelatorioPath := 'C:\Users\Bruno Tesser\Desktop\Clinica odontologica alves\Clinica-Odontologica\assets\Relatórios\RelatorioPorProfissionais1.fr3';

    if not FileExists(RelatorioPath) then
    begin
      ShowMessage('Arquivo de relatório não encontrado: ' + RelatorioPath);
      Exit;
    end;

    dmUsuarios.frxReport2.LoadFromFile(RelatorioPath);
    dmUsuarios.frxReport2.ShowReport();

  except
    on E: Exception do
      ShowMessage('Erro ao gerar relatório: ' + E.Message);
  end;
end;

end.