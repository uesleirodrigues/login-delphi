unit UUsuario;

interface

type
  TUsuario = class
  private
    FId: Integer;
    FNome: String;
    FSenha: String;
  public
    property Id: Integer read FId write FId;
    property Nome: String read FNome write FNome;
    property Senha: String read FSenha write FSenha;
    function Autenticar(const pSenha: String): Boolean;
    class function GetById(const pId: Integer): TUsuario;
    class function GetByNome(const pNome: String): TUsuario;
  end;

implementation

uses
  UCriptografia, UUsuarioDAO;

{ TUsuario }

function TUsuario.Autenticar(const pSenha: String): Boolean;
begin
  Result := FSenha = TCriptografia.Embaralha(pSenha);
end;

class function TUsuario.GetById(const pId: Integer): TUsuario;
begin
  Result := TUsuarioDAO.GetById(pId);
end;

class function TUsuario.GetByNome(const pNome: String): TUsuario;
begin
  Result := TUsuarioDAO.GetByNome(pNome);
end;

end.
