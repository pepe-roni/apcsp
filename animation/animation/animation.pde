import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioInput input;
Windows xp;

void setup()
{
  xp = new Windows();
  minim = new Minim(this);
  player = minim.loadFile("tf.mp3");
  size(800,600);
  noStroke();
  frameRate(10);
  rectMode(CENTER);
  textMode(CENTER);
}

void draw()
{
 fill(0,60,205,90);
 rect(0,0,10000,10000);
 xp.show();
 if(xp.getCrash())
 { 
   xp.setAlpha((Math.random()*75)-35);   
 }
 else
  xp.setAlpha(0);
}

void mousePressed()
{
  xp.crashExe();
  player.play();
}

class Windows
{
  protected double alpha;
  protected boolean crash;
  protected float rVar;
  private int loading;
  
  Windows()
  {
    loading = width/2-110;
    rVar = 0;
    alpha = 0;
    crash = false;
  }
  public void show()
  {
   rotate(rVar);
   fill(#E56033);
   rect(width/2-50-(float)alpha, height/2-50,75+(float)alpha*1.5,75+(float)alpha*1.5);
   fill(#81F568);
   rect(width/2+25+(float)alpha, height/2-50,75+(float)alpha*1.2,75+(float)alpha*1.2);
   fill(#62A4FF);
   rect(width/2-50+(float)alpha, height/2+25,75,75);
   fill(#FCE466);
   rect(width/2+25, height/2+25-(float)alpha,75,75);
   textSize(abs(20+(float)alpha));
   text("Windows xp", width/2+(float)alpha, height/2+150+(float)alpha);
   stroke(255);
   noFill();
   rect(width/2,height/2+250,267,25);
   fill(0,0,255);
   rect(loading, height/2+250,40,25);
   if(crash && loading < 500)
   {
     loading=loading+100;
   }
   else if(loading > 500)
   {
     loading = width/2-110;
   }
   else
     loading=loading+15;
  }
  
  public void crashExe()
  {
    rVar = (float)(Math.random()*1)-1;
    player.play();
    crash = true;
  }
  
  public void setAlpha(double data)
  {
    alpha = data;
  }
  
  public boolean getCrash()
  {
   return crash; 
  }
  
}