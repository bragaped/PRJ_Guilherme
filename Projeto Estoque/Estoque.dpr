program Estoque;

uses
  Forms,
  SysUtils,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDMSYS in 'uDMSYS.pas' {dmSYS: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  uINI in 'uINI.pas' {frmINI},
  uPadrao in 'uPadrao.pas' {frmPadrao},
  uGrupo in 'uGrupo.pas' {frmGrupo},
  uUsuario in 'uUsuario.pas' {frmUsuario},
  uProduto in 'uProduto.pas' {frmProduto},
  uUtil in 'uUtil.pas',
  uTrocaSenha in 'uTrocaSenha.pas' {frmTrocaSenha},
  uMovimentacao in 'uMovimentacao.pas' {frmMovimentacao};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sistema de Controle de Estoue';
  Application.CreateForm(TdmSYS, dmSYS);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmINI, frmINI);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
