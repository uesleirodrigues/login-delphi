program Interfac;

uses
  Vcl.Forms,
  UUsuario in 'src\model\UUsuario.pas',
  UCriptografia in 'src\utils\UCriptografia.pas',
  UUsuarioDAO in 'src\dao\UUsuarioDAO.pas',
  UDM in 'UDM.pas' {DM: TDataModule},
  UFrmLogin in 'src\view\UFrmLogin.pas' {FrmLogin},
  uFrmPrincipal in 'uFrmPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
