unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, ToolWin;

type
  TfrmPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    Cobrana1: TMenuItem;
    N1: TMenuItem;
    Usurio1: TMenuItem;
    Help1: TMenuItem;
    Sair1: TMenuItem;
    N2: TMenuItem;
    Sair2: TMenuItem;
    StatusBar: TStatusBar;
    Image1: TImage;
    function Ativacao(Nome: String): Boolean;
    procedure Sair2Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Cobrana1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uCob, uDMSYS, uUsuario, uLogin, uUtil;

{$R *.dfm}

function TfrmPrincipal.Ativacao(Nome: String): Boolean;
var
 cont: integer;
 auxForm : TForm ;
begin
 Ativacao := false ;
 for cont := 0 to MDIChildCount - 1  do
  begin
   auxform :=  MDIChildren[cont] ;
   if AnsiUpperCase(auxForm.name) = Nome then
    begin
     auxform.Show ;
     Ativacao := true ;
     break ;
    end ;
  end;
end;

procedure TfrmPrincipal.Sair2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmPrincipal.Usurio1Click(Sender: TObject);
begin
 if not Ativacao('FRMUSUARIO') then
  begin
   Application.CreateForm(TfrmUsuario,frmUsuario);
  end;
end;

procedure TfrmPrincipal.Cobrana1Click(Sender: TObject);
begin
 if not Ativacao('FRMCOB') then
  begin
   Application.CreateForm(TfrmCob,frmCob);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 frmLogin.ShowModal;
 StatusBar.Panels[0].Text := frmPrincipal.Text;
 StatusBar.Panels[1].Text := DateToStr(Date);
 StatusBar.Panels[2].Text := 'Usuario: '+uUtil.NOMEUSER;
 StatusBar.Panels[3].Text := 'Bild: 1.0  '; 
end;

end.
