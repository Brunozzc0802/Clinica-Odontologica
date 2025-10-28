unit TelaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Grids, Vcl.WinXCtrls, uUsuariosController, uUsuarios,
  System.Generics.Collections, uUsuariosControllerLog;

type
  TPagUsuarios = class(TForm)
    pnlCabecalho: TPanel;
    bordaCabecalhoUsuarios: TPanel;
    lblTituloUsuarios: TLabel;
    pnlBordaBaixoUsuarios: TPanel;
    pnlAzulPrincipal: TPanel;
    sgUsuarios: TStringGrid;
    pnlBotoesDireitaUsuarios: TPanel;
    imgLogoUsuarios1: TImage;
    btnAddUsu: TPanel;
    btnAlterarUsu: TPanel;
    btnPesquisarUsu: TPanel;
    btnDeletarUsu: TPanel;
    btnCancelarUsu: TPanel;
    lblAddUsu: TLabel;
    lblAlterarUsu: TLabel;
    lblPesquisar: TLabel;
    lblDeletarUsu: TLabel;
    lblCancelarUsu: TLabel;
    pnlFormAddUsuarios: TPanel;
    edUsuario: TEdit;
    edSenhaUsuario: TEdit;
    cbAtivo: TComboBox;
    cbGrupo: TComboBox;
    btnRestaurarUsu: TPanel;
    lblRestaurar: TLabel;
    btnAdicionarUsuario: TPanel;
    lblAdicionarUsuario: TLabel;
    imgLogoUsuarios2: TImage;
    btnLimparUsu: TPanel;
    lblLimpar: TLabel;
    btnSairUsu: TPanel;
    lblSair: TLabel;
    btnAddNovo: TPanel;
    Label2: TLabel;
    pesquisarUsuario: TSearchBox;
    btnNovoPesquisar: TPanel;
    Label1: TLabel;
    btnAlterarNovo: TPanel;
    Label3: TLabel;
    iconUserTelaUsuarios: TImage;
    btnXUsuarios: TImage;
    pnlRestaurar: TPanel;
    btnRestaurarNovo: TPanel;
    Label5: TLabel;
    btnConfirmarAlteracoes: TPanel;
    lblConfirmarAlteracoes: TLabel;
    imgRestore: TImage;
    Label6: TLabel;
    imgXrestore: TImage;
    sgRestore: TStringGrid;
    btnCRestore: TPanel;
    lblRestore: TLabel;
    procedure btnXUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddUsuMouseEnter(Sender: TObject);
    procedure btnAddUsuMouseLeave(Sender: TObject);
    procedure btnAlterarUsuMouseEnter(Sender: TObject);
    procedure btnAlterarUsuMouseLeave(Sender: TObject);
    procedure btnPesquisarUsuMouseLeave(Sender: TObject);
    procedure btnPesquisarUsuMouseEnter(Sender: TObject);
    procedure btnDeletarUsuMouseEnter(Sender: TObject);
    procedure btnDeletarUsuMouseLeave(Sender: TObject);
    procedure btnCancelarUsuMouseEnter(Sender: TObject);
    procedure btnCancelarUsuMouseLeave(Sender: TObject);
    procedure btnRestaurarUsuMouseEnter(Sender: TObject);
    procedure btnRestaurarUsuMouseLeave(Sender: TObject);
    procedure btnAdicionarUsuarioMouseEnter(Sender: TObject);
    procedure btnAdicionarUsuarioMouseLeave(Sender: TObject);
    procedure btnCancelarUsuClick(Sender: TObject);
    procedure btnLimparUsuMouseEnter(Sender: TObject);
    procedure btnLimparUsuMouseLeave(Sender: TObject);
    procedure btnSairUsuMouseEnter(Sender: TObject);
    procedure btnSairUsuMouseLeave(Sender: TObject);
    procedure btnAdicionarUsuarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairUsuClick(Sender: TObject);
    procedure btnLimparUsuClick(Sender: TObject);
    procedure sgUsuariosDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure btnAddUsuClick(Sender: TObject);
    procedure btnPesquisarUsuClick(Sender: TObject);
    procedure CarregarUsuarios;
    procedure FormShow(Sender: TObject);
    procedure btnAlterarUsuClick(Sender: TObject);
    procedure btnConfirmarAlteracoesClick(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseEnter(Sender: TObject);
    procedure btnConfirmarAlteracoesMouseLeave(Sender: TObject);
    procedure pesquisarUsuarioChange(Sender: TObject);
    procedure btnDeletarUsuClick(Sender: TObject);
    procedure btnRestaurarUsuClick(Sender: TObject);
    procedure sgRestoreDrawCell(Sender: TObject; ACol, ARow: LongInt;
      Rect: TRect; State: TGridDrawState);
    procedure CarregarInativos;
    procedure btnCRestoreClick(Sender: TObject);
    procedure imgXrestoreClick(Sender: TObject);
    procedure AdicionarUsuarios;
    procedure OrdenarGrid;
    procedure btnAddNovoClick(Sender: TObject);
    procedure btnAlterarNovoClick(Sender: TObject);
    procedure btnNovoPesquisarClick(Sender: TObject);
    procedure btnCRestoreMouseEnter(Sender: TObject);
    procedure btnCRestoreMouseLeave(Sender: TObject);
    procedure ConfirmarRestauracao;
  private
    UsuarioIdalterar: Integer;
    UsuarioLista: TObjectList<TUsuario>;
    Controller: TUsuarioController;
    UserController: TLogController;
    procedure PesquisarUsuarios(const Filtro: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagUsuarios: TPagUsuarios;

implementation

{$R *.dfm}



procedure TPagUsuarios.OrdenarGrid;
var
  i, j: Integer;
  temp: string;
begin

  for i := 1 to sgUsuarios.RowCount - 2 do
    for j := i + 1 to sgUsuarios.RowCount - 1 do
      if StrToIntDef(sgUsuarios.Cells[0, i], 0) > StrToIntDef(sgUsuarios.Cells[0, j], 0) then
      begin

        var k: Integer;
        for k := 0 to sgUsuarios.ColCount - 1 do
        begin
          temp := sgUsuarios.Cells[k, i];
          sgUsuarios.Cells[k, i] := sgUsuarios.Cells[k, j];
          sgUsuarios.Cells[k, j] := temp;
        end;
      end;
end;

procedure TPagUsuarios.CarregarInativos;
var
  I: Integer;
begin
  try
    if Assigned(UsuarioLista) then
    UsuarioLista.Free;
    UsuarioLista := Controller.BuscarInativos;

    // Cabe�alho
    sgRestore.Cells[0, 0] := 'ID';
    sgRestore.Cells[1, 0] := 'Nome de Usu�rio';
    sgRestore.Cells[2, 0] := 'Senha';
    sgRestore.Cells[3, 0] := 'Ativo';
    sgRestore.Cells[4, 0] := 'Grupo';
    sgRestore.RowCount := UsuarioLista.Count + 1;

    for I := 0 to UsuarioLista.Count - 1 do
    begin
      sgRestore.Cells[0, I + 1] := IntToStr(UsuarioLista[I].Id);
      sgRestore.Cells[1, I + 1] := UsuarioLista[I].Nome;
      sgRestore.Cells[2, I + 1] := UsuarioLista[I].Senha;
      sgRestore.Cells[3, I + 1] := BoolToStr(UsuarioLista[I].Ativo, True);
      sgRestore.Cells[4, I + 1] := UsuarioLista[I].Grupo;
    end;
  finally
  end;
end;

procedure TPagUsuarios.PesquisarUsuarios(const Filtro: string);
var
  I, Linha: Integer;
  Usuario: TUsuario;
  TextoFiltro: string;
begin
  if not Assigned(UsuarioLista) then Exit;
  sgUsuarios.ColCount := 5;
  sgUsuarios.RowCount := 1;
  Linha := 1;
  TextoFiltro := LowerCase(Filtro);
  for I := 0 to UsuarioLista.Count - 1 do begin
    Usuario := UsuarioLista[I];
    if (Filtro = '') or (Pos(TextoFiltro, LowerCase(Usuario.Nome)) > 0) or
    (Filtro = '') or (Pos(TextoFiltro, LowerCase(Usuario.Id.ToString)) > 0) then begin
      sgUsuarios.RowCount := Linha + 1;
      sgUsuarios.Cells[0, Linha] := Usuario.Id.ToString;
      sgUsuarios.Cells[1, Linha] := Usuario.Nome;
      sgUsuarios.Cells[2, Linha] := Usuario.Senha;
      sgUsuarios.Cells[3, Linha] := BoolToStr(Usuario.Ativo, True);
      sgUsuarios.Cells[4, Linha] := Usuario.Grupo;
      Inc(Linha);
    end;
  end;
end;

procedure TPagUsuarios.CarregarUsuarios;
var
  I: Integer;
begin
  Controller := TUsuarioController.Create;
  try
    if Assigned(UsuarioLista) then
    UsuarioLista.Free;
    UsuarioLista := Controller.BuscarTodos;

    // Cabe�alho
    sgUsuarios.Cells[0, 0] := 'ID';
    sgUsuarios.Cells[1, 0] := 'Nome de Usu�rio';
    sgUsuarios.Cells[2, 0] := 'Senha';
    sgUsuarios.Cells[3, 0] := 'Ativo';
    sgUsuarios.Cells[4, 0] := 'Grupo';
    sgUsuarios.RowCount := UsuarioLista.Count + 1;

    for I := 0 to UsuarioLista.Count - 1 do
    begin
      sgUsuarios.Cells[0, I + 1] := IntToStr(UsuarioLista[I].Id);
      sgUsuarios.Cells[1, I + 1] := UsuarioLista[I].Nome;
      sgUsuarios.Cells[2, I + 1] := UsuarioLista[I].Senha;
      sgUsuarios.Cells[3, I + 1] := BoolToStr(UsuarioLista[I].Ativo, True);
      sgUsuarios.Cells[4, I + 1] := UsuarioLista[I].Grupo;
    end;
  finally
  end;
end;

procedure TPagUsuarios.ConfirmarRestauracao;
var
  LinhaRestore: Integer;
  Usuario: TUsuario;
begin
  if not Assigned(UsuarioLista) then Exit;

  LinhaRestore := sgRestore.Row;
  if LinhaRestore > 0 then begin
    Usuario := TUsuario.Create;
    try
      Usuario.Id    := StrToInt(sgRestore.Cells[0, LinhaRestore]);
      Usuario.Nome  := sgRestore.Cells[1, LinhaRestore];
      Usuario.Senha := sgRestore.Cells[2, LinhaRestore];
      Usuario.Ativo := False;
      Usuario.Grupo := sgRestore.Cells[4, LinhaRestore];

      try
        Controller.RestaurarUsuario(Usuario);
         UserController.RegistrarLog(Usuario.Nome, 'Restaurarado', 'Usu�rio restaurado (id: '+IntToStr(Usuario.Id)+')');
        CarregarInativos;
        ShowMessage('Usu�rio Restaurado com sucesso!');
      finally
        CarregarInativos;
        sgRestore.Row := 0;
        sgRestore.Col := 0;
        sgRestore.SetFocus;
      end;
    finally
      Usuario.Free;
    end;
  end else begin
    ShowMessage('Selecione um usu�rio para Restaurar.');
end;
end;

//a��o de fechar o formulario\\
procedure TPagUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    UserController.Free;
    UsuarioLista.Free;
    Controller.Free;
    pnlFormAddUsuarios.Visible := False;
    btnAddNovo.visible := false;
    pnlFormAddUsuarios.Visible := False;
    btnAlterarNovo.Visible := False;
    btnPesquisarUsu.Visible := False;
    btnRestaurarNovo.Visible := False;
    pnlRestaurar.Visible := False;
    imgLogoUsuarios2.Visible := False;
    imgLogoUsuarios1.Visible := True;
  end;
//cria��o da tela de usuarios\\
procedure TPagUsuarios.FormCreate(Sender: TObject);
  begin
    Controller := TUsuarioController.Create;
    UserController := TLogController.Create;
    pesquisarUsuario.OnChange := pesquisarUsuarioChange;
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;
    btnAddNovo.Visible := False;

    //configura��es grid\\
    sgUsuarios.Cells[0,0] := 'ID';
    sgUsuarios.Cells[1,0] := 'Nome de Usu�rio';
    sgUsuarios.Cells[2,0] := 'Senha';
    sgUsuarios.Cells[3,0] := 'Ativo';
    sgUsuarios.Cells[4,0] := 'Grupo';

    sgUsuarios.ColWidths[0] := 60;
    sgUsuarios.ColWidths[1] := 150;
    sgUsuarios.ColWidths[2] := 110;
    sgUsuarios.ColWidths[3] := 70;
    sgUsuarios.ColWidths[4] := 127;
  end;


procedure TPagUsuarios.FormShow(Sender: TObject);
  begin
    CarregarUsuarios;
    sgUsuarios.Row := 0;
    sgUsuarios.Col := 0;
    sgUsuarios.SetFocus;
  end;
procedure TPagUsuarios.imgXrestoreClick(Sender: TObject);
  begin
    pnlRestaurar.Visible := False;
    btnRestaurarNovo.Visible := False;
    CarregarUsuarios;
  end;

//Barra de pesquisa\\
procedure TPagUsuarios.pesquisarUsuarioChange(Sender: TObject);
  begin
     PesquisarUsuarios(pesquisarUsuario.Text);
  end;
//cor de fundo e senha em * no grid de restaurar\\
procedure TPagUsuarios.sgRestoreDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  TextToDraw: string;
  BGColor: TColor;
  begin
    if gdSelected in State then begin
      BGColor := clHighlight
  end else
    BGColor := clWindow;
    sgRestore.Canvas.Brush.Color := BGColor;
    sgRestore.Canvas.FillRect(Rect);
  if gdSelected in State then
    sgRestore.Canvas.Font.Color := clHighlightText
  else
    sgRestore.Canvas.Font.Color := clWindowText;
  if (ARow > 0) and Assigned(UsuarioLista) and (ARow <= UsuarioLista.Count) then
  begin
    if ACol = 2 then
      TextToDraw := StringOfChar('*', Length(sgRestore.Cells[ACol, ARow]))
    else
      TextToDraw := sgRestore.Cells[ACol, ARow];
  end
  else
    TextToDraw := sgRestore.Cells[ACol, ARow];

  sgRestore.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TextToDraw);
end;
//cor de fundo e senha em *\\
procedure TPagUsuarios.sgUsuariosDrawCell(Sender: TObject; ACol, ARow: LongInt;
  Rect: TRect; State: TGridDrawState);
var
  TextToDraw: string;
  BGColor: TColor;
  begin
    if gdSelected in State then begin
      BGColor := clHighlight
  end else
    BGColor := clWindow;
    sgUsuarios.Canvas.Brush.Color := BGColor;
    sgUsuarios.Canvas.FillRect(Rect);
  if gdSelected in State then
    sgUsuarios.Canvas.Font.Color := clHighlightText
  else
    sgUsuarios.Canvas.Font.Color := clWindowText;
  if (ARow > 0) and Assigned(UsuarioLista) and (ARow <= UsuarioLista.Count) then
  begin
    if ACol = 2 then
      TextToDraw := StringOfChar('*', Length(sgUsuarios.Cells[ACol, ARow]))
    else
      TextToDraw := sgUsuarios.Cells[ACol, ARow];
  end
  else
    TextToDraw := sgUsuarios.Cells[ACol, ARow];

  sgUsuarios.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TextToDraw);
