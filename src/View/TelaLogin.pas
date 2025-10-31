unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, System.ImageList,
        Vcl.ImgList,TelaUsuarios,uUsuarios,uUsuariosController,TelaPacientes,
        TelaProfissionais,TelaProcedimentos,TelaConsultas, uUsuariosControllerLog;

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
        lblBemVindo: TLabel;
        Timer1: TTimer;
        Bevel6: TBevel;
        Bevel5: TBevel;
        Bevel7: TBevel;
        lblDataHora: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
        procedure FormCreate(Sender: TObject);
        procedure btnEntrarMouseEnter(Sender: TObject);
        procedure btnEntrarMouseLeave(Sender: TObject);
        procedure btnEncerrarSistemaClick(Sender: TObject);
        procedure edUsuarioKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
        procedure edSenhaKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
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
    if (edUsuario.Text = '') or (edSenha.Text = '') then
    begin
      ShowMessage('Preencha todos os campos');
      edUsuario.SetFocus;
      Exit;
    end;

    Usuario := UserController.VerificarUsuario(edUsuario.Text, edSenha.Text, Msg);

    // 🔹 Aqui o teste que evita o Access Violation
    if Usuario = nil then
    begin
      ShowMessage(Msg);
      Exit;
    end;

    if Usuario.Grupo = 'Administrador' then
    begin
      Sleep(300);
      pnlLogin.Visible := False;
      pnlTelaPrincipal.Visible := True;
      pnlFundoLateral.Visible := True;
      lblBemVindo.Caption := 'Bem-vindo, ' + Usuario.Nome + '!';
    end else if Usuario.Grupo = 'Recepcionista' then begin
      pnlPacientes.Visible := True;
      pnlPacientes.Top := 2;
      pnlConsultas.Visible := True;
      pnlConsultas.Top := 80;
      pnlRelatorios.Visible := True;
      pnlRelatorios.Top := 160;
      pnlEncerrarSistema.Visible := True;
      pnlEncerrarSistema.Top := 240;
      pnlUser.Visible := False;
      pnlProfissionais.Visible := False;
      pnlProcedimentos.Visible := False;
      lblBemVindo.Caption := 'Bem-vindo, ' + Usuario.Nome + '!';
    end
    else if Usuario.Grupo = 'Profissional' then
    begin
      pnlRelatorios.Visible := True;
      pnlRelatorios.Top := 80;
      pnlConsultas.Visible := True;
      pnlConsultas.Top := 2;
      pnlEncerrarSistema.Visible := True;
      pnlEncerrarSistema.Top := 160;
      pnlUser.Visible := False;
      pnlPacientes.Visible := False;
      pnlProfissionais.Visible := False;
      pnlProcedimentos.Visible := False;
      lblBemVindo.Caption := 'Bem-vindo, ' + Usuario.Nome + '!';
    end else
      Sleep(300);
      pnlLogin.Visible := False;
      pnlTelaPrincipal.Visible := True;
      pnlFundoLateral.Visible := True;
      lblBemVindo.Caption := 'Bem-vindo, ' + Usuario.Nome + '!';
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

procedure TFormLogin.edUsuarioKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      Key := 0;
      edSenha.SetFocus;
    end;
  end;

procedure TFormLogin.edSenhaKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
  begin
    if Key = VK_RETURN then begin
      Key := 0;
      btnEntrarClick(nil);
    end;
  end;

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    lblLogin.font.Color := $00C97D16;
  end;

procedure TFormLogin.ImgOlhoAbertoClick(Sender: TObject);
  begin
    edSenha.PasswordChar := '*';
    imgOlhoFechado.Visible := True;
    imgOlhoAberto.Visible := False;
  end;

procedure TFormLogin.ImgOlhoFechadoClick(Sender: TObject);
  begin
    edSenha.PasswordChar := #0;
    imgOlhoAberto.Visible := True;
    imgOlhoFechado.Visible := False;
  end;

procedure TFormLogin.pnlConsultasClick(Sender: TObject);
  begin
    PagConsultas.Show;
  end;

procedure TFormLogin.pnlConsultasMouseEnter(Sender: TObject);
  begin
    pnlConsultas.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
  end;

procedure TFormLogin.pnlEncerrarSistemaClick(Sender: TObject);
  begin
  if MessageDlg('Deseja Encerrar o Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    Sleep(500);
    Close;
  end
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
    PagProfissionais.close;
  end;

procedure TFormLogin.pnlPacientesMouseEnter(Sender: TObject);
  begin
    pnlPacientes.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;

procedure TFormLogin.pnlProcedimentosClick(Sender: TObject);
  begin
    PagProcedimentos.Show;
    PagProfissionais.Close;
    PagPacientes.Close;
    PagUsuarios.close;
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
    PagUsuarios.close;
  end;

procedure TFormLogin.pnlProfissionaisMouseEnter(Sender: TObject);
  begin
    pnlProfissionais.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlProfissionaisMouseLeave(Sender: TObject);
  begin
    pnlProfissionais.Color := $007C3E05;
  end;

procedure TFormLogin.pnlRelatoriosMouseEnter(Sender: TObject);
  begin
    pnlRelatorios.Color := $00F78B2B;
    Shape2.Brush.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlRelatoriosMouseLeave(Sender: TObject);
  begin
    pnlRelatorios.Color := $007C3E05;
    Shape2.Brush.Color  := $007C3E05;
  end;

procedure TFormLogin.pnlUserClick(Sender: TObject);
  begin
    PagUsuarios.Show;
    PagPacientes.Close;
    PagProfissionais.Close;
  end;

procedure TFormLogin.pnlUserMouseEnter(Sender: TObject);
  begin
    pnlUser.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlUserMouseLeave(Sender: TObject);
  begin
    pnlUser.Color := $007C3E05;
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
