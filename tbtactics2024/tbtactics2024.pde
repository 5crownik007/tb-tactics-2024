// tb tactics 2024
// by Nikola Pavkovic
// 2024-10-01 


// global variables
int gridSize = 10;
int gridCell = 40;
int time = 0;
boolean grid [][] = new boolean [gridSize][gridSize];

// core functions
void setup() {
  size(1200, 900);
  background(250);
}

void draw() {
  background(250);
  grid(width/2, height/2, gridSize, gridCell);
  for (int i = 0; i < gridSize; i++) {
    for (int k = 0; k < gridSize; k++) {
      if (grid[i][k]) {
        fillCell(i,k,width/2,height/2,gridSize,gridCell);
      }
    }
  }
  if (time % 5 == 0) {
    gravity();
  }
  time++;
}

void mousePressed () {
  if(inArea(findCorners(width/2,height/2,gridSize,gridCell))){
    markCell(width/2,height/2,gridSize,gridCell);
  }
}

// functions
void grid(int x, int y, int len, int cel) {
  // produces a square grid centered on x and y with side length len, cell length cel
  // centers the grid on the screen
  int xct = x-(len*cel)/2;
  int yct = y-(len*cel)/2;
  stroke(175);
  strokeWeight(2);
  for(int i = 0; i < len +1; i++) {
    line(i*cel+xct,yct,i*cel+xct,len*cel+yct);
    line(xct,i*cel+yct,len*cel+xct,i*cel+yct);
  }
}

int[] findCorners(int x, int y, int len, int cel) {
  // returns the top left and bottom right corners of a grid described with x, y center, length in cells and length of cells
  int [] corners = {x-(len*cel)/2, y-(len*cel)/2, x+(len*cel)/2, y+(len*cel)/2}; 
  return corners;
}

boolean inArea(int[] corners) {
  // checks if the mouse is in a rectangular area defined with corners x1, y1, x2, y2
  if (mouseX > corners[0] && mouseY > corners[1] && mouseX < corners[2] && mouseY < corners[3]) {
    return true;
  }
  return false;
}

int[] mouseCell(int gx, int gy, int len, int cel) {
  // returns the grid coordinates and center of the cell on a grid under the mouse x y coords. returns null otherwise
  int [] corners = findCorners(gx,gy,len,cel);
  if (inArea(corners)){
    int[] cell = new int[4];
    cell[0] = (mouseX-corners[0])/cel;
    cell[1] = (mouseY-corners[1])/cel;
    cell[2] = corners[0]+(cell[0]*cel)+cel/2;
    cell[3] = corners[1]+(cell[1]*cel)+cel/2;
    return cell;
  }
  return null;
}

int[] findCell(int cx, int cy, int gx, int gy, int len, int cel) {
  // returns the center of the cell at the given grid coordinates. returns null if out of range
  int [] corners = findCorners(gx,gy,len,cel);
  if (cx <= gridSize-1 || cy <= gridSize-1){
    int[] cell = new int[2];
    cell[0] = corners[0]+(cx*cel)+cel/2;
    cell[1] = corners[1]+(cy*cel)+cel/2;
    return cell;
  }
  return null;
}

void markCell(int gx, int gy, int len, int cel) {
  // marks the cell under the mouse
  int cell[] = mouseCell(gx,gy,len,cel);
  grid[cell[0]][cell[1]] = !grid[cell[0]][cell[1]];
}

void fillCell(int cx, int cy, int gx, int gy, int len, int cel) {
  // fills a cell at the given grid coordinates.
  int cell[] = findCell(cx,cy,gx,gy,len,cel);
  rectMode(CENTER);
  fill(0);
  square(cell[0],cell[1],cel);
}

void gravity() {
  for (int i = 0; i < gridSize; i++) {
    for (int k = gridSize-2; k >= 0; k--) {
      if (grid[i][k] && !grid[i][k+1]) {
        grid[i][k] = !grid[i][k];
        grid[i][k+1] = !grid[i][k+1];
      } else if (grid[i][k] && i > 0 && !grid[i-1][k+1]) {
        grid[i][k] = !grid[i][k];
        grid[i-1][k+1] = !grid[i-1][k+1];
      } else if (grid[i][k] && i < gridSize-1 && !grid[i+1][k+1]) {
        grid[i][k] = !grid[i][k];
        grid[i+1][k+1] = !grid[i+1][k+1];
      }
    }
  }
}
