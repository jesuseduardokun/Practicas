unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  archivo: TextFile;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  CloseFile( archivo );
  Self.Close;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  if GroupBox1.Visible = False then
     GroupBox1.Visible:= True;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  GroupBox1.Visible:= False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  WriteLn ( archivo, Edit1.Text + ' ' + Edit2.Text + ' $' + Edit3.Text );
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit1.Setfocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if DirectoryExists( ExtractFilePath(Application.Exename) + 'arvo' ) = false then
     CreateDir( ExtractFilePath(Application.Exename) + 'arvo' );
  if FileExists( ExtractFilePath(Application.Exename) + 'arvo\' + 'Productos.rtf' ) = false then
     begin
     AssignFile( archivo, ExtractFilePath(Application.Exename) + 'arvo\' + 'Productos.rtf' );
     Rewrite( archivo );
     end
  else
  AssignFile( archivo, ExtractFilePath(Application.Exename) + 'arvo\' + 'Productos.rtf' );
  Append( archivo );
end;

end.

