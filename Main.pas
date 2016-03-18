unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, StdCtrls, Registry, Vcl.ImgList, Vcl.ToolWin, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Vcl.StdActns, System.Generics.Collections
  , splash;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    lblPlayer1Score: TLabel;
    pnlFirst: TPanel;
    imgFirst: TImage;
    pnlNextFigure: TPanel;
    imgNextFigure: TImage;
    lblPlayer1Level: TLabel;
    pnlSecond: TPanel;
    imgSecond: TImage;
    pnlNextFigureSecond: TPanel;
    imgNextFigureSecond: TImage;
    Timer2: TTimer;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    DateiFileExit1: TFileExit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Action1: TAction;
    Action2: TAction;
    pnlSightBlock: TPanel;
    scrlbrSQRS: TScrollBar;
    scrlbrHeight: TScrollBar;
    scrlbrWidth: TScrollBar;
    pnlParentContainer: TPanel;
    lblCustomize: TLabel;
    lblCustomHeight: TLabel;
    lblCustomWidth: TLabel;
    lblCustomSqrSize: TLabel;
    lblPause: TLabel;
    tmrButton: TTimer;
    lblPlayer1Name: TLabel;
    lblPlayer2Score: TLabel;
    lblPlayer2Level: TLabel;
    lblPlayer2Name: TLabel;
    procedure mnuNewClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure tmrButtonTimer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure initStartPanel(aSecond: Boolean = False);
    procedure FormResize(Sender: TObject);
    procedure pnlSightBlockAlignPosition(Sender: TWinControl; Control: TControl;
      var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect;
      AlignInfo: TAlignInfo);
    procedure scrlbrSQRSChange(Sender: TObject);
    procedure goSplashScreen;
    procedure goEndScreen(p1 : Boolean);

      private
    { Private declarations }
  public
    { Public declarations }
  end;

  TTetr = Array [1..4,1..4] of Byte;

const
  arrFigure: Array [1..11, 1..4] of TTetr =    //       zuerst l�nge dan breite halt so halt
  (
(((1,1,0,0),         // el1   von 4           //       figur + Drehung
  (0,1,1,0),                                  //
  (0,0,0,0),                                  //
  (0,0,0,0)),                                 //
                                              //
  ((0,1,0,0),        // el2   von 4           //
   (1,1,0,0),                                 //
   (1,0,0,0),                                 //
   (0,0,0,0)),                                //
                                              //      el 1 von 11
  ((1,1,0,0),        // el3   von 4           //
   (0,1,1,0),                                 //
   (0,0,0,0),                                 //
   (0,0,0,0)),                                //
                                              //
  ((0,1,0,0),         //el4   von 4           //
   (1,1,0,0),                                 //
   (1,0,0,0),                                 //
   (0,0,0,0))),                               //

  (((0,1,1,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,1,0,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,1,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,1,0,0),(0,1,0,0),(0,0,0,0))),

  (((0,1,0,0),(1,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,0,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,0,0),(0,1,0,0),(0,0,0,0))),

  (((0,0,0,0),(1,1,1,1),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,0,0),(0,1,0,0),(0,1,0,0)),
   ((0,0,0,0),(1,1,1,1),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,0,0),(0,1,0,0),(0,1,0,0))),

  (((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,1,0,0),(0,0,0,0),(0,0,0,0))),

  (((1,1,0,0),(0,1,0,0),(0,1,0,0),(0,0,0,0)),
   ((0,0,1,0),(1,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,0,0,0),(1,1,0,0),(0,0,0,0)),
   ((1,1,1,0),(1,0,0,0),(0,0,0,0),(0,0,0,0))),

  (((1,1,0,0),(1,0,0,0),(1,0,0,0),(0,0,0,0)),
   ((1,1,1,0),(0,0,1,0),(0,0,0,0),(0,0,0,0)),
   ((0,1,0,0),(0,1,0,0),(1,1,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,1,1,0),(0,0,0,0),(0,0,0,0))),

  (((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0)),
   ((0,1,0,0),(1,1,1,0),(0,1,0,0),(0,0,0,0))),

  (((1,1,1,0),(1,0,1,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,1,0,0),(1,1,0,0),(0,0,0,0)),
   ((1,0,1,0),(1,1,1,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(1,0,0,0),(1,1,0,0),(0,0,0,0))),

  (((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0))),


  (((1,0,0,0),(1,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,0,0,0),(1,0,0,0),(0,0,0,0),(0,0,0,0)),
   ((1,1,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0))
   )
  );

