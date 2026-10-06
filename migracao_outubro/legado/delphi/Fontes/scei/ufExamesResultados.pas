unit ufExamesResultados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, Math;

type
  TfProcedimentosResultados = class(TfPadrao)
    DBCB_Resultado: TDBComboBox;
    Label1: TLabel;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    procedure BNovoClick(Sender: TObject);
    procedure DBCB_ResultadoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fProcedimentosResultados: TfProcedimentosResultados;

implementation

uses ufDMI, ufProcedimentos;

{$R *.dfm}

procedure TfProcedimentosResultados.BNovoClick(Sender: TObject);
begin
 inherited;
 DMI.qProcedimentos_ResultadoPRO_COD.Value  := DMI.qProcedimentosPRO_COD.Value;
 DBCB_Resultado.SetFocus;

end;

procedure TfProcedimentosResultados.DBCB_ResultadoExit(Sender: TObject);
begin

if not ((DMI.qProcedimentosEXA_COD.Value = 'HBVq') or (DMI.qProcedimentosEXA_COD.Value = 'HCVq') or (DMI.qProcedimentosEXA_COD.Value = 'HIVq'))
then begin
      DBEdit11.Enabled := False;
      DBEdit7.Enabled  := False;
      DBEdit9.Enabled  := False;
      Label17.Enabled  := False;
      Label10.Enabled  := False;
      Label16.Enabled  := False;
     end else begin
                DBEdit11.Enabled := True;
                DBEdit7.Enabled  := True;
                DBEdit9.Enabled  := True;
                Label17.Enabled  := True;
                Label10.Enabled  := True;
                Label16.Enabled  := True;

                if ((DMI.qProcedimentosEXA_COD.Value = 'HBVq') and (DMI.qProcedimentos_ResultadoPRO_RESUL.Value = 'DETECTADO'))
                then begin
                      DMI.qProcedimentos_ResultadoPRO_VLOG.Value := 3.072289157;
                      DMI.qProcedimentos_ResultadoPRO_CMLI.Value := Power(10,DMI.qProcedimentos_ResultadoPRO_VLOG.Value);
                      DMI.qProcedimentos_ResultadoPRO_UINT.Value := DMI.qProcedimentos_ResultadoPRO_CMLI.Value/5.82;
                     end;
                if ((DMI.qProcedimentosEXA_COD.Value = 'HCVq') and (DMI.qProcedimentos_ResultadoPRO_RESUL.Value = 'DETECTADO'))
                then begin
                      DMI.qProcedimentos_ResultadoPRO_VLOG.Value := 3.313253012;
                      DMI.qProcedimentos_ResultadoPRO_CMLI.Value := Power(10,DMI.qProcedimentos_ResultadoPRO_VLOG.Value);;
                      DMI.qProcedimentos_ResultadoPRO_UINT.Value := DMI.qProcedimentos_ResultadoPRO_CMLI.Value/1.05;
                     end;
                if ((DMI.qProcedimentosEXA_COD.Value = 'HIVq') and (DMI.qProcedimentos_ResultadoPRO_RESUL.Value = 'DETECTADO'))
                then begin
                      DMI.qProcedimentos_ResultadoPRO_VLOG.Value := 3.915662651;
                      DMI.qProcedimentos_ResultadoPRO_CMLI.Value := Power(10,DMI.qProcedimentos_ResultadoPRO_VLOG.Value);
                      DMI.qProcedimentos_ResultadoPRO_UINT.Value := DMI.qProcedimentos_ResultadoPRO_CMLI.Value/1.05;
                     end;
              end;
  inherited;
end;

end.
