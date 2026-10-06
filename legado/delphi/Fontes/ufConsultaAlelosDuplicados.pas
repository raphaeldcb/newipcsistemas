unit ufConsultaAlelosDuplicados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, Buttons, DBCtrls, ExtCtrls,
  ComCtrls;

type
   TAuxDBGrid = class(TDBGrid);
   TfConsultaAlelosDuplicados = class(TForm)
    qSelecionaSituacaoPessoa: TADOQuery;
    qSelecionaSituacaoPessoaNM2_ALE: TStringField;
    qSelecionaPessoa: TADOQuery;
    Label1: TLabel;
    EdtCodigo: TEdit;
    DS_SelecionaSituacaoPessoa: TDataSource;
    bbtConsultar: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    qSelecionaPessoaCOD_ALE: TIntegerField;
    qSelecionaPessoaNM1_ALE: TStringField;
    qSelecionaPessoaNM2_ALE: TStringField;
    qSelecionaPessoaNM3_ALE: TStringField;
    qSelecionaPessoaNM4_ALE: TStringField;
    qSelecionaPessoaMAR_ALE: TStringField;
    qSelecionaPessoaAL1_ALE: TStringField;
    qSelecionaPessoaAL2_ALE: TStringField;
    qSelecionaPessoaORD_ALE: TIntegerField;
    qContador: TADOQuery;
    qLimpaContadorAlelos: TADOQuery;
    ds_Contador: TDataSource;
    sp_BuscaAlelos: TADOStoredProc;
    sp_BuscaAlelosMENSAGEM: TStringField;
    qContadorCONTADOR: TIntegerField;
    qContadorCODIGO: TIntegerField;
    gbDados: TGroupBox;
    Label_SuPai: TLabel;
    Label_Crianca: TLabel;
    Label_Mae: TLabel;
    Image_Mae: TImage;
    Image_Crianca: TImage;
    Image_SuPai: TImage;
    bbt_SuPai: TBitBtn;
    bbt_Crianca: TBitBtn;
    bbt_Mae: TBitBtn;
    qBuscaAlelos: TADOQuery;
    qInsereQuantAlelos: TADOQuery;
    qBuscaAlelosNM1_ALE: TStringField;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtConsultarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bbt_SuPaiClick(Sender: TObject);
    procedure bbt_CriancaClick(Sender: TObject);
    procedure bbt_MaeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsultaAlelosDuplicados: TfConsultaAlelosDuplicados;

implementation

uses ufDMR, ufDM, ufProcesso;

{$R *.dfm}

procedure TfConsultaAlelosDuplicados.BitBtn1Click(Sender: TObject);
begin
 Close;
end;

procedure TfConsultaAlelosDuplicados.bbtConsultarClick(Sender: TObject);
var Valor : Integer;
begin
gbDados.Visible       := False;
Label_SuPai.Visible   := False;
Image_SuPai.Visible   := False;
bbt_SuPai.Visible     := False;
Label_Crianca.Visible := False;
Image_Crianca.Visible := False;
bbt_Crianca.Visible   := False;
Label_Mae.Visible     := False;
Image_Mae.Visible     := False;
bbt_Mae.Visible       := False;



qSelecionaSituacaoPessoa.Close;
qSelecionaSituacaoPessoa.Parameters.ParamByName('Codigo').Value := StrToInt(EdtCodigo.Text);
qSelecionaSituacaoPessoa.Open;

qSelecionaSituacaoPessoa.First;
while qSelecionaSituacaoPessoa.Eof = False do
begin

  Progressbar1.Min := 0;
  Progressbar1.Max := 100;


  qSelecionaPessoa.Close;
  qSelecionaPessoa.Parameters.ParamByName('Pessoa').Value := qSelecionaSituacaoPessoaNM2_ALE.Value;
  qSelecionaPessoa.Parameters.ParamByName('Numero').Value := StrToInt(EdtCodigo.Text);
  qSelecionaPessoa.Open;

  if qSelecionaPessoaNM2_ALE.Value = 'CR1'
  then begin
        Label_Crianca.Visible := True;
        end else begin
                  if qSelecionaPessoaNM2_ALE.Value = 'MA1'
                  then begin
                        Label_Mae.Visible := True;
                       end else Label_SuPai.Visible := True;
                 end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'FGA', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'FGA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D8S1179';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D21S11';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D7S820';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'CSF1PO';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D3S1358';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'TH01';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D13S317';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D16S539';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D2S1338';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D19S433';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'vWA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'TPOX';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D18S51';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'AMEL';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D5S818';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

        //Verificador de Quantidade de Códigos Encontrados (SE >=16  = ENCONTRADO ALELOS DUPLICADOS)
        qContador.Close;
        qContador.Parameters.ParamByName('CodigoCaso').Value := StrToInt(EdtCodigo.Text);;
        qContador.Open;

        gbDados.Visible := True;
        if qContador.Locate('CONTADOR', 16, []) = True
        then begin
              if qSelecionaPessoaNM2_ALE.Value = 'CR1'
              then begin
                    Image_Crianca.Visible := True;
