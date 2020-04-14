unit uCob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, DBCtrls, Mask, ImgList, ToolWin,
  Buttons, Grids, DBGrids, DB, RpCon, RpConDS, RpDefine, RpRave, Menus,
  RpRender, RpRenderPDF, RpBase, RpSystem, RpRenderText, RpRenderHTML;

type
  TfrmCob = class(TfrmPadrao)
    Label1: TLabel;
    dbeCodigo: TDBEdit;
    Label2: TLabel;
    dbeCliente: TDBEdit;
    Label3: TLabel;
    dbcResponsavel: TDBComboBox;
    Label4: TLabel;
    dbeBaixado: TDBEdit;
    Label5: TLabel;
    dbeEmpresa: TDBEdit;
    Label11: TLabel;
    dtpData_Baixa: TDateTimePicker;
    Label12: TLabel;
    dtpData: TDateTimePicker;
    Label10: TLabel;
    dbeTotal: TDBEdit;
    Label9: TLabel;
    dbeHaver: TDBEdit;
    Label8: TLabel;
    dbeJuros: TDBEdit;
    Label7: TLabel;
    dbeDesconto: TDBEdit;
    Label6: TLabel;
    dbeValor: TDBEdit;
    cbOrdem: TComboBox;
    Label13: TLabel;
    lbPesquisa: TLabel;
    edtPesquisa: TEdit;
    dtpIni: TDateTimePicker;
    dtpFim: TDateTimePicker;
    lbDtpIni: TLabel;
    lbDtpfim: TLabel;
    RvPCob: TRvProject;
    RvDSCob: TRvDataSetConnection;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderText1: TRvRenderText;
    RvSystem1: TRvSystem;
    procedure Altera(tipo:Char);
    procedure FormCreate(Sender: TObject);
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure pgCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure bitCancelarClick(Sender: TObject);
    procedure tbPesquisaClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbAlterarClick(Sender: TObject);
    procedure tbIncluirClick(Sender: TObject);
    procedure bitGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure dtpIniExit(Sender: TObject);
    procedure tbRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCob: TfrmCob;

implementation

uses uDMSYS, uPrincipal, uUtil;

{$R *.dfm}

procedure TfrmCob.Altera(Tipo: Char);
 procedure Campos(Pesquisa, Cadastro : Boolean);
  begin
    // Campos Cadastro
  //dbeCodigo.Enabled := Cadastro;
   dbeCliente.Enabled := Cadastro;
   dbeBaixado.Enabled:= Cadastro;
   dbeEmpresa.Enabled := Cadastro;
  //dbeTotal.Enabled := Cadastro;
   dbeHaver.Enabled := Cadastro;
   dbeJuros.Enabled := Cadastro;
   dbeDesconto.Enabled := Cadastro;
   dbeValor.Enabled := Cadastro;
   dbcResponsavel.Enabled := Cadastro;
   dtpData.Enabled := Cadastro;
   dtpData_Baixa.Enabled := Cadastro;
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

procedure TfrmCob.FormCreate(Sender: TObject);
begin
 dmSYS.qryCob.Open;
 dbgConsulta.DataSource := dmSYS.dsCob;
 //Definir Tamanho da Janela
 Height := 410;
 Width := 622;
 ClientHeight := 375;
 ClientWidth := 615;
 Altera('P');
 cbOrdemChange(edtPesquisa);
end;

procedure TfrmCob.tbProximoClick(Sender: TObject);
begin
 dmSYS.qryCob.Next;
end;

procedure TfrmCob.tbUltimoClick(Sender: TObject);
begin
 dmSYS.qryCob.Last;
end;

procedure TfrmCob.tbAnteriorClick(Sender: TObject);
begin
 dmSYS.qryCob.Prior;
end;

procedure TfrmCob.tbPrimeiroClick(Sender: TObject);
begin
 dmSYS.qryCob.First;
end;

