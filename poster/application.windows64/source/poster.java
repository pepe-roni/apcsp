import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.analysis.*; 
import ddf.minim.effects.*; 
import ddf.minim.signals.*; 
import ddf.minim.spi.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class poster extends PApplet {








Minim minim;
AudioPlayer player;
AudioPlayer blackhole;
AudioInput input;

Particle[] particles;
int modeHandler = 0; 
float flytimer = 0.01f;
float speedVar = 0.00f;
int timer = 0;

public void setup()
{
  minim = new Minim(this);
  player = minim.loadFile("CuilTheory.mp3");
  blackhole = minim.loadFile("C90s.mp3");
  
  particles = new Particle[70];
  for (int i=0; i<particles.length; i++)
  {
    particles[i]=new NormalParticle();
  }
  noStroke();
  
}

float ts=100;

public void draw()
{
  
  fill(0, 30);
  rect(0, 0, 700, 700);
  textSize(15);
  fill(255,255,255,ts);
  textAlign(CENTER, CENTER);
  text("Cuil Theory", 200, 200);
  fill(255,255,255,60);
  text(timer,200,50);
  if(timer == 14800)
  {
    blackhole.play();  
  }
  
  if (timer == 36000)
  {
    modeHandler = 0;
  }
  
  if (modeHandler == 1)
  {
    for (int i=0; i<particles.length; i++)
    {
      particles[i].move();
      particles[i].show();
    }
    ts--;
    player.play();
    timer++;
  }
}


public void mousePressed()
{
 modeHandler = 1;
}

class NormalParticle implements Particle
{
  double x, y, angle, speed, size;
  int c;
  NormalParticle()
  {
    size=0;
    x=200;
    y=200;
    angle=(Math.random()*360);
    speed=(Math.random()*3)-1;
    c=(int)(Math.random()*255)+1;
  }
  public void show()
  {
    ellipse((float)x, (float)y, (float)size, (float)size);
    fill(255, c, 0);
    size=size+flytimer;
    if (x>360 || x<40 || y>360 || y<40)
    {
      x=200;
      y=200;
      angle=(Math.random()*360);
      speed=((Math.random()*3)-1)+speedVar;
      size=0;
    }
  }
  public void move()
  {
    x = x+(double)((Math.cos((float)angle)))+speed;
    y = y+(double)((Math.sin((float)angle)))-speed;
    //size+=0.03;
  }
}
interface Particle
{
  public void show();
  public void move();
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "poster" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
