//Code retrieved from: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week09

//a program where you get shushed when you talk too loud

float maxThreshold = 0.05;
float minThreshold = 0.01;

void setup() {
  size(800, 600, P2D);  
  setupMinim();
}

void draw() {
  updateMinim();
  
  float amp = getAmp();
  
  // using two thresholds instead of one makes for smoother transitions
  if (amp > maxThreshold) {
    background(255,0,0);
    textSize(100);
    fill(255);
    textAlign(CENTER);
    text("SHHHHHH!", width/2, height/2);
  } else if (amp < minThreshold) {
    background(0,0,0);
    fill(255);
    textAlign(CENTER);
    text("Don't make a sound.", width/2, height/2);
  }
}

void exit() {
  stopMinim();
}