procedure TfrmCob.pgCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if dmSYS.qryCob.State in [dsInsert, dsEdit] then
  begin
   if MessageDlg('Deseja "Cancelar" a Operação', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    Begin
     AllowChange := True;
     dmSYS.qryCob.Cancel;
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

procedure TfrmCob.bitCancelarClick(Sender: TObject);
begin
 dmSYS.qryCob.Cancel;
 Altera('P');
end;

procedure TfrmCob.tbPesquisaClick(Sender: TObject);
begin
 Altera('P');
 pgCadastro.TabIndex := 0;
 edtpesquisa.Clear;
 edtpesquisa.SetFocus;
end;

procedure TfrmCob.tbExcluirClick(Sender: TObject);
begin
 if (MessageDlg('CONFIRMA EXCLUSÃO DO REGISTRO!',mtConfirmation, [mbYes,mbNo],0) = mrYes) then
  begin
   if dmSYS.qryCob.Active = False then
    begin
     ShowMessage('Nenhum Registro Selecionado!');
     exit;
    end;
   dmSYS.qryCob.Delete;
   exit;
  end;
end;

procedure TfrmCob.tbAlterarClick(Sender: TObject);
begin
 if dmSYS.qryCob.Active = False then
  begin
   ShowMessage('Nenhum Registro Selecionado!');
   exit;
  end;
 Altera('I');
 pgCadastro.TabIndex := 1;
 dmSYS.qryCob.Edit;
 dbeCliente.SetFocus;
end;

procedure TfrmCob.tbIncluirClick(Sender: TObject);
begin
 if dmSYS.qryCob.Active = False then
  begin
   dmSYS.qryCob.Open;
  end;
 Altera('I');
 pgCadastro.TabIndex := 1;
 dmSYS.qryCob.Append;
 dbeCliente.SetFocus;
 dtpData_Baixa.Date := Date;
 dtpData.Date := Date;
end;

procedure TfrmCob.bitGravarClick(Sender: TObject);
begin
 dmSYS.qryCob.FieldByName('DATA_BAIXA').AsDateTime := dtpData_Baixa.DateTime;
 dmSYS.qryCob.FieldByName('DATA').AsDateTime := dtpData.DateTime;
 
 dmSYS.qryCob.Post;
 Altera('P');
end;

procedure TfrmCob.FormShow(Sender: TObject);
begin
 pgCadastro.TabIndex := 1;
end;

procedure TfrmCob.cbOrdemChange(Sender: TObject);
 procedure pesquisa(Cliente, Data : Boolean);
  begin
   //pesquisa por cliente
   lbPesquisa.Visible := cliente;
   edtPesquisa.Visible := cliente;
   //pesquisa por datas
   lbDtpIni.Visible := Data;
   lbDtpfim.Visible := Data;
   dtpIni.Visible := Data;
   dtpFim.Visible := Data;
  end;
begin
 dmSYS.qryCob.Close;
 dmSYS.qryCob.SQL.Clear;
 if Sender = edtPesquisa then
  begin
   pesquisa(True, False);
   dmSYS.qryCob.SQL.Add('select * from COBRANCA');
   dmSYS.qryCob.Open;
  end
 else
  begin
   case cbOrdem.ItemIndex of
    -1:begin
        pesquisa(True, False);
        dmSYS.qryCob.SQL.Add('select * from COBRANCA');
        edtPesquisa.Clear;
        dtpIni.Date := Date;
        dtpFim.Date := Date;
       end;
    0:begin
       pesquisa(True, False);
       dmSYS.qryCob.SQL.Add('select * from COBRANCA');
       dmSYS.qryCob.SQL.Add('where cliente Like '+edtPesquisa.Text+'%');
       dmSYS.qryCob.SQL.Add('order by cliente');
       edtPesquisa.Clear;
       edtPesquisa.SetFocus;
      end;
    1:begin
       dtpIni.Date := Date;
       dtpFim.Date := Date;
       pesquisa(False, True);
       dmSYS.qryCob.SQL.Add('select * from COBRANCA');
       dmSYS.qryCob.SQL.Add('where data_baixa Between :nDataIni and :nDataFim');
       dmSYS.qryCob.SQL.Add('order by data_baixa') ;
       dmSYS.qryCob.ParamByName('nDataIni').AsDate := dtpIni.Date;
       dmSYS.qryCob.ParamByName('nDataFim').AsDate := dtpFim.Date;
      end;
    2:begin
       dtpIni.Date := Date;
       dtpFim.Date := Date;
       pesquisa(False, True);
       dmSYS.qryCob.SQL.Add('select * from COBRANCA');
       dmSYS.qryCob.SQL.Add('where data Between :nDataIni and :nDataFim');
       dmSYS.qryCob.SQL.Add('order by data');
       dmSYS.qryCob.ParamByName('nDataIni').AsDate := dtpIni.Date;
       dmSYS.qryCob.ParamByName('nDataFim').AsDate := dtpFim.Date;
      end;
   end;
  end;
end;

procedure TfrmCob.edtPesquisaChange(Sender: TObject);
begin
 case cbOrdem.ItemIndex of
  0:begin
     dmSYS.qryCob.Close;
     dmSYS.qryCob.SQL.Clear;
     dmSYS.qryCob.SQL.Add('select * from COBRANCA');
     dmSYS.qryCob.SQL.Add('where cliente Like '+#39+Trim(edtpesquisa.Text)+'%'+#39);
     dmSYS.qryCob.SQL.Add('order by cliente');
     //dmSYS.qryCob.Open;
     //dmSYS.qryCob.Locate('CLIENTE',edtPesquisa.Text, [loPartialKey]);
    end;
  1:begin
     dmSYS.qryCob.Close;
     dmSYS.qryCob.ParamByName('nDataIni').AsDate := dtpIni.Date;
     dmSYS.qryCob.ParamByName('nDataFim').AsDate := dtpFim.Date;
    end;
  2:begin
     dmSYS.qryCob.Close;
     dmSYS.qryCob.ParamByName('nDataIni').AsDate := dtpIni.Date;
     dmSYS.qryCob.ParamByName('nDataFim').AsDate := dtpFim.Date;
    end;
 end;
 dmSYS.qryCob.Open;
 dmSYS.qryCob.Refresh;
end;

procedure TfrmCob.dtpIniExit(Sender: TObject);
begin
 if dtpIni.Date > dtpFim.Date then
  begin
   ShowMessage('Data Inicial não deve ser maior que a Data Final!');
   if Sender = dtpIni then
    begin
     dtpIni.Date := dtpFim.Date;
     dtpIni.SetFocus;
    end
   else
    if Sender = dtpFim then
     begin
      dtpFim.Date := dtpIni.Date;
      dtpFim.SetFocus;
     end;
   Exit;
  end;
end;

procedure TfrmCob.tbRelatorioClick(Sender: TObject);
begin
 RvPCob.Execute;
end;

end.
