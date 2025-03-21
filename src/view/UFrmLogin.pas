unit UFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmLogin = class(TForm)
    pnlMain: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FAutenticado: Boolean;
    FIdUsuario: Integer;
    FNomeUsuario: String;
  public
    { Public declarations }
    property Autenticado: Boolean read FAutenticado;
    property IdUsuario: Integer read FIdUsuario;
    property NomeUsuario: String read FNomeUsuario;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
  UUsuarioDAO;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  FAutenticado := False;
  ModalResult := mrCancel;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var
  s: String;
  mensagemErro: String;
  id: Integer;
begin
  if (edtUsuario.Text = '') or (edtSenha.Text = '') then
  begin
    ShowMessage('Por favor, preencha todos os campos.');
    Exit;
  end;

  s := 'SELECT COUNT(*) FROM tb_usuario WHERE ';

  // Trata o input
  if TryStrToInt(edtUsuario.Text, id) then
    s := s + 'id = ' + edtUsuario.Text
  else
    s := s + 'nome = ''' + edtUsuario.Text + '''';

  s := s + ' AND senha = (SELECT embaralha(''' + edtSenha.Text + ''') FROM dual)';

  // Vai no DAO para autenticar
  if TUsuarioDAO.Autenticar(edtUsuario.Text, edtSenha.Text, mensagemErro) then
  begin
    FAutenticado := True;
    ModalResult := mrOk;
  end
  else
  begin
    ShowMessage('Falha na autenticação: ' + mensagemErro);
    edtSenha.SetFocus;
    edtSenha.SelectAll;
  end;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FAutenticado := False;
  edtSenha.PasswordChar := '*';
end;

end.
