PImage img;

void setup()
{
  
  img=loadImage("dish_1.jpg");  
  
  size(640,423);
}

void draw()
{ 
  loadPixels();
  img.loadPixels();
  
  for(int y=0;y<height;y++)
 {
   for(int x=0;x<width;x++)
   {
      int loc=x+y*width;
     
       float r=red(img.pixels[loc]);
       float g=green(img.pixels[loc]);
       float b=blue(img.pixels[loc]);       
          
       float distance=dist(x,y,mouseX,mouseY);
       float radius=100;
       float adjustBrightness=(radius-distance)/radius;
       
       r*=adjustBrightness;
       g*=adjustBrightness;
       b*=adjustBrightness;
       
       //pixels[loc]=color(r,g,b);//normal color
       pixels[loc]=color(0,g,0);//chang color
       
      /* if(distance>100)
     {
       pixels[loc]=color(0,0,0);
     }
     
       else
     {
       pixels[loc]=color(r,g,b);
     }//end else
     */
   }
 }
 
 updatePixels();
 
}
