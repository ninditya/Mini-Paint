unit frm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAChartCombos, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, Buttons, Clipbrd, LCLIntf, LCLType, StdCtrls, Spin, Menus,
  ActnList, ComCtrls, Types,


EditBtn, math, contnrs;


type
    Elemen=record
      a,b:integer;
     end;
  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    korx: TEdit;
    kory: TEdit;
    Label5: TLabel;
    LineColor: TColorButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MyCanvas: TPaintBox;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PenStyle: TChartComboBox;
    SaveDialog1: TSaveDialog;
    CanvasScroller: TScrollBox;
    SpeedButton1: TBitBtn;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton2: TBitBtn;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton3: TBitBtn;
    SpeedButton4: TBitBtn;
    Button5: TBitBtn;
    SpeedButton6: TBitBtn;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    StaticText1: TStaticText;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToolColorDropper: TSpeedButton;
    ToolDiamond: TSpeedButton;
    ToolEraser: TSpeedButton;
    ToolFill: TSpeedButton;
    ToolLine: TSpeedButton;
    ToolOval: TSpeedButton;
    ToolPencil: TSpeedButton;
    ToolPoligon: TSpeedButton;
    ToolRect: TSpeedButton;
    ToolTriangle: TSpeedButton;
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure LineColorClick(Sender: TObject);
    procedure LineColorColorChanged(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MyCanvasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyCanvasMouseLeave(Sender: TObject);
    procedure MyCanvasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure MyCanvasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MyCanvasPaint(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure TabSheet3ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure SpinEdit1Change(Sender: TObject);
    procedure TitikTengah;
    procedure ToolEraserClick(Sender: TObject);
    procedure ToolPoligonClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  objek:array[1..100]of elemen;
  TempObjek:array[1..14]of Elemen;
  l:integer;
  paintbmp: TBitmap;
  bidang: string;
  filename:string;
  MouseIsDown: Boolean;
  minimize, maximize: Boolean;
  PrevX, PrevY, X, Y, tx, ty: Integer;
  m,n,r:Integer;
  c,d,e:Integer;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);
begin
  // We create a new file/canvas/document when
  // it starts up
  MenuItem3Click(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  bidang := 'Persegi';
    Objek[1].a:=150;    Objek[1].b:=150;
    Objek[2].a:=250;    Objek[2].b:=150;
    Objek[3].a:=250;    Objek[3].b:=250;
    Objek[4].a:=150;    Objek[4].b:=250;
  FormShow(sender);
end;

procedure TForm1.FormActivate(Sender: TObject);
begin

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  MyCanvasPaint(Sender);
  if bidang = 'Persegi'  then
  begin
    paintbmp.Canvas.MoveTo(Objek[4].a,Objek[4].b);
    for l:=1 to 4 do
    paintbmp.Canvas.LineTo(Objek[l].a,Objek[l].b);
  end else
  if bidang = 'Segitiga' then
  begin
     paintbmp.Canvas.MoveTo(Objek[3].a,Objek[3].b);
     for l:=1 to 3 do
     paintbmp.Canvas.LineTo(Objek[l].a,Objek[l].b);
  end else
  if bidang = 'Oval'  then
  begin
     paintbmp.Canvas.MoveTo(Objek[1].a,Objek[1].b);
     paintbmp.Canvas.Ellipse(Objek[l].a,Objek[l].b, Objek[2].a,Objek[2].b);
  end else
  if bidang = 'Rhombus' then
  begin
     paintbmp.Canvas.MoveTo(Objek[4].a,Objek[4].b);
     for l:=1 to 4 do
     paintbmp.Canvas.LineTo(Objek[l].a,Objek[l].b);
  end  else
  if bidang = 'Pentagon' then
  begin
     paintbmp.Canvas.MoveTo(Objek[5].a,Objek[5].b);
     for l:=1 to 5 do
     paintbmp.Canvas.LineTo(Objek[l].a,Objek[l].b);
  end else
  if bidang = 'hexagon' then
  begin
     paintbmp.Canvas.MoveTo(Objek[7].a,Objek[7].b);
     for l:=1 to 7 do
     paintbmp.Canvas.LineTo(Objek[l].a,Objek[l].b);
  end;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.LineColorClick(Sender: TObject);
begin

end;

procedure TForm1.LineColorColorChanged(Sender: TObject);
begin
  paintbmp.Canvas.Pen.Color:=LineColor.ButtonColor;
  MyCanvas.Canvas.Pen.Color:=LineColor.ButtonColor;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
    // if our bitmap is already Create-ed (TBitmap.Create)
    // then start fresh

    if paintbmp <> nil then
      paintbmp.Destroy;

    paintbmp := TBitmap.Create;

    paintbmp.SetSize(Screen.Width, Screen.Height);
    paintbmp.Canvas.FillRect(0,0,paintbmp.Width,paintbmp.Height);

    paintbmp.Canvas.Brush.Style:=bsClear;
    MyCanvas.Canvas.Brush.Style:=bsClear;

    paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
    paintbmp.Canvas.Pen.Color:=LineColor.ButtonColor;
    paintbmp.Canvas.Pen.Width:=SpinEdit1.Value;
    MyCanvasPaint(Sender);
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
      if OpenDialog1.Execute then
  begin
    OpenDialog1.Filter:= 'Bitmap(*.bmp)|*.BMP';
    FileName:= OpenDialog1.FileName;
    paintbmp.LoadFromFile(FileName);
    MyCanvasPaint(Sender);
  end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
    SaveDialog1.Execute;

  if SaveDialog1.Files.Count > 0 then begin
    // if the user enters a file name without a .bmp
    // extension, we will add it
    if RightStr(SaveDialog1.FileName, 4) <> '.bmp' then
      SaveDialog1.FileName:=SaveDialog1.FileName+'.bmp';

    paintbmp.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin

end;


procedure TForm1.MyCanvasMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseIsDown := True;
  PrevX := X;
  PrevY := Y;
end;

procedure TForm1.MyCanvasMouseLeave(Sender: TObject);
begin
  korx.Text:=' ';
  kory.Text:=' ';
end;

procedure TForm1.MyCanvasMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if MouseIsDown = true then begin
    // Pencil Tool
    if ToolPencil.Down = true then begin
      paintbmp.Canvas.Line(PrevX, PrevY, X, Y);
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      MyCanvas.Canvas.Line(PrevX, PrevY, X, Y);
      PrevX:=X;
      PrevY:=Y;
    // Eraser Tool
    end else if ToolEraser.Down = true then begin
       paintbmp.Canvas.Pen.Color := clWhite;
       paintbmp.Canvas.Line(PrevX, PrevY, X, Y);
       MyCanvas.Canvas.Line(PrevX, PrevY, X, Y);
       PrevX:=X;
       PrevY:=Y;
    // Line Tool
    end else if ToolLine.Down = true then begin
      // we are clearing previous preview drawing//
      MyCanvasPaint(Sender);
      // we draw a preview line //
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      MyCanvas.Canvas.Line(PrevX, PrevY, X, Y);
    // Rectangle Tool //
    end else if ToolRect.Down = true then begin
      MyCanvasPaint(Sender);
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      MyCanvas.Canvas.Rectangle(PrevX, PrevY, X, Y);
    //Oval Tool //
    end else if ToolOval.Down = true then begin
      MyCanvasPaint(Sender);
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      MyCanvas.Canvas.Ellipse(PrevX, PrevY, X, Y);
    // Diamond Tool //
    end else if ToolDiamond.Down = true then begin
      MyCanvasPaint(Sender);
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      MyCanvas.Canvas.Line(PrevX+((X-PrevX) div 2), PrevY,X,PrevY+((Y-PrevY) div 2));
      MyCanvas.Canvas.Line(X, PrevY+((Y-PrevY) div 2), PrevX+((X-PrevX) div 2),Y);
      MyCanvas.Canvas.Line(PrevX+((X-PrevX) div 2),Y,PrevX,PrevY+((Y-PrevY) div 2));
      MyCanvas.Canvas.Line(PrevX,PrevY+((Y-PrevY) div 2),PrevX+((X-PrevX) div 2), PrevY);
    // Triangle Tool //
    end else if ToolTriangle.Down = true then begin
      MyCanvasPaint(Sender);
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      MyCanvas.Canvas.Line(PrevX,Y,PrevX+((X-PrevX) div 2), PrevY);
      MyCanvas.Canvas.Line(PrevX+((X-PrevX) div 2),PrevY,X,Y);
      MyCanvas.Canvas.Line(PrevX,Y,X,Y);
    // Pentagon Tool //
    end else if ToolPoligon.Down = true then begin
      MyCanvasPaint(Sender);
      paintbmp.Canvas.Pen.Style:=PenStyle.PenStyle;
      c := round (1*(X-PrevX)/2);
      d := round (1*(X-PrevX)/5);
      e := round (2*(Y-PrevY)/5);
      MyCanvas.Canvas.MoveTo(PrevX,PrevY+e);
      MyCanvas.Canvas.LineTo(PrevX+d,Y);
      MyCanvas.Canvas.LineTo(X-d,Y);
      MyCanvas.Canvas.LineTo(X,PrevY+e);
      MyCanvas.Canvas.LineTo(PrevX+c,PrevY);
      MyCanvas.Canvas.LineTo(PrevX,PrevY+e);
    end;
  end;
      ////Koordinat////
      korx.Text:=IntToStr(X);
      kory.Text:=IntToStr(Y);

end;

procedure TForm1.MyCanvasMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  TempColor: TColor;
begin
  if MouseIsDown then begin
    // Line tool
    if ToolLine.Down = true then begin
      paintbmp.Canvas.Line(PrevX, PrevY, X, Y);
    // Rect tool
    end else if ToolRect.Down = true then begin
      paintbmp.Canvas.Rectangle(PrevX, PrevY, X, Y);
    // Oval tool
    end else if ToolOval.Down = true then begin
      paintbmp.Canvas.Ellipse(PrevX, PrevY, X, Y);
    // Diamond tool
    end else if ToolDiamond.Down = true then begin
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 2), PrevY,X,PrevY+((Y-PrevY) div 2));
      paintbmp.Canvas.Line(X, PrevY+((Y-PrevY) div 2), PrevX+((X-PrevX) div 2),Y);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 2),Y,PrevX,PrevY+((Y-PrevY) div 2));
      paintbmp.Canvas.Line(PrevX,PrevY+((Y-PrevY) div 2),PrevX+((X-PrevX) div 2), PrevY);
    // Triangle tool
    end else if ToolTriangle.Down = true then begin
      paintbmp.Canvas.Line(PrevX,Y,PrevX+((X-PrevX) div 2), PrevY);
      paintbmp.Canvas.Line(PrevX+((X-PrevX) div 2),PrevY,X,Y);
      paintbmp.Canvas.Line(PrevX,Y,X,Y);
    // Color Dropper Tool
    end else if ToolColorDropper.Down = true then begin
      LineColor.ButtonColor:=MyCanvas.Canvas.Pixels[X,Y];
    // (Flood) Fill Tool
    end else if ToolFill.Down = true then begin
      TempColor := paintbmp.Canvas.Pixels[X, Y];
      paintbmp.Canvas.Brush.Style := bsSolid;
      paintbmp.Canvas.Brush.Color := LineColor.ButtonColor;
      paintbmp.Canvas.FloodFill(X, Y, TempColor, fsSurface);
      paintbmp.Canvas.Brush.Style := bsClear;
      MyCanvasPaint(Sender);
    // Pentagon Tool //
    end else if ToolPoligon.Down = true then begin
      c := round (1*(X-PrevX)/2);
      d := round (1*(X-PrevX)/5);
      e := round (2*(Y-PrevY)/5);
      paintbmp.Canvas.MoveTo(PrevX,PrevY+e);
      paintbmp.Canvas.LineTo(PrevX+d,Y);
      paintbmp.Canvas.LineTo(X-d,Y);
      paintbmp.Canvas.LineTo(X,PrevY+e);
      paintbmp.Canvas.LineTo(PrevX+c,PrevY);
      paintbmp.Canvas.LineTo(PrevX,PrevY+e);
    end;
  end;
  MouseIsDown:=False;