//  colors : Array [1..12] of Integer = (clAqua, clBlue, clFuchsia, clGreen,
//  clLime, clMaroon, clNavy, clOlive, clPurple, clRed, clTeal, clYellow);     //(clWebLemonChiffon, clWebRoyalBlue, clWebOrchid, clWebLimeGreen,

  colors : Array [1..12] of Integer = (clWebLightSkyBlue, clWebRoyalBlue, clWebOrchid, clWebLimeGreen,
  clWebLavender, clWebIndianRed, clWebMidnightBlue, clWebOliveDrab, clWebBlueViolet, clWebTomato, clWebDarkCyan, clWebGold);

  stkw = 10;           //      stakanbreite
  stkh = 20;           //      stakanh�he
  sqrs = 30;           //      gr�sse von einzelnen squares

var
  Form1: TForm1;
   //first player
  tetr, nexttetr : TTetr;     //nexttetris proxy
  num, nextnum : Integer;
  gen, nextgen : Integer;
  fcl,nextfcl : Integer;
  _x,_y : Integer;
  scores : Integer;
  stakan : Array [-3..stkh, 1..stkw] of Integer;
  //second player
  var_tetr, var_nexttetr : TTetr;     //nexttetris proxy
  var_num, var_nextnum : Integer;
  var_gen, var_nextgen : Integer;
  var_fcl, var_nextfcl : Integer;
  var_x,var_y : Integer;
  var_scores : Integer;
  var_stakan : Array [-3..stkh, 1..stkw] of Integer;
  //reg
  reg : TRegistry;
  clickedStart: Boolean;

implementation

{$R *.DFM}

procedure setspeed(s : Integer; aSecond: Boolean = False);
begin
  if aSecond then
  begin
    Form1.lblPlayer2Level.Caption := 'Level: ' + IntToStr(s);
    Form1.Timer2.Interval := 500 - (s-1) * 100; //game-speed
  end
  else
  begin
    Form1.lblPlayer1Level.Caption := 'Level: ' + IntToStr(s);
    Form1.Timer1.Interval := 500 - (s-1) * 100;
  end;
end;

procedure drawsquare(i,j,color : Integer; cnv : TCanvas);        // malt die r�nder um die teilchen
var
  x,y : Integer;
begin
  x := (j-1)*sqrs;        //1 aus dem array * abstand = grenze f�r das quadrat
  y := (i-1)*sqrs;
  with cnv do
  begin
    Brush.Color := color;
    FillRect(Bounds(x+2,y+2,sqrs-4,sqrs-4));
    Pen.Color := clLtGray;
    MoveTo(x,y);
    LineTo(x+ sqrs,y);
    MoveTo(x,y);
    LineTo(x,y + sqrs);
    Pen.Color := clWebWhiteSmoke;    //TODO: richtige Farbe fuer den Rand
    MoveTo(x+1,y+1);
    LineTo(x+sqrs-2,y+1);
    MoveTo(x+1,y+1);
    LineTo(x+1,y+sqrs-2);
    Pen.Color := clblack;
    MoveTo(x+sqrs-1,y+sqrs-1);
    LineTo(x,y+sqrs-1);
    MoveTo(x+sqrs-1,y+sqrs-1);
    LineTo(x+sqrs-1,y);
    MoveTo(x+sqrs-2,y+sqrs-2);
    LineTo(x+1,y+sqrs-2);
    MoveTo(x+sqrs-2,y+sqrs-2);
    LineTo(x+sqrs-2,y+1);
  end;
end;

procedure showfigure(aSecond: Boolean = False);
var
  i,j : Integer;
begin
  for i := 1 to 4 do
    for j := 1 to 4 do
      if aSecond then
      begin
        if var_tetr[i,j] = 1 then drawsquare(i+var_y-1, j+var_x-1, var_fcl, Form1.imgSecond.Canvas);
      end
      else
        if tetr[i,j] = 1 then drawsquare(i+_y-1, j+_x-1, fcl, Form1.imgFirst.Canvas);
end;

