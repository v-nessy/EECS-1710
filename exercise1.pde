color bgColor = color(0, 0, 0);
float circleSize = 10;

void setup() {
  size(800, 600, P2D); // P2D enables 2D GPU acceleration
  background(bgColor);
}

void draw() {  
  if (mousePressed) {
    ellipseMode(CENTER);
    fill(0, 0, 255);
    stroke(255, 0, 250);
    line(mouseX, mouseY, pmouseX, pmouseY);
    ellipse(mouseX, mouseY, circleSize, circleSize);
  }
}
