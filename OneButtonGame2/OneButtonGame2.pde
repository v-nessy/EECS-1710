//GOAL: make a game where you play as a ghost and shoot people to life instead of death
import gifAnimation.*;

Parallax parallax;
Bullet bullet;

Gif ghost; //call gif

int playerX;
int playerY;


void setup() {
  size(1050, 450, P2D);  
  noSmooth();
  
  parallax = new Parallax();
  bullet = new Bullet();
  
  ghost = new Gif(this, "ghost.gif");
  ghost.loop();
  ghost.play(); 
  
}

void draw() {
  parallax.draw();
  bullet.run();
  
  playerX = 120;
  playerY = mouseY - 50;//had to shift ghost up by 50 px
  playerY = constrain(playerY, 190, 260);//limits player's y-pos to the road
  image(ghost, playerX, playerY, 128, 128); 

}

//CODE REFERENCED: https://github.com/n1ckfg/Parallaxer/tree/main/processing/ParallaxExample
