unit ufRastrearKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DB, ADODB,
  Grids, DBGrids, ComObj, JvExMask, JvToolEdit;

type
  TfRastrearKits = class(TForm)
    EdtRegistro: TEdit;
    BSair: TSpeedButton;
    BProcessar: TSpeedButton;
    qConsultaKits: TADOQuery;
    ds_CionsultaKits: TDataSource;
    DataSource2: TDataSource;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    sbConsultar: TSpeedButton;
    qAtualizaDados: TADOQuery;
    StringField1: TStringField;
    DateField1: TDateField;
    StringField2: TStringField;
    bbtCorreios: TBitBtn;
    qConsultaKitsCOL_COD: TIntegerField;
    qConsultaKitsCOL_NOME: TStringField;
    qConsultaKitsKIT_DENV: TDateField;
    qConsultaKitsKIT_RASTREAR: TStringField;
    DateEdit1: TJvDateEdit;
    procedure BSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure BProcessarClick(Sender: TObject);
    procedure bbtCorreiosClick(Sender: TObject);
    procedure EdtRegistroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRastrearKits: TfRastrearKits;

implementation

uses ufDM;

{$R *.dfm}

procedure TfRastrearKits.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfRastrearKits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.qColetador.Close;
end;

procedure TfRastrearKits.FormShow(Sender: TObject);
begin
  DM.qColetador.Open;
end;

procedure TfRastrearKits.sbConsultarClick(Sender: TObject);
begin
  qConsultaKits.Close;
  qConsultaKits.SQL.Clear;
  qConsultaKits.SQL.Add(' select distinct c.col_cod, c.col_nome, k.kit_denv, k.kit_rastrear from tb_kits k join tb_coletador c on c.col_cod=k.col_cod ');

if DBLookupComboBox1.Text <> ''
then begin
      qConsultaKits.SQL.Add(' and k.col_cod = :Codigo');
      qConsultaKits.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
     end;

if DateEdit1.Text <> '  /  /    '
then begin
      qConsultaKits.SQL.Add(' and k.kit_denv = :Date');
      qConsultaKits.Parameters.ParamByName('Date').Value := DateEdit1.Text;
     end;

  qConsultaKits.Open;
end;

procedure TfRastrearKits.BProcessarClick(Sender: TObject);
begin
if MessageDlg('Confirma a atribuição do Registro de Rastreamento?',mtconfirmation,[mbyes,mbno],0) = mryes
then begin
      qAtualizaDados.Close;
      qAtualizaDados.Parameters.ParamByName('Registro').Value  := EdtRegistro.Text;
      qAtualizaDados.Parameters.ParamByName('DataEnvio').Value := qConsultaKitsKIT_DENV.Value;
      qAtualizaDados.Parameters.ParamByName('Coletador').Value := qConsultaKitsCOL_COD.Value;
      qAtualizaDados.ExecSQL;

      ShowMessage('Informações a atualizada com sucesso!!!!');
      BProcessar.Enabled := False;
      sbConsultar.Click;
     end;
end;

procedure TfRastrearKits.bbtCorreiosClick(Sender: TObject);
var IEApp : Variant;
begin
if (qConsultaKitsKIT_RASTREAR.Value = '')
then begin
      ShowMessage('Não é possível verificar o andamento da entrega, pois, não existe número para rastreamento!!');
     end else begin
                IEApp := CreateOLEObject('InternetExplorer.Application');
                IEApp.visible := true;
                IEApp.Navigate('http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&amp;P_TIPO=001&amp;P_COD_UNI=' + trim(qConsultaKitsKIT_RASTREAR.Value));
     //               WinExec(PChar('http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&amp;P_TIPO=001&amp;P_COD_UNI=' + trim(qProcessoCPGPRO_RASTREAR.Value)), SW_SHOW);
              end;
end;

procedure TfRastrearKits.EdtRegistroExit(Sender: TObject);
begin
 BProcessar.Enabled := True;
end;

end.
