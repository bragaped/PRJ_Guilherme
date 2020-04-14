unit uINI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Gauges, ComCtrls, StdCtrls;

type
  TfrmINI = class(TForm)
    gPercentual: TGauge;
    imIni: TImage;
    Panel1: TPanel;
    TimerPerc: TTimer;
    lbDescricao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TimerPercTimer(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmINI: TfrmINI;

implementation

uses uLogin, uPrincipal, uUtil;

{$R *.dfm}

procedure TfrmINI.FormCreate(Sender: TObject);
begin
 uUtil.Foto := (ExtractFilePath(Application.ExeName)+'\Imagens\INI.JPG');
 imIni.Picture.LoadFromFile(Foto);
end;

procedure TfrmINI.TimerPercTimer(Sender: TObject);
begin
 gPercentual.Progress := gPercentual.Progress + 1;
  if gPercentual.progress = 16 then
   begin
    lbDescricao.caption := 'Conectando com o Banco de Dados...';
   end;

  if gPercentual.progress = 19 then
   begin
    lbDescricao.caption := 'Carregando Modulos...';
   end;

  if gPercentual.progress = 50 then
   begin
    lbDescricao.caption := 'Efetuando Login...';
   end;

  if gPercentual.progress = 55 then
   begin
    TimerPerc.Enabled := False;
    frmLogin.ShowModal;        
   end;

  if gPercentual.progress = 57 then
   begin
    lbDescricao.caption := 'Carregado Permições de Acesso...';
   end;

  if gPercentual.progress = 70 then
   begin
    lbDescricao.caption := 'Carregado Aplicativo...';
   end;

  if gPercentual.progress = 95 then
   begin
    lbDescricao.caption := 'Finalizando...';
   end;

  if gPercentual.progress = 99 then
   begin
    lbDescricao.caption := 'Completo...';
   end;

  if gPercentual.progress = 100 then
   begin
    Sleep(100);
    frmPrincipal.Show;
    Close;
   end;
end;

procedure TfrmINI.FormDeactivate(Sender: TObject);
begin
  frmINI.FreeOnRelease;
end;

procedure TfrmINI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
