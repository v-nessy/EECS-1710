//CODE REFERENCED: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week05/Frogger01

class Obstacle{
PVector obsPos, obstarget;  
color col = color(random(127)+127, random(127)+127, random(127)+127);
float movementSpeed = 0.01;
float xMargin = 500;
float yMargin = 150;
boolean alive = true;
boolean isLeft;


  Obstacle(){
   float y = random(260, 360); 
   //obstacles will appear randomly within this y-value range

    obsPos = new PVector(width + xMargin, y);  
    obstarget = new PVector(-xMargin, y);  
  }
  
 void update() {
    obsPos.lerp(obstarget, movementSpeed);
    if (obsPos.dist(obstarget) < 5) alive = false;
  }
  
 void draw() {
    rectMode(CENTER);
    fill(col);
    noStroke();
    rect(obsPos.x, obsPos.y, 40, 40);
    
    
    if (debug) {
      fill(debugColor);
      strokeWeight(1);
      ellipse(obsPos.x, obsPos.y, 10, 10);
    }
  }
  
  void run() {
    update();
    draw();
  }  
}
