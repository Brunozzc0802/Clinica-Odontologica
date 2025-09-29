unit TelaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Grids, Vcl.WinXCtrls, uUsuariosController, uUsuarios,
  System.Generics.Collections;

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
    btnDeletarNovo: TPanel;
    Label4: TLabel;
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
  private
    UsuarioIdalterar: Integer;
    UsuarioLista: TObjectList<TUsuario>;
    procedure PesquisarUsuarios(const Filtro: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagUsuarios: TPagUsuarios;

implementation

{$R *.dfm}


//função que carrega os inativos\\
procedure TPagUsuarios.CarregarInativos;
var
  Controller: TUsuarioController;
  I: Integer;
begin
  Controller := TUsuarioController.Create;
  try
    if Assigned(UsuarioLista) then
    UsuarioLista.Free;
    UsuarioLista := Controller.BuscarInativos;

    // Cabeçalho
    sgRestore.Cells[0, 0] := 'ID';
    sgRestore.Cells[1, 0] := 'Nome de Usuário';
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
    Controller.Free;
  end;
end;

//Função que busca os usuarios na barra de pesquisa\
procedure TPagUsuarios.PesquisarUsuarios(const Filtro: string);
var
  I, Linha: Integer;
  Usuario: TUsuario;
  TextoFiltro: string;
begin
  if not Assigned(UsuarioLista) then Exit;
  sgUsuarios.ColCount := 5;   // garante colunas
  sgUsuarios.RowCount := 1;   // só cabeçalho
  Linha := 1;
  TextoFiltro := LowerCase(Filtro);
  for I := 0 to UsuarioLista.Count - 1 do begin
    Usuario := UsuarioLista[I];
    if (Filtro = '') or (Pos(TextoFiltro, LowerCase(Usuario.Nome)) > 0) then
    begin
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

//função que carrega os usuarios no grid\\
procedure TPagUsuarios.CarregarUsuarios;
var
  Controller: TUsuarioController;
  I: Integer;
begin
  Controller := TUsuarioController.Create;
  try
    if Assigned(UsuarioLista) then
      UsuarioLista.Free;
    UsuarioLista := Controller.BuscarTodos;

    // Cabeçalho
    sgUsuarios.Cells[0, 0] := 'ID';
    sgUsuarios.Cells[1, 0] := 'Nome de Usuário';
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
    Controller.Free;
  end;
end;


//ação de fechar o formulario\\
procedure TPagUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(UsuarioLista);
    btnAddNovo.visible := false;
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;
    imgLogoUsuarios1.Visible := True;
  end;
//criação da tela de usuarios\\
procedure TPagUsuarios.FormCreate(Sender: TObject);
  begin
    pesquisarUsuario.OnChange := pesquisarUsuarioChange;
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;
    btnAddNovo.Visible := False;

  //configurações grid\\
  sgUsuarios.Cells[0,0] := 'ID';
  sgUsuarios.Cells[1,0] := 'Nome de Usuário';
  sgUsuarios.Cells[2,0] := 'Senha';
  sgUsuarios.Cells[3,0] := 'Ativo';
  sgUsuarios.Cells[4,0] := 'Grupo';

  sgUsuarios.ColWidths[0] := 60;
  sgUsuarios.ColWidths[1] := 150;
  sgUsuarios.ColWidths[2] := 110;
  sgUsuarios.ColWidths[3] := 70;
  sgUsuarios.ColWidths[4] := 127;
  end;
//chama a função para mostrar as informações do banco no grid\\
procedure TPagUsuarios.FormShow(Sender: TObject);
  begin
    CarregarUsuarios;
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
//cor de fundo e senha em *\\
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
procedure TPagUsuarios.AdicionarUsuarios;
var
  Controller: TUsuarioController;
begin
  Controller := TUsuarioController.Create;
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

    ShowMessage('Usuário adicionado com sucesso!');
    CarregarUsuarios;
    edUsuario.clear;
    edSenhaUsuario.Clear;
    cbAtivo.ItemIndex := -1;
    cbGrupo.ItemIndex := -1;
  finally
    Controller.Free;
  end;
end;

//botao de adicionar dos botões laterais\\
procedure TPagUsuarios.btnAddUsuClick(Sender: TObject);
  begin
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
    //botões de cor nova\\
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
//botão de confirmar alterações
procedure TPagUsuarios.btnConfirmarAlteracoesClick(Sender: TObject);
var
  Controller: TUsuarioController;
begin
  if UsuarioIdalterar = 0 then
  begin
    ShowMessage('Selecione um Usuário para alterar');
    Exit;
  end;
  Controller := TUsuarioController.Create;
  try
  Controller.AlterarUsuario(
      UsuarioIdalterar,
      edUsuario.Text,
      edSenhaUsuario.Text,
      cbGrupo.Text,
      cbAtivo.ItemIndex = 0
    );

    ShowMessage('Usuário alterado com sucesso!');
    btnAlterarNovo.Visible := False;
    CarregarUsuarios;
    pnlFormAddUsuarios.Visible := False;
  finally
    Controller.Free;
  end;
end;
//click do botao de deletar usuario\\
procedure TPagUsuarios.btnDeletarUsuClick(Sender: TObject);
var
  LinhaDelet: Integer;
  Usuario: TUsuario;
  ControllerDelet: TUsuarioController;
begin
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

      ControllerDelet := TUsuarioController.Create;
      try
        ControllerDelet.DeletarUsuario(Usuario);
        CarregarUsuarios;
        ShowMessage('Usuário deletado com sucesso!');
        sgUsuarios.Row := 0;
        sgUsuarios.Col := 0;
        sgUsuarios.SetFocus;
      finally
        ControllerDelet.Free;
        btnDeletarNovo.Visible := False;
      end;
    finally
      Usuario.Free;
    end;
  end
  else
    ShowMessage('Selecione um usuário para deletar.');
end;
//Click do botao de pesquisar\\
procedure TPagUsuarios.btnPesquisarUsuClick(Sender: TObject);
begin
  btnAddNovo.Visible := False;
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
procedure TPagUsuarios.btnAlterarUsuClick(Sender: TObject);
var
  linha: Integer;
  grupo, ativo: string;
  begin
    linha := sgUsuarios.Row;
    if linha <= 0 then
    begin
      ShowMessage('Selecione um usuário!');
      Exit;
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
    btnAlterarNovo.Visible := True;
    btnConfirmarAlteracoes.Visible := True;
    btnAdicionarUsuario.Visible := False;
    pnlFormAddUsuarios.Visible := True;
  end;
//Click do botao de restaurar\\
procedure TPagUsuarios.btnRestaurarUsuClick(Sender: TObject);
  begin
    CarregarInativos;
    btnRestaurarNovo.Visible := True;
    btnAddNovo.Visible := False;
    pnlRestaurar.Visible := True;

    sgRestore.Cells[0,0] := 'ID';
    sgRestore.Cells[1,0] := 'Nome de Usuário';
    sgRestore.Cells[2,0] := 'Senha';
    sgRestore.Cells[3,0] := 'Ativo';
    sgRestore.Cells[4,0] := 'Grupo';

    sgRestore.ColWidths[0] := 40;
    sgRestore.ColWidths[1] := 110;
    sgRestore.ColWidths[2] := 85;
    sgRestore.ColWidths[3] := 65;
    sgRestore.ColWidths[4] := 93;

  end;

//ANIMAÇÃO DE HOVER NOS BOTÕES\\
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

procedure TPagUsuarios.btnCRestoreClick(Sender: TObject);
var
  LinhaRestore: Integer;
  Usuario: TUsuario;
  ControllerRestore: TUsuarioController;
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

      ControllerRestore := TUsuarioController.Create;
      try
        ControllerRestore.RestaurarUsuario(Usuario);
        CarregarInativos;
        ShowMessage('Usuário Restaurado com sucesso!');
      finally
        ControllerRestore.Free;
        pnlRestaurar.Visible := False;
        btnRestaurarNovo.Visible := False;
        CarregarUsuarios;
        sgUsuarios.Row := 0;
        sgUsuarios.Col := 0;
        sgUsuarios.SetFocus;
      end;
    finally
      Usuario.Free;
    end;
  end else begin
    ShowMessage('Selecione um usuário para Restaurar.');
end;
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
