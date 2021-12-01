String Action = "Action", Move= "Move", Quit = "Quit", No="No";
String Attack = "Attack", Use = "Use";
String Left = "Left", Right = "Right", Up = "Up", Down = "Down";
int Room;
PImage WallRight;
PImage WallLeft;
PImage WallBack;
PImage Floor;
PImage WallExit;
boolean BackHasWall, RightHasWall, LeftHasWall, BackHasExit;
boolean UpMovePossible, RightMovePossible, LeftMovePossible, DownMovePossible, ForwardMoveIsExit;
boolean Acting, Moving;
boolean Attacking, Using;
boolean MovingRight, MovingLeft, MovingUp, MovingDown;

/*

 Room 11 has walls on all sides except front, go Up.
 Room 12 has walls on left and front, go right.
 Room 22 has walls on right and down, go up.
 Room 23 has walls on left and right, go up.
 Room 24 has walls on right, go up or left.
 
 BRANCH1
 
 Button is in Room 25, Click Use.
 Room 25 has walls on all sides except down, go down.
 
 BRANCH2
 
 Room 14 has walls on front and down, go left.
 Room 04 has walls on left and down, go up.
 
 Enemy is in Room 05, Click Attack.
 
 Room 05 has walls on left and right, go up
 Room 06 has walls on left and right, go up
 Room 07 has walls on left and right, and the exit up, go up.
 
 Map:
 
 ⬛⬛⬛⬛⬛ ⬛EX⬛⬛⬛
 ⬛⬜⬛⬛⬛ ⬛07⬛⬛⬛
 ⬛⬜⬛⬛⬛ ⬛06⬛⬛⬛
 ⬛⬜⬛⬜⬛ ⬛05⬛25⬛
 ⬛⬜⬜⬜⬛ ⬛041424⬛
 ⬛⬛⬛⬜⬛ ⬛⬛⬛23⬛⬛
 ⬛⬛⬜⬜⬛ ⬛⬛1222⬛
 ⬛⬛⬜⬛⬛ ⬛⬛11⬛⬛
 ⬛⬛⬛⬛⬛ ⬛⬛⬛⬛⬛
 
 */