end;
//click do botao adicionar usuario\\
procedure TPagUsuarios.btnAdicionarUsuarioClick(Sender: TObject);
  begin
    AdicionarUsuarios;
    btnAddNovo.Visible := False;
    pnlFormAddUsuarios.Visible := false;
    imgLogoUsuarios1.Visible := True;
    imgLogoUsuarios2.Visible := False;
  end;
//click cancelar adicionar usuario\\
procedure TPagUsuarios.btnCancelarUsuClick(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Visible := false;
    btnAlterarNovo.Visible := False;
    btnNovoPesquisar.Visible := False;
    btnAddNovo.visible := false;
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios1.Visible := True;
    imgLogoUsuarios2.Visible := False;
    sgUsuarios.Row := 0;
    sgUsuarios.Col := 0;
    sgUsuarios.SetFocus;
    if pesquisarUsuario.Visible then begin
      sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 5);
      sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 5);
      pesquisarUsuario.Visible := False;
    end;

  end;

//botao de X\\
procedure TPagUsuarios.btnXUsuariosClick(Sender: TObject);
  begin
    Close;
  end;
//comando para quando apertar enter\\
procedure TPagUsuarios.edUsuarioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  begin
      if Key = VK_RETURN then begin
      key := 0;
      edSenhausuario.setfocus;
    end;
  end;
