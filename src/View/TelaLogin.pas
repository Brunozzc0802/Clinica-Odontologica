unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls, Vcl.Imaging.jpeg;

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
        procedure btnEntrarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure btnEntrarMouseEnter(Sender: TObject);
        procedure btnEntrarMouseLeave(Sender: TObject);
        procedure btnEncerrarSistemaClick(Sender: TObject);
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
  begin
    if (edUsuario.Text = '') or (edSenha.Text = '') then begin
      ShowMessage('Preencha Todos Os Campos');
      pnlTelaPrincipal.Visible := false;
      pnlLogin.Visible := True;
    end else begin
      ShowMessage('Login Efetuado Com Sucesso');
      pnlLogin.Visible := False;
      pnlTelaPrincipal.Visible := True;
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

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    lblLogin.font.Color := $00C97D16;
    pnlTelaPrincipal.Visible := False;

  end;

procedure TFormLogin.btnEncerrarSistemaClick(Sender: TObject);
  begin
    Close;
  end;

end.