end;

procedure TForm1.MyCanvasPaint(Sender: TObject);
begin
  paintbmp.Canvas.Pen.Color:=LineColor.ButtonColor;
  if MyCanvas.Width<>paintbmp.Width then begin
    MyCanvas.Width:=paintbmp.Width;
    // the resize will run this function again
    // so we skip the rest of the code
    Exit;
  end;
  if MyCanvas.Height<>paintbmp.Height then begin
    MyCanvas.Height:=paintbmp.Height;
    // the resize will run this function again
    // so we skip the rest of the code
    Exit;
  end;
  MyCanvas.Canvas.Draw(0,0,paintbmp);
  end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin

    TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a-SpinEdit2.Value;
      Objek[l].b:=Objek[l].b+SpinEdit2.Value;
    end;
    m:=m-SpinEdit2.Value;
    n:=n-SpinEdit2.Value;
    MenuItem3Click(Sender);
    FormShow(Sender);
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
    TitikTengah;
  for l:= 1 to 7 do
     Objek[l].b:= Objek[l].b+SpinEdit2.value;
  MenuItem3Click(Sender);
  FormShow(Sender);
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
    TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a+SpinEdit2.Value;
      Objek[l].b:=Objek[l].b-SpinEdit2.Value;
    end;
    m:=m-SpinEdit2.Value;
    n:=n-SpinEdit2.Value;
    MenuItem3Click(Sender);
    FormShow(Sender);
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
    TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a-SpinEdit2.Value;
    end;
    MenuItem3Click(Sender);
    FormShow(Sender);
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
    TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a+SpinEdit2.Value;
    end;
    MenuItem3Click(Sender);
    FormShow(Sender);
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
   TitikTengah;
   for l:= 1 to 7 do
   begin
        Objek[l].a:=Objek[l].a-m;
        Objek[l].b:=Objek[l].b-n;
        TempObjek[l].a:=Objek[l].a * SpinEdit3.Value;
        TempObjek[l].b:=Objek[l].b * SpinEdit3.Value;
        Objek[l]:=TempObjek[l];
        Objek[l].a:=Objek[l].a+m;
        Objek[l].b:=Objek[l].b+n;
   end;
   MenuItem3Click(Sender);
   FormShow(Sender);
