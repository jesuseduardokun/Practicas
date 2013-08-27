unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
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
  nombre:= Edit1.Text;
  ext:= Edit2.Text;
  contenido:= Edit3.Text;
  ruta:= Edit4.Text;
  AssignFile( archivo, ruta + nombre + '.' + ext );
  Rewrite( archivo );
  WriteLn ( archivo, contenido );
  CloseFile( archivo );
end;

end.

