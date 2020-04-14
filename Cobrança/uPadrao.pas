unit uPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, Mask, ImgList,
  ToolWin, Buttons, Menus;

type
  TfrmPadrao = class(TForm)
    tsConsulta: TTabSheet;
    dbgConsulta: TDBGrid;
    tbPrincipal: TToolBar;
    tbPrimeiro: TToolButton;
    tbAnterior: TToolButton;
    tbProximo: TToolButton;
    tbUltimo: TToolButton;
    tbIncluir: TToolButton;
    tbAlterar: TToolButton;
    ToolButton7: TToolButton;
    ilPrincipal: TImageList;
    tbExcluir: TToolButton;
    ToolButton1: TToolButton;
    tbRelatorio: TToolButton;
    tbPesquisa: TToolButton;
    tbSair: TToolButton;
    bitGravar: TBitBtn;
    bitCancelar: TBitBtn;
    tsDados: TTabSheet;
    pgCadastro: TPageControl;
    pnPadrao: TPopupMenu;
    pIncluir: TMenuItem;
    pAlterar: TMenuItem;
    pExcluir: TMenuItem;
    procedure botao(sit: Boolean);
    procedure tbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses uDMSYS, uPrincipal;

{$R *.dfm}

procedure TfrmPadrao.tbSairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
 pgCadastro.TabIndex := 0;
end;

procedure TfrmPadrao.botao(sit: Boolean);
begin
 tbPrimeiro.Enabled := sit;
 tbAnterior.Enabled := sit;
 tbProximo.Enabled := sit;
 tbUltimo.Enabled := sit;
 tbIncluir.Enabled := sit;
 tbAlterar.Enabled := sit;
 tbExcluir.Enabled := sit;
 tbRelatorio.Enabled := sit;
 tbPesquisa.Enabled := sit;
 tbSair.Enabled := sit;
 pnPadrao.AutoPopup := sit;
 pIncluir.Enabled := sit;
 pAlterar.Enabled := sit;
 pExcluir.Enabled := sit;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
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

end.