end;

procedure TForm1.SpeedButton16Click(Sender: TObject);
begin
   TitikTengah;
   for l:= 1 to 7 do
   begin
        Objek[l].a:=Objek[l].a-m;
        Objek[l].b:=Objek[l].b-n;
        TempObjek[l].a:=Objek[l].a div SpinEdit3.Value;
        TempObjek[l].b:=Objek[l].b div SpinEdit3.Value;
        Objek[l]:=TempObjek[l];
        Objek[l].a:=Objek[l].a+m;
        Objek[l].b:=Objek[l].b+n;
   end;
  MenuItem3Click(Sender);
  FormShow(Sender);
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
var
  sdt : real;
begin
  if ComboBox1.ItemIndex=0 then sdt:= 15 mod 360 / -180*PI;
  if ComboBox1.ItemIndex=1 then sdt:= 45 mod 360 / -180*PI;
  if ComboBox1.ItemIndex=2 then sdt:= 90 mod 360 / -180*PI;
  if ComboBox1.ItemIndex=3 then sdt:= 180 mod 360 / -180*PI;
  if bidang = 'Oval' then
  begin

  end else
  begin
  TitikTengah;
  for l:=1 to 7 do
  begin
  Objek[l].a  := Objek[l].a - m;
  Objek[l].b  := Objek[l].b - n;
  TempObjek[l].a := round(Objek[l].a * cos(sdt) - Objek[l].b * sin(sdt));
  TempObjek[l].b := round(Objek[l].a * sin(sdt) + Objek[l].b * cos(sdt));
  Objek[l]   := TempObjek[l];
  Objek[l].a := Objek[l].a + m;
  Objek[l].b := Objek[l].b + n;
  end;
  MenuItem3Click(Sender);
  FormShow(Sender);
  end;
