color bgColor = color(0, 0, 0);
float circleSize = 10;

void setup() {
  size(800, 600, P2D);
  background(bgColor);
}

void draw() { 
   rectMode(CENTER);
   stroke(0, 0, 255);
   strokeWeight(8);
   noFill(); 
   rect(width/2, height/2, 400, 400);
    
  if (mousePressed) {
    ellipseMode(CENTER);
    fill(0, 0, 255);
    stroke(255, 0, 250);
    strokeWeight(2);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize, circleSize);

  }
}

void mousePressed() {
    int colorRange = 55;
    int colorOffset = 200;
    background(colorOffset + random(colorRange), colorOffset + random(colorRange), colorOffset + random(colorRange));
}
