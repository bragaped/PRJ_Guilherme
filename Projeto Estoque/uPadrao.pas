unit uPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Grids, DBGrids, ImgList, StdCtrls, Buttons,
  Menus;

type
  TfrmPadrao = class(TForm)
    pgCadCons: TPageControl;
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    tbCad: TToolBar;
    dbgConsulta: TDBGrid;
    tbPrimeiro: TToolButton;
    tbAnterior: TToolButton;
    tbProximo: TToolButton;
    tbUltimo: TToolButton;
    ToolButton5: TToolButton;
    tbIncluir: TToolButton;
    tbEdit: TToolButton;
    tbExcluir: TToolButton;
    tbSair: TToolButton;
    imCadastro: TImageList;
    gbPesquisa: TGroupBox;
    lbPesquisa: TLabel;
    edtPesquisa: TEdit;
    lbOrdem: TLabel;
    cbOrden: TComboBox;
    BitGravar: TBitBtn;
    bitCancelar: TBitBtn;
    pmCad: TPopupMenu;
    pmIncluir: TMenuItem;
    pmAlterar: TMenuItem;
    pmExcluir: TMenuItem;
    pmPesquisa: TMenuItem;
    procedure Habilita(Sit: Boolean);
    procedure tbSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tbIncluirClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure BitGravarClick(Sender: TObject);
    procedure pmPesquisaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
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


procedure TfrmPadrao.Habilita(Sit: Boolean);
 procedure parametros(SN,NS: Boolean);
  //Variavel "SN" responsavel pelos butons e opções de Pesquisa
  //Variavel "NS" responsavel pela opções de Gravação e Cancelamento da Operação 
  begin
   //tb - Tool Bar
   tbCad.Enabled := SN;
   tbPrimeiro.Enabled := SN;
   tbAnterior.Enabled := SN;
   tbProximo.Enabled := SN;
   tbUltimo.Enabled := SN;
   tbIncluir.Enabled := SN;
   tbEdit.Enabled := SN;
   tbExcluir.Enabled := SN;
   //pm -  Popup Menu
   pmCad.AutoPopup := SN;
   pmIncluir.Enabled := SN;
   pmAlterar.Enabled := SN;
   pmExcluir.Enabled := SN;
   pmPesquisa.Enabled := SN;
   //Pesquisa
   lbPesquisa.Enabled := SN;
   lbOrdem.Enabled := SN;
   edtPesquisa.Enabled := SN;
   cbOrden.Enabled := SN;
   //Cadastro
   BitGravar.Enabled := NS;
   bitCancelar.Enabled := NS;
   tsCadastro.Enabled := NS;
  end;
begin
 If (sit = True) then
  begin
    //Habilita a Pesquisa e Butons
   parametros(True,False);
  end
 else
  if (sit = False) then
   begin
     //Desabilita Pesquisa e ativa Inserção ou Edição
    parametros(False,True);
   end;
end;

procedure TfrmPadrao.tbSairClick(Sender: TObject);
begin
 if (bitCancelar.Enabled) then
  begin
   if MessageDlg('Deseja Cancelar a Operação!',mtConfirmation,
                                        [mbYes,mbNo],0) = mrYes then
    begin
     bitCancelarClick(tbSair);
    end
   else
    begin
     Exit;
    end;
  end;
 close;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
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

procedure TfrmPadrao.tbIncluirClick(Sender: TObject);
begin
 Habilita(False);//Desabilita Pesquisa e ativa Inserção ou Edição
end;

procedure TfrmPadrao.tbEditClick(Sender: TObject);
begin
 Habilita(False);//Desabilita Pesquisa e ativa Inserção ou Edição
end;

procedure TfrmPadrao.bitCancelarClick(Sender: TObject);
begin
 Habilita(True);//Habilita a Pesquisa e Butons
end;

procedure TfrmPadrao.BitGravarClick(Sender: TObject);
begin
 Habilita(True);//Habilita a Pesquisa e Butons
end;

procedure TfrmPadrao.pmPesquisaClick(Sender: TObject);
begin
 edtPesquisa.SelectAll;
 edtPesquisa.SetFocus;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
 Habilita(True);
 pgCadCons.TabIndex := 0;
end;

procedure TfrmPadrao.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
 if (cbOrden.Text = 'Código') then
  begin
   if not(key in ['0'..'9', #8]) then
    begin
     Beep;
     key := #0;
    end;
  end;
end;

end.
