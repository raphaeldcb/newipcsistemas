unit ufGeradorRelEtiquetas;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DB,  Grids, DBGrids, ADODB, Buttons, Word2000, OleServer, Comobj, Variants,
  WordXP, Word2010, JvMemoryDataset;

type
  TfEmissaoEtiquetas = class(TForm)
    DataSourceCodProcesso: TDataSource;
    GroupBox1: TGroupBox;
    ListBoxProcesso: TListBox;
    GroupBox2: TGroupBox;
    LabelCodProcesso: TLabel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBoxLinha: TComboBox;
    ComboBoxColuna: TComboBox;
    QueryEtiq: TADOQuery;
    QueryCodProcesso: TADOQuery;
    sbEmitir: TSpeedButton;
    sbFechar: TSpeedButton;
    waWord: TWordApplication;
    wdDoc: TWordDocument;
    QueryEtiqPRO_COD: TIntegerField;
    QueryEtiqCAS_CODIGO: TStringField;
    QueryEtiqPES_NOME: TStringField;
    MemoryTableCodProcesso: TJvMemoryData;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedItemSairClick(Sender: TObject);
    procedure RxDBLookupComboCodProcessoCloseUp(Sender: TObject);
    procedure ListBoxProcessoClick(Sender: TObject);
    procedure ListBoxProcessoExit(Sender: TObject);
    procedure SpeedItemRemoverClick(Sender: TObject);
    procedure SpeedItemImprimirClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFecharClick(Sender: TObject);
    procedure sbEmitirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEmissaoEtiquetas: TfEmissaoEtiquetas;

implementation

uses ufProcesso, ufDM, ufRelEtiquetas, ufBits;

{$R *.DFM}

procedure TfEmissaoEtiquetas.FormShow(Sender: TObject);
begin
  QueryCodProcesso.Open;
//  RxDBLookupComboCodProcesso.SetFocus;
//  SpeedItemRemover.Enabled  := False;
//  SpeedItemImprimir.Enabled := False;
end;

procedure TfEmissaoEtiquetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QueryCodProcesso.Close;
end;

procedure TfEmissaoEtiquetas.SpeedItemSairClick(Sender: TObject);
begin
  close;
end;

procedure TfEmissaoEtiquetas.RxDBLookupComboCodProcessoCloseUp(
  Sender: TObject);
var
  codigo : string;
begin
{
  Codigo := RxDBLookupComboCodProcesso.Value;
    if Codigo <> '' then
    begin
        if ListBoxProcesso.Items.IndexOf(Codigo) = -1 then
            ListBoxProcesso.Items.Add(Codigo);
        SpeedItemImprimir.Enabled := True;
    end;
    }
end;

procedure TfEmissaoEtiquetas.ListBoxProcessoClick(Sender: TObject);
begin
//	SpeedItemRemover.Enabled := True;
end;

procedure TfEmissaoEtiquetas.ListBoxProcessoExit(Sender: TObject);
begin
//	SpeedItemRemover.Enabled := False;
end;

procedure TfEmissaoEtiquetas.SpeedItemRemoverClick(Sender: TObject);
begin
{    with ListBoxProcesso do
    begin
    	Items.Delete( ItemIndex );
        if Items.Count = 0 then
        begin
	  SpeedItemImprimir.Enabled := false;
	  SpeedItemRemover.Enabled := false;
        end;
    end;}
end;

procedure TfEmissaoEtiquetas.SpeedItemImprimirClick(Sender: TObject);
var
  i : integer;
  j : byte;
  s : string;
  QtdLinha, QtdColuna:integer;
  Idx, IdxInsert:integer;

    procedure GravaMemTab(Pref,Campo : string);
    var
    	s : string;
    begin
        s := QueryEtiq.fieldbyname(Campo).AsString;
        if s = '' then
        	exit;

      	DM.qCasos.Locate('CAS_CODIGO', QueryEtiq.fieldbyname('TipoCaso').AsInteger, []);
        if Pref = '1' then
        	Pref := DM.qCasosCAS_SIG1.Value
        else if Pref = '2' then
        	Pref := DM.qCasosCAS_SIG2.Value
        else if Pref = '3' then
        	Pref := DM.qCasosCAS_SIG3.Value
        else if Pref = '4' then
        	Pref := DM.qCasosCAS_SIG4.Value;

     {
    	with fRelEtiquetas.MemoryTableCodProcesso do
        begin
            append;
            s := Copy(s,1,Pos(' ',s))+Copy(s,PosR(' ',s)+1,255);
            fieldbyname('CodProcesso').AsString :=
            	StrZero(QueryEtiq.fieldbyname('Codigo').AsString,5);
            fieldbyname('Nome').AsString := Pref + '-' +s;
            post;
        end;
        }
    end;



