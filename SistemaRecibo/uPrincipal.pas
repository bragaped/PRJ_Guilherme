unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Mask, DBCtrls, Buttons, QuickRpt,
  QRCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1IE: TStringField;
    ClientDataSet1Valor: TCurrencyField;
    ClientDataSet1ValorExtenso: TStringField;
    ClientDataSet1Filial: TStringField;
    ClientDataSet1CNPJFilial: TStringField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    ClientDataSet1Obs: TMemoField;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 ClientDataSet1.CreateDataSet;
 ClientDataSet1.Active := True;
 ClientDataSet1.Insert;
 Width := 440;
 Height := 390;
 QuickRep1.Visible := False;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 ClientDataSet1.Active := False;
 ClientDataSet1.Active := True;
 ClientDataSet1.Insert;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 ClientDataSet1.Post;
 QuickRep1.Visible := True;
 QuickRep1.Preview;
 QuickRep1.Visible := False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ClientDataSet1.Close;
 ClientDataSet1.Destroy;
 Action := caFree;
end;

end.
