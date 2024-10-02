// tb tactics 2024
// by Nikola Pavkovic
// 2024-10-01 


// global variables
int gridSize = 10;
int gridCell = 40;
// core functions
void setup() {
  size(1200, 900);
  background(250);
}

void draw() {
  background(250);
  grid(width/2, height/2, gridSize, gridCell);
}

void mousePressed () {
  println(inArea(findCorners(width/2,height/2,gridSize,gridCell)));
}

// graphics
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
