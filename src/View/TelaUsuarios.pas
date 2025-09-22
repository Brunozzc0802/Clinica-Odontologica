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
    btnXUsuarios: TSpeedButton;
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
    btnPermissoes: TPanel;
    lblPermissoes: TLabel;
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
    lblConfirmarAlteracoes: TLabel;
    btnConfirmarAlteracoes: TPanel;
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
    procedure btnPermissoesMouseEnter(Sender: TObject);
    procedure btnPermissoesMouseLeave(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagUsuarios: TPagUsuarios;

implementation

{$R *.dfm}

//Função que mostra os dados do banco no grid\\
procedure TPagUsuarios.CarregarUsuarios;
var
  Controller: TUsuarioController;
  Lista: TObjectList<TUsuario>;
  I: Integer;
begin
  Controller := TUsuarioController.Create;
  try
    Lista := Controller.BuscarTodos;

    sgUsuarios.RowCount := Lista.Count + 1;

    // Cabeçalho
    sgUsuarios.Cells[0, 0] := 'ID';
    sgUsuarios.Cells[1, 0] := 'Nome de Usuário';
    sgUsuarios.Cells[2, 0] := 'Senha';
    sgUsuarios.Cells[3, 0] := 'Ativo';
    sgUsuarios.Cells[4, 0] := 'Grupo';

    // Dados
    for I := 0 to Lista.Count - 1 do
    begin
      sgUsuarios.Cells[0, I + 1] := IntToStr(I + 1);
      sgUsuarios.Cells[1, I + 1] := Lista[I].Nome;
      sgUsuarios.Cells[2, I + 1] := Lista[I].Senha;
      sgUsuarios.Cells[3, I + 1] := BoolToStr(Lista[I].Ativo, True);
      sgUsuarios.Cells[4, I + 1] := Lista[I].Grupo;
    end;
    Lista.Free;
  finally
    Controller.Free;
  end;
end;



//ação de fechar o formulario\\
procedure TPagUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    btnAddNovo.visible := false;
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;
    imgLogoUsuarios1.Visible := True;
  end;

//criação do formulario\\
procedure TPagUsuarios.FormCreate(Sender: TObject);
  begin
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;
    btnAddNovo.Visible := False;

  //configurações grid\\
  sgUsuarios.Cells[0,0] := 'Código';
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

//color de fundo do grid\\
procedure TPagUsuarios.sgUsuariosDrawCell(Sender: TObject; ACol, ARow: LongInt;Rect: TRect; State: TGridDrawState);
var
  TextToDraw: string;
  BGColor: TColor;
begin
  // Define a cor de fundo dependendo se está selecionado
  if gdSelected in State then
    BGColor := clHighlight  // azul padrão do Windows
  else
    BGColor := clWindow;    // fundo normal

  // Preenche o fundo
  sgUsuarios.Canvas.Brush.Color := BGColor;
  sgUsuarios.Canvas.FillRect(Rect);

  // Define a cor do texto dependendo se está selecionado
  if gdSelected in State then
    sgUsuarios.Canvas.Font.Color := clHighlightText
  else
    sgUsuarios.Canvas.Font.Color := clWindowText;

  // Substitui por * se for a coluna de senha e não for cabeçalho
  if (ARow > 0) and (ACol = 2) then
    TextToDraw := StringOfChar('*', Length(sgUsuarios.Cells[ACol, ARow]))
  else
    TextToDraw := sgUsuarios.Cells[ACol, ARow];

  // Desenha o texto
  sgUsuarios.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, TextToDraw);
end;

//click do botao adicionar usuario\\
procedure TPagUsuarios.btnAdicionarUsuarioClick(Sender: TObject);
  var novaLinha, cod: Integer;
  begin

  if (edUsuario.Text = '') and (edSenhaUsuario.Text = '') then begin
    ShowMessage('Preencha os campos nome e senha');
    exit;
    end;
    if (edUsuario.Text = '') then begin
      showMessage('Preencha o campo nome');
      edUsuario.SetFocus;
      exit;
    end else if (edSenhaUsuario.Text = '') then begin
      ShowMessage('Preencha o campo senha');
      edSenhaUsuario.setfocus;
      exit;
    end else
  novaLinha := sgUsuarios.rowCount;
  sgUsuarios.RowCount := novaLinha +1;

  cod := novaLinha;

  SgUsuarios.Cells[0, novaLinha] := IntToStr(cod);
  SgUsuarios.Cells[1, novaLinha] := edUsuario.Text;
  sgUsuarios.Cells[2, novaLinha] := edSenhaUsuario.Text;
  sgUsuarios.Cells[3, novaLinha] := cbAtivo.Text;
  sgUsuarios.Cells[4, novaLinha] := cbGrupo.Text;

  edUsuario.Clear;
  edSenhaUsuario.Clear;
  cbAtivo.ItemIndex := -1;
  cbGrupo.ItemIndex := -1;
  edUsuario.SetFocus;

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

    if pesquisarUsuario.Visible then
  begin
    // Voltar grid para posição original
    sgUsuarios.Top := sgUsuarios.Top - (pesquisarUsuario.Height + 5);
    sgUsuarios.Height := sgUsuarios.Height + (pesquisarUsuario.Height + 5);

    // Esconder a barra de pesquisa
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
    edUsuario.Clear;
    edSenhaUsuario.Clear;
    cbAtivo.ItemIndex := -1;
    cbGrupo.ItemIndex := -1;
    edUsuario.SetFocus;
  end;

