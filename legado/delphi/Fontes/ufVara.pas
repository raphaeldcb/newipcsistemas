unit ufVara;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufPadrao, DB, Grids, DBGrids, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask, ADODB;

type
  TfVara = class(TfPadrao)
    Label1: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    qSelComarca: TADOQuery;
    qSelComarcaUF_SIGLA: TStringField;
    qSelComarcaCOM_COD: TIntegerField;
    qSelComarcaCOM_DESC: TStringField;
    qSelComarcaCOM_SIGLA: TStringField;
    DS_SelComarca: TDataSource;
    RxDBLookupComboVara: TDBLookupComboBox;
    qSelEstado: TADOQuery;
    qSelEstadoUF_SIGLA: TStringField;
    qSelEstadoUF_DESC: TStringField;
    DS_SelEstado: TDataSource;
    RxDBLookupComboEstado: TDBLookupComboBox;
    qSelJuiz: TADOQuery;
    DS_SelJuiz: TDataSource;
    qManutencaoEdicao: TADOQuery;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    Label4: TLabel;
    Label2: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BSairClick(Sender: TObject);
    procedure BCnsultarClick(Sender: TObject);
    procedure BNovoClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBLookupComboVaraExit(Sender: TObject);
    procedure RxDBLookupComboEstadoExit(Sender: TObject);
    procedure BEditarClick(Sender: TObject);
    procedure BSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVara: TfVara;
  Situacao: String;

implementation

uses ufDM, ufConsultaVara, ufPessoas, ufJuiz, ufProcesso, Math,
  ufConsultaJuiz;

{$R *.dfm}

procedure TfVara.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
DM.qVara.Open;
DM.qComarca.Open;
fProcessos.qSelJuiz.Open;
end;

procedure TfVara.FormShow(Sender: TObject);
begin
  inherited;
  DM.qVara.Open;
  DM.qComarca.Open;
  BCnsultar.Click;

  qSelComarca.Close;
  qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := RxDBLookupComboEstado.KeyValue;
  qSelComarca.Open;

  qSelJuiz.Close;
  qSelJuiz.Open;
end;

procedure TfVara.BSairClick(Sender: TObject);
begin
try
  DM.qVara.Close;
  DM.qVara.SQL.Clear;
  DM.qVara.SQL.Add(' select v.uf_sigla, v.var_sigla, v.var_cod, v.var_desc, v.jui_cod, j.jui_desc, c.com_cod AS COM_COD, c.com_desc AS NomeComarca, e.uf_desc as DescricaoEstado ');
  DM.qVara.SQL.Add(' , VAR_END Ende_Vara, VAR_BAIRRO Bairro_Vara, VAR_CID Cidade_Vara, VAR_CEP CEP_Vara  ');
  DM.qVara.SQL.Add(' from tb_VARAS v JOIN tb_COMARCA c ON v.uf_sigla = c.uf_sigla and v.com_cod = c.com_cod JOIN tb_UF e ON c.uf_sigla = e.uf_sigla ');
  DM.qVara.SQL.Add(' JOIN tb_juiz j ON v.jui_cod=j.jui_cod ');
  DM.qVara.Open;

  DM.qJuiz.Close;
  DM.qJuiz.Open;

  inherited;
except
  inherited;
end;
end;

procedure TfVara.BCnsultarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfConsultaVara,fConsultaVara);
  fConsultaVara.ShowModal;
  fConsultaVara.Free;

  qSelComarca.Close;
  qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := RxDBLookupComboEstado.KeyValue;
  qSelComarca.Open;

  qSelJuiz.Close;
  qSelJuiz.Open;
end;

procedure TfVara.BNovoClick(Sender: TObject);
begin
inherited;
DBEdit1.Text := 'MS';
DBEdit1.SetFocus;
DM.qVaraJUI_COD.Value := 0;
end;

procedure TfVara.DBEdit2Exit(Sender: TObject);
var Proximo : Integer;
begin
inherited;
DM.qMaxVara.Close;
DM.qMaxVara.Parameters.ParamByName('ESTADO').Value  := DM.qVaraUF_SIGLA.Value;
DM.qMaxVara.Parameters.ParamByName('COMARCA').Value := DM.qVaraCOM_COD.Value;
DM.qMaxVara.Open;
Proximo := DM.qMaxVaraMAX.Value + 1;
DM.qVaraVAR_COD.Value := Proximo;
DBEdit4.SetFocus;
end;

procedure TfVara.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfConsultaJuizes, fConsultaJuizes);
  fConsultaJuizes.ShowModal;
  fConsultaJuizes.Free;
  DM.qJuiz.Open;

  qSelJuiz.Close;
  qSelJuiz.Open;
end;

procedure TfVara.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  qSelComarca.Close;
  qSelComarca.Parameters.ParamByName('UF_SIGLA').Value := RxDBLookupComboEstado.KeyValue;
  qSelComarca.Open;
end;

procedure TfVara.RxDBLookupComboVaraExit(Sender: TObject);
var Proximo : Integer;
begin
inherited;
DM.qMaxVara.Close;
DM.qMaxVara.Parameters.ParamByName('ESTADO').Value  := DM.qVaraUF_SIGLA.Value;
DM.qMaxVara.Parameters.ParamByName('COMARCA').Value := DM.qVaraCOM_COD.Value;
DM.qMaxVara.Open;
Proximo := DM.qMaxVaraMAX.Value + 1;
DM.qVaraVAR_COD.Value := Proximo;
DBEdit4.SetFocus;
end;

