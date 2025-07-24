final int w = 10;
int rows, cols;

Cell grid[][];
boolean buffer[][];

boolean updateflag = false;

void setup()
{
  size(600,500);
  frameRate(30);
  rows = floor(height / w);
  cols = floor(width / w);
  
  grid = new Cell[rows][cols];
  buffer = new boolean[rows][cols];
  
  for (int i = 0; i < rows; i++)
    for (int j = 0; j < cols; j++)
      grid[i][j] = new Cell(i,j);
}

void draw()
{
  if (updateflag)
  {
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        grid[i][j].update();
      
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        grid[i][j].setstate(buffer[i][j]);
  }
  
  for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
        grid[i][j].show(); 
}

void mousePressed()
{
  if (mouseButton == CENTER)
    updateflag = !updateflag;
  
  try
  {
    if (mouseButton == LEFT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid[i][j].setstate(true);
    }
    else if (mouseButton == RIGHT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid[i][j].setstate(false);
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
      grid[i][j].setstate(true);
    }
    else if (mouseButton == RIGHT)
    {
      int i = floor(mouseY / w);
      int j = floor(mouseX / w);
      grid[i][j].setstate(false);
    }
  } catch (Exception e) { }
}
