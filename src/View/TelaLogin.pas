unit TelaLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, TelaUsuarios, uUsuarios, uUsuariosController, TelaPacientes,
  TelaProfissionais, TelaProcedimentos, TelaConsultas, uUsuariosControllerLog,
  uDadosGlobais, TelaRelatorios;

type
  TFormLogin = class(TForm)
    pnlLogin: TPanel;
    pnlTelaPrincipal: TPanel;
    imgFundo: TImage;
    pnlAzul: TPanel;
    pnlAzulPrincipal: TPanel;
    imgLogoPrincipal: TImage;
    pnlFundoLateral: TPanel;
    imgLogoLogin: TImage;
    pnlFormLogin: TPanel;
    lblRealizeSeu: TLabel;
    lblLogin: TLabel;
    ShapeNome: TShape;
    ShapeSenha: TShape;
    edUsuario: TEdit;
    edSenha: TEdit;
    bordaDoForm: TPanel;
    ImgOlhoFechado: TImage;
    ImgOlhoAberto: TImage;
    lblUsuarios: TLabel;
    pnlUser: TPanel;
    pnlPacientes: TPanel;
    lblPacientes: TLabel;
    pnlProfissionais: TPanel;
    lblProfissionais: TLabel;
    pnlConsultas: TPanel;
    lblConsultas: TLabel;
    pnlProcedimentos: TPanel;
    lblProcedimentos: TLabel;
    pnlEncerrarSistema: TPanel;
    lblEncerrarSistema: TLabel;
    pnlRelatorios: TPanel;
    lblRelatorios: TLabel;
    btnEntrar: TPanel;
    lblEntrar: TLabel;
    imgPacientes: TImage;
    imgProfissionais: TImage;
    imgConsultas: TImage;
    imgRelatorios: TImage;
    imgProcedimentos: TImage;
    imgEncerrarSistema: TImage;
    footerPrincipal: TPanel;
    Timer1: TTimer;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Image1: TImage;
    Shape8: TShape;
    Panel1: TPanel;
    lblDataHora: TLabel;
    Shape9: TShape;
    Panel2: TPanel;
    lblBemVindo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnEntrarMouseEnter(Sender: TObject);
    procedure btnEntrarMouseLeave(Sender: TObject);
    procedure btnEncerrarSistemaClick(Sender: TObject);
    procedure ImgOlhoFechadoClick(Sender: TObject);
    procedure ImgOlhoAbertoClick(Sender: TObject);
    procedure pnlUserMouseEnter(Sender: TObject);
    procedure pnlUserMouseLeave(Sender: TObject);
    procedure pnlPacientesMouseEnter(Sender: TObject);
    procedure pnlPacientesMouseLeave(Sender: TObject);
    procedure pnlProfissionaisMouseEnter(Sender: TObject);
    procedure pnlProfissionaisMouseLeave(Sender: TObject);
    procedure pnlConsultasMouseLeave(Sender: TObject);
    procedure pnlConsultasMouseEnter(Sender: TObject);
    procedure pnlProcedimentosMouseEnter(Sender: TObject);
    procedure pnlProcedimentosMouseLeave(Sender: TObject);
    procedure pnlRelatoriosMouseLeave(Sender: TObject);
    procedure pnlRelatoriosMouseEnter(Sender: TObject);
    procedure pnlEncerrarSistemaMouseEnter(Sender: TObject);
    procedure pnlEncerrarSistemaMouseLeave(Sender: TObject);
    procedure pnlUserClick(Sender: TObject);
    procedure pnlEncerrarSistemaClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pnlPacientesClick(Sender: TObject);
    procedure pnlProfissionaisClick(Sender: TObject);
    procedure pnlProcedimentosClick(Sender: TObject);
    procedure pnlConsultasClick(Sender: TObject);
    procedure edSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure imgRelatoriosClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

procedure TFormLogin.btnEntrarClick(Sender: TObject);
var
  UserController: TUsuarioController;
  Usuario: TUsuario;
  Msg: String;
