unit ufConsultaVara;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, JvExControls, JvDBLookup;

type
  TfConsultaVara = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Cancelar: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    JvDBLookupCombo1: TJvDBLookupCombo;
    procedure BitBtn1Click(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
   CodComarca : string;
   Estado : string;
   CodVara : string;

  end;

var
  fConsultaVara: TfConsultaVara;

implementation

uses ufDM, ufVara;

{$R *.DFM}

procedure TfConsultaVara.BitBtn1Click(Sender: TObject);
begin
try
  DM.qVara.Close;
  DM.qVara.SQL.Clear;
  DM.qVara.SQL.Add('select v.uf_sigla, v.var_sigla, v.var_cod, v.var_desc, v.jui_cod, j.jui_desc, c.com_cod AS COM_COD, c.com_desc AS NomeComarca, e.uf_desc as DescricaoEstado ');
  DM.qVara.SQL.Add(' , VAR_END Ende_Vara, VAR_BAIRRO Bairro_Vara, VAR_CID Cidade_Vara, VAR_CEP CEP_Vara  ');
  DM.qVara.SQL.Add(' from tb_VARAS v JOIN tb_COMARCA c ON v.uf_sigla = c.uf_sigla and v.com_cod = c.com_cod');
  DM.qVara.SQL.Add(' JOIN tb_UF e ON c.uf_sigla = E.uf_sigla JOIN tb_juiz j ON v.jui_cod=j.jui_cod ');
  DM.qVara.SQL.Add(' WHERE c.com_desc LIKE :NOMECOMARCA');
  DM.qVara.Parameters.ParamByName('NOMECOMARCA').Value := '%' + Edit1.Text + '%';
  DM.qVara.Open;
except
  ShowMessage('Erro na Consulta de Varas. Tente Novamente!!!!');
end;
end;

procedure TfConsultaVara.CancelarClick(Sender: TObject);
begin
try
  Close;
except
  ShowMessage('Erro nesse processamento. Tente Novamente!!!!');
  fVara.Destroy;
  fVara.Free;
end;
end;


procedure TfConsultaVara.FormShow(Sender: TObject);
begin
   Edit1.Text := '';
   Edit1.SetFocus;
end;

procedure TfConsultaVara.BitBtn5Click(Sender: TObject);
begin
try
if DM.qVara.RecordCount > 0
then begin
      Close;
     end else begin
               ShowMessage('Desculpe. Vara não encontrada!!!!');
              end;
except
  ShowMessage('Erro nesse processamento. Tente Novamente!!!!');
end;
end;

procedure TfConsultaVara.BitBtn2Click(Sender: TObject);
begin
try
 DM.qVara.Close;
 DM.qVara.SQL.Clear;
 DM.qVara.SQL.Add('select v.uf_sigla, v.var_sigla, v.var_cod, v.var_desc, v.jui_cod, j.jui_desc, c.com_cod AS COM_COD, c.com_desc AS NomeComarca, e.uf_desc as DescricaoEstado ');
 DM.qVara.SQL.Add(' , VAR_END Ende_Vara, VAR_BAIRRO Bairro_Vara, VAR_CID Cidade_Vara, VAR_CEP CEP_Vara  ');
 DM.qVara.SQL.Add(' from tb_VARAS v JOIN tb_COMARCA c ON v.uf_sigla = c.uf_sigla and v.com_cod = c.com_cod');
 DM.qVara.SQL.Add(' JOIN tb_UF e ON c.uf_sigla = E.uf_sigla JOIN tb_juiz j ON v.jui_cod=j.jui_cod ');
 DM.qVara.Open;
 Close;
 fVara.BNovo.Click;
except
  ShowMessage('Erro nesse processamento. Tente Novamente!!!!');
end;
end;

end.
