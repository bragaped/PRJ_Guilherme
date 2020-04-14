unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery, IniFiles;

type
  TfrmLogin = class(TForm)
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    edtuser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitSairClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bitOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uDMSYS, uUsuario, uPrincipal, uINI, uUtil;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
var  config: TIniFile;
     Result: String;
begin
 dmSYS.ibtEstoque.Active := False;
 dmSYS.ibdEstoque.Close;
 config := TIniFile.Create(ExtractFilePath(Application.ExeName)+'CONFIG.INI');
 Result := config.ReadString('ALIAS','Server','')+':'
           +config.ReadString('ALIAS','DataBase','');
 dmSYS.ibdEstoque.DatabaseName := Result;
 config.Free;
 if (dmSYS.ibdEstoque.DatabaseName = '') then
  Begin
   MessageDlg('Banco de Dados Não Encontrado, O Sistema Será Finalizado!',mtError,[mbOK],0);
   frmLogin.Close;
   frmLogin.Free;
  end
 else
  Begin
   dmSYS.ibdEstoque.Open;
   dmSYS.ibtEstoque.Active := True;
   dmSYS.qryUsuario.Open;
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmINI.TimerPerc.Enabled := True;
 Action := caFree;
end;

procedure TfrmLogin.bitSairClick(Sender: TObject);
begin
 dmSYS.Destroy;
 Close;
 Application.Terminate;
end;

procedure TfrmLogin.FormDeactivate(Sender: TObject);
begin
 frmLogin.FreeOnRelease;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Begin
      Perform(WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    End;
  if Key = #27 then
    Perform(WM_NEXTDLGCTL, 1, 0);
  if Key = #17 then
   begin
    Abort;
    Key := #0;
   end;
end;

procedure TfrmLogin.bitOKClick(Sender: TObject);
var qryLogin :TIBQuery;
begin
 if (edtuser.Text <> '') then
  begin
   qryLogin := TIBQuery.Create(Self);
   qryLogin.Database := dmSYS.ibdEstoque;
   qrylogin.Close;
   qryLogin.SQL.Add('select NOME, SENHA, USE_COD from USUARIO');
   qryLogin.SQL.Add('where NOME = :Usuario');
   qryLogin.Prepare;
   qrylogin.ParamByName('Usuario').AsString := UpperCase(edtuser.Text);
   qrylogin.Open;
   if qrylogin.IsEmpty then
     begin
      MessageDlg('Usúario Invalido!',mtWarning,[mbOK],0);
      edtuser.SetFocus;
     end
   else
    begin
     if not(qrylogin.FieldByName('SENHA').AsString = //edtSenha.Text) then
            uUtil.Criptografia(edtSenha.Text,UpperCase(edtuser.Text))) then
      begin
       MessageDlg('Senha Invalida!',mtWarning,[mbOK],0);
       edtSenha.SetFocus;
      end
     else
      begin
       frmLogin.Release;
       uUtil.CodUse := qryLogin.FieldByName('USE_COD').AsInteger;
       uUtil.Usuario := qryLogin.FieldByName('NOME').AsString;
       //frmPrincipal.Show;
       close;
      end;
    end;
  end
 else
  begin
   MessageDlg('Usuario Invalido!',mtWarning,[mbOK],0);
   edtuser.SetFocus;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
 Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.
