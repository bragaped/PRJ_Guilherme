unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    mPrincipal: TMainMenu;
    Arquivo: TMenuItem;
    Produto: TMenuItem;
    CadProduto: TMenuItem;
    CadCategoria: TMenuItem;
    N1: TMenuItem;
    Sair: TMenuItem;
    Movimento: TMenuItem;
    Estoque: TMenuItem;
    Sair1: TMenuItem;
    ToolBar1: TToolBar;
    tb1: TToolButton;
    tb2: TToolButton;
    tb3: TToolButton;
    ToolButton4: TToolButton;
    tb4: TToolButton;
    ilPrincipal: TImageList;
    sbPrincipal: TStatusBar;
    Utilitarios1: TMenuItem;
    Usario1: TMenuItem;
    CadUsuario: TMenuItem;
    TrocarSenha: TMenuItem;
    imPrincipal: TImage;
    function Ativacao(Nome: String): Boolean;
    procedure SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CadUsuarioClick(Sender: TObject);
    procedure CadCategoriaClick(Sender: TObject);
    procedure TrocarSenhaClick(Sender: TObject);
    procedure CadProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EstoqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uDMSYS, uLogin, uINI, uPadrao, uGrupo, uProduto, uUsuario, uUtil,
  uTrocaSenha, uMovimentacao;

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

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
 close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
 uUtil.Foto := (ExtractFilePath(Application.ExeName)+'\Imagens\Principal.JPG');
 imPrincipal.Picture.LoadFromFile(Foto);
 sbPrincipal.Panels[2].Text := 'Date: '+DateToStr(Date);
 sbPrincipal.Panels[4].Width := 350;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 frmINI.ShowModal;
 sbPrincipal.Panels[1].Text := 'Usúario: '+uUtil.Usuario;
end;

procedure TfrmPrincipal.CadUsuarioClick(Sender: TObject);
begin
 if not Ativacao('FRMUSUARIO') then
  begin
   Application.CreateForm(TfrmUsuario,frmUsuario);
  end;
end;

procedure TfrmPrincipal.CadCategoriaClick(Sender: TObject);
begin
 if not Ativacao('FRMGRUPO') then
  begin
   Application.CreateForm(TfrmGrupo,frmGrupo);
  end;
end;

procedure TfrmPrincipal.TrocarSenhaClick(Sender: TObject);
begin
 Application.CreateForm(TfrmTrocaSenha,frmTrocaSenha);
 frmTrocaSenha.ShowModal;
end;

procedure TfrmPrincipal.CadProdutoClick(Sender: TObject);
begin
 if not Ativacao('FRMPRODUTO') then
  begin
   Application.CreateForm(TfrmProduto,frmProduto);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 dmSYS.Destroy;
 Action := caFree;
end;

procedure TfrmPrincipal.EstoqueClick(Sender: TObject);
begin
 if not Ativacao('FRMMOVIMENTACAO') then
  begin
   Application.CreateForm(TfrmMovimentacao,frmMovimentacao);
  end;
end;

end.