procedure TPagUsuarios.btnAddUsuClick(Sender: TObject);
  begin
    btnAlterarNovo.Visible := false;
    btnConfirmarAlteracoes.Visible := false;
    btnAdicionarUsuario.Visible := True;
    btnNovoPesquisar.Visible := False;
    btnAddNovo.Visible := True;
    pnlFormAddUsuarios.Visible := True;
    imgLogoUsuarios2.Visible := True;
    imgLogoUsuarios1.Visible := False;
    edUsuario.SetFocus;
  end;

//animação de hover nos botões\\
procedure TPagUsuarios.btnCancelarUsuMouseEnter(Sender: TObject);
  begin
    btnCancelarUsu.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnCancelarUsuMouseLeave(Sender: TObject);
  begin
    btnCancelarUsu.Color := $007C3E05;
  end;

procedure TPagUsuarios.btnConfirmarAlteracoesClick(Sender: TObject);
var
  linha: Integer;
begin
  linha := sgUsuarios.Row; // Pega a linha que está selecionada

  if linha <= 0 then
  begin
    ShowMessage('Selecione um usuário para alterar!');
    Exit;
  end;

  showMessage('Alterações feitas com sucesso');

  sgUsuarios.Cells[1, linha] := edUsuario.Text;
  sgUsuarios.Cells[2, linha] := edSenhaUsuario.Text;
  sgUsuarios.Cells[3, linha] := cbAtivo.Text;
  sgUsuarios.Cells[4, linha] := cbGrupo.Text;

  // Limpa o formulário
  edUsuario.Clear;
  edSenhaUsuario.Clear;
  cbAtivo.ItemIndex := -1;
  cbGrupo.ItemIndex := -1;
  edUsuario.SetFocus;


  btnAlterarNovo.Visible := False;
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

procedure TPagUsuarios.btnPermissoesMouseEnter(Sender: TObject);
  begin
    btnPermissoes.Color := $00F78B2B;
  end;

procedure TPagUsuarios.btnPermissoesMouseLeave(Sender: TObject);
  begin
    btnPermissoes.Color :=  $007C3E05;
  end;

procedure TPagUsuarios.btnPesquisarUsuClick(Sender: TObject);
begin
  btnAddNovo.Visible := False;
  btnNovoPesquisar.Visible := True;
  pnlFormAddUsuarios.Visible := false;
  imgLogoUsuarios2.Visible := false;
  imgLogoUsuarios1.Visible := True;

  if not pesquisarUsuario.Visible then
  begin
    // Mostrar barra de pesquisa
    pesquisarUsuario.Visible := True;

    // Mover o grid para baixo
    sgUsuarios.Top := pesquisarUsuario.Top + pesquisarUsuario.Height + 8;
    sgUsuarios.Height := sgUsuarios.Height - (pesquisarUsuario.Height + 8);

    pesquisarUsuario.SetFocus;
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

procedure TPagUsuarios.btnAlterarUsuClick(Sender: TObject);
var
  linha: Integer;
  grupo, ativo: string;
begin
  linha := sgUsuarios.Row; // Pega a linha selecionada no StringGrid
  if linha <= 0 then begin
    ShowMessage('Selecione um usuário!');
    Exit;
  end;
  edUsuario.Text := sgUsuarios.Cells[1, linha];
  edSenhaUsuario.Text := sgUsuarios.Cells[2, linha];

  ativo := Trim(sgUsuarios.Cells[3, linha]);
  if cbAtivo.Items.IndexOf(ativo) <> -1 then
    cbAtivo.ItemIndex := cbAtivo.Items.IndexOf(ativo)
  else begin
    cbAtivo.Items.Add(ativo);
    cbAtivo.ItemIndex := cbAtivo.Items.IndexOf(ativo);
  end;
  grupo := Trim(sgUsuarios.Cells[4, linha]);
  if cbGrupo.Items.IndexOf(grupo) <> -1 then
    cbGrupo.ItemIndex := cbGrupo.Items.IndexOf(grupo)
  else begin
    cbGrupo.Items.Add(grupo);
    cbGrupo.ItemIndex := cbGrupo.Items.IndexOf(grupo);
  end;
  // Mostra o painel e os botões
  btnAddNovo.Visible := False;
  btnAlterarNovo.Visible := True;
  btnConfirmarAlteracoes.Visible := True;
  btnAdicionarUsuario.Visible := False;
  pnlFormAddUsuarios.Visible := True;
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
