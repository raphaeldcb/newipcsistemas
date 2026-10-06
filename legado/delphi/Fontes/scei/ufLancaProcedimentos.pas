unit ufLancaProcedimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ADODB, Mask,
  DBCtrls, Buttons;

type
  TfLancaProcedimentos = class(TForm)
    Label1: TLabel;
    EdtCodigo: TEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    qConsultaProcedimentos: TADOQuery;
    DS_ConsultaProcedimentos: TDataSource;
    bConsultar: TBitBtn;
    sbFechar: TSpeedButton;
    gbResultado: TGroupBox;
    sbLancar: TSpeedButton;
    pn_Primeiro: TPanel;
    Label2: TLabel;
    DBComboBox1: TDBComboBox;
    pn_Segundo: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBComboBox2: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    pn_Quarto: TPanel;
    LBGENO: TLabel;
    DBComboBoxGenotipo: TDBComboBox;
    pn_Terceiro: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBComboBox3: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    qConsultaProcedimentosPRO_COD: TIntegerField;
    qConsultaProcedimentosPRO_DCAD: TDateField;
    qConsultaProcedimentosPES_COD: TIntegerField;
    qConsultaProcedimentosLAB_COD: TIntegerField;
    qConsultaProcedimentosMED_CRM: TStringField;
    qConsultaProcedimentosEXA_COD: TStringField;
    qConsultaProcedimentosPRO_DCOL: TDateField;
    qConsultaProcedimentosPRO_DENT: TDateField;
    qConsultaProcedimentosPRO_GENO: TStringField;
    qConsultaProcedimentosPRO_VLOG: TBCDField;
    qConsultaProcedimentosPRO_RESUL: TStringField;
    qConsultaProcedimentosPRO_OBS: TStringField;
    qConsultaProcedimentosPRO_UINT: TBCDField;
    qConsultaProcedimentosPRO_CMLI: TBCDField;
    qConsultaProcedimentosPRO_PROT: TStringField;
    qConsultaProcedimentosPRO_APA: TStringField;
    qConsultaProcedimentosPRO_DREC: TDateField;
    qConsultaProcedimentosEXA_COD_1: TStringField;
    qConsultaProcedimentosEXA_DESC: TStringField;
    qConsultaProcedimentosEXA_UNM: TIntegerField;
    qConsultaProcedimentosEXA_SIN: TStringField;
    qConsultaProcedimentosEXA_MET: TStringField;
    qConsultaProcedimentosEXA_VRE: TStringField;
    qConsultaProcedimentosEXA_RECM: TStringField;
    qConsultaProcedimentosEXA_MATE: TStringField;
    qConsultaProcedimentosPES_COD_1: TIntegerField;
    qConsultaProcedimentosPES_NOME: TStringField;
    qConsultaProcedimentosPES_ESCV: TStringField;
    qConsultaProcedimentosPES_IDA: TIntegerField;
    qConsultaProcedimentosPES_SEXO: TStringField;
    qConsultaProcedimentosPES_DNAS: TDateField;
    qConsultaProcedimentosPES_END: TStringField;
    qConsultaProcedimentosPES_CIES: TStringField;
    qConsultaProcedimentosPES_FRES: TStringField;
    qConsultaProcedimentosPES_FCEL: TStringField;
    procedure bConsultarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbLancarClick(Sender: TObject);
    procedure DBEditUNIExit(Sender: TObject);
    procedure DBEditMILTExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLancaProcedimentos: TfLancaProcedimentos;

implementation

uses ufDMI, Math;

{$R *.dfm}

