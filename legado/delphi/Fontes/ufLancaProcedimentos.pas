unit ufLancaProcedimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RxDBComb, ExtCtrls, Grids, DBGrids, DB, ADODB, Mask,
  DBCtrls, Buttons;

type
  TfLancaResultadosPaternidade = class(TForm)
    Label1: TLabel;
    EdtNumeroPericia: TEdit;
    pResultado: TPanel;
    Label12: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    qPessoas: TADOQuery;
    qPessoasPRO_UNID: TStringField;
    qPessoasPRO_COD: TIntegerField;
    qPessoasPES_COD: TIntegerField;
    qPessoasPES_NOME: TStringField;
    qPessoasPES_SIT: TIntegerField;
    qPessoasPES_DTNAS: TDateField;
    qPessoasPES_LCNAS: TStringField;
    qPessoasPES_SEXO: TStringField;
    qPessoasPES_TDOC: TStringField;
    qPessoasPES_NDOC: TStringField;
    DS_Pessoas: TDataSource;
    qConsultaExamesPaternidade: TADOQuery;
    qConsultaExamesPaternidadePRO_UNID: TStringField;
    qConsultaExamesPaternidadePRO_COD: TIntegerField;
    qConsultaExamesPaternidadePRO_NPERC: TStringField;
    qConsultaExamesPaternidadePRO_TIPO: TIntegerField;
    qConsultaExamesPaternidadePRO_AUTO: TStringField;
    qConsultaExamesPaternidadeUF_SIGLA: TStringField;
    qConsultaExamesPaternidadeCAS_CODIGO: TStringField;
    qConsultaExamesPaternidadeCOM_COD: TIntegerField;
    qConsultaExamesPaternidadeVAR_COD: TIntegerField;
    qConsultaExamesPaternidadePRO_DCOLE: TDateField;
    qConsultaExamesPaternidadePRO_DRESU: TDateField;
    qConsultaExamesPaternidadePRO_RESUL: TIntegerField;
    qConsultaExamesPaternidadePRO_PAGAM: TStringField;
    qConsultaExamesPaternidadeJUI_COD: TIntegerField;
    qConsultaExamesPaternidadeLAB_COD: TSmallintField;
    qConsultaExamesPaternidadePRO_EXA: TIntegerField;
    qConsultaExamesPaternidadeSBC_CODIGO: TIntegerField;
    qConsultaExamesPaternidadePRO_FOLHA: TStringField;
    qConsultaExamesPaternidadePRO_MUT: TStringField;
    qConsultaExamesPaternidadePRO_PARC: TIntegerField;
    qConsultaExamesPaternidadeCAS_CONTR: TIntegerField;
    qConsultaExamesPaternidadeCAS_CODIGO_1: TStringField;
    qConsultaExamesPaternidadeCAS_DESC: TStringField;
    qConsultaExamesPaternidadeCAS_VLRIM: TBCDField;
    qConsultaExamesPaternidadeCAS_SIG: TStringField;
    qConsultaExamesPaternidadeCAS_CAM: TStringField;
    qConsultaExamesPaternidadeCAS_VLRWB: TBCDField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DS_ConsultaExamesPaternidade: TDataSource;
    bConsultar: TBitBtn;
    sbLancar: TSpeedButton;
    sbFechar: TSpeedButton;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    procedure bConsultarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbLancarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLancaResultadosPaternidade: TfLancaResultadosPaternidade;

implementation

uses ufDM, Math;

{$R *.dfm}

procedure TfLancaResultadosPaternidade.bConsultarClick(Sender: TObject);
begin
qConsultaExamesPaternidade.Close;
qConsultaExamesPaternidade.Parameters.ParamByName('Pericia').Value := EdtNumeroPericia.Text;
qConsultaExamesPaternidade.Open;

if qConsultaExamesPaternidade.RecordCount <= 0
then begin
       ShowMessage('Desculpe. Perícia não encontrada com esse Código!!!!');
       pResultado.Enabled := False;
       sbLancar.Enabled   := False;
     end else begin
               qPessoas.Open;
               pResultado.Enabled := True;
               sbLancar.Enabled   := True;
               ComboBox1.SetFocus;
              end;
end;

procedure TfLancaResultadosPaternidade.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfLancaResultadosPaternidade.sbLancarClick(Sender: TObject);
begin
if MessageDlg(' Confirma o Lançamento do Resultado do Exame de Paternidade? ',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qConsultaExamesPaternidade.Edit;
      if ComboBox1.ItemIndex = 0
      then begin
            qConsultaExamesPaternidadePRO_RESUL.Value := 1;
           end else qConsultaExamesPaternidadePRO_RESUL.Value := 2;
      if CheckBox1.Checked = True
      then begin
            qConsultaExamesPaternidadePRO_MUT.Value := 'Sim';
           end else qConsultaExamesPaternidadePRO_MUT.Value := 'Não';

      qConsultaExamesPaternidade.Post;
      ShowMessage('Resultado gravado com Sucesso!!!!');
      EdtNumeroPericia.Text := '';
      EdtNumeroPericia.SetFocus;
      qConsultaExamesPaternidade.Close;
      qPessoas.Close;
      ComboBox1.ItemIndex := -1;
      CheckBox1.Checked := False;
      pResultado.Enabled := False;
      sbLancar.Enabled   := False;
   end else EdtNumeroPericia.SetFocus;
end;

end.
