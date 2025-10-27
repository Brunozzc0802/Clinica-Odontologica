unit uConsultas;

interface

type
  TConsulta = class
  private
    CId: Integer;
    CPacienteId: Integer;
    CProfissionalId: Integer;
    CProcedimentoId: Integer;
    CData: TDate;
    CHoraInicio: TTime;
    CHoraFim: TTime;
    CAtivo: Boolean;
    CNomePaciente: string;
    CNomeProfissional: string;
    CNomeProcedimento: string;
  public
    property Id: Integer read CId write CId;
    property PacienteId: Integer read CPacienteId write CPacienteId;
    property ProfissionalId: Integer read CProfissionalId write CProfissionalId;
    property ProcedimentoId: Integer read CProcedimentoId write CProcedimentoId;
    property Data: TDate read CData write CData;
    property HoraInicio: TTime read CHoraInicio write CHoraInicio;
    property HoraFim: TTime read CHoraFim write CHoraFim;
    property Ativo: Boolean read CAtivo write CAtivo;
    property NomePaciente: string read CNomePaciente write CNomePaciente;
    property NomeProfissional: string read CNomeProfissional write CNomeProfissional;
    property NomeProcedimento: string read CNomeProcedimento write CNomeProcedimento;
  end;

implementation

end.