begin
  UserController := TUsuarioController.Create;
  try
    if (edUsuario.Text = '') or (edSenha.Text = '') then begin
      ShowMessage('Preencha todos os campos');
      edUsuario.SetFocus;
      Exit;
    end;
    Usuario := UserController.VerificarUsuario(edUsuario.Text,
      edSenha.Text, Msg);
    if Usuario = nil then begin
      ShowMessage(Msg);
      Exit;
    end;
    UsuarioLogado := Usuario;
    if Usuario.Grupo = 'Administrador' then begin
      Sleep(300);
      pnlLogin.Visible := False;
      pnlTelaPrincipal.Visible := True;
      pnlFundoLateral.Visible := True;
      lblBemVindo.Caption := 'Bem-vindo, ' + Usuario.Nome + '!';
    end
    else if Usuario.Grupo = 'Recepcionista' then begin
      Shape7.Visible := False;
      pnlPacientes.Top := 8;
      Shape6.Top := 5;
      pnlConsultas.Top := 86;
      Shape4.Top := 83;
      pnlRelatorios.Top := 168;
      Shape2.Top := 163;
      Shape5.Visible := False;
      pnlEncerrarSistema.Top := 245;
      Shape1.Top := 242;
      Shape3.Visible := False;
      pnlUser.Visible := False;
      pnlProfissionais.Visible := False;
      pnlProcedimentos.Visible := False;
      lblBemVindo.Caption := 'Bem-vindo: ' + Usuario.Nome + '!';
    end
    else if Usuario.Grupo = 'Profissional' then begin
      pnlConsultas.Visible := True;
      pnlConsultas.Top := 8;
      Shape4.Top := 5;
      pnlPacientes.Visible := True;
      pnlPacientes.Top := 86;
      Shape6.Top := 83;
      pnlRelatorios.Visible := True;
      pnlRelatorios.Top := 164;
      Shape2.Top := 161;
      pnlEncerrarSistema.Visible := True;
      pnlEncerrarSistema.Top := 242;
      Shape1.Top := 239;
      pnlUser.Visible := False;
      pnlProfissionais.Visible := False;
      pnlProcedimentos.Visible := False;
      Shape7.Visible := False;
      Shape5.Visible := False;
      Shape3.Visible := False;
      lblBemVindo.Caption := 'Bem-vindo: ' + Usuario.Nome + '!';
    end
    else
      Sleep(300);
    pnlLogin.Visible := False;
    pnlTelaPrincipal.Visible := True;
    pnlFundoLateral.Visible := True;
    lblBemVindo.Caption := 'Bem-vindo: ' + Usuario.Nome + '!';
  finally
    UserController.Free;
  end;
end;

procedure TFormLogin.btnEntrarMouseEnter(Sender: TObject);
begin
  btnEntrar.Color := $00B06D13;
end;

procedure TFormLogin.btnEntrarMouseLeave(Sender: TObject);
begin
  btnEntrar.Color := $00C97D16;
end;

procedure TFormLogin.edSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0; // bloqueia o som
    btnEntrarClick(nil);
  end;
end;

procedure TFormLogin.edUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    edSenha.SetFocus;
  end;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
  lblLogin.font.Color := $00C97D16;
end;

procedure TFormLogin.Image1Click(Sender: TObject);
begin
  Sleep(400);
  pnlLogin.Visible := True;
  edUsuario.Clear;
  edSenha.Clear;
  pnlTelaPrincipal.Visible := False;
end;

procedure TFormLogin.ImgOlhoAbertoClick(Sender: TObject);
begin
  edSenha.PasswordChar := '*';
  ImgOlhoFechado.Visible := True;
  ImgOlhoAberto.Visible := False;
end;

procedure TFormLogin.ImgOlhoFechadoClick(Sender: TObject);
begin
  edSenha.PasswordChar := #0;
  ImgOlhoAberto.Visible := True;
  ImgOlhoFechado.Visible := False;
end;

procedure TFormLogin.imgRelatoriosClick(Sender: TObject);
begin
  PagRelatorios.Show;
  PagUsuarios.Close;
  PagPacientes.Close;
  PagProfissionais.Close;
  PagConsultas.Close;
  PagProfissionais.Close;
end;

procedure TFormLogin.pnlConsultasClick(Sender: TObject);
begin
  PagConsultas.Show;
  PagUsuarios.Close;
  PagPacientes.Close;
  PagProfissionais.Close;
  PagProcedimentos.Close;
  PagRelatorios.Close;
