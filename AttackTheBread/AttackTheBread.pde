String Action = "Action", Move= "Move", Quit = "Quit", No="No";
String Attack = "Attack", Use = "Use";
String Left = "Left", Right = "Right", Forwards = "Forwards", Backwards = "Backwards";
PImage WallRight;
PImage WallLeft;
PImage WallBack;
PImage Floor;
PImage WallExit;
boolean BackHasWall, RightHasWall, LeftHasWall, BackHasExit;
boolean ForwardMovePossible, RightMovePossible, LeftMovePossible, ForwardMoveIsExit;
boolean Acting, Moving;
boolean Attacking, Using;
boolean MovingRight, MovingLeft, MovingUp, MovingDown;

void setup()
{
  fullScreen();
  stroke(#000000);
  fill(#FFFFFF);
  rect(0, 0, displayWidth, displayHeight);
  stroke(#000000);
  fill(#000000);
  rect(0, 0, displayWidth, displayHeight*2/3);
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
  if (BackHasWall==true)
  {
    image(WallBack, displayWidth*1/4, displayHeight*0, displayWidth*2/4, displayHeight*2/3);
  } else
  {
    if (BackHasExit==true)
    {
      ForwardMovePossible=true;
      ForwardMoveIsExit=true;
    } else
    {
      ForwardMovePossible=true;
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
    Moving=true;
    Acting=false;
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*1.5/3&&mouseY<=displayHeight*2.5/3)//MoveUp Button//
  {
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.5/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*1.75/3&&mouseY<=displayHeight*2.75/3)//MoveRight Button//
  {
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.25/3&&mouseY>=displayHeight*2.5/3&&mouseX<=displayWidth*1.5/3&&mouseY<=displayHeight*2.5/3)//MoveLeft Button//
  {
  }
  if (Moving==true&&mousePressed&&mouseX>=displayWidth*1.5/3&&mouseY>=displayHeight*2.5/3&&mouseX<=displayWidth*1.75/3&&mouseY<=displayHeight*2.75/3)//MoveDown Button//
  {
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
