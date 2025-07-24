class Cell
{
  private int i, j;
  private boolean state;
  
  public Cell(int i, int j)
  {
    this.i = i;
    this.j = j;
    this.state = false;
  }
  
  public void show()
  {
    stroke(50);
    if (state) fill(255,255,0);
    else fill(0);
    square(j*w, i*w, w);  
  }
  
  public void setstate(boolean state)
  {
    this.state = state;
  }
  
  public boolean getstate()
  {
    return this.state;
  }
  
  public void update()
  {
    int sum = 0;
    
    for (int ii = i - 1; ii <= i + 1; ii++)
      for (int jj = j - 1; jj <= j + 1; jj++)
        if (ii >= 0 && ii < rows && jj >= 0 && jj < cols && (ii != i || jj != j))
          if (grid[ii][jj].getstate()) sum++; 
    
    switch (sum)
    {
      case 0:
      case 1:
        buffer[i][j]= false;
        break;
      case 2:
        buffer[i][j] = this.state;
        break;
      case 3:
        buffer[i][j]= true;
        break;
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
        buffer[i][j] = false;
        break;
    }
  }
}
