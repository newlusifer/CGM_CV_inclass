import processing.video.*;

Capture cam;

color targetColor;

color targetColor1;
color targetColor2;

int target1=0;
int target2=0;

void setup()
{
  size(640,480);
  
  cam = new Capture(this,width,height,30);
  
  cam.start(); 
  
  targetColor=0;
   
}

void draw()
{
  if(cam.available())
{
  cam.read();
}  
  image(cam,0,0);
  
  fill(targetColor1);
  strokeWeight(2.0);
  stroke(0);
  //stroke(204,102,0);
rect(25,10,40,40);

fill(targetColor2);
  strokeWeight(2.0);
  stroke(0);
  //stroke(204,102,0);
rect(75,10,40,40);
  
  float similarity=1000;
  float similarity2=1000;
  
  int closetX=0;
  int closetY=0;
  
  int closetX2=0;
  int closetY2=0;
  
  for(int x=0;x<cam.width;x++)
{
  for(int y=0;y<cam.height;y++)
{
  int index=x+y*cam.width;
  
  color currentColor=cam.pixels[index];  
  
   float r1=red(currentColor);
  float g1=green(currentColor);
  float b1=blue(currentColor);
  
  float r2=red(targetColor1);
  float g2=green(targetColor1);
  float b2=blue(targetColor1);
  
  float r2T=red(targetColor2);
  float g2T=green(targetColor2);
  float b2T=blue(targetColor2);
  
  //euclidean distance
  float d=dist(r1,g1,b1,r2,g2,b2); 
  float d2=dist(r1,g1,b1,r2T,g2T,b2T); 
      
  if(d<similarity)
{
  similarity=d;
  closetX=x;
  closetY=y;
}

if(d2<similarity2)
{
  similarity2=d2;
  closetX2=x;
  closetY2=y;
}
 
}//endForX
}//endForY

if(similarity<10)//threshold
{
  fill(targetColor1);
  strokeWeight(2.0);
  stroke(0);
  //stroke(204,102,0);
circle(closetX,closetY,25);  
}

if(similarity2<10)//threshold
{
  fill(targetColor2);
  strokeWeight(2.0);
  stroke(0);
  //stroke(204,102,0);
circle(closetX2,closetY2,25);  
}

line(closetX,closetY,closetX2,closetY2);

float dis=dist(closetX,closetY,closetX2,closetY2);

fill(255,0, 0);
textSize(20);
text("X1 : "+closetX+"  "+"Y1 : "+closetY+"\n"+"X2 : "+closetX2+"  "+"Y2 : "+closetY2+"\n"+"Distance : "+dis, 5, 100); 


}//end draw


void mousePressed()
{
  if(target1==0)
{
  targetColor1=cam.pixels[mouseX+mouseY*cam.width];
  target1=1;
}

else if(target2==0&&target1==1)
{
  targetColor2=cam.pixels[mouseX+mouseY*cam.width];
  target2=1;
}

else if(target2==1&&target1==1)
{
  targetColor1=cam.pixels[mouseX+mouseY*cam.width];
  target2=0;
  target1=1;
}

else if(target2==1&&target1==0)
{
  targetColor2=cam.pixels[mouseX+mouseY*cam.width];
  target1=1;
}
  //targetColor=cam.pixels[mouseX+mouseY*cam.width];
}
