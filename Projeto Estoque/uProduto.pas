unit uProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ImgList, StdCtrls, ComCtrls, ToolWin, Buttons, Grids,
  DBGrids, DBCtrls, Mask, ExtCtrls, Menus, DB;

type
  TfrmProduto = class(TfrmPadrao)
    dbeCodigo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeNome: TDBEdit;
    dbeGrupo: TDBEdit;
    pnNomeGrupo: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    dbeUni: TDBEdit;
    dbePeso: TDBEdit;
    dbtGrupo: TDBText;
    Label7: TLabel;
    dbePreCusto: TDBEdit;
    Label8: TLabel;
    dbePreVenda: TDBEdit;
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure pgCadConsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure BitGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeGrupoDblClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure cbOrdenSelect(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

uses uDMSYS, uGrupo, uPrincipal, uUsuario, uUtil, uMovimentacao;

{$R *.dfm}

procedure TfrmProduto.tbPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryProduto.First;
end;

procedure TfrmProduto.tbAnteriorClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryProduto.Prior;
end;

procedure TfrmProduto.tbProximoClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryProduto.Next;
end;

procedure TfrmProduto.tbUltimoClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryProduto.Last;
end;

procedure TfrmProduto.pgCadConsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
 if dmSYS.qryProduto.State in [dsInsert, dsEdit] then
  begin
   if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    Begin
     AllowChange := True;
     dmSYS.qryProduto.Cancel;
     Habilita(True);//Habilita a Pesquisa e Butons
     pgCadCons.TabIndex := 0;
    end
   else
    Begin
     AllowChange := False;
     Habilita(False);//Desabilita Pesquisa e ativa Inserção ou Edição
     pgCadCons.TabIndex := 1;
    end;
  end;
end;

procedure TfrmProduto.tbExcluirClick(Sender: TObject);
begin
  inherited;
  Beep;
  if not (dmSYS.qryProduto.Active) then
   begin
    dmSYS.qryProduto.Open;
   end;
   //verifica se a query esta vazia
  if not (dmSYS.qryProduto.IsEmpty) then
   begin
    //se existir registro seleciona confirma a exclusão
    if (MessageDlg('Confirma Exclusão do Registro!',
                           mtConfirmation,[mbYes,mbNo],0)= mrYes) then
     begin
      dmSYS.qryProduto.Delete;
     end;
      exit;
   end
  else
   //Se não existir Registro a Excluir
   begin
    MessageDlg('Nenhum Registro Selecionado',mtError,[mbOK],0);
   end;
end;

procedure TfrmProduto.tbIncluirClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryProduto.Active then
   begin
    dmSYS.qryProduto.Open;
   end;
  dmSYS.qryProduto.Insert;
  pgCadCons.TabIndex := 1;
  dbeNome.SetFocus;
end;

procedure TfrmProduto.tbEditClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryProduto.Active then
   begin
    dmSYS.qryProduto.Open;
   end;
  if dmSYS.qryProduto.IsEmpty then
   begin
    ShowMessage('Nenhum Registro Selecionado!');
   end;
  dmSYS.qryProduto.Edit;
  pgCadCons.TabIndex := 1;
  dbeNome.SetFocus;
end;

procedure TfrmProduto.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryProduto.Cancel;
end;

procedure TfrmProduto.BitGravarClick(Sender: TObject);
var grupo:Boolean;
begin
  if (dbeNome.Text = '') then
   begin
    ShowMessage('Nome Inválido!');
    dbeNome.SetFocus;
    exit;
   end;
  //Valida Grupo
  dmSYS.qryConsulta.Close;
  dmSYS.qryConsulta.SQL.Clear;
  dmSYS.qryConsulta.SQL.Add('Select GRU_COD from grupo where GRU_COD = :cod');
  dmSYS.qryConsulta.ParamByName('cod').AsInteger := StrToInt(dbeGrupo.Text);
  dmSYS.qryConsulta.Open;
  grupo := dmSYS.qryConsulta.IsEmpty;
  if (dbeGrupo.Text = '') or (dbtGrupo.Caption = '') or (grupo=True) then
   begin
    ShowMessage('Grupo Inválido!');
    dbeGrupo.SetFocus;
    exit;
   end;

  inherited;
  dmSYS.qryProduto.Post;
  edtPesquisa.SelectAll;
  edtPesquisa.SetFocus;
end;

procedure TfrmProduto.FormCreate(Sender: TObject);
begin
  inherited;
  dmSYS.qryProduto.Open;
end;

procedure TfrmProduto.dbeGrupoDblClick(Sender: TObject);
begin
 if (dmSYS.qryGrupo.State in [dsInsert, dsEdit]) then
  begin
   if (MessageDlg('Deseja Cancelar a Alteração no Cadastro de Categoria!',
                  mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    begin
     frmGrupo.bitCancelarClick(frmProduto);
     frmGrupo.pgCadCons.TabIndex := 0;
    end
   else
    begin
     Abort;
     Exit;
    end;
  end;
 uUtil.ConsCategoria := 'S';
 if not frmPrincipal.Ativacao('FRMGRUPO') then
  begin
   Application.CreateForm(TfrmGrupo,frmGrupo);
  end;
end;

procedure TfrmProduto.edtPesquisaChange(Sender: TObject);
begin
 if not(edtPesquisa.Text = '') then
  begin
   dmSYS.qryProduto.Close;
   dmSYS.qryProduto.SQL.Clear;
   dmSYS.qryProduto.SQL.Add('select * from PRODUTO');
   if not(dmSYS.qryProduto.Active) and not(edtPesquisa.Text = '') then
    begin
     case cbOrden.ItemIndex of
      -1:begin
         dmSYS.qryProduto.SQL.Add('order by PRO_NOM');
        end;
      0:begin
         dmSYS.qryProduto.SQL.Add('where PRO_NOM Like'+#39+Trim(UpperCase(edtPesquisa.Text))+'%'+#39);
         dmSYS.qryProduto.SQL.Add('order by PRO_NOM');
        end;
      1:begin
         dmSYS.qryProduto.SQL.Add('where PRO_COD Like '+#39+Trim(UpperCase(edtPesquisa.Text))+'%'+#39);
         dmSYS.qryProduto.SQL.Add('order by PRO_COD');
        end;
      2:begin
         dmSYS.qryProduto.Close;
         dmSYS.qryProduto.SQL.Clear;
         dmSYS.qryProduto.SQL.Add('select * from PRODUTO as p, GRUPO as g');
         dmSYS.qryProduto.SQL.Add('where g.GRU_NOM Like '+#39+Trim(UpperCase(edtPesquisa.Text))+'%'+#39);
         dmSYS.qryProduto.SQL.Add('and p.GRU_COD = g.GRU_COD order by g.GRU_NOM');
        end;
     end;
    end;
   dmSYS.qryProduto.Open;
  end
 else
  begin
   dmSYS.qryProduto.Close;
   dmSYS.qryProduto.SQL.Clear;
   dmSYS.qryProduto.SQL.Add('select * from PRODUTO');
   dmSYS.qryProduto.SQL.Add('order by PRO_NOM');
   dmSYS.qryProduto.Open;
  end;
end;

procedure TfrmProduto.cbOrdenSelect(Sender: TObject);
begin
  inherited;
 dmSYS.qryProduto.Close;
 dmSYS.qryProduto.SQL.Clear;
 dmSYS.qryProduto.SQL.Add('Select * from Produto ');
 //adicionar orderby
 case cbOrden.ItemIndex of
   0: begin
       dmSYS.qryProduto.SQL.Add('order by PRO_NOM');
       edtPesquisa.Clear;
      end;
   1: begin
       dmSYS.qryProduto.SQL.Add('order by PRO_COD');
       edtPesquisa.Clear;
      end;
   2: begin
       dmSYS.qryProduto.SQL.Add('order by Nome_Grupo');
       edtPesquisa.Clear;
      end;
  end;
 dmSYS.qryProduto.Open;
end;

procedure TfrmProduto.dbgConsultaDblClick(Sender: TObject);
begin
 case uUtil.CadMov of
  'S':begin
       frmMovimentacao.dbgItensMov.Fields[0].AsInteger :=
                                     dmSYS.qryProduto.FieldByName('PRO_COD').Value;
      end;
  'N':begin
        
      end;
 end;
end;

end.
