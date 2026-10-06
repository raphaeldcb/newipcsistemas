unit UFPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TfPadrao = class(TForm)
    DSP: TDataSource;
    PBotoes: TPanel;
    PCampos: TPanel;
    PGrid: TPanel;
    DBGrid1: TDBGrid;
    bbtPrimeiro: TSpeedButton;
    bbtAnterior: TSpeedButton;
    bbtProximo: TSpeedButton;
    bbtUltimo: TSpeedButton;
    BNovo: TSpeedButton;
    BEditar: TSpeedButton;
    BExcluir: TSpeedButton;
    BSalvar: TSpeedButton;
    BCancelar: TSpeedButton;
    BSair: TSpeedButton;
    BCnsultar: TSpeedButton;
    procedure BSairClick(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BExcluirClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtPrimeiroClick(Sender: TObject);
    procedure bbtAnteriorClick(Sender: TObject);
    procedure bbtProximoClick(Sender: TObject);
    procedure bbtUltimoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPadrao: TfPadrao;

implementation



{$R *.dfm}

procedure TfPadrao.BSairClick(Sender: TObject);
begin
// if MessageDlg('Deseja realmente sair?',mtconfirmation,[mbyes,mbno],0) = mryes
//   then begin
           close;
//        end;
end;

procedure TfPadrao.BNovoClick(Sender: TObject);
begin
   dsp.DataSet.Append;
   pcampos.Enabled:=true;
   bsalvar.Enabled:=true;
   pgrid.Enabled:=true;
   bcancelar.Enabled:=true;
   bnovo.Enabled:=false;
   beditar.Enabled:=false;
   bsair.Enabled:=false;
   bexcluir.Enabled:=false;
   bbtPrimeiro.Enabled:=false;
   bbtAnterior.Enabled:=false;
   bbtProximo.Enabled:=false;
   bbtUltimo.Enabled:=false;
end;

procedure TfPadrao.BEditarClick(Sender: TObject);
begin
   dsp.DataSet.Edit;
   pcampos.Enabled:=true;
   pgrid.Enabled:=true;
   bsalvar.Enabled:=true;
   bcancelar.Enabled:=true;
   bnovo.Enabled:=false;
   beditar.Enabled:=false;
   bsair.Enabled:=false;
   bexcluir.Enabled:=false;

   bbtPrimeiro.Enabled:=false;
   bbtAnterior.Enabled:=false;
   bbtProximo.Enabled:=false;
   bbtUltimo.Enabled:=false;

end;

procedure TfPadrao.BExcluirClick(Sender: TObject);
begin
   if messagedlg('Deseja realmente excluir?',mtconfirmation,[mbyes,mbno],0) = mryes
   then begin
           dsp.DataSet.delete;
           pcampos.Enabled:=true;
           pgrid.Enabled:=false;
           bsalvar.Enabled:=false;
           bcancelar.Enabled:=false;
           bnovo.Enabled:=true;
           beditar.Enabled:=true;
           bsair.Enabled:=true;
           bexcluir.Enabled:=true;
        end;

end;

procedure TfPadrao.BCancelarClick(Sender: TObject);
begin
 if messagedlg('Deseja realmente cancelar?',mtconfirmation,[mbyes,mbno],0) = mryes
   then begin
           dsp.DataSet.Cancel;
           pcampos.Enabled:=false;
           pgrid.Enabled:=false;
           bsalvar.Enabled:=false;
           bcancelar.Enabled:=false;
           bnovo.Enabled:=true;
           beditar.Enabled:=true;
           bsair.Enabled:=true;
           bexcluir.Enabled:=true;
           bbtPrimeiro.Enabled:=true;
           bbtAnterior.Enabled:=true;
           bbtProximo.Enabled:=true;
           bbtUltimo.Enabled:=true;

        end;
end;

procedure TfPadrao.BSalvarClick(Sender: TObject);
begin
   if dsp.DataSet.State in [dsinsert, dsedit]
   then begin
           dsp.DataSet.post;
           Showmessage ('Dados gravados com sucesso!');
           pcampos.Enabled:=false;
           pgrid.Enabled:=false;
           bsalvar.Enabled:=false;
           bcancelar.Enabled:=false;
           bnovo.Enabled:=true;
           beditar.Enabled:=true;
           bsair.Enabled:=true;
           bexcluir.Enabled:=true;
           bbtPrimeiro.Enabled:=true;
           bbtAnterior.Enabled:=true;
           bbtProximo.Enabled:=true;
           bbtUltimo.Enabled:=true;

        end
   else begin
           Showmessage ('Dados gravados com sucesso!');
           pcampos.Enabled:=false;
           pgrid.Enabled:=false;
           bsalvar.Enabled:=false;
           bcancelar.Enabled:=false;
           bnovo.Enabled:=true;
           beditar.Enabled:=true;
           bsair.Enabled:=true;
           bexcluir.Enabled:=true;
           bbtPrimeiro.Enabled:=true;
           bbtAnterior.Enabled:=true;
           bbtProximo.Enabled:=true;
           bbtUltimo.Enabled:=true;
           
         end;
end;

procedure TfPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
{
if Key = #13 then
if not (ActiveControl is TDBGrid) then
begin
Key := #0;
Perform(WM_NEXTDLGCTL, 0, 0);
end
else if (ActiveControl is TDBGrid) then
with TDBGrid(ActiveControl) do
if selectedindex < (fieldcount -1) then
selectedindex := selectedindex +1
else
selectedindex := 0;}
end;

procedure TfPadrao.bbtPrimeiroClick(Sender: TObject);
begin
DSP.DataSet.First;
end;

procedure TfPadrao.bbtAnteriorClick(Sender: TObject);
begin
DSP.DataSet.Prior;
end;

procedure TfPadrao.bbtProximoClick(Sender: TObject);
begin
DSP.DataSet.Next;
end;

procedure TfPadrao.bbtUltimoClick(Sender: TObject);
begin
DSP.DataSet.Last;
end;

procedure TfPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// case Key of
//  VK_F5     :   bbtPrimeiro.Click;
//  VK_F6     :   bbtAnterior.Click;
//  VK_F7     :   bbtProximo.Click;
//  VK_F8     :   bbtUltimo.Click;
// end; 
end;

end.




