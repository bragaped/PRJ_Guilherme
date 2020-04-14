unit uCalJuros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Mask, DBCtrls, ComCtrls, Grids, DBGrids,
  Buttons;

type
  TfrmCalcJuros = class(TForm)
    cdsDados: TClientDataSet;
    dsDados: TDataSource;
    cdsDadosValor: TFloatField;
    cdsDadosData: TDateField;
    cdsDadosjuros: TFloatField;
    cdsDadosValor_Juros: TFloatField;
    cdsDadosValor_Total: TFloatField;
    dbeValor: TDBEdit;
    dbeJuros: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtpData: TDateTimePicker;
    Label5: TLabel;
    grdDados: TDBGrid;
    bitIncluir: TBitBtn;
    dbtValJuros: TDBText;
    dbtValTotal: TDBText;
    procedure cdsDadosCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitIncluirClick(Sender: TObject);
    procedure dtpDataCloseUp(Sender: TObject);
    function  Bissexto(AYear: Integer): Boolean;
    function  DiasDoMes(AYear, AMonth: Integer): Integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcJuros: TfrmCalcJuros;

implementation

{$R *.dfm}

{descobre se o ano é bisexto}
function TfrmCalcJuros.Bissexto(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

{descobre quantos dias tem no mes}
function TfrmCalcJuros.DiasDoMes(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and Bissexto(AYear) then Inc(Result);
end;

procedure TfrmCalcJuros.bitIncluirClick(Sender: TObject);
begin
 cdsDados.Post;
 cdsDados.Insert;
 cdsDados.FieldByName('Data').AsDateTime := Date;
end;

procedure TfrmCalcJuros.cdsDadosCalcFields(DataSet: TDataSet);
var JDia: Real;
    dias: string;
begin
 dias:='';
 if not(cdsDados.FieldByName('Valor').IsNull) or
    not(cdsDados.FieldByName('Juros').IsNull) or
    not(cdsDados.FieldByName('Data').IsNull) then
  begin
   dias := FloatToStr(Date - cdsDados.FieldByName('Data').AsDateTime);

   JDia := ((cdsDados.FieldByName('Juros').AsFloat/100)*(-StrtoInt(dias)/30));

   cdsDados.FieldByName('Valor_Juros').AsFloat := (cdsDados.FieldByName('Valor').AsFloat*JDia);
  end;



 if not(cdsDados.FieldByName('Valor_Juros').IsNull) then
  begin
   cdsDados.FieldByName('Valor_Total').AsFloat :=
          cdsDados.FieldByName('Valor').AsFloat+
          cdsDados.FieldByName('Valor_Juros').AsFloat;
  end;

end;

procedure TfrmCalcJuros.dtpDataCloseUp(Sender: TObject);
begin
cdsDados.FieldByName('Data').AsDateTime := dtpData.Date;
end;

procedure TfrmCalcJuros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if (cdsDados.State in [dsInsert, dsEdit]) then
   begin
     cdsDados.ClearFields;
   end;
 cdsDados.Close;  
end;

procedure TfrmCalcJuros.FormCreate(Sender: TObject);
begin
 cdsDados.CreateDataSet;
 cdsDados.Open;
 cdsDados.Insert;
 dtpData.Date := Date;
 cdsDados.FieldByName('Data').AsDateTime := Date;
end;

end.
