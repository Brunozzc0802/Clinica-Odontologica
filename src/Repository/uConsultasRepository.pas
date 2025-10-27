unit uConsultasRepository;

interface

uses
  System.SysUtils, System.Generics.Collections, FireDAC.Comp.Client,
  uPacientes, uProfissionais, uProcedimentos, uUsuarioConexao;

type
  TConsultaRepository = class
  public
    function ListarPacientes: TObjectList<TPaciente>;
    function ListarProfissionais: TObjectList<TProfissionais>;
    function ListarProcedimentos: TObjectList<TProcedimento>;
  end;

implementation

{ TConsultaRepository }

function TConsultaRepository.ListarPacientes: TObjectList<TPaciente>;
var
  Paciente: TPaciente;
begin
  Result := TObjectList<TPaciente>.Create(True);
  with dmUsuarios.queryPacientes do begin
    Close;
    SQL.Text := 'SELECT id, nome FROM pacientes WHERE ativo = TRUE ORDER BY nome';
    Open;

    while not Eof do begin
      Paciente := TPaciente.Create;
      Paciente.Id := FieldByName('id').AsInteger;
      Paciente.Nome := FieldByName('nome').AsString;
      Result.Add(Paciente);
      Next;
    end;
  end;
end;

function TConsultaRepository.ListarProfissionais: TObjectList<TProfissionais>;
var
  Profissional: TProfissionais;
begin
  Result := TObjectList<TProfissionais>.Create(True);
  with dmUsuarios.queryProfissionais do begin
    Close;
    SQL.Text := 'SELECT id, nome FROM profissionais WHERE ativo = TRUE ORDER BY nome';
    Open;

    while not Eof do
    begin
      Profissional := TProfissionais.Create;
      Profissional.Id := FieldByName('id').AsInteger;
      Profissional.Nome := FieldByName('nome').AsString;
      Result.Add(Profissional);
      Next;
    end;
  end;
end;

function TConsultaRepository.ListarProcedimentos: TObjectList<TProcedimento>;
var
  Procedimento: TProcedimento;
begin
  Result := TObjectList<TProcedimento>.Create(True);
  with dmUsuarios.queryProcedimentos do
  begin
    Close;
    SQL.Text := 'SELECT id, nome, valor, duracao::TIME as duracao, ativo FROM procedimentos WHERE ativo = TRUE ORDER BY nome';
    Open;

    while not Eof do
    begin
      Procedimento := TProcedimento.Create;
      Procedimento.Id := FieldByName('id').AsInteger;
      Procedimento.Nome := FieldByName('nome').AsString;
      Procedimento.Valor := FieldByName('valor').AsFloat;
      Procedimento.Duracao := FieldByName('duracao').AsDateTime;
      Procedimento.Ativo := FieldByName('ativo').AsBoolean;
      Result.Add(Procedimento);
      Next;
    end;
  end;
end;

end.
