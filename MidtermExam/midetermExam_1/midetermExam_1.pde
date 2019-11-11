import processing.video.*;
Capture webcam;

void setup()
{
  size(640,480);
  println(Capture.list());
  
  webcam=new Capture(this,640,480,30);
  webcam.start();
}

void captureEvent(Capture webcam)
{
  webcam.read();
}

void draw()
{
  image(webcam,0,0);
  
  loadPixels();
  
  webcam.loadPixels();
  
  for(int x=0;x<webcam.width;x++){
    for(int y=0;y<webcam.height;y++){
      
      int index=x+y*webcam.width;
      
       float r=red(webcam.pixels[index]);
       float g=green(webcam.pixels[index]);
       float b=blue(webcam.pixels[index]);   
   
    
     if(r>=10&&r<50&&g>=10&&g<50&&b>=10&&b<50)
   {
     r=0;
     g=0;
     b=255;
   }
   
   else  if(r>=50&&r<=100&&g>=50&&g<=100&&b>=50&&b<=100)
   {
     r=0;
     g=255;
     b=255;
   }
   
   else  if(r>100&&r<=150&&g>100&&g<=150&&b>100&&b<=150)
   {
     r=0;
     g=255;
     b=0;
   }
   
   else  if(r>150&&r<200&&g>150&&g<200&&b>150&&b<200)
   {
     r=255;
     g=255;
     b=0;
   }
   
   else  if(r>=200&&r<=255&&g>=200&&g<=255&&b>=150&&b<=255)
   {
     r=255;
     g=0;
     b=0;
   }     
  
    else
 {
   r*=0;
   g*=1;
   b*=1;
 }
      
       
       //r=50;
      // g=75;
      // b=100;
       
      // g*=3;
       
       color outColor=color(r,g,b);
       pixels[index]=outColor;
      
    }
}
  
  updatePixels();
}
