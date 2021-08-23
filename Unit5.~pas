unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi;

type
  TForm5 = class(TForm)
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
  Form5: TForm5;

implementation
uses Unit1;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
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

procedure TForm5.Button2Click(Sender: TObject);
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

procedure TForm5.Button3Click(Sender: TObject);
var i:integer;
begin
for i:=0 to self.ListBox1.Count-1 do
                                  begin
                                   self.ListBox2.Items.Add(self.ListBox1.Items[i]);
                                   self.ListBox2.Sorted:=true;
                                  end;

  self.ListBox1.Items.Clear;
end;

procedure TForm5.Button4Click(Sender: TObject);
var i:integer;
begin
for i:=0 to self.ListBox2.Count-1 do
                                  begin
                                   self.ListBox1.Items.Add(self.ListBox2.Items[i]);
                                   self.ListBox1.Sorted:=true;
                                  end;
self.ListBox2.Items.Clear;
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
if self.ListBox2.Count=1 then form1.Edit2.Text:=form5.ListBox2.Items[0];
if self.ListBox2.Count>1 then form1.Edit2.Text:='<...>';
if self.ListBox2.Count=0 then form1.Edit2.Text:='Не выбран Исполнитель';
self.ListBox2.Items.SaveToFile('C:\Отчеты\Исполнители.txt');
form5.Close;

end;

procedure TForm5.Button6Click(Sender: TObject);
begin
self.ListBox2.Clear;
end;

end.
