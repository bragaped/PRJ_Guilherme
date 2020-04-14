unit uUtil;

interface

  function Criptografia(mStr, mChave: string): string;

var
 CodUse  : Integer;
 Usuario, Foto : String;
 ConsCategoria, ConsProduto, CadMov : Char;

implementation

uses uDMSYS, uPrincipal;

function Criptografia(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);   //A fun��o Criptografia pode ser usada para criptografar a senha acesso ao sistema.
  for i := 1 to TamanhoString do    //Ela � usada nos dois sentidos, para criptografar e descriptografar,
  begin                             //desde que seja usada a mesma chave nas duas opera��es. "mStr" � a String que vai ser
  pos := (i mod TamanhoChave);      //criptografada e "mChave" � a String que sera usada como base para fazer a criptografia.
  if pos = 0 then
  pos := TamanhoChave;
  posLetra := ord(Result[i]) xor ord(mChave[pos]);
  if posLetra = 0 then
  posLetra := ord(Result[i]);
  Result[i] := chr(posLetra);
  end;
end;

end.