procedure erasesquare(i,j : Integer; aSecond: Boolean = False);
var x,y : Integer;
begin
    x := (j-1)*sqrs;
    y := (i-1)*sqrs;

  if aSecond then
  begin
    Form1.imgSecond.Canvas.Brush.Color := clGray;
    Form1.imgSecond.Canvas.FillRect(Bounds(x,y,sqrs,sqrs));
  end
  else
  begin
    Form1.imgFirst.Canvas.Brush.Color := clGray;
    Form1.imgFirst.Canvas.FillRect(Bounds(x,y,sqrs,sqrs));
  end;
end;

procedure hidefigure(aSecond: Boolean = False);
var
  i,j: Integer;
begin
   for i:=1 to 4 do
      for j:=1 to 4 do
          if aSecond then
          begin
            if var_tetr[i,j]=1 then erasesquare(i+var_y - 1,j+var_x - 1, aSecond);
          end
          else
            if tetr[i,j]=1 then erasesquare(i+_y - 1,j+_x - 1);
end;

function canrotate(aSecond: Boolean = False): Boolean;
var i,j,k : Integer; t : TTetr;
begin
  result := true;

  if aSecond then
  begin
    k := var_num;
    if k < 4 then inc(k) else k := 1;
    t := arrFigure[var_gen,k];
    for i := 1 to 4 do
      for j := 1 to 4 do
        if (t[i,j]=1) and ((var_stakan[i+var_y-1,j+var_x-1]>0) or (j-1+var_x-1<0) or (j+var_x > stkw+1) or (i + var_y > stkh+1))
        then
        begin
          result := false;
          exit;
        end;
  end
  else
  begin
    k := num;
    if k < 4 then inc(k) else k := 1;
    t := arrFigure[gen,k];
    for i := 1 to 4 do
      for j := 1 to 4 do
        if (t[i,j]=1) and ((stakan[i+_y-1,j+_x-1]>0) or (j-1+_x-1<0) or (j+_x>stkw+1) or (i+_y>stkh+1))
        then
        begin
          result := false;
          exit;
        end;
  end
end;

procedure rotatefigure(aSecond: Boolean = False);
begin
  if aSecond then
  begin
    hidefigure(aSecond);
    if var_num < 4 then inc(var_num) else var_num := 1;
    var_tetr := arrFigure[var_gen,var_num];
    showfigure(aSecond);
  end
  else
  begin
    hidefigure(aSecond);
    if num < 4 then inc(num) else num := 1;
    tetr := arrFigure[gen,num];
    showfigure;
  end;
end;

procedure gennextfigure(aSecond: Boolean = False);
begin
  if aSecond then
  begin
    var_nextgen := random(11)+1;
    var_nextnum := random(4)+1;
    var_nexttetr := arrFigure[var_nextgen,var_nextnum];
    var_nextfcl := colors[random(12)+1];
  end
  else
  begin
    nextgen := random(11)+1;
    nextnum := random(4)+1;
    nexttetr := arrFigure[nextgen,nextnum];
    nextfcl := colors[random(12)+1];
  end;
end;

procedure nextfigure(aSecond: Boolean = False);
var i,j : Integer;

  procedure lol(aSecond: Boolean = False);
  var i,j : Integer;
  begin
    if aSecond then
    begin
      //new Second double logic
      var_x := 4;
      gennextfigure(aSecond);
      Form1.imgNextFigureSecond.Canvas.Brush.Color := clGray;
      Form1.imgNextFigureSecond.Canvas.FillRect(Bounds(0,0,sqrs*4,sqrs*4));

      for i := 1 to 4 do
        for j := 1 to 4 do
          if var_nexttetr[i,j]=1 then drawsquare(i,j,var_nextfcl,Form1.imgNextFigureSecond.Canvas);
    end  //malt die next figure im image_Next ;
    else
    begin
      _x := 4;
      gennextfigure;
      Form1.imgNextFigure.Canvas.Brush.Color := clGray;
      Form1.imgNextFigure.Canvas.FillRect(Bounds(0,0,sqrs*4,sqrs*4));
     for i := 1 to 4 do
        for j := 1 to 4 do
          if nexttetr[i,j]=1 then drawsquare(i,j,nextfcl,Form1.imgNextFigure.Canvas);
    end;
  end;

