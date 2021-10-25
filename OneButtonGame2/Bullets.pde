class Bullet{
float bulletX = 180;
float bulletY;
boolean shot;

 void draw(){
   //bulletX = 180; //x position of bullet
   bulletY = playerY + 51; //y position of bullet
   //draw bullet
   ellipse(bulletX, bulletY, 9, 9);
   stroke(50, 255, 255);
   strokeWeight(4);
   fill(255, 0, 255);

   
  if(bulletX > width){//reset bullet
     bulletX = 180;
        }
  }
  
void keyPressed(){
  //bulletY = playerY;
  if(keyPressed && key == ' '){
      shot = true;
  }
    
  if(shot== true){
    bulletX = bulletX + 10; //shoots bullet to the right of screen
    }
    
 if(bulletX > width){//reset bullet
     bulletX = 180;
     shot = false;
    }

} 

void run(){
  draw();
  keyPressed();      
  }
}

//CODE REFERENCED: https://www.youtube.com/watch?v=-L69SFcx5ok