//Click do botao sair\\
procedure TPagUsuarios.btnSairUsuClick(Sender: TObject);
  begin
    Sleep(500);
    Close;
  end;
//Click do botao limpar\\
procedure TPagUsuarios.btnLimparUsuClick(Sender: TObject);
  begin
    if pnlFormAddUsuarios.Visible = True then begin
       edUsuario.Clear;
       edSenhaUsuario.Clear;
       cbAtivo.ItemIndex := -1;
       cbGrupo.ItemIndex := -1;
       edUsuario.SetFocus;
    end else begin
       ShowMessage('Nenhum campo para limpar');
    end;

  end;
//Click do bot�o de adicionar usuarios e mandar para o banco\\
procedure TPagUsuarios.AdicionarUsuarios;
  begin
    try
      if (edUsuario.Text = '') or (edSenhaUsuario.Text = '') or (cbAtivo.Text = '') then begin
        ShowMessage('Preencha todos os campos');
        exit;
      end;

        Controller.AdicionarUsuario(
        edUsuario.Text,
        edSenhaUsuario.Text,
        cbGrupo.Text,
        cbAtivo.ItemIndex = 0
        );

        UserController.RegistrarLog('Adicionado', edUsuario.Text, 'Usu�rio adicionado');
        ShowMessage('Usu�rio adicionado com sucesso!');
        CarregarUsuarios;
        edUsuario.clear;
        edSenhaUsuario.Clear;
        cbAtivo.ItemIndex := -1;
        cbGrupo.ItemIndex := -1;
    finally
    end;
  end;