begin
  if aSecond then
  begin
    //new, double logic  TODO+
    var_gen := var_nextgen;
    var_num := var_nextnum;
    var_tetr := var_nexttetr;
    var_fcl := var_nextfcl;
    for i := 4 downto 1 do
      for j := 1 to 4 do
        if var_tetr[i,j]=1 then
        begin
          var_y := -3 +(4-i);
          lol(aSecond);
        end;
  end
  else
  begin
    gen := nextgen;
    num := nextnum;
    tetr := nexttetr;
    fcl := nextfcl;
    for i := 4 downto 1 do
      for j := 1 to 4 do
        if tetr[i,j]=1 then
        begin
          _y := -3 +(4-i);
          lol;
        end;
  end;
end;

procedure newgame(aSecond: Boolean);
var i,j : Integer;
begin
  for i := -3 to stkh do          //-3 to stkh    und arr -3
    for j := 1 to stkw do
      stakan[i,j] := 0;

  Form1.imgFirst.Canvas.Brush.Color := clGray;
  Form1.imgFirst.Canvas.FillRect(Bounds(0,0,sqrs*stkw,sqrs*stkh));  //sqrs * x = h
  scores := 0;
  Form1.lblPlayer1Score.Caption := 'Score: ' + IntToStr(scores);
  setspeed(1); //first
  randomize;
  gennextfigure;
  nextfigure;
  showfigure;
  Form1.lblPause.Caption := '';
  Form1.Timer1.Enabled := True;

  if aSecond then
  begin
    for i := -3 to stkh do          //-3 to stkh    und arr -3
      for j := 1 to stkw do
        var_stakan[i,j] := 0;
    //new
    Form1.imgSecond.Canvas.Brush.Color := clGray;
    Form1.imgSecond.Canvas.FillRect(Bounds(0,0,sqrs*stkw,sqrs*stkh));  //sqrs * x = h
    var_scores := 0;
    Form1.lblPlayer2Score.Caption := 'Score: ' + IntToStr(var_scores);
    setspeed(1, true); //second
    //second process
    randomize;
    gennextfigure(True);
    nextfigure(True);
    showfigure(True);
    Form1.Timer2.Enabled := True;
  end;
end;

function canmoveleft(aSecond: Boolean = False): Boolean;
var i,j : Integer;
begin
  result := true;

  for i := 1 to 4 do
    for j := 1 to 4 do
      if aSecond then
      begin
        if (var_tetr[i,j]=1) and ((var_stakan[i+var_y-1,j-1+var_x-1]>0) or (j-1+var_x-1=0)) then
        begin
          result := false;
          exit;
        end;
      end
      else
      if (tetr[i,j]=1) and ((stakan[i+_y-1,j-1+_x-1]>0) or (j-1+_x-1=0)) then
        begin
          result := false;
          exit;
        end;
end;

function canmoveright(aSecond: Boolean = False): Boolean;
var i,j : Integer;
begin
  result := true;
  for i := 1 to 4 do
    for j := 1 to 4 do
      if aSecond then
      begin
        if (var_tetr[i,j]=1) and ((var_stakan[i+var_y-1,j+var_x]>0) or (j+var_x=stkw+1)) then
        begin
          result := false;
          exit;
        end;
      end
      else
      if (tetr[i,j]=1) and ((stakan[i+_y-1,j+_x]>0) or (j+_x=stkw+1)) then
        begin
          result := false;
          exit;
        end;
end;

function canmovedown(aSecond: Boolean = False): Boolean;
var i,j : Integer;
begin
  result := true;

  for i := 4 downto 1 do
    for j := 1 to 4 do
       if aSecond then
       begin
         if (var_tetr[i,j]=1) and ((var_stakan[i+var_y,j+var_x-1]>0) or (i+var_y = stkh+1)) then
         begin
            result := false;
            exit;
         end
       end
       else
       begin
         if (tetr[i,j]=1) and ((stakan[i+_y,j+_x-1]>0) or (i+_y=stkh+1)) then
         begin
            result := false;
            exit;
         end;
       end;
end;

function gameoverPl1 : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 1 to stkw do
    if ( stakan[0,i]>0 ) then
    begin
      Result := True;
      Exit;
    end;
end;

function gameoverPl2 : Boolean;
var
  i : Integer;
begin
  Result := False;
  for i := 1 to stkw do
    if (var_stakan[0,i]>0) then
    begin
      Result := True;
      Exit;
    end;
end;