void setup()
{
  fullScreen();
  stroke(#000000);
  fill(#FFFFFF);
  rect(0, 0, displayWidth, displayHeight);
  stroke(#000000);
  fill(#000000);
  rect(0, 0, displayWidth, displayHeight*2/3);
  Room=11;
  WallRight = loadImage("WallRight.png");
  WallLeft = loadImage("WallLeft.png");
  WallBack = loadImage("WallBack.png");
  Floor = loadImage("Floor.png");
  WallExit = loadImage("WallExit.png");
}
void draw()
{
  strokeWeight(10);
  fill(#FFFFFF);
  stroke(#000000);
  rect(displayWidth*0.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.5/3);
  rect(displayWidth*1.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.5/3);
  rect(displayWidth*2.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.5/3);
  rect(displayWidth*0/3, displayHeight*2.9/3, displayWidth*0.1/3, displayHeight*0.1/3);
  fill(#000000);
  textSize(60);
  text(Action, displayWidth*0.3/3, displayHeight*2.60/3);
  text(Move, displayWidth*1.325/3, displayHeight*2.60/3);
  text(Quit, displayWidth*2.35/3, displayHeight*2.60/3);
  textSize(25);
  text(No, displayWidth*0.01/3, displayHeight*2.99/3);
  image(Floor, displayWidth*0.5/4, displayHeight*0, displayWidth*3/4, displayHeight*2/3);

  if (Room=11)
  {
  }
  if (BackHasWall==true)
  {
    image(WallBack, displayWidth*1/4, displayHeight*0, displayWidth*2/4, displayHeight*2/3);
  } else
  {
    if (BackHasExit==true)
    {
      UpMovePossible=true;
      ForwardMoveIsExit=true;
    } else
    {
      UpMovePossible=true;
    }
  }


  if (RightHasWall==true)
  {
    image(WallRight, displayWidth*1.5/4, displayHeight*0, displayWidth*2/4, displayHeight*2/3);
  } else {
    RightMovePossible=true;
  }
  if (LeftHasWall==true)
  {
    image(WallLeft, displayWidth*0.5/4, displayHeight*0, displayWidth*2/4, displayHeight*2/3);
  } else {
    LeftMovePossible=true;
  }


  if (Acting==false&&mousePressed&&mouseX>=displayWidth*0.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*0.75/3&&mouseY<=displayHeight*2.75/3)//Action Button//
  {
    stroke(#000000);
    fill(#FFFFFF);
    rect(displayWidth*0.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.25/3);
    rect(displayWidth*0.25/3, displayHeight*2.5/3, displayWidth*0.5/3, displayHeight*0.25/3);

    Acting=true;
    Moving=false;
  }
  if (Acting==true&&mousePressed&&mouseX>=displayWidth*0.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*0.75/3&&mouseY<=displayHeight*2.5/3)//Attack Button//
  {
    Acting=false;
    Attacking=true;
  }
  if (Acting==true&&mousePressed&&mouseX>=displayWidth*0.25/3&&mouseY>=displayHeight*2.5/3&&mouseX<=displayWidth*0.75/3&&mouseY<=displayHeight*2.75/3)//Use Button//
  {
    Acting=false;
    Using=true;
  }
  if (Moving==false&&mousePressed&&mouseX>=displayWidth*1.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*1.75/3&&mouseY<=displayHeight*2.75/3)//Move Button//
  {
    stroke(#000000);
    fill(#FFFFFF);
    rect(displayWidth*1.25/3, displayHeight*2.25/3, displayWidth*0.25/3, displayHeight*0.25/3);
    rect(displayWidth*1.5/3, displayHeight*2.25/3, displayWidth*0.25/3, displayHeight*0.25/3);
    rect(displayWidth*1.25/3, displayHeight*2.5/3, displayWidth*0.25/3, displayHeight*0.25/3);
    rect(displayWidth*1.5/3, displayHeight*2.5/3, displayWidth*0.25/3, displayHeight*0.25/3);
    stroke(#000000);
    fill(#000000);
    textSize(25);
    text(Up, displayWidth*1.3/3, displayHeight*2.4/3);
    text(Right, displayWidth*1.55/3, displayHeight*2.4/3);
    text(Left, displayWidth*1.3/3, displayHeight*2.7/3);
    text(Down, displayWidth*1.55/3, displayHeight*2.7/3);
    Moving=true;
    Acting=false;
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*1.5/3&&mouseY<=displayHeight*2.5/3)//MoveUp Button//
  {
    if (UpMovePossible==true)
    {
      Moving=false;
      Room=Room+10;
      redraw();
    }
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.5/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*1.75/3&&mouseY<=displayHeight*2.75/3)//MoveRight Button//
  {
    if (RightMovePossible==true)
    {
      Moving=false;
      Room=Room+01;
      redraw();
    }
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.25/3&&mouseY>=displayHeight*2.5/3&&mouseX<=displayWidth*1.5/3&&mouseY<=displayHeight*2.5/3)//MoveLeft Button//
  {
    if (LeftMovePossible==true)
    {
      Moving=false;
      Room=Room-01;
      redraw();
    }
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.5/3&&mouseY>=displayHeight*2.5/3&&mouseX<=displayWidth*1.75/3&&mouseY<=displayHeight*2.75/3)//MoveDown Button//
  {
    if (DownMovePossible==true)
    {
      Moving=false;
      Room=Room-10;
      redraw();
    }
  }
  noLoop();
}
void mousePressed()
{  
  if (Acting==false&&mousePressed&&mouseX>=displayWidth*0.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*0.75/3&&mouseY<=displayHeight*2.75/3)//Action Button//
  {
    redraw();
  }
  if (Moving==false&&mousePressed&&mouseX>=displayWidth*1.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*1.75/3&&mouseY<=displayHeight*2.75/3)//Move Button//
  {
    redraw();
  }
  if (mousePressed&&mouseX>=displayWidth*2.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*2.75/3&&mouseY<=displayHeight*2.75/3)//Quit Button//
  {
    exit();
  }
  if (mousePressed&&mouseX>=displayWidth*0/3&&mouseY>=displayHeight*2.9/3&&mouseX<=displayWidth*0.1/3&&mouseY<=displayHeight*3/3)//Reset Button//
  {
    Acting=false;
    Moving=false;
    redraw();
  }
}
void keyPressed()
{
}
