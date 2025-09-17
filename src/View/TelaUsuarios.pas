unit TelaUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Grids;

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
    lblAdiconaFUsuario: TLabel;
    imgLogoUsuarios2: TImage;
    btnLimparUsu: TPanel;
    lblLimpar: TLabel;
    btnSairUsu: TPanel;
    lblSair: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagUsuarios: TPagUsuarios;

implementation

{$R *.dfm}

//ação de fechar o formulario\\
procedure TPagUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;
    imgLogoUsuarios1.Visible := True;
  end;

//criação do formulario\\
procedure TPagUsuarios.FormCreate(Sender: TObject);
  begin
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios2.Visible := False;

  sgUsuarios.Cells[0,0] := 'Cód';
  sgUsuarios.Cells[1,0] := 'Nome de Usuário';
  sgUsuarios.Cells[2,0] := 'Senha';
  sgUsuarios.Cells[3,0] := 'Ativo';
  sgUsuarios.Cells[4,0] := 'Grupo';

  sgUsuarios.ColWidths[0] := 50;
  sgUsuarios.ColWidths[1] := 150;
  sgUsuarios.ColWidths[2] := 100;
  sgUsuarios.ColWidths[3] := 50;
  sgUsuarios.ColWidths[4] := 100;
  end;

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
    pnlFormAddUsuarios.Visible := False;
    imgLogoUsuarios1.Visible := True;
    imgLogoUsuarios2.Visible := False;
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
