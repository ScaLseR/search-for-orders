unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls,DB;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses Unit1,Unit4;
{$R *.dfm}

procedure end_sel;
begin
TabName:= form1.ADOQuery1.Fields[0].AsString;
form1.Edit1.Text:=TabName;
Tabnameind:=form1.ADOQuery1.Fields[1].AsInteger;
form2.Edit1.Text:='';
form2.Close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
end_sel;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
end_sel;
end;

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
form2.DBGrid1.DataSource.DataSet.Locate('Автор поручения', key , [loPartialKey]);
if key=#13 then end_sel;
form2.Edit1.Text:='';
end;



procedure TForm2.Edit1Change(Sender: TObject);
begin
form2.DBGrid1.DataSource.DataSet.Locate('Автор поручения', form2.Edit1.Text , [loPartialKey]);
end;

end.
