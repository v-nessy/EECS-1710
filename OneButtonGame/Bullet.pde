//CODE REFERENCED: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
class Bullet{

PVector pistolPos;
//i need two extra arguments for bullet coordinates
float bulletX;
float bulletY;

boolean alive = true;
int lifetime = 1500;
int timestamp;
float velocity = 10;
float rot;

  Bullet(float _bulletX, float _bulletY, float _rot) { 
    //pistolPos = new PVector(x,y);
    bulletX = _bulletX;
    bulletY = _bulletY;
    rot = _rot;
    timestamp = millis();
  }

 void update() { //update bullet's positions
     bulletX += velocity; //bullet shoots at 10px/second
     
     bulletY = (playerY + 30)* cos(radians(rot));
     bulletY = constrain(bulletY, 240, 360);
  //^^subtle change but how do i make the bullet start from playerY's position...
  //but not follow the player's y-coordinate when they move up and down?
     
    // set bullets past their lifetime as not alive so they can be removed
    if (alive && millis() > timestamp + lifetime) alive = false;
  }
  

 void draw(){
   //bullet appearance
   stroke(205, 120, 255);
   strokeWeight(4);
   fill(0, 250, 255);
   ellipse(bulletX, bulletY, 9, 9);
}

  void run(){
    update();
    draw();
  }
}
