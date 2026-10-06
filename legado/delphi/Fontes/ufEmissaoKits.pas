unit ufEmissaoKits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DB, ADODB,
  JvExMask, JvToolEdit;

type
  TfEmissaoKits = class(TForm)
    Label1: TLabel;
    EdtUltimoNumero: TEdit;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    EdtQuantidade: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    BSair: TSpeedButton;
    BProcessar: TSpeedButton;
    qUltimoCartao: TADOQuery;
    qUltimoCartaoMAX: TIntegerField;
    BLimpar: TSpeedButton;
    Edit1: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    qSomaBasico: TADOQuery;
    qSomaBasicoBASICO: TIntegerField;
    qSomaReconstrucao: TADOQuery;
    qSomaReconstrucaoRECONSTRUCAO: TIntegerField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DataSource2: TDataSource;
    Label7: TLabel;
    qPegaNumeroCartao: TADOQuery;
    EdtTipo: TEdit;
    Label8: TLabel;
    qPegaNumeroCartaoNUMEROSEMTIPO: TIntegerField;
    DateEdit1: TJvDateEdit;
    procedure BSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BProcessarClick(Sender: TObject);
    procedure BLimparClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoKits: TfEmissaoKits;

implementation

uses ufDM;

{$R *.dfm}

procedure TfEmissaoKits.BSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfEmissaoKits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.qColetador.Close;
end;

procedure TfEmissaoKits.FormShow(Sender: TObject);
begin
  DM.qColetador.Open;
  RadioGroup1.SetFocus;
end;

procedure TfEmissaoKits.RadioGroup1Click(Sender: TObject);
var Valor : String;
begin
if RadioGroup1.ItemIndex = 0
then begin
//      qUltimoCartao.Close;
//      qUltimoCartao.Parameters.ParamByName('Tipo').Value := 03;
//      qUltimoCartao.Open;
      qPegaNumeroCartao.Close;
      qPegaNumeroCartao.Parameters.ParamByName('Tipo').Value := 03;
      qPegaNumeroCartao.Open;

      qPegaNumeroCartao.Last;
      EdtUltimoNumero.Enabled := True;
      Valor := '';
      Valor := Copy(IntToStr(qPegaNumeroCartaoNUMEROSEMTIPO.Value),2,7);
      EdtUltimoNumero.Text    := Valor;
      Valor := '';
      EdtTipo.Text            := '03';
      EdtUltimoNumero.Enabled := False;
      DateEdit1.Date          := Date;
      BProcessar.Enabled      := True;
    end else begin
//              qUltimoCartao.Close;
//              qUltimoCartao.Parameters.ParamByName('Tipo').Value := 06;
//              qUltimoCartao.Open;
              qPegaNumeroCartao.Close;
              qPegaNumeroCartao.Parameters.ParamByName('Tipo').Value := 06;
              qPegaNumeroCartao.Open;

              qPegaNumeroCartao.Last;
              EdtUltimoNumero.Enabled := True;
              Valor := '';
              Valor := Copy(IntToStr(qPegaNumeroCartaoNUMEROSEMTIPO.Value),2,7);
              EdtUltimoNumero.Text    := Valor;
              Valor := '';
              EdtTipo.Text            := '06';
              EdtUltimoNumero.Enabled := False;
              DateEdit1.Date          := Date;
              BProcessar.Enabled      := True;
             end;

end;
procedure TfEmissaoKits.BProcessarClick(Sender: TObject);
var i, Cartao : Integer;
begin
if DBLookupComboBox1.KeyValue = -1
then begin
      ShowMessage('Selecione o Coletador para Emissão dos Kits');
      DBLookupComboBox1.SetFocus;
    end else begin
              if EdtQuantidade.Text = ''
              then begin
                    ShowMessage('Informa a Quantidade de Kits para Emissão dos mesmos');
                    EdtQuantidade.SetFocus;
                   end else begin
                            //Começo da geração
                              try
                              if RadioGroup1.ItemIndex = 0
                              then begin
                                    Cartao := StrToInt('3' + EdtUltimoNumero.Text);
                                   end else Cartao := StrToInt('6' + EdtUltimoNumero.Text);
                              DM.qKits.Open;
                              for i := 1 to StrToInt(EdtQuantidade.Text) do
                              begin
                              Cartao := Cartao + 1;
                              DM.qKits.Append;
                              if RadioGroup1.ItemIndex = 0
                              then begin
                                     DM.qKitsKIT_TIP.Value  := 03;
                                   end else DM.qKitsKIT_TIP.Value  := 06;
                              DM.qKitsKIT_NUM.Value    := Cartao;
                              DM.qKitsCOL_COD.Value    := DBLookupComboBox1.KeyValue;
                              DM.qKitsKIT_DENV.Value   := DateEdit1.Date;
                              DM.qKitsKIT_STATUS.Value := 'A';

                              DM.qKits.Post;
                              end;
                               ShowMessage('Geração de Kits para ' +  DBLookupComboBox1.Text + ' finaliza!!!');
                               BLimpar.Click;
                               except
                               ShowMessage('Procure o Administrador, aconteceu algum problema na geração dos Kits');
                              end;
                            //Fim
             end;           end;

end;




procedure TfEmissaoKits.BLimparClick(Sender: TObject);
begin
RadioGroup1.ItemIndex      := -1;
EdtUltimoNumero.Text       := '';
EdtTipo.Text               := '';
DBLookupComboBox1.KeyValue := -1;
DateEdit1.Text             := '  /  /   ';
Edit1.Text                 := '';
EdtQuantidade.Text         := '';
BProcessar.Enabled         := False;
qSomaBasico.Close;
qSomaReconstrucao.Close;

end;

procedure TfEmissaoKits.Edit1Exit(Sender: TObject);
begin
 DBLookupComboBox1.KeyValue := StrToInt(Edit1.Text);
 qSomaBasico.Close;
 qSomaBasico.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
 qSomaBasico.Open;

 qSomaReconstrucao.Close;
 qSomaReconstrucao.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
 qSomaReconstrucao.Open;
end;

procedure TfEmissaoKits.DBLookupComboBox1Exit(Sender: TObject);
begin
 Edit1.Text := IntToStr(DBLookupComboBox1.KeyValue);
end;

procedure TfEmissaoKits.DBLookupComboBox1Click(Sender: TObject);
begin
 qSomaBasico.Close;
 qSomaBasico.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
 qSomaBasico.Open;

 qSomaReconstrucao.Close;
 qSomaReconstrucao.Parameters.ParamByName('Codigo').Value := DBLookupComboBox1.KeyValue;
 qSomaReconstrucao.Open;

end;

end.
