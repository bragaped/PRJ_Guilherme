unit uTrocaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBQuery;

type
  TfrmTrocaSenha = class(TForm)
    edtSenhaAtual: TEdit;
    edtNovaSenha: TEdit;
    edtConfNovaSenha: TEdit;
    bitOK: TBitBtn;
    bitCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure bitOKClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrocaSenha: TfrmTrocaSenha;

implementation

uses uUtil, uDMSYS;

{$R *.dfm}

procedure TfrmTrocaSenha.bitOKClick(Sender: TObject);
begin
 dmSYS.qryUsuario.Close;
 dmSYS.qryUsuario.SQL.Clear;
 dmSYS.qryUsuario.SQL.Add('Select * from Usuario');
 dmSYS.qryUsuario.SQL.Add('Where USE_COD = :cod');
 dmSYS.qryUsuario.Prepare;
 dmSYS.qryUsuario.ParamByName('cod').AsInteger := uUtil.CodUse;
 dmSYS.qryUsuario.Open;
 if not(dmSYS.qryUsuario.IsEmpty) then
  begin
   //validar se a senha atual esta correta
   if (dmSYS.qryUsuario.FieldByName('SENHA').AsString =
                Criptografia(edtSenhaAtual.Text,
                             dmSYS.qryUsuario.FieldByName('Nome').AsString)) then
    begin

     //verifica se a novas senhas conferem
     if (edtNovaSenha.Text = edtConfNovaSenha.Text) then
      begin
       //aktera a senha no banco de dados
       dmSYS.qryUsuario.Edit;
       dmSYS.qryUsuario.FieldByName('SENHA').AsString :=
                      Criptografia(edtNovaSenha.Text,
                                   dmSYS.qryUsuario.FieldByName('Nome').AsString);
       dmSYS.qryUsuario.Post;
       close;
       exit;
      end
     else
      begin
       //nova senha incorreta obrigar redigitação
       ShowMessage('Nova Senha Inválida!');
       edtNovaSenha.Clear;
       edtNovaSenha.SetFocus;
       edtConfNovaSenha.Clear;
       exit;
      end;
    end
   else
    begin
     //senha atual invalida obrigar redigitar
     ShowMessage('Senha Atual Inválida!');
     edtSenhaAtual.Clear;
     edtSenhaAtual.SetFocus;
     exit;
    end;
  end
 else
  begin
   ShowMessage('Usúario não Cadastrado!');
   Beep;
   Close;
  end;
end;

procedure TfrmTrocaSenha.bitCancelarClick(Sender: TObject);
begin
 close;
end;

procedure TfrmTrocaSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmSYS.qryUsuario.Close;
 dmSYS.qryUsuario.SQL.Clear;
 dmSYS.qryUsuario.SQL.Add('Select * from Usuario');
 dmSYS.qryUsuario.Open;
 Action := caFree;
end;

procedure TfrmTrocaSenha.FormDeactivate(Sender: TObject);
begin
 frmTrocaSenha.FreeOnRelease;
end;

end.
