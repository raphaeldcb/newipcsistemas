unit ufConsultaJuiz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ADODB;

type
  TfConsultaJuizes = class(TForm)
    DBGrid1: TDBGrid;
    BLimpar: TBitBtn;
    BSair: TBitBtn;
    BDados: TBitBtn;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    DS_ConsultaJuiz: TDataSource;
    qConsultaJuiz: TADOQuery;
    qConsultaJuizJUI_COD: TIntegerField;
    qConsultaJuizJUI_DESC: TStringField;
    qConsultaJuizJUI_SEXO: TStringField;
    BAproveitaCadastro: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BLimparClick(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure BDadosClick(Sender: TObject);
    procedure BAproveitaCadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
      Tela : String;
      CodigoProduto : Integer;
    { Public declarations }
  end;

var
  fConsultaJuizes: TfConsultaJuizes;

implementation

uses ufDM, ufJuiz, ufProcesso, ufDMI;



{$R *.dfm}

procedure TfConsultaJuizes.Edit1Change(Sender: TObject);
var LETRA : String;
begin
//  LETRA := '%' + Edit1.Text + '%';
  LETRA := '%' + Edit1.Text + '%';
  qConsultaJuiz.Close;
  qConsultaJuiz.SQL.clear;
  qConsultaJuiz.SQl.add('Select * ');
  qConsultaJuiz.SQl.add('From tb_Juiz');
  qConsultaJuiz.SQl.add('Where JUI_DESC LIKE :LETRA');
  qConsultaJuiz.SQl.add('order by JUI_DESC');
  qConsultaJuiz.Parameters.ParamByName('LETRA').Value:= LETRA;
  qConsultaJuiz.Open;
end;

procedure TfConsultaJuizes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 qConsultaJuiz.Close;
end;

procedure TfConsultaJuizes.FormShow(Sender: TObject);
begin
 qConsultaJuiz.Open;
 Edit1.SetFocus;
end;

procedure TfConsultaJuizes.BLimparClick(Sender: TObject);
begin
 Edit1.Clear;
 Edit1.SetFocus;
end;

procedure TfConsultaJuizes.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaJuizes.BDadosClick(Sender: TObject);
begin
 DM.qJuiz.Open;
 Application.CreateForm(TfJuiz, fJuiz);
 DM.qJuiz.Edit;
 if DM.qJuiz.Locate('JUI_COD', qConsultaJuizJUI_COD.Value, []) = True
 then begin
       fJuiz.Showmodal;
       fJuiz.Free;
       qConsultaJuiz.Close;
       qConsultaJuiz.Open;
      end;
end;

procedure TfConsultaJuizes.BAproveitaCadastroClick(Sender: TObject);
begin
if (Tela = 'Menu')
then begin
       if DM.qJuiz.Locate('JUI_COD', qConsultaJuizJUI_COD.Value, []) = True
       then begin
             fJuiz.Showmodal;
             fJuiz.Free;
             qConsultaJuiz.Close;
             qConsultaJuiz.Open;
            end;
     end else begin
                if (Tela = 'Processos')
                then begin
                      fProcessos.qProcessoCPG.Edit;
                      fProcessos.qProcessoCPGJUI_COD.Value := qConsultaJuizJUI_COD.Value;
                      Close;
                     end;
              end;
Tela := '';
Close;
end;

end.
