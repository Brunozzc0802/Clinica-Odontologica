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
        private
                { Private declarations }
        public
                { Public declarations }
        end;

var
        FormLogin: TFormLogin;

implementation

{$R *.dfm}

end.
