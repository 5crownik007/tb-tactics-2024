// tb tactics 2024
// by Nikola Pavkovic
// 2024-10-01 

// core functions

// global variables
int gridSize = 15;
int gridCell = 40;

void setup() {
  size(1200, 900);
  background(250);
}

void draw() {
  background(250);
  grid(gridSize, gridCell);
}

// graphics

void grid(int len, int cel) {
  // produces a centered square grid with side length len, cell length cel
  // centers the grid on the screen
  int xct = (width/2)-(len*cel)/2;
  int yct = (height/2)-(len*cel)/2;
  stroke(175);
  strokeWeight(2);
  for(int i = 0; i < len; i++) {
    line(i*cel+xct,yct,i*cel+xct,(len-1)*cel+yct);
    line(xct,i*cel+yct,(len-1)*cel+xct,i*cel+yct);
  }
}