procedure TfLancaProcedimentos.bConsultarClick(Sender: TObject);
begin
if (Trim(EdtCodigo.Text) <> '')
then begin
      qConsultaProcedimentos.Close;
      qConsultaProcedimentos.Parameters.ParamByName('Codigo').Value := EdtCodigo.Text;
      qConsultaProcedimentos.Open;

      if qConsultaProcedimentos.RecordCount <= 0
      then begin
             ShowMessage('Desculpe. Exame não encontrado com esse Código!!!!');
             gbResultado.Enabled := False;
             sbLancar.Enabled   := False;
           end else begin
                     gbResultado.Enabled := True;
                     sbLancar.Enabled    := True;
                     qConsultaProcedimentos.Edit;
                      if (qConsultaProcedimentosEXA_COD.Value = 'HBVd') or (qConsultaProcedimentosEXA_COD.Value = 'HCVd') or (qConsultaProcedimentosEXA_COD.Value = 'HIVd') or  (qConsultaProcedimentosEXA_COD.Value = 'HIVcm')
                      then begin
                            pn_Primeiro.Visible  := True;
                            pn_Segundo.Visible   := True;
                            pn_Terceiro.Visible  := False;
                            pn_Quarto.Visible    := False;
                            DBComboBox1.SetFocus;
                           end;

                      if (qConsultaProcedimentosEXA_COD.Value = 'HBVq') or (qConsultaProcedimentosEXA_COD.Value = 'HIVq')
                      then begin
                            pn_Primeiro.Visible  := False;
                            pn_Segundo.Visible   := True;
                            pn_Terceiro.Visible  := False;
                            pn_Quarto.Visible    := False;
                            DBComboBox2.SetFocus;
                           end;

                      if (qConsultaProcedimentosEXA_COD.Value = 'HCVq')
                      then begin
                            pn_Primeiro.Visible  := False;
                            pn_Segundo.Visible   := False;
                            pn_Terceiro.Visible  := True;
                            pn_Quarto.Visible    := False;
                            DBComboBox3.SetFocus;
                           end;

                      if (qConsultaProcedimentosEXA_COD.Value = 'HCVg')
                      then begin
                            pn_Primeiro.Visible  := False;
                            pn_Segundo.Visible   := False;
                            pn_Terceiro.Visible  := False;
                            pn_Quarto.Visible    := True;
                            DBComboBoxGenotipo.SetFocus;
                           end;
                    end;
       end else begin
                  ShowMessage('Favor informar um número de Exame!');
                  EdtCodigo.SetFocus;
                end;               
end;

procedure TfLancaProcedimentos.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfLancaProcedimentos.sbLancarClick(Sender: TObject);
begin
if MessageDlg(' Confirma o Lançamento do Resultado do Exame? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qConsultaProcedimentos.Post;

      DMI.qStatusProcedimentos.Close;
      DMI.qStatusProcedimentos.Open;
      DMI.qStatusProcedimentos.Append;
      DMI.qStatusProcedimentosPRO_COD.Value    := (qConsultaProcedimentosPRO_COD.Value);
      DMI.qStatusProcedimentosSTP_DATA.Value   := Date;
      DMI.qStatusProcedimentosSTP_STATUS.Value := 3;
      DMI.qStatusProcedimentosSTP_DESC.Value   := 'Resultado foi lançado no sistema';;
      DMI.qStatusProcedimentos.Post;

      ShowMessage('Resultado gravado com Sucesso!!!!');
      EdtCodigo.Text := '';
      EdtCodigo.SetFocus;
      qConsultaProcedimentos.Close;
   end else EdtCodigo.SetFocus;
end;

procedure TfLancaProcedimentos.DBEditUNIExit(Sender: TObject);
begin                                                                   
//  if (DMI.qProcedimentosPRO_UINT.Value > 0)
//  then begin
        qConsultaProcedimentosPRO_VLOG.Value := LogN(10,qConsultaProcedimentosPRO_UINT.Value);
//       end;

end;

procedure TfLancaProcedimentos.DBEditMILTExit(Sender: TObject);
begin
   qConsultaProcedimentosPRO_VLOG.Value := LogN(10,qConsultaProcedimentosPRO_CMLI.Value);
end;

end.