procedure TfVara.RxDBLookupComboEstadoExit(Sender: TObject);
begin
  inherited;
  qSelComarca.Close;
  qSelComarca.Parameters.ParamByName('UF_SIGLA').Value :=RxDBLookupComboEstado.KeyValue;
  qSelComarca.Open;
end;

procedure TfVara.BEditarClick(Sender: TObject);
begin
  Situacao := 'Edicao';
  pcampos.Enabled:=true;
  pgrid.Enabled:=true;
  bsalvar.Enabled:=true;
  bcancelar.Enabled:=true;
  bnovo.Enabled:=false;
  beditar.Enabled:=false;
  bsair.Enabled:=false;
  bexcluir.Enabled:=false;
  DBEdit4.SetFocus;
 end;
procedure TfVara.BSalvarClick(Sender: TObject);
begin
if Situacao = 'Edicao'
then begin
      with qManutencaoEdicao do
      begin
       SQL.Clear;
       SQL.Add(' update tb_varas v set v.jui_cod = :Juiz ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('Juiz').Value    := DBLookupComboBox3.KeyValue;
       Parameters.ParamByName('Estado').Value  := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value    := DM.qVaraVAR_COD.Value;
       ExecSQL;

       SQL.Clear;
       SQL.Add(' update tb_varas v set v.var_desc = :Descricao ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('Descricao').Value := DM.qVaraVAR_DESC.Value;
       Parameters.ParamByName('Estado').Value    := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value   := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value      := DM.qVaraVAR_COD.Value;
       ExecSQL;

       SQL.Clear;
       SQL.Add(' update tb_varas v set v.var_sigla = :Sigla ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('Sigla').Value   := DM.qVaraVAR_SIGLA.Value;
       Parameters.ParamByName('Estado').Value  := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value    := DM.qVaraVAR_COD.Value;
       ExecSQL;

       SQL.Clear;
       SQL.Add(' update tb_varas v set v.VAR_END = :Endereco ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('Endereco').Value:= DM.qVaraENDE_VARA.Value;
       Parameters.ParamByName('Estado').Value  := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value    := DM.qVaraVAR_COD.Value;
       ExecSQL;

       SQL.Clear;
       SQL.Add(' update tb_varas v set v.VAR_BAIRRO = :Bairro ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('Bairro').Value  := DM.qVaraBAIRRO_VARA.Value;
       Parameters.ParamByName('Estado').Value  := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value    := DM.qVaraVAR_COD.Value;
       ExecSQL;

       SQL.Clear;
       SQL.Add(' update tb_varas v set v.VAR_CID = :Cidade ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('Cidade').Value  := DM.qVaraCIDADE_VARA.Value;
       Parameters.ParamByName('Estado').Value  := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value    := DM.qVaraVAR_COD.Value;
       ExecSQL;

       SQL.Clear;
       SQL.Add(' update tb_varas v set v.VAR_CEP = :CEP ');
       SQL.Add(' where v.uf_sigla = :Estado and v.com_cod = :Comarca and v.var_cod = :Vara ');
       Parameters.ParamByName('CEP').Value     := DM.qVaraCEP_VARA.Value;
       Parameters.ParamByName('Estado').Value  := DM.qVaraUF_SIGLA.Value;
       Parameters.ParamByName('Comarca').Value := DM.qVaraCOM_COD.Value;
       Parameters.ParamByName('Vara').Value    := DM.qVaraVAR_COD.Value;
       ExecSQL;

       DM.qVara.Close;
       DM.qVara.Open;
       Showmessage ('Dados gravados com sucesso!');
       pcampos.Enabled:=false;
       pgrid.Enabled:=false;
       bsalvar.Enabled:=false;
       bcancelar.Enabled:=false;
       bnovo.Enabled:=true;
       beditar.Enabled:=true;
       bsair.Enabled:=true;
       bexcluir.Enabled:=true;
     end;
    end else begin
              with qManutencaoEdicao do
              begin
               SQL.Clear;
               SQL.Add('insert into tb_varas (uf_sigla, com_cod, var_cod, var_desc, var_sigla, jui_cod, var_end, var_bairro, var_cid, var_cep) values (:Estado, :Comarca, :Codigo, :Vara, :Sigla, :Juiz, :Endereco, :Bairro, :Cidade, :CEP) ');
               Parameters.ParamByName('Estado').Value  := DBEdit1.Text;
               Parameters.ParamByName('Comarca').Value := DBEdit2.Text;
               Parameters.ParamByName('Codigo').Value  := DBEdit3.Text;
               Parameters.ParamByName('Vara').Value    := DBEdit4.Text;
               Parameters.ParamByName('Sigla').Value   := DBEdit5.Text;
               Parameters.ParamByName('Juiz').Value    := DBEdit6.Text;
               Parameters.ParamByName('Endereco').Value:= DBEdit7.Text;
               Parameters.ParamByName('Bairro').Value  := DBEdit8.Text;
               Parameters.ParamByName('Cidade').Value  := DBEdit9.Text;
               Parameters.ParamByName('CEP').Value     := DBEdit10.Text;

               ExecSQL;

               DM.qVara.Close;
               DM.qVara.Open;
               Showmessage ('Dados gravados com sucesso!');
               pcampos.Enabled:=false;
               pgrid.Enabled:=false;
               bsalvar.Enabled:=false;
               bcancelar.Enabled:=false;
               bnovo.Enabled:=true;
               beditar.Enabled:=true;
               bsair.Enabled:=true;
               bexcluir.Enabled:=true;
              end;
             end;

end;

end.
