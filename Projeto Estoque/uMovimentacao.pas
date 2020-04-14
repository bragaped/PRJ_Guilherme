unit uMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Menus, ImgList, StdCtrls, ComCtrls, ToolWin, Buttons,
  Grids, DBGrids, DBCtrls, Mask, ExtCtrls;

type
  TfrmMovimentacao = class(TfrmPadrao)
    rbTipMov: TDBRadioGroup;
    dbeNota: TDBEdit;
    pgMov: TPageControl;
    tsItens: TTabSheet;
    dbgItensMov: TDBGrid;
    dtpDataMov: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtpData: TDateTimePicker;
    Label3: TLabel;
    LbSit: TDBText;
    Label4: TLabel;
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure BitGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentacao: TfrmMovimentacao;

implementation

uses uDMSYS, uPrincipal, uProduto, uUtil;

{$R *.dfm}

procedure TfrmMovimentacao.tbPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryLancamento.First;
end;

procedure TfrmMovimentacao.tbAnteriorClick(Sender: TObject);
begin
  inherited;
 dmSYS.qryLancamento.Prior;
end;

procedure TfrmMovimentacao.tbProximoClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryLancamento.Next;
end;

procedure TfrmMovimentacao.tbUltimoClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryLancamento.Last;
end;

procedure TfrmMovimentacao.tbExcluirClick(Sender: TObject);
begin
  inherited;
  Beep;
  if not (dmSYS.qryLancamento.Active) then
   begin
    dmSYS.qryLancamento.Open;
   end;
   //verifica se a query esta vazia
  if not (dmSYS.qryLancamento.IsEmpty) then
   begin
    //se existir registro seleciona confirma a exclusão
    if (MessageDlg('Confirma Exclusão do Registro!',
                           mtConfirmation,[mbYes,mbNo],0)= mrYes) then
     begin
      dmSYS.qryLancamento.Delete;
     end;
      exit;
   end
  else
   //Se não existir Registro a Excluir
   begin
    MessageDlg('Nenhum Registro Selecionado',mtError,[mbOK],0);
   end;
end;

procedure TfrmMovimentacao.tbEditClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryLancamento.Active then
   begin
    dmSYS.qryLancamento.Open;
   end;
  if dmSYS.qryLancamento.IsEmpty then
   begin
    ShowMessage('Nenhum Registro Selecionado!');
    exit;
   end;
  if (dmSYS.qryLancamento.FieldByName('LANC_SIT').AsInteger = 0) then
   begin
    dmSYS.qryLancamento.Edit;
    pgCadCons.TabIndex := 1;
    rbTipMov.Enabled := False;
    dbeNota.Enabled := False;
    dtpData.SetFocus;
   end; 
end;

procedure TfrmMovimentacao.tbIncluirClick(Sender: TObject);
begin
  inherited;
  uUtil.CadMov := 'S';
  if not dmSYS.qryLancamento.Active then
   begin
    dmSYS.qryLancamento.Open;
   end;
  dmSYS.qryLancamento.Insert;
  pgCadCons.TabIndex := 1;
  rbTipMov.SetFocus;
end;

procedure TfrmMovimentacao.BitGravarClick(Sender: TObject);
begin
  inherited;
  uUtil.CadMov := 'N';
  dmSYS.qryLancamento.Post;
end;

end.