procedure checkstakan(aSecond: Boolean = True);
var i,j,k,l,c : Integer;
begin
  with Form1.imgFirst.Canvas do
  begin
    l := 0;
    for i := 1 to stkh do
    begin
      c := 0;
      for j := 1 to stkw do if stakan[i,j]>0 then inc(c);
      if c = stkw then
      begin
        Inc(l);
        for k := 1 to stkw do erasesquare(i,k);
        for k := 1 to i-1 do
        for j := 1 to stkw do
        begin
          stakan[i-k+1,j] := stakan[i-k,j];
          if stakan[i-k+1,j]>0 then
            drawsquare(i-k+1,j,stakan[i-k+1,j],Form1.imgFirst.Canvas);
          stakan[i-k,j] := 0;
          erasesquare(i-k,j);
        end;
      end;
    end;
    //Scores einstellen
    scores := scores + l * 10;
    if (scores >= 300)  and (scores < 1000)  then setspeed(2, True);
    if (scores >= 1000) and (scores < 3000)  then setspeed(3, True);
    if (scores >= 3000) and (scores < 10000) then setspeed(4, True);
    if (scores >= 10000) then setspeed(5, True);
    Form1.lblPlayer1Score.Caption := 'Score: '+IntToStr(scores);
  end;

  if aSecond then
  begin
    with Form1.imgSecond.Canvas do
    begin
      l := 0;
      for i := 1 to stkh do
      begin
        c := 0;
        for j := 1 to stkw do if var_stakan[i,j]>0 then inc(c);
        if c = stkw then
        begin
          Inc(l);
          for k := 1 to stkw do erasesquare(i,k, True);
          for k := 1 to i-1 do
          for j := 1 to stkw do
          begin
            var_stakan[i-k+1,j] := var_stakan[i-k,j];
            if var_stakan[i-k+1,j]>0 then
              drawsquare(i-k+1,j,var_stakan[i-k+1,j],Form1.imgSecond.Canvas);

            var_stakan[i-k,j] := 0;
            erasesquare(i-k,j,True);
          end;
        end;
      end;
  //Scores einstellen Spieler 2
      var_scores := var_scores + l * 10;
      if (var_scores >= 300)  and (var_scores < 1000)  then setspeed(2);
      if (var_scores >= 1000) and (var_scores < 3000)  then setspeed(3);
      if (var_scores >= 3000) and (var_scores < 10000) then setspeed(4);
      if (var_scores >= 10000) then setspeed(5);
      Form1.lblPlayer2Score.Caption := 'Score: '+IntToStr(var_scores);
    end;
  end;
end;

procedure fixfigure(aSecond: Boolean = False);  // figuren bleiben aufeinander liegen
var i,j : Integer;
begin
    for i := 1 to 4 do
      for j := 1 to 4 do
        if aSecond then
        begin
          if var_tetr[i,j] = 1 then var_stakan[var_y+i-1,var_x+j-1] := var_fcl;
        end
        else
          if tetr[i,j] = 1 then stakan[_y+i-1,_x+j-1] := fcl;
end;

procedure stopmove(aSecond: Boolean = False);
begin
  if aSecond then     //TODO+
  begin
    fixfigure(aSecond);
    checkstakan(aSecond);
  end
  else
  begin
    fixfigure;
    checkstakan;
  end;

  if  ( (not gameoverPl1) and (not gameoverPl2) ) then
  begin
    if aSecond then
    begin
      nextfigure(True);
      showfigure(True);
    end
    else
    begin
      nextfigure;
      showfigure;
    end;
  end
  else
  begin
    Form1.Timer2.Enabled := False;
    Form1.Timer1.Enabled := False;

    if gameoverPl1 then
    begin
      Form1.goEndScreen(True);
    end
    else
    if gameoverPl2 then
    begin
      Form1.goEndScreen(False);
    end;
  end;
end;

procedure moveleft(aSecond: Boolean = False);
begin
  hidefigure(aSecond);

  if aSecond then
    dec(var_x)
  else
  dec(_x);

  showfigure(aSecond);
end;

procedure moveright(aSecond: Boolean = False);
begin
  hidefigure(aSecond);
  if aSecond then
    inc(var_x)
  else
  inc(_x);
  showfigure(aSecond);
end;

