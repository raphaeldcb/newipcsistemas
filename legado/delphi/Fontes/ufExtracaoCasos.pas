unit ufExtracaoCasos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, StdCtrls,
  DBCtrls, Mask, ADODB, JvExMask, JvToolEdit, JvDBControls;

type
  TfExtracaoCasos = class(TfPadrao)
    qConsultaAlelos: TADOQuery;
    ds_Alelos: TDataSource;
    qConsultaAlelosCOD_ALE: TIntegerField;
    qConsultaAlelosNM1_ALE: TStringField;
    qConsultaAlelosNM2_ALE: TStringField;
    qConsultaAlelosNM3_ALE: TStringField;
    qConsultaAlelosNM4_ALE: TStringField;
    qConsultaAlelosMAR_ALE: TStringField;
    qConsultaAlelosAL1_ALE: TStringField;
    qConsultaAlelosAL2_ALE: TStringField;
    qConsultaAlelosORD_ALE: TIntegerField;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    DBEdit12: TDBEdit;
    DBDateEdit1: TJvDBDateEdit;
    DBEdit11: TDBEdit;
    DBGrid2: TDBGrid;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBEdit2: TDBEdit;
    DBDateEdit2: TJvDBDateEdit;
    DBCheckBox8: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup7: TDBRadioGroup;
    DBEdit1: TDBEdit;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBRadioGroup14: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    DBEdit3: TDBEdit;
    DBDateEdit3: TJvDBDateEdit;
    DBEdit4: TDBEdit;
    procedure DBEdit12Exit(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExtracaoCasos: TfExtracaoCasos;

implementation

uses ufDM, fUserValidaExtracao;

{$R *.dfm}

procedure TfExtracaoCasos.DBEdit12Exit(Sender: TObject);
begin
qConsultaAlelos.Close;
qConsultaAlelos.Parameters.ParamByName('Numero').Value := DM.qExtracaoCasosPRO_COD.Value;
qConsultaAlelos.Open;

end;

procedure TfExtracaoCasos.BNovoClick(Sender: TObject);
begin
  inherited;
  DM.qExtracaoCasosSUP_DATA.Value       := Date;
  DM.qExtracaoCasosANA_DTLEIT.Value     := Date;
  DM.qExtracaoCasosANA_OUANADATA.Value  := Date;
  DM.qExtracaoCasosMPEA_LOTE.Value      := DM.qExtracaoMPEA_LOTE.Value;
  DBEdit5.SetFocus;
end;

procedure TfExtracaoCasos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
DM.qExtracaoCasos.Close;
end;

procedure TfExtracaoCasos.FormShow(Sender: TObject);
begin
  inherited;
DM.qExtracaoCasos.Open;

end;

procedure TfExtracaoCasos.DBEdit11Enter(Sender: TObject);
begin
if (dm.qExtracaoCasosANA_RESCONF.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoCasosANA_RESCONF.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;

end;

procedure TfExtracaoCasos.DBEdit2Enter(Sender: TObject);
begin
if (dm.qExtracaoCasosANA_OUANARESP.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoCasosANA_OUANARESP.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;

end;

procedure TfExtracaoCasos.DBEdit3Enter(Sender: TObject);
begin
if (dm.qExtracaoCasosSUP_SUPER.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoCasosSUP_SUPER.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;
end;

end.
