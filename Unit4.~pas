unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DBCtrls;

type
  TForm4 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form4: TForm4;

implementation
uses Unit1,Unit2;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var i:integer;
begin
for i:=0 to self.ListBox1.Count-1 do
 begin
 if self.ListBox1.Selected[i] then
                              begin
                              self.ListBox2.Items.Add(self.ListBox1.Items[i]);

                              end;
 end;
self.ListBox1.DeleteSelected;
 end;

procedure TForm4.Button2Click(Sender: TObject);
var i:integer;
begin

for i:=0 to self.ListBox2.Count-1 do
 begin
  if self.ListBox2.Selected[i] then
                                begin
                                self.ListBox1.Items.Add(self.ListBox2.Items[i]);
                                self.ListBox1.Sorted:=true;
                                end;


 end;
self.ListBox2.DeleteSelected;

end;

procedure TForm4.Button3Click(Sender: TObject);
var i:integer;
begin

for i:=0 to self.ListBox1.Count-1 do
                                  begin
                                   self.ListBox2.Items.Add(self.ListBox1.Items[i]);
                                   self.ListBox2.Sorted:=true;
                                  end;

  self.ListBox1.Items.Clear;


end;

procedure TForm4.Button4Click(Sender: TObject);
var i:integer;
begin
for i:=0 to self.ListBox2.Count-1 do
                                  begin
                                   self.ListBox1.Items.Add(self.ListBox2.Items[i]);
                                   self.ListBox1.Sorted:=true;
                                  end;
self.ListBox2.Items.Clear;

end;

procedure TForm4.Button5Click(Sender: TObject);
begin
if self.ListBox2.Count=1 then form1.Edit1.Text:=form4.ListBox2.Items[0];
if self.ListBox2.Count>1 then form1.Edit1.Text:='<...>';
if self.ListBox2.Count=0 then form1.Edit1.Text:='Не выбран автор';
self.ListBox2.Items.SaveToFile('C:\Отчеты\Авторы.txt');
form4.Close;
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
self.ListBox2.Clear;
end;

end.
