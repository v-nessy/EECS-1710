//OBJECTIVE: create a creature that terrorizes you 
//...but stops after a certain time the mouse stops moving, or if mouse is in a blind spot

PVector cat, target, jposition, mousePos;
boolean Seen = false; 
PImage jerryNow, jerrySleep, jerryRun, bkg1, bowl;

int markPause = 0; 
int startRest = 2000; //make it so that when mouse stops moving for 2 seconds THEN jerry stops


void setup() { 
  size(1200, 700, P2D);
  jposition = new PVector(width/2, height/2); //jerry starts center screen
  
  bkg1 = loadImage("bkg1.jpeg");
  bkg1.resize(width, height);

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
  background(70, 65, 130);
  
  target = new PVector(mouseX, mouseY); //must define again under new function or it won't work
  
  //"Seen" only means when mouse is within 750 px AND is actively moving vv
  Seen = (jposition.dist(target) < 750)&& (mouseX != pmouseX || mouseY != pmouseY); 
  // ^QUESTION: how could i specify this boolean further to incorporate blind spots (ie; coordinates that creature can't reach)

  if (Seen) { 
    markPause = millis();
    background(0);//changes background to black
    jerryNow = jerryRun; //jerry awakens
    jposition = jposition.lerp(target, 0.01); } //jerry attacks
 
    else{
      image(bkg1, width/2, height/2);//changes background to stars
      jerryNow = jerrySleep; } //jerry turns back to normal state
      
 
  image(bowl, 600, 500);  
  //text stuff
  text("uh oh! looks like jerry's run out of food.", 50, 50); 
  textAlign(CORNER);
  textSize(20);
  fill(255);
  
/* FOR REFERENCE: how to track if mouse has stopped moving
  if (mouseX == pmouseX && mouseY == pmouseY){ << means "when current mouse frame = previous mouse frame"
    jerryNow = jerrySleep; 
  } */
  
  image(jerryNow, jposition.x, jposition.y); //jerry appears over all other images
}