//bot�o de adicionar novo dos bot�es laterais\\
procedure TPagUsuarios.btnAddNovoClick(Sender: TObject);
  begin
    if btnaddnovo.Visible = true then begin
      pnlFormAddUsuarios.Visible := false;
      btnAddNovo.Visible := false;
      imgLogoUsuarios1.Visible := True;
      imgLogoUsuarios2.visible := False;
    end;

  end;
//bot�o de adicionar dos bot�es laterais\\
procedure TPagUsuarios.btnAddUsuClick(Sender: TObject);
  begin
    if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
    end;

    if (btnAlterarNovo.Visible = True) then begin
      edUsuario.Clear;
      edSenhaUsuario.Clear;
      cbAtivo.ItemIndex := -1;
      cbGrupo.ItemIndex := -1;
      edUsuario.SetFocus;
      sgUsuarios.Row := 0;
      sgUsuarios.Col := 0;
      sgUsuarios.SetFocus;
    end;

    if pesquisarUsuario.Visible = true  then begin
        sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 6);
        sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 6);
        pesquisarUsuario.Visible := False;
        btnNovoPesquisar.Visible := False;
    end;



      btnAlterarNovo.Visible := false;
      btnAddNovo.Visible := True;
      btnNovoPesquisar.Visible := False;
      btnRestaurarNovo.Visible := false;
      btnConfirmarAlteracoes.Visible := false;
      btnAdicionarUsuario.Visible := True;
      pnlFormAddUsuarios.Visible := True;
      imgLogoUsuarios2.Visible := True;
      imgLogoUsuarios1.Visible := False;
      edUsuario.SetFocus;
  end;

