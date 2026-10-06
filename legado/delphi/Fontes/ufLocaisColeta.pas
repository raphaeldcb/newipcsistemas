unit ufLocaisColeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask, ComCtrls, ADODB, JvExMask,
  JvToolEdit, JvDBControls, JvExStdCtrls, JvCombobox, JvDBCombobox,
  JvExControls, JvDBLookup;

type
  TfLocaisColeta = class(TfPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBDateEdit1: TJvDBDateEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBDateEdit2: TJvDBDateEdit;
    qDataKits: TADOQuery;
    qDataKitsDATA_ENVIO: TDateField;
    qDataRecepcao: TADOQuery;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    DBDateEdit3: TJvDBDateEdit;
    ds_DataKits: TDataSource;
    ds_DataRecepcao: TDataSource;
    Label18: TLabel;
    DBDateEdit4: TJvDBDateEdit;
    bbtChamaColetadoresRelatorios: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    bbtChamaKits: TSpeedButton;
    Label21: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    Label22: TLabel;
    DBDateEdit5: TJvDBDateEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit15: TDBEdit;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    Label26: TLabel;
    DBEdit17: TDBEdit;
    Label27: TLabel;
    DBEdit14: TDBEdit;
    Label29: TLabel;
    sbVisualizar: TSpeedButton;
    RxDBComboBoxCate: TJvDBComboBox;
    JvDBLookupComboBANCO: TJvDBLookupCombo;
    Label28: TLabel;
    DBEdit18: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
    procedure bbtPrimeiroClick(Sender: TObject);
    procedure bbtAnteriorClick(Sender: TObject);
    procedure bbtProximoClick(Sender: TObject);
    procedure bbtUltimoClick(Sender: TObject);
    procedure bbtChamaColetadoresRelatoriosClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtChamaKitsClick(Sender: TObject);
    procedure sbVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLocaisColeta: TfLocaisColeta;

implementation

uses ufDM, ufConsultaLocaisColeta, ufColetadoresRelatorios,
  ufColetadoresKits, ufProcesso, ufLocaisColetaComprovantes;

{$R *.dfm}


 
procedure TfLocaisColeta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qLocalColeta.Open;
DM.qUF.Open;
end;

procedure TfLocaisColeta.FormShow(Sender: TObject);
begin
  inherited;
DM.qLocalColeta.Open;
DM.qUF.Open;
DM.qBanco.Open;

qDataKits.Close;
qDataKits.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataKits.Open;

qDataRecepcao.Close;
qDataRecepcao.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataRecepcao.Open;

end;

procedure TfLocaisColeta.BNovoClick(Sender: TObject);
var proximo:integer;
begin
  DM.qMaxLocalColeta.Close;
  DM.qMaxLocalColeta.Open;
  Proximo:=DM.qMaxLocalColetaMAX.Value + 1;
  inherited;
  DM.qLocalColetaLCO_COD.Value  := Proximo;
  DM.qLocalColetaLCO_DCAD.Value := Date;
  DBEdit2.SetFocus;
end;

procedure TfLocaisColeta.BEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Enabled := False;
  DBEdit2.SetFocus;
end;

procedure TfLocaisColeta.BSalvarClick(Sender: TObject);
begin
  DBEdit2.Enabled := True;
  inherited;
end;

procedure TfLocaisColeta.BCancelarClick(Sender: TObject);
begin
  DBEdit2.Enabled := True;
  inherited;
end;

procedure TfLocaisColeta.BCnsultarClick(Sender: TObject);
begin
  inherited;
 Application.CreateForm(TfConsultaLocaisColetas, fConsultaLocaisColetas);
 fConsultaLocaisColetas.ShowModal;
 fConsultaLocaisColetas.Free;

 qDataKits.Close;
 qDataKits.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
 qDataKits.Open;

 qDataRecepcao.Close;
 qDataRecepcao.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
 qDataRecepcao.Open;
end;

procedure TfLocaisColeta.bbtPrimeiroClick(Sender: TObject);
begin
  inherited;
qDataKits.Close;
qDataKits.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataKits.Open;

qDataRecepcao.Close;
qDataRecepcao.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataRecepcao.Open;

end;

procedure TfLocaisColeta.bbtAnteriorClick(Sender: TObject);
begin
  inherited;
qDataKits.Close;
qDataKits.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataKits.Open;

qDataRecepcao.Close;
qDataRecepcao.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataRecepcao.Open;

end;

procedure TfLocaisColeta.bbtProximoClick(Sender: TObject);
begin
  inherited;
qDataKits.Close;
qDataKits.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataKits.Open;

qDataRecepcao.Close;
qDataRecepcao.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataRecepcao.Open;

end;

procedure TfLocaisColeta.bbtUltimoClick(Sender: TObject);
begin
  inherited;
qDataKits.Close;
qDataKits.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataKits.Open;

qDataRecepcao.Close;
qDataRecepcao.Parameters.ParamByName('Coletador').Value := DM.qLocalColetaLCO_COD.Value;
qDataRecepcao.Open;

end;

procedure TfLocaisColeta.bbtChamaColetadoresRelatoriosClick(
  Sender: TObject);
begin
  inherited;
   if dsp.DataSet.State in [dsinsert, dsedit]
   then begin
         ShowMessage('Salve a alteração/inclusão que está sendo realizada no momento!');
        end else begin
                  Application.CreateForm(TfColetadoresRelatorios, fColetadoresRelatorios);
                  fColetadoresRelatorios.ShowModal;
                  fColetadoresRelatorios.Free;
                 end;

end;

procedure TfLocaisColeta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
      case Key of
        VK_F11     :   bbtChamaColetadoresRelatorios.Click;
        VK_F10     :   bbtChamaKits.Click;
      end;

end;

procedure TfLocaisColeta.bbtChamaKitsClick(Sender: TObject);
begin
  inherited;
   if dsp.DataSet.State in [dsinsert, dsedit]
   then begin
         ShowMessage('Salve a alteração/inclusão que está sendo realizada no momento!');
        end else begin
                  Application.CreateForm(TfColetadoresKits, fColetadoresKits);
                  fColetadoresKits.ShowModal;
                  fColetadoresKits.Free;
                 end;
end;

procedure TfLocaisColeta.sbVisualizarClick(Sender: TObject);
begin
 Application.CreateForm(TfLocaisColetaComprovante, fLocaisColetaComprovante);
 fLocaisColetaComprovante.showmodal;
 fLocaisColetaComprovante.Free;
 inherited;

end;

end.
