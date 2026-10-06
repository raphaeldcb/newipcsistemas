unit ufConsultaLaboratorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons;

type
  TfConsultaLaboratorios = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BLancarResultado: TBitBtn;
    BLimpar: TBitBtn;
    BSair: TBitBtn;
    Label2: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BLancarResultadoClick(Sender: TObject);
    procedure BLimparClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
      Tela, VemdeOnde: String;
      CodigoProduto : Integer;
    { Public declarations }
  end;

var
  fConsultaLaboratorios: TfConsultaLaboratorios;


implementation

uses ufDMI, Math, ufProcedimentos, ufPacientes,
  ufLaboratorios;

{$R *.dfm}

procedure TfConsultaLaboratorios.Edit1Change(Sender: TObject);
var LETRA : String;
begin
VemdeOnde := 'Menu';
if (VemdeOnde = 'Procedimentos')
then begin
      LETRA := '%' + Edit1.Text + '%';
      DMI.qConsultaLaboratorios.Close;
      DMI.qConsultaLaboratorios.SQL.clear;
      DMI.qConsultaLaboratorios.SQl.add(' Select * from');
      DMI.qConsultaLaboratorios.SQl.add(' TB_LABORATORIOS ');
      DMI.qConsultaLaboratorios.SQl.add(' Where LAB_NOME LIKE :LETRA');
      DMI.qConsultaLaboratorios.SQl.add('order by LAB_NOME');
      DMI.qConsultaLaboratorios.Parameters.ParamByName('LETRA').Value:= LETRA;
      DMI.qConsultaLaboratorios.Open;
     end;
if (VemdeOnde = 'Menu')
then begin
      LETRA := '%' + Edit1.Text + '%';
      DMI.qConsultaLaboratorios.Close;
      DMI.qConsultaLaboratorios.SQL.clear;
      DMI.qConsultaLaboratorios.SQl.add(' Select * from');
      DMI.qConsultaLaboratorios.SQl.add(' TB_LABORATORIOS ');
      DMI.qConsultaLaboratorios.SQl.add(' Where LAB_LABT LIKE :LETRA');
      DMI.qConsultaLaboratorios.SQl.add('order by LAB_LABT');
      DMI.qConsultaLaboratorios.Parameters.ParamByName('LETRA').Value:= LETRA;
      DMI.qConsultaLaboratorios.Open;
     end;
end;

procedure TfConsultaLaboratorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DMI.qLaboratorios.Open;
 DMI.qConsultaLaboratorios.Open;
end;

procedure TfConsultaLaboratorios.FormShow(Sender: TObject);
begin
 DMI.qLaboratorios.Open;
 DMI.qConsultaLaboratorios.Close;
 DMI.qConsultaLaboratorios.Open;
 Edit1.SetFocus;
end;

procedure TfConsultaLaboratorios.BLancarResultadoClick(Sender: TObject);
begin

if (VemdeOnde = 'Menu')
then begin
      if DMI.qLaboratorios.Locate('LAB_COD', DMI.qConsultaLaboratoriosLAB_COD.Value, []) = True
      then begin
             Application.CreateForm(TfLaboratorios,fLaboratorios);
             fLaboratorios.ShowModal;
             fLaboratorios.Free;
           end;
     end else begin
                if (VemdeOnde = 'Procedimentos')
                then begin
                      DMI.qProcedimentos.Edit;
                      DMI.qProcedimentosLAB_COD.Value := DMI.qConsultaLaboratoriosLAB_COD.Value;
                      Close;
                     end;
              end;
VemdeOnde := '';
Close;
end;



procedure TfConsultaLaboratorios.BLimparClick(Sender: TObject);
begin
 Edit1.Clear;
 Edit1.SetFocus;
end;

procedure TfConsultaLaboratorios.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaLaboratorios.DBGrid1DblClick(Sender: TObject);
begin
if (VemdeOnde = 'Menu')
then begin
      if DMI.qLaboratorios.Locate('LAB_COD', DMI.qConsultaLaboratoriosLAB_COD.Value, []) = True
      then begin
             Application.CreateForm(TfLaboratorios,fLaboratorios);
             fLaboratorios.ShowModal;
             fLaboratorios.Free;
           end;
     end else begin
                if (VemdeOnde = 'Procedimentos')
                then begin
                      DMI.qProcedimentos.Edit;
                      DMI.qProcedimentosLAB_COD.Value := DMI.qConsultaLaboratoriosLAB_COD.Value;
                      Close;
                     end;
              end;
VemdeOnde := '';
Close;
end;

end.


