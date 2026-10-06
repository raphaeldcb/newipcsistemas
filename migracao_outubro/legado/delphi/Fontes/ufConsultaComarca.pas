unit ufConsultaComarca;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TfConsultaComarca = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Cancelar: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   Codigo : string;
   Estado : string;
  end;

var
  fConsultaComarca: TfConsultaComarca;

implementation

uses ufDM, ufComarca;

{$R *.DFM}

procedure TfConsultaComarca.BitBtn1Click(Sender: TObject);
begin
  DM.qComarca.Close;
  DM.qComarca.SQL.Clear;
  DM.qComarca.SQL.Add('SELECT c.com_cod, c.com_desc, c.com_sigla, c.uf_sigla, e.uf_desc AS DESCRICAOESTADO FROM tb_COMARCA c JOIN tb_UF e ON c.uf_sigla = e.uf_sigla where c.com_desc like :PALAVRACHAVE order by UF_SIGLA asc');
  DM.qComarca.Parameters.ParamByName('PALAVRACHAVE').Value := '%' + Edit1.Text + '%';
  DM.qComarca.Open;
end;

procedure TfConsultaComarca.CancelarClick(Sender: TObject);
begin
 Close;
end;


procedure TfConsultaComarca.BitBtn5Click(Sender: TObject);
begin
if DM.qComarca.RecordCount > 0
then begin
      Close;
     end else begin
               ShowMessage('Desculpe. Comarca não encontrada!!!!');
              end;
end;

procedure TfConsultaComarca.FormShow(Sender: TObject);
begin
  Edit1.Text := '';
  Edit1.SetFocus;
end;

end.
