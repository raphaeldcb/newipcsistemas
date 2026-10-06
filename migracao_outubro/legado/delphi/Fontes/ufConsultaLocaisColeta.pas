unit ufConsultaLocaisColeta;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TfConsultaLocaisColetas = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Cancelar: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    ds_ConsultasLocaisColeta: TDataSource;
    RG_TipoBusca: TRadioGroup;
    procedure CancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
   CodComarca : string;
   Estado : string;
   CodVara : string;

  end;

var
  fConsultaLocaisColetas: TfConsultaLocaisColetas;

implementation

uses ufDM, ufVara, ufLocaisColeta;

{$R *.DFM}

procedure TfConsultaLocaisColetas.CancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfConsultaLocaisColetas.FormShow(Sender: TObject);
begin
   Edit1.Text := '';
   Edit1.SetFocus;
end;

procedure TfConsultaLocaisColetas.BitBtn5Click(Sender: TObject);
begin
if DM.qConsultaLocaisColeta.RecordCount > 0
then begin
      if DM.qLocalColeta.Locate('LCO_COD', DM.qConsultaLocaisColetaLCO_COD.Value, []) = True
      then begin
            Close;
           end;
     end else begin
               ShowMessage('Desculpe. Locais de Coletas não encontrado!!!!');
              end;
end;

procedure TfConsultaLocaisColetas.Edit1Change(Sender: TObject);
begin
  DM.qConsultaLocaisColeta.Close;
  DM.qConsultaLocaisColeta.SQL.Clear;
  DM.qConsultaLocaisColeta.SQL.Add('SELECT c.LCO_NUMCARTCORREIO, c.lco_cod, c.lco_nome, c.lco_dtre, c.lco_dcad, c.lco_email, c.lco_site, c.lco_cep, c.lco_sexo, c.lco_crm, c.lco_res, c.lco_cel,c.lco_labt, c.lco_fone, c.lco_end, c.lco_cid, c.uf_sigla, c.lco_tlie, c.lco_trat, LCO_DNASC, ');
  DM.qConsultaLocaisColeta.SQL.Add(' c.lco_situacao, c.LCO_CPFCNPJ,c.LCO_BANCO,c.LCO_AGENCIA,c.LCO_CONTA, c.lco_cate,  e.uf_desc AS DescricaoEstado ');
  DM.qConsultaLocaisColeta.SQL.Add('FROM tb_LCOLETA c JOIN tb_UF e ON c.uf_sigla = e.uf_sigla ');
if RG_TipoBusca.ItemIndex = 0
then begin
      DM.qConsultaLocaisColeta.SQL.Add(' WHERE Upper(c.lco_nome) LIKE :NOME');
      DM.qConsultaLocaisColeta.Parameters.ParamByName('NOME').Value := '%' + AnsiUpperCase(Edit1.Text) + '%';
     end else begin
               DM.qConsultaLocaisColeta.SQL.Add(' WHERE Upper(c.lco_cid) LIKE :CIDADE');
               DM.qConsultaLocaisColeta.Parameters.ParamByName('CIDADE').Value :=  '%' + AnsiUpperCase(Edit1.Text) + '%';
              end;
  DM.qConsultaLocaisColeta.SQL.Add(' order by LCO_COD');
  DM.qConsultaLocaisColeta.Open;
end;

end.
