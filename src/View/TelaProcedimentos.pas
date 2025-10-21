unit TelaProcedimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.Mask, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.Grids, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uProcedimentosController, uProcedimentos,
  System.Generics.Collections;

type
  TPagProcedimentos = class(TForm)
    cabecalho: TPanel;
    pnlCabecalho: TPanel;
    lblTitulo: TLabel;
    iconProcedimentos: TImage;
    btnX: TImage;
    pnlAzulPrincipal: TPanel;
    imgLogo1: TImage;
    imgLogo2: TImage;
    sgProcedimentos: TStringGrid;
    pesquisar: TSearchBox;
    pnlBotoesDireita: TPanel;
    btnAdd: TPanel;
    lblAddUsu: TLabel;
    btnAddNovo: TPanel;
    btnAlterar: TPanel;
    lblAlterarUsu: TLabel;
    btnPesquisar: TPanel;
    lblPesquisar: TLabel;
    btnNovoPesquisar: TPanel;
    Label1: TLabel;
    btnDeletar: TPanel;
    lblDeletarUsu: TLabel;
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
    lblAddprocedimento: TLabel;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    EdNome: TEdit;
    edValor: TMaskEdit;
    pnlRestaurar: TPanel;
    imgRestore: TImage;
    Label6: TLabel;
    imgXrestore: TImage;
    sgRestore: TStringGrid;
    btnCRestore: TPanel;
    lblRestore: TLabel;
    Label2: TLabel;
    edHora: TMaskEdit;
    procedure btnAddMouseEnter(Sender: TObject);
    procedure btnAddMouseLeave(Sender: TObject);
    procedure btnPesquisarMouseEnter(Sender: TObject);
    procedure btnPesquisarMouseLeave(Sender: TObject);
    procedure btnDeletarMouseEnter(Sender: TObject);
    procedure btnDeletarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure btnRestaurarMouseEnter(Sender: TObject);
    procedure btnRestaurarMouseLeave(Sender: TObject);
    procedure btnLimparMouseEnter(Sender: TObject);
    procedure btnLimparMouseLeave(Sender: TObject);
    procedure btnSairMouseEnter(Sender: TObject);
    procedure btnSairMouseLeave(Sender: TObject);
    procedure btnAlterarMouseEnter(Sender: TObject);
    procedure btnAlterarMouseLeave(Sender: TObject);
    procedure btnadicionarMouseEnter(Sender: TObject);
    procedure btnadicionarMouseLeave(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseEnter(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseLeave(Sender: TObject);
    procedure btnCRestoreMouseEnter(Sender: TObject);
    procedure btnCRestoreMouseLeave(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnXClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure CarregarGrid;
    procedure FormShow(Sender: TObject);
    procedure adicionarProcedimento;
    procedure btnadicionarClick(Sender: TObject);
    procedure sgProcedimentosDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure btnConfirmarAlteracoesClick(Sender: TObject);
    procedure ConfirmarAlteracoes(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure pesquisarChange(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure OrdenarGrid;
    procedure btnDeletarClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure CarregarInativos;
    procedure imgXrestoreClick(Sender: TObject);
    procedure sgRestoreDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure ConfirmarRestauracao;
    procedure btnCRestoreClick(Sender: TObject);
  private
    ProcedimentoLista: TObjectList<TProcedimento>;
    Controller: TProcedimentosController;
    ProcedimentoIdalterar: Integer;
    procedure PesquisarProc(const Filtro: string);
  public
    { Public declarations }
  end;

var
  PagProcedimentos: TPagProcedimentos;

implementation

{$R *.dfm}


procedure TPagProcedimentos.FormCreate(Sender: TObject);
  begin
    Controller := TProcedimentosController.Create;
    ProcedimentoLista := TObjectList<TProcedimento>.Create;

    sgProcedimentos.Cells[0,0] := 'ID';
    sgProcedimentos.Cells[1,0] := 'Nome do Procedimento';
    sgProcedimentos.Cells[2,0] := 'Valor';
    sgProcedimentos.Cells[3,0] := 'Duração';

    sgProcedimentos.ColWidths[0] := 50;
    sgProcedimentos.ColWidths[1] := 195;
    sgProcedimentos.ColWidths[2] := 150;
    sgProcedimentos.ColWidths[3] := 140;
  end;

procedure TPagProcedimentos.FormShow(Sender: TObject);
  begin
    CarregarGrid;
  end;

procedure TPagProcedimentos.imgXrestoreClick(Sender: TObject);
  begin
    pnlRestaurar.Visible := False;
    btnRestaurarNovo.Visible := False;
    CarregarGrid;
  end;

procedure TPagProcedimentos.OrdenarGrid;
  var
  i, j: Integer;
  temp: string;
begin
  for i := 1 to sgProcedimentos.RowCount - 2 do
    for j := i + 1 to sgProcedimentos.RowCount - 1 do
      if StrToIntDef(sgProcedimentos.Cells[0, i], 0) > StrToIntDef(sgProcedimentos.Cells[0, j], 0) then
      begin
        var k: Integer;
        for k := 0 to sgProcedimentos.ColCount - 1 do
        begin
          temp := sgProcedimentos.Cells[k, i];
          sgProcedimentos.Cells[k, i] := sgProcedimentos.Cells[k, j];
          sgProcedimentos.Cells[k, j] := temp;
        end;
      end;
end;

procedure TPagProcedimentos.pesquisarChange(Sender: TObject);
  begin
    PesquisarProc(pesquisar.Text);
  end;

procedure TPagProcedimentos.PesquisarProc(const Filtro: string);
  var
  I, Linha: Integer;
  Procedimento: TProcedimento;
  TextoFiltro: string;
  begin
    if not Assigned(ProcedimentoLista) then Exit;
    sgProcedimentos.ColCount := 4;
    sgProcedimentos.RowCount := 1;
    Linha := 1;
    TextoFiltro := LowerCase(Filtro);
    for I := 0 to ProcedimentoLista.Count - 1 do begin
      Procedimento := ProcedimentoLista[I];
      if (Filtro = '') or (Pos(TextoFiltro, LowerCase(Procedimento.Nome)) > 0) or
      (Filtro = '') or (Pos(TextoFiltro, LowerCase(Procedimento.Id.ToString)) > 0) then begin

      sgProcedimentos.RowCount := Linha + 1;
      sgProcedimentos.Cells[0, Linha] := Procedimento.Id.ToString;
      sgProcedimentos.Cells[1, Linha] := Procedimento.Nome;
      sgProcedimentos.Cells[2, I + 1] := FloatToStr(ProcedimentoLista[I].Valor);
      sgProcedimentos.Cells[3, I + 1] := TimeToStr(ProcedimentoLista[I].Duracao);
      Inc(Linha);
      end;
    end;
  end;

procedure TPagProcedimentos.sgProcedimentosDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
  var
  BGColor, FontColor: TColor;
  begin
    if gdSelected in State then
      BGColor := clHighlight
    else
    BGColor := clWindow;
    sgProcedimentos.Canvas.Brush.Color := BGColor;
    sgProcedimentos.Canvas.FillRect(Rect);
  if gdSelected in State then
    FontColor := clHighlightText
  else
    FontColor := clWindowText;
    sgProcedimentos.Canvas.Font.Color := FontColor;
    sgProcedimentos.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgProcedimentos.Cells[ACol, ARow]);
end;

procedure TPagProcedimentos.sgRestoreDrawCell(Sender: TObject; ACol,
  ARow: LongInt; Rect: TRect; State: TGridDrawState);
  var
  BGColor: TColor;
begin
  if gdSelected in State then
    BGColor := clHighlight
  else
    BGColor := clWindow;
  sgRestore.Canvas.Brush.Color := BGColor;
  sgRestore.Canvas.FillRect(Rect);
  if gdSelected in State then
    sgRestore.Canvas.Font.Color := clHighlightText
  else
    sgRestore.Canvas.Font.Color := clWindowText;
    sgRestore.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
    sgRestore.Cells[ACol, ARow]);
end;

procedure TPagProcedimentos.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(Controller);
    FreeAndNil(ProcedimentoLista);
  end;

procedure TPagProcedimentos.CarregarGrid;
var
  I: Integer;
begin
  if Assigned(ProcedimentoLista) then
    ProcedimentoLista.Clear
  else
    ProcedimentoLista := TObjectList<TProcedimento>.Create;

  ProcedimentoLista.AddRange(Controller.BuscarTodos);

  sgProcedimentos.RowCount := ProcedimentoLista.Count + 1;

  sgProcedimentos.Cells[0,0] := 'ID';
  sgProcedimentos.Cells[1,0] := 'Nome do Procedimento';
  sgProcedimentos.Cells[2,0] := 'Valor';
  sgProcedimentos.Cells[3,0] := 'Duração';

  for I := 0 to ProcedimentoLista.Count - 1 do
  begin
    sgProcedimentos.Cells[0, I + 1] := IntToStr(ProcedimentoLista[I].Id);
    sgProcedimentos.Cells[1, I + 1] := ProcedimentoLista[I].Nome;
    sgProcedimentos.Cells[2, I + 1] := FloatToStr(ProcedimentoLista[I].Valor);
    sgProcedimentos.Cells[3, I + 1] := TimeToStr(ProcedimentoLista[I].Duracao);
  end;
  OrdenarGrid;
end;

procedure TPagProcedimentos.CarregarInativos;
  var
  I: Integer;
  begin
    try
      if Assigned(ProcedimentoLista) then
      ProcedimentoLista.Free;
      ProcedimentoLista := Controller.BuscarInativos;

      sgRestore.Cells[0,0] := 'ID';
      sgRestore.Cells[1,0] := 'Nome do Procedimento';
      sgRestore.Cells[2,0] := 'Valor';
      sgRestore.Cells[3,0] := 'Duração';

      sgRestore.RowCount := ProcedimentoLista.Count + 1;

      for I := 0 to ProcedimentoLista.Count - 1 do
      begin
        sgRestore.Cells[0, I + 1] := IntToStr(ProcedimentoLista[I].Id);
        sgRestore.Cells[1, I + 1] := ProcedimentoLista[I].Nome;
        sgRestore.Cells[2, I + 1] := FloatToStr(ProcedimentoLista[I].Valor);
        sgRestore.Cells[3, I + 1] := TimeToStr(ProcedimentoLista[I].Duracao);
      end;
    finally
    end;
  end;

procedure TPagProcedimentos.ConfirmarAlteracoes(Sender: TObject);
     begin
        if ProcedimentoIdalterar = 0 then begin
          ShowMessage('Selecione um Procedimento para alterar');
          Exit;
        end;
        try
          Controller.AlterarProcedimento(
          ProcedimentoIdalterar,
          EdNome.Text,
          StrToFloat(EdValor.Text),
          StrToTime(EdHora.Text)
          );
          ShowMessage('Alterações feitas com sucesso!');
          btnAlterarNovo.Visible := False;
          EdNome.Clear;
          edValor.Clear;
          edHora.Clear;
          CarregarGrid;
          sgProcedimentos.Row := 0;
          sgProcedimentos.Col := 0;
          sgProcedimentos.SetFocus;
          pnlAdd.Visible := False;
        finally
        end;
      end;

procedure TPagProcedimentos.ConfirmarRestauracao;
  var
  ProcedimentoId: Integer;
  begin
    if sgRestore.Row > 0 then
    begin
      ProcedimentoId := StrToIntDef(sgRestore.Cells[0, sgRestore.Row], 0);
      if ProcedimentoId = 0 then begin
        Exit;
      end;

      try
        Controller.RestaurarProcedimento(ProcedimentoId);
        ShowMessage('Procedimento restaurado com sucesso!');
        CarregarInativos;
        CarregarGrid;
        sgRestore.Row := 0;
        sgRestore.Col := 0;
        sgRestore.SetFocus;
      finally
      end;
      end else
      ShowMessage('Selecione um procedimento para restaurar.');
  end;

procedure TPagProcedimentos.AdicionarProcedimento;
   begin
    try
      if (EdNome.Text = '') or (edValor.Text = '') or (edHora.Text = '')
      then begin
        ShowMessage('Preencha todos os campos');
        Exit;
      end;

        Controller.AdicionarProcedimento(
        edNome.Text,
        StrToFloat(EdValor.Text),
        StrToTime(EdHora.Text)
        );

        ShowMessage('Profissional adicionado com sucesso!');
        CarregarGrid;
        edNome.clear;
        edValor.clear;
        edHora.clear;
        pnlAdd.Visible := False;
        btnAddNovo.Visible := False;
    finally
    end;
  end;

procedure TPagProcedimentos.btnAddClick(Sender: TObject);
  begin
     if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
      sgprocedimentos.Row := 0;
      sgprocedimentos.Col := 0;
    end;
    if (btnAlterarNovo.Visible = True) then begin
        EdNome.Clear;
        edValor.Clear;
        edHora.Clear;
        btnalterarNovo.Visible := False;
        btnAddNovo.Visible := True;
        sgProcedimentos.Row := 0;
        sgProcedimentos.Col := 0;
    end;
    if pesquisar.Visible = true  then begin
        pesquisar.Visible := False;
        sgProcedimentos.Top := sgProcedimentos.Top - (pesquisar.Height + 6);
        sgProcedimentos.Height := sgProcedimentos.Height + (pesquisar.Height + 6);
        btnNovoPesquisar.Visible := False;
        sgprocedimentos.Row := 0;
        sgprocedimentos.Col := 0;
    end;
        sgprocedimentos.Row := 0;
        sgprocedimentos.Col := 0;
        btnAddNovo.Visible := True;
        pnlAdd.Visible := True;
        edNome.SetFocus;
        btnadicionar.Visible := True;
        btnConfirmarAlteracoes.Visible := False;
        imgLogo2.Visible := True;
        imgLogo1.Visible := False;
  end;

procedure TPagProcedimentos.btnCancelarClick(Sender: TObject);
  begin
      pnlAdd.Visible := False;
      btnAddNovo.Visible := False;
      btnRestaurarNovo.Visible := False;
      pnlRestaurar.Visible := false;
      btnAlterarNovo.Visible := False;
      imgLogo1.Visible := True;
      imgLogo2.visible := False;
    if pesquisar.Visible = true then begin
      sgProcedimentos.Top := sgProcedimentos.Top - (pesquisar.Height + 5);
      sgProcedimentos.Height := sgProcedimentos.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;
      sgProcedimentos.Row := 0;
      sgProcedimentos.Col := 0;
      sgProcedimentos.SetFocus;
  end;

procedure TPagProcedimentos.btnLimparClick(Sender: TObject);
  begin
    if pnlAdd.Visible = True then
    begin
      EdNome.Clear;
      edValor.Clear;
      edHora.Clear;
      EdNome.SetFocus;
    end;
  end;

procedure TPagProcedimentos.btnXClick(Sender: TObject);
  begin
    Close;
  end;

procedure TPagProcedimentos.btnAddMouseEnter(Sender: TObject);
  begin
    btnAdd.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnAddMouseLeave(Sender: TObject);
  begin
    btnAdd.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnadicionarClick(Sender: TObject);
  begin
    adicionarProcedimento;
  end;

procedure TPagProcedimentos.btnadicionarMouseEnter(Sender: TObject);
  begin
    btnadicionar.Color := $00C46106;
  end;

procedure TPagProcedimentos.btnadicionarMouseLeave(Sender: TObject);
  begin
    btnadicionar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnAlterarClick(Sender: TObject);
  var
  linha: Integer;
  begin
    linha := sgProcedimentos.Row;
    if linha <= 0 then
    begin
      ShowMessage('Selecione um procedimento para alterar!');
      Exit;
    end;

    if btnNovoPesquisar.Visible = true  then begin
      sgProcedimentos.Top := sgProcedimentos.Top - (pesquisar.Height + 5);
      sgProcedimentos.Height := sgProcedimentos.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

    ProcedimentoIdalterar := StrToIntDef(sgProcedimentos.Cells[0, linha], 0);
    EdNome.Text := sgProcedimentos.Cells[1, linha];
    edValor.Text := sgProcedimentos.Cells[2, linha];
    edHora.Text := sgProcedimentos.Cells[3, linha];

    btnConfirmarAlteracoes.Visible := True;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := True;
    btnAddNovo.Visible := False;
    pnlAdd.Visible := True;
   end;

procedure TPagProcedimentos.btnAlterarMouseEnter(Sender: TObject);
  begin
    btnAlterar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnAlterarMouseLeave(Sender: TObject);
  begin
    btnAlterar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnCancelarMouseEnter(Sender: TObject);
  begin
    btnCancelar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnCancelarMouseLeave(Sender: TObject);
  begin
    btnCancelar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnConfirmarAlteracoesClick(Sender: TObject);
  begin
    ConfirmarAlteracoes(nil);
  end;

procedure TPagProcedimentos.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $00C46106;
  end;

procedure TPagProcedimentos.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnCRestoreClick(Sender: TObject);
  begin
    ConfirmarRestauracao;
  end;

procedure TPagProcedimentos.btnCRestoreMouseEnter(Sender: TObject);
  begin
    btnCRestore.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnCRestoreMouseLeave(Sender: TObject);
  begin
    btnCRestore.Color := $00F8973F;
  end;

procedure TPagProcedimentos.btnDeletarClick(Sender: TObject);
  var
  Id: Integer;
  begin
    if btnAlterarNovo.Visible = True then begin
      btnAlterarNovo.Visible := False;
      pnlAdd.Visible := False;
    end;

    Id := StrToIntDef(sgProcedimentos.Cells[0, sgProcedimentos.Row], 0);
    if Id > 0 then begin
      Controller.DesativarProcedimento(Id);
      ShowMessage('Procedimento deletado com sucesso!');
      CarregarGrid;
      sgProcedimentos.Row := 0;
      sgProcedimentos.Col := 0;
      sgProcedimentos.SetFocus;
    end else begin
      ShowMessage('Selecione um procedimento para deletar.');
    end;
  end;

procedure TPagProcedimentos.btnDeletarMouseEnter(Sender: TObject);
  begin
    btnDeletar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnDeletarMouseLeave(Sender: TObject);
  begin
    btnDeletar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnLimparMouseEnter(Sender: TObject);
  begin
    btnLimpar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnLimparMouseLeave(Sender: TObject);
  begin
    btnLimpar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnPesquisarClick(Sender: TObject);
  begin
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := False;
    btnNovoPesquisar.Visible := True;
    pnlAdd.Visible := false;
    imgLogo2.Visible := false;
    imgLogo1.Visible := True;

    if not pesquisar.Visible then begin
      pesquisar.Visible := True;
      sgProcedimentos.Top := pesquisar.Top + pesquisar.Height + 8;
      sgProcedimentos.Height := sgProcedimentos.Height - (pesquisar.Height + 8);
      pesquisar.SetFocus;
    end;

    sgProcedimentos.Row := 0;
    sgprocedimentos.Col := 0;
  end;

procedure TPagProcedimentos.btnPesquisarMouseEnter(Sender: TObject);
  begin
    btnPesquisar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnPesquisarMouseLeave(Sender: TObject);
  begin
    btnPesquisar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnRestaurarClick(Sender: TObject);
  begin
    if pnlAdd.Visible = True then begin
      pnlAdd.Visible := false;
    end;

    if btnNovoPesquisar.Visible = true  then begin
      sgProcedimentos.Top := sgProcedimentos.Top - (pesquisar.Height + 5);
      sgProcedimentos.Height := sgProcedimentos.Height + (pesquisar.Height + 5);
      pesquisar.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

    btnRestaurarNovo.Visible := True;
    CarregarInativos;
    sgRestore.Row := 0;
    sgRestore.Col := 0;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := false;
    pnlRestaurar.Visible := True;
    sgRestore.SetFocus;

    sgProcedimentos.Cells[0,0] := 'ID';
    sgProcedimentos.Cells[1,0] := 'Nome do Procedimento';
    sgProcedimentos.Cells[2,0] := 'Valor';
    sgProcedimentos.Cells[3,0] := 'Duração';

    sgRestore.ColWidths[0] := 50;
    sgRestore.ColWidths[1] := 160;
    sgRestore.ColWidths[2] := 105;
    sgRestore.ColWidths[3] := 110;
  end;


procedure TPagProcedimentos.btnRestaurarMouseEnter(Sender: TObject);
  begin
    btnRestaurar.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnRestaurarMouseLeave(Sender: TObject);
  begin
    btnRestaurar.Color := $007C3E05;
  end;

procedure TPagProcedimentos.btnSairClick(Sender: TObject);
  begin
    Close;
  end;

procedure TPagProcedimentos.btnSairMouseEnter(Sender: TObject);
  begin
    btnSair.Color := $00F78B2B;
  end;

procedure TPagProcedimentos.btnSairMouseLeave(Sender: TObject);
  begin
    btnSair.Color := $007C3E05;
  end;

end.