procedure TPagUsuarios.btnConfirmarAlteracoesClick(Sender: TObject);
begin
  if UsuarioIdalterar = 0 then
  begin
    ShowMessage('Selecione um Usu�rio para alterar');
    Exit;
  end;
  try
  Controller.AlterarUsuario(
      UsuarioIdalterar,
      edUsuario.Text,
      edSenhaUsuario.Text,
      cbGrupo.Text,
      cbAtivo.ItemIndex = 0
    );
    UserController.RegistrarLog('Alterarado', edUsuario.Text,  'Usu�rio alterado (id: '+IntToStr(UsuarioIdalterar)+')');
    ShowMessage('Usu�rio alterado com sucesso!');
    btnAlterarNovo.Visible := False;
    CarregarUsuarios;
    pnlFormAddUsuarios.Visible := False;
  finally
  end;
end;
//click do botao de deletar usuario\\
procedure TPagUsuarios.btnDeletarUsuClick(Sender: TObject);
var
  LinhaDelet: Integer;
  Usuario: TUsuario;
begin
  if btnAlterarNovo.Visible = True then begin
    btnAlterarNovo.Visible := False;
    pnlFormAddUsuarios.Visible := False;
  end;

  if btnNovoPesquisar.Visible = true  then begin
      sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 5);
      sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 5);
      pesquisarUsuario.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

  if not Assigned(UsuarioLista) then Exit;
  LinhaDelet := sgUsuarios.Row;
  if LinhaDelet > 0 then begin
    Usuario := TUsuario.Create;
    try
      Usuario.Id    := StrToInt(sgUsuarios.Cells[0, LinhaDelet]);
      Usuario.Nome  := sgUsuarios.Cells[1, LinhaDelet];
      Usuario.Senha := sgUsuarios.Cells[2, LinhaDelet];
      Usuario.Ativo := True;
      Usuario.Grupo := sgUsuarios.Cells[4, LinhaDelet];

      Controller := TUsuarioController.Create;
      try
        Controller.DeletarUsuario(Usuario);
        UserController.RegistrarLog('Deletado', Usuario.Nome, 'Usu�rio deletado (id: '+IntToStr(Usuario.Id)+')');
        CarregarUsuarios;
        ShowMessage('Usu�rio deletado com sucesso!');
        sgUsuarios.Row := 0;
        sgUsuarios.Col := 0;
        sgUsuarios.SetFocus;
      finally
      end;
    finally
      Usuario.Free;
    end;
  end else
    ShowMessage('Selecione um usu�rio para deletar.');
