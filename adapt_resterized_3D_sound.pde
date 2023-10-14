import processing.sound.*;
PImage img;

AudioIn input;
Amplitude analyzer;

void setup() {
  //fullScreen(P3D);
  size(1000, 1000, P3D);

  img = loadImage("adapt.png");
  img.resize(1000, 1000);
  imageMode(CENTER);

  input = new AudioIn(this, 0);
  input.start();
  analyzer = new Amplitude(this);
  analyzer.input(input);
  
}

void draw() {
  background(255);

  fill(0);
  noStroke();
  noCursor();

  float tiles = 80;
  float tileSize = width/tiles;
  float vol = analyzer.analyze();

  push();
  translate(width/2, height/2);

  if (mousePressed && mouseButton == RIGHT) {
    for (int a = 0; a < tiles; a++) {
      for (int b = 0; b < tiles; b++) {
        color c = img.get(int(a * tileSize), int(b * tileSize));
        float d = map(brightness(c), 0, 255, 1, 0); // last 2 parameters - invert
        float mic =  vol * 60;
        float z = map(d, 0, 1, mic * 100, mic * 20);
        push();
        translate(a * tileSize - width/2, b * tileSize - height/2, z);
        rect(0, 0, tileSize * d, tileSize * d);
        pop();
      }
    }
  } else if (mousePressed && mouseButton == LEFT) {
    for (int a = 0; a < tiles; a++) {
      for (int b = 0; b < tiles; b++) {
        color c = img.get(int(a * tileSize), int(b * tileSize));
        float d = map(brightness(c), 0, 255, 1, 0); // last 2 parameters - invert
        float mic =  vol * 60;
        float z = map(d, 0, 1, mic * 100, mic * 20);
        push();
        translate(a * tileSize - width/2, b * tileSize - height/2, z);
        rect(0, 0, tileSize * d, tileSize * d);
        pop();
      }
    }
  } else {
    for (int a = 0; a < tiles; a++) {
      for (int b = 0; b < tiles; b++) {
        color c = img.get(int(a * tileSize), int(b * tileSize));
        float d = map(brightness(c), 0, 255, 1, 0); // last 2 parameters - invert
        float mic =  vol * 100;
        float z = map(d, 0, 1, mic * 80, mic * 20);
        push();
        translate(a * tileSize - width/2, b * tileSize - height/2, z);
        ellipse(0, 0, tileSize * d, tileSize * d);
        pop();
      }
    }
  }
  pop();
}
