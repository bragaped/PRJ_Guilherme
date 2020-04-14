unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, ComCtrls, DB, SqlExpr, DBXFirebird, Grids, DBGrids,
  ExtCtrls, DBCtrls, FMTBcd, Provider, DBClient, StdCtrls, Mask, IniFiles,
  JvExMask, JvToolEdit, JvDBControls, Buttons, QRCtrls, QuickRpt;

type
  TForm1 = class(TForm)
    SQLCFirebird: TSQLConnection;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Lista: TTabSheet;
    PageControl3: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    SQLDSBancos: TSQLDataSet;
    SQLDSDespesas: TSQLDataSet;
    SQLDSBancosBANCO: TStringField;
    SQLDSBancosCONTA: TStringField;
    SQLDSBancosID: TIntegerField;
    SQLDSBancosVALOR: TFMTBCDField;
    SQLDSDespesasDATA_PAGAMENTO: TDateField;
    SQLDSDespesasDATA_VENCIMENTO: TDateField;
    SQLDSDespesasDESCRICAO: TStringField;
    SQLDSDespesasID: TIntegerField;
    SQLDSDespesasVALOR: TFMTBCDField;
    DSPBancos: TDataSetProvider;
    DSPDespesas: TDataSetProvider;
    CDSBancos: TClientDataSet;
    CDSBancosBANCO: TStringField;
    CDSBancosCONTA: TStringField;
    CDSBancosID: TIntegerField;
    CDSBancosVALOR: TFMTBCDField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DSBancos: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    CDSDespesas: TClientDataSet;
    CDSDespesasDATA_PAGAMENTO: TDateField;
    CDSDespesasDATA_VENCIMENTO: TDateField;
    CDSDespesasDESCRICAO: TStringField;
    CDSDespesasID: TIntegerField;
    CDSDespesasVALOR: TFMTBCDField;
    DSDespesas: TDataSource;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    JvDBDateEdit2: TJvDBDateEdit;
    SQLQOperacao: TSQLQuery;
    Panel1: TPanel;
    JvDateEdit1: TJvDateEdit;
    JvDateEdit2: TJvDateEdit;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CDSBancosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CDSBancosAfterInsert(DataSet: TDataSet);
    procedure CDSBancosAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    function LerIni(Arquivo,Alias,Chave,Default:String): String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  BitBtn2Click(Sender);
  QuickRep1.PreviewModal;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  CDSDespesas.Filtered := False;
  if (JvDateEdit1.Date>0) then begin
    if CheckBox1.Checked then
      CDSDespesas.Filter := '(DATA_PAGAMENTO>= '''+DateToStr(JvDateEdit1.Date)+''') and (DATA_PAGAMENTO<='''+DateToStr(JvDateEdit2.Date)+''')'
    else
      CDSDespesas.Filter := '(DATA_VENCIMENTO>= '''+DateToStr(JvDateEdit1.Date)+''') and (DATA_VENCIMENTO<='''+DateToStr(JvDateEdit2.Date)+''') and DATA_PAGAMENTO is null';
    CDSDespesas.Filtered := True;
  end;
end;

procedure TForm1.CDSBancosAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('id').AsInteger := 1;
end;

procedure TForm1.CDSBancosAfterPost(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).ApplyUpdates(0);
  DataSet.Close;
  DataSet.Open;
end;

procedure TForm1.CDSBancosPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  DataSet.FieldByName('id').AsInteger := DataSet.FieldByName('id').AsInteger+1;
  Action := daRetry;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SQLCFirebird.Close;
 try
   SQLCFirebird.ConnectionName := LerIni('CONFIG.INI','CONFIGURACAO','ConnectionName','Despesas');//Carregar o Nome da Conexão com o Banco
   SQLCFirebird.ParamsLoaded   := True;
   SQLCFirebird.DriverName     := LerIni('CONFIG.INI','CONFIGURACAO','drivername','FIREBIRD');//Carregar o Driver a Ser utilizado
   SQLCFirebird.GetDriverFunc  := 'getSQLDriverINTERBASE';//Função do Driver
   SQLCFirebird.LibraryName    := 'dbxfb.dll';//Dll do Driver
   SQLCFirebird.VendorLib      := 'fbclient.dll';//Dll do Client SGDB
   SQLCFirebird.Params.Clear;
   SQLCFirebird.Params.Add('drivername='+LerIni('CONFIG.INI','CONFIGURACAO','drivername','FIREBIRD'));//Carregar o Driver a Ser utilizado
   SQLCFirebird.Params.Add('hostname='+LerIni('CONFIG.INI','CONFIGURACAO','hostname','localhost'));//Nome do HOST "Servidor"
   SQLCFirebird.Params.Add('user_name='+LerIni('CONFIG.INI','CONFIGURACAO','user_name','SYSDBA'));
   SQLCFirebird.Params.Add('password='+LerIni('CONFIG.INI','CONFIGURACAO','password','masterkey'));
   SQLCFirebird.Params.Add('port='+LerIni('CONFIG.INI','CONFIGURACAO','port','3050'));//Porta de Configuração do SGDB
   SQLCFirebird.Params.Add('Database='+LerIni('CONFIG.INI','CONFIGURACAO','Database',ExtractFilePath(Application.ExeName)+'\Dados\DADOS.FDB'));//Caminho do Banco de dados
   SQLCFirebird.Params.Add('blobsize=-1');
   SQLCFirebird.Open;
 except
   MessageDlg('Não foi possivel Conectar ao Banco de Dados!',mtError,[mbOK],0);
   exit;
 end;

 SQLCFirebird.Open;
 CDSBancos.Open;
 CDSDespesas.Open;

end;

function TForm1.LerIni(Arquivo, Alias, Chave, Default: String): String;
var  config: TIniFile;
begin
  config := TIniFile.Create(ExtractFilePath(Application.ExeName)+Arquivo);
  try
    Result := config.ReadString(Alias,Chave,Default);
  finally
    config.Free;
  end;
end;

end.
