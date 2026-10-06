unit ufConsultaGeralInf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Menus, DB, ADODB;

type
  TfConsultaGeralInf = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    BSair: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BCadastro: TBitBtn;
    qIncluiProtocolo: TADOQuery;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
      Tela : String;
      CodigoProduto : Integer;
    { Public declarations }
  end;

var
  fConsultaGeralInf: TfConsultaGeralInf;
    Sequencial, AnoS : String;

implementation

uses ufDMI, Math, ufProcedimentos, ufLancaProcedimentos, ufDM,
  ufConsultaLaboratorios;

{$R *.dfm}

procedure TfConsultaGeralInf.Edit1Change(Sender: TObject);
var LETRA : String;
begin
//  LETRA := '%' + Edit1.Text + '%';
  LETRA := Edit1.Text + '%';
  DMI.qConsultaProcedimentos.Close;
  DMI.qConsultaProcedimentos.SQL.clear;
  DMI.qConsultaProcedimentos.SQl.add(' Select * from');
  DMI.qConsultaProcedimentos.SQl.add(' tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
  DMI.qConsultaProcedimentos.SQl.add(' JOIN tb_exames e ON pr.exa_cod = e.exa_cod ');
  DMI.qConsultaProcedimentos.SQl.add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
  DMI.qConsultaProcedimentos.SQl.add(' Where pa.PES_NOME LIKE :LETRA');
  DMI.qConsultaProcedimentos.SQl.add(' order by pa.PES_NOME');
  DMI.qConsultaProcedimentos.Parameters.ParamByName('LETRA').Value:= LETRA;
  DMI.qConsultaProcedimentos.Open;
end;

procedure TfConsultaGeralInf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// DMI.qProcedimentos.Close;
// DMI.qConsultaProcedimentos.Close;
end;

procedure TfConsultaGeralInf.FormShow(Sender: TObject);
begin
 DMI.qProcedimentos.Open;
 DMI.qConsultaProcedimentos.Open;
 Edit1.SetFocus;
end;

procedure TfConsultaGeralInf.Edit2Change(Sender: TObject);
var CODIGO : String;
begin
  CODIGO := Edit2.Text +'%';
  DMI.qConsultaProcedimentos.Close;
  DMI.qConsultaProcedimentos.SQL.clear;
  DMI.qConsultaProcedimentos.SQl.add(' Select * from');
  DMI.qConsultaProcedimentos.SQl.add(' tb_PROCEDIMENTOS pr JOIN tb_PACIENTES pa ON pr.pes_cod = pa.pes_cod ');
  DMI.qConsultaProcedimentos.SQl.add(' JOIN tb_exames e ON pr.exa_cod = e.exa_cod ');
  DMI.qConsultaProcedimentos.SQl.add(' JOIN tb_laboratorios l ON pr.lab_cod = l.lab_cod ');
  DMI.qConsultaProcedimentos.SQl.add(' Where pr.PRO_COD LIKE :PRO_COD');
  DMI.qConsultaProcedimentos.SQl.add('order by pr.PRO_COD');
  DMI.qConsultaProcedimentos.Parameters.ParamByName('PRO_COD').Value:= CODIGO;
  DMI.qConsultaProcedimentos.Open;
end;

procedure TfConsultaGeralInf.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaGeralInf.DBGrid1DblClick(Sender: TObject);
begin
 if DMI.qProcedimentos.Locate('PRO_COD', DMI.qConsultaProcedimentosPRO_COD.Value, []) = True
 then begin
        Close;
      end;

end;

end.
