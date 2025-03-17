unit UCriptografia;

interface

type
  TCriptografia = class
  public
    class function Embaralha(const pSenha: String): String;
  end;

implementation

uses
  System.SysUtils, System.Hash;

{ TCriptografia }

class function TCriptografia.Embaralha(const pSenha: String): String;
var
  i: Integer;
  resultado: String;
begin
  // Criptografa em SHA256
  resultado := THashSHA2.GetHashString(pSenha, SHA256);
  Result := resultado;
end;

end.