procedure movedown(aSecond: Boolean = False);
begin
  hidefigure(aSecond);
  if aSecond then
    inc(var_y)
  else
  inc(_y);
  showfigure(aSecond);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( (not gameoverPl1) and (not gameoverPl2)) then
  case key of
    37: if Timer1.Enabled and canmoveleft then moveleft;
    38: if Timer1.Enabled and canrotate then rotatefigure;
    39: if Timer1.Enabled and canmoveright then moveright;
    40: if Timer1.Enabled and canmovedown then movedown else stopmove;
    {49..53: setspeed(Key - 48);}
    32: if Timer1.Enabled then
        begin
          while canmovedown do movedown;
          stopmove;
        end;
    19: begin
          if Timer1.Enabled then
          begin
            lblPause.Caption := 'Paused (P)';
            Timer1.Enabled := False;
          end
          else
          begin
            lblPause.Caption := '';
            Timer1.Enabled := True;
          end;
        end;
  end;

  //second Player Controls
  if ( (not gameoverPl1) and (not gameoverPl2)) then
  case Char(Key) of
    'A': if Timer1.Enabled and canmoveleft(True) then moveleft(True);
    'W': if Timer1.Enabled and canrotate(True) then rotatefigure(True);
    'D': if Timer1.Enabled and canmoveright(True) then moveright(True);
    'S': if Timer1.Enabled and canmovedown(True) then movedown(True) else stopmove(True);
    'P': begin
            if Timer1.Enabled then
            begin
              lblPause.Caption := 'Paused (P)';
              Timer1.Enabled := False;
              Timer2.Enabled := False;
            end
            else
            begin
              lblPause.Caption := '';
              Timer1.Enabled := True;
              Timer2.Enabled := True;
            end;
         end;
  end;

end;

procedure TForm1.FormResize(Sender: TObject);
begin
  // fix "small window" bug
  Repaint;
  Form1.Invalidate;
end;

procedure TForm1.goEndScreen(p1: boolean);
begin
  splashFrm := TsplashFrm.Create(Self);
  splashFrm.Show;

  if (p1) then
  begin
    splashFrm.lblStart.Caption := 'Player 1 lost :(';
  end
  else
    splashFrm.lblStart.Caption := 'Player 2 lost :(';

  splashFrm.Update;
  Sleep(1000);
  splashFrm.Hide;
end;

procedure TForm1.goSplashScreen;
begin
  splashFrm := TsplashFrm.Create(Self);
  splashFrm.Show;
  splashFrm.Update;
  sleep(1000);
  splashFrm.lblStart.Caption := '3';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '3.';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '3..';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '2';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '2.';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '2..';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '1';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '1.';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := '1..';
  splashFrm.Update;
  sleep(250);
  splashFrm.lblStart.Caption := 'GO!';
  splashFrm.Update;
  Sleep(250);
  splashFrm.Hide;
end;

procedure TForm1.mnuNewClick(Sender: TObject);
var te : Boolean;
begin
  te := Timer1.Enabled;
  if te then Timer1.Enabled := False;
  if Application.MessageBox(PChar('New Game?'),
     PChar('noob'), MB_ICONQUESTION+MB_YESNO) = IDYES
  then
    newgame(True)
  else
  Timer1.Enabled := te;
end;

procedure TForm1.pnlSightBlockAlignPosition(Sender: TWinControl;
  Control: TControl; var NewLeft, NewTop, NewWidth, NewHeight: Integer;
  var AlignRect: TRect; AlignInfo: TAlignInfo);
begin
  if Control = pnlParentContainer then
  begin
    NewLeft := AlignRect.Left + ((AlignRect.Width - Control.Width) div 2);
    NewTop := AlignRect.Top + ((AlignRect.Height - Control.Height) div 2);
  end;
end;

procedure TForm1.scrlbrSQRSChange(Sender: TObject);
begin
 //test
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if canmovedown then movedown else stopmove;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if canmovedown(True) then movedown(True) else stopmove(True);
end;

procedure TForm1.tmrButtonTimer(Sender: TObject);
begin
  tmrButton.Enabled := False;
  ToolButton2.Enabled := True;
  ToolButton3.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
