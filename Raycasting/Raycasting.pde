final int w = 30;
int rows, cols;
Grid grid;
Player player;

void setup()
{
  size(600,500);
  frameRate(60);
  
  rows = floor(height / w);
  cols = floor(width / w);
  grid = new Grid();
}

void draw()
{
  background(0);
  grid.show();
  if (player != null) player.show();
}

void mousePressed()
{
  try
  {
    if (mouseButton == CENTER)
    {
      player = new Player(mouseX, mouseY, 10, 10, 0.1);
    }
    else if (mouseButton == LEFT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid.setstate(i,j,true);
    }
    else if (mouseButton == RIGHT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid.setstate(i,j,false);
    }
  } catch (Exception e) { }
}

void mouseDragged()
{
  try
  {
    if (mouseButton == LEFT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid.setstate(i,j,true);
    }
    else if (mouseButton == RIGHT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid.setstate(i,j,false);
    }
  } catch (Exception e) { }
}

void keyPressed()
{
  try
  {
    switch (key)
    {
      case 'w':
        player.moveFront();
        break;
      case 'd':
        player.turnRight();
        break;
      case 's':
        player.moveBack();
        break;
      case 'a':
        player.turnLeft();
        break;
    }
  } catch (Exception e) { }
}