//                    Image_Crianca.Picture.LoadFromFile('C:\SCPG\Imagens\icone_ticado_neg.bmp');
                    Image_Crianca.Picture.LoadFromFile('U:\CPG\SCPG\Imagens\icone_ticado_neg.bmp');
                    bbt_Crianca.Visible := True;
                    end else begin
                              if qSelecionaPessoaNM2_ALE.Value = 'MA1'
                              then begin
                                    Image_Mae.Visible := True;
//                                    Image_Mae.Picture.LoadFromFile('C:\SCPG\Imagens\icone_ticado_neg.bmp');
                                    Image_Mae.Picture.LoadFromFile('U:\CPG\SCPG\Imagens\icone_ticado_neg.bmp');
                                    bbt_Mae.Visible := True;
                                   end else begin
                                             Image_SuPai.Visible := True;
//                                             Image_SuPai.Picture.LoadFromFile('C:\SCPG\Imagens\icone_ticado_neg.bmp');
                                             Image_SuPai.Picture.LoadFromFile('U:\CPG\SCPG\Imagens\icone_ticado_neg.bmp');
                                             bbt_SuPai.Visible := True;
                                            end;
                             end;
             end else begin
                       if qSelecionaPessoaNM2_ALE.Value = 'CR1'
                       then begin
                             Image_Crianca.Visible := True;
                             Image_Crianca.Picture.LoadFromFile('C:\SCPG\Imagens\icone_ticado_ok.bmp');
//                             Image_Crianca.Picture.LoadFromFile('U:\CPG\SCPG\Imagens\icone_ticado_ok.bmp');
                             bbt_Crianca.Visible := False;
                             end else begin
                                       if qSelecionaPessoaNM2_ALE.Value = 'MA1'
                                       then begin
                                             Image_Mae.Visible := True;
                                             Image_Mae.Picture.LoadFromFile('C:\SCPG\Imagens\icone_ticado_ok.bmp');
//                                             Image_Mae.Picture.LoadFromFile('U:\CPG\SCPG\Imagens\icone_ticado_ok.bmp');
                                             bbt_Mae.Visible := False;
                                            end else begin
                                                      Image_SuPai.Visible := True;
                                                      Image_SuPai.Picture.LoadFromFile('C:\SCPG\Imagens\icone_ticado_ok.bmp');
//                                                      Image_SuPai.Picture.LoadFromFile('U:\CPG\SCPG\Imagens\icone_ticado_ok.bmp');
                                                      bbt_SuPai.Visible := False;
                                                     end;
                                      end;
                      end;

        with qLimpaContadorAlelos do
        begin
        Close;
        SQL.Clear;
        SQL.Add(' delete from tb_CONTAALELO ');
        ExecSQL;
       end;

Progressbar1.Max := 100;
ProgressBar1.StepIt;
Application.ProcessMessages;

qSelecionaSituacaoPessoa.Next;
end;
qContador.Close;
end;

procedure TfConsultaAlelosDuplicados.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (TAuxDBGrid(DBGrid1).DataLink.ActiveRecord + 1 =
TAuxDBGrid(DBGrid1).Row) or (gdSelected in State) then
  begin
    DBGrid1.Canvas.Brush.Color := clMaroon;
    DBGrid1.Canvas.Font.Style  := DBGrid1.Canvas.Font.Style + [fsBold];
    DBGrid1.Canvas.Font.Color  := clWhite;
  end;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString);
end;