end;

procedure TForm1.SpeedButton18Click(Sender: TObject);
var
  sdt : real;
begin
  if ComboBox1.ItemIndex=0 then sdt:= 15 mod 360 / 180*PI;
  if ComboBox1.ItemIndex=1 then sdt:= 45 mod 360 / 180*PI;
  if ComboBox1.ItemIndex=2 then sdt:= 90 mod 360 / 180*PI;
  if ComboBox1.ItemIndex=3 then sdt:= 180 mod 360 / 180*PI;
    if bidang = 'Oval' then
  begin

  end else
  begin
  TitikTengah;
  for l:=1 to 7 do
  begin
  Objek[l].a  := Objek[l].a - m;
  Objek[l].b  := Objek[l].b - n;
  TempObjek[l].a := round(Objek[l].a * cos(sdt) - Objek[l].b * sin(sdt));
  TempObjek[l].b := round(Objek[l].a * sin(sdt) + Objek[l].b * cos(sdt));
  Objek[l]   := TempObjek[l];
  Objek[l].a := Objek[l].a + m;
  Objek[l].b := Objek[l].b + n;
  end;
  MenuItem3Click(Sender);
  FormShow(Sender);
  end;
end;

procedure TForm1.SpeedButton19Click(Sender: TObject);
begin
  TitikTengah;
  for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a;
      Objek[l].b:=-Objek[l].b+500;
    end;
    m:=m-500;
    n:=n-500;
    MenuItem3Click(Sender);
  paintbmp.Canvas.MoveTo(0, 500 div 2);
  paintbmp.Canvas.LineTo(500, 500 div 2);
    FormShow(Sender);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  bidang :='Segitiga';
  Objek[1].a:=30;          Objek[1].b:=100;
  Objek[2].a:=65;          Objek[2].b:=30;
  Objek[3].a:=100;         Objek[3].b:=100;
