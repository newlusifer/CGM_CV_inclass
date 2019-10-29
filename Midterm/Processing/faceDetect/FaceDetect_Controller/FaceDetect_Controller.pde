import hypermedia.net.*;
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;


UDP udp;

void setup(){
  size(640,480);
  video = new Capture(this,width/2,height/2);
  opencv = new OpenCV(this,width/2,height/2);
  
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  video.start();
  
 udp = new UDP(this,6000); //open port 
 udp.listen(true);
}

void draw(){

   scale(2);
  opencv.loadImage(video);
  image(video,0,0);
  
  Rectangle[] faces = opencv.detect();
  println(faces.length);
 
  noFill();
  stroke(0,255,0);
  for(int i=0;i<faces.length;i++){
  
      rect(faces[i].x,faces[i].y,
        faces[i].width,faces[i].height);
      }  
      
      if(faces.length==0)
    {
       String message = "hello";
   String ip = "127.0.0.1";
   int port = 6100; //port to another
   float x = 1;
   float y = 2;  
   
   message = x+" "+y+" ";
   udp.send(message,ip,port);//export to another
   println("send "+ message);
    }
    
     if(faces.length==1)
    {
       String message = "hello";
   String ip = "127.0.0.1";
   int port = 6100; //port to another
   float x = 5;
   float y = 6;   
   
   message = x+" "+y+" ";
   udp.send(message,ip,port);//export to another
   println("send "+ message);
    }
}

void captureEvent(Capture c){
  c.read();
}

void keyPressed(){
   //String message = str(key);
   String message = "hello";
   String ip = "127.0.0.1";
   int port = 6100; //port to another
   
   float x = 10;
   float y = 10;
   float w = 5;
   float h = 5;
   
   message = x+" "+y+" "+w+" "+h;
   udp.send(message,ip,port);//export to another
   println("send "+ message);
 }
 
