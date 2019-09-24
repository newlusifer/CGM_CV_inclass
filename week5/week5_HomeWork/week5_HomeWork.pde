import processing.video.*;

Capture cam;

int Lx1=0;
int Ly1=0;
color cL1=0;

int Lx2=0;
int Ly2=0;
color cL2=0;

int spL1=0;
int spL2=0;

void setup()
{
  size(640,480);
  
  cam = new Capture(this,width,height,30);
  
  cam.start();  
 
}

void draw()
{
  if(cam.available())
{
  cam.read();
}  
  image(cam,0,0);
  
     if(spL1==1)
  {
  fill(cL1);
  strokeWeight(2.0);
  stroke(0);
  rect(Lx1,Ly1,50,50);
  }
  
   if(spL2==1)
  {
  fill(cL2);
  strokeWeight(2.0);
  stroke(0); 
  rect(Lx2,Ly2,50,50);
  }
  
    if(spL1==1&&spL2==1)
  {
    float d=dist(Lx1,Ly1,Lx2,Ly2); 
    line(Lx1,Ly1,Lx2,Ly2);
    fill(0); 
    text(d,Lx1+50,Ly1);
    text(d,Lx2+50,Ly2);
  }

}//end draw

void mousePressed()
{
  
      if(Lx1==0&&Ly1==0)
    {
        Lx1=mouseX;
        Ly1=mouseY;
        cL1=cam.pixels[mouseX+mouseY*cam.width];
        spL1=1;
        
    }
    
     else if(Lx2==0&&Ly2==0)
    {
        Lx2=mouseX;
        Ly2=mouseY;
         cL2=cam.pixels[mouseX+mouseY*cam.width];
        spL2=1;
    }
    
    else if(Lx1!=0&&Ly1!=0&&Lx2!=0&&Ly2!=0)
    {
      Lx1=0;
      Ly1=0;

      Lx2=0;
      Ly2=0;

      spL1=0;
      spL2=0;
    }
}
