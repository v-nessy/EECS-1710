//CODE REFERENCED: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week05/Frogger01
//the actual player's gif is in the main tab. 
//this class is just meant to track the player's movements

class Player {
  PVector startPosition, ghostPos, target;
  boolean alive;

  int playerX = 120;
  int playerY;
  
  Player() {    
   ghostPos = new PVector(playerX, playerY);
   init();
  }
  
  void init() {
    alive = true;
    startPosition = new PVector(playerX, playerY);
    ghostPos = startPosition.copy();
  }
  
  
  void draw() {
    
    if (debug) {
      noFill();
      stroke(debugColor);
      strokeWeight(1);
      ellipse(player.ghostPos.x, player.ghostPos.y, crashRange, crashRange);
    }
  }
  
  void run() {
    draw();
  }
  
} 
