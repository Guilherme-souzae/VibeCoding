class Player
{
  private float x, y, theta;
  private float frontSpeed, backSpeed, turnSpeed;
  
  public Player(float x, float y, float frontSpeed, float backSpeed, float turnSpeed)
  {
    this.x = x;
    this.y = y;
    this.theta = HALF_PI;
    this.frontSpeed = frontSpeed;
    this.backSpeed = backSpeed;
    this.turnSpeed = turnSpeed;
  }
  
  public void show()
  {
    stroke(255,0,0);
    strokeWeight(10);
    point(x,y);
    strokeWeight(1);
    line(x,y,x+30*cos(theta),y+30*sin(theta));
  }
  
  public void moveFront()
  {
    float xbuffer = x + frontSpeed * cos(theta);
    float ybuffer = y + frontSpeed * sin(theta);
    
    int j = floor(xbuffer / w);
    int i = floor(ybuffer / w);
    
    if (grid.getstate(i,j) == false)
    {
      x = xbuffer;
      y = ybuffer;
    }
  }
  
  public void moveBack()
  {
    float xbuffer = x - backSpeed * cos(theta);
    float ybuffer = y - backSpeed * sin(theta);
    
    int j = floor(xbuffer / w);
    int i = floor(ybuffer / w);
    
    if (grid.getstate(i,j) == false)
    {
      x = xbuffer;
      y = ybuffer;
    }
  }
  
  public void turnRight()
  {
    theta += turnSpeed;
    theta -= (theta >= TWO_PI) ? TWO_PI : 0;
  }
  
  public void turnLeft()
  {
    theta -= turnSpeed;
    theta += (theta < 0) ? TWO_PI : 0;
  }
}
