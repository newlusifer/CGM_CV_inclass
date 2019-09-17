import processing.video.*;
Capture webcam;

int scale=12;
int cols,rows;

void setup()
{
  size(640,480);
  println(Capture.list());
  
  cols=width/scale;
  rows=height/scale;
  
  webcam=new Capture(this,640,480,30);
  webcam.start();
}

void captureEvent(Capture webcam)
{
  webcam.read();
}

void draw()
{
  background(255);
  
  //image(webcam,0,0);
  
  loadPixels();
  
  webcam.loadPixels();
  
  for(int i=0;i<cols;i++){
    for(int j=0;j<rows;j++){
      
      int x=i*scale;
      int y=j*scale;
      
      color c = webcam.pixels[x+y*webcam.width];
      
       float r=red(c);
       float g=green(c);
       float b=blue(c);             
      
       float distance=dist(x,y,mouseX,mouseY);
       float radius=200;
       float adjustBrightness=(radius-distance)/radius;
       
       r*=adjustBrightness;
       g*=adjustBrightness;
       b*=adjustBrightness;
      
      fill(r,g,b);
      
      //ellipse(x,y,scale,scale);
      rect(x,y,scale,scale);
      
     
    }
}
  
 // updatePixels();
}
