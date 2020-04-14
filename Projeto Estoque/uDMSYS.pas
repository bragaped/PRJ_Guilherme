unit uDMSYS;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, IBDatabase, IBSQL,
  IBCustomDataSet, IBQuery, IBUpdateSQL, Messages, Dialogs;

type
  TdmSYS = class(TDataModule)
    ibtEstoque: TIBTransaction;
    ibdEstoque: TIBDatabase;
    ibuGrupo: TIBUpdateSQL;
    dsGrupo: TDataSource;
    dsUsuario: TDataSource;
    dsProduto: TDataSource;
    dsLancamento: TDataSource;
    ibuUsuario: TIBUpdateSQL;
    ibuProduto: TIBUpdateSQL;
    qryUsuario: TIBQuery;
    qryProduto: TIBQuery;
    qryLancamento: TIBQuery;
    qryUsuarioNOME: TIBStringField;
    qryUsuarioSENHA: TIBStringField;
    qryUsuarioUSE_OBS: TIBStringField;
    qryProdutoPRO_COD: TIntegerField;
    qryProdutoGRU_COD: TIntegerField;
    qryProdutoPRO_NOM: TIBStringField;
    qryProdutoPRO_PESO: TFloatField;
    qryProdutoPRO_UNI: TIBStringField;
    qryProdutoPRO_QTD: TFloatField;
    qryUsuarioUSE_COD: TIntegerField;
    qryConsulta: TIBQuery;
    dsConsulta: TDataSource;
    qryProdutoNome_Grupo: TStringField;
    qryGrupo: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    qryConsPro: TIBQuery;
    dsConsPro: TDataSource;
    qryConsProPRO_COD: TIntegerField;
    qryConsProPRO_NOM: TIBStringField;
    ibuLancamento: TIBUpdateSQL;
    qryItens_Lanc: TIBQuery;
    ibuItens_Lanc: TIBUpdateSQL;
    dsItens_Lanc: TDataSource;
    qryLancamentoLANC_COD: TIntegerField;
    qryLancamentoLANC_TIP: TIntegerField;
    qryLancamentoLANC_SIT: TIntegerField;
    qryLancamentoLANC_DATA_MOV: TDateField;
    qryLancamentoLANC_DATA: TDateField;
    qryLancamentoUSE_COD: TIntegerField;
    qryLancamentoNRO_NF: TIntegerField;
    qryItens_LancPRO_COD: TIntegerField;
    qryItens_LancITENS_LANC_COD: TIntegerField;
    qryItens_LancITENS_QTDE: TFloatField;
    qryItens_LancUSE_COD: TIntegerField;
    qryItens_LancLANC_COD: TIntegerField;
    qryItens_LancNRO_NF: TIntegerField;
    qryItens_LancLANC_TIP: TIntegerField;
    qryItens_LancNome_Pro: TStringField;
    dsLog_Estoque: TDataSource;
    ibuLog_Estoque: TIBUpdateSQL;
    qryLog_Estoque: TIBQuery;
    qryProdutoPRO_VENDA: TFloatField;
    qryProdutoPRO_CUSTO: TFloatField;
    qryLancamentoVALOR_TOTAL: TFloatField;
    qryItens_LancITENS_VENDA: TFloatField;
    qryItens_LancITENS_CUSTO: TFloatField;
    qryItens_LancITENS_DESC: TFloatField;
    qryLog_EstoqueLOG_COD: TIntegerField;
    qryLog_EstoqueITENS_LANC_COD: TIntegerField;
    qryLog_EstoqueUSE_NOME: TIBStringField;
    qryLog_EstoqueLANC_COD: TIntegerField;
    qryLog_EstoqueNRO_NF: TIntegerField;
    qryLog_EstoqueLANC_TIP: TIntegerField;
    qryLog_EstoqueMOTIVO: TIBStringField;
    qryLog_EstoqueDATA: TDateField;
    qryLog_EstoqueQTDE: TFloatField;
    qryLog_EstoquePRO_COD: TIntegerField;
    procedure qryUsuarioAfterPost(DataSet: TDataSet);
    procedure qryProdutoAfterPost(DataSet: TDataSet);
    procedure qryGrupoAfterPost(DataSet: TDataSet);
    procedure qryLancamentoLANC_SITGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryLancamentoBeforePost(DataSet: TDataSet);
    procedure qryItens_LancBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSYS: TdmSYS;

implementation

uses uPrincipal, uGrupo, uPadrao, uProduto, uUsuario, uUtil, uMovimentacao,
  ComCtrls;

{$R *.dfm}

procedure TdmSYS.qryUsuarioAfterPost(DataSet: TDataSet);
begin
 ibtEstoque.CommitRetaining;
end;

procedure TdmSYS.qryProdutoAfterPost(DataSet: TDataSet);
begin
 ibtEstoque.CommitRetaining;
 if (uUtil.ConsProduto <> 'S') then
  begin
   qryProduto.Open;
  end;
end;

procedure TdmSYS.qryGrupoAfterPost(DataSet: TDataSet);
begin
 ibtEstoque.CommitRetaining;
 if (uUtil.ConsCategoria <> 'S') then
  begin
   qryGrupo.Open;
  end;
end;

procedure TdmSYS.qryLancamentoLANC_SITGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if AnsiUpperCase(sender.AsString) = '0' then Text := 'Pendente'
   else
     if AnsiUpperCase(sender.asString) = '1' then Text := 'Efetivado'
end;

procedure TdmSYS.qryLancamentoBeforePost(DataSet: TDataSet);
begin
 qryLancamento.FieldByName('USE_COD').AsInteger := uUtil.CodUse;
 qryLancamento.FieldByName('LANC_DATA_MOV').AsDateTime :=
                                            frmMovimentacao.dtpDataMov.Date;
 qryLancamento.FieldByName('LANC_DATA').AsDateTime :=
                                        frmMovimentacao.dtpData.Date;
end;

procedure TdmSYS.qryItens_LancBeforePost(DataSet: TDataSet);
begin
 if (qryLancamento.State in [dsInsert]) then
  begin
   qryLancamento.FieldByName('USE_COD').AsInteger := uUtil.CodUse;
   if (qryLancamento.FieldByName('NRO_NF').IsNull) then
    begin
     ShowMessage('Número Nota Inválido!');
     exit;
    end; 
   qryLancamento.Post;
  end;
end;

end.
