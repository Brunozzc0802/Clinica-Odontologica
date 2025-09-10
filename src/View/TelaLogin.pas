unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, System.ImageList,
        Vcl.ImgList;

type
        TFormLogin = class(TForm)
        pnlLogin: TPanel;
        pnlTelaPrincipal: TPanel;
        linhaUsuarios: TLabel;
        imgFundo: TImage;
        pnlAzul: TPanel;
        pnlAzulPrincipal: TPanel;
        imgLogoPrincipal: TImage;
        pnlFundoLateral: TPanel;
        linhaPacientes: TLabel;
        linhaProfissionais: TLabel;
        linhaConsultas: TLabel;
        linhaProcedimentos: TLabel;
        linhaRelatorios: TLabel;
        linhaFinal: TLabel;
        btnEncerrarSistema: TImage;
        btnUsuarios: TImage;
        imgLogoLogin: TImage;
        pnlFormLogin: TPanel;
        lblRealizeSeu: TLabel;
        lblLogin: TLabel;
        ShapeNome: TShape;
        ShapeSenha: TShape;
        btnEntrar: TShape;
        lblEntrar: TLabel;
        edUsuario: TEdit;
        edSenha: TEdit;
        bordaDoForm: TPanel;
    ImgOlhoFechado: TImage;
    ImgOlhoAberto: TImage;
        procedure FormCreate(Sender: TObject);
        procedure btnEntrarMouseEnter(Sender: TObject);
        procedure btnEntrarMouseLeave(Sender: TObject);
        procedure btnEncerrarSistemaClick(Sender: TObject);
        procedure edUsuarioKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
        procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
          Shift: TShiftState);
        procedure ValidarLogin;
        procedure btnEntrarMouseUp(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
    procedure ImgOlhoFechadoClick(Sender: TObject);
    procedure ImgOlhoAbertoClick(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
   FormLogin: TFormLogin;

implementation

{$R *.dfm}


procedure TFormLogin.ValidarLogin;
  begin
    if (edUsuario.Text = '') or (edSenha.Text = '') then begin
      ShowMessage('Preencha Todos os campos');
      edUsuario.SetFocus;
    end else if (edUsuario.Text = 'admin') and (edSenha.Text = '1234') then begin
      ShowMessage('Login efetuado com sucesso');
      pnlLogin.Visible := False;
      pnlTelaPrincipal.Visible := True;
  end else begin
      ShowMessage('Usuário ou senha incorretos');
  end;
end;

procedure TFormLogin.btnEntrarMouseEnter(Sender: TObject);
  begin
    btnEntrar.brush.Color := $00C27814;
  end;

procedure TFormLogin.btnEntrarMouseLeave(Sender: TObject);
  begin
    btnEntrar.brush.Color := $00DB8817;
  end;

procedure TFormLogin.btnEntrarMouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
  begin
    ValidarLogin;
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
      ValidarLogin;
    end;
  end;

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    ImgOlhoAberto.Visible := false;
    lblLogin.font.Color := $00C97D16;
    pnlTelaPrincipal.Visible := False;

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

procedure TFormLogin.btnEncerrarSistemaClick(Sender: TObject);
  begin
    ShowMessage('Encerrando sistema');
    Sleep(800);
    Close;
  end;

end.