var mh : String;
begin
  {HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics, MenuHeight}
  ReportMemoryLeaksOnShutdown := True;

  reg := TRegistry.Create;
  reg.RootKey := HKEY_CURRENT_USER;
  reg.OpenKey('\Control Panel\Desktop\WindowMetrics', True);
  mh := reg.ReadString('MenuHeight');
  reg.CloseKey;
  reg.Free;

  //Tetris Eins
  imgFirst.Top := 2;
  imgFirst.Left := 2;
  imgFirst.Width := stkw * sqrs;
  imgFirst.Height := stkh * sqrs;
  pnlFirst.Top := 25;
  pnlFirst.Left := 5;
  pnlFirst.Width := imgFirst.Width + 4;
  pnlFirst.Height := imgFirst.Height + 4;

  //next Figure Eins
  imgNextFigure.Top := 2;
  imgNextFigure.Left := 2;
  imgNextFigure.Width := sqrs * 4;
  imgNextFigure.Height := imgNextFigure.Width;
  pnlNextFigure.Top := 25;
  pnlNextFigure.Left := pnlFirst.Left + pnlFirst.Width + 10;
  pnlNextFigure.Width := imgNextFigure.Width + 4;
  pnlNextFigure.Height := pnlNextFigure.Width;

  Form1.Height := pnlFirst.Height + pnlFirst.Top - (StrToInt(mh) div 15) + 30;
  Form1.Width := pnlNextFigure.Left + pnlNextFigure.Width + 15;

  // new_game
  imgFirst.Parent.DoubleBuffered := True;
  imgSecond.Parent.DoubleBuffered := True;

  //cant see buggy entities at start
  pnlSightBlock.Visible := True;
  pnlSightBlock.Align := alClient;

  //test labels
  lblCustomize.Caption := 'Customize your field size';
  lblCustomize.Left := (lblCustomize.Width - lblCustomize.Width) div 2;
  lblCustomize.top := (lblCustomize.Height-lblCustomize.Height) div 2;
end;

procedure TForm1.initStartPanel(aSecond: Boolean = False);
begin
  lblPlayer1Score.Visible := True;
  lblPlayer1Level.Visible := True;
  lblPlayer1Name.Visible := True;

  if (aSecond) then
  begin
    lblPlayer2Score.Visible := True;
    lblPlayer2Level.Visible := True;
    lblPlayer2Name.Visible := True;
  end
  else
  begin
    lblPlayer2Score.Visible := False;
    lblPlayer2Level.Visible := False;
    lblPlayer2Name.Visible := False;
  end;
  pnlSightBlock.Visible := False;
end;

procedure TForm1.Action1Execute(Sender: TObject);
var
i: Integer;
splashFrm: TsplashFrm;
begin
  ToolButton2.Enabled := False;
  tmrButton.Enabled := True;
  // cant press button more times
  goSplashScreen; //test aus
  initStartPanel;
  //einspielermod
  Form1.Width :=  pnlNextFigure.Left + pnlNextFigure.Width + 15;
  //panels unsichtbar
  pnlNextFigureSecond.Visible := False;
  pnlSecond.Visible := False;
  newgame(False);
end;

procedure TForm1.Action2Execute(Sender: TObject);
begin
  ToolButton3.Enabled := False;
  tmrButton.Enabled := True;
  // cant press button more times
  goSplashScreen;   //test aus
  initStartPanel(True);
  //panels sichtbar
  pnlNextFigureSecond.Visible := True;
  pnlSecond.Visible := True;
  // fuer zwei Spieler
  Form1.Width := pnlNextFigure.Left + pnlNextFigure.Width + 15 + pnlFirst.Width + 14;
    //Tetris Zwei
  imgSecond.Top := 2;
  imgSecond.Left := 2;
  imgSecond.Width := stkw * sqrs;
  imgSecond.Height := stkh * sqrs;
  pnlSecond.Top := 25;
  pnlSecond.Left :=  pnlNextFigure.Left + 135;
  pnlSecond.Width := imgSecond.Width + 4;
  pnlSecond.Height := imgSecond.Height + 4;

  //nextFigure Zwei
  imgNextFigureSecond.Top := 2;
  imgNextFigureSecond.Left := 2;
  imgNextFigureSecond.Width := sqrs * 4;
  imgNextFigureSecond.Height := imgNextFigureSecond.Width;
  pnlNextFigureSecond.Top := 250; //gecheated lol
  pnlNextFigureSecond.Left := pnlFirst.Left + pnlFirst.Width + 10;
  pnlNextFigureSecond.Width := imgNextFigure.Width + 4;
  pnlNextFigureSecond.Height := pnlNextFigure.Width;

  pnlNextFigureSecond.Visible := True;
  pnlSecond.Visible := True;
  newgame(True); // True = 2 Spieler
end;

procedure TForm1.mnuExitClick(Sender: TObject);
begin
  Close;
end;
// TODO
//2 BUTTONS MIT CUSTOMIZE    // vll
end.
