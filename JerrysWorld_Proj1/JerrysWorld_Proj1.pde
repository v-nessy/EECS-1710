PVector cat, target, jposition, mousePos;
boolean Seen = false; 
PImage jerryNow, jerrySleep, jerryRun, bkgStars, bowl;
import gifAnimation.*;
Gif bkgPortal;

int startofPause = 0; 
int endofPause = 1000; //when mouse stops moving for 1 sec. THEN jerry stops


void setup() { 
  size(1200, 700, P2D);
  jposition = new PVector(width/2, height/2); //jerry starts center screen
  
  bkgStars = loadImage("stars.jpeg");
  bkgStars.resize(width, height);
  
  bkgPortal = new Gif(this, "portal.gif");
  
  bowl = loadImage("bowl.png");
  bowl.resize(bowl.width/3, bowl.height/3);
  
  jerrySleep = loadImage("jerry_sleep.png");
  jerrySleep.resize(jerrySleep.width/2, jerrySleep.height/2);  
  jerryRun = loadImage("jerry_run.png");
  jerryRun.resize(jerryRun.width/2, jerryRun.height/2);
  
  jerryNow = jerrySleep;
  
  target = new PVector(mouseX, mouseY); //target is mouse
  
  imageMode(CENTER);//draws all images from the center of screen
}

void draw() {
  target = new PVector(mouseX, mouseY); 
  background(0);
  
  //makes jerry run at you when your mouse is actively moving
  if (jposition.dist(target) < 750 && (mouseX != pmouseX || mouseY != pmouseY)) {
    //background stuff
    tint(0, 255, 0);    
    image(bkgPortal, width/2, height/2); //portal gif background
    bkgPortal.play();
    
    jerryNow = jerryRun; //jerry awakens
    jposition = jposition.lerp(target, 0.01);//jerry attacks you
    startofPause = millis(); //keep the time when mouse was last paused
  }
    
 //makes jerry continue running at you when the mouse hasn't been still for more than 1 sec.
  if ((mouseX == pmouseX || mouseY == pmouseY)&&(millis() < startofPause + endofPause)){ //once mouse stays still...
    //background stuff again
    tint(0, 255, 0);    
    image(bkgPortal, width/2, height/2); //portal gif background
    bkgPortal.play();
    
    jposition = jposition.lerp(target, 0.01); //jerry still chases
    }

  else if (millis() > startofPause + endofPause){ //if mouse is still for > 2 seconds
     image(bkgStars, width/2, height/2);//changes background to original stars
     jerryNow = jerrySleep; //jerry turns back to normal state
     noTint();
   }

 
  image(bowl, 600, 500);  
  //text stuff
  text("uh oh! looks like jerry's run out of food.", 50, 50); 
  textAlign(CORNER);
  textSize(20);
  fill(255);
  
  image(jerryNow, jposition.x, jposition.y); //jerry appears over all other images
}
