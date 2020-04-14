unit uDMSYS;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBUpdateSQL, IBQuery,
  Messages, Dialogs;

type
  TdmSYS = class(TDataModule)
    ibdCobranca: TIBDatabase;
    ibtCobranca: TIBTransaction;
    qryCob: TIBQuery;
    ibuCob: TIBUpdateSQL;
    dsCob: TDataSource;
    qryCobCODIGO: TIntegerField;
    qryCobDATA: TDateField;
    qryCobCLIENTE: TIBStringField;
    qryCobDATA_BAIXA: TDateField;
    qryCobBAIXADO: TIBStringField;
    qryCobRESPONSALVEL: TIBStringField;
    qryCobEMPRESA: TIBStringField;
    qryCobHAVER: TFloatField;
    qryCobVALOR: TFloatField;
    qryCobDESCONTO: TFloatField;
    qryCobJUROS: TFloatField;
    qryCobTOTAL: TFloatField;
    dsUsuario: TDataSource;
    qryUsuario: TIBQuery;
    ibuUsuario: TIBUpdateSQL;
    qryUsuarioUSE_COD: TIntegerField;
    qryUsuarioNOME: TIBStringField;
    qryUsuarioSENHA: TIBStringField;
    qryUsuarioUSE_DESC: TIBStringField;
    procedure valida(campo: String);
    procedure qryUsuarioBeforeInsert(DataSet: TDataSet);
    procedure qryUsuarioAfterInsert(DataSet: TDataSet);
    procedure qryCobBeforeInsert(DataSet: TDataSet);
    procedure qryCobAfterInsert(DataSet: TDataSet);
    procedure qryCobDATASetText(Sender: TField; const Text: String);
    procedure qryCobDATA_BAIXASetText(Sender: TField; const Text: String);
    procedure qryCobBeforePost(DataSet: TDataSet);
    procedure dsCobDataChange(Sender: TObject; Field: TField);
    procedure qryCobCalcFields(DataSet: TDataSet);
    procedure qryCobVALORChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSYS: TdmSYS;
  coduser, codcob : integer;

implementation

uses uCob, uUsuario, uUtil, uLogin;

{$R *.dfm}

procedure TdmSYS.valida(campo: String);
begin
 if qryCob.FieldByName(campo).IsNull then
  begin
   ShowMessage('O Campo '+campo+' não pode ser nulo.'+#13+
              'Click em "Cancelar" para Sair');
   Abort;
   exit;
  end;
end;

procedure TdmSYS.qryUsuarioBeforeInsert(DataSet: TDataSet);
begin
 qryUsuario.Close;
 qryUsuario.SQL.Clear;
 qryUsuario.SQL.Add('select * from usuario');
 qryUsuario.Open;
 qryUsuario.Last;
 coduser := qryUsuario.FieldByName('USE_COD').Value+1;
end;

procedure TdmSYS.qryUsuarioAfterInsert(DataSet: TDataSet);
begin
 if qryUsuario.FieldByName('USE_COD').IsNull then
  begin
   qryUsuario.FieldByName('USE_COD').AsInteger := coduser;
  end;
end;

procedure TdmSYS.qryCobBeforeInsert(DataSet: TDataSet);
begin
 qryCob.Close;
 qryCob.SQL.Clear;
 qryCob.SQL.Add('select * from cobranca');
 qryCob.Open;
 qryCob.Last;
 codcob := qryCob.FieldByName('codigo').Value+1;
end;

procedure TdmSYS.qryCobAfterInsert(DataSet: TDataSet);
begin
 if qryCob.FieldByName('codigo').IsNull then
  begin
   qryCob.FieldByName('codigo').AsInteger := codcob;
  end;
end;

procedure TdmSYS.qryCobDATASetText(Sender: TField; const Text: String);
var data : Tdatetime;
    texto:string;
begin
 Texto := Text;
 data := StrToDate('01/01/1900');
 if StrToDateDef(texto,data) = data then
  begin
   ShowMessage('Data Invalida');
   Abort;
  end
 else
  qryCob.FieldByName('DATA').AsDateTime := StrToDate(texto);
end;

procedure TdmSYS.qryCobDATA_BAIXASetText(Sender: TField;
  const Text: String);
var data : Tdatetime;
    texto:string;
begin
 Texto := Text;
 data := StrToDate('01/01/1900');
 if StrToDateDef(texto,data) = data then begin
   ShowMessage('Data Invalida');
   Abort;
  end
 else
  qryCob.FieldByName('DATA_BAIXA').AsDateTime := StrToDate(texto);
end;

procedure TdmSYS.qryCobBeforePost(DataSet: TDataSet);
 procedure Zerar(campo: String);
  begin
    if qryCob.FieldByName(campo).IsNull then
     begin
      qryCob.FieldByName(campo).AsFloat := 0;
     end;
  end;
begin
 //validar campo se estão nulos
 valida('Cliente');
 valida('DATA');
 valida('DATA_BAIXA');
 valida('BAIXADO');
 valida('RESPONSALVEL');
 valida('EMPRESA');
 valida('VALOR');
 valida('TOTAL');
 //fim validação dos campos
 Zerar('VALOR');
 Zerar('TOTAL');
 Zerar('DESCONTO');
 Zerar('HAVER');
 Zerar('JUROS');
end;

procedure TdmSYS.dsCobDataChange(Sender: TObject; Field: TField);
begin
 if qryCob.State in [dsBrowse] then
  begin
   frmCob.dtpData_Baixa.Date := qryCob.FieldByName('DATA_BAIXA').AsDateTime;
   frmCob.dtpData.Date := qryCob.FieldByName('DATA').AsDateTime;
  end; 
end;

procedure TdmSYS.qryCobCalcFields(DataSet: TDataSet);
begin
 qryCob.FieldByName('TOTAL').AsFloat :=
                    qryCob.FieldByName('VALOR').AsFloat +
                    qryCob.FieldByName('JUROS').AsFloat -
                    qryCob.FieldByName('DESCONTO').AsFloat;
end;

procedure TdmSYS.qryCobVALORChange(Sender: TField);
begin
 qryCobCalcFields(qryCob);
end;

end.
