PImage img;

void setup()
{
  
  img=loadImage("dish_1.jpg");  
  
  size(640,423);
}

void draw()
{
  //int x=100;
  //int y=100;
  //int loc=x+y*width;
  //img.pixels[loc]=color(255,255,0);
  
  //float r=red(img.pixels[loc]);
 // float g=green(img.pixels[loc]);
 // float b=blue(img.pixels[loc]);
  //print(r+" : "+g+" : "+b);
  
  //img.pixels[loc]=color(r,g,b);
  
  //image(img,0,0);
  
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
       
       //r=r*2;
      //g=g*2;
      // b=b*2;     
      
     
     if(r>100&&g<60&&b<60)
   {
     pixels[loc]=color(0,255,0);
   }
   else
 {
   pixels[loc]=color(r,g,b);
 }      
       
       
   }
 }
 
 updatePixels();
 
}
