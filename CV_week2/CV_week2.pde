PImage img;

void setup()
{
  //size(640,423);
  
  img=loadImage("parrot_1.jpg");
  
  println(img.width);
  println(img.height);
  
  size(640,423);
}

void draw()
{
  //line(0,0,100,100);
 // rect(100,100,200,200);
 //image(img,0,0);
 
 //for(int i=0;i<100000;i++)
 //{
 //  img.pixels[i]=color(255,0,0);  
 //}
 //img.pixels[0]=color(255,0,0);
 //image(img,0,0);
 int locA=width/2+height/2*width;
 img.pixels[locA]=color(255,0,0);
 
 
 loadPixels();
 img.loadPixels();
 
 for(int y=0;y<height;y++)
 {
   for(int x=0;x<width;x++)
   {
      int loc=x+y*width;
      //img.pixels[loc]=color(255,0,0);
   }
 }
 
 updatePixels();
 
 image(img,0,0);
}
