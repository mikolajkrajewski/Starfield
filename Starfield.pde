NormalParticle hyperspace [];
void setup()
{
  size(600,600);
  //background(0);
  hyperspace = new NormalParticle[201];
  for(int i=0; i<hyperspace.length; i++)
  {
    hyperspace[i] = new NormalParticle();
  }
}
void draw()
{
  background(0);  
  
  for(int i=0; i<hyperspace.length; i++)
  {
    hyperspace[i].move();
    hyperspace[i].show();
    if(hyperspace[i].X < -100 || hyperspace[i].X > 700 && hyperspace[i].Y > 700 || hyperspace[i].Y < -100)
    {
      hyperspace[i].X = 300;
      hyperspace[i].Y = 300;
      hyperspace[i].move();
    }
  }
}
class NormalParticle
{
  double X, Y, Speed, Angle;
  int Color; 
  NormalParticle()
  {
    X = 300.00;
    Y = 300.00;
    Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    Speed = Math.random()*10;
    Angle = Math.random()*Math.PI*2;
  }
  void move()
  {
    X = X + Math.cos(Angle)*Speed;
    Y = Y + Math.sin(Angle)*Speed;
  }
  void show()
  {
    fill(Color);
    ellipse((float)X,(float)Y,7,7);
  }
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

