unit ufCarga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DBCtrls;

type
  TfCarga = class(TForm)
    Label1: TLabel;
    DataSourceCodProcesso: TDataSource;
    QueryCodProcesso: TADOQuery;
    RxDBLookupComboCodProcesso: TEdit;
    QueryCodProcessoPRO_COD: TIntegerField;
    gb_Dados: TGroupBox;
    Edt_Web: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edt_Paciente: TEdit;
    qConsultaProcedimentos: TADOQuery;
    qGravaCarga: TADOQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateField2: TDateField;
    DateField3: TDateField;
    StringField3: TStringField;
    BCDField1: TBCDField;
    StringField4: TStringField;
    StringField5: TStringField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateField4: TDateField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    BCDField4: TBCDField;
    TimeField1: TTimeField;
    SmallintField1: TSmallintField;
    StringField11: TStringField;
    SmallintField2: TSmallintField;
    IntegerField4: TIntegerField;
    StringField12: TStringField;
    StringField13: TStringField;
    IntegerField5: TIntegerField;
    StringField14: TStringField;
    DateField5: TDateField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    SmallintField3: TSmallintField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    IntegerField6: TIntegerField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    IntegerField7: TIntegerField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    qConsultaProcedimentosPES_NOME: TStringField;
    sbReceber: TBitBtn;
    sbFechar: TBitBtn;
    cb_Labora: TCheckBox;
    qConsultaProcedimentosPRO_COD: TIntegerField;
    qConsultaProcedimentosPRO_DCOL: TDateField;
    qIncluiProtocolo: TADOQuery;
    qConsultaProcedimentosPRO_PROT: TStringField;
    qConsultaProcedimentosPRO_IDWEB: TIntegerField;
    procedure EditCodigoEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupComboCodProcessoChange(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure sbReceberClick(Sender: TObject);
    procedure RxDBLookupComboCodProcessoExit(Sender: TObject);
    function GetRandomPassword(Size: Integer; Tipo : Integer = 1): String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCarga: TfCarga;

implementation

uses ufDM, ufProcesso, ufAcesso, ufDMI;

{$R *.dfm}

procedure TfCarga.EditCodigoEnter(Sender: TObject);
begin
if fProcessos.qProcessoCPG.Locate('PRO_COD', StrToInt(RxDBLookupComboCodProcesso.Text), []) = True
then begin
      Close;
     end else begin
               ShowMessage('Desculpe. Perícia não encontrada com esse Código!!!!');
               RxDBLookupComboCodProcesso.SetFocus;
              end;
end;

procedure TfCarga.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then begin
key:=#0;
Perform(WM_NEXTDLGCTL,0,0);
end;
end;

procedure TfCarga.FormShow(Sender: TObject);
begin
 RxDBLookupComboCodProcesso.SetFocus;
end;

procedure TfCarga.RxDBLookupComboCodProcessoChange(
  Sender: TObject);
begin
if (Length(RxDBLookupComboCodProcesso.Text) = 6)
then begin
      sbReceber.Click;
     end;
end;

procedure TfCarga.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfCarga.sbReceberClick(Sender: TObject);
var Ano, Mes, Dia : Word;
    Sequencial, AnoC, MesC, DiaC, Hash : String;
    Codigo : Integer;
begin
try
  with qGravaCarga do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' insert into TB_PROCEDIMENTOS_CARGA (PRO_COD, HOS_USUA) VALUES (:Codigo, :Usuario) ');
    Parameters.ParamByName('Codigo').Value  := trim(RxDBLookupComboCodProcesso.Text);
    Parameters.ParamByName('Usuario').Value := fAcesso.Edit1.Text;
    ExecSQL;
  end;
  if ((cb_Labora.Checked = True) and (qConsultaProcedimentosPRO_PROT.Value = ''))
  then begin
        Codigo := 0;
        Codigo := qConsultaProcedimentosPRO_COD.Value;

        DMI.qSequencial.Close;
        DMI.qSequencial.Open;
        Sequencial := IntToStr(DMI.qSequencialSEQUENCIAL.Value + 1);
        if Length(Sequencial) = 1
        then begin
              Sequencial := ('000' + Sequencial);
             end else begin
                       if Length(Sequencial) = 2
                       then begin
                             Sequencial := ('00' + Sequencial);
                            end else begin
                                      if Length(Sequencial) = 3
                                      then begin
                                            Sequencial := ('0' + Sequencial);
                                           end else begin
                                                      Sequencial := (Sequencial);
                                                    end;
                                     end;
                     end;

        DECODEDATE(qConsultaProcedimentosPRO_DCOL.Value, Ano, Mes, Dia);
        AnoC := IntToStr(Ano);
        MesC := IntToStr(Mes);
        if Length(MesC) = 1
        then begin
              MesC := '0' + MesC;
             end;
        DiaC := IntToStr(Dia);
        if Length(DiaC) = 1
        then begin
              DiaC := '0' + DiaC;
             end;

        DMI.qSequencial.Edit;
        DMI.qSequencialSEQUENCIAL.Value := StrToInt(Sequencial);
        DMI.qSequencial.Post;

        Hash := '';
        Hash := GetRandomPassword(10, 2);

        with qIncluiProtocolo do
        begin
        Close;
        SQL.Clear;
        SQL.Add(' update TB_PROCEDIMENTOS p set p.PRO_PROT = :Valor, p.PRO_HASH = :Hash where p.PRO_COD = :Codigo');
        Parameters.ParamByName('Valor').Value  := AnoC + MesC + Sequencial;
        Parameters.ParamByName('Hash').Value   := Hash + AnoC + MesC + Sequencial;
        Parameters.ParamByName('Codigo').Value := Codigo;
        ExecSQL;
        end;
        Codigo := 0;
      end;
