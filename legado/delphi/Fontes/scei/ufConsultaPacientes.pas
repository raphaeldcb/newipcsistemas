unit ufConsultaPacientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TfConsultaPacientes = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BLancarResultado: TBitBtn;
    BLimpar: TBitBtn;
    BSair: TBitBtn;
    BCadastro: TBitBtn;
    Label2: TLabel;
    bNovo: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BLancarResultadoClick(Sender: TObject);
    procedure BLimparClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure BCadastroClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
      Tela : String;
      CodigoProduto : Integer;
    { Public declarations }
  end;

var
  fConsultaPacientes: TfConsultaPacientes;

implementation

uses ufDMI, Math, ufProcedimentos, ufPacientes;

{$R *.dfm}

procedure TfConsultaPacientes.Edit1Change(Sender: TObject);
var LETRA : String;
begin
//  LETRA := '%' + Edit1.Text + '%';
  LETRA := Edit1.Text + '%';
  DMI.qConsultaPacientes.Close;
  DMI.qConsultaPacientes.SQL.clear;
  DMI.qConsultaPacientes.SQl.add(' Select * from');
  DMI.qConsultaPacientes.SQl.add(' tb_PACIENTES ');
  DMI.qConsultaPacientes.SQl.add(' Where PES_NOME LIKE :LETRA');
  DMI.qConsultaPacientes.SQl.add('order by PES_NOME');
  DMI.qConsultaPacientes.Parameters.ParamByName('LETRA').Value:= LETRA;
  DMI.qConsultaPacientes.Open;
end;

procedure TfConsultaPacientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DMI.qPacientes.Open;
 DMI.qConsultaProcedimentos.Open;
end;

procedure TfConsultaPacientes.FormShow(Sender: TObject);
begin
 DMI.qPacientes.Open;
 DMI.qConsultaProcedimentos.Open;
 Edit1.SetFocus;
end;

procedure TfConsultaPacientes.BLancarResultadoClick(Sender: TObject);
begin
 DMI.qProcedimentos.Edit;
 DMI.qProcedimentosPES_COD.Value := DMI.qConsultaPacientesPES_COD.Value;
 Close;
end;



procedure TfConsultaPacientes.BLimparClick(Sender: TObject);
begin
 Edit1.Clear;
 Edit1.SetFocus;
end;

procedure TfConsultaPacientes.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaPacientes.BCadastroClick(Sender: TObject);
begin
 DMI.qPacientes.Open;
 Application.CreateForm(TfPacientes, fPacientes);
 DMI.qPacientes.Edit;
 if DMI.qPacientes.Locate('PES_COD', DMI.qConsultaPacientesPES_COD.Value, []) = True
 then begin
       fPacientes.Showmodal;
       fPacientes.Free;
       DMI.qPacientes.Close;
       DMI.qPacientes.Open;
       DMI.qConsultaPacientes.Close;
       DMI.qConsultaPacientes.Open;
      end;
end;

procedure TfConsultaPacientes.DBGrid1DblClick(Sender: TObject);
begin
 DMI.qProcedimentos.Edit;
 DMI.qProcedimentosPES_COD.Value := DMI.qConsultaPacientesPES_COD.Value;
 Close;
end;

procedure TfConsultaPacientes.bNovoClick(Sender: TObject);
begin
 DMI.qPacientes.Open;
 Application.CreateForm(TfPacientes, fPacientes);
 fPacientes.Showmodal;
 fPacientes.Free;
 DMI.qConsultaPacientes.Close;
 DMI.qConsultaPacientes.Open;
end;

end.

