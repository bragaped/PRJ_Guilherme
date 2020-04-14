program Cobranca;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDMSYS in 'uDMSYS.pas' {dmSYS: TDataModule},
  uPadrao in 'uPadrao.pas' {frmPadrao},
  uCob in 'uCob.pas' {frmCob},
  uUsuario in 'uUsuario.pas' {frmUsuario},
  uLogin in 'uLogin.pas' {frmLogin},
  uUtil in 'uUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Cobança';
  Application.CreateForm(TdmSYS, dmSYS);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
