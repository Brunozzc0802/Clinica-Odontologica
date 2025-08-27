unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls;

type
        TFormLogin = class(TForm)
        pnlLogin: TPanel;
        imgLogin: TImage;
        edUsuario: TEdit;
        edSenha: TEdit;
        btnEntrar: TImage;
        imgLogo: TImage;
        pnlTelaPrincipal: TPanel;
    imgLogoFundo: TImage;
        FundoLateral: TImage;
        btnUsuarios: TImage;
        linhaUsuarios: TLabel;
    btnPacientes: TImage;
        linhaPacientes: TLabel;
    btnProfissionais: TImage;
        linhaProfissionais: TLabel;
    btnConsultas: TImage;
        linhaConsultas: TLabel;
        procedure btnEntrarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
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
procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    pnlTelaPrincipal.Visible := False;
  end;

end.