ShowMessage('Processo realizado com sucesso!');
if DMI.qProcedimentos.Locate('PRO_COD', qConsultaProcedimentosPRO_COD.Value, []) = True
then begin
        Close;
      end;
Except
end;

end;



function TfCarga.GetRandomPassword(Size: Integer; Tipo : Integer = 1): String;
var
  I: Integer;
  Chave: String;
const
  str1 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  str2 = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  str3 = '1234567890abcdefghijklmnopqrstuvwxyz';
  str4 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  str5 = '123456789089898784545465';
  str6 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  str7 = 'abcdefghijklmnopqrstuvwxyz';
begin
  Chave := '';
 
  for I := 1 to Size do
  begin
    case Tipo of
      1 : Chave := Chave + str1[Random(Length(str1)) + 1];
      2 : Chave := Chave + str2[Random(Length(str2)) + 1];
      3 : Chave := Chave + str3[Random(Length(str3)) + 1];
      4 : Chave := Chave + str4[Random(Length(str4)) + 1];
      5 : Chave := Chave + str5[Random(Length(str5)) + 1];
      6 : Chave := Chave + str6[Random(Length(str6)) + 1];
      7 : Chave := Chave + str7[Random(Length(str7)) + 1];
    end;
  end;
 
  Result := Chave;
end;


procedure TfCarga.RxDBLookupComboCodProcessoExit(Sender: TObject);
begin
if (RxDBLookupComboCodProcesso.Text <> '')
then begin
      qConsultaProcedimentos.Close;
      qConsultaProcedimentos.Parameters.ParamByName('Codigo').Value := trim(RxDBLookupComboCodProcesso.Text);
      qConsultaProcedimentos.Open;

      if (qConsultaProcedimentos.RecordCount > 0)
      then begin
            Edt_Paciente.Text    := qConsultaProcedimentosPES_NOME.Value;
            Edt_Web.Text         := IntToStr(qConsultaProcedimentosPRO_IDWEB.Value);
            Edt_Paciente.Enabled := False;
            Edt_Web.Enabled      := False;
            sbReceber.Enabled    := True;
            sbReceber.SetFocus;
           end else begin
                     ShowMessage('Caso não encontrado!');
                     RxDBLookupComboCodProcesso.SetFocus;
                    end;
     end;               

end;

end.
