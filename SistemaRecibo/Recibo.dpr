program Recibo;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Recibo';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
