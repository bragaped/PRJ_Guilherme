unit uUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ImgList, ComCtrls, ToolWin, StdCtrls, Buttons, Grids,
  DBGrids, Mask, DBCtrls, DB, IBCustomDataSet, IBQuery, Menus;

type
  TfrmUsuario = class(TfrmPadrao)
    dbeCodigo: TDBEdit;
    dbeUser: TDBEdit;
    dbeSenha: TDBEdit;
    dbeDescricao: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtpesquisa: TEdit;
    Label6: TLabel;
    cbOrdem: TComboBox;
    function  Criptografia(mStr, mChave: string): string;
    procedure Altera(Tipo: Char);
    procedure FormCreate(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure bitGravarClick(Sender: TObject);
    procedure pgCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bitCancelarClick(Sender: TObject);
    procedure tbAlterarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbPesquisaClick(Sender: TObject);
    procedure edtpesquisaChange(Sender: TObject);
    procedure cbOrdemSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses uDMSYS, uCob, uUtil;

{$R *.dfm}

function TfrmUsuario.Criptografia(mStr, mChave: string): string;
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
end;

procedure TfrmUsuario.Altera(Tipo: Char);
 procedure Campos(Pesquisa, Cadastro : Boolean);
  begin
    // Campos Cadastro
   dbeCodigo.Enabled := Cadastro;
   dbeUser.Enabled := Cadastro;
   dbeSenha.Enabled:= Cadastro;
   dbeDescricao.Enabled := Cadastro;
   bitGravar.Enabled := Cadastro;
   bitCancelar.Enabled := Cadastro;

    //Campos Pesquisa
   edtpesquisa.Enabled := Pesquisa;
   cbOrdem.Enabled := Pesquisa;
   tbPrincipal.Enabled := Pesquisa;
  end;
begin
 if tipo = 'P' then
  begin
   Campos(True, False);
   botao(True);
  end
 else
  if tipo = 'I' then
   begin
    Campos(False, True);
    botao(False);
   end;
end;

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  dmSYS.qryUsuario.Open;
  dbgConsulta.DataSource := dmSYS.dsUsuario;
  //Definir Tamanho da Janela
  Height := 365;
  Width := 430;
  ClientHeight := 330;
  ClientWidth := 420;
  Altera('P');
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

procedure TfrmUsuario.tbIncluirClick(Sender: TObject);
begin
 if dmSYS.qryUsuario.Active = False then
  begin
   dmSYS.qryUsuario.Open;
  end;
 Altera('I');
 pgCadastro.TabIndex := 1;
 dmSYS.qryUsuario.Append;
 dbeUser.SetFocus;
end;

procedure TfrmUsuario.bitGravarClick(Sender: TObject);
begin
  if (dbeUser.Text = '') then
   begin
    ShowMessage('Usuário Invalido!');
    dbeUser.SetFocus;
    Exit;
   end;
  //Salvar Senha Criptografada quando inserir o usuario
  if not(dbeSenha.Text = '') and (dmSYS.qryUsuario.State in [dsInsert]) then
   Begin
    dmSYS.qryUsuario.FieldByName('SENHA').Value :=
          Criptografia(dmSYS.qryUsuario.FieldByName('SENHA').Value,
                       dmSYS.qryUsuario.FieldByName('NOME').Value);
   end;
  dmSYS.qryUsuario.Post;
  Altera('P');
end;

procedure TfrmUsuario.bitCancelarClick(Sender: TObject);
begin
 dmSYS.qryUsuario.Cancel;
 Altera('P');
end;

procedure TfrmUsuario.pgCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if dmSYS.qryUsuario.State in [dsInsert, dsEdit] then
  begin
   if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    Begin
     AllowChange := True;
     dmSYS.qryUsuario.Cancel;
     Altera('P');
     pgCadastro.TabIndex := 0;
    end
   else
    Begin
     AllowChange := False;
     Altera('I');
     pgCadastro.TabIndex := 1;
    end;
  end;
end;

procedure TfrmUsuario.tbAlterarClick(Sender: TObject);
begin
 if dmSYS.qryUsuario.Active = False then
  begin
   ShowMessage('Nenhum Registro Selecionado!');
   exit;
  end;
 Altera('I');
 dbeSenha.ReadOnly := True;
 pgCadastro.TabIndex := 1;
 dmSYS.qryUsuario.Edit;
 dbeUser.SetFocus;
end;

procedure TfrmUsuario.tbExcluirClick(Sender: TObject);
begin
 if (MessageDlg('CONFIRMA EXCLUSÃO DO REGISTRO!',mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
   if dmSYS.qryUsuario.Active = False then
    begin
     ShowMessage('Nenhum Registro Selecionado!');
     exit;
    end;
   dmSYS.qryUsuario.Delete;
  end;
end;

procedure TfrmUsuario.tbPesquisaClick(Sender: TObject);
begin
 Altera('P');
 pgCadastro.TabIndex := 0;
 edtpesquisa.Clear;
 edtpesquisa.SetFocus;
end;

procedure TfrmUsuario.edtpesquisaChange(Sender: TObject);
begin
 dmSYS.qryUsuario.Close;
 dmSYS.qryUsuario.SQL.Clear;
 case cbOrdem.ItemIndex of
  -1:begin
     dmSYS.qryUsuario.SQL.Add('select * from usuario');
    end;
  //Código
  0:begin
     dmSYS.qryUsuario.SQL.Add('select * from usuario');
     dmSYS.qryUsuario.SQL.Add('where Use_Cod Like'+#39+Trim(edtpesquisa.Text)+'%'+#39);
    end;
  //Nome
  1:begin
     dmSYS.qryUsuario.SQL.Add('select * from usuario');
     dmSYS.qryUsuario.SQL.Add('where nome Like'+#39+Trim(UpperCase(edtpesquisa.Text))+'%'+#39);
    end;
  //Descrição
  2:begin
     dmSYS.qryUsuario.SQL.Add('select * from usuario');
     dmSYS.qryUsuario.SQL.Add('where USE_DESC Like'+#39+Trim(edtpesquisa.Text)+'%'+#39);
    end;
 end;
 dmSYS.qryUsuario.Open;
end;

procedure TfrmUsuario.cbOrdemSelect(Sender: TObject);
begin
 dmSYS.qryUsuario.Close;
 dmSYS.qryUsuario.SQL.Clear;
 edtpesquisa.Clear;
end;

end.

