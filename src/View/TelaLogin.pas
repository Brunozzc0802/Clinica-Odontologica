unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, System.ImageList,
        Vcl.ImgList,uConexao, TelaUsuarios;

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
        lblUsuarios: TLabel;
        pnlUser: TPanel;
        pnlPacientes: TPanel;
        ImgPacientes: TImage;
        lblPacientes: TLabel;
        pnlProfissionais: TPanel;
        iconProfissionais: TImage;
        lblProfissionais: TLabel;
        pnlConsultas: TPanel;
        lblConsultas: TLabel;
        pnlProcedimentos: TPanel;
        imgProcedimentos: TImage;
        lblProcedimentos: TLabel;
        pnlEncerrarSistema: TPanel;
        imgSair: TImage;
        lblEncerrarSistema: TLabel;
        pnlRelatorios: TPanel;
        ImgRelatorios: TImage;
        lblRelatorios: TLabel;
    imgConsultas: TImage;
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
        procedure lblPacientesMouseEnter(Sender: TObject);
        procedure lblPacientesMouseLeave(Sender: TObject);
        procedure lblProfissionaisMouseEnter(Sender: TObject);
        procedure lblProfissionaisMouseLeave(Sender: TObject);
        procedure iconUserMouseEnter(Sender: TObject);
        procedure iconUserMouseLeave(Sender: TObject);
        procedure lblUsuariosMouseEnter(Sender: TObject);
        procedure lblUsuariosMouseLeave(Sender: TObject);
        procedure ImgPacientesMouseEnter(Sender: TObject);
        procedure ImgPacientesMouseLeave(Sender: TObject);
        procedure iconProfissionaisMouseEnter(Sender: TObject);
        procedure iconProfissionaisMouseLeave(Sender: TObject);
        procedure imgConsultasMouseEnter(Sender: TObject);
        procedure imgConsultasMouseLeave(Sender: TObject);
        procedure lblConsultasMouseEnter(Sender: TObject);
        procedure lblConsultasMouseLeave(Sender: TObject);
        procedure imgProcedimentosMouseEnter(Sender: TObject);
        procedure imgProcedimentosMouseLeave(Sender: TObject);
        procedure lblProcedimentosMouseEnter(Sender: TObject);
        procedure lblProcedimentosMouseLeave(Sender: TObject);
        procedure ImgRelatoriosMouseEnter(Sender: TObject);
        procedure ImgRelatoriosMouseLeave(Sender: TObject);
        procedure lblRelatoriosMouseEnter(Sender: TObject);
        procedure lblRelatoriosMouseLeave(Sender: TObject);
        procedure imgSairMouseEnter(Sender: TObject);
        procedure imgSairMouseLeave(Sender: TObject);
        procedure lblEncerrarSistemaMouseEnter(Sender: TObject);
        procedure lblEncerrarSistemaMouseLeave(Sender: TObject);
        procedure pnlUserClick(Sender: TObject);
    procedure lblUsuariosClick(Sender: TObject);
    procedure iconUserClick(Sender: TObject);


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
    btnEntrar.brush.Color := $00C27814;
  end;

procedure TFormLogin.btnEntrarMouseLeave(Sender: TObject);
  begin
    btnEntrar.brush.Color := $00DB8817;
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
    end;
  end;

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
//    ImgOlhoAberto.Visible := false;
//    lblLogin.font.Color := $00C97D16;
//    pnlTelaPrincipal.Visible := False;
  end;

procedure TFormLogin.iconProfissionaisMouseEnter(Sender: TObject);
  begin
    pnlProfissionais.Color := $00F78B2B;
  end;

procedure TFormLogin.iconProfissionaisMouseLeave(Sender: TObject);
  begin
    pnlProfissionais.Color := $007C3E05;
  end;

procedure TFormLogin.iconUserClick(Sender: TObject);
  begin
    PagUsuarios.ShowModal;
  end;

procedure TFormLogin.iconUserMouseEnter(Sender: TObject);
  begin
    pnlUser.Color := $00F78B2B;
  end;

procedure TFormLogin.iconUserMouseLeave(Sender: TObject);
  begin
    pnlUser.color := $007C3E05;
  end;

procedure TFormLogin.imgConsultasMouseEnter(Sender: TObject);
  begin
    pnlConsultas.Color := $00F78B2B;
  end;

procedure TFormLogin.imgConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
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


procedure TFormLogin.ImgPacientesMouseEnter(Sender: TObject);
  begin
    pnlPacientes.Color := $00F78B2B;
  end;

procedure TFormLogin.ImgPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;

procedure TFormLogin.imgProcedimentosMouseEnter(Sender: TObject);
  begin
    pnlProcedimentos.Color := $00F78B2B;
  end;

