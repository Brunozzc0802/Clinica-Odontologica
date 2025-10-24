unit uConsultas;

interface

uses
  System.SysUtils, System.Classes;

type
  THorarioDisponivel = class
  private
    CHorario: TTime;
    CDisponivel: Boolean;
    CMotivoIndisponivel: string;
  public
    property Horario: TTime read CHorario write CHorario;
    property Disponivel: Boolean read CDisponivel write CDisponivel;
    property MotivoIndisponivel: string read CMotivoIndisponivel write CMotivoIndisponivel;
  end;

  TConsulta = class
  private
    CId: Integer;
    CProfissionalId: Integer;
    CPacienteId: Integer;
    CProcedimentoId: Integer;
    CData: TDate;
    CHorarioInicio: TTime;
    CHorarioFim: TTime;
    CAtivo: Boolean;
  public
    property Id: Integer read CId write CId;
    property ProfissionalId: Integer read CProfissionalId write CProfissionalId;
    property PacienteId: Integer read CPacienteId write CPacienteId;
    property ProcedimentoId: Integer read CProcedimentoId write CProcedimentoId;
    property Data: TDate read CData write CData;
    property HorarioInicio: TTime read CHorarioInicio write CHorarioInicio;
    property HorarioFim: TTime read CHorarioFim write CHorarioFim;
    property Ativo: Boolean read CAtivo write CAtivo;
  end;

implementation

end.