end;

procedure TFormLogin.pnlConsultasMouseEnter(Sender: TObject);
begin
  pnlConsultas.Color := $00F78B2B;
  Shape4.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlConsultasMouseLeave(Sender: TObject);
begin
  pnlConsultas.Color := $007C3E05;
  Shape4.Brush.Color := $007C3E05;
end;

procedure TFormLogin.pnlEncerrarSistemaClick(Sender: TObject);
begin
  if MessageDlg('Deseja Encerrar o Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then begin
    Sleep(500);
    Close;
  end
  else begin
    Exit;
  end;

end;

procedure TFormLogin.pnlEncerrarSistemaMouseEnter(Sender: TObject);
begin
  pnlEncerrarSistema.Color := $00F78B2B;
  Shape1.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlEncerrarSistemaMouseLeave(Sender: TObject);
begin
  pnlEncerrarSistema.Color := $007C3E05;
  Shape1.Brush.Color := $007C3E05;
end;

procedure TFormLogin.pnlPacientesClick(Sender: TObject);
begin
  PagPacientes.Show;
  PagUsuarios.Close;
  PagProfissionais.Close;
  PagRelatorios.Close;
  PagConsultas.Close;
  PagProcedimentos.Close;
end;

procedure TFormLogin.pnlPacientesMouseEnter(Sender: TObject);
begin
  pnlPacientes.Color := $00F78B2B;
  Shape6.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlPacientesMouseLeave(Sender: TObject);
begin
  pnlPacientes.Color := $007C3E05;
  Shape6.Brush.Color := $007C3E05;
end;

procedure TFormLogin.pnlProcedimentosClick(Sender: TObject);
begin
  PagProcedimentos.Show;
  PagProfissionais.Close;
  PagPacientes.Close;
  PagUsuarios.Close;
  PagConsultas.Close;
  PagRelatorios.Close;
end;

procedure TFormLogin.pnlProcedimentosMouseEnter(Sender: TObject);
begin
  pnlProcedimentos.Color := $00F78B2B;
  Shape3.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlProcedimentosMouseLeave(Sender: TObject);
begin
  pnlProcedimentos.Color := $007C3E05;
  Shape3.Brush.Color := $007C3E05;
end;

procedure TFormLogin.pnlProfissionaisClick(Sender: TObject);
begin
  PagProfissionais.Show;
  PagPacientes.Close;
  PagUsuarios.Close;
  PagRelatorios.Close;
  PagConsultas.Close;
  PagProcedimentos.Close;
end;

procedure TFormLogin.pnlProfissionaisMouseEnter(Sender: TObject);
begin
  pnlProfissionais.Color := $00F78B2B;
  Shape5.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlProfissionaisMouseLeave(Sender: TObject);
begin
  pnlProfissionais.Color := $007C3E05;
  Shape5.Brush.Color := $007C3E05;
end;

procedure TFormLogin.pnlRelatoriosMouseEnter(Sender: TObject);
begin
  pnlRelatorios.Color := $00F78B2B;
  Shape2.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlRelatoriosMouseLeave(Sender: TObject);
begin
  pnlRelatorios.Color := $007C3E05;
  Shape2.Brush.Color := $007C3E05;
end;

procedure TFormLogin.pnlUserClick(Sender: TObject);
begin
  PagUsuarios.Show;
  PagPacientes.Close;
  PagProfissionais.Close;
  PagRelatorios.Close;
  PagConsultas.Close;
  PagProcedimentos.Close;
end;

procedure TFormLogin.pnlUserMouseEnter(Sender: TObject);
begin
  pnlUser.Color := $00F78B2B;
  Shape7.Brush.Color := $00F78B2B;
end;

procedure TFormLogin.pnlUserMouseLeave(Sender: TObject);
begin
  pnlUser.Color := $007C3E05;
  Shape7.Brush.Color := $007C3E05;
end;

procedure TFormLogin.Timer1Timer(Sender: TObject);
begin
  lblDataHora.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

procedure TFormLogin.btnEncerrarSistemaClick(Sender: TObject);
begin
  ShowMessage('Encerrando sistema');
  Sleep(800);
  Close;
end;

end.
