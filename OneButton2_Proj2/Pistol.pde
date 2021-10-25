//CODE REFERENCED: https://github.com/eecs17xx/eecs1710-2021f/tree/main/Week07/Artillery01
class Pistol {
  PVector pistolPos;
 //i need two extra arguments for bullet coordinates
  float bulletX;
  float bulletY;
 
  float rot = 0;
  ArrayList<Bullet> bullets;  

  Pistol(float x, float y, float _bulletX, float _bulletY) {
  //NOTE: the program will not recognise these variables outside of the constructor
   pistolPos = new PVector(x,y);
   bulletX = _bulletX;
   bulletY = _bulletY;
   //^^i needed to add these here too so the pistol knows where to call the bullets
    
   bullets = new ArrayList<Bullet>();
  }
  
    
  void update() {   
    // remove all bullets that are no longer alive
    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet bullet = bullets.get(i);
      if (bullet.alive) {
        bullet.run();
      } else {
        bullets.remove(i);
      }
    }
  }
  
 void fire() {
    bullets.add(new Bullet(bulletX, bulletY, rot));
//you need to specify each datatype in this "new Bullet()" as it corresponds to the data in the Bullet() constructor
//if you leave out even one of them, this function will not recognize the class you're trying to call
  }

    
 void run() {
    update();
  }

}
