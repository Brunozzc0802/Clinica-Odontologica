unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls, Vcl.Imaging.jpeg,uControllerUsuarios,uUsuario;

type
        TFormLogin = class(TForm)
        pnlLogin: TPanel;
        edUsuario: TEdit;
        pnlTelaPrincipal: TPanel;
        linhaUsuarios: TLabel;
        pnlFormLogin: TPanel;
        imgFundo: TImage;
        pnlAzul: TPanel;
        logo: TImage;
        lblRealizeSeu: TLabel;
        edSenha: TEdit;
        cbSalvarCredenciais: TCheckBox;
        pnlAzulPrincipal: TPanel;
        imgLogoPrincipal: TImage;
        pnlFundoLateral: TPanel;
        lblLogin: TLabel;
        linhaPacientes: TLabel;
        linhaProfissionais: TLabel;
        linhaConsultas: TLabel;
        linhaProcedimentos: TLabel;
        linhaRelatorios: TLabel;
        linhaFinal: TLabel;
        btnEncerrarSistema: TImage;
        btnEntrar: TPanel;
        btnUsuarios: TImage;
        pnlCadastro: TPanel;
        imgfundoformCadastro: TImage;
        pnlFormCadastro: TPanel;
        lblcadastro: TLabel;
        lblCadastroForm: TLabel;
        edUsuarioCadastro: TEdit;
        edSenhaCadastro: TEdit;
        pnlAzulCadastro: TPanel;
        imgLogoCadastro: TImage;
        edEmailCadastro: TEdit;
        edCpfCadastro: TEdit;
        lblNTemLogin: TLabel;
        lblCadastrarLog: TLabel;
        lblJaTemLoginFCadastro: TLabel;
        lblEntrarFCadastro: TLabel;
    btnCadastrar: TPanel;
        procedure btnEntrarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure btnEntrarMouseEnter(Sender: TObject);
        procedure btnEntrarMouseLeave(Sender: TObject);
        procedure btnEncerrarSistemaClick(Sender: TObject);
        procedure lblCadastrarLogMouseEnter(Sender: TObject);
        procedure lblCadastrarLogMouseLeave(Sender: TObject);
        procedure lblCadastrarLogClick(Sender: TObject);
        procedure btnCadastrarMouseEnter(Sender: TObject);
        procedure btnCadastrarMouseLeave(Sender: TObject);
        procedure lblEntrarFCadastroMouseEnter(Sender: TObject);
        procedure lblEntrarFCadastroMouseLeave(Sender: TObject);
        procedure lblEntrarFCadastroClick(Sender: TObject);
        procedure btnCadastrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
   FormLogin: TFormLogin;

implementation

{$R *.dfm}


//criação do form
procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    lblEntrarFCadastro.Font.Color := $00C97D16;
    lblCadastroForm.Font.Color := $00C97D16;
    lblCadastrarLog.Font.Color := $00C97D16;
    lblLogin.font.Color := $00C97D16;
    pnlTelaPrincipal.Visible := False;
    pnlCadastro.Visible := False;
  end;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
    begin
  if Key = #13 then begin
    Key := #0;
    SelectNext(ActiveControl, True, True);
  end;
end;

//codigos de login
procedure TFormLogin.btnEntrarClick(Sender: TObject);
  var
  Controller: TUsuarioController;
  Usuario: TUsuario;
  begin
    Controller := TUsuarioController.Create(nil);
  try
    Usuario := Controller.ValidarLogin(edUsuario.Text, edSenha.Text);
    if Assigned(Usuario) then
    begin
      ShowMessage('Login efetuado com sucesso! Bem-vindo, ' + Usuario.Nome);
      Usuario.Free;
    end
    else
      ShowMessage('Usuário ou senha incorretos!');
  finally
    Controller.Free;
  end;
  end;


procedure TFormLogin.btnEntrarMouseEnter(Sender: TObject);
  begin
    btnEntrar.Color := $00C87C15;
  end;

procedure TFormLogin.btnEntrarMouseLeave(Sender: TObject);
  begin
    btnEntrar.Color := $00DB8817;
  end;

procedure TFormLogin.lblCadastrarLogClick(Sender: TObject);
  begin
    pnlLogin.Visible := false;
    pnlTelaPrincipal.Visible := false;
    pnlCadastro.Visible := True;
  end;

procedure TFormLogin.lblCadastrarLogMouseEnter(Sender: TObject);
  begin
     lblCadastrarLog.Font.Color := $00965C10;
  end;

procedure TFormLogin.lblCadastrarLogMouseLeave(Sender: TObject);
  begin
    lblCadastrarLog.Font.Color := $00C97D16;
  end;

procedure TFormLogin.lblEntrarFCadastroClick(Sender: TObject);
  begin
    pnlLogin.Visible := true;
    pnlCadastro.Visible := false;
  end;

//Codigos de form cadastro

procedure TFormLogin.lblEntrarFCadastroMouseEnter(Sender: TObject);
  begin
    lblEntrarFCadastro.Font.Color := $00965C10;
  end;

procedure TFormLogin.lblEntrarFCadastroMouseLeave(Sender: TObject);
  begin
    lblEntrarFCadastro.Font.Color := $00C97D16;
  end;

procedure TFormLogin.btnCadastrarClick(Sender: TObject);
  begin
    if (edUsuarioCadastro.Text = '') or (edSenhaCadastro.Text = '') or (edEmailCadastro.Text = '') or (edCpfCadastro.Text = '')
      then begin
        ShowMessage('Preencha todos os campos');
        exit;
      end else
        ShowMessage('Cadastro concluido com sucesso');
        pnlCadastro.Visible := false;
        pnlLogin.Visible := True;
  end;

procedure TFormLogin.btnCadastrarMouseEnter(Sender: TObject);
  begin
    btnCadastrar.Color := $00C87C15;
  end;

procedure TFormLogin.btnCadastrarMouseLeave(Sender: TObject);
  begin
    btnCadastrar.Color := $00DB8817;
  end;
// codigos da tela principal

procedure TFormLogin.btnEncerrarSistemaClick(Sender: TObject);
  begin
    Close;
  end;

end.
