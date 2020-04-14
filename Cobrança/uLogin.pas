unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBQuery;

type
  TfrmLogin = class(TForm)
    bitOK: TBitBtn;
    bitSair: TBitBtn;
    edtuser: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSenha: TEdit;
    dsLogin: TDataSource;
    qrylogin: TIBQuery;
    qryloginNOME: TIBStringField;
    qryloginSENHA: TIBStringField;
    qryloginUSE_COD: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure bitOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitSairClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses uDMSYS, uUsuario, uPrincipal, uCob, uUtil;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
{var  config: TIniFile;
     Result: String; }
begin
 uUtil.caminho := ExtractFilePath(Application.ExeName);
{begin
    dmSYS.ibtCobranca.Active := False;
    dmSYS.ibdCobranca.Close;
    config := TIniFile.Create(ExtractFilePath(Application.ExeName)+'CONFIG.INI');
    Result := config.ReadString('ALIAS','DataBase','');
    dmSYS.ibdCobranca.DatabaseName := Result;
    config.Free;
    if (dmSYS.ibdCobranca.DatabaseName = '') then
      Begin
        MessageDlg('Banco de Dados Não Encontrado, O Sistema Será Finalizado!',mtError,[mbOK],0);
        frmLogin.Close;
        frmLogin.Free;
      end
      else
       Begin
        dmSYS.ibdCobranca.Open;
        dmSYS.ibtCobranca.Active := True;
        dmSYS.qryUsuario.Open;
       end;
end;}
 dmSYS.ibdCobranca.DatabaseName := uUtil.caminho+'BDCOBRANCA.FDB';
 dmSYS.ibdCobranca.Connected := True;
 if (dmSYS.ibdCobranca.DatabaseName = '') then
  Begin
   MessageDlg('Banco de Dados Não Encontrado, O Sistema Será Finalizado!',mtError,[mbOK],0);
   frmLogin.Close;
   frmLogin.Free;
  end
 else
  Begin
   dmSYS.ibdCobranca.Open;
   dmSYS.ibtCobranca.Active := True;
   dmSYS.qryUsuario.Open;
  end;
end;

procedure TfrmLogin.bitOKClick(Sender: TObject);
begin
 if (edtuser.Text <> '') then
  begin
   qrylogin.Close;
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
     if not(qrylogin.FieldByName('SENHA').AsString =
            frmUsuario.Criptografia(edtSenha.Text,edtuser.Text)) then
      begin
       MessageDlg('Senha Invalida!',mtWarning,[mbOK],0);
       edtSenha.SetFocus;
      end
     else
      begin
       frmLogin.Release;
       uUtil.NOMEUSER:= edtuser.Text;
       uUtil.COD_USER := qrylogin.FieldByName('USE_COD').AsInteger;
       frmPrincipal.Show;
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

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmLogin.bitSairClick(Sender: TObject);
begin
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

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.
