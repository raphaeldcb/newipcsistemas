unit ufExtracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, Buttons, ExtCtrls, DBCtrls,
  StdCtrls, Mask, JvExMask, JvToolEdit, JvDBControls;

type
  TfExtracao = class(TfPadrao)
    DBDateEdit5: TJvDBDateEdit;
    Label20: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    DBEdit9: TDBEdit;
    Label7: TLabel;
    DBEdit10: TDBEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    DBDateEdit1: TJvDBDateEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    Label11: TLabel;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    DBDateEdit2: TJvDBDateEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    bbtCasos: TBitBtn;
    Label23: TLabel;
    Label26: TLabel;
    procedure DBEdit2Enter(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure bbtCasosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExtracao: TfExtracao;

implementation

uses ufDM, fUserValidaExtracao, ufExtracaoCasos;

{$R *.dfm}

procedure TfExtracao.DBEdit2Enter(Sender: TObject);
begin
if (dm.qExtracaoEXT_RESP.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoEXT_RESP.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;
end;

procedure TfExtracao.BNovoClick(Sender: TObject);
begin
  inherited;
  DM.qExtracaoEXT_DATA.Value   := Date;
  DM.qExtracaoAMPL_DATA.Value  := Date;
  DM.qExtracaoSEQ_DTCORR.Value := Date;
  DBEdit1.SetFocus;
end;

procedure TfExtracao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 case Key of
    VK_F4     :   bbtCasos.Click;
 end;
end;

procedure TfExtracao.FormShow(Sender: TObject);
begin
dm.qExtracao.Open;
dm.qExtracaoCasos.Open;

  inherited;
end;

procedure TfExtracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.qExtracao.Close;
dm.qExtracaoCasos.Close;

  inherited;

end;

procedure TfExtracao.DBEdit3Enter(Sender: TObject);
begin
if (dm.qExtracaoEXT_SUPER.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoEXT_SUPER.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;
end;

procedure TfExtracao.DBEdit11Enter(Sender: TObject);
begin
if (dm.qExtracaoAMPL_RESP.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoAMPL_RESP.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;

end;

procedure TfExtracao.DBEdit13Enter(Sender: TObject);
begin
if (dm.qExtracaoAMPL_SUPER.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoAMPL_SUPER.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;

end;

procedure TfExtracao.DBEdit15Enter(Sender: TObject);
begin
if (dm.qExtracaoSEQ_RESP.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoSEQ_RESP.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;

end;

procedure TfExtracao.DBEdit16Enter(Sender: TObject);
begin
if (dm.qExtracaoSEQ_SUPER.Value = '')
then begin
       Application.CreateForm(TfValidaExtracao, fValidaExtracao);
       fValidaExtracao.Origem := '';
       fValidaExtracao.Origem := '1';
       fValidaExtracao.ShowModal;
       DM.qExtracaoSEQ_SUPER.Value := fValidaExtracao.Retorno;
       fValidaExtracao.Free;
     end else ShowMessage('Mudança não Permitida!');
  inherited;
end;

procedure TfExtracao.bbtCasosClick(Sender: TObject);
begin
 if DSP.DataSet.State in [dsinsert, dsedit]
 then begin
       DM.qExtracao.Post;
       Application.CreateForm(TfExtracaoCasos, fExtracaoCasos);
       fExtracaoCasos.ShowModal;
       fExtracaoCasos.Free;
       DM.qExtracao.Edit;
       DM.qExtracaoCasos.Open;
     end;  
end;

end.
