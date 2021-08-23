unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, shellapi;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses Unit1;
{$R *.dfm}

procedure TForm3.Button2Click(Sender: TObject);
begin
form3.Close;
form1.Close;
end;

procedure TForm3.Button1Click(Sender: TObject);
Var
  List:TStringList;
  Rec,i:integer;
  S,nazv:string;
  State:Boolean;
begin

try
  State := form3.DBGrid1.DataSource.DataSet.Active;
  if not form3.DBGrid1.DataSource.DataSet.Active then
    form3.DBGrid1.DataSource.DataSet.Open;
  List:=TStringList.Create;
  List.Clear;

  if form1.RadioButton1.Checked then
  begin
  list.Add('      Поручения на контроле, автор: '+srAuthor+ '   c ' + datetostr(form1.DateTimePicker1.datetime)+ ' по ' + datetostr(form1.DateTimePicker2.datetime));
  list.Add('      Исполнители:'+srIspoln);
  end;

  if form1.RadioButton2.Checked then
  begin
  list.Add('      Поручения не на контроле, автор: '+srAuthor+ '   c ' + datetostr(form1.DateTimePicker1.datetime)+ ' по ' + datetostr(form1.DateTimePicker2.datetime));
  list.Add('      Исполнители:'+srIspoln);
  end;

  if form1.RadioButton3.Checked then
  begin
  list.Add('     Информационные поручения, автор: '+srAuthor+ '   c ' + datetostr(form1.DateTimePicker1.datetime)+ ' по ' + datetostr(form1.DateTimePicker2.datetime));
  list.Add('      Исполнители:'+srIspoln);
  end;

  if form1.RadioButton4.Checked then
  begin
  list.Add('     Иные поручения автор: '+SRAuthor+ '   c ' + datetostr(form1.DateTimePicker1.datetime)+ ' по ' + datetostr(form1.DateTimePicker2.datetime));
  list.Add('      Исполнители:'+srIspoln);
  end;

  For i := 0 to form3.DBGrid1.Columns.Count-1 do
    s := s + form3.DBGrid1.Columns[i].Title.Caption + #9;
  s := s + #13#10;
  form3.DBGrid1.DataSource.DataSet.DisableControls;
    Rec := form3.DBGrid1.DataSource.DataSet.RecNo;
    form3.DBGrid1.DataSource.DataSet.First;

    while not form3.DBGrid1.DataSource.DataSet.Eof do
    begin
      For i := 0 to form3.DBGrid1.Columns.Count-1 do
        s := s + form3.DBGrid1.DataSource.DataSet.FieldByName(form3.DBGrid1.Columns[i].FieldName).AsString+#9;
      s := s + #13#10;
      form3.DBGrid1.DataSource.DataSet.Next;
    end;//while
    form3.DBGrid1.DataSource.DataSet.RecNo := Rec;
finally
    form3.DBGrid1.DataSource.DataSet.EnableControls;
    form3.DBGrid1.DataSource.DataSet.Active := State;
    List.Add(s);


    forceDirectories('C:\Отчеты');

    if form1.RadioButton1.Checked then
     begin
     List.SaveToFile('c:\Отчеты\1_'+ datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls');
     nazv:='c:\Отчеты\1_'+ datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls';
     shellexecute(self.Handle, 'open' , pchar(nazv) , nil , nil , SW_SHOWNORMAL);
     end;

    if form1.RadioButton2.Checked then
     begin
     List.SaveToFile('c:\Отчеты\2_' + datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls');
     nazv:='c:\Отчеты\2_' + datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls';
     shellexecute(self.Handle, 'open' , pchar(nazv) , nil , nil , SW_SHOWNORMAL);
     end;

    if form1.RadioButton3.Checked then
     begin
     List.SaveToFile('c:\Отчеты\3_' + datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls');
     nazv:='c:\Отчеты\3_' + datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls';
     shellexecute(self.Handle, 'open' , pchar(nazv) , nil , nil , SW_SHOWNORMAL);
     end;

    if form1.RadioButton4.Checked then
     begin
     List.SaveToFile('c:\Отчеты\4_' + datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls');
     nazv:='c:\Отчеты\4_' + datetostr(form1.DateTimePicker1.DateTime)+ '-'+datetostr(form1.DateTimePicker2.DateTime) +'.xls';
     shellexecute(self.Handle, 'open' , pchar(nazv) , nil , nil , SW_SHOWNORMAL);
     end;

    FreeAndNil(List);
    //showmessage('Данные были успешно экспортированы. Отчет находится Диск "С" в папке "Отчеты"');
    end;

end;
procedure TForm3.Button3Click(Sender: TObject);
begin
form3.Close;
end;

end.
