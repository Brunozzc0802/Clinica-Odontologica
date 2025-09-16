unit TelaLogin;

interface

uses
        Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
        System.Classes, Vcl.Graphics,
        Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
        Vcl.Imaging.pngimage,
        Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Buttons, System.ImageList,
        Vcl.ImgList,uConexao,TelaUsuarios;

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
        btnEntrar: TPanel;
        lblEntrar: TLabel;
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
    end;
  end;

procedure TFormLogin.FormCreate(Sender: TObject);
  begin
    pnlFundoLateral.Visible := False;
    ImgOlhoAberto.Visible := False;
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
     if MessageDlg('Deseja Encerrar o Sistema', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShowMessage('Encerrando Sistema');
    Sleep(500);
    Close;
  end else
  begin
    showMessage('O sistema continuará aberto');
  end;
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
    PagUsuarios.Show;
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