begin
    s := '';
    for i := 0 to ListBoxProcesso.Items.Count-1 do
    begin
    	s := s + ',' + ListBoxProcesso.Items[i];
    end;
    delete(s,1,1);

	with QueryEtiq do
    begin
    	Close;
    	SQL.Clear;
        SQL.Add('select p.pro_cod, p.cas_codigo, a.pes_nome from tb_PROCESSO p, tb_PESSOAS a ');
    		SQL.Add('WHERE p.pro_cod = a.pro_cod and p.pro_unid = a.pro_unid and p.pro_cod IN ('+s+')');
        Open;
    end;

    with fRelEtiquetas.MemoryTableCodProcesso do
    begin
        FieldDefs.Clear;
        FieldDefs.Add('CodProcesso', ftString, 6, False);
        FieldDefs.Add('Nome', ftString, 46, False);

        Open;

        QueryEtiq.first;


        QtdLinha  := strtoint(ComboBoxLinha.text);
        QtdColuna := strtoint(ComboBoxColuna.text);

        for Idx:=2 to QtdLinha do
          begin
            fRelEtiquetas.MemoryTableCodProcesso.insert;
            fRelEtiquetas.MemoryTableCodProcesso.post;
          end;

        for Idx:=2 to QtdColuna do
          begin
            for IdxInsert := 1 to 20 do
              begin
                fRelEtiquetas.MemoryTableCodProcesso.insert;
                fRelEtiquetas.MemoryTableCodProcesso.post;
              end;
          end;



        while not QueryEtiq.eof do
        begin
        	GravaMemTab('M','Mae');
        	GravaMemTab('C','Crianca');
        	GravaMemTab('SP','Supai');

        	GravaMemTab('1','N1');
        	GravaMemTab('2','N2');
        	GravaMemTab('3','N3');
        	GravaMemTab('4','N4');

        	QueryEtiq.next;
        end;

        {Imprimir etiqueta a partir da MemoryTable}
//        if fRelEtiquetas.VisualizarImpressao1.Checked then
            fRelEtiquetas.QuickRep1.Preview
//        else
 //           FormEtiqCImp.QuickReportEtiq.Print;
//        Close;
    end;
	QueryEtiq.Close;
end;

procedure TfEmissaoEtiquetas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	Tecla: word;
begin
 {   Tecla := Key;
    Key := $1A;
    case Tecla of
        $53:
            if (Shift = [ssCtrl]) then
                SpeedItemSairClick(Sender);
        VK_DELETE:
            if SpeedItemRemover.Enabled then
          		SpeedItemRemoverClick(Sender);
        $50:
        	if (Shift = [ssCtrl]) and (SpeedItemImprimir.Enabled) then
               	SpeedItemImprimirClick(Sender);
    end;
    }
end;

procedure TfEmissaoEtiquetas.sbFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfEmissaoEtiquetas.sbEmitirClick(Sender: TObject);

var f_false, f_true, f_NomeDoc, f_Troca, f_Var, f_NomeSalva :OleVariant;
    Ano, Mes, Dia : Word;
    DataDiaColeta, AnoA, MesA, DiaA, s, Nome, Processo : String;
    i, Linha, Coluna : Integer;


        procedure GravaMemTab(Pref,Campo : string);
    var
    	s : string;
    begin
        s := QueryEtiq.fieldbyname(Campo).AsString;
        if s = '' then
        	exit;

      	DM.qCasos.Locate('CAS_CODIGO', QueryEtiq.fieldbyname('TipoCaso').AsInteger, []);
        if Pref = '1' then
        	Pref := DM.qCasosCAS_SIG1.Value
        else if Pref = '2' then
        	Pref := DM.qCasosCAS_SIG2.Value
        else if Pref = '3' then
        	Pref := DM.qCasosCAS_SIG3.Value
        else if Pref = '4' then
        	Pref := DM.qCasosCAS_SIG4.Value;


      s := Copy(s,1,Pos(' ',s))+Copy(s,PosR(' ',s)+1,255);
      Processo := StrZero(QueryEtiq.fieldbyname('Codigo').AsString,5);
      Nome := Pref + '-' +s;

      f_Var   := '<PROCESSO' + IntToStr(Linha) + '>';
      f_Troca := Processo;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      f_Var   := '<NOME' + IntToStr(Linha) + '>';
      f_Troca :=  Nome;
      while wdDoc.Content.Find.Execute(f_Var, f_false, f_false, f_false, f_false,
      f_false, f_true, EmptyParam, EmptyParam, f_Troca, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam) do
      f_Var := f_Var;

      Linha  := Linha + 1;

    end;

begin
 s := '';
 for i := 0 to ListBoxProcesso.Items.Count-1 do
 begin
	s := s + ',' + ListBoxProcesso.Items[i];
 end;
 delete(s,1,1);

	with QueryEtiq do
  begin
   Close;
   SQL.Clear;
   SQL.Add('select p.pro_cod, p.cas_codigo, a.pes_nome from tb_PROCESSO p, tb_PESSOAS a ');
	 SQL.Add('WHERE p.pro_cod = a.pro_cod and p.pro_unid = a.pro_unid and p.pro_cod IN ('+s+')');
   Open;
  end;



f_NomeDoc := 'C:\ProjetoCPG\mODELOS\EtiquetasCPG.doc';

try
    waWord.Connect;
    waWord.Visible := True;
    wdDoc.ConnectTo(waWord.Documents.Open2000(f_NomeDoc, EmptyParam, f_True,
    EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));


    Linha  := ComboBoxLinha.ItemIndex + 1;
    Coluna := ComboBoxColuna.ItemIndex+ 1;


    while not QueryEtiq.eof do
    begin
      GravaMemTab('M','Mae');
      GravaMemTab('C','Crianca');
      GravaMemTab('SP','Supai');

      GravaMemTab('1','N1');
      GravaMemTab('2','N2');
      GravaMemTab('3','N3');
      GravaMemTab('4','N4');

      QueryEtiq.next;
    end;




except
wdDoc.PrintOut(f_False, f_False, f_False);
waWord.Quit(f_False, f_False, f_False);
Application.MessageBox('Erro ao tentar abrir o modelo de documento.!', 'Mensagem', mb_iconInformation);
end;
end;

end.