end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin
  TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=-Objek[l].a+500;
      Objek[l].b:=Objek[l].b;
    end;
    m:=-m+500;
    MenuItem3Click(Sender);
  paintbmp.Canvas.MoveTo(500 div 2, 0);
  paintbmp.Canvas.LineTo(500 div 2, 500);
  FormShow(Sender);
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
  TitikTengah;
  if (bidang='Persegi') or (bidang='Rhombus') then
  begin
      Objek[1].a:=Objek[1].a+15;
      Objek[2].a:=Objek[2].a+15;
      Objek[3].a:=Objek[3].a-15;
      Objek[4].a:=Objek[4].a-15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else
  if bidang='Segitiga' then
  begin
      Objek[1].a:=Objek[1].a+15;
      Objek[2].a:=Objek[2].a-15;
      Objek[3].a:=Objek[3].a-15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else
  if bidang='hexagon' then
  begin
      Objek[1].a:=Objek[1].a+15;
      Objek[2].a:=Objek[2].a+15;
      Objek[4].a:=Objek[4].a-15;
      Objek[5].a:=Objek[5].a-15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else
  if bidang='Oval' then
  begin
      Objek[1].a:=Objek[1].a+15;
      Objek[2].a:=Objek[2].a-15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else
  if bidang='Pentagon' then
  begin
      Objek[1].a:=Objek[1].a+15;
      Objek[2].a:=Objek[2].a+15;
      Objek[3].a:=Objek[3].a+15;
      Objek[4].a:=Objek[4].a-15;
      Objek[5].a:=Objek[5].a-15;
      Objek[6].a:=Objek[6].a-15;
      Objek[7].b:=Objek[7].b-15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end;
end;

