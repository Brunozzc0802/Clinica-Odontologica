unit TelaRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, VCLTee.TeCanvas, Vcl.ComCtrls;

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
    Label3: TLabel;
    btnGerarRelatório: TLabel;
    pnlProf: TPanel;
    Bevel4: TBevel;
    Label4: TLabel;
    Shape5: TShape;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    cbProf: TComboBox;
    pnlProcedimento: TPanel;
    Bevel5: TBevel;
    Label7: TLabel;
    Shape6: TShape;
    Panel5: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    cbProc: TComboBox;
    btnX: TImage;
    Shape7: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Image1: TImage;
    Shape8: TShape;
    Shape9: TShape;
    Image2: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Image3: TImage;
    Label14: TLabel;
    Label15: TLabel;
    procedure btnXClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private
    { Private declarations }
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


end.
