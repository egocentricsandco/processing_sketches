
void setup() {
  size(800, 500);
  background(#f0f0f0);
  fill(0);
  noStroke();
  textSize(80);
}


void draw() {
  noCursor();
    text(char(int(random(65, 91))), mouseX - 20, mouseY);
  filter(BLUR, 3); 
  filter(THRESHOLD);
  
  //saveFrame("output/####.png")
}
