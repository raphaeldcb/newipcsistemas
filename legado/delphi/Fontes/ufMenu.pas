unit ufMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, DB, DBCtrls, ExtCtrls, Grids,
  DBGrids, StdCtrls, Buttons, Mask, System.ImageList;

type
  TfMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Utilitrios1: TMenuItem;
    ControledeUsurios1: TMenuItem;
    Usurios1: TMenuItem;
    N1: TMenuItem;
    GruposdeUsurios1: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Comarca1: TMenuItem;
    Varas1: TMenuItem;
    LocaisdeColeta1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ItensdoHistrico1: TMenuItem;
    ipodeCasoPreo1: TMenuItem;
    Relatrios1: TMenuItem;
    EtiquetadeColeta1: TMenuItem;
    N4: TMenuItem;
    Financeiro1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton20: TToolButton;
    ToolButton22: TToolButton;
    N5: TMenuItem;
    N6: TMenuItem;
    Casos1: TMenuItem;
    procedure Usurios1Click(Sender: TObject);
    procedure GruposdeUsurios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Comarca1Click(Sender: TObject);
    procedure Varas1Click(Sender: TObject);
    procedure LocaisdeColeta1Click(Sender: TObject);
    procedure ItensdoHistrico1Click(Sender: TObject);
    procedure ipodeCasoPreo1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure Casos1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

uses ufGrupo, ufUsuarios, ufAcesso, ufuncoes, ufDM, ufLocaisColeta,
  ufItemHistorico, ufTipoCasoPreco, ufComarca, ufVara, ufHistorico,
  ufProcesso;

{$R *.dfm}

procedure TfMenu.Usurios1Click(Sender: TObject);
begin
  Application.CreateForm(TfUsuarios,fUsuarios);
  fUsuarios.ShowModal;
  fUsuarios.Free;
end;

procedure TfMenu.GruposdeUsurios1Click(Sender: TObject);
begin
  Application.CreateForm(TfRestricao,fRestricao);
  fRestricao.ShowModal;
  fRestricao.Free;
end;

procedure TfMenu.FormShow(Sender: TObject);
begin
   StatusBar1.Panels[1].Text := fAcesso.Edit1.Text;
   StatusBar1.Panels[2].Text := GetBuildInfo1();
end;

procedure TfMenu.Comarca1Click(Sender: TObject);
begin
  Application.CreateForm(TfComarca,fComarca);
  fComarca.ShowModal;
  fComarca.Free;
end;

procedure TfMenu.Varas1Click(Sender: TObject);
begin
  Application.CreateForm(TfVara,fVara);
  fVara.ShowModal;
  fVara.Free;
end;

procedure TfMenu.LocaisdeColeta1Click(Sender: TObject);
begin
  Application.CreateForm(TfLocaisColeta,fLocaisColeta);
  fLocaisColeta.ShowModal;
  fLocaisColeta.Free;
end;

procedure TfMenu.ItensdoHistrico1Click(Sender: TObject);
begin
  Application.CreateForm(TfItemHist,fItemHist);
  fItemHist.ShowModal;
  fItemHist.Free;
end;

procedure TfMenu.ipodeCasoPreo1Click(Sender: TObject);
begin
  Application.CreateForm(TfCasoPreco,fCasoPreco);
  fCasoPreco.ShowModal;
  fCasoPreco.Free;
end;

procedure TfMenu.ToolButton1Click(Sender: TObject);
begin
 if MessageDlg('Deseja realmente sair do CPG?',mtconfirmation,[mbyes,mbno],0) = mryes
   then begin
           close;
        end;
end;

procedure TfMenu.Casos1Click(Sender: TObject);
begin
  Application.CreateForm(TfProcessos,fProcessos);
  fProcessos.ShowModal;
  fProcessos.Free;
end;

procedure TfMenu.FormActivate(Sender: TObject);
begin
          Application.CreateForm(TfProcessos,fProcessos);
  fProcessos.ShowModal;
  fProcessos.Free;
end;

end.
