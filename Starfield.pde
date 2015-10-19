Particle hyperspace [];
void setup()
{
  size(600,600);
  background(0);
  hyperspace = new Particle[201];
  for(int i=8; i<hyperspace.length; i++)
  {
    hyperspace[i] = new NormalParticle();
  }
  for(int i=0; i<7; i++)
  {
    hyperspace[i] = new OddballParticle();
  }
  hyperspace[7] = new JumboParticle();
}
void draw()
{  
  if(mousePressed == true)
  {
    noStroke();
    fill(0,0,0,20);
    rect(0,0,600,600);
  }
  else
  {
    background(0);
  }
  for(int i=0; i<hyperspace.length; i++)
  {
    hyperspace[i].move();
    hyperspace[i].show();
  }
}
class NormalParticle implements Particle
{
  double X, Y, Speed, Angle;
  int Color; 
  NormalParticle()
  {
    X = 300.00;
    Y = 300.00;
    Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    Speed = (Math.random()*5)+2;
    Angle = Math.random()*2*Math.PI;
  }
  public void move()
  {
    X = X + Math.cos(Angle)*Speed;
    Y = Y + Math.sin(Angle)*Speed;
    if(X < 0 || X > 600 && Y < 0 || Y > 600)
    {
      X = mouseX;
      Y = mouseY;
    }
  }
  public void show()
  {
    noStroke();
    fill(Color);
    ellipse((float)X,(float)Y,5,5);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  double X, Y, xSpeed, ySpeed;
  int Color;
  OddballParticle()
  {
    X = 300.00;
    Y = 300.00;
    Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    xSpeed = (Math.random()*3)+2;
    ySpeed = (Math.random()*3)+2;
  }
  public void move()
  {
    if(X < 0 || X > 585)
    {
      xSpeed = -xSpeed;
    }
    else if(Y < 0 || Y > 585)
    {
      ySpeed = -ySpeed;
    }
    X = X + xSpeed;
    Y = Y + ySpeed;
  }
  public void show()
  {
    noStroke();
    fill(Color);
    rect((float)X,(float)Y,20,20);
  }
}
class JumboParticle extends OddballParticle
{
  JumboParticle()
  {
    Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  public void move()
  {
    X = X + -xSpeed;
    Y = Y + -ySpeed;
    if(X < 25 || X > 575)
    {
      xSpeed = -xSpeed;
    }
    else if(Y < 25 || Y > 575)
    {
      ySpeed = -ySpeed;
    }
  }
  public void show()
  {
    noStroke();
    fill(Color);
    ellipse((float)X,(float)Y,50,50);
  }
}


