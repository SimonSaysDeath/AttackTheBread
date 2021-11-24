String attack="Attack", use="Use", quit="Quit";
void setup()
{
  fullScreen();
  stroke(#000000);
  fill(#FFFFFF);
  rect(0, 0, displayWidth, displayHeight);
  stroke(#000000);
  fill(#000000);
  rect(0, 0, displayWidth, displayHeight*2/3);
}
void draw()
{
  strokeWeight(10);
  fill(#FFFFFF);
  stroke(#000000);
  rect(displayWidth*0.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.5/3);
  rect(displayWidth*1.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.5/3);
  rect(displayWidth*2.25/3, displayHeight*2.25/3, displayWidth*0.5/3, displayHeight*0.5/3);
  fill(#000000);
  textSize(60);
  text(attack, displayWidth*0.3/3, displayHeight*2.60/3);
  text(use, displayWidth*1.375/3, displayHeight*2.60/3);
  text(quit, displayWidth*2.35/3, displayHeight*2.60/3);
}
void mousePressed()
{  
  if (mousePressed&&mouseX>=displayWidth*2.25/3&&mouseY>=displayHeight*2.25/3&&mouseX<=displayWidth*2.75/3&&mouseY<=displayHeight*2.75/3) {
    exit();
  }
}
void keyPressed()
{
}
