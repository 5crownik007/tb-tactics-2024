// tb tactics 2024

void setup() {
  size(1200, 900);
  background(250);
}

void draw() {
  background(250);
  grid();
}

// draws grid
void grid() {
  //produces a square grid with side length len, cell length cel and offset off
  int len = 15;
  int cel = 30;
  int off = 25;
  stroke(175);
  strokeWeight(2);
  for(int i = 0; i < len; i++) {
    line(i*cel+off,off,i*cel+off,(len-1)*cel+off);
    line(off,i*cel+off,(len-1)*cel+off,i*cel+off);
  }
}
