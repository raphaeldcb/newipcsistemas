unit ufNomes;

interface

uses WinTypes, WinProcs, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, Mask, DBCtrls, ExtCtrls,SysUtils, DB, JvExExtCtrls,
  JvExtComponent, JvSpeedbar;

type
  TfNomes = class(TForm)
    GroupBox1: TGroupBox;
    SpeedBar1: TJvSpeedBar;
    procedure FormShow(Sender: TObject);
    procedure SpeedItemSairClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNomes: TfNomes;

implementation

{$R *.DFM}
uses ufProcesso;

procedure TfNomes.FormShow(Sender: TObject);
var
	i,Pos : byte;
    Comp : TComponent;
begin
	Pos := 1;

    for i := 0 to ComponentCount - 1 do
    begin
        if (Components[i] is TLabel) and
        	(fProcessos.qProcessoCPG.State = dsEdit) then
            TLabel(Components[i]).Font.Color := clBlue;
    end;

//    DBEdit1.Enabled := False;
//    DBEdit2.Enabled := False;
//    DBEdit3.Enabled := False;
//    DBEdit4.Enabled := False;

    for i := 1 to 4 do
    begin
        if Nome[i] <> '' then
        begin
            if i = 1 then
            begin
//                Label1.Caption := Nome[i]+':';
//                DBEdit1.DataField := 'N'+InttoStr(Pos);
 //               DBEdit1.Enabled := True;
            end
            else if i = 2 then
            begin
//                Label2.Caption := Nome[i]+':';
//                DBEdit2.DataField := 'N'+InttoStr(Pos);
//                DBEdit2.Enabled := True;
            end
            else if i = 3 then
            begin
//                Label3.Caption := Nome[i]+':';
//                DBEdit3.DataField := 'N'+InttoStr(Pos);
//                DBEdit3.Enabled := True;
            end
            else if i = 4 then
            begin
//                Label4.Caption := Nome[i]+':';
//                DBEdit4.DataField := 'N'+InttoStr(Pos);
//                DBEdit4.Enabled := True;
            end;
            Inc(Pos);
        end;
    end;
    Height := 106 + (28*(Pos-2));
end;

procedure TfNomes.SpeedItemSairClick(Sender: TObject);
begin
	Close;
end;

procedure TfNomes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	Tecla: word;
begin
    Tecla := Key;
    Key := $1A; {tecla indefinida: (Help "Virtual Key Codes")}
    case Tecla of
        $53: {VK_S:}
            if (Shift = [ssCtrl]) then
                SpeedItemSairClick(Sender);
        VK_RETURN:
            if (Shift = [ssCtrl]) then
                SpeedItemSairClick(Sender)
            else
                 SelectNext(ActiveControl as tWinControl, True, True );
    end;
end;

procedure TfNomes.FormCreate(Sender: TObject);
begin
//	DBedit1.DataSource := fProcessos.dsp;
//	DBedit2.DataSource := fProcessos.dsp;
//	DBedit3.DataSource := fProcessos.dsp;
//	DBedit4.DataSource := fProcessos.dsp;
end;

end.