procedure TFormLogin.imgProcedimentosMouseLeave(Sender: TObject);
  begin
    pnlProcedimentos.Color := $007C3E05;
  end;

procedure TFormLogin.ImgRelatoriosMouseEnter(Sender: TObject);
  begin
    pnlRelatorios.Color := $00F78B2B;
  end;

procedure TFormLogin.ImgRelatoriosMouseLeave(Sender: TObject);
  begin
    pnlRelatorios.Color := $007C3E05;
  end;

procedure TFormLogin.imgSairMouseEnter(Sender: TObject);
  begin
    pnlEncerrarSistema.Color := $00F78B2B;
  end;

procedure TFormLogin.imgSairMouseLeave(Sender: TObject);
  begin
    pnlEncerrarSistema.Color := $007C3E05;
  end;

procedure TFormLogin.lblConsultasMouseEnter(Sender: TObject);
  begin
    pnlConsultas.Color := $00F78B2B;
  end;

procedure TFormLogin.lblConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
  end;

procedure TFormLogin.lblEncerrarSistemaMouseEnter(Sender: TObject);
  begin
    pnlEncerrarSistema.Color := $00F78B2B;
  end;

procedure TFormLogin.lblEncerrarSistemaMouseLeave(Sender: TObject);
  begin
    pnlEncerrarSistema.Color := $007C3E05;
  end;

procedure TFormLogin.lblPacientesMouseEnter(Sender: TObject);
  begin
     pnlPacientes.Color := $00F78B2B;
  end;

procedure TFormLogin.lblPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;

procedure TFormLogin.lblProcedimentosMouseEnter(Sender: TObject);
  begin
    pnlProcedimentos.Color := $00F78B2B;
  end;

procedure TFormLogin.lblProcedimentosMouseLeave(Sender: TObject);
  begin
    pnlProcedimentos.Color := $007C3E05;
  end;

procedure TFormLogin.lblProfissionaisMouseEnter(Sender: TObject);
  begin
     pnlProfissionais.Color := $00F78B2B;
  end;

procedure TFormLogin.lblProfissionaisMouseLeave(Sender: TObject);
  begin
    pnlProfissionais.Color := $007C3E05;
  end;


procedure TFormLogin.lblRelatoriosMouseEnter(Sender: TObject);
  begin
    pnlRelatorios.Color := $00F78B2B;
  end;

procedure TFormLogin.lblRelatoriosMouseLeave(Sender: TObject);
  begin
    pnlRelatorios.Color := $007C3E05;
  end;

procedure TFormLogin.lblUsuariosClick(Sender: TObject);
  begin
    PagUsuarios.ShowModal;
  end;

procedure TFormLogin.lblUsuariosMouseEnter(Sender: TObject);
  begin
    PnlUser.Color := $00F78B2B;
  end;

procedure TFormLogin.lblUsuariosMouseLeave(Sender: TObject);
  begin
    PnlUser.Color := $007C3E05;
  end;

procedure TFormLogin.pnlConsultasMouseEnter(Sender: TObject);
  begin
    pnlConsultas.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlConsultasMouseLeave(Sender: TObject);
  begin
    pnlConsultas.Color := $007C3E05;
  end;

procedure TFormLogin.pnlEncerrarSistemaMouseEnter(Sender: TObject);
  begin
    pnlEncerrarSistema.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlEncerrarSistemaMouseLeave(Sender: TObject);
  begin
    pnlEncerrarSistema.Color := $007C3E05;
  end;

procedure TFormLogin.pnlPacientesMouseEnter(Sender: TObject);
  begin
    pnlPacientes.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlPacientesMouseLeave(Sender: TObject);
  begin
    pnlPacientes.Color := $007C3E05;
  end;

procedure TFormLogin.pnlProcedimentosMouseEnter(Sender: TObject);
  begin
    pnlProcedimentos.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlProcedimentosMouseLeave(Sender: TObject);
  begin
    pnlProcedimentos.Color := $007C3E05;
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
  end;

procedure TFormLogin.pnlRelatoriosMouseLeave(Sender: TObject);
  begin
    pnlRelatorios.Color := $007C3E05;
  end;

procedure TFormLogin.pnlUserClick(Sender: TObject);
  begin
    PagUsuarios.ShowModal;
  end;

procedure TFormLogin.pnlUserMouseEnter(Sender: TObject);
  begin
    pnlUser.Color := $00F78B2B;
  end;

procedure TFormLogin.pnlUserMouseLeave(Sender: TObject);
  begin
    pnlUser.Color := $007C3E05;
  end;

procedure TFormLogin.btnEncerrarSistemaClick(Sender: TObject);
  begin
    ShowMessage('Encerrando sistema');
    Sleep(800);
    Close;
  end;

end.
