unit ufConsultaEnderecos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TfConsultaEnderecos = class(TForm)
    DBGrid1: TDBGrid;
    BLimpar: TBitBtn;
    BSair: TBitBtn;
    BDados: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DS_ConsultaJuiz: TDataSource;
    qConsultaEnderecos: TADOQuery;
    qConsultaEnderecosEND_COD: TIntegerField;
    qConsultaEnderecosEND_LOC: TStringField;
    qConsultaEnderecosEND_NMR: TStringField;
    qConsultaEnderecosEND_BAI: TStringField;
    qConsultaEnderecosEND_END: TStringField;
    qConsultaEnderecosEND_CID: TStringField;
    qConsultaEnderecosEND_CEP: TStringField;
    qConsultaEnderecosUF_SIGLA: TStringField;
    qConsultaEnderecosEND_TRATA: TStringField;
    bbtSelecionar: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BLimparClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure BDadosClick(Sender: TObject);
    procedure bbtSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
      Tela : String;
    { Public declarations }
  end;

var
  fConsultaEnderecos: TfConsultaEnderecos;

implementation

uses ufDM, ufJuiz, ufEnderecos, ufCorrespondencia;



{$R *.dfm}

procedure TfConsultaEnderecos.Edit1Change(Sender: TObject);
var LETRA : String;
begin
//  LETRA := '%' + Edit1.Text + '%';
  LETRA := '%' + Edit1.Text + '%';
  qConsultaEnderecos.Close;
  qConsultaEnderecos.SQL.clear;
  qConsultaEnderecos.SQl.add('Select * ');
  qConsultaEnderecos.SQl.add('From tb_Enderecos');
  qConsultaEnderecos.SQl.add('Where END_NMR LIKE :LETRA');
  qConsultaEnderecos.SQl.add('order by END_NMR');
  qConsultaEnderecos.Parameters.ParamByName('LETRA').Value:= LETRA;
  qConsultaEnderecos.Open;
end;

procedure TfConsultaEnderecos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 qConsultaEnderecos.Close;
end;

procedure TfConsultaEnderecos.FormShow(Sender: TObject);
begin
 qConsultaEnderecos.Open;
 Edit1.SetFocus;
end;

procedure TfConsultaEnderecos.BLimparClick(Sender: TObject);
begin
 Edit1.Clear;
 Edit1.SetFocus;
end;

procedure TfConsultaEnderecos.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaEnderecos.BDadosClick(Sender: TObject);
begin
 DM.qEnderecos.Open;
 Application.CreateForm(TfEnderecos, fEnderecos);
 DM.qEnderecos.Edit;
 if DM.qEnderecos.Locate('END_COD', qConsultaEnderecosEND_COD.Value, []) = True
 then begin
       fEnderecos.Showmodal;
       fEnderecos.Free;
       qConsultaEnderecos.Close;
       qConsultaEnderecos.Open;
      end;
end;

procedure TfConsultaEnderecos.bbtSelecionarClick(Sender: TObject);
begin
 DM.qEnderecos.Open;
 if Tela = 'Envio'
 then begin
        DM.qCorrespondencia.Edit;
        DM.qCorrespondenciaEND_COD.Value := qConsultaEnderecosEND_COD.Value;
        fConsultaEnderecos.Close;
      end;
end;

end.



