unit uUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ImgList, StdCtrls, ComCtrls, ToolWin, Buttons, Grids,
  DBGrids, DBCtrls, Mask, Menus, DB;

type
  TfrmUsuario = class(TfrmPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbecodigo: TDBEdit;
    dbeNome: TDBEdit;
    dbeSenha: TDBEdit;
    dbreObs: TDBRichEdit;
    //function  Criptografia(mStr, mChave: string): string;
    procedure tbIncluirClick(Sender: TObject);
    procedure pgCadConsChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitGravarClick(Sender: TObject);
    procedure tbEditClick(Sender: TObject);
    procedure bitCancelarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbPrimeiroClick(Sender: TObject);
    procedure cbOrdenSelect(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses uDMSYS, uPrincipal, uUtil;

{$R *.dfm}

{function TfrmUsuario.Criptografia(mStr, mChave: string): string;
var
  i, TamanhoString, pos, PosLetra, TamanhoChave: Integer;
begin
  Result := mStr;
  TamanhoString := Length(mStr);
  TamanhoChave := Length(mChave);   //A função Criptografia pode ser usada para criptografar a senha acesso ao sistema.
  for i := 1 to TamanhoString do    //Ela é usada nos dois sentidos, para criptografar e descriptografar,
  begin                             //desde que seja usada a mesma chave nas duas operações. "mStr" é a String que vai ser
  pos := (i mod TamanhoChave);      //criptografada e "mChave" é a String que sera usada como base para fazer a criptografia.
  if pos = 0 then
  pos := TamanhoChave;
  posLetra := ord(Result[i]) xor ord(mChave[pos]);
  if posLetra = 0 then
  posLetra := ord(Result[i]);
  Result[i] := chr(posLetra);
  end;
end;   }

procedure TfrmUsuario.tbIncluirClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryUsuario.Active then
   begin
    dmSYS.qryUsuario.Open;
   end;
  dmSYS.qryUsuario.Insert;
  pgCadCons.TabIndex := 1;
  dbeNome.SetFocus;
  dbeSenha.ReadOnly := False; 
end;

procedure TfrmUsuario.pgCadConsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
 if dmSYS.qryUsuario.State in [dsInsert, dsEdit] then
  begin
   if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    Begin
     AllowChange := True;
     dmSYS.qryUsuario.Cancel;
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

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  dmSYS.qryUsuario.Open;
end;

procedure TfrmUsuario.BitGravarClick(Sender: TObject);
begin
  if (dbeNome.Text = '') then
   begin
    ShowMessage('Nome de Usúario Inválido ou Nulo!');
    Beep;
    Exit;
   end;
   
  inherited;
  dbeSenha.Text := Criptografia(dbeSenha.Text,dbeNome.Text);
  dmSYS.qryUsuario.Post;
end;

procedure TfrmUsuario.tbEditClick(Sender: TObject);
begin
  inherited;
  if not dmSYS.qryUsuario.Active then
   begin
    dmSYS.qryUsuario.Open;
   end;
  if dmSYS.qryUsuario.IsEmpty then
   begin
    ShowMessage('Nenhum Registro Selecionado!');
   end;
  dmSYS.qryUsuario.Edit;
  pgCadCons.TabIndex := 1;
  dbeNome.SetFocus;
  dbeSenha.ReadOnly := True;
end;

procedure TfrmUsuario.bitCancelarClick(Sender: TObject);
begin
  inherited;
  dmSYS.qryUsuario.Cancel;
end;

procedure TfrmUsuario.tbExcluirClick(Sender: TObject);
begin
  inherited;
  Beep;
  if not (dmSYS.qryUsuario.Active) then
   begin
    dmSYS.qryUsuario.Open;
   end;
   //verifica se a query esta vazia
  if not (dmSYS.qryUsuario.IsEmpty) then
   begin
    //se existir registro seleciona confirma a exclusão
    if (MessageDlg('Confirma Exclusão do Registro!',
                           mtConfirmation,[mbYes,mbNo],0)= mrYes) then
     begin
      dmSYS.qryUsuario.Delete;
     end;
      exit;
   end
  else
   //Se não existir Registro a Excluir
   begin
    MessageDlg('Nenhum Registro Selecionado',mtError,[mbOK],0);
   end;
end;

procedure TfrmUsuario.tbProximoClick(Sender: TObject);
begin
 dmSYS.qryUsuario.Next;
end;

procedure TfrmUsuario.tbUltimoClick(Sender: TObject);
begin
 dmSYS.qryUsuario.Last;
end;

procedure TfrmUsuario.tbAnteriorClick(Sender: TObject);
begin
 dmSYS.qryUsuario.Prior;
end;

procedure TfrmUsuario.tbPrimeiroClick(Sender: TObject);
begin
 dmSYS.qryUsuario.First;
end;

procedure TfrmUsuario.cbOrdenSelect(Sender: TObject);
begin
 dmSYS.qryUsuario.Close;
 dmSYS.qryUsuario.SQL.Clear;
 dmSYS.qryUsuario.SQL.Add('Select * from Usuario ');

 //adicionar filtro e orderby
 if (cbOrden.ItemIndex = 0) then
  begin
   dmSYS.qryUsuario.SQL.Add('order by NOME');
   if not(edtPesquisa.Text = '') then
    begin
     dmSYS.qryUsuario.Prepare;
     edtPesquisa.Clear;
    end;
  end
 else
  begin
   if (cbOrden.ItemIndex = 1) then
    begin
     dmSYS.qryUsuario.SQL.Add('order by USE_COD');
     edtPesquisa.Clear;
    end;
  end;

 dmSYS.qryUsuario.Open;
end;

procedure TfrmUsuario.edtPesquisaChange(Sender: TObject);
begin
 if (dmSYS.qryUsuario.Active) and not(edtPesquisa.Text = '') then
  begin
     if (cbOrden.ItemIndex = 0) then
      begin
       dmSYS.qryUsuario.Locate('NOME',UpperCase(edtPesquisa.Text),[loPartialKey]);
      end
     else
      begin
       if (cbOrden.ItemIndex = 1) then
        begin
         dmSYS.qryUsuario.Locate('USE_COD',StrToInt(edtPesquisa.Text),[loPartialKey]);
        end;
      end;
  end;
end;

end.
