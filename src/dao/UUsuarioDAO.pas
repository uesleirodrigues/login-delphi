unit UUsuarioDAO;

interface

uses
  UUsuario, System.SysUtils, FireDAC.Comp.Client, Data.DB;

type
  TUsuarioDAO = class
  public
    class function GetById(const pId: Integer): TUsuario;
    class function GetByNome(const pNome: String): TUsuario;
    class function Autenticar(const pIdentificacao: String; const pSenha: String; out pMensagemErro: String): Boolean;
  end;

implementation

uses
  UCriptografia, UDM;

{ TUsuarioDAO }

class function TUsuarioDAO.Autenticar(const pIdentificacao: String; const pSenha: String; out pMensagemErro: String): Boolean;
var
  SQL: String;
  usuario: TUsuario;
  id: Integer;
begin
  Result := False;
  pMensagemErro := '';

  // Trata o input de usu�rio
  if TryStrToInt(pIdentificacao, id) then
    usuario := GetById(StrToInt(pIdentificacao))
  else
    usuario := GetByNome(pIdentificacao);

  if not Assigned(usuario) then
  begin
    pMensagemErro := 'Usu�rio n�o encontrado';
    Exit;
  end;

  Result := usuario.Autenticar(pSenha);
  if not Result then
    pMensagemErro := 'Senha incorreta';

  usuario.Free;
end;

class function TUsuarioDAO.GetById(const pId: Integer): TUsuario;
var
  qry: TFDQuery;
  SQL: String;
begin
  Result := nil;
  SQL := 'SELECT id, nome, senha FROM tb_usuario WHERE id = :id';

  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.Connection;
    qry.SQL.Text := SQL;
    qry.ParamByName('id').AsInteger := pId;
    qry.Open;

    if not qry.IsEmpty then
    begin
      Result := TUsuario.Create;
      Result.Id := qry.FieldByName('id').AsInteger;
      Result.Nome := qry.FieldByName('nome').AsString;
      Result.Senha := qry.FieldByName('senha').AsString;
    end;
  finally
    qry.Free;
  end;
end;

class function TUsuarioDAO.GetByNome(const pNome: String): TUsuario;
var
  qry: TFDQuery;
  SQL: String;
begin
  Result := nil;
  SQL := 'SELECT id, nome, senha FROM tb_usuario WHERE nome = :nome';

  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.Connection;
    qry.SQL.Text := SQL;
    qry.ParamByName('nome').AsString := pNome;
    qry.Open;

    if not qry.IsEmpty then
    begin
      Result := TUsuario.Create;
      Result.Id := qry.FieldByName('id').AsInteger;
      Result.Nome := qry.FieldByName('nome').AsString;
      Result.Senha := qry.FieldByName('senha').AsString;
    end;
  finally
    qry.Free;
  end;
end;

end.