end;
//Click do botao de pesquisar\\
procedure TPagUsuarios.btnPesquisarUsuClick(Sender: TObject);
  begin
    if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
    end;

    sgUsuarios.Row := 0;
    sgUsuarios.Col := 0;
    sgUsuarios.SetFocus;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := false;
    btnNovoPesquisar.Visible := True;
    pnlFormAddUsuarios.Visible := false;
    imgLogoUsuarios2.Visible := false;
    imgLogoUsuarios1.Visible := True;

    if not pesquisarUsuario.Visible then begin
      pesquisarUsuario.Visible := True;
      sgUsuarios.Top := pesquisarUsuario.Top + pesquisarUsuario.Height + 8;
      sgUsuarios.Height := sgUsuarios.Height - (pesquisarUsuario.Height + 8);
      pesquisarUsuario.SetFocus;
    end;
  end;
//click do botao de alterar\\
procedure TPagUsuarios.btnAlterarNovoClick(Sender: TObject);
  begin
    if btnAlterarNovo.Visible = true then begin
      pnlFormAddUsuarios.Visible := False;
      btnAlterarNovo.Visible := False;
      imgLogoUsuarios1.Visible := True;
      imgLogoUsuarios2.visible := False;
    end;
  end;

procedure TPagUsuarios.btnAlterarUsuClick(Sender: TObject);
  var
  linha: Integer;
  grupo, ativo: string;
  begin
    if pnlRestaurar.Visible = true then begin
      pnlRestaurar.Visible := False;
      btnRestaurarNovo.Visible := false;
    end;

    linha := sgUsuarios.Row;
    if linha <= 0 then begin
      ShowMessage('Selecione um usu�rio!');
      Exit;
    end;

    if btnNovoPesquisar.Visible = true  then begin
      sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 5);
      sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 5);
      pesquisarUsuario.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

    UsuarioIdalterar := StrToIntDef(sgUsuarios.Cells[0, linha], 0);
    edUsuario.Text := sgUsuarios.Cells[1, linha];
    edSenhaUsuario.Text := sgUsuarios.Cells[2, linha];
    ativo := Trim(sgUsuarios.Cells[3, linha]);

    if cbAtivo.Items.IndexOf(ativo) <> -1 then begin
      cbAtivo.ItemIndex := cbAtivo.Items.IndexOf(ativo)
    end else begin
          cbAtivo.Items.Add(ativo);
          cbAtivo.ItemIndex := cbAtivo.Items.IndexOf(ativo);
        end;
    grupo := Trim(sgUsuarios.Cells[4, linha]);
    if cbGrupo.Items.IndexOf(grupo) <> -1 then begin
      cbGrupo.ItemIndex := cbGrupo.Items.IndexOf(grupo)
    end else begin
          cbGrupo.Items.Add(grupo);
          cbGrupo.ItemIndex := cbGrupo.Items.IndexOf(grupo);
        end;

    btnAddNovo.Visible := False;
    btnRestaurarNovo.Visible := false;
    btnAlterarNovo.Visible := True;
    btnConfirmarAlteracoes.Visible := True;
    btnAdicionarUsuario.Visible := False;
    pnlFormAddUsuarios.Visible := True;
   end;
