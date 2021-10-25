//ALL REFERENCES ARE ON EACH APPROPRIATE TAB
import gifAnimation.*;

Parallax parallax;
Pistol pistol;
Player player;
ArrayList<Bullet> bullets;
ArrayList<Obstacle> obstacle;


//player's stuff
Gif ghost; //call gif
int playerX = 120;
int playerY;
PVector ghostPos; //gif's location on screen


//car's stuff
int timeLimit = 60;
int currentTime = 0;
int markTime = 0;
int carInterval = 1000;
float crashRange = 50;

//debug stuff
boolean debug = false;
color debugColor = color(255, 127, 0);



void setup() {
  size(1050, 450, P2D);  
  noSmooth();
  
  parallax = new Parallax();
  pistol = new Pistol(180, mouseY, 180, mouseY);//define pistol class' ghostPos here
  //parameters include: (pistol.x, pistol.y, bulletX, bulletY)
  player = new Player();
  
  ghost = new Gif(this, "ghost.gif");
  ghost.loop();
  ghost.play(); 
 
  obstacle = new ArrayList<Obstacle>();
  
}

void draw() {
  parallax.draw();
  pistol.run();

  ghostPos = new PVector(playerX, playerY);
 
//gif's appearance
  playerY = mouseY;//had to shift ghost up by 50 px
  playerY = constrain(playerY, 210, 310);//limits player's y-pos to the road
  image(ghost, playerX, playerY, 70, 70); 


//obstacle's timing
  int t = millis();
  currentTime = abs(timeLimit - int(t/1000));
  
  if (t > markTime + carInterval) {
    obstacle.add(new Obstacle());
    markTime = t;
  }

 //general obstacle logic
  for (Obstacle obstacle : obstacle) {
    obstacle.run();
    if (debug) {
      stroke(debugColor);
      line(obstacle.obsPos.x, obstacle.obsPos.y, ghostPos.x, ghostPos.y);
    }
   if (ghostPos.dist(obstacle.obsPos) < crashRange) player.alive = false;
  }
  
for (Obstacle obstacle : obstacle) {
  obstacle.run();
}
  
  //remove enemies no longer on screen
  for (int i=obstacle.size()-1; i>=0; i--) {
    if (!obstacle.get(i).alive) {
      obstacle.remove(i);
    }
  }

println(ghostPos.x + " " + ghostPos.y);

}

//Art by yours truly
