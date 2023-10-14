PImage img;

float tiles_x = 150;
float tiles_y = tiles_x;

String CHARS = " .-/#";

PFont font;

void setup(){
 size(900, 900); 
 img = loadImage("m.JPG");
 img.resize(width, height);
 font = createFont("bold.ttf", 1000);
}

void draw(){
  background(#f1f1f1);
  fill(0);
  textFont(font);
  textSize(20);
  textAlign(CENTER, CENTER);
  
  
  float tileW = width / tiles_x;
  float tileH = height / tiles_y;
  
  translate(tileW / 2, tileH / 2);
  noStroke();
  
  for(int x = 0; x < tiles_x; x++){
    for(int y = 0; y < tiles_y; y++){
      
      int px = int(x * tileW);
      int py = int(y * tileH);
      
      color c = img.get(px, py);
      float b = brightness(c);
      
      int selector = int(map(b, 0, 255, 0, CHARS.length() - 1));
      
      char ch = CHARS.charAt(selector);
      
      push();
      translate(x * tileW, y * tileH);
      text(ch, 0, 0);
      pop();
    }
  }
}