//Click do botao de restaurar\\
procedure TPagUsuarios.btnRestaurarUsuClick(Sender: TObject);
  begin
    if pnlFormAddUsuarios.Visible = True then begin
      pnlFormAddUsuarios.Visible := false;
    end;

    if btnNovoPesquisar.Visible = true  then begin
      sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 5);
      sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 5);
      pesquisarUsuario.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;

    btnRestaurarNovo.Visible := True;
    CarregarInativos;
    btnAddNovo.Visible := False;
    btnAlterarNovo.Visible := false;
    pnlRestaurar.Visible := True;
    sgRestore.SetFocus;

    sgRestore.Cells[0,0] := 'ID';
    sgRestore.Cells[1,0] := 'Nome de Usu�rio';
    sgRestore.Cells[2,0] := 'Senha';
    sgRestore.Cells[3,0] := 'Ativo';
    sgRestore.Cells[4,0] := 'Grupo';

    sgRestore.ColWidths[0] := 40;
    sgRestore.ColWidths[1] := 110;
    sgRestore.ColWidths[2] := 85;
    sgRestore.ColWidths[3] := 65;
    sgRestore.ColWidths[4] := 93;

  end;
//Click do bot�o de confirmar restaurar\\
procedure TPagUsuarios.btnCRestoreClick(Sender: TObject);
  begin
    ConfirmarRestauracao;
    CarregarUsuarios;
  end;

procedure TPagUsuarios.btnCRestoreMouseEnter(Sender: TObject);
  begin
    btnCRestore.Color := $00F8973F;
  end;

procedure TPagUsuarios.btnCRestoreMouseLeave(Sender: TObject);
  begin
    btnCrestore.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnCancelarUsuMouseEnter(Sender: TObject);
  begin
    btnCancelarUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnCancelarUsuMouseLeave(Sender: TObject);
  begin
    btnCancelarUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnConfirmarAlteracoesMouseEnter(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $00C46106;
  end;

procedure TPagUsuarios.btnConfirmarAlteracoesMouseLeave(Sender: TObject);
  begin
    btnConfirmarAlteracoes.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnDeletarUsuMouseEnter(Sender: TObject);
  begin
    btnDeletarUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnDeletarUsuMouseLeave(Sender: TObject);
  begin
    btnDeletarUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnLimparUsuMouseEnter(Sender: TObject);
  begin
    btnLimparUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnLimparUsuMouseLeave(Sender: TObject);
  begin
    btnLimparUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnNovoPesquisarClick(Sender: TObject);
  begin
    if btnNovoPesquisar.Visible = true  then begin
      sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 5);
      sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 5);
      pesquisarUsuario.Visible := False;
      btnNovoPesquisar.Visible := False;
    end;
  end;

procedure TPagUsuarios.btnPesquisarUsuMouseEnter(Sender: TObject);
  begin
    btnPesquisarUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnPesquisarUsuMouseLeave(Sender: TObject);
  begin
    btnPesquisarUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnRestaurarUsuMouseEnter(Sender: TObject);
  begin
    btnRestaurarUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnRestaurarUsuMouseLeave(Sender: TObject);
  begin
    btnRestaurarUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnSairUsuMouseEnter(Sender: TObject);
  begin
    btnSairUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnSairUsuMouseLeave(Sender: TObject);
  begin
    btnSairUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnAdicionarUsuarioMouseEnter(Sender: TObject);
  begin
    btnAdicionarUsuario.Color := $00C46106;
  end;

procedure TPagUsuarios.btnAdicionarUsuarioMouseLeave(Sender: TObject);
  begin
    btnAdicionarUsuario.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnAlterarUsuMouseEnter(Sender: TObject);
  begin
    btnAlterarUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnAlterarUsuMouseLeave(Sender: TObject);
  begin
    btnAlterarUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnAddUsuMouseEnter(Sender: TObject);
  begin
    btnAddUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnAddUsuMouseLeave(Sender: TObject);
  begin
    btnAddUsu.Color :=  $007C3E05;
  end;

end.
