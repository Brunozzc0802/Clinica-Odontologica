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
        lblNtemLogin: TLabel;
        lblCadastrar: TLabel;
        procedure FormCreate(Sender: TObject);
        procedure btnEntrarMouseEnter(Sender: TObject);
        procedure btnEntrarMouseLeave(Sender: TObject);
        procedure btnEncerrarSistemaClick(Sender: TObject);
    procedure lblCadastrarMouseEnter(Sender: TObject);
    procedure lblCadastrarMouseLeave(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
   FormLogin: TFormLogin;

implementation

{$R *.dfm}

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
    lblCadastrar.font.Color := $00B77213;
    lblLogin.font.Color := $00C97D16;
    pnlTelaPrincipal.Visible := False;

  end;

procedure TFormLogin.lblCadastrarMouseEnter(Sender: TObject);
  begin
    lblCadastrar.font.Color := $007E4F0E;
  end;

procedure TFormLogin.lblCadastrarMouseLeave(Sender: TObject);
  begin
    lblCadastrar.font.Color := $00B77213;
  end;

procedure TFormLogin.btnEncerrarSistemaClick(Sender: TObject);
  begin
    Close;
  end;

end.
