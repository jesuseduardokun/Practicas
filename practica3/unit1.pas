unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  archivo: TextFile;
  nombre: string;
  ext: string;
  contenido: string;
  ruta: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  nombre:= Edit1.Text + '.' + Edit2.Text;
  contenido:= Edit3.Text;
  if FileExists( ExtractFilePath(Application.Exename) + 'arvo\' + nombre ) = true then
     ShowMessage('El archivo ya existe. Por favor cambie el nombre o la extension.')
  else
      begin
      AssignFile( archivo, ExtractFilePath(Application.Exename) + 'arvo\' + nombre );
      Rewrite( archivo );
      WriteLn ( archivo, contenido );
      CloseFile( archivo );
      end
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Self.Close;
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
end;

end.

