unit TelaRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, VCLTee.TeCanvas, Vcl.ComCtrls, uRelatoriosController, System.DateUtils;

type
  TPagRelatorios = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconRelatorios: TImage;
    pnlPrincipal: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Bevel1: TBevel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    pnlConsulta: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    Shape4: TShape;
    Panel1: TPanel;
    lblGerarConsul: TLabel;
    pnlProf: TPanel;
    Bevel4: TBevel;
    Label4: TLabel;
    Shape5: TShape;
    Panel3: TPanel;
    lblGerarProf: TLabel;
    cbProf: TComboBox;
    pnlProcedimento: TPanel;
    Bevel5: TBevel;
    Label7: TLabel;
    Shape6: TShape;
    Panel5: TPanel;
    lblGerarProc: TLabel;
    Label9: TLabel;
    cbProc: TComboBox;
    btnX: TImage;
    Shape7: TShape;
    Label10: TLabel;
    lblConsulConclu: TLabel;
    Image1: TImage;
    Shape8: TShape;
    Shape9: TShape;
    Image2: TImage;
    Label12: TLabel;
    lblConsulAgend: TLabel;
    Image3: TImage;
    Label14: TLabel;
    lblConsulCance: TLabel;
    procedure btnXClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure lblGerarConsulMouseEnter(Sender: TObject);
    procedure lblGerarConsulMouseLeave(Sender: TObject);
    procedure lblGerarConsulClick(Sender: TObject);
  procedure lblGerarProfMouseEnter(Sender: TObject);
  procedure lblGerarProfMouseLeave(Sender: TObject);
  procedure lblGerarProcMouseEnter(Sender: TObject);
  procedure lblGerarProcMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbProfDropDown(Sender: TObject);
    procedure cbProcDropDown(Sender: TObject);
    procedure AtualizarContadores;
    procedure lblGerarRelaProfClick(Sender: TObject);

  private
    { Private declarations }
    RelatorioController: TRelatoriosController;
  public
    { Public declarations }
  end;

var
  PagRelatorios: TPagRelatorios;

implementation

{$R *.dfm}

procedure TPagRelatorios.btnXClick(Sender: TObject);
begin
  Close;
end;

procedure TPagRelatorios.ComboBox1Change(Sender: TObject);
  begin
    if ComboBox1.ItemIndex = 0 then begin
      pnlConsulta.Visible := True;
      pnlProf.Visible := False;
      pnlProcedimento.Visible := False;
    end else if Combobox1.ItemIndex = 1 then begin
      pnlProf.Visible := True;
      pnlConsulta.Visible := False;
      pnlProcedimento.Visible := False
    end else begin
      pnlProcedimento.Visible := True;
      pnlConsulta.Visible := False;
      pnlProf.Visible := False;
    end;
  end;

procedure TPagRelatorios.lblGerarConsulMouseEnter(Sender: TObject);
  begin
    Panel1.Color := $00A96912;
    shape4.Brush.Color := $00A96912;
    shape4.Pen.Color := $00A96912;
  end;

procedure TPagRelatorios.lblGerarConsulMouseLeave(Sender: TObject);
  begin
    Panel1.Color := $00C97D16;
    Shape4.Brush.Color := $00C97D16;
    Shape4.Pen.Color := $00C97D16;
  end;

procedure TPagRelatorios.lblGerarProcMouseEnter(Sender: TObject);
  begin
    Panel5.Color := $00A96912;
    shape6.Brush.Color := $00A96912;
    shape6.Pen.Color := $00A96912;
  end;

procedure TPagRelatorios.lblGerarProcMouseLeave(Sender: TObject);
  begin
    Panel5.Color := $00C97D16;
    Shape6.Brush.Color := $00C97D16;
    Shape6.Pen.Color := $00C97D16;
  end;


procedure TPagRelatorios.FormCreate(Sender: TObject);
begin
  RelatorioController := TRelatoriosController.Create;
  AtualizarContadores;
end;

procedure TPagRelatorios.FormDestroy(Sender: TObject);
begin
  pnlConsulta.Visible := False;
  pnlProcedimento.Visible := False;
  pnlProf.Visible := False;
  ComboBox1.ItemIndex := -1;
  cbProf.ItemIndex := -1;
  cbProc.ItemIndex := -1;
  DateTimePicker1.Date := 01/11/2025;
  FreeAndNil(RelatorioController);
end;

procedure TPagRelatorios.cbProfDropDown(Sender: TObject);
begin
  if Assigned(RelatorioController) then begin
    RelatorioController.CarregarProfissionaisNoComboBox(cbProf);
  end;
end;

procedure TPagRelatorios.cbProcDropDown(Sender: TObject);
begin
  if Assigned(RelatorioController) then begin
    RelatorioController.CarregarProcedimentosNoComboBox(cbProc);
  end;
end;

procedure TPagRelatorios.lblGerarConsulClick(Sender: TObject);
var
  DataSelecionada: TDateTime;
begin
  if Assigned(RelatorioController) then begin
    DataSelecionada := DateTimePicker1.Date;
    RelatorioController.GerarRelatorioConsultasFastReport(DataSelecionada);
  end;
end;

procedure TPagRelatorios.lblGerarProfMouseEnter(Sender: TObject);
begin
  Panel3.Color := $00A96912;
  shape5.Brush.Color := $00A96912;
  shape5.Pen.Color := $00A96912;
end;

procedure TPagRelatorios.lblGerarProfMouseLeave(Sender: TObject);
begin
  Panel3.Color := $00C97D16;
  Shape5.Brush.Color := $00C97D16;
  Shape5.Pen.Color := $00C97D16;
end;

procedure TPagRelatorios.AtualizarContadores;
var
  TotalConcluidas, TotalAgendadas, TotalCanceladas: Integer;
begin
  try
    if Assigned(RelatorioController) then begin
      TotalConcluidas := RelatorioController.ContarConsultasConcluidas;
      TotalAgendadas := RelatorioController.ContarConsultasAgendadas;
      TotalCanceladas := RelatorioController.ContarConsultasCanceladas;

      lblConsulConclu.Caption := IntToStr(TotalConcluidas);
      lblConsulAgend.Caption := IntToStr(TotalAgendadas);
      lblConsulCance.Caption := IntToStr(TotalCanceladas);
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar contadores: ' + E.Message);
  end;
end;

procedure TPagRelatorios.lblGerarRelaProfClick(Sender: TObject);
begin
  if Assigned(RelatorioController) then
    RelatorioController.GerarRelatorioProfissionalFastReport(cbProf);
end;

end.