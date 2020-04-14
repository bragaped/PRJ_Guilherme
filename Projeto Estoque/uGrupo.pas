unit uGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ImgList, StdCtrls, ComCtrls, ToolWin, Buttons, Grids,
  DBGrids, Mask, DBCtrls, Menus, DB;

type
  TfrmGrupo = class(TfrmPadrao)
    dbeCodigo: TDBEdit;
    dbeNome: TDBEdit;
    dbreObs: TDBRichEdit;
    lbcodigo: TLabel;
    lbNome: TLabel;
    lbObs: TLabel;
    procedure pgCadConsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure tbIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure cbOrdenSelect(Sender: TObject);
    procedure BitGravarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupo: TfrmGrupo;

implementation

uses  uDMSYS, uPrincipal, uUtil, uProduto;

{$R *.dfm}

procedure TfrmGrupo.pgCadConsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
 if dmSYS.qryGrupo.State in [dsInsert, dsEdit] then
  begin
   if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    Begin
     AllowChange := True;
     dmSYS.qryGrupo.Cancel;
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

procedure TfrmGrupo.tbIncluirClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryGrupo.Active then
   begin
    dmSYS.qryGrupo.Open;
   end;
  dmSYS.qryGrupo.Insert;
  pgCadCons.TabIndex := 1;
  dbeNome.SetFocus;
end;

procedure TfrmGrupo.FormCreate(Sender: TObject);
begin
  inherited;
  dmSYS.qryGrupo.Open;
end;

procedure TfrmGrupo.tbEditClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryGrupo.Active then
   begin
    dmSYS.qryGrupo.Open;
   end;
  if dmSYS.qryGrupo.IsEmpty then
   begin
    ShowMessage('Nenhum Registro Selecionado!');
   end;
  dmSYS.qryGrupo.Edit;
  pgCadCons.TabIndex := 1;
  dbeNome.SetFocus;
end;

procedure TfrmGrupo.tbExcluirClick(Sender: TObject);
begin
  inherited;
  Beep;
  if not (dmSYS.qryGrupo.Active) then
   begin
    dmSYS.qryGrupo.Open;
   end;
   //verifica se a query esta vazia
  if not (dmSYS.qryGrupo.IsEmpty) then
   begin
    //se existir registro seleciona confirma a exclusão
    if (MessageDlg('Confirma Exclusão do Registro!',
                           mtConfirmation,[mbYes,mbNo],0)= mrYes) then
     begin
      dmSYS.qryGrupo.Delete;
     end;
      exit;
   end
  else
   //Se não existir Registro a Excluir
   begin
    MessageDlg('Nenhum Registro Selecionado',mtError,[mbOK],0);
   end;
end;

procedure TfrmGrupo.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryGrupo.Cancel;
end;

procedure TfrmGrupo.tbPrimeiroClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryGrupo.First;
end;

procedure TfrmGrupo.tbAnteriorClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryGrupo.Prior;
end;

procedure TfrmGrupo.tbProximoClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryGrupo.Next;
end;

procedure TfrmGrupo.tbUltimoClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryGrupo.Last;
end;

procedure TfrmGrupo.cbOrdenSelect(Sender: TObject);
begin
  inherited;
 dmSYS.qryGrupo.Close;
 dmSYS.qryGrupo.SQL.Clear;
 dmSYS.qryGrupo.SQL.Add('Select * from Grupo ');
 //adicionar orderby
 if (cbOrden.ItemIndex = 0) then
  begin
   dmSYS.qryGrupo.SQL.Add('order by GRU_NOM');
   edtPesquisa.Clear;
  end
 else
  begin
   if (cbOrden.ItemIndex = 1) then
    begin
     dmSYS.qryGrupo.SQL.Add('order by GRU_Cod');
     edtPesquisa.Clear;
    end;
  end;

 dmSYS.qryGrupo.Open;
end;

procedure TfrmGrupo.BitGravarClick(Sender: TObject);
begin
 if (dbeNome.Text = '') then
   begin
    ShowMessage('Nome de Categoria Inválido ou Nulo!');
    Beep;
    Exit;
   end;

  inherited;
  dmSYS.qryGrupo.Post;
  edtPesquisa.SelectAll;
  edtPesquisa.SetFocus;
end;

procedure TfrmGrupo.edtPesquisaChange(Sender: TObject);
begin
 if not(edtPesquisa.Text = '') then
  begin
   dmSYS.qryGrupo.Close;
   dmSYS.qryGrupo.SQL.Clear;
   dmSYS.qryGrupo.SQL.Add('select * from GRUPO');
   if not(dmSYS.qryGrupo.Active) and not(edtPesquisa.Text = '') then
    begin
     case cbOrden.ItemIndex of
      -1:begin
         dmSYS.qryGrupo.SQL.Add('order by GRU_NOM');
        end;
      0:begin
         dmSYS.qryGrupo.SQL.Add('where GRU_NOM Like'+#39+Trim(edtPesquisa.Text)+'%'+#39);
         dmSYS.qryGrupo.SQL.Add('order by GRU_NOM');
        end;
      1:begin
         dmSYS.qryGrupo.SQL.Add('where GRU_COD Like '+#39+Trim(edtPesquisa.Text)+'%'+#39);
         dmSYS.qryGrupo.SQL.Add('order by GRU_COD');
        end;
      end;
    end;
   dmSYS.qryGrupo.Open;
  end
 else
  begin
   dmSYS.qryGrupo.Close;
   dmSYS.qryGrupo.SQL.Clear;
   dmSYS.qryGrupo.SQL.Add('select * from GRUPO');
   dmSYS.qryGrupo.SQL.Add('order by GRU_NOM');
   dmSYS.qryGrupo.Open;
  end;
end;

procedure TfrmGrupo.dbgConsultaDblClick(Sender: TObject);
begin
 case uUtil.ConsCategoria of
  'S':begin

       if not(dmSYS.qryGrupo.IsEmpty) then
        begin
         frmProduto.dbeGrupo.Text := dmSYS.qryGrupo.FieldByName('GRU_COD').AsString;
         tbSairClick(frmProduto);
        end
       else
        begin
         ShowMessage('Nenhum Grupo Selecionado!');
        end;
        
      end;
 end;
end;

procedure TfrmGrupo.tbSairClick(Sender: TObject);
begin
  inherited;
  uUtil.ConsCategoria := 'N';
end;

end.
