//code referenced :https://github.com/eecs17xx/eecs1710-2021f/blob/main/Week03/Background01/Background01.pde
PImage pitty;
float x;
float y;
float speedX = 1; //sets the speed along x axis

void setup() {
  size(800, 600, P2D);
  
  pitty = loadImage("https://cdn.cnn.com/cnnnext/dam/assets/140619211341-pitbull-rapper-and-artist-1.jpg");
  x = width;
  y = height/2;
  pitty.resize(1800, height);
  imageMode(CENTER);
  tint(255, 126);  // Apply transparency to "pitty" w/out changing color
  
  
}

void draw() {
  background(100, 160, 225);

  text("m r .  w o r l d w i d e", width/2, height/6); 
  textAlign(CENTER);
  textSize(50);
  fill(0, 408, 612);

  x += speedX;
  if (x > width || x < 0) {
    speedX *= -1;
  }

  image(pitty, x, y, pitty.width * (height / pitty.height), height);
}

