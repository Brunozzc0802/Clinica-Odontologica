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
    pnlFormLogin: TPanel;
    btnEntrar: TPanel;
    imgFundo: TImage;
    pnlAzul: TPanel;
    logo: TImage;
    lblLogin: TLabel;
    edSenha: TEdit;
    CheckBox1: TCheckBox;
        procedure btnEntrarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    procedure btnEntrarMouseEnter(Sender: TObject);
    procedure btnEntrarMouseLeave(Sender: TObject);
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
         btnEntrar.Color := $00A76812;
  end;

procedure TFormLogin.btnEntrarMouseLeave(Sender: TObject);
  begin
    btnEntrar.Color := $00DB8817;
  end;

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    pnlTelaPrincipal.Visible := False;
  end;

end.
