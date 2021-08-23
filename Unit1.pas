unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, DB, ADODB, ComCtrls, OleServer, Excel2000,
  Grids, DBGrids, ExtCtrls, shellapi, jpeg;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button3: TButton;
    ADOQuery1: TADOQuery;
    Lable4: TLabel;
    Edit2: TEdit;
    Button4: TButton;
    Image1: TImage;
    ADOQuery2: TADOQuery;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  TabName, DocNom, sAuthor,sIspoln,srAuthor,srIspoln: string;
  TabNameind, count,reccount: integer;
  implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}


procedure Kod_author;
var i,l:integer;
    s:string;
 begin

if form4.ListBox2.Count>1 then
                           begin
                                  for i:=0 to form4.ListBox2.Count-1 do
                                    begin
                                    if form1.ADOQuery1.Locate('Автор поручения',form4.ListBox2.Items[i],[loPartialKey])=true then
                                                                                                                             begin
                                                                                                                             srAuthor:=srAuthor+form4.ListBox2.Items[i]+', ';
                                                                                                                             s:=s+chr(39)+form1.ADOQuery1.Fields[1].AsString+chr(39)+', ';
                                     end;                                                                                    end;
                           l:=Length(s)-2;
                           delete(s,l,2);
                           sAuthor:=s+chr(39);
                           end;

if form4.ListBox2.Count=1 then
                           begin
                           if form1.ADOQuery1.Locate('Автор поручения',form4.ListBox2.Items[0],[loPartialKey])=true then s:=form1.ADOQuery1.Fields[1].AsString;
                           sAuthor:=chr(39)+s+chr(39);
                           srAuthor:=form4.ListBox2.Items[0];
                           end;
 end;

procedure Kod_ispoln;
var i,l:integer;
    s:string;
 begin

if form5.ListBox2.Count>1 then
                           begin
                                  for i:=0 to form5.ListBox2.Count-1 do
                                    begin
                                    if form1.ADOQuery2.Locate('Автор поручения',form5.ListBox2.Items[i],[loPartialKey])=true then
                                                                                                                             begin
                                                                                                                             srIspoln:=srIspoln+form5.ListBox2.Items[i]+', ';
                                                                                                                             s:=s+chr(39)+form1.ADOQuery2.Fields[1].AsString+chr(39)+', ';
                                                                                                                             end;
                                    end;
                           l:=Length(s)-2;
                           delete(s,l,2);
                           sIspoln:=s+chr(39);
                           end;

if form5.ListBox2.Count=1 then
                           begin
                           if form1.ADOQuery2.Locate('Автор поручения',form5.ListBox2.Items[0],[loPartialKey])=true then s:=form1.ADOQuery2.Fields[1].AsString;
                           sIspoln:=chr(39)+s+chr(39);
                           srispoln:=form5.ListBox2.Items[0];
                           end;
 end;



procedure TForm1.Button1Click(Sender: TObject);

begin
      sAuthor:='';
      sIspoln:='';
      if form1.ADOConnection1.Connected then
        begin
        with form1.ADOQuery1 do
         begin

          form1.ADOQuery1.Close;
          form1.ADOQuery1.SQL.Clear;
          form1.ADOQuery1.SQL.Text:= 'SELECT  Name AS ' + chr(39) + 'Автор поручения' + chr(39) + ',' + 'hUG FROM UserGroupInfo WHERE AsGroup <> 1 AND Name NOT IN ('+chr(39)+'Администратор'+chr(39)+','+chr(39)+'Гость'+chr(39)+ ',' +chr(39)+ 'update' +chr(39)+') order by Name';
          form1.ADOQuery1.Open;

        if (form4.ListBox1.Count=0) and (form4.ListBox2.Count=0) then
          begin
          for count:=0 to (form1.ADOQuery1.RecordCount-1) do
              begin

                  form4.ListBox1.Items.Add(form1.ADOQuery1.Fields[0].AsString);
                  self.ADOQuery1.Next;

              end;
          end;

          form2.DBGrid1.Columns[1].Visible:=false;
         end;

        end;


if fileexists('C:\Отчеты\Авторы.txt')=false then filecreate('C:\Отчеты\Авторы.txt') else form4.ListBox2.Items.LoadFromFile('C:\Отчеты\Авторы.txt');
//form4.ListBox2.Items.LoadFromFile('C:\Отчеты\Авторы.txt');
form4.ShowModal;
 
 end;

procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
    fpol,spol:string;
begin
      if (self.Edit1.Text='') or (self.Edit2.Text='') then showmessage('ВНИМАНИЕ! Не выбран автор и(или) исполнитель') else
      begin
       if sAuthor='' then Kod_author;
       if sIspoln='' then Kod_Ispoln;
        if form1.ADOConnection1.Connected then
         begin
          with form1.ADOQuery1 do
           begin

            form1.ADOQuery1.Close;
            form1.ADOQuery1.SQL.Clear;

             if form1.RadioButton1.Checked then
              begin

              form1.ADOQuery1.SQL.Add('select d.regNum AS '+chr(39)+'Входящий №' +chr(39) + ',' + ' t.TaskStarttime AS ' + chr(39) + 'Дата регистрации' +chr(39) + ',' + ' c.Name AS ' + chr(39) + 'Автор поручения' + chr(39) + ',' + ' (select name from usergroupinfo where hug=t.HtaskExecutor) AS ' + chr(39) + 'Исполнитель поручения' + chr(39) + ',' + ' d.documentName AS ' + chr(39)+ 'Краткое содержание документа' + chr(39) + ',' + ' t.TaskDeadLine AS ' + chr(39) + 'Срок исполнения' + chr(39) + ',' + ' t.TaskExecutionTime AS ' + chr(39) + 'Дата исполнения' + chr(39) + ',' + ' datediff(dd,t.TaskDeadLine,t.TaskExecutionTime) AS ' +chr(39)+ ' Просроченно дней' + chr(39));
              form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.HTaskExecutor in (' +sIspoln+ ')) and (t.Taskstarttime >=:0) and (t.TaskExecutionTime<=:1) and (t.TaskState<>6) and ((t.TaskDirective  LIKE ' + chr(39) + '%контроль%' +chr(39) + ') or (t.TaskDirective LIKE ' + chr(39) + '%Контроль%' +chr(39) + ')) and (datediff(dd,t.TaskDeadLine,t.TaskExecutionTime)>0)  Union');

              form1.ADOQuery1.SQL.Add('select d.regNum ,t.TaskStarttime,c.Name,(select name from usergroupinfo where hug=t.HtaskExecutor),d.DocumentName,t.TaskDeadLine ,t.TaskExecutionTime, datediff(dd,t.TaskDeadLine,GetDate())');
              form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+')) and (t.HTaskExecutor in (' +sIspoln+ ')) and (t.Taskstarttime >=:2) and (t.TaskExecutionTime is null) and (t.TaskState<>6) and ((t.TaskDirective  LIKE ' + chr(39) + '%контроль%' +chr(39) + ') or (t.TaskDirective LIKE ' + chr(39) + '%Контроль%' +chr(39) + ')) and (datediff(dd,t.TaskDeadLine,GetDate())>0)  order by t.TaskStartTime');

              self.ADOQuery1.Parameters.ParamByName('0').Value:=form1.DateTimePicker1.DateTime;
              self.ADOQuery1.Parameters.ParamByName('1').Value:=form1.DateTimePicker2.DateTime;
              self.ADOQuery1.Parameters.ParamByName('2').Value:=form1.DateTimePicker1.DateTime;

              form1.ADOQuery1.Prepared;
              form1.ADOQuery1.open;

             (form1.ADOQuery1.FieldByName('Дата регистрации') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
             (form1.ADOQuery1.FieldByName('Срок исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
             (form1.ADOQuery1.FieldByName('Дата исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';

              form3.Label2.Caption:=inttostr(self.ADOQuery1.RecordCount);
              form3.DBGrid1.Columns[0].Width:=70;
              form3.DBGrid1.Columns[2].Width:=100;
              form3.DBGrid1.Columns[3].Width:=130;
              form3.DBGrid1.Columns[4].Width:=370;

              showmessage(form3.DBGrid1.Fields[0].asstring);
             // for i:=0 to self.ADOQuery1.RecordCount do
               // begin
                 //if form3.DBGrid1.Columns.Items[i]

               // end;


              end;

             if form1.RadioButton2.Checked then
              begin

              form1.ADOQuery1.SQL.Add('select d.regNum AS '+chr(39)+'Входящий №' +chr(39) + ',' + ' t.TaskStarttime AS ' + chr(39) + 'Дата регистрации' +chr(39) + ',' + ' c.Name AS ' + chr(39) + 'Автор поручения' + chr(39) + ',' + ' (select name from usergroupinfo where hug=t.HtaskExecutor) AS ' + chr(39) + 'Исполнитель поручения' + chr(39) + ',' + ' d.documentName AS ' + chr(39)+ 'Краткое содержание документа' + chr(39) + ',' + ' t.TaskDeadLine AS ' + chr(39) + 'Срок исполнения' + chr(39) + ',' + ' t.TaskExecutionTime AS ' + chr(39) + 'Дата исполнения' + chr(39) + ',' + ' datediff(dd,t.TaskDeadLine,t.TaskExecutionTime) AS ' +chr(39)+ ' Просроченно дней' + chr(39));
              form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.Taskstarttime >=:0) and (t.TaskExecutionTime<=:1) and (t.TaskState<>6) and ((t.TaskDirective  LIKE ' + chr(39) + '%неконтроль%' + chr(39) + ') or (t.TaskDirective LIKE ' + chr(39) + '%Неконтроль%' +chr(39) + ')) and (datediff(dd,t.TaskDeadLine,t.TaskExecutionTime)>0) Union ');

              form1.ADOQuery1.SQL.Add('select d.regNum ,t.TaskStarttime,c.Name,(select name from usergroupinfo where hug=t.HtaskExecutor),d.DocumentName,t.TaskDeadLine ,t.TaskExecutionTime, datediff(dd,t.TaskDeadLine,GetDate())');
               form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.Taskstarttime >=:2) and (t.TaskExecutionTime is null) and (t.TaskState<>6) and ((t.TaskDirective  LIKE ' + chr(39) + '%неконтроль%' + chr(39) + ') or (t.TaskDirective LIKE ' + chr(39) + '%Неконтроль%' +chr(39) + ')) and (datediff(dd,t.TaskDeadLine,GetDate())>0) order by t.TaskStartTime ');

              self.ADOQuery1.Parameters.ParamByName('0').Value:=form1.DateTimePicker1.DateTime;
              self.ADOQuery1.Parameters.ParamByName('1').Value:=form1.DateTimePicker2.DateTime;
              self.ADOQuery1.Parameters.ParamByName('2').Value:=form1.DateTimePicker1.DateTime;

              self.ADOQuery1.Prepared;
              form1.ADOQuery1.Open;

              (form1.ADOQuery1.FieldByName('Дата регистрации') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
              (form1.ADOQuery1.FieldByName('Срок исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
              (form1.ADOQuery1.FieldByName('Дата исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';

              form3.Label2.Caption:=inttostr(self.ADOQuery1.RecordCount);
              form3.DBGrid1.Columns[0].Width:=70;
              form3.DBGrid1.Columns[2].Width:=100;
              form3.DBGrid1.Columns[3].Width:=130;
              form3.DBGrid1.Columns[4].Width:=370;
              end;

             if form1.RadioButton3.Checked then
              begin
              form1.ADOQuery1.SQL.Add('select d.regNum AS '+chr(39)+'Входящий №' +chr(39) + ',' + ' t.TaskStarttime AS ' + chr(39) + 'Дата регистрации' +chr(39) + ',' + ' c.Name AS ' + chr(39) + 'Автор поручения' + chr(39) + ',' + ' (select name from usergroupinfo where hug=t.HtaskExecutor) AS ' + chr(39) + 'Исполнитель поручения' + chr(39) + ',' + ' d.documentName AS ' + chr(39)+ 'Краткое содержание документа' + chr(39) + ',' + ' t.TaskDeadLine AS ' + chr(39) + 'Срок исполнения' + chr(39) + ',' + ' t.TaskExecutionTime AS ' + chr(39) + 'Дата исполнения' + chr(39) + ',' + ' datediff(dd,t.TaskDeadLine,t.TaskExecutionTime) AS ' +chr(39)+ ' Просроченно дней' + chr(39));
              form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.TaskstartTime >=:0) and (t.TaskExecutionTime<=:1) and (t.TaskState<>6) and ((t.TaskDirective  LIKE ' + chr(39) + '%Информац%' + chr(39) + ') or (t.TaskDirective LIKE ' + chr(39) + '%информац%' +chr(39) + ')) and (datediff(dd,t.TaskDeadLine,t.TaskExecutionTime)>0) Union ');

              form1.ADOQuery1.SQL.Add('select d.regNum ,t.TaskStarttime,c.Name,(select name from usergroupinfo where hug=t.HtaskExecutor),d.DocumentName,t.TaskDeadLine ,t.TaskExecutionTime, datediff(dd,t.TaskDeadLine,GetDate())');
               form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.TaskstartTime >=:2) and (t.TaskExecutionTime is null) and (t.TaskState<>6) and ((t.TaskDirective  LIKE ' + chr(39) + '%Информац%' + chr(39) + ') or (t.TaskDirective LIKE ' + chr(39) + '%информац%' +chr(39) + ')) and (datediff(dd,t.TaskDeadLine,GetDate())>0) order by t.TaskStartTime ');

              self.ADOQuery1.Parameters.ParamByName('0').Value:=form1.DateTimePicker1.DateTime;
              self.ADOQuery1.Parameters.ParamByName('1').Value:=form1.DateTimePicker2.DateTime;
              self.ADOQuery1.Parameters.ParamByName('2').Value:=form1.DateTimePicker1.DateTime;
              self.ADOQuery1.Prepared;
              form1.ADOQuery1.Open;

              (form1.ADOQuery1.FieldByName('Дата регистрации') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
              (form1.ADOQuery1.FieldByName('Срок исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
              (form1.ADOQuery1.FieldByName('Дата исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';

              form3.Label2.Caption:=inttostr(self.ADOQuery1.RecordCount);
              form3.DBGrid1.Columns[0].Width:=70;
              form3.DBGrid1.Columns[2].Width:=100;
              form3.DBGrid1.Columns[3].Width:=130;
              form3.DBGrid1.Columns[4].Width:=370;
              end;

             if form1.RadioButton4.Checked then
              begin
              form1.ADOQuery1.SQL.Add('select d.regNum AS '+chr(39)+'Входящий №' +chr(39) + ',' + ' t.TaskStarttime AS ' + chr(39) + 'Дата регистрации' +chr(39) + ',' + ' c.Name AS ' + chr(39) + 'Автор поручения' + chr(39) + ',' + ' (select name from usergroupinfo where hug=t.HtaskExecutor) AS ' + chr(39) + 'Исполнитель поручения' + chr(39) + ',' + ' d.documentName AS ' + chr(39)+ 'Краткое содержание документа' + chr(39) + ',' + ' t.TaskDeadLine AS ' + chr(39) + 'Срок исполнения' + chr(39) + ',' + ' t.TaskExecutionTime AS ' + chr(39) + 'Дата исполнения' + chr(39) + ',' + ' datediff(dd,t.TaskDeadLine,t.TaskExecutionTime) AS ' +chr(39)+ ' Просроченно дней' + chr(39));
              form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.TaskstartTime >=:0) and (t.TaskExecutionTime<=:1) and (t.TaskState<>6) and ((t.TaskDirective not LIKE ' + chr(39) + '%контроль%' + chr(39) + ') and (t.TaskDirective not LIKE ' + chr(39) + '%Контроль%' + chr(39) + ') and (t.TaskDirective not LIKE ' + chr(39) + '%неконтроль%' + chr(39) + ') and (t.TaskDirective not LIKE ' + chr(39) + '%Неконтроль%' + chr(39) + ') and (t.TaskDirective not Like ' + chr(39) + '%информац%' + chr(39) + ') and (t.TaskDirective not Like ' + chr(39) + '%Информац%' + chr(39)+ ')) and (datediff(dd,t.TaskDeadLine,t.TaskExecutionTime)>0) Union ');

              form1.ADOQuery1.SQL.Add('select d.regNum ,t.TaskStarttime,c.Name,(select name from usergroupinfo where hug=t.HtaskExecutor),d.DocumentName,t.TaskDeadLine ,t.TaskExecutionTime, datediff(dd,t.TaskDeadLine,GetDate())');
               form1.ADOQuery1.SQL.Add('from Tasks t inner Join Documentinfo d ON RIGHT(t.TaskLink, LEN(t.TaskLink) - 1) = d.hDocument inner Join UserGroupInfo c on t.HtaskAuthor=c.Hug');
              form1.ADOQuery1.SQL.Add('where (t.htaskauthor in ('+sAuthor+ ')) and (t.TaskstartTime >=:2) and (t.TaskExecutionTime is null) and (t.TaskState<>6) and ((t.TaskDirective not LIKE ' + chr(39) + '%контроль%' + chr(39) + ') and (t.TaskDirective not LIKE ' + chr(39) + '%Контроль%' + chr(39) + ') and (t.TaskDirective not LIKE ' + chr(39) + '%неконтроль%' + chr(39) + ') and (t.TaskDirective not LIKE ' + chr(39) + '%Неконтроль%' + chr(39) + ') and (t.TaskDirective not Like ' + chr(39) + '%информац%' + chr(39) + ') and (t.TaskDirective not Like ' + chr(39) + '%Информац%' + chr(39)+ ')) and (datediff(dd,t.TaskDeadLine,GetDate())>0) order by t.TaskStartTime ');

              self.ADOQuery1.Parameters.ParamByName('0').Value:=form1.DateTimePicker1.DateTime;
              self.ADOQuery1.Parameters.ParamByName('1').Value:=form1.DateTimePicker2.DateTime;
              self.ADOQuery1.Parameters.ParamByName('2').Value:=form1.DateTimePicker1.DateTime;

              self.ADOQuery1.Prepared;
              form1.ADOQuery1.Open;

              (form1.ADOQuery1.FieldByName('Дата регистрации') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
              (form1.ADOQuery1.FieldByName('Срок исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';
              (form1.ADOQuery1.FieldByName('Дата исполнения') as Tdatetimefield).DisplayFormat:='dd.mm.yyyy';

              form3.Label2.Caption:=inttostr(self.ADOQuery1.RecordCount);
              form3.DBGrid1.Columns[0].Width:=70;
              form3.DBGrid1.Columns[2].Width:=100;
              form3.DBGrid1.Columns[3].Width:=130;
              form3.DBGrid1.Columns[4].Width:=370;

          {   for i := 0 to self.ADOQuery1.RecordCount-1 do
               begin
                Fpol:=self.ADOQuery1.Fields.Fields[0].AsString;
                SELF.ADOQuery1.Next;
                Spol:=self.ADOQuery1.Fields.Fields[0].AsString;
                if fpol=spol then
                               begin

                                self.ADOQuery1.prior;
                                self.ADOQuery1.Edit;
                                self.ADOQuery1.Delete;
                                self.ADOQuery1.Refresh;
                                //self.ADOQuery1.Next;
                               end;

               end;}


            end;

       end;
           end;
         end;

//reccount:=form1.ADOQuery1.RecordCount;
form3.ShowModal;

end;



procedure TForm1.Button3Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin

form1.DateTimePicker2.Date:=Now;
form1.DateTimePicker1.Date:=form1.DateTimePicker2.Date-30;

end;
procedure TForm1.Button4Click(Sender: TObject);

begin
sIspoln:='';
      if form1.ADOConnection1.Connected then
        begin
        with form1.ADOQuery2 do
         begin

          form1.ADOQuery2.Close;
          form1.ADOQuery2.SQL.Clear;
          form1.ADOQuery2.SQL.Text:= 'SELECT  Name AS ' + chr(39) + 'Автор поручения' + chr(39) + ',' + 'hUG FROM UserGroupInfo WHERE AsGroup <> 1 AND Name NOT IN ('+chr(39)+'Администратор'+chr(39)+','+chr(39)+'Гость'+chr(39)+ ',' +chr(39)+ 'update' +chr(39)+') order by Name';
          form1.ADOQuery2.Open;

        if (form5.ListBox1.Count=0) and (form5.ListBox2.Count=0) then
          begin
          for count:=0 to (form1.ADOQuery2.RecordCount-1) do
              begin

                  form5.ListBox1.Items.Add(form1.ADOQuery2.Fields[0].AsString);
                  self.ADOQuery2.Next;

              end;
          end;


         end;

        end;

if fileexists('C:\Отчеты\Исполнители.txt')=false then filecreate('C:\Отчеты\Исполнители.txt') else form5.ListBox2.Items.LoadFromFile('C:\Отчеты\Исполнители.txt');
//form5.ListBox2.Items.LoadFromFile('C:\Отчеты\Исполнители.txt');
form5.ShowModal;

end;

end.