procedure TfConsultaAlelosDuplicados.bbt_SuPaiClick(Sender: TObject);
begin
  qSelecionaPessoa.Close;
  qSelecionaPessoa.Parameters.ParamByName('Pessoa').Value := 'SP1';
  qSelecionaPessoa.Parameters.ParamByName('Numero').Value := StrToInt(EdtCodigo.Text);
  qSelecionaPessoa.Open;

  if qSelecionaPessoa.Locate('MAR_ALE', 'FGA', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'FGA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;


  if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D21S11';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D21S11';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D7S820';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'CSF1PO';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D3S1358';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;
  if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'TH01';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D13S317';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D16S539';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D2S1338';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D19S433';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;
  if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'vWA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'TPOX';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D18S51';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'AMEL';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D5S818';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

        qContador.Close;
        qContador.Parameters.ParamByName('CodigoCaso').Value := StrToInt(EdtCodigo.Text);;
        qContador.Open;

end;

procedure TfConsultaAlelosDuplicados.bbt_CriancaClick(Sender: TObject);
begin
  qSelecionaPessoa.Close;
  qSelecionaPessoa.Parameters.ParamByName('Pessoa').Value := 'CR1';
  qSelecionaPessoa.Parameters.ParamByName('Numero').Value := StrToInt(EdtCodigo.Text);
  qSelecionaPessoa.Open;

  if qSelecionaPessoa.Locate('MAR_ALE', 'FGA', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'FGA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;


  if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D8S1179';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;
  if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D21S11';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;
  if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D7S820';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;
  if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'CSF1PO';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D3S1358';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'TH01';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D13S317';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D16S539';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D2S1338';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'vWA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'vWA';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'TPOX';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D18S51';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'AMEL';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
  then begin
        qBuscaAlelos.Close;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        qBuscaAlelos.Parameters.ParamByName('MARCADOR').Value       := 'D5S818';
        qBuscaAlelos.Open;

        with qInsereQuantAlelos do
        begin
         Close;
         SQL.Clear;
         SQL.Add('insert into tb_contaalelo (qtd_codigo) values (:Quantidade) ');
         Parameters.ParamByName('Quantidade').Value :=qBuscaAlelosNM1_ALE.Value;
         ExecSQL;
        end;

       end;

        qContador.Close;
        qContador.Parameters.ParamByName('CodigoCaso').Value := StrToInt(EdtCodigo.Text);;
        qContador.Open;

end;


procedure TfConsultaAlelosDuplicados.bbt_MaeClick(Sender: TObject);
begin
  qSelecionaPessoa.Close;
  qSelecionaPessoa.Parameters.ParamByName('Pessoa').Value := 'MA1';
  qSelecionaPessoa.Parameters.ParamByName('Numero').Value := StrToInt(EdtCodigo.Text);
  qSelecionaPessoa.Open;

  if qSelecionaPessoa.Locate('MAR_ALE', 'FGA', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'FGA';
        sp_BuscaAlelos.Open;
       end;


  if qSelecionaPessoa.Locate('MAR_ALE', 'D8S1179', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D8S1179';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D21S11', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D21S11';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D7S820', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D7S820';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'CSF1PO', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'CSF1PO';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D3S1358', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D3S1358';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TH01', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TH01';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D13S317', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D16S539';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D16S539', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D13S317';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D2S1338', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D2S1338';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D19S433', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D19S433';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'vWA', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'vWA';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'TPOX', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'TPOX';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D18S51', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D18S51';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'AMEL', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'AMEL';
        sp_BuscaAlelos.Open;
       end;

  if qSelecionaPessoa.Locate('MAR_ALE', 'D5S818', []) = True
  then begin
        sp_BuscaAlelos.Close;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR1').Value := qSelecionaPessoaAL1_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('VALORMARCADOR2').Value := qSelecionaPessoaAL2_ALE.Value;
        sp_BuscaAlelos.Parameters.ParamByName('MARCADOR').Value := 'D5S818';
        sp_BuscaAlelos.Open;
       end;

        qContador.Close;
        qContador.Parameters.ParamByName('CodigoCaso').Value := StrToInt(EdtCodigo.Text);;
        qContador.Open;

end;

procedure TfConsultaAlelosDuplicados.FormShow(Sender: TObject);
begin
  EdtCodigo.Text := fProcessos.DBEdit1.Text;
end;

end.