procedure TForm1.SpeedButton22Click(Sender: TObject);
begin
  TitikTengah;
  if (bidang='Persegi') or (bidang='Rhombus') then
  begin
      Objek[1].b:=Objek[1].b+15;
      Objek[2].b:=Objek[2].b-15;
      Objek[3].b:=Objek[3].b-15;
      Objek[4].b:=Objek[4].b+15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else
  if bidang='Persegipanjang' then
  begin
      Objek[1].b:=Objek[1].b+15;
      Objek[2].b:=Objek[2].b-15;
      Objek[3].b:=Objek[3].b-15;
      Objek[4].b:=Objek[4].b+15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else

  if bidang='Segitiga' then
  begin
      Objek[1].b:=Objek[1].b+15;
      Objek[2].b:=Objek[2].b-15;
      Objek[3].b:=Objek[3].b+15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else

  if bidang='hexagon' then
  begin
      Objek[1].b:=Objek[1].b-15;
      Objek[2].b:=Objek[2].b-15;
      Objek[3].b:=Objek[3].b-15;
      Objek[4].b:=Objek[4].b+15;
      Objek[5].b:=Objek[5].b+15;
      Objek[6].b:=Objek[6].b+15;
      Objek[7].b:=Objek[7].b+15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else

  if bidang='Lingkaran' then
  begin
      Objek[1].b:=Objek[1].b+15;
      Objek[2].b:=Objek[2].b-15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end else

  if bidang='Pentagon' then
  begin
      Objek[2].b:=Objek[2].b-15;
      Objek[3].b:=Objek[3].b-15;
      Objek[4].b:=Objek[4].b+15;
      Objek[5].b:=Objek[5].b+15;
      MenuItem3Click(Sender);
    FormShow(Sender);
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  bidang := 'Pentagon';
  Objek[1].a:=200;          Objek[1].b:=200;
  Objek[2].a:=250;          Objek[2].b:=250;
  Objek[3].a:=225;          Objek[3].b:=300;
  Objek[4].a:=175;          Objek[4].b:=300;
  Objek[5].a:=150;          Objek[5].b:=250;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  bidang := 'Rhombus';
  Objek[1].a:=100;          Objek[1].b:=100;
  Objek[2].a:=150;          Objek[2].b:=150;
  Objek[3].a:=100;          Objek[3].b:=200;
  Objek[4].a:=50;           Objek[4].b:=150;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  bidang := 'Oval';
  Objek[1].a:=100;          Objek[1].b:=100;
  Objek[2].a:=200;          Objek[2].b:=200;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  bidang := 'hexagon';
  Objek[1].a:=150;          Objek[1].b:=50;
  Objek[2].a:=200;          Objek[2].b:=50;
  Objek[3].a:=225;          Objek[3].b:=100;
  Objek[4].a:=200;          Objek[4].b:=150;
  Objek[5].a:=150;          Objek[5].b:=150;
  Objek[6].a:=125;          Objek[6].b:=100;
  Objek[7].a:=150;          Objek[7].b:=50;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a-SpinEdit2.Value;
      Objek[l].b:=Objek[l].b-SpinEdit2.Value;
    end;
    m:=m-SpinEdit2.Value;
    n:=n-SpinEdit2.Value;
    MenuItem3Click(Sender);
    FormShow(Sender);
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  TitikTengah;
  for l:= 1 to 7 do
     Objek[l].b:= Objek[l].b-SpinEdit2.value;
  MenuItem3Click(Sender);
  FormShow(Sender);
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
    TitikTengah;
    for l:=1 to 7 do
    begin
      Objek[l].a:=Objek[l].a+SpinEdit2.Value;
      Objek[l].b:=Objek[l].b+SpinEdit2.Value;
    end;
    m:=m-SpinEdit2.Value;
    n:=n-SpinEdit2.Value;
    MenuItem3Click(Sender);
    FormShow(Sender);
end;

procedure TForm1.TabSheet3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  paintbmp.Canvas.Pen.Width:=SpinEdit1.Value;
  MyCanvas.Canvas.Pen.Width:=SpinEdit1.Value;
end;

procedure Tform1.TitikTengah;
var
  tx,ty : integer;
begin
  tx:=0;    ty:=0;
  if bidang='Persegi' then
  begin
  for l:=1 to 4 do
  begin
    tx:=tx+Objek[l].a;
  end;
  for l:=1 to 4 do
  begin
    ty:=Objek[l].b+ty;
  end;
  m:=round(tx/4);
  n:=round(ty/4);
  end else

  if bidang='Rhombus' then
  begin
  for l:=1 to 4 do
  begin
    tx:=tx+Objek[l].a;
  end;
  for l:=1 to 4 do
  begin
    ty:=Objek[l].b+ty;
  end;
  m:=round(tx/4);
  n:=round(ty/4);
  end else

  if bidang='Segitiga' then
  begin
  for l:=1 to 3 do
  begin
    tx:=tx+Objek[l].a;
  end;
  for l:=1 to 3 do
  begin
    ty:=Objek[l].b+ty;
  end;
  m:=round(tx/3);
  n:=round(ty/3);
  end else

  if bidang='Oval' then
  begin
  for l:=1 to 2 do
  begin
    tx:=tx+Objek[l].a;
  end;
  for l:=1 to 2 do
  begin
    ty:=Objek[l].b+ty;
  end;
  m:=round(tx/2);
  n:=round(ty/2);
  r:=Objek[l].a-m;
  end else

  if bidang='Pentagon' then
  begin
  for l:=1 to 5 do
  begin
    tx:=tx+Objek[l].a;
  end;
  for l:=1 to 5 do
  begin
    ty:=Objek[l].b+ty;
  end;
  m:=round(tx/5);
  n:=round(ty/5);
  end else

  if bidang='hexagon' then
  begin
  for l:=1 to 6 do
  begin
    tx:=tx+Objek[l].a;
  end;
  for l:=1 to 6 do
  begin
    ty:=Objek[l].b+ty;
  end;
  m:=round(tx/6);
  n:=round(ty/6);
  end;
  end;

procedure TForm1.ToolEraserClick(Sender: TObject);
begin

end;

procedure TForm1.ToolPoligonClick(Sender: TObject);
begin

end;

end.

