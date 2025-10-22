unit uConsultas;

interface

  type
  TConsulta = class
  private
    CId: integer;
    CProfissionalId: integer;
    CProfissionalNome: String;
    CPacienteId: integer;
    CPacienteNome: String;
    CProcedimentoId: integer;
    CProcedimentoNome: String;
    CData: TDate;
    CHorario: TTime;
    CAtivo: Boolean;
  public
    property Id: Integer read CId write CId;
    property ProfissionalId: Integer read CProfissionalId write CProfissionalId;
    property ProfissionalNome: String read CProfissionalNome write CProfissionalNome;
    property PacienteId: Integer read CPacienteId write CPacienteId;
    property PacienteNome: String read CPacienteNome write CPacienteNome;
    property ProcedimentoId: Integer read CProcedimentoId write CProcedimentoId;
    property ProcedimentoNome: String read CProcedimentoNome write CProcedimentoNome;
    property Data: TDate read CData write CData;
    property Horario: TTime read CHorario write CHorario;
    property Ativo: Boolean read CAtivo write CAtivo;
  end;

implementation

end.
