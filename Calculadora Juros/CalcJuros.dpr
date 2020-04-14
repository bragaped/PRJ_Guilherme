program CalcJuros;

uses
  Forms,
  uCalJuros in 'uCalJuros.pas' {frmCalcJuros};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCalcJuros, frmCalcJuros);
  Application.Run;
end.
