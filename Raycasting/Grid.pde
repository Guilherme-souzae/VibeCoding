class Grid
{
  private boolean[][] cells;
  
  public Grid()
  {
    this.cells = new boolean[rows][cols];
  }
  
  public void show()
  {
    for (int i = 0; i < rows; i++)
      for (int j = 0; j < cols; j++)
      {
        stroke(50);
        strokeWeight(1);
        color cellcolor = (cells[i][j]) ? color(255) : color(0);
        fill(cellcolor);
        square(j*w,i*w,w);
      }
  }
  
  public void setstate(int i, int j, boolean state)
  {
    cells[i][j] = state;
  }
  
  public boolean getstate(int i, int j)
  {
    return cells[i][j];
  }
}
