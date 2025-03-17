unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UFrmLogin, Vcl.StdCtrls;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.FormCreate(Sender: TObject);
var
  frmLogin: TFrmLogin;
begin
  frmLogin := TFrmLogin.Create(nil);
  try
    if frmLogin.ShowModal <> mrOk then
      Application.Terminate;

    // Se chegou aqui, o login deu certo
    Self.Caption := Self.Caption + ' - Usuário: ' + frmLogin.NomeUsuario;
  finally
    frmLogin.Free;
  end;
end;

end.
